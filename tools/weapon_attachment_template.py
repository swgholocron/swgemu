#!/usr/bin/env python3
"""Create the client template for Weapon Attachments (object/tangible/gem/shared_weapon.iff).

A copy of the armor attachment's client template (so the client still treats it as an attachment) with its
own model (the power bit) and its own name ("Weapon Attachment"), plus its entry in the client's object
template CRC table and the string file holding the name. Writes into TRE_src/holocron/.
"""
import glob
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import tre_tool as T
import saber_schematics as S
import build_client_tre as B

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
STAGE = os.path.join(ROOT, "TRE_src", "holocron")

TEMPLATE = "object/tangible/gem/shared_weapon.iff"
APPEARANCE = "appearance/eqp_comp_jewelry_setting.apt"  # the power bit's model
STF_FILE = "holo_item_n"
STF_KEY = "weapon_attachment"
NAME = "Weapon Attachment"
DESC_KEY = "weapon_attachment_d"
DESC = ("Skill-Enhancing Attachment\n\nTo attach: equip the weapon, then choose \"Attach to Equipped Weapon\" from this "
        "item's radial menu. The weapon needs a free socket.")


def find(name):
    for t in sorted(glob.glob(os.path.join(ROOT, "TRE", "*.tre"))):
        recs = {r.name: r for r in T.open_tre(t)}
        if name in recs:
            T.extract(t, recs[name], "/tmp/_wa.bin")
            return open("/tmp/_wa.bin", "rb").read()
    raise KeyError(name)


def walk(nodes, fn):
    for n in nodes:
        if n.tag == b"FORM":
            walk(n.children, fn)
        else:
            fn(n)


def make_template():
    root = S.parse(find("object/tangible/gem/shared_armor.iff"))

    def edit(n):
        if n.tag == b"XXXX" and n.data.startswith(b"objectName\x00"):
            n.data = b"objectName\x00\x01\x01" + STF_FILE.encode() + b"\x00\x01" + STF_KEY.encode() + b"\x00"
        elif n.tag == b"XXXX" and n.data.startswith(b"detailedDescription\x00"):
            n.data = b"detailedDescription\x00\x01\x01" + STF_FILE.encode() + b"\x00\x01" + DESC_KEY.encode() + b"\x00"
        elif n.tag == b"XXXX" and n.data.startswith(b"appearanceFilename\x00"):
            n.data = b"appearanceFilename\x00\x01" + APPEARANCE.encode() + b"\x00"

    walk(root, edit)
    out = os.path.join(STAGE, TEMPLATE)
    os.makedirs(os.path.dirname(out), exist_ok=True)
    open(out, "wb").write(S.dump(root))
    print("wrote", TEMPLATE)


def add_crc_entry():
    path = os.path.join(STAGE, "misc/object_template_crc_string_table.iff")
    d = open(path, "rb").read()
    pos, ch, order = 24, {}, []
    while pos < len(d):
        tag = d[pos:pos + 4]
        sz = struct.unpack(">I", d[pos + 4:pos + 8])[0]
        ch[tag] = d[pos + 8:pos + 8 + sz]
        order.append(tag)
        pos += 8 + sz
    n = struct.unpack("<I", ch[b"DATA"])[0]
    crcs = list(struct.unpack("<%dI" % n, ch[b"CRCT"]))
    offs = list(struct.unpack("<%dI" % n, ch[b"STRT"]))
    crc = T.swg_name_crc(TEMPLATE)
    if crc in crcs:
        print("crc entry already present")
        return
    new_off = len(ch[b"STNG"])
    i = next((k for k, c in enumerate(crcs) if c > crc), n)
    crcs.insert(i, crc)
    offs.insert(i, new_off)
    ch[b"DATA"] = struct.pack("<I", n + 1)
    ch[b"CRCT"] = struct.pack("<%dI" % (n + 1), *crcs)
    ch[b"STRT"] = struct.pack("<%dI" % (n + 1), *offs)
    ch[b"STNG"] = ch[b"STNG"] + TEMPLATE.encode() + b"\x00"
    body = b"".join(t + struct.pack(">I", len(ch[t])) + ch[t] for t in order)
    inner = b"0000" + body
    out = d[:12] + b"FORM" + struct.pack(">I", len(inner)) + inner
    out = b"FORM" + struct.pack(">I", len(out) - 8 + 0) + out[8:]
    open(path, "wb").write(out)
    print("added crc entry", hex(crc))


def make_stf():
    path = os.path.join(STAGE, "string/en/%s.stf" % STF_FILE)
    ents = {1: [0xFFFFFFFF, NAME], 2: [0xFFFFFFFF, DESC]}
    open(path, "wb").write(B.stf_build(1, 3, ents, {1: STF_KEY, 2: DESC_KEY}, [1, 2], [1, 2]))
    print("wrote", path)


if __name__ == "__main__":
    make_template()
    add_crc_entry()
    make_stf()
