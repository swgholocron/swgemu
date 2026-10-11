#!/usr/bin/env python3
"""Normalise the stats of the Gen 5 / Gen 6 crafted lightsaber schematics.

Rule (set by the server owner): a Gen 5 saber has the same stats as the Gen 4 saber of its class, with
min and max damage +25%. A Gen 6 saber is the Gen 5 saber with min and max damage +25% again. Speed,
wound chance, force cost and the health/action/mind attack costs stay the same as Gen 4.

Crafted sabers take their stats from the experimental ranges stored in the draft schematic .iff (client
data), so that is what this rewrites. Each target gets a complete copy of its class's Gen 4 attribute
block (including the experimentation groups), with the damage ranges scaled. Extra attributes a target
already had (hitPoints, maxRange, damageType) are kept; the non-standard 'attackCost' is dropped.

Writes the modified files into TRE_src/holocron/ (first in the server's TRE list, so it wins over
holocron2.tre; deployed to the client through holocron.tre).

Usage: saber_schematics.py [--dry-run]
"""
import copy
import os
import re
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import tre_tool as T

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
STAGE = os.path.join(ROOT, "TRE_src", "holocron")
TRE_DIR = os.path.join(ROOT, "TRE")
GEN4_TRE = "mtg_patch_010_object_01.tre"

WL = "object/draft_schematic/weapon/lightsaber/shared_%s.iff"
GEN4 = {
    "1h": WL % "lightsaber_one_hand_gen4",
    "2h": WL % "lightsaber_two_hand_gen4",
    "pole": WL % "lightsaber_polearm_gen4",
}

# (archive path, class, generation)
TARGETS = [
    (WL % "lightsaber_one_hand_gen5", "1h", 5),
    (WL % "lightsaber_two_hand_gen5", "2h", 5),
    (WL % "lightsaber_polearm_gen5", "pole", 5),
    (WL % "lightsaber_onehanded_gen5_exar_kun", "1h", 5),
    (WL % "lightsaber_onehanded_gen5_jinzu", "1h", 5),
    (WL % "lightsaber_polearm_gen5_exar_kun", "pole", 5),
    (WL % "lightsaber_polearm_gen6", "pole", 6),
    ("object/draft_schematic/weapon/shared_lightsaber_mandalorian.iff", "1h", 6),
    # Bloodfin one-handed Gen 5 schematic: the file holocron2.tre ships under this name is a weapon template, not a
    # schematic (no attributes at all), so build a real one from the stock 1H Gen 5 schematic.
    (WL % "sword_lightsaber_one_handed_gen5", "1h", 5, WL % "lightsaber_one_hand_gen5",
     "object/weapon/melee/sword/crafted_saber/shared_sword_lightsaber_one_handed_pvp_bf.iff"),
]

ORDER = ["complexity", "xp", "minDamage", "maxDamage", "attackSpeed", "woundChance", "forceCost",
         "attackHealthCost", "attackActionCost", "attackMindCost"]
DROP = {"attackCost"}
SCALED = {"minDamage", "maxDamage"}


# ------------------------------------------------------------- IFF tree --

class Node:
    def __init__(self, tag, form=None, children=None, data=None):
        self.tag, self.form, self.children, self.data = tag, form, children, data


def parse(d, off=0, end=None):
    end = len(d) if end is None else end
    out = []
    while off < end:
        tag = d[off:off + 4]
        sz = struct.unpack(">I", d[off + 4:off + 8])[0]
        if tag == b"FORM":
            out.append(Node(b"FORM", d[off + 8:off + 12], parse(d, off + 12, off + 8 + sz)))
        else:
            out.append(Node(tag, data=d[off + 8:off + 8 + sz]))
        off += 8 + sz
    return out


def dump(nodes):
    out = b""
    for n in nodes:
        if n.tag == b"FORM":
            body = n.form + dump(n.children)
            out += b"FORM" + struct.pack(">I", len(body)) + body
        else:
            out += n.tag + struct.pack(">I", len(n.data)) + n.data
    return out


def attr_name(form):
    for c in form.children:
        if c.tag == b"XXXX" and c.data.startswith(b"name\x00"):
            m = re.search(rb"crafting\x00\x01(\w+)\x00", c.data)
            if m:
                return m.group(1).decode()
    return None


def find_attr_list(root):
    """Returns (container_form, start_idx, end_idx) of the attributes header + elements."""
    def walk(nodes):
        for n in nodes:
            if n.tag == b"FORM":
                hit = walk_form(n)
                if hit:
                    return hit
        return None

    def walk_form(form):
        for i, c in enumerate(form.children):
            if c.tag == b"XXXX" and c.data.startswith(b"attributes\x00"):
                j = i + 1
                while j < len(form.children):
                    c = form.children[j]
                    if (c.tag == b"FORM" and c.form == b"DSSA") or (c.tag == b"XXXX" and c.data == b"\x01ASSD"):
                        j += 1
                    else:
                        break
                return form, i, j
        for c in form.children:
            if c.tag == b"FORM":
                hit = walk_form(c)
                if hit:
                    return hit
        return None

    return walk(root)


def get_forms(root):
    form, i, j = find_attr_list(root)
    return {attr_name(c): c for c in form.children[i + 1:j] if c.tag == b"FORM"}


def set_value(form, lo, hi):
    for c in form.children:
        if c.tag == b"XXXX" and c.data.startswith(b"value\x00"):
            c.data = b"value\x00\x03 " + struct.pack("<ii", lo, hi)


def get_value(form):
    for c in form.children:
        if c.tag == b"XXXX" and c.data.startswith(b"value\x00"):
            return struct.unpack("<ii", c.data[-8:])


def clone(form):
    return copy.deepcopy(form)


def rebuild(root, forms):
    form, i, j = find_attr_list(root)
    new = []
    for k, f in enumerate(forms):
        if k:
            new.append(Node(b"XXXX", data=b"\x01ASSD"))
        new.append(f)
    hdr = form.children[i]
    hdr.data = b"attributes\x00\x00" + struct.pack("<I", len(forms)) + b"\x01ASSD"
    form.children[i + 1:j] = new


def set_crafted(nodes, path):
    for n in nodes:
        if n.tag == b"FORM":
            set_crafted(n.children, path)
        elif n.tag == b"XXXX" and n.data.startswith(b"craftedSharedTemplate\x00"):
            n.data = b"craftedSharedTemplate\x00\x01" + path.encode() + b"\x00"


def round_half_up(x):
    return int(x + 0.5)


# ------------------------------------------------------------------ main --

def read(tre, name):
    recs = {r.name: r for r in T.open_tre(os.path.join(TRE_DIR, tre))}
    tmp = "/tmp/_saber_iff.bin"
    T.extract(os.path.join(TRE_DIR, tre), recs[name], tmp)
    return open(tmp, "rb").read()


def source_for(name):
    for tre in ("holocron.tre", "holocron2.tre", GEN4_TRE):
        recs = {r.name for r in T.open_tre(os.path.join(TRE_DIR, tre))}
        if name in recs:
            return read(tre, name)
    raise KeyError(name)


def main():
    dry = "--dry-run" in sys.argv
    base = {}
    for cls, name in GEN4.items():
        base[cls] = get_forms(parse(read(GEN4_TRE, name)))

    # Compute scaled ranges per class/generation (each generation rounds before the next is derived).
    ranges = {}
    for cls, forms in base.items():
        lo4, hi4 = {}, {}
        for a in SCALED:
            lo4[a], hi4[a] = get_value(forms[a])
        g = {4: {a: (lo4[a], hi4[a]) for a in SCALED}}
        for gen in (5, 6):
            g[gen] = {a: (round_half_up(g[gen - 1][a][0] * 1.25), round_half_up(g[gen - 1][a][1] * 1.25)) for a in SCALED}
        ranges[cls] = g

    for target in TARGETS:
        name, cls, gen = target[:3]
        src = target[3] if len(target) > 3 else name
        crafted = target[4] if len(target) > 4 else None
        root = parse(source_for(src))
        old = get_forms(root)
        new = []
        for a in ORDER:
            if a in ("complexity", "xp") and a in old and not (a == "complexity" and "mandalorian" in name):
                new.append(old[a])
                continue
            f = clone(base[cls][a])
            if a in SCALED:
                set_value(f, *ranges[cls][gen][a])
            new.append(f)
        for a, f in old.items():
            if a not in ORDER and a not in DROP:
                new.append(f)
        rebuild(root, new)
        if crafted:
            set_crafted(root, crafted)
        out = dump(root)
        dest = os.path.join(STAGE, name)
        print("%-70s %s gen%d  min %s max %s" % (name, cls, gen, ranges[cls][gen]["minDamage"], ranges[cls][gen]["maxDamage"]))
        if not dry:
            os.makedirs(os.path.dirname(dest), exist_ok=True)
            open(dest, "wb").write(out)


if __name__ == "__main__":
    main()
