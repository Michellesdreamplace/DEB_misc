#!/bin/bash
BENUTZER=$USER
HOMEVERZEICHNIS=$HOME
MYSHELL=$SHELL
echo "Hallo $BENUTZER"
echo "Dein Home-Verzeichnis: $HOMEVERZEICHNIS"
echo "Deine Shell: $MYSHELL"
echo "************************************************************"
echo "    lese Paketdatenbank (Repository-Index) neu ein"
echo " ..."
sudo apt update
echo "************************************************************"
#
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++                                                  +++++"
echo "+++++        bereinige System von Gnome-Spielen        +++++"
echo "+++++                                                  +++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#
sudo apt purge gnome-2048 -y
echo "************************************************************"
sudo apt purge aisleriot -y
echo "************************************************************"
sudo apt purge sol -y
echo "************************************************************"
sudo apt purge five-or-more -y
echo "************************************************************"
sudo apt purge hitori -y
echo "************************************************************"
sudo apt purge gnome-klotski -y
echo "************************************************************"
sudo apt purge lightsoff -y
echo "************************************************************"
sudo apt purge gnome-mahjongg -y
echo "************************************************************"
sudo apt purge gnome-mines -y
echo "************************************************************"
sudo apt purge gnome-nibbles -y
echo "************************************************************"
sudo apt purge quadrapassel -y
echo "************************************************************"
sudo apt purge iagno -y
echo "************************************************************"
sudo apt purge gnome-robots -y
echo "************************************************************"
sudo apt purge gnome-chess -y
echo "************************************************************"
sudo apt purge gnome-sudoku -y
echo "************************************************************"
sudo apt purge swell-foop -y
echo "************************************************************"
sudo apt purge tali -y
echo "************************************************************"
sudo apt purge gnome-taquin -y
echo "************************************************************"
sudo apt purge gnome-tetravex -y
echo "************************************************************"
sudo apt purge four-in-a-row -y
echo "************************************************************"
#
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++                                                  +++++"
echo "+++++               bereinige ...                      +++++"
echo "+++++                                                  +++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "************************************************************"
echo "    lese Paketdatenbank (Repository-Index) neu ein"
echo " ..."
sudo apt update
echo "************************************************************"
echo "    lösche bereits heruntergeladenen Installationsdateien ..."
echo "    aus dem Paket-Cache /var/cache/apt/archives/ "
echo "    und gebe so Festplattenspeicher frei ..."
echo " ..."
sudo apt clean -y
echo "************************************************************"
echo "    lösche alle heruntergeladenen Paketinstallationsdateien,"
echo "    die aktuell nicht mehr in den Quellen verfügbar sind ..."
echo " ..."
sudo apt autoclean -y
echo "************************************************************"
echo "    bereinige System von nutzlosen Paketen ..."
echo "    deinstalliere alle automatisch installierten Pakete,"
echo "    die keine Abhängigkeiten mehr zu anderen Paketen haben"
echo "    und deshalb nicht mehr benötigt werden ..."
echo " ..."
sudo apt autoremove -y
echo "************************************************************"
#
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++                                                  +++++"
echo "+++++          Fertig ...                              +++++"
echo "+++++                                                  +++++"
echo "+++++          Viel Spaß mit ohne Games :)             +++++"
echo "+++++                                                  +++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
