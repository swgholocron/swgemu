#!/usr/bin/env python3
"""Build and inspect custom SWG '.tre' archives (format version '0005').

This is the general-purpose tool behind the server's custom TRE patches
(holocron1.tre and any future ones). Each custom patch has a staging
directory under TRE_src/<name>/ whose contents mirror the archive's
internal paths (e.g. TRE_src/holocron1/datatables/skill/skills.iff maps
to "datatables/skill/skills.iff" inside holocron1.tre). To add or change
content: edit files under that staging directory, then rebuild.

Format matches MMOCoreORB/src/tre3/{TreeFile.cpp,TreeFileRecord.h,
TreeDataBlock.h} -- the server's own archive reader -- and has been
round-trip verified against real client .tre files. Layout:

  [0:4)   magic   -- on-disk bytes spell "EERT" (multichar-literal endian quirk)
  [4:8)   version -- on-disk bytes spell "5000" for version '0005'
  [8:12)  totalRecords
  [12:16) dataOffset          -- absolute offset where the file block begins
  [16:20) fileBlock.compressionType
  [20:24) fileBlock.compressedSize
  [24:28) nameBlock.compressionType
  [28:32) nameBlock.compressedSize
  [32:36) nameBlock.uncompressedSize
  --- header ends at byte 36 ---
  [36:dataOffset)                          concatenated per-file payloads
  [dataOffset:+fileBlock.compressedSize)   file block (compressed array of 24-byte records)
  [...:+nameBlock.compressedSize)          name block (compressed, "\\0"-joined paths)
  [...:+16*totalRecords)                   MD5 sums, one per record, in record order

Usage:
  tre_tool.py build <src_dir> <out.tre>              -- pack a staging directory into an archive
  tre_tool.py list <archive.tre>                      -- list every file in an archive
  tre_tool.py extract <archive.tre> <name> <out_path> -- pull one file out of an archive
"""
import argparse
import hashlib
import os
import struct
import sys
import zlib

RECORD_SIZE = 24


# ---------------------------------------------------------------- writing --

def build_tre(file_list, out_path, compress_level=6):
    """file_list: list of (archive_path, local_disk_path) tuples.
    archive_path uses forward slashes, e.g. 'datatables/skill/skills.iff'.
    """
    # Sort by archive path -- matches how real archives are laid out and
    # keeps rebuilds deterministic (stable diffs between versions).
    file_list = sorted(file_list, key=lambda t: t[0])

    payloads = []  # compressed (or raw) bytes to place in the data section
    records = []   # dicts: checksum, uncompressedSize, fileOffset, compressionType, compressedSize, nameOffset
    names = []     # archive paths, in the same order as records
    md5s = []

    data_cursor = 36  # data section starts right after the header

    for archive_path, local_path in file_list:
        with open(local_path, "rb") as f:
            raw = f.read()

        compressed = zlib.compress(raw, compress_level)
        # Only bother compressing if it actually helps; otherwise store raw
        # (compressionType 0) to match how the real archives skip pointless
        # compression on already-compressed / tiny files.
        if len(compressed) < len(raw):
            comp_type = 2
            payload = compressed
        else:
            comp_type = 0
            payload = raw

        checksum = zlib.crc32(archive_path.encode("utf-8")) & 0xFFFFFFFF
        md5 = hashlib.md5(raw).digest()

        records.append({
            "checksum": checksum,
            "uncompressedSize": len(raw),
            "fileOffset": data_cursor,
            "compressionType": comp_type,
            "compressedSize": len(payload),
            "nameOffset": None,  # filled in below once the name block is built
        })
        payloads.append(payload)
        names.append(archive_path)
        md5s.append(md5)

        data_cursor += len(payload)

    # Build the name block: "\0"-joined paths, tracking each name's offset.
    name_block_raw = bytearray()
    for i, name in enumerate(names):
        records[i]["nameOffset"] = len(name_block_raw)
        name_block_raw += name.encode("utf-8") + b"\x00"
    name_block_raw = bytes(name_block_raw)

    # Build the file block: packed array of 24-byte records.
    file_block_raw = bytearray()
    for r in records:
        file_block_raw += struct.pack(
            "<IIIIII",
            r["checksum"],
            r["uncompressedSize"],
            r["fileOffset"],
            r["compressionType"],
            r["compressedSize"],
            r["nameOffset"],
        )
    file_block_raw = bytes(file_block_raw)

    file_block_compressed = zlib.compress(file_block_raw, compress_level)
    name_block_compressed = zlib.compress(name_block_raw, compress_level)

    if len(file_block_compressed) >= len(file_block_raw):
        file_block_compressed = file_block_raw
        file_block_comp_type = 0
    else:
        file_block_comp_type = 2

    if len(name_block_compressed) >= len(name_block_raw):
        name_block_compressed = name_block_raw
        name_block_comp_type = 0
    else:
        name_block_comp_type = 2

    total_records = len(records)
    data_offset = data_cursor  # where the file block starts, right after all payloads

    header = b"EERT"   # 'TREE' magic, on-disk byte order
    header += b"5000"  # '0005' version, on-disk byte order
    header += struct.pack("<I", total_records)
    header += struct.pack("<I", data_offset)
    header += struct.pack("<I", file_block_comp_type)
    header += struct.pack("<I", len(file_block_compressed))
    header += struct.pack("<I", name_block_comp_type)
    header += struct.pack("<I", len(name_block_compressed))
    header += struct.pack("<I", len(name_block_raw))

    assert len(header) == 36, len(header)

    with open(out_path, "wb") as out:
        out.write(header)
        for p in payloads:
            out.write(p)
        out.write(file_block_compressed)
        out.write(name_block_compressed)
        for m in md5s:
            out.write(m)

    return total_records, os.path.getsize(out_path)


def collect_from_dir(src_dir):
    """Walks src_dir and returns (archive_path, local_path) pairs, using the
    path relative to src_dir (forward slashes) as the archive path."""
    out = []
    for root, _, files in os.walk(src_dir):
        for fn in files:
            local_path = os.path.join(root, fn)
            rel = os.path.relpath(local_path, src_dir).replace(os.sep, "/")
            out.append((rel, local_path))
    return out


# ---------------------------------------------------------------- reading --

class TreRecord:
    __slots__ = ("checksum", "uncompressed_size", "file_offset",
                 "compression_type", "compressed_size", "name_offset", "name")


def _read_uint32(f):
    return struct.unpack("<I", f.read(4))[0]


def _uncompress_block(f, compression_type, compressed_size, uncompressed_size):
    if compression_type == 2:
        return zlib.decompress(f.read(compressed_size))
    return f.read(uncompressed_size)


def open_tre(path):
    with open(path, "rb") as f:
        magic = f.read(4)
        if magic != b"EERT":
            raise ValueError(f"{path}: not a TREE file (magic={magic!r})")

        version_raw = f.read(4)
        if version_raw != b"5000":
            raise ValueError(f"{path}: unsupported version {version_raw!r}")

        total_records = _read_uint32(f)
        data_offset = _read_uint32(f)
        file_comp_type = _read_uint32(f)
        file_comp_size = _read_uint32(f)
        file_uncomp_size = RECORD_SIZE * total_records
        name_comp_type = _read_uint32(f)
        name_comp_size = _read_uint32(f)
        name_uncomp_size = _read_uint32(f)

        f.seek(data_offset)
        file_block = _uncompress_block(f, file_comp_type, file_comp_size, file_uncomp_size)

        records = []
        for i in range(total_records):
            off = i * RECORD_SIZE
            checksum, uncompressed_size, file_offset, compression_type, compressed_size, name_offset = \
                struct.unpack_from("<IIIIII", file_block, off)
            r = TreRecord()
            r.checksum = checksum
            r.uncompressed_size = uncompressed_size
            r.file_offset = file_offset
            r.compression_type = compression_type
            r.compressed_size = compressed_size
            r.name_offset = name_offset
            records.append(r)

        name_block = _uncompress_block(f, name_comp_type, name_comp_size, name_uncomp_size)
        for r in records:
            end = name_block.index(b"\x00", r.name_offset)
            r.name = name_block[r.name_offset:end].decode("utf-8", "replace")

    return records


def extract(path, record, out_path):
    with open(path, "rb") as f:
        f.seek(record.file_offset)
        data = _uncompress_block(f, record.compression_type, record.compressed_size, record.uncompressed_size)
    os.makedirs(os.path.dirname(out_path) or ".", exist_ok=True)
    with open(out_path, "wb") as out:
        out.write(data)
    return len(data)


# --------------------------------------------------------------------- cli --

def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)

    p_build = sub.add_parser("build", help="pack a staging directory into a .tre archive")
    p_build.add_argument("src_dir")
    p_build.add_argument("out_tre")

    p_list = sub.add_parser("list", help="list every file in a .tre archive")
    p_list.add_argument("archive")
    p_list.add_argument("--grep", help="only show names containing this substring")

    p_extract = sub.add_parser("extract", help="pull one file out of a .tre archive")
    p_extract.add_argument("archive")
    p_extract.add_argument("name")
    p_extract.add_argument("out_path")

    args = ap.parse_args()

    if args.cmd == "build":
        files = collect_from_dir(args.src_dir)
        if not files:
            print(f"no files found under {args.src_dir}", file=sys.stderr)
            sys.exit(1)
        n, size = build_tre(files, args.out_tre)
        print(f"wrote {args.out_tre}: {n} records, {size} bytes")

    elif args.cmd == "list":
        records = open_tre(args.archive)
        for r in records:
            if not args.grep or args.grep.lower() in r.name.lower():
                print(r.name)

    elif args.cmd == "extract":
        records = open_tre(args.archive)
        for r in records:
            if r.name == args.name:
                n = extract(args.archive, r, args.out_path)
                print(f"extracted {n} bytes to {args.out_path}")
                return
        print("record not found", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
