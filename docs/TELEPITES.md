# Telepítés – részletes, magyar útmutató

## 0. Amit biztosan tudunk

Az alábbi IPK-t **meglévő** CleanYourTV Manager 1.6.14 telepítésére telepítettük rá egy rootolt LG 65NANO813QA tévén. A telepítés és a magyar nyelvű főképernyő működött. **Új, üres rendszerre történő közvetlen telepítést nem teszteltünk**, ezért kezdőknek a hivatalos Manager előzetes telepítését javasoljuk. A lentiek egy részét más készüléken még ellenőrizni kell.

## 1. Előfeltételek

- LG webOS **5 vagy újabb** rendszer, ahol a hivatalos CleanYourTV támogatása lehetséges. A kompatibilitás modell- és firmware-függő. Ellenőrzés: [hivatalos telepítési leírás](https://lasharor.github.io/cleanyourtv-WebOS/install/).
- **Rootolt TV**, a Homebrew Channel működő telepítésével és engedélyezett SSH-szerverrel. Az IPK **nem rootolja** a tévét; a rootolás saját kockázat, firmware-től függően lehetetlen is lehet. Lásd a [Homebrew Channel projektet](https://github.com/webosbrew/webos-homebrew-channel).
- Számítógép, amelyen `ssh`, `scp` és `sha256sum` elérhető (például Ubuntu/WSL). A tévé és a számítógép lehetőleg ugyanazon helyi hálózaton legyen.
- A tévé IP-címe, valamint az SSH-hitelesítés előzetesen beállítva. A példában a TV címe **`192.168.1.50` – ezt ki kell cserélni!**
- Lehetőleg legyen hozzáférésed az eredeti Managerhez és egy visszaállítási lehetőséghez.

## 2. Hivatalos Manager telepítése Homebrew Channelből (ajánlott első telepítésnél)

A TV-n: **Homebrew Channel → fogaskerék → Add repository**, és add hozzá:

```text
https://github.com/lasharor/cleanyourtv-WebOS/releases/latest/download/apps.json
```

A listában keresd a CleanYourTV-t, majd válaszd az **Install** lehetőséget. **Egyelőre ne nyomd meg a „Set up now”-t.** A hivatalos telepítési útmutató ezt a Homebrew Channel forrást adja meg. Fontos: időközben a hivatalos verzió már lehet újabb, mint 1.6.14; ha igen, az alábbi 1.6.14-es felültelepítést nem teszteltük erre az esetre. Ilyenkor ne erőltesd a downgrade-et.

## 3. A magyar IPK letöltése, ellenőrzése

A **saját magyar GitHub-repozitórium Releases oldaláról** töltsd le:

`CleanYourTV-1.6.14-MAGYAR-HIVATALOS-CSOMAGOLO.ipk`

A terminálban abban a könyvtárban, ahová letöltötted:

```bash
sha256sum CleanYourTV-1.6.14-MAGYAR-HIVATALOS-CSOMAGOLO.ipk
```

A 2026. november 3-án ténylegesen tesztelt csomag ellenőrzőösszege:

```text
82a04f3690f5cf43dcab69ed851e78e293a418331d1318016cc392f0cd1c82f9
```

**Ha eltér, ne telepítsd.** Ellenőrizd, hogy a megfelelő kiadást töltötted-e le. A SHA-256 a véletlen sérülést segít felismerni, de nem bizonyítja a kiadó megbízhatóságát.

## 4. Másolás a tévére

Ubuntu/WSL terminálból, a fájlt tartalmazó könyvtárból (a **TV_IP** értékét cseréld ki):

```bash
TV_IP=192.168.1.50
scp CleanYourTV-1.6.14-MAGYAR-HIVATALOS-CSOMAGOLO.ipk root@"$TV_IP":/tmp/cytv-magyar-1.6.14.ipk
```

Ha a root SSH-belépéshez kulcs kell, azt előre konfiguráld az OpenSSH dokumentációja szerint; például `ssh -i ~/.ssh/SAJAT_KULCS ...`. **A privát kulcsodat senkivel ne oszd meg.** Az SSH-kulcs hitelesítési módja és a tévé SSH-portja modellenként/beállításonként eltérhet.

## 5. A tévére másolt fájl ellenőrzése

```bash
ssh root@"$TV_IP" 'sha256sum /tmp/cytv-magyar-1.6.14.ipk'
```

Csak akkor folytasd, ha a tévén is **pontosan** a fenti SHA-256 jelenik meg.

## 6. Telepítés a webOS telepítőszolgáltatásával

**FIGYELEM: ez a parancs már valódi alkalmazástelepítést indít és fájlokat módosíthat.** A 1.6.14-es Manager már telepítve volt a teszttévén, amikor ezt futtattuk. Ne használd másik csomagazonosítóval.

```bash
ssh root@"$TV_IP" "luna-send -i -f luna://com.webos.appInstallService/dev/install '{\"id\":\"com.cleanyourtv.manager\",\"ipkUrl\":\"/tmp/cytv-magyar-1.6.14.ipk\",\"subscribe\":true}'"
```

A hosszabb naplóban előfordulhat `ipk verifying`, `ipk parsing`, `installing : service installing`, végül:

```text
"state": "installed"
```

A mi tesztünkben az `installed` után `install has been disconnected` is megjelent. **Ez a mi esetünkben nem jelentett sikertelen telepítést**, de az `installed` üzenet **önmagában nem helyettesíti** a következő fájlellenőrzést. Ha `install failed` vagy `IPK Extraction Failure` jelenik meg, ne ismételd vakon a telepítést; lásd a [hibakeresést](HELYREALLITAS.md).

## 7. Tényleges fájlellenőrzés

```bash
ssh root@"$TV_IP" 'sha256sum /media/developer/apps/usr/palm/applications/com.cleanyourtv.manager/index.html; test -f /media/developer/apps/usr/palm/services/com.cleanyourtv.manager.service/i18n/hu.json && echo MAGYAR_FORDITAS_MEGVAN || echo MAGYAR_FORDITAS_HIANYZIK'
```

Az **1.6.14-es tesztcsomagnál** a Manager HTML elvárt SHA-256 értéke:

```text
0b654cecddf7f982e345d1e6f11bcaf3f205b82bdd9e89f4d347efb5207f452d
MAGYAR_FORDITAS_MEGVAN
```

Ha más értéket kapsz, a telepített fájlok nem egyeznek a nálunk tesztelt állapottal.

## 8. Magyar kezelőfelület és főképernyő

Nyisd meg a **CleanYourTV Manager** alkalmazást a TV-n. Ellenőrizd, hogy a menük magyarul láthatók. Az eredeti LG Home még nem cserélődött le attól, hogy az IPK-t telepítetted.

**Ha valóban szeretnéd lecserélni a gyári LG-főképernyőt**, olvasd el az eredeti projekt [Setup / install](https://lasharor.github.io/cleanyourtv-WebOS/install/) dokumentációját, majd a Managerben válaszd a **„Set up now”** vagy az ennek megfelelő magyar gombot. Ez már a rendszer indulási viselkedését módosítja, illetve a telepítés további összetevőket tölthet le.

A nálunk tesztelt LG 65NANO813QA készüléken a beállítás után **az új Home elindult és magyarul működött**. Más készüléknél a folyamat ettől eltérhet.

## 9. Hiba esetén

Olvasd el a [helyreállítási útmutatót](HELYREALLITAS.md). Ne törölj ismeretlen rendszerfájlokat és ne próbálj találomra `opkg install` parancsot futtatni: a webOS Homebrew telepítési útvonalai eltérhetnek az általános `opkg` alapértelmezéseitől.
