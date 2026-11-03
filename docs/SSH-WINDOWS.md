# SSH-kapcsolat rootolt LG tévéhez – Windows 10/11 / Ubuntu WSL

Az útmutató **már rootolt, Homebrew Channellel rendelkező** tévére vonatkozik. A SlopBro-val még rootolatlan tévén lásd [ROOTOLAS-SLOPBRO.md](ROOTOLAS-SLOPBRO.md).

## 1. SSH Server a TV-n

Homebrew Channel → **Settings → SSH Server**: kapcsold be. Ha a beállítás ezt kéri, indítsd újra a TV-t. Keresd ki a TV helyi IP-címét. **Ne kapcsolj be Telnetet**, és ne nyisd meg a 22-es portot az internet felé.

Az SSH nem ugyanaz, mint az LG Developer Mode `prisoner:9922` elérése. Rootolt TV-n a Homebrew Channel **root SSH** rendszerét használjuk, jellemzően a 22-es porton. [Forrás](https://github.com/webosbrew/webos-homebrew-channel).

## 2. Ubuntu WSL Windows alatt (ha nincs használható SSH-környezeted)

A Windows OpenSSH is megfelelő, de a nálunk tesztelt parancsok **Ubuntu WSL** alatt futottak. Ha még nincs WSL, rendszergazdai PowerShellben:

```powershell
wsl --install -d Ubuntu
```

Ha újraindítást kér, tedd meg; az első Ubuntu indításkor fejezd be a felhasználó létrehozását. Ubuntu terminálban az `ssh`, `scp`, `ssh-keygen` parancsokat használd. Ha valamelyik hiányzik, telepítsd az `openssh-client` csomagot a saját Ubuntu-csomagkezelőddel.

## 3. Saját SSH-kulcs

Ubuntu terminálban (a kulcsfájlt a saját gépeden őrizd):

```bash
ssh-keygen -t ed25519 -f ~/.ssh/lg_webos_ed25519 -C 'webos-tv'
```

A kulcshoz érdemes jelmondatot beállítani. Az `lg_webos_ed25519` **privát**, az `lg_webos_ed25519.pub` **nyilvános** kulcs. Csak a `.pub` tartalma kerülhet a TV-re.

## 4. Nyilvános kulcs felvétele a TV-re

Az alábbi lépéshez a TV-n **már működő root SSH-belépés** kell (például a Homebrew Channel kezdeti, helyi hálózaton elérhető belépése). Ha nem megy a belépés, **ne találgass jelszavakat**; nézd meg a Homebrew Channel saját SSH-beállításait. A projekt dokumentációja a nyilvános kulcs célfájljaként `/home/root/.ssh/authorized_keys` útvonalat adja meg.

Ubuntu terminálban a **saját** TV-IP-vel:

```bash
TV_IP=192.168.1.50
cat ~/.ssh/lg_webos_ed25519.pub | ssh root@"$TV_IP" 'umask 077; mkdir -p /home/root/.ssh; cat >> /home/root/.ssh/authorized_keys; chmod 700 /home/root/.ssh; chmod 600 /home/root/.ssh/authorized_keys'
```

**A példa `192.168.1.50` IP-jét cseréld ki.** Az SSH megkérdezheti a TV gazdagép-ujjlenyomatát; csak ellenőrzött saját TV-n fogadd el. Ha a root jelszavas belépés nem működik, ez a lépés megáll; az nem oldható meg a TV engedélyezése nélkül.

## 5. Ellenőrzés

```bash
ssh -i ~/.ssh/lg_webos_ed25519 -o IdentitiesOnly=yes root@"$TV_IP" 'id -u'
```

Várt eredmény: `0`. A kulcs **jelmondatát a saját terminálodba** írd, soha ne oszd meg másokkal. Ha az SSH root jelszót kér és nem a kulcs jelmondatát, ellenőrizd a `authorized_keys` tartalmát és a jogosultságokat.

Most folytasd a [magyar IPK telepítésével](TELEPITES.md).
