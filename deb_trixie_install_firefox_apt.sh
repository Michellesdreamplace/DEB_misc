#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGREY='\033[0;37m'
NORMAL='\033[0;39m'

BENUTZER=$USER
HOMEVERZEICHNIS=$HOME
MYSHELL=$SHELL
echo "$CYAN Hallo $BENUTZER"
echo "$CYAN Dein Home-Verzeichnis: $HOMEVERZEICHNIS"
echo "$CYAN Deine Shell: $MYSHELL"
echo "$GREEN ************************************************************"
echo "$GREEN  Verzeichnis zum Speichern der APT-Repository-Schlüssel erstellen..."
echo "$GREEN  "
echo "$GREEN  ... $NORMAL"
sudo install -d -m 0755 /etc/apt/keyrings
echo "$GREEN ************************************************************"
echo "$GREEN  signierte Schlüssel des Mozilla-APT-Repositories importieren..."
echo "$GREEN  "
echo "$GREEN  ... $NORMAL"
sudo apt install -y wget 
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
echo "$GREEN ************************************************************"
echo "$GREEN  Für Debian Trixie und höher:"
echo "$GREEN  Mozilla-APT-Repository zum Quellenverzeichnis hinzufügen..."
echo "$GREEN  ... $NORMAL"
sudo sh -c 'cat > /etc/apt/sources.list.d/mozilla.sources <<EOF
Types: deb
URIs: https://packages.mozilla.org/apt
Suites: mozilla
Components: main
Signed-By: /etc/apt/keyrings/packages.mozilla.org.asc
EOF'
echo "$GREEN ************************************************************"
echo "$GREEN  Pakete aus dem Mozilla Repository in APT priorisieren..."
echo "$GREEN  "
echo "$GREEN  ... $NORMAL"
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla 
echo "$GREEN ************************************************************"
echo "$GREEN  lese Paketdatenbank (Repository-Index) neu ein..."
echo "$GREEN  "
echo "$GREEN  ... $NORMAL"
sudo apt update -y
echo "$GREEN ************************************************************"
echo "$GREEN  Firefox installieren..."
echo "$GREEN  "
echo "$GREEN  ... $NORMAL"
sudo apt install firefox -y
echo "$GREEN ************************************************************"
echo "$GREEN  alle verfügbaren Sprachpakete auflisten..."
echo "$GREEN  "
echo "$GREEN  ... $NORMAL"
apt-cache search firefox-l10n
echo "$GREEN ************************************************************"
echo "$GREEN  deutsches Sprachpaket installieren..."
echo "$GREEN  "
echo "$GREEN  ... $NORMAL"
sudo apt install firefox-l10n-de -y
echo "$GREEN ************************************************************"
