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
#
echo "$CYAN "
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++                                                  +++++"
echo "+++++           NVIDIA Treiber installieren            +++++"
echo "+++++                                                  +++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "$NORMAL "
echo "$GREEN ************************************************************"
echo "    lese Paketdatenbank (Repository-Index) neu ein"
echo " ... $NORMAL"
sudo apt update
echo "$GREEN ************************************************************"
echo "    installiere nvidia-detect (falls nicht vorhanden) ..."
echo "    ... um herauszufinden, welche NVIDIA-Karte vorhanden ist ..."
echo " ... $NORMAL"
sudo apt install nvidia-detect -y
echo "$GREEN ************************************************************"
echo "$NORMAL "
echo "$CYAN "
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++                                                  +++++"
nvidia-detect
echo "+++++                                                  +++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "$NORMAL "
