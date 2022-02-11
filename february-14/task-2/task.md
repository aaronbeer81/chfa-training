In dieser Aufgabe geht es darum die Befehle zu widerholen welche gebraucht werden um auf dem CA einen Peer zu registrieren.

Tipps:
- docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Command}}" //Befehl um alle Docker Container aufzulisten
- docker exec -it ca.org1.example.com bash //connecten auf container

1. CA initialisieren und anschliessend starten
2. CA Admin enrollen
3. Organization1 registrieren & enrollen
4. Peer1 registrieren und enrollen

