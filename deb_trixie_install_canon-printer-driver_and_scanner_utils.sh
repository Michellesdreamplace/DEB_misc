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
echo "$GREEN   installiere:"
echo "$GREEN  Common UNIX Printing System(tm) - PPD-/Treiber-Unterstützung, Webschnittstelle..."
echo "$GREEN  ... $NORMAL"
sudo apt install cups -y
echo "$GREEN ************************************************************"
echo "$GREEN   installiere:"
echo "$GREEN  Common UNIX Printing System(tm) - Clientprogramme (System V)..."
echo "$GREEN  ... $NORMAL"
sudo apt install cups-client -y
echo "$GREEN ************************************************************"
echo "$GREEN   installiere:"
echo "$GREEN  CUPS-Filter von OpenPrinting - Hauptpaket..."
echo "$GREEN  ... $NORMAL"
sudo apt install cups-filters -y
echo "$GREEN ************************************************************"
echo "$GREEN   installiere:"
echo "$GREEN  Grafische Oberfläche für die Einrichtung des Drucksystems..."
echo "$GREEN  ... $NORMAL"
sudo apt install system-config-printer -y
echo "$GREEN ************************************************************"
echo "$GREEN   installiere:"
echo "$GREEN  Drucker-Backend für das Canon-Protokoll BJNP"
echo "$GREEN  ... $NORMAL"
sudo apt install cups-backend-bjnp -y
echo "$GREEN ************************************************************"
echo "$GREEN   installiere:"
echo "$GREEN  API-Bibliothek für Scanner -- Hilfsprogramme..."
echo "$GREEN  ... $NORMAL"
sudo apt install sane-utils -y
echo "$GREEN ************************************************************"
echo "$GREEN   installiere:"
echo "$GREEN  SANE backend for AirScan (eSCL) and WSD document scanner..."
echo "$GREEN  ... $NORMAL"
sudo apt install sane-airscan -y
echo "$GREEN ************************************************************"
echo "$GREEN   installiere:"
echo "$GREEN  Grafische Oberfläche für SANE (Scanner Access Now Easy) mit vielen Fähigkeiten..."
echo "$GREEN  ... $NORMAL"
sudo apt install xsane -y
echo "$GREEN ************************************************************"
