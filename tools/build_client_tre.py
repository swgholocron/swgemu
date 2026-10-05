#!/usr/bin/env python3
"""Build the CLIENT copy of holocron.tre from the TRE_src/holocron staging directory.

The server reads TRE/holocron.tre, which carries the full staging directory. The game client must
not get all of it: about 17,000 of the files also exist in the stock MTG archives and many of those
are older or stripped-down variants (meshes, shaders, templates, ...). Once the archive is indexed
correctly (see tre_tool.py) the client really does prefer our copies, so this script ships only what
is safe to override:

  * files that exist nowhere else (new templates, assets, effects, ...)
  * overlapping string tables / datatables / CRC tables where our copy is a strict superset of the
    stock one (nothing stock has is lost)
  * overlapping string tables where our copy is missing some stock keys: merged (union; our text wins)
  * explicit overrides listed in FORCE_INCLUDE

Overlapping tables where our copy is stale (missing stock rows) and every other overlapping binary
asset are left out, so the stock version is used (which is what the client has effectively been
using all along).

Usage: build_client_tre.py <client_tre_dir> <cfg> <staging_dir> <out.tre>
  client_tre_dir  folder holding the stock client .tre files (e.g. ~/Games/SWGemu/SWGEmu/TestServer)
  cfg             the client's swgemu_live.cfg (gives the archives the client actually loads + priorities)
"""
import os
import re
import sys
import tempfile

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import tre_tool as T
import struct

CUSTOM = {"holocron.tre", "holocron2.tre"}

# Overlapping files we deliberately override even though they are not tables.
FORCE_INCLUDE = {
    "clienteffect/pl_force_run_self.cef",  # 3s effect, replayed by the server while Force Run is active
}


# ------------------------------------------------------------------ STF ----

def stf_parse(d):
    assert struct.unpack("<I", d[:4])[0] == 0xABCD
    ver = d[4]
    nxt = struct.unpack("<I", d[5:9])[0]
    cnt = struct.unpack("<I", d[9:13])[0]
    pos = 13
    ents, ent_order = {}, []
    for _ in range(cnt):
        idx, cr, ln = struct.unpack("<III", d[pos:pos + 12])
        pos += 12
        ents[idx] = [cr, d[pos:pos + ln * 2].decode("utf-16-le")]
        ent_order.append(idx)
        pos += ln * 2
    names, order = {}, []
    for _ in range(cnt):
        idx, ln = struct.unpack("<II", d[pos:pos + 8])
        pos += 8
        names[idx] = d[pos:pos + ln].decode("latin1")
        pos += ln
        order.append(idx)
    assert pos == len(d)
    return ver, nxt, ents, names, order, ent_order


def stf_build(ver, nxt, ents, names, order, ent_order):
    out = struct.pack("<I", 0xABCD) + bytes([ver]) + struct.pack("<II", nxt, len(order))
    for idx in ent_order:
        cr, t = ents[idx]
        out += struct.pack("<III", idx, cr, len(t)) + t.encode("utf-16-le")
    for idx in order:
        n = names[idx].encode("latin1")
        out += struct.pack("<II", idx, len(n)) + n
    return out


def stf_map(d):
    ver, nxt, ents, names, order, ent_order = stf_parse(d)
    return {names[i]: ents[i][1] for i in order}


def stf_merge(ours, stock):
    """Our table plus any key only the stock table has. Our text wins for shared keys."""
    ver, nxt, ents, names, order, ent_order = stf_parse(ours)
    _, _, s_ents, s_names, s_order, _ = stf_parse(stock)
    have = {names[i] for i in order}
    added = 0
    nxt = max(nxt, max(ents) + 1 if ents else 1)
    for i in s_order:
        if s_names[i] in have:
            continue
        ents[nxt] = list(s_ents[i])
        names[nxt] = s_names[i]
        order.append(nxt)
        ent_order.append(nxt)
        nxt += 1
        added += 1
    return stf_build(ver, nxt, ents, names, order, ent_order), added


# ----------------------------------------------------------------- DTII ----

def dtii_rows(d):
    ch = {}

    def chunks(off, end):
        while off < end:
            tag = d[off:off + 4].decode("latin1")
            sz = struct.unpack(">I", d[off + 4:off + 8])[0]
            if tag == "FORM":
                chunks(off + 12, off + 8 + sz)
            else:
                ch[tag] = d[off + 8:off + 8 + sz]
            off += 8 + sz

    chunks(0, len(d))
    n = struct.unpack("<I", ch["COLS"][:4])[0]
    cols = [x.decode() for x in ch["COLS"][4:].split(b"\x00")[:n]]
    types = [x.decode() for x in ch["TYPE"].split(b"\x00")[:n]]
    rb = ch["ROWS"]
    rn = struct.unpack("<I", rb[:4])[0]
    p = 4
    rows = []
    for _ in range(rn):
        row = []
        for t in types:
            if t[0] in ("s", "c", "p", "z"):
                e = rb.index(b"\x00", p)
                row.append(rb[p:e].decode("latin1"))
                p = e + 1
            else:
                row.append(struct.unpack("<i" if t[0] != "f" else "<f", rb[p:p + 4])[0])
                p += 4
        rows.append(row)
    return cols, rows


# --------------------------------------------------------------- CRC table --

def crc_names(d):
    assert d[:4] == b"FORM" and d[8:12] == b"CSTB"
    pos, ch = 24, {}
    while pos < len(d):
        tag = d[pos:pos + 4].decode()
        sz = struct.unpack(">I", d[pos + 4:pos + 8])[0]
        ch[tag] = d[pos + 8:pos + 8 + sz]
        pos += 8 + sz
    n = struct.unpack("<I", ch["DATA"])[0]
    offs = struct.unpack("<%dI" % n, ch["STRT"])
    return {ch["STNG"][o:ch["STNG"].index(b"\x00", o)] for o in offs}


# ------------------------------------------------------------------ main ----

def classify(name, ours, stock):
    """Returns ('include'|'merge'|'exclude', reason)."""
    ext = name.rsplit(".", 1)[-1].lower()
    if ext == "stf":
        try:
            o, s = stf_map(ours), stf_map(stock)
        except Exception as e:  # unparsable: leave the stock copy alone
            return "exclude", "unparsable stf (%s)" % e
        missing = [k for k in s if k not in o]
        if not missing:
            return "include", "superset"
        return "merge", "%d stock keys missing" % len(missing)
    if name.startswith("misc/") and "crc_string_table" in name:
        missing = crc_names(stock) - crc_names(ours)
        return ("exclude", "%d stock entries missing" % len(missing)) if missing else ("include", "superset")
    if name.startswith("datatables/") and ext == "iff":
        try:
            oc, orow = dtii_rows(ours)
            sc, srow = dtii_rows(stock)
        except Exception as e:
            return "exclude", "unparsable datatable (%s)" % e
        okeys = {r[0] for r in orow}
        missing = [r[0] for r in srow if r[0] not in okeys]
        return ("exclude", "%d stock rows missing" % len(missing)) if missing else ("include", "superset")
    return "exclude", "overlaps stock, not a table"


def main():
    if len(sys.argv) != 5:
        print(__doc__)
        sys.exit(2)
    client_dir, cfg_path, staging, out_tre = sys.argv[1:]
    cfg = open(cfg_path).read()
    prio = {t: int(n) for n, t in re.findall(r"searchTree_00_(\d+)=(\S+\.tre)", cfg)}
    stock = [t for t in prio if t not in CUSTOM]
    recs = {t: {r.name: r for r in T.open_tre(os.path.join(client_dir, t))} for t in stock}

    tmp = tempfile.mkdtemp(prefix="clienttre_")
    out_dir = os.path.join(tmp, "stage")
    include, merged, excluded = [], [], []
    files = T.collect_from_dir(staging)

    for arch_path, local in files:
        cands = [t for t in stock if arch_path in recs[t]]
        if not cands:
            include.append((arch_path, local))
            continue
        if arch_path in FORCE_INCLUDE:
            include.append((arch_path, local))
            continue
        eff = max(cands, key=lambda t: prio[t])
        stock_tmp = os.path.join(tmp, "stock.bin")
        T.extract(os.path.join(client_dir, eff), recs[eff][arch_path], stock_tmp)
        ours = open(local, "rb").read()
        theirs = open(stock_tmp, "rb").read()
        if ours == theirs:
            excluded.append((arch_path, "identical to stock"))
            continue
        action, why = classify(arch_path, ours, theirs)
        if action == "include":
            include.append((arch_path, local))
        elif action == "merge":
            data, added = stf_merge(ours, theirs)
            mpath = os.path.join(tmp, "merged_%d.stf" % len(merged))
            open(mpath, "wb").write(data)
            include.append((arch_path, mpath))
            merged.append((arch_path, added))
        else:
            excluded.append((arch_path, why))

    n, size = T.build_tre(include, out_tre)
    print("wrote %s: %d records, %d bytes" % (out_tre, n, size))
    print("  shipped %d files (%d merged string tables), left out %d overlapping files" % (len(include), len(merged), len(excluded)))
    for name, added in merged:
        print("  merged  %-48s +%d stock keys" % (name, added))
    for name, why in excluded:
        if name.startswith(("string/", "datatables/", "misc/")) and why != "identical to stock":
            print("  skipped %-48s %s" % (name, why))


if __name__ == "__main__":
    main()
