docker exec ca.org1.example.com fabric-ca-server init -b admin:adminpw
docker exec ca.org1.example.com fabric-ca-server start -b admin:adminpw
docker exec ca.org1.example.com fabric-ca-client enroll -u http://admin:adminpw@localhost:7054
docker exec ca.org1.example.com fabric-ca-client register --id.name Org1Administrator --id.affiliation org1 --id.type admin --id.attrs 'hf.Registrar.Roles=peer,hf.GenCRL=true, admin=true:ecert, hf.Revoker=true' --id.secret Org1Rocks -u http://localhost:7054
docker exec ca.org1.example.com fabric-ca-client enroll -u http://Org1Administrator:Org1Rocks@localhost:7054 -M $FABRIC_CA_HOME/msp/Org1Administrator
docker exec ca.org1.example.com fabric-ca-client register --id.name peer1 \--id.affiliation org1 --id.type peer \--id.secret 'IAMAPEER!' \-u http://Org1Administrator:Org1Rocks@localhost:7054
docker exec ca.org1.example.com fabric-ca-client enroll -u http://peer1:'IAMAPEER!'@localhost:7054 -M $FABRIC_CA_HOME/msp/peer1