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
echo "$GREEN  installiere Common UNIX Printing System CUPS™..."
echo "$GREEN  "
echo "$GREEN  ... $NORMAL"
sudo apt install cups -y
echo "$GREEN ************************************************************"
echo "$GREEN  Drucker-Backend für das Canon-Protokoll BJNP installieren..."
echo "$GREEN  "
echo "$GREEN  ... $NORMAL"
sudo apt install cups-backend-bjnp -y
echo "$GREEN ************************************************************"
echo "$GREEN  installiere API-Bibliothek für Scanner..."
echo "$GREEN  "
echo "$GREEN  ... $NORMAL"
sudo apt install sane-utils -y
echo "$GREEN ************************************************************"
echo "$GREEN  installiere SANE backend für AirScan (eSCL) und WSD..."
echo "$GREEN  "
echo "$GREEN  ... $NORMAL"
sudo apt install sane-airscan -y
echo "$GREEN ************************************************************"
echo "$GREEN  Grafische Oberfläche für SANE installieren..."
echo "$GREEN  "
echo "$GREEN  ... $NORMAL"
sudo apt install xsane -y
echo "$GREEN ************************************************************"
