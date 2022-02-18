docker exec ca.org1.example.com fabric-ca-client enroll -u http://admin:adminpw@localhost:7054
docker exec ca.org1.example.com fabric-ca-client register --id.name peer1 --id.affiliation org2 --id.type admin --id.secret peer1pw -u http://localhost:7054 &> /dev/null
docker exec ca.org1.example.com fabric-ca-client enroll -u http://peer1:peer1pw@localhost:7054 -M /etc/hyperledger/fabric-ca-server/msp/peer1 &> /dev/null
docker exec ca.org1.example.com fabric-ca-client register --id.name peer2 --id.affiliation org1 --id.type peer --id.secret 12345 -u http://localhost:7054 &> /dev/null
docker exec ca.org1.example.com fabric-ca-client enroll -u http://peer2:12345@localhost:7054 -M /etc/hyperledger/fabric-ca-server/msp/peer2 &> /dev/null