#!/usr/bin/env python3
"""Force Sensitive (village) skill boxes cost 0 skill points. This is a standing rule set by the server owner.

The server already forces the cost to 0 in code (Skill.h, parseDataTableRow). The game client reads its own
datatables/skill/skills.iff, so that table must say 0 as well or the client shows the point cost and refuses
the box once the player has no points left.

  lock_fs_skill_points.py patch  <skills.iff>          set POINTS_REQUIRED to 0 for every force_sensitive* row (in place)
  lock_fs_skill_points.py verify <skills.iff|*.tre>    exit 1 if any force_sensitive* row costs points

build_client_tre.py and deploy_pending_tre.sh call verify and refuse to continue on a failure.
"""
import os
import struct
import sys
import tempfile

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import tre_tool as T

SKILLS = "datatables/skill/skills.iff"


def _walk(d):
    """Returns (columns, types, offset of ROWS data, row count)."""
    ch = {}

    def chunks(off, end):
        while off < end:
            tag = d[off:off + 4].decode("latin1")
            sz = struct.unpack(">I", d[off + 4:off + 8])[0]
            if tag == "FORM":
                chunks(off + 12, off + 8 + sz)
            else:
                ch[tag] = (off + 8, sz)
            off += 8 + sz

    chunks(0, len(d))
    co, cs = ch["COLS"]
    n = struct.unpack("<I", d[co:co + 4])[0]
    cols = [x.decode() for x in d[co + 4:co + cs].split(b"\x00")[:n]]
    to, ts = ch["TYPE"]
    types = [x.decode() for x in d[to:to + ts].split(b"\x00")[:n]]
    ro, _ = ch["ROWS"]
    return cols, types, ro + 4, struct.unpack("<I", d[ro:ro + 4])[0]


def force_sensitive_points(d, patch=False):
    """Yields (skill name, points) for every force_sensitive* row; with patch=True zeroes them in the bytearray d."""
    cols, types, p, rows = _walk(d)
    pi = cols.index("POINTS_REQUIRED")
    out = []
    for _ in range(rows):
        name = None
        for ci, t in enumerate(types):
            if t[0] in ("s", "c", "p", "z"):
                e = d.index(b"\x00", p)
                if ci == 0:
                    name = d[p:e].decode("latin1")
                p = e + 1
            else:
                if ci == pi and name.startswith("force_sensitive"):
                    val = struct.unpack("<i", d[p:p + 4])[0]
                    out.append((name, val))
                    if patch and val != 0:
                        d[p:p + 4] = struct.pack("<i", 0)
                p += 4
    return out


def load_skills(path):
    if path.endswith(".tre"):
        recs = {r.name: r for r in T.open_tre(path)}
        tmp = os.path.join(tempfile.mkdtemp(), "skills.iff")
        T.extract(path, recs[SKILLS], tmp)
        return bytearray(open(tmp, "rb").read())
    return bytearray(open(path, "rb").read())


def verify(path):
    bad = [(n, v) for n, v in force_sensitive_points(load_skills(path)) if v != 0]
    if bad:
        print("FAIL %s: %d force_sensitive skills cost points, e.g. %s" % (path, len(bad), bad[:3]))
        return False
    print("ok   %s: all force_sensitive skills cost 0 points" % path)
    return True


if __name__ == "__main__":
    if len(sys.argv) != 3 or sys.argv[1] not in ("patch", "verify"):
        print(__doc__)
        sys.exit(2)
    if sys.argv[1] == "patch":
        d = load_skills(sys.argv[2])
        before = force_sensitive_points(d, patch=True)
        open(sys.argv[2], "wb").write(d)
        print("patched %d rows, %d changed" % (len(before), sum(1 for _, v in before if v != 0)))
    else:
        sys.exit(0 if verify(sys.argv[2]) else 1)
