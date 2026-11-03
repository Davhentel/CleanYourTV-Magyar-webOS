# 🇭🇺 CleanYourTV Magyar – LG webOS

**Nem hivatalos közösségi magyarítás a CleanYourTV 1.6.14-hez.** Ez nem az LG teljes webOS rendszerének magyarítása, hanem a CleanYourTV saját kezelőfelülete és alternatív Home-indítója.

## ⬇️ Letöltés

**[MAGYAR IPK TELEPÍTŐ LETÖLTÉSE](https://github.com/Davhentel/CleanYourTV-Magyar-webOS/releases/download/v1.6.14-hu1/CleanYourTV-1.6.14-MAGYAR-HIVATALOS-CSOMAGOLO.ipk)**

**[Kezdőknek: teljes útvonal Windows + LG TV](docs/KEZDOKNEK.md)** · [Rootolás SlopBro-val](docs/ROOTOLAS-SLOPBRO.md) · [SSH beállítása](docs/SSH-WINDOWS.md) · [Részletes IPK-telepítés](docs/TELEPITES.md) · [Hibakeresés és visszaállítás](docs/HELYREALLITAS.md)

**Figyelem:** Rootolt LG tévé és működő SSH-hozzáférés szükséges. **Ne nyomd meg a „Set up now” gombot**, ha meg akarod tartani az LG eredeti főképernyőjét. A magyar IPK önmagában nem rootolja a TV-t.

## ✅ Amit tényleg kipróbáltunk

- **LG 65NANO813QA**, webOS 22 / webOS TV 7.6.0, firmware **04.60.91**.
- SlopBro segítségével rootolt készülék, Homebrew Channel 0.7.3, SSH-hozzáférés.
- Először hivatalos CleanYourTV Manager 1.6.14, majd magyar IPK felültelepítése.
- A magyar Manager és a **„Set up now” után az új magyar Home** működött (2026. november 3.).
- A magyar IPK SHA-256 értéke és a ténylegesen telepített HTML-fájl ellenőrizve.

**Nem igazolt:** más tévémodellek és firmware-ek, teljesen szűz készülék minden beállításának végigtesztelése, a teljes visszaállítás a saját tévénken, minden kiegészítő és a hosszú távú frissítési viselkedés. **A leírás nem sikergarancia.**

## 🧭 Telepítési sorrend

1. **Ellenőrizd a kompatibilitást**: [webOS Homebrew rootolási útmutató](https://www.webosbrew.org/guides/rooting/), [CleanYourTV követelmények](https://lasharor.github.io/cleanyourtv-WebOS/install/). A CleanYourTV webOS 5 vagy újabb rendszert igényel.
2. **Rootolás – csak ha még nem rootolt**: [SlopBro, a nálunk használt módszer](docs/ROOTOLAS-SLOPBRO.md). Nem minden firmware sebezhető.
3. **Homebrew Channel és SSH**: [Windows / Ubuntu / SSH-kulcs](docs/SSH-WINDOWS.md).
4. **Hivatalos CleanYourTV Manager 1.6.14**, utána [magyar IPK](docs/TELEPITES.md). **Ha csak újabb hivatalos Manager érhető el, az 1.6.14 felültelepítését nem teszteltük; ne erőltesd a visszaminősítést.**
5. A magyar kezelőfelület ellenőrzése; csak ezután, **tudatos döntéssel**, „Set up now”, ha új főképernyőt szeretnél.

## 🔐 Ellenőrzőösszeg

`82a04f3690f5cf43dcab69ed851e78e293a418331d1318016cc392f0cd1c82f9` — `CleanYourTV-1.6.14-MAGYAR-HIVATALOS-CSOMAGOLO.ipk`

A GitHub kiadási csatolmány SHA-256 értéke egyezett a kipróbált helyi IPK-éval. A checksum a sérülést segít észrevenni, nem helyettesíti a forrás ellenőrzését.

## ℹ️ További dokumentáció

[Hogyan készült és mit teszteltünk](docs/HOGYAN_KESZULT.md) · [GYIK](docs/GYIK.md) · [Források, licencek](docs/LICENCEK.md) · [Közzétételi útmutató](docs/GITHUB_KOZZETETEL.md)

## Eredet és felelősség

Eredeti projekt: [lasharor/cleanyourtv-WebOS](https://github.com/lasharor/cleanyourtv-WebOS) · Magyar fordítás: [PR #130](https://github.com/lasharor/cleanyourtv-WebOS/pull/130) · Rootolási eszköz: [throwaway96/slopbro](https://github.com/throwaway96/slopbro).

Nem hivatalos LG- vagy CleanYourTV-kiadás. Rootolással, SSH-val és rendszerindító-módosítással jár; saját felelősségre használd. **Privát SSH-kulcsot, jelszót, tokeneket soha ne tölts fel hibajelentéshez.**
