# Fejlesztési és tesztelési napló – ellenőrzött tények

**Dátum:** 2026. november 3.  
**Készülék:** LG 65NANO813QA  
**Szoftver:** webOS 22 / webOS TV 7.6.0 / firmware 04.60.91  
**Homebrew Channel:** 0.7.3, root SSH-hozzáféréssel  
**Alapkiadás:** eredeti CleanYourTV 1.6.14.

## A munka röviden

1. A hivatalos 1.6.14-es IPK-ből kiindulva a magyar `i18n/hu.json` fordítást használó változatot készítettünk. A fordítás **770 fordítási kulcsot** fedett le, és a [#130-as upstream PR](https://github.com/lasharor/cleanyourtv-WebOS/pull/130) tartalmazza.
2. A csomagban négy beágyazott HTML-fordítási tábla frissült (Manager, Launcher, Picker és IPTV oldal); ezen kívül a service `i18n/hu.json` fájlja került bele.
3. Az eredeti IPK 131, a magyar IPK 132 TAR-fájlbejegyzést tartalmazott. A fájltulajdonosok root (0:0), az időbélyegek `1761000000` értékűek voltak, a hivatalos buildmódszerhez igazítva.
4. Több korábbi saját újracsomagolás `IPK Extraction Failure` hibával meghiúsult. A `CleanYourTV-1.6.14-MAGYAR-HIVATALOS-CSOMAGOLO.ipk` nevű verzió telepítése sikerült.
5. A telepítő `state: installed` állapotot adott; utána a Manager HTML és a service `hu.json` jelenlétét külön ellenőriztük.
6. A felhasználó megerősítette, hogy a Manager **minden felirata magyar**, majd a `Set up now` beállítás után az új Home-főképernyő is magyarul és működőképesen jelent meg.

## Ellenőrzőösszegek

| Elem | SHA-256 |
|---|---|
| Magyar IPK | `82a04f3690f5cf43dcab69ed851e78e293a418331d1318016cc392f0cd1c82f9` |
| Magyar Manager `index.html` | `0b654cecddf7f982e345d1e6f11bcaf3f205b82bdd9e89f4d347efb5207f452d` |
| Eredeti hivatalos 1.6.14 IPK, helyi ellenőrzés | `4635f1e320f68838eff134d29ab7c4b36e6e3e3280088e9dec830d37a6c9324b` |

## Amit NEM igazoltunk

- Más LG-modellek és firmware-ek, valamint webOS 5/6/újabb verziók kompatibilitása.
- Friss, korábban CleanYourTV nélküli tévére történő közvetlen magyar IPK-telepítés.
- A gyári LG Home visszaállítása a mi saját tesztünkben.
- Hosszú távú működés, minden kiegészítő, automatikus frissítések, IPTV/Voice/Debloat funkciók teljes körű tesztelése.

## Források

- [Eredeti CleanYourTV](https://github.com/lasharor/cleanyourtv-WebOS)
- [Eredeti v1.6.14 kiadás](https://github.com/lasharor/cleanyourtv-WebOS/releases/tag/v1.6.14)
- [Magyarítási PR #130](https://github.com/lasharor/cleanyourtv-WebOS/pull/130)
- [Hivatalos telepítés](https://lasharor.github.io/cleanyourtv-WebOS/install/)

A magyarítás és az IPK nem hivatalos, az upstream fejlesztője nem ad rá támogatási garanciát.
