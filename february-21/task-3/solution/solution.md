# Peer0
Fehlermeldung:
WARN 001 Failed loading ClientOU certificate at [/etc/hyperledger/fabric/msp/cacerts/ca.org1.example.com-cert.pem]: [could not read file /etc/hyperledger/fabric/msp/cacerts/ca.org1.example.com-cert.pem: open /etc/hyperledger/fabric/msp/cacerts/ca.org1.example.com-cert.pem: no such file or directory]

Dem Peer fehlt das ca Zerti in
./crypto-config\peerOrganizations\org1.example.com\peers\peer1.org1.example.com\msp\cacerts
Da es sich um das CA-Zerti handelt, kopierst du es am besten vom Original
./crypto-config\peerOrganizations\org1.example.com\ca
Natürlich kannst du es aber auch vom Peer1 kopieren, da es ja immer dasselbe ist.


# Peer1
Fehlermeldung:
WARN 024 access denied: channel the supplied identity is not valid: x509: certificate signed by unknown authority channel= txID=9e638263

Im fehlerhaften docker-compose.yml, Zeile 236, wurde das Verzeichnis welches das CA-Zerti beinhaltet nicht gemountet.
