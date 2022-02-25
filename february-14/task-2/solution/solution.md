Hier ist eine Liste mit kurzem beschrieb was für Befehle benötigt werden um die Aufgabe zu schaffen.

1. fabric-ca-server init -b caServerAdmin:AdminsRock //-b user:password
2. fabric-ca-server start -b caServerAdmin:AdminsRock //-b user:password
3. fabric-ca-client enroll -u http://caServerAdmin:AdminsRock@localhost:7054 //-u url
4. fabric-ca-client register --id.name Org1Administrator --id.affiliationorg1 --id.type admin --id.attrs 'hf.Registrar.Roles=peer,hf.GenCRL=true, admin=true:ecert, hf.Revoker=true' --id.secret Org1Rocks -u http://localhost:7054 //-id.name name, -id.affiliation identity affiliation, -id.type typ der Identity, -id.attrs comma-separated attributes, -id.secret secret of identity, -u url
5. fabric-ca-client enroll -u http://Org1Administrator:Org1Rocks@localhost:7054 -M $FABRIC_CA_HOME/msp/Org1Administrator //-u url, -M MSP
6. fabric-ca-client register --id.name peer1 \ --id.affiliation org1 --id.type peer \ --id.secret 'IAMAPEER!' \ -u http://Org1Administrator:Org1Rocks@localhost:7054 //--id.name name, -id.affilation identity affiliation, -id.secret secret, -u url
7. fabric-ca-client enroll -u http://peer1:'IAMAPEER!'@localhost:7054 -M $FABRIC_CA_HOME/msp/peer1 //-u url, -M MSP