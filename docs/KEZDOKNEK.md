# Telepítés teljesen kezdőknek – Windows 10/11 + LG webOS

**Ez egy útvonalterv, nem 100%-os sikerígéret.** Ha a tévé nincs rootolva, a folyamat a firmware-től és a rootolási lehetőségektől függ.

## Először ezt ellenőrizd

1. LG webOS TV, lehetőleg webOS 5 vagy újabb, internetkapcsolattal.
2. A TV és a Windows-gép ugyanazon otthoni hálózaton. **Ne engedélyezz SSH-porttovábbítást az internet felé.**
3. A TV pontos típusa, webOS-verziója és firmware-száma feljegyezve.
4. Az eredeti LG Home lecserélése csak akkor történjen meg, ha ezt kifejezetten akarod.

## A. A tévé már rootolt?

Ha a **Homebrew Channelben Root status: ok** látszik, és az SSH működik, **ugord át a rootolást**. Ellenkező esetben lásd [ROOTOLAS-SLOPBRO.md](ROOTOLAS-SLOPBRO.md); a SlopBro-t csak kompatibilis, saját tévén használd.

## B. Root után

1. Homebrew Channel → Beállítások → **SSH Server** bekapcsolása, ha szükséges, újraindítás.
2. Windows alatt Ubuntu/WSL és SSH-kulcs beállítása: [SSH-WINDOWS.md](SSH-WINDOWS.md).
3. Próbálj `ssh`-val belépni, és ellenőrizd az `id -u` eredményét: **0**.

## C. CleanYourTV magyarítása

1. Homebrew Channel → fogaskerék → **Add repository** → illeszd be az eredeti CleanYourTV repó URL-jét, lásd [TELEPITES.md](TELEPITES.md).
2. Telepítsd az eredeti **1.6.14** Managert. Ha nem ez a verzió érhető el, **állj meg**, mert újabb verzióról visszatelepítést nem teszteltünk.
3. Még **ne** nyomd meg a „Set up now”-t.
4. Töltsd le és ellenőrizd a magyar IPK-t, majd a [részletes útmutató](TELEPITES.md) alapján másold fel és telepítsd.
5. A Managerben ellenőrizd a magyar szövegeket.
6. Ha a gyári LG Home helyére a magyar CleanYourTV Home-ot akarod, és érted a kockázatot, csak ekkor nyomd meg a **„Set up now”** gombot.

## D. Ha valami eltér a leírástól

**Ne futtass találomra további root vagy rendszerfájl-módosító parancsokat.** Olvasd el a [hibakeresést](HELYREALLITAS.md), és jegyezd fel a készülékadatokat. A SlopBro és a Homebrew Channel hivatalos dokumentációja elsődleges forrás.
