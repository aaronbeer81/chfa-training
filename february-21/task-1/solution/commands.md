# Lösung
Die gesamte Aufgabe kann im CA-Container gelöst werden.

Deshalb lautet meine Lösungsvariante folgendermassen:
- `docker exec -it ca.org1.example.com bash`
- `fabric-ca-client identity list` (optional)
- `fabric-ca-client identity modify peer1 --type peer --affiliation org1` (kann auch separat in zwei Befehlen geändert werden)
- `fabric-ca-client identity modify peer2 --secret peer2pw`
- `fabric-ca-client enroll -u http://peer1:peer1pw@localhost:7054 -M /etc/hyperledger/fabric-ca-server/msp/peer1`
- `fabric-ca-client enroll -u http://peer2:peer2pw@localhost:7054 -M /etc/hyperledger/fabric-ca-server/msp/peer2`
