# Gyakori kérdések

**Ez magyarra fordítja az LG teljes webOS rendszerét?** Nem. A CleanYourTV Manager, alternatív Home és kapcsolódó felület magyarításáról van szó.

**Root nélkül telepíthető?** A dokumentált, tesztelt folyamatban nem. Rootolt tévé, Homebrew Channel és SSH szükséges.

**Minden LG tévén működik?** Nem igazolt. A SlopBro rootolási kompatibilitás és a CleanYourTV launcher kompatibilitás **két külön kérdés**. A CleanYourTV webOS 5+ rendszerre készült, de az adott firmware korlátozhatja a működését.

**Miért először az eredeti 1.6.14?** A nálunk sikeres tesztnél már ez volt telepítve, és a magyar IPK-t erre telepítettük rá. Teljesen új telepítés más készüléken még nincs tesztelve.

**Mi van, ha a hivatalos verzió már újabb?** Ne telepítsd automatikusan rá a régebbi magyar 1.6.14-et. A verzió-visszaállítás ebből az állapotból nem tesztelt.

**Mikor kell „Set up now”?** Csak akkor, ha az LG eredeti Home-ját le akarod cserélni a CleanYourTV Home-ra. A Manager magyarításának ellenőrzéséhez nem kell.

**Hol van a magyar IPK?** [A v1.6.14-hu1 kiadásban](https://github.com/Davhentel/CleanYourTV-Magyar-webOS/releases/tag/v1.6.14-hu1).

**Mi van, ha telepítés után `install has been disconnected` látszik?** A mi naplónkban ez az `installed` után jelent meg, és a fájlellenőrzés sikeres volt. Ne következtess kizárólag ebből; ellenőrizd a telepített fájlokat a [TELEPITES.md](TELEPITES.md) szerint.

**Lehet automatikusan frissíteni?** Az újabb hivatalos kiadás felülírhatja a magyar fájlokat. A 1.6.14 kiadás nem garantálja az újabb kód és letöltött komponensek magyarítását.

**Visszaállítható az LG Home?** A hivatalos CleanYourTV Manager dokumentáltan kínál eltávolítási/visszaállítási lehetőséget. **A mi konkrét készülékünkön a visszaállítást nem teszteltük**, ezért nem ígérünk garantált eredményt. [Lásd a hivatalos útmutatót](https://lasharor.github.io/cleanyourtv-WebOS/managing/).
