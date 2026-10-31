# Fontconfig-Schriftglättung unter Debian 13 XFCE/X11 einrichten und prüfen

Führe die Schritte als normaler Benutzer aus, **nicht mit `sudo`**.

## 1. Vorhandene Konfiguration sichern

```bash
mkdir -p ~/.config/fontconfig

if [ -f ~/.config/fontconfig/fonts.conf ]; then
  cp -a ~/.config/fontconfig/fonts.conf ~/.config/fontconfig/fonts.conf.backup
  echo "Vorhandene Datei gesichert."
else
  echo "Es gab noch keine fonts.conf."
fi
```

## 2. Konfiguration schreiben

Dieser Block setzt RGB-Subpixel-Rendering und leichtes Hinting für Schriftarten, die Fontconfig verwenden:

```bash
cat > ~/.config/fontconfig/fonts.conf <<'EOF'
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
<fontconfig>
  <match target="font">
    <edit name="rgba" mode="assign">
      <const>rgb</const>
    </edit>
    <edit name="hintstyle" mode="assign">
      <const>hintslight</const>
    </edit>
  </match>
</fontconfig>
EOF
```

## 3. Prüfen, ob Fontconfig die Datei lädt

```bash
FC_DEBUG=1024 fc-match 2>&1 | grep -F "$HOME/.config/fontconfig/fonts.conf"
```

Erwartet werden Zeilen ähnlich diesen:

```text
Loading config file from /home/DEIN_BENUTZER/.config/fontconfig/fonts.conf
Loading config file from /home/DEIN_BENUTZER/.config/fontconfig/fonts.conf done
```

## 4. Wirksame Einstellungen prüfen

```bash
fc-match -v sans-serif | grep -E 'hintstyle|rgba'
```

Erwartet werden Werte wie:

```text
hintstyle: 1(i)(w)
rgba: 1(i)(w)
```

Dabei steht `hintstyle: 1` für `hintslight` und `rgba: 1` für `rgb`.

Optional kannst du auch eine bestimmte Schriftfamilie prüfen. Ersetze `DejaVu Sans` durch den Namen einer installierten Schrift:

```bash
fc-match -v "DejaVu Sans" | grep -E 'hintstyle|rgba'
```

## 5. Anwendungen neu starten und Darstellung vergleichen

Schließe die betroffenen Anwendungen vollständig und öffne sie neu. Die Konfiguration gilt für alle Schriftarten, die Fontconfig verwenden; einzelne Programme können jedoch eigene Einstellungen benutzen oder Fontconfig umgehen.

## 6. Änderung rückgängig machen

Wenn vorher eine Konfigurationsdatei gesichert wurde, stelle sie wieder her:

```bash
cp -a ~/.config/fontconfig/fonts.conf.backup ~/.config/fontconfig/fonts.conf
```

Wenn vorher keine Datei vorhanden war und du die neue Konfiguration entfernen möchtest:

```bash
rm ~/.config/fontconfig/fonts.conf
```
