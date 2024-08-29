#!/bin/bash
BENUTZER=$USER
HOMEVERZEICHNIS=$HOME
MYSHELL=$SHELL
echo "Hallo $BENUTZER"
echo "Dein Home-Verzeichnis: $HOMEVERZEICHNIS"
echo "Deine Shell: $MYSHELL"
echo "************************************************************"
echo "    lese Paketdatenbank (Repository-Index) neu ein"
echo "    und finde defekte Pakete ..."
echo " ..."
sudo apt update --fix-missing
echo "************************************************************"
echo "    alle vorhandene defekte Paketen finden und reparieren ..."
echo " ..."
sudo apt install -f
echo "************************************************************"
echo "    lese Paketdatenbank (Repository-Index) neu ein"
echo " ..."
sudo apt update
echo "************************************************************"
echo "    Installierte Pakete werden auf eine neuere Version aktualisiert ..."
echo "    ... um geänderte Abhängigkeiten zu erfüllen,"
echo "    werden ge­ge­be­nen­falls auch neue Pakete installiert ..."
echo " ..."
sudo apt upgrade -y
echo "************************************************************"
echo "    neue Pakete werden installiert ..."
echo "    und durch neue Abhängigkeiten unnötig gewordene Pakete ersetzt,"
echo "    auch wenn dies alte Abhängigkeiten beeinflusst ..."
echo " ..."
sudo apt dist-upgrade -y
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
echo "    Flatpak update ..."
echo "    alle installierten Flatpak-Anwendungen und Runtimes"
echo "    werden auf die neueste Version aktualisiert ..."
echo " ..."
sudo flatpak update -y
echo "************************************************************"
echo " "
echo "    Fertig ..."
echo " "
echo " "
echo "    Viel Spaß mit deinem aktuellen System :)"
echo " "
echo "************************************************************"
