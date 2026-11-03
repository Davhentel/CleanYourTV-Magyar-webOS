# Saját GitHub-projekt közzététele

## A javasolt repo

- GitHub felhasználó: a **saját** fiókod (a tesztben: `Davhentel`)
- Repository name: **`CleanYourTV-Magyar-webOS`**
- Description: `Magyar CleanYourTV 1.6.14 LG webOS tévékre – útmutató és tesztelt közösségi telepítő`
- Visibility: **Public**
- Új repo létrehozása: https://github.com/new

**Az új repót nem szabad összekeverni a hivatalos projekttel vagy a meglévő magyarítási PR #130-cal.**

## Közzététel sorrendje

1. A kész dokumentációs csomagot bontsd ki a gépeden; az új repó gyökerébe töltsd fel a `README.md`, `SHA256SUMS`, `.gitignore`, `docs/`, `scripts/` fájlokat.
2. A helyi Ubuntu/WSL gépeden futtasd a `bash scripts/ellenorzes-es-kiadas.sh` parancsot, ha a munkakönyvtárak még a teszt során használt helyeken vannak. A script csak ellenőrzött másolatokat készít, sem a tévét, sem a régi Git-projektet nem módosítja.
3. A `release-elokeszitve/i18n/hu.json`, `release-elokeszitve/LICENSE` és `release-elokeszitve/THIRD-PARTY.md` állományokat töltsd fel a repóba a megfelelő útvonalakra.
4. A GitHub új repójában **Releases → Draft a new release**, tag például `v1.6.14-hu1`, cím: `CleanYourTV 1.6.14 – magyar közösségi kiadás (LG 65NANO813QA modellen tesztelve)`.
5. Release assetként csatold **a tényleges `release-elokeszitve/*.ipk` fájlt** és `release-elokeszitve/SHA256SUMS` fájlt. A bináris **ne a Git-repo fájltörténetébe** kerüljön.
6. A kiadás leírásában világosan jelenjen meg: nem hivatalos, tesztelt modell, kell a root és SSH, a közvetlen friss telepítés más készülékeken nem tesztelt, saját felelősség.
7. A kiadás publikálása után a README letöltési részét frissítsd a GitHub Release valódi URL-jével. **Csak létező, ellenőrzött linket publikálj.**

## Javasolt Release-leírás

```
🇭🇺 Nem hivatalos magyar CleanYourTV 1.6.14 tesztkiadás.
Tesztelt készülék: LG 65NANO813QA / webOS 22 / firmware 04.60.91.
A magyar Manager és a beállított magyar Home-főképernyő működött.
Nem tesztelt: friss telepítés minden modellen, visszaállítás és hosszú távú frissítési viselkedés.
Előfeltétel: rootolt LG webOS tévé, Homebrew Channel, működő SSH.
Telepítés: lásd docs/TELEPITES.md.
SHA-256: 82a04f3690f5cf43dcab69ed851e78e293a418331d1318016cc392f0cd1c82f9
Forrás és licencek: lasharor/cleanyourtv-WebOS, MIT, THIRD-PARTY.md.
```
