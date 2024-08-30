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
#sudo apt purge sol -y
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
echo "************************************************************"
echo "    Fertig ..."
echo " "
echo "    Viel Spaß mit ohne Games :)"
echo "************************************************************"
