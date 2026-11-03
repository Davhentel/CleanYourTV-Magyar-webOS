# Hibaelhárítás és visszaállítás

## Először: mi történt pontosan?

- **SSH nem csatlakozik:** ellenőrizd a tévé IP-címét, a root-hozzáférést, a Homebrew Channel SSH Server opcióját és a kulcsodat. A tévénél eltérő SSH-beállítások lehetnek.
- **IPK Extraction Failure:** ellenőrizd a letöltött IPK SHA-256 értékét és azt, hogy teljesen felmásolódott-e. A fejlesztés során több saját újracsomagolási kísérletünk is ezzel a hibával állt meg; a kiadáshoz **csak az ellenőrzött, hivatalos buildformátumot követő IPK-t** használjuk.
- **A telepítő `installed`-et írt, de `disconnected` is megjelent:** ellenőrizd a ténylegesen telepített HTML és magyar nyelvi fájl jelenlétét a telepítési útmutató 7. pontja szerint.
- **Nem magyar:** ellenőrizd a telepített `hu.json` fájlt, a Manager HTML SHA-ját és az alkalmazás nyelvi beállításait. Lehetséges, hogy a későbbi automatikus frissítés felülírta a magyar változatot.
- **Főképernyőhiba:** először a gyári CleanYourTV-kezelőfelület visszaállítási lehetőségeit használd; ne töröld kézzel a bootfájlokat.

## Visszatérés az LG eredeti főképernyőjéhez

A hivatalos [Updating and uninstalling](https://lasharor.github.io/cleanyourtv-WebOS/managing/) dokumentáció alapján a CleanYourTV Managerből lehet kezelni és eltávolítani a Home-helyettesítést. Ha a Manager elérhető, **először annak kikapcsolási/eltávolítási lehetőségeit használd**. A pontos menük és viselkedés kiadásonként eltérhetnek.

A felhasználói teszt során az eredeti hivatalos Manager 1.6.14 IPK-fájljáról is készült mentés, de a visszaállítást **nem teszteltük**, ezért nem adunk ellenőrizetlen automatikus helyreállító parancsot.

Ha az LG Home sem indul, készíts hibajelentést az eredeti projekthez, a tévé típusával, firmware-jével és a hiba pontos leírásával. [Hivatalos hibakeresés](https://lasharor.github.io/cleanyourtv-WebOS/troubleshooting/).

## Biztonsági szabályok

- Ne távolítsd el kézzel a `webOS` rendszerfájlokat.
- Ne futtass az internetről származó, ismeretlen root shell parancsokat.
- Ne add meg nyilvánosan az SSH-kulcsodat, jelszavadat, tokenjeidet.
- A magyar IPK nem firmware és nem általános LG-nyelvi csomag.
- Más típuson vagy más verzión **nincs kompatibilitási garancia**.
