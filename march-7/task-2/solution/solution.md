# Commands

- https://hyperledger-fabric.readthedocs.io/en/release-2.2/deploy_chaincode.html

```bash

# Chaincode in Container kopieren
docker cp gpc-chaincode-1.0.2.tar.gz cli:/opt/gopath/src/github.com/hyperledger/fabric/peer/

docker exec -it cli bash

# Installieren auf peer0 für org1
peer lifecycle chaincode install gpc-chaincode-1.0.2.tar.gz
peer lifecycle chaincode queryinstalled

export CC_PACKAGE_ID=gpc-chaincode:5cc9e9ccc3b2aef75a523e0b1747075aa0c5855e633729d49ef689c06c90be21

# Approven für Org1
peer lifecycle chaincode approveformyorg -o orderer.example.com:7050 --channelID allarewelcome --name basic --version 1.0 --package-id $CC_PACKAGE_ID --sequence 1 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
peer lifecycle chaincode queryapproved -C allarewelcome -n basic

export CORE_PEER_LOCALMSPID="Org2MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp
export CORE_PEER_ADDRESS=peer0.org2.example.com:7051

# Installieren auf peer0 für org2
peer lifecycle chaincode install gpc-chaincode-1.0.2.tar.gz
peer lifecycle chaincode queryinstalled

# Approven für Org2
peer lifecycle chaincode approveformyorg -o orderer.example.com:7050 --channelID allarewelcome --name basic --version 1.0 --package-id $CC_PACKAGE_ID --sequence 1 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
peer lifecycle chaincode queryapproved -C allarewelcome -n basic

# In Channel committen
peer lifecycle chaincode checkcommitreadiness -C allarewelcome -n basic -v 1.0 --sequence 1
peer lifecycle chaincode commit -o orderer.example.com:7050 --channelID allarewelcome --name basic --version 1.0 --sequence 1 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt --peerAddresses peer0.org2.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt
peer lifecycle chaincode querycommitted -C allarewelcome -n basic
```
