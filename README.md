# 🇭🇺 CleanYourTV Magyar – LG webOS

**Nem hivatalos közösségi magyar kiadás a CleanYourTV 1.6.14-hez.** Az eredeti CleanYourTV fejlesztője: [lasharor/cleanyourtv-WebOS](https://github.com/lasharor/cleanyourtv-WebOS). A magyar fordítás hivatalos beolvasztási kérelme: [PR #130](https://github.com/lasharor/cleanyourtv-WebOS/pull/130).

> **Tesztelt készülék:** LG 65NANO813QA • webOS 22 / TV 7.6.0 • firmware 04.60.91 • 2026. november 3. A magyar Manager és a beállított magyar Home-főképernyő működött. **Más készüléken nem garantált**; a tiszta, előzmény nélküli telepítést sem teszteltük végig.

## Mire jó?

Rootolt LG webOS tévén magyar nyelvű CleanYourTV kezelőfelületet és – külön beállítás után – a CleanYourTV magyar főképernyőjét használhatod. **Nem az LG gyári webOS rendszerének teljes lefordítása.**

## Gyors telepítés

1. Olvasd el az [előfeltételeket és a részletes útmutatót](docs/TELEPITES.md). **Rootolt tévé és SSH-kapcsolat szükséges; az IPK önmagában nem rootolja a TV-t.**
2. Töltsd le a **magyar 1.6.14 IPK-t a projekt GitHub Releases oldaláról** (*amikor a tulajdonos feltöltötte*), és ellenőrizd az SHA-256-ot.
3. Másold fel az IPK-t a TV `/tmp/` könyvtárába SSH/SCP segítségével.
4. Telepítsd a webOS `com.webos.appInstallService/dev/install` szolgáltatásával, és ellenőrizd a `state: installed` állapotot.
5. Nyisd meg a CleanYourTV Manager alkalmazást; ellenőrizd, hogy a szöveg magyar.
6. **Csak ha az LG gyári Home-ot le szeretnéd cserélni**, válaszd a Managerben a „Set up now” / magyar megfelelőjét.

Az ellenőrzött parancsokat és a lehetséges hibákat a [TELEPITES.md](docs/TELEPITES.md) tartalmazza.

## Letöltendő fájlok

| Fájl | Funkció |
|---|---|
| `CleanYourTV-1.6.14-MAGYAR-HIVATALOS-CSOMAGOLO.ipk` | A tesztelt magyar csomag – **GitHub Release-csatolmányként szükséges feltölteni** |
| `SHA256SUMS` | Az eredeti tesztelt csomag ellenőrzőösszege |
| `i18n/hu.json` | Magyar forrásfordítás – a PR #130 forrásából átmásolható |
| `docs/TELEPITES.md` | Telepítés lépésenként |
| `docs/HELYREALLITAS.md` | Visszaállítás és hibakeresés |
| `docs/HOGYAN_KESZULT.md` | Mi volt valóban tesztelve; forrás és módszer |

**Fontos:** a jelen sablon **nem tartalmazza a működő IPK bináris fájlt**. A közzétételhez az eredeti, ellenőrzött IPK-t kell feltölteni, a fájl nevének és tartalmának megváltoztatása nélkül. A GitHubon a `Releases` → `Create a new release` résznél csatold az IPK-t.

## Frissítések

A csomag **1.6.14** verzióra épül, nem követi automatikusan a későbbi hivatalos kiadásokat. Egy későbbi automatikus frissítés felülírhatja a magyar fájlokat. Az alkalmazás külön letölthet launcher- és service-frissítéseket; ezek magyarítása a jelen csomaggal **nem garantált**. Mentés ajánlott, mielőtt frissítesz.

## Hivatkozások és felelősség

A projekt független közösségi magyarítás, nem hivatalos LG- vagy CleanYourTV-kiadás. Root-hozzáféréssel futó szoftvert telepítesz; az eljárás kockázatos lehet. A saját felelősségedre használd. Kérjük, jelentsd a modellt, webOS-verziót, firmware-t és pontos hibaüzenetet, ha nem működik; **ne** ossz meg SSH-kulcsot, jelszót vagy személyes hálózati adatokat.

Az eredeti projekt MIT-licencű, és harmadik féltől származó összetevőket is tartalmaz. A bináris újraterjesztésekor az eredeti licenc- és harmadikfeles jogi tájékoztatókat is meg kell őrizni; lásd [LICENCEK.md](docs/LICENCEK.md).
