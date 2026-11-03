#!/usr/bin/env bash
# A kipróbált IPK + magyar forrás + upstream jogi dokumentumok átmásolása.
# A projekt meglévő git working tree-jét nem módosítja.
set -euo pipefail
SRC_IPK="${1:-/home/davhentel/cleanyourtv-hu-1.6.14/CleanYourTV-1.6.14-MAGYAR-HIVATALOS-CSOMAGOLO.ipk}"
UPSTREAM_DIR="${2:-/home/davhentel/cleanyourtv-teszt}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
OUT="$ROOT/release-elokeszitve"
NAME='CleanYourTV-1.6.14-MAGYAR-HIVATALOS-CSOMAGOLO.ipk'
EXPECTED='82a04f3690f5cf43dcab69ed851e78e293a418331d1318016cc392f0cd1c82f9'
[[ -f "$SRC_IPK" ]] || { echo 'HIBA: IPK fájl nem található.' >&2; exit 1; }
ACTUAL="$(sha256sum "$SRC_IPK" | awk '{print $1}')"
[[ "$ACTUAL" == "$EXPECTED" ]] || { echo 'HIBA: az IPK SHA-256 értéke eltér. NE TEDD KÖZZÉ!' >&2; exit 1; }
for f in i18n/hu.json LICENSE THIRD-PARTY.md; do
  [[ -f "$UPSTREAM_DIR/$f" ]] || { echo "HIBA: hiányzik $UPSTREAM_DIR/$f" >&2; exit 1; }
done
mkdir -p "$OUT/i18n"
cp "$SRC_IPK" "$OUT/$NAME"
cp "$UPSTREAM_DIR/i18n/hu.json" "$OUT/i18n/hu.json"
cp "$UPSTREAM_DIR/LICENSE" "$OUT/LICENSE"
cp "$UPSTREAM_DIR/THIRD-PARTY.md" "$OUT/THIRD-PARTY.md"
printf '%s  %s\n' "$EXPECTED" "$NAME" > "$OUT/SHA256SUMS"
(cd "$OUT" && sha256sum -c SHA256SUMS)
python3 - "$OUT/i18n/hu.json" <<'PYCHECK'
import json,sys
obj=json.load(open(sys.argv[1],encoding='utf8'))
assert obj.get('_name')=='Magyar', 'A hu.json nem magyar fordítás'
print('Fordítási bejegyzések száma:',len(obj))
PYCHECK
echo
printf 'ELŐKÉSZÍTVE: %s\n' "$OUT"
echo 'A GitHub Release-be az .ipk-t és a SHA256SUMS fájlt töltsd fel.'
echo 'A repositoryba a fordítás és a licencdokumentumok kerüljenek, a bináris ne git commitként.'
