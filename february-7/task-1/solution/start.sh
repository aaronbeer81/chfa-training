#!/bin/bash
#
# Copyright IBM Corp All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#

set -ev

# Set env vars
export CHANNEL_NAME=allarewelcome

docker-compose -f docker-compose.yml down

docker-compose -f docker-compose.yml up -d ca.org1.example.com orderer.example.com peer0.org1.example.com peer0.org2.example.com cli

# Wait for Hyperledger Fabric to start
# In case of errors when running later commands, issue export FABRIC_START_TIMEOUT=<larger number>
export FABRIC_START_TIMEOUT=15
sleep ${FABRIC_START_TIMEOUT}

# Create the application channel
ORDERER_TLS_CA=`docker exec cli  env | grep ORDERER_TLS_CA | cut -d'=' -f2`
docker exec cli peer channel create -o orderer.example.com:7050 -c $CHANNEL_NAME -f /etc/hyperledger/configtx/$CHANNEL_NAME.tx --tls --cafile $ORDERER_TLS_CA
# Join peer0.org1.example.com to the channel
docker exec cli peer channel join -b $CHANNEL_NAME.block

# execute the following commands in cli to join peer2:
docker exec -it cli bash
export CORE_PEER_ADDRESS=peer0.org2.example.com:7051
export CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/server.crt
export CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/server.key
export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp
export CORE_PEER_LOCALMSPID=Org2MSP
peer channel join -b $CHANNEL_NAME.block
exit
