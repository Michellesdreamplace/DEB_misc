### Um Thunderbird unter Debian automatisch zu starten, können Sie eine .desktop-Datei im Verzeichnis ~/.config/autostart erstellen. Diese Methode sorgt dafür, dass Thunderbird beim Anmelden automatisch geöffnet wird.
Schritte zur Erstellung einer .desktop-Datei

 - Öffne ein Terminal.
    - Erstelle die .desktop-Datei:
        Gib den folgenden Befehl ein, um die Datei zu erstellen:
      
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

&nbsp;
&nbsp;
&nbsp;
&nbsp;

----------------------

&nbsp;
&nbsp;
&nbsp;
&nbsp;

### Thunderbird unter Debian (xfce / x11) automatisch minimiert zu starten:

 - Öffne ein Terminal.
    - Installiere wmctrl:
      ```bash
      sudo apt update && sudo apt install wmctrl
      ```

    - Erstelle die .desktop-Datei:
      ```bash
      nano ~/.config/autostart/thunderbird.desktop
      ```

    - Ersetze den Inhalt von ~/.config/autostart/thunderbird.desktop durch folgendes (XFCE auf X11):
    ```plaintext
    [Desktop Entry]
    Type=Application
    Exec=sh -c 'thunderbird & sleep 3; wmctrl -x -r "thunderbird.Thunderbird" -b add,hidden'
    Hidden=false
    NoDisplay=false
    X-GNOME-Autostart-enabled=true
    Name=Thunderbird
    Comment=Startet Thunderbird beim Login (minimiert)
    ```

  #### Erläuterungen / Anpassungen:
  
  - sleep 3 gibt Thunderbird Zeit zum Starten; bei langsamer Maschine erhöhen.
  - wmctrl -x sucht nach Fensterklasse "thunderbird.Thunderbird". Falls das nicht trifft, teste mit wmctrl -l -x nach dem Starten von Thunderbird, suche die exakte Klasse/Bezeichnung und ersetze den String.
      ```bash
      wmctrl -l -x
      ```
  - Statt add,hidden kannst du add,shaded (gedockt) oder -b remove,hidden zum Wiederherstellen verwenden.
  - Funktioniert unter X11 in XFCE; nicht für Wayland.

&nbsp;
&nbsp;
&nbsp;
&nbsp;

----------------------

&nbsp;
&nbsp;
&nbsp;
&nbsp;

### Optional: Alternative mit xdotool (falls wmctrl Probleme macht)

 - Öffne ein Terminal.
    - Installiere xdotool:
    ```bash
    sudo apt update && sudo apt install xdotool
    ```

- Ersetze den Inhalt von ~/.config/autostart/thunderbird.desktop durch folgendes (XFCE auf X11):
    ```plaintext
    [Desktop Entry]
    Type=Application
    Exec=sh -c 'thunderbird & sleep 3; wid=$(xdotool search --class Thunderbird | head -n1); [ -n "$wid" ] && xdotool windowminimize $wid'
    Hidden=false
    NoDisplay=false
    X-GNOME-Autostart-enabled=true
    Name=Thunderbird
    Comment=Startet Thunderbird beim Login (minimiert)
    ```      
