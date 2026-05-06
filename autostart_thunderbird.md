### Um Thunderbird unter Debian automatisch zu starten, können Sie eine .desktop-Datei im Verzeichnis ~/.config/autostart erstellen. Diese Methode sorgt dafür, dass Thunderbird beim Anmelden automatisch geöffnet wird.
Schritte zur Erstellung einer .desktop-Datei

 - Öffnen Sie ein Terminal.
    - Erstellen Sie die .desktop-Datei:
        Geben Sie den folgenden Befehl ein, um die Datei zu erstellen:
      
        ```bash
        nano ~/.config/autostart/thunderbird.desktop
        ```
        
    - Fügen Sie den folgenden Inhalt in die Datei ein:
       ```plaintext
       [Desktop Entry]
       Type=Application
       Exec=thunderbird
       Hidden=false
       NoDisplay=false
       X-GNOME-Autostart-enabled=true
       Name=Thunderbird
       Comment=Startet Thunderbird beim Login
        ```
   - Speichern Sie die Datei und schließen Sie den Editor (bei nano: Strg + O, dann Enter, gefolgt von Strg + X).
