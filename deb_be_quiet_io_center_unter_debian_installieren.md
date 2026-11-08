# be quiet! IO Center unter Debian installieren

Diese Anleitung beschreibt, wie du `iocenter-linux` unter Debian installierst, die erforderlichen Geräteberechtigungen einrichtest und einen Starter im XFCE-Menü anlegst.

> **Wichtig:** Starte das IO Center nicht mit `sudo`. Die Berechtigungen werden für dein Benutzerkonto eingerichtet.  
> Die Berechtigung für `/dev/uinput` ist nur nötig, wenn du virtuelle Tasten wie F13–F24 verwendest.

## 1. Voraussetzungen installieren

Öffne ein Terminal und installiere die benötigten Pakete:

```bash
sudo apt update
sudo apt install git python3 python3-pyqt6 python3-pil libqt6svg6 udev usbutils
```

Prüfe die Python-Version und die benötigten Bibliotheken:

```bash
python3 --version
python3 -c "import PyQt6, PIL; print('PyQt6 und Pillow: OK')"
```

Das Projekt benötigt Python 3.11 oder neuer. Wenn der Import-Test einen Fehler meldet, behebe diesen zuerst, bevor du mit der Installation fortfährst.

## 2. Projekt herunterladen und starten

Lade das Projekt von GitHub herunter und starte es aus dem Projektverzeichnis:

```bash
cd ~
git clone https://github.com/re133/iocenter-linux.git
cd ~/iocenter-linux
python3 bqgui.py
```

Starte die App zunächst aus dem Terminal. So werden Fehlermeldungen sichtbar, falls etwas nicht funktioniert.

Beim ersten Zugriff auf das Keyboard kann die App einen Sicherheitshinweis anzeigen. Bestätige ihn in der App. Die Benutzereinstellungen werden laut Projekt unter folgendem Pfad gespeichert:

```text
~/.config/iocenter-linux/config.toml
```

## 3. Prüfen, ob Debian das Keyboard erkennt

Schließe die Dark Mount direkt an den Rechner an und führe aus:

```bash
lsusb -d 373f:0001
```

Wenn Debian das Gerät erkennt, sollte eine Zeile mit dem Gerät erscheinen.

Falls keine Ausgabe erscheint, liste alle USB-Geräte auf:

```bash
lsusb
```

Prüfe außerdem, ob die udev-Regel im geklonten Projekt vorhanden ist:

```bash
cd ~/iocenter-linux
find . -maxdepth 3 -type f $ -iname '*.rules' -o -iname '*udev*' $ -print
```

Wenn die Datei `70-iocenter-dark-mount.rules` vorhanden ist, installiere sie so:

```bash
sudo install -Dm644 \\
  ./70-iocenter-dark-mount.rules \\
  /etc/udev/rules.d/70-iocenter-dark-mount.rules

sudo udevadm control --reload-rules
```

Ziehe danach das Keyboard ab und stecke es wieder an. Starte die App anschließend erneut:

```bash
cd ~/iocenter-linux
python3 bqgui.py
```

> Wenn die Datei `70-iocenter-dark-mount.rules` im Projekt nicht vorhanden ist, führe den `install`-Befehl nicht aus. Verwende stattdessen den tatsächlichen Dateinamen, den `find` ausgegeben hat. Wenn keine passende Regeldatei vorhanden ist, lass diesen Schritt aus und notiere die Fehlermeldung der App.

## 4. Optional: Berechtigung für virtuelle Tasten F13–F24

Überspringe diesen Abschnitt, wenn du keine virtuellen Tasten verwenden möchtest.

`/dev/uinput` ermöglicht Programmen, virtuelle Eingabegeräte zu erzeugen. Die folgenden Schritte richten eine eigene Gruppe ein, damit nur `root` und Mitglieder dieser Gruppe auf das Gerät zugreifen können.

```bash
getent group uinput >/dev/null || sudo groupadd --system uinput
sudo usermod -aG uinput "\$USER"
```

Lege eine Datei an, damit das `uinput`-Kernelmodul beim Systemstart geladen wird:

```bash
printf '%s\n' uinput | sudo tee /etc/modules-load.d/iocenter-uinput.conf
```

Erstelle eine udev-Regel für `/dev/uinput`:

```bash
printf '%s\n' \\
  'SUBSYSTEM=="misc", KERNEL=="uinput", GROUP="uinput", MODE="0660", OPTIONS+="static\_node=uinput"' \\
  | sudo tee /etc/udev/rules.d/99-iocenter-uinput.rules
```

Lade die Regeln neu und lade das Modul:

```bash
sudo udevadm control --reload-rules
sudo modprobe uinput
```

Starte danach den Rechner neu, damit sowohl die neue Gruppenmitgliedschaft als auch die Berechtigungen sicher aktiv sind:

```bash
sudo reboot
```

Melde dich nach dem Neustart an und prüfe die Gruppenmitgliedschaft sowie die Rechte der Gerätedatei:

```bash
id -nG
ls -l /dev/uinput
```

In der Ausgabe von `id -nG` sollte `uinput` stehen. Die Ausgabe von `ls -l` sollte ungefähr so aussehen:

```text
crw-rw---- 1 root uinput ... /dev/uinput
```

Starte die App anschließend wie gewohnt als normaler Benutzer.

Wenn du in der App den Tastendienst aktiviert hast, kannst du seinen Status prüfen:

```bash
systemctl --user status bqkeyd.service
```

Die Protokollmeldungen des Dienstes kannst du so anzeigen:

```bash
journalctl --user -u bqkeyd.service
```

Falls der Dienst noch nicht aktiviert wurde, kann `systemctl` melden, dass er nicht gefunden wurde oder nicht geladen ist. Aktiviere den Tastendienst dann zuerst in der App.

> Mitglieder der Gruppe `uinput` können virtuelle Eingabegeräte erzeugen. Füge dieser Gruppe nur Benutzerkonten hinzu, denen du vertraust.

## 5. Starter im XFCE-Menü erstellen

Der folgende Befehl erstellt einen `.desktop`-Starter im Benutzerkonto. Er versucht, ein passendes Symbol im Projektverzeichnis zu finden. Wird keines gefunden, verwendet er ein allgemeines Systemsymbol.

```bash
APP\_DIR="\$HOME/iocenter-linux"
mkdir -p "\$HOME/.local/share/applications"

ICON="\$(find "\$APP\_DIR" -maxdepth 4 -type f \\
  $ -iname '*icon*.png' -o -iname '*icon*.svg' \
     -o -iname '*iocenter*.png' -o -iname '*iocenter*.svg' \
     -o -iname '*logo*.png' -o -iname '*logo*.svg' $ \\
  -print -quit)"

[ -n "\$ICON" ] || ICON="applications-system"

cat > "\$HOME/.local/share/applications/iocenter-linux.desktop" <
