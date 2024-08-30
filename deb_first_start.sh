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
# sudo apt full-upgrade -y	# löst das gleiche aus
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
# ------------------------------------------------------------------------------------------
#
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++                                                  +++++"
echo "+++++               APTs installieren                  +++++"
echo "+++++                                                  +++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#
echo "************************************************************"
echo "*** Installiere Flatpak ... ********************************"
echo "************************************************************"
sudo apt install flatpak -y
echo "************************************************************"
echo "*** Installiere Gnome-Software-Plugin ... ******************"
echo "************************************************************"
sudo apt install flatpak gnome-software-plugin-flatpak -y
echo "************************************************************"
echo "*** Füge das Flathub-Repository hinzu ... ******************"
echo "************************************************************"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "************************************************************"
echo "*** Aktualisiere Flatpak ... *******************************"
echo "************************************************************"
sudo flatpak update -y
echo "************************************************************"
echo "*** installiere Anmeldefenster <LightDM>  ... **************"
echo "************************************************************"
sudo apt install lightdm-settings -y
echo "************************************************************"
echo "*** installiere allgemeine Softwareeigenschaften (GRUB) ****"
echo "************************************************************"
sudo apt install software-properties-common -y
echo "************************************************************"
echo "*** füge das Grub Customizer PPA hinzu *********************"
echo "************************************************************"
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
echo "************************************************************"
echo "*** lese Paketdatenbank (Repository-Index) neu ein *********"
echo "************************************************************"
sudo apt update
echo "************************************************************"
echo "*** installiere GRUB-Customizer ... ************************"
echo "************************************************************"
sudo apt install grub-customizer -y
echo "************************************************************"
echo "*** installiere Netfilter-FIREWALL & GUI ... ***************"
echo "************************************************************"
sudo apt install ufw -y
sudo apt install gufw -y
echo "************************************************************"
echo "*** installiere git ... *******************************"
echo "************************************************************"
sudo apt install git -y
echo "************************************************************"
echo "*** installiere Neofetch ... *******************************"
echo "************************************************************"
sudo apt install neofetch -y
echo "************************************************************"
echo "*** installiere screenfetch ... ****************************"
echo "************************************************************"
sudo apt install screenfetch -y
echo "************************************************************"
echo "*** installiere htop ... ***********************************"
echo "************************************************************"
sudo apt install htop -y
echo "************************************************************"
echo "*** installiere arc-Theme ... ******************************"
echo "************************************************************"
sudo apt install arc-theme -y
echo "************************************************************"
echo "*** installiere papirus-icon-Theme ... *********************"
echo "************************************************************"
sudo apt install papirus-icon-theme -y
sudo gtk-update-icon-cache /usr/share/icons/Papirus/
sudo gtk-update-icon-cache /usr/share/icons/Papirus-Dark/
sudo gtk-update-icon-cache /usr/share/icons/Papirus-Light/
echo "************************************************************"
echo "*** installiere greybird-gtk-theme *************************"
echo "************************************************************"
sudo apt install greybird-gtk-theme -y
echo "************************************************************"
echo "*** installiere elementary-xfce-icon-theme *****************"
echo "************************************************************"
sudo apt install elementary-xfce-icon-theme -y
echo "************************************************************"
echo "*** installiere breeze-cursor-theme ************************"
echo "************************************************************"
sudo apt install breeze-cursor-theme -y
echo "************************************************************"
echo "*** installiere Microsoft Schriftarten für Kompatibilität **"
echo "************************************************************"
sudo apt install ttf-mscorefonts-installer -y
echo "************************************************************"
echo "*** installiere tar ... ************************************"
echo "************************************************************"
sudo apt install tar -y
echo "************************************************************"
echo "*** installiere rar & unrar ... ****************************"
echo "************************************************************"
sudo apt install rar -y
sudo apt install unrar -y
echo "************************************************************"
echo "*** installiere FFmpeg-Bibliothek mit zusätzlichen Codecs **"
echo "************************************************************"
sudo apt install libavcodec-extra -y
echo "************************************************************"
echo "*** installiere GStreamer - FFmpeg-Plugin **"
echo "************************************************************"
sudo apt install gstreamer1.0-libav -y
echo "************************************************************"
echo "*** installiere GStreamer-Erweiterungen »ugly«-Sammlung ...*"
echo "************************************************************"
sudo apt install gstreamer1.0-plugins-ugly -y
echo "************************************************************"
echo "*** installiere VA-API plugins for GStreamer ...************"
echo "************************************************************"
sudo apt install gstreamer1.0-vaapi -y
echo "************************************************************"
echo "*** installiere Nextcloud Client ... ***********************"
echo "************************************************************"
sudo apt install nextcloud-desktop -y
echo "************************************************************"
echo "*** installiere Element.io (Matrix) ... ********************"
echo "************************************************************"
sudo apt install -y wget apt-transport-https
sudo wget -O /usr/share/keyrings/element-io-archive-keyring.gpg https://packages.element.io/debian/element-io-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main" | sudo tee /etc/apt/sources.list.d/element-io.list
sudo apt update
sudo apt install element-desktop -y
echo "************************************************************"
echo "*** installiere Thunderbird + deutsches Sprachpaket ... ****"
echo "************************************************************"
sudo apt install thunderbird -y
sudo apt install thunderbird-l10n-de -y
echo "************************************************************"
echo "*** installiere KeePassXC ... ******************************"
echo "************************************************************"
sudo apt install keepassxc -y
echo "************************************************************"
#
# ------------------------------------------------------------------------------------------
#
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++                                                  +++++"
echo "+++++               GITs installieren                  +++++"
echo "+++++                                                  +++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#
echo "************************************************************"
echo "    klone Hintergrundbilder von GitHub ..."
echo " ..."
sudo git clone https://github.com/Michellesdreamplace/DEB_Wallpaper.git $HOMEVERZEICHNIS/Downloads/MDP_DEB_Wallpaper/
echo "************************************************************"
echo "    entpacke Hintergrundbilder in globalen Freigabeordner ..."
echo " ..."
sudo tar -xzf $HOMEVERZEICHNIS/Downloads/MDP_DEB_Wallpaper/MDP_Wallpaper.tar.gz -C /usr/share/images/desktop-base/
echo "************************************************************"
echo "    aufräumen ..."
echo " ..."
sudo rm -r $HOMEVERZEICHNIS/Downloads/MDP_DEB_Wallpaper
echo "************************************************************"
#
echo "************************************************************"
echo "    klone Icon-Themes von GitHub ..."
echo " ..."
sudo git clone https://github.com/Michellesdreamplace/DEB_Icon_Theme.git $HOMEVERZEICHNIS/Downloads/MDP_DEB_Icon_Theme/
echo "************************************************************"
echo "    entpacke Icon-Themes in globalen Freigabeordner ..."
echo " ..."
sudo tar -xzf $HOMEVERZEICHNIS/Downloads/MDP_DEB_Icon_Theme/Icon_Theme.tar.gz -C /usr/share/icons/
echo "************************************************************"
echo "    aufräumen ..."
echo " ..."
sudo rm -r $HOMEVERZEICHNIS/Downloads/MDP_DEB_Icon_Theme
echo "************************************************************"
#
echo "************************************************************"
echo "    klone Schriftarten von GitHub ..."
echo " ..."
sudo git clone https://github.com/Michellesdreamplace/DEB_Fonts.git $HOMEVERZEICHNIS/Downloads/MDP_DEB_Fonts/
echo "************************************************************"
echo "    entpacke Schriftarten in globalen Freigabeordner ..."
echo " ..."
sudo tar -xzf $HOMEVERZEICHNIS/Downloads/MDP_DEB_Fonts/MDP_Fonts.tar.gz -C /usr/share/fonts/
echo "************************************************************"
echo "    aufräumen ..."
echo " ..."
sudo rm -r $HOMEVERZEICHNIS/Downloads/MDP_DEB_Fonts
echo "************************************************************"
#
# ------------------------------------------------------------------------------------------
#
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++                                                  +++++"
echo "+++++               FLATPAKs installieren              +++++"
echo "+++++                                                  +++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#
# ---------- WIP ----------
#
echo "************************************************************"
echo "    Fertig ..."
echo "************************************************************"
neofetch
echo "************************************************************"
echo "    Viel Spaß mit deinem System :)"
echo "************************************************************"
