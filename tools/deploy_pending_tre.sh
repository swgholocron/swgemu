#!/bin/bash
# Deploys the archives waiting in TRE/pending/ (built by tools/tre_tool.py and tools/build_client_tre.py):
#   holocron_server.tre -> TRE/holocron.tre                       (what the server reads)
#   holocron_client.tre -> the game client folders + their manifest.json (what players download)
# Refuses to run while the server is open: replacing a .tre under a running process crashes it.
set -e
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
if pgrep -x core3 >/dev/null; then echo "Stop the server (core3) first."; exit 1; fi
# The local game install is only used for TRE management and is never run, so an open client does not block a deploy.
cd "$ROOT"
# Standing rule: Force Sensitive skills cost 0 skill points. Refuse to deploy an archive that says otherwise.
for f in TRE/pending/holocron_server.tre TRE/pending/holocron_client.tre; do
  [ -f "$f" ] && { python3 tools/lock_fs_skill_points.py verify "$f" || { echo "Not deploying: $f gives Force Sensitive skills a point cost."; exit 1; }; }
done
[ -f TRE/pending/holocron_server.tre ] && cp TRE/pending/holocron_server.tre TRE/holocron.tre.new && mv TRE/holocron.tre.new TRE/holocron.tre && echo "server archive deployed"
if [ -f TRE/pending/holocron_client.tre ]; then
  C="$HOME/Games/SWGemu/SWGEmu"; W="$HOME/.wine/drive_c/Program Files/Project Holocron Launcher/swgemu/TestServer"
  for d in "$C" "$C/TestServer" "$W"; do cp TRE/pending/holocron_client.tre "$d/holocron.tre.new" && mv "$d/holocron.tre.new" "$d/holocron.tre"; done
  python3 - "$C" <<'PY'
import json, hashlib, os, sys
c = sys.argv[1]
p = os.path.join(c, "holocron.tre")
h = hashlib.sha256(open(p, "rb").read()).hexdigest(); sz = os.path.getsize(p)
for mp in (os.path.join(c, "manifest.json"), os.path.join(c, "TestServer", "manifest.json")):
    m = json.load(open(mp)); m["files"]["holocron.tre"] = {"sha256": h, "size": sz}
    json.dump(m, open(mp, "w"), indent=2)
print("client archive deployed, manifest updated", h[:12], sz)
PY
fi
rm -f TRE/pending/holocron_server.tre TRE/pending/holocron_client.tre
