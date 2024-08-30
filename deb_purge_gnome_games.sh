#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NORMAL='\033[0;39m'

BENUTZER=$USER
HOMEVERZEICHNIS=$HOME
MYSHELL=$SHELL
echo "Hallo $BENUTZER"
echo "Dein Home-Verzeichnis: $HOMEVERZEICHNIS"
echo "Deine Shell: $MYSHELL"
echo "$GREEN ************************************************************"
echo "$GREEN     lese Paketdatenbank (Repository-Index) neu ein"
echo "$GREEN  ..."
sudo apt update
echo "$GREEN ************************************************************"
#
echo "$CYAN ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "$CYAN +++++                                                  +++++"
echo "$CYAN +++++        bereinige System von Gnome-Spielen        +++++"
echo "$CYAN +++++                                                  +++++"
echo "$CYAN ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#
echo "$GREEN ************************************************************"
sudo apt purge gnome-2048 -y
echo "$GREEN ************************************************************"
sudo apt purge aisleriot -y
echo "$GREEN ************************************************************"
sudo apt purge sol -y
echo "$GREEN ************************************************************"
sudo apt purge five-or-more -y
echo "$GREEN ************************************************************"
sudo apt purge hitori -y
echo "$GREEN ************************************************************"
sudo apt purge gnome-klotski -y
echo "$GREEN ************************************************************"
sudo apt purge lightsoff -y
echo "$GREEN ************************************************************"
sudo apt purge gnome-mahjongg -y
echo "$GREEN ************************************************************"
sudo apt purge gnome-mines -y
echo "$GREEN ************************************************************"
sudo apt purge gnome-nibbles -y
echo "$GREEN ************************************************************"
sudo apt purge quadrapassel -y
echo "$GREEN ************************************************************"
sudo apt purge iagno -y
echo "$GREEN ************************************************************"
sudo apt purge gnome-robots -y
echo "$GREEN ************************************************************"
sudo apt purge gnome-chess -y
echo "$GREEN ************************************************************"
sudo apt purge gnome-sudoku -y
echo "$GREEN ************************************************************"
sudo apt purge swell-foop -y
echo "$GREEN ************************************************************"
sudo apt purge tali -y
echo "$GREEN ************************************************************"
sudo apt purge gnome-taquin -y
echo "$GREEN ************************************************************"
sudo apt purge gnome-tetravex -y
echo "$GREEN ************************************************************"
sudo apt purge four-in-a-row -y
echo "$GREEN ************************************************************"
#
echo "$CYAN ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "$CYAN +++++                                                  +++++"
echo "$CYAN +++++               bereinige ...                      +++++"
echo "$CYAN +++++                                                  +++++"
echo "$CYAN ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "$GREEN ************************************************************"
echo "$GREEN     lese Paketdatenbank (Repository-Index) neu ein"
echo "$GREEN  ..."
sudo apt update
echo "$GREEN ************************************************************"
echo "$GREEN     lösche bereits heruntergeladenen Installationsdateien ..."
echo "$GREEN     aus dem Paket-Cache /var/cache/apt/archives/ "
echo "$GREEN     und gebe so Festplattenspeicher frei ..."
echo "$GREEN  ..."
sudo apt clean -y
echo "$GREEN ************************************************************"
echo "$GREEN     lösche alle heruntergeladenen Paketinstallationsdateien,"
echo "$GREEN     die aktuell nicht mehr in den Quellen verfügbar sind ..."
echo "$GREEN  ..."
sudo apt autoclean -y
echo "$GREEN ************************************************************"
echo "$GREEN     bereinige System von nutzlosen Paketen ..."
echo "$GREEN     deinstalliere alle automatisch installierten Pakete,"
echo "$GREEN     die keine Abhängigkeiten mehr zu anderen Paketen haben"
echo "$GREEN     und deshalb nicht mehr benötigt werden ..."
echo "$GREEN  ..."
sudo apt autoremove -y
echo "$GREEN ************************************************************"
#
echo "$CYAN ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "$CYAN +++++                                                  +++++"
echo "$CYAN +++++          Fertig ...                              +++++"
echo "$CYAN +++++                                                  +++++"
echo "$CYAN +++++          Viel Spaß mit ohne Games :)             +++++"
echo "$CYAN +++++                                                  +++++"
echo "$CYAN ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "$NORMAL"
