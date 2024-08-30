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
echo "    lese Paketdatenbank (Repository-Index) neu ein"
echo "    und finde defekte Pakete ..."
echo " ... $NORMAL"
sudo apt update --fix-missing
echo "$GREEN ************************************************************"
echo "    alle vorhandene defekte Paketen finden und reparieren ..."
echo " ... $NORMAL"
sudo apt install -f
echo "$GREEN ************************************************************"
echo "    lese Paketdatenbank (Repository-Index) neu ein"
echo " ... $NORMAL"
sudo apt update
echo "$GREEN ************************************************************"
echo "    Installierte Pakete werden auf eine neuere Version aktualisiert ..."
echo "    ... um geänderte Abhängigkeiten zu erfüllen,"
echo "    werden ge­ge­be­nen­falls auch neue Pakete installiert ..."
echo " ... $NORMAL"
sudo apt upgrade -y
echo "$GREEN ************************************************************"
echo "    neue Pakete werden installiert ..."
echo "    und durch neue Abhängigkeiten unnötig gewordene Pakete ersetzt,"
echo "    auch wenn dies alte Abhängigkeiten beeinflusst ..."
echo " ... $NORMAL"
sudo apt dist-upgrade -y
# sudo apt full-upgrade -y	# löst das gleiche aus
echo "$GREEN ************************************************************"
echo "    lösche bereits heruntergeladenen Installationsdateien ..."
echo "    aus dem Paket-Cache /var/cache/apt/archives/ "
echo "    und gebe so Festplattenspeicher frei ..."
echo " ... $NORMAL"
sudo apt clean -y
echo "$GREEN ************************************************************"
echo "    lösche alle heruntergeladenen Paketinstallationsdateien,"
echo "    die aktuell nicht mehr in den Quellen verfügbar sind ..."
echo " ... $NORMAL"
sudo apt autoclean -y
echo "$GREEN ************************************************************"
echo "    bereinige System von nutzlosen Paketen ..."
echo "    deinstalliere alle automatisch installierten Pakete,"
echo "    die keine Abhängigkeiten mehr zu anderen Paketen haben"
echo "    und deshalb nicht mehr benötigt werden ..."
echo " ... $NORMAL"
sudo apt autoremove -y
echo "$GREEN ************************************************************"
#
# ------------------------------------------------------------------------------------------
#
echo "$CYAN ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "$CYAN +++++                                                  +++++"
echo "$CYAN +++++               APTs installieren                  +++++"
echo "$CYAN +++++                                                  +++++"
echo "$CYAN ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ $NORMAL"
#
echo "$GREEN ************************************************************"
echo "*** Installiere Flatpak ... ********************************"
echo "************************************************************ $NORMAL"
sudo apt install flatpak -y
echo "$GREEN ************************************************************"
echo "*** Installiere Gnome-Software-Plugin ... ******************"
echo "************************************************************ $NORMAL"
sudo apt install flatpak gnome-software-plugin-flatpak -y
echo "$GREEN ************************************************************"
echo "*** Füge das Flathub-Repository hinzu ... ******************"
echo "************************************************************ $NORMAL"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "$GREEN ************************************************************"
echo "*** Aktualisiere Flatpak ... *******************************"
echo "************************************************************ $NORMAL"
sudo flatpak update -y
echo "$GREEN ************************************************************"
echo "*** installiere Anmeldefenster <LightDM>  ... **************"
echo "************************************************************ $NORMAL"
sudo apt install lightdm-settings -y
echo "$GREEN ************************************************************"
echo "*** installiere allgemeine Softwareeigenschaften (GRUB) ****"
echo "************************************************************ $NORMAL"
sudo apt install software-properties-common -y
echo "$GREEN ************************************************************"
echo "*** füge das Grub Customizer PPA hinzu *********************"
echo "************************************************************ $NORMAL"
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
echo "$GREEN ************************************************************"
echo "*** lese Paketdatenbank (Repository-Index) neu ein *********"
echo "************************************************************ $NORMAL"
sudo apt update
echo "$GREEN ************************************************************"
echo "*** installiere GRUB-Customizer ... ************************"
echo "************************************************************ $NORMAL"
sudo apt install grub-customizer -y
echo "$GREEN ************************************************************"
echo "*** installiere Netfilter-FIREWALL & GUI ... ***************"
echo "************************************************************ $NORMAL"
sudo apt install ufw -y
sudo apt install gufw -y
echo "$GREEN ************************************************************"
echo "*** installiere git ... *******************************"
echo "************************************************************ $NORMAL"
sudo apt install git -y
echo "$GREEN ************************************************************"
echo "*** installiere Neofetch ... *******************************"
echo "************************************************************ $NORMAL"
sudo apt install neofetch -y
echo "$GREEN ************************************************************"
echo "*** installiere screenfetch ... ****************************"
echo "************************************************************ $NORMAL"
sudo apt install screenfetch -y
echo "$GREEN ************************************************************"
echo "*** installiere htop ... ***********************************"
echo "************************************************************ $NORMAL"
sudo apt install htop -y
echo "$GREEN ************************************************************"
echo "*** installiere arc-Theme ... ******************************"
echo "************************************************************ $NORMAL"
sudo apt install arc-theme -y
echo "$GREEN ************************************************************"
echo "*** installiere papirus-icon-Theme ... *********************"
echo "************************************************************ $NORMAL"
sudo apt install papirus-icon-theme -y
sudo gtk-update-icon-cache /usr/share/icons/Papirus/
sudo gtk-update-icon-cache /usr/share/icons/Papirus-Dark/
sudo gtk-update-icon-cache /usr/share/icons/Papirus-Light/
echo "$GREEN ************************************************************"
echo "*** installiere greybird-gtk-theme *************************"
echo "************************************************************ $NORMAL"
sudo apt install greybird-gtk-theme -y
echo "$GREEN ************************************************************"
echo "*** installiere elementary-xfce-icon-theme *****************"
echo "************************************************************ $NORMAL"
sudo apt install elementary-xfce-icon-theme -y
echo "$GREEN ************************************************************"
echo "*** installiere breeze-cursor-theme ************************"
echo "************************************************************ $NORMAL"
sudo apt install breeze-cursor-theme -y
echo "$GREEN ************************************************************"
echo "*** installiere Microsoft Schriftarten für Kompatibilität **"
echo "************************************************************ $NORMAL"
sudo apt install ttf-mscorefonts-installer -y
echo "$GREEN ************************************************************"
echo "*** installiere tar ... ************************************"
echo "************************************************************ $NORMAL"
sudo apt install tar -y
echo "$GREEN ************************************************************"
echo "*** installiere rar & unrar ... ****************************"
echo "************************************************************ $NORMAL"
sudo apt install rar -y
sudo apt install unrar -y
echo "$GREEN ************************************************************"
echo "*** installiere FFmpeg-Bibliothek mit zusätzlichen Codecs **"
echo "************************************************************ $NORMAL"
sudo apt install libavcodec-extra -y
echo "$GREEN ************************************************************"
echo "*** installiere GStreamer - FFmpeg-Plugin **"
echo "************************************************************ $NORMAL"
sudo apt install gstreamer1.0-libav -y
echo "$GREEN ************************************************************"
echo "*** installiere GStreamer-Erweiterungen »ugly«-Sammlung ...*"
echo "************************************************************ $NORMAL"
sudo apt install gstreamer1.0-plugins-ugly -y
echo "$GREEN ************************************************************"
echo "*** installiere VA-API plugins for GStreamer ...************"
echo "************************************************************ $NORMAL"
sudo apt install gstreamer1.0-vaapi -y
echo "$GREEN ************************************************************"
echo "*** installiere Nextcloud Client ... ***********************"
echo "************************************************************ $NORMAL"
sudo apt install nextcloud-desktop -y
echo "$GREEN ************************************************************"
echo "*** installiere Element.io (Matrix) ... ********************"
echo "************************************************************ $NORMAL"
sudo apt install -y wget apt-transport-https
sudo wget -O /usr/share/keyrings/element-io-archive-keyring.gpg https://packages.element.io/debian/element-io-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main" | sudo tee /etc/apt/sources.list.d/element-io.list
sudo apt update
sudo apt install element-desktop -y
echo "$GREEN ************************************************************"
echo "*** installiere Thunderbird + deutsches Sprachpaket ... ****"
echo "************************************************************ $NORMAL"
sudo apt install thunderbird -y
sudo apt install thunderbird-l10n-de -y
echo "$GREEN ************************************************************"
echo "*** installiere KeePassXC ... ******************************"
echo "************************************************************ $NORMAL"
sudo apt install keepassxc -y
echo "$GREEN ************************************************************"
echo "*** installiere Visual Studio Code ... *********************"
echo "************************************************************ $NORMAL"
echo "$GREEN installiere Paketabhängigkeiten für den ordnungsgemäßen Betrieb von vscode... $NORMAL"
sudo apt install software-properties-common apt-transport-https wget -y
echo "$GREEN importiere GPG-Schlüssel von Microsoft, um die Paketintegrität zu überprüfen... $NORMAL"
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
echo "$GREEN füge das Visual Studio Code-Repository hinzu... $NORMAL"
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
echo "$GREEN installiere VSCode... $NORMAL"
sudo apt install code -y
#
# ------------------------------------------------------------------------------------------
#
echo "$CYAN ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "$CYAN +++++                                                  +++++"
echo "$CYAN +++++               GITs installieren                  +++++"
echo "$CYAN +++++                                                  +++++"
echo "$CYAN ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ $NORMAL"
#
echo "$GREEN ************************************************************"
echo "    klone Hintergrundbilder von GitHub ..."
echo " ... $NORMAL"
sudo git clone https://github.com/Michellesdreamplace/DEB_Wallpaper.git $HOMEVERZEICHNIS/Downloads/MDP_DEB_Wallpaper/
echo "$GREEN ************************************************************"
echo "    entpacke Hintergrundbilder in globalen Freigabeordner ..."
echo " ... $NORMAL"
sudo tar -xzf $HOMEVERZEICHNIS/Downloads/MDP_DEB_Wallpaper/MDP_Wallpaper.tar.gz -C /usr/share/images/desktop-base/
echo "$GREEN ************************************************************"
echo "    aufräumen ..."
echo " ... $NORMAL"
sudo rm -r $HOMEVERZEICHNIS/Downloads/MDP_DEB_Wallpaper
echo "$GREEN ************************************************************ $NORMAL"
#
echo "$GREEN ************************************************************"
echo "    klone Icon-Themes von GitHub ..."
echo " ... $NORMAL"
sudo git clone https://github.com/Michellesdreamplace/DEB_Icon_Theme.git $HOMEVERZEICHNIS/Downloads/MDP_DEB_Icon_Theme/
echo "$GREEN ************************************************************"
echo "    entpacke Icon-Themes in globalen Freigabeordner ..."
echo " ... $NORMAL"
sudo tar -xzf $HOMEVERZEICHNIS/Downloads/MDP_DEB_Icon_Theme/Icon_Theme.tar.gz -C /usr/share/icons/
echo "$GREEN ************************************************************"
echo "    aufräumen ..."
echo " ... $NORMAL"
sudo rm -r $HOMEVERZEICHNIS/Downloads/MDP_DEB_Icon_Theme
echo "$GREEN ************************************************************ $NORMAL"
#
echo "$GREEN ************************************************************"
echo "    klone Schriftarten von GitHub ..."
echo " ... $NORMAL"
sudo git clone https://github.com/Michellesdreamplace/DEB_Fonts.git $HOMEVERZEICHNIS/Downloads/MDP_DEB_Fonts/
echo "$GREEN ************************************************************"
echo "    entpacke Schriftarten in globalen Freigabeordner ..."
echo " ... $NORMAL"
sudo tar -xzf $HOMEVERZEICHNIS/Downloads/MDP_DEB_Fonts/MDP_Fonts.tar.gz -C /usr/share/fonts/
echo "$GREEN ************************************************************"
echo "    aufräumen ..."
echo " ... $NORMAL"
sudo rm -r $HOMEVERZEICHNIS/Downloads/MDP_DEB_Fonts
echo "$GREEN ************************************************************ $NORMAL"
#
# ------------------------------------------------------------------------------------------
#
echo "$CYAN ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "$CYAN +++++                                                  +++++"
echo "$CYAN +++++               FLATPAKs installieren              +++++"
echo "$CYAN +++++                                                  +++++"
echo "$CYAN ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ $NORMAL"
#
echo "$GREEN ************************************************************"
echo "*** installiere Flatseal ... ***********************"
echo "************************************************************ $NORMAL"
sudo flatpak install flathub com.github.tchx84.Flatseal -y
echo "$GREEN ************************************************************ $NORMAL"
#
# ---------- WIP ----------
#
echo "$CYAN ************************************************************"
echo "$CYAN     Fertig ..."
echo "$CYAN ************************************************************"
neofetch
echo "$CYAN ************************************************************"
echo "$CYAN     Viel Spaß mit deinem System :)"
echo "$CYAN ************************************************************ $NORMAL"
