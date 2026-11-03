# LG webOS rootolás SlopBro segítségével (Windows 10/11)

**A mi tévénknél ezt a módszert alkalmaztuk:** LG 65NANO813QA, webOS 22 / 7.6.0, firmware 04.60.91. A SlopBro-t nem mi fejlesztjük, és az eljárás **nem minden firmware-en működik**. A leírás egy konkrét sikeres esetet dokumentál, nem garantált univerzális rootolást.

**Elsődleges források:** [SlopBro – hivatalos README](https://github.com/throwaway96/slopbro), [webOS Homebrew rootolási lehetőségek](https://www.webosbrew.org/guides/rooting/), [Homebrew Channel](https://github.com/webosbrew/webos-homebrew-channel).

## 1. Fontos előfeltételek és kockázatok

- **Csak a saját vagy kifejezett engedéllyel kezelt tévén** végezd.
- Rootolás garanciális, biztonsági vagy működési kockázattal járhat. Firmware-frissítés megszüntetheti a lehetőséget.
- Jegyezd fel a **TV-modellt, firmware-t, webOS-verziót**. A SlopBro README ismert esetek között webOS 6–10 verziókat említ, **nem ígér minden firmware-en működést**.
- Windows PC és TV ugyanabban a LAN-ban, mindkettő eléri egymást; a tűzfalnak engednie kell a helyi kapcsolatot.
- Ha a tévé már rootolt és a Homebrew Channel root státusza rendben van, **ne rootold újra**.
- A **Developer Mode** alkalmazás és a rootolt Homebrew környezet összeakadhat. A Homebrew dokumentációja szerint a rootolt tévén ne használd a Developer Mode alkalmazást. Mielőtt eltávolítod, mentsd, amire szükséged van; az eltávolítás pontos ideje a használt rootolási eljárástól függ. Lásd az eredeti SlopBro / webOS Homebrew útmutatókat.

## 2. A SlopBro letöltése Windowsra

1. Nyisd meg a hivatalos [throwaway96/slopbro](https://github.com/throwaway96/slopbro) projektet.
2. A **Code → Download ZIP** lehetőséggel töltsd le, majd **Összes kibontása**. Ne ismeretlen harmadik fél által kínált ZIP-et tölts le.
3. Telepíts Python 3-at a [python.org](https://www.python.org/downloads/windows/) oldalról, ha még nincs fent. Ellenőrizd PowerShellben:

```powershell
py --version
```

4. Nyiss PowerShellt a SlopBro **kibontott mappájában**, ahol a `slopbro.py` és a `wwwroot` könyvtár található. Ha `py` nincs, a saját Python-telepítésed szerint `python` vagy `python3` használható.

## 3. Saját IP-címek megállapítása

- TV IP-címe: TV hálózati beállításaiban keresd az IPv4-címet.
- Windows PC helyi IPv4-címe: PowerShellben `ipconfig`; a **tévével azonos hálózaton levő** Wi-Fi/Ethernet adapter IPv4-címét használd, ne virtuális WSL/VPN-adapterét.
- **A mi példánk:** PC `192.168.1.148`, TV `192.168.1.208`. **Ezek nem a te címeid!**

## 4. Indítás

A korábban nálunk működő parancs (a két IP-t **cseréld ki** a sajátodra):

```powershell
py slopbro.py --webos-version 7 --local-ip 192.168.1.148 192.168.1.208
```

- A `--webos-version 7` **a mi webOS 22 / TV 7.x esetünkre** vonatkozott. Másik tévén ellenőrizd a verziószámozást; ne másold vakon a 7-et. A SlopBro dokumentációja szerint ez a kapcsoló korlátozza a kiválasztott célalkalmazásokat.
- A `--local-ip` a **Windows-gép** IP-je, a parancs végén álló IP **a tévéé**.
- Ha a tévé párosítást kér, a **saját tévéden** engedélyezd, és kövesd a képernyőn megjelenő állapotot.
- A SlopBro helyi HTTP-szervert indít, a tévén egy oldalt megnyit, majd megkísérli a sérülékenységet kihasználni. A sikeres ág Homebrew Channelt és tartós root-elérést állít be. Ne kapcsold ki a tévét a folyamat közben.

**Ne értelmezd a sima párosítási sikert rootolási sikernek.** Csak akkor tekintsd késznek, ha maga az eszköz sikeres befejezést jelez, és a Homebrew Channel root státusza is megfelelő.

## 5. A root ellenőrzése

1. Kövesd a SlopBro képernyőn megjelenő utasításait az esetleges újraindításról.
2. Ellenőrizd a **Homebrew Channel → Root status: ok** állapotot.
3. Kapcsold be a **Homebrew Channel → Settings → SSH Server** szolgáltatást, majd állíts be kulcsos SSH-belépést a [következő útmutató szerint](SSH-WINDOWS.md).
4. Az `ssh root@TV_IP id -u` megfelelő kulcsos hitelesítéssel **0** eredményt kell adjon.

## Ha nem működik

- Ellenőrizd a hálózat kétirányú elérését és a Windows-tűzfal figyelmeztetését.
- Ha a program rossz PC-IP-t választ, `--local-ip` segítségével add meg pontosan.
- Használható a SlopBro dokumentált `--test-server simple` módja a helyi HTTP elérés ellenőrzésére; ez nem rootolja a tévét.
- A sikertelen próbát **ne kövesd véletlenszerű, más firmware-re szánt parancsokkal**; nézd meg az eredeti [SlopBro hibakeresést](https://github.com/throwaway96/slopbro#troubleshooting) és a [webOS Homebrew kompatibilitási forrásait](https://www.webosbrew.org/guides/rooting/).

**Biztonság:** rootolt TV-n a nyitott SSH és főleg a hitelesítés nélküli Telnet kockázatos. Telnetet ne engedélyezz normál használatra, SSH-t ne továbbíts az internetre. A SlopBro AGPL-3.0 licencű külön projekt, ebbe a tárolóba nem másoljuk át az eszköz kódját.
