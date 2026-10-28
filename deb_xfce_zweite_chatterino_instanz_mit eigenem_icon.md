# Chatterino: zweite Flatpak-Instanz mit eigenem Profil und Symbol

Diese Anleitung richtet eine zweite Chatterino-Instanz unter Debian Trixie mit XFCE und X11 ein. Sie verwendet ein eigenes Profil und zeigt ein eigenes Symbol im Anwendungsmenü und am laufenden Fenster.

## Voraussetzungen

- Chatterino ist als Flatpak installiert: `com.chatterino.chatterino`.
- Eine quadratische PNG-Datei mit transparentem Hintergrund liegt unter  
  `~/.local/share/icons/chatterino_ZWEIPROFIL.png`. Empfohlene Größe: **512 × 512 Pixel**.
- Die Anleitung ist für eine X11-Sitzung gedacht.

Das normale Chatterino-Flatpak speichert seine Daten standardmäßig unter `~/.var/app/com.chatterino.chatterino/data/chatterino`. Die zweite Instanz bekommt stattdessen ein eigenes Datenverzeichnis. <citation src="3"></citation>

## 1. Profilverzeichnis anlegen

```bash
mkdir -p "$HOME/.local/share/chatterino_ZWEIPROFIL"
mkdir -p "$HOME/.local/share/icons"
```

Lege die PNG-Datei unter diesem Pfad ab:

```text
~/.local/share/icons/chatterino_ZWEIPROFIL.png
```

## 2. `wmctrl` und `xseticon` installieren

`wmctrl` wird benötigt, um das neue Fenster zu finden. `xseticon` setzt dessen Fenstersymbol. Das Projekt unterstützt PNG-Dateien und kann das Fenster über seine X11-Fenster-ID auswählen. <citation src="14"></citation>

```bash
sudo apt update
sudo apt install git build-essential libx11-dev libxmu-dev libxmu-headers libgd-dev libglib2.0-dev wmctrl
```

Kompiliere und installiere `xseticon` in deinem Benutzerverzeichnis:

```bash
mkdir -p "$HOME/src" "$HOME/.local/bin"
git clone https://github.com/xeyownt/xseticon.git "$HOME/src/xseticon"
cd "$HOME/src/xseticon"
make
install -m 755 xseticon "$HOME/.local/bin/xseticon"
```

## 3. Startskript erstellen

Das Skript setzt die XDG-Verzeichnisse innerhalb der Flatpak-Sandbox und startet Chatterino mit dem separaten Profil. Anschließend wartet es auf ein neu geöffnetes Fenster und setzt dessen Symbol.

```bash
mkdir -p "$HOME/.local/bin"

cat > "$HOME/.local/bin/chatterino-zweit" <<'EOF'
#!/bin/sh

PROFILE="$HOME/.local/share/chatterino_ZWEIPROFIL"
ICON="$HOME/.local/share/icons/chatterino_ZWEIPROFIL.png"

mkdir -p "$PROFILE" "$PROFILE/config" "$PROFILE/cache" "$PROFILE/state"

# Vorhandene Fenster-IDs merken, damit das neue Fenster erkannt wird.
before=" $(wmctrl -l | awk '{print $1}' | tr '\n' ' ') "

/usr/bin/flatpak run \
  --filesystem="$PROFILE" \
  --env=CHATTERINO_PROFILE="$PROFILE" \
  --command=sh \
  com.chatterino.chatterino \
  -c '
    PROFILE="$CHATTERINO_PROFILE"
    export XDG_DATA_HOME="$PROFILE"
    export XDG_CONFIG_HOME="$PROFILE/config"
    export XDG_CACHE_HOME="$PROFILE/cache"
    export XDG_STATE_HOME="$PROFILE/state"
    exec chatterino
  ' &
flatpak_pid=$!

# Bis zu 30 Sekunden auf das neue Fenster warten.
win=""
i=0
while [ "$i" -lt 30 ]; do
    for id in $(wmctrl -l | awk '{print $1}'); do
        case "$before" in
            *" $id "*) ;;
            *) win="$id"; break ;;
        esac
    done

    [ -n "$win" ] && break
    sleep 1
    i=$((i + 1))
done

if [ -n "$win" ]; then
    "$HOME/.local/bin/xseticon" -id "$win" "$ICON"
else
    echo "Neues Chatterino-Fenster nicht gefunden; Symbol nicht gesetzt." >&2
fi

wait "$flatpak_pid"
EOF

chmod +x "$HOME/.local/bin/chatterino-zweit"
```

Die XDG-Verzeichnisse werden im Shell-Prozess innerhalb der Sandbox gesetzt. `--filesystem` erlaubt der Flatpak-App den Zugriff auf das separate Profilverzeichnis.

## 4. XFCE-Menüeintrag erstellen

Der folgende Befehl schreibt den absoluten Home-Pfad in die `.desktop`-Datei:

```bash
mkdir -p "$HOME/.local/share/applications"

cat > "$HOME/.local/share/applications/chatterino-zweit.desktop" <
