# Vorarbeit
Starte das Netzwerk mit dem `start.sh` Script, welches du im Unterordner `/resources` findest.
Anschliessend verbindest du dich mit dem Befehl `docker exec -it ca.org1.example.com bash` in den Ca-Org1-Container.
Im Container führst du den Befehl `fabric-ca-server init -b admin:adminpw` aus, damit der Fabric-Ca-Server initialisert wird.

# Aufgabe
Beim initialisieren (übrigens auch beim start) wurde die Datei `fabric-ca-server-config.yaml` generiert.
Finde diese Datei und ändere den Wert der Attribute `ca.keyfile` und `ca.certfile` auf die entsprechenden Zertifikate der CA.
