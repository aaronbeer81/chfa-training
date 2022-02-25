# Lösungsvariante
Da meines Wissens auf dem CA-Container kein Editor installiert werden kann, ist eine geeignete Möglichkeit, das File auf den Host zu kopieren. Dort kann es mit dem Editor der Wahl bearbeitet und anschliessend wieder in den Container kopiert werden.

Der Command um das File auf den Host zu kopieren sieht folgendermassen aus:
`docker cp ca.org1.example.com:/etc/hyperledger/fabric-ca-server/fabric-ca-server-config.yaml .`

Das Kopieren in die andere Richtung kann mit folgendem Befehl gemacht werden:
`docker cp fabric-ca-server-config.yaml ca.org1.example.com:/etc/hyperledger/fabric-ca-server/fabric-ca-server`
