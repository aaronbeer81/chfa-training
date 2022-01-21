#!/bin/bash

export FABRIC_CFG_PATH=${PWD}
export CHANNEL_NAME=allarewelcome

mkdir -p config
rm -fr config/*
rm -fr crypto-config/*

cryptogen generate --config=./crypto-config.yaml
if [ "$?" -ne 0 ]; then
  echo "Failed to generate crypto material..."
  exit 1
fi

configtxgen -profile TwoOrgOrdererGenesis -channelID system-channel -outputBlock ./config/genesis.block
if [ "$?" -ne 0 ]; then
  echo "Failed to generate orderer genesis block..."
  exit 1
fi

configtxgen -profile TwoOrgChannel -outputCreateChannelTx ./config/$CHANNEL_NAME.tx -channelID $CHANNEL_NAME
if [ "$?" -ne 0 ]; then
  echo "Failed to generate channel creation transaction..."
  exit 1
fi

configtxgen -profile TwoOrgChannel -outputAnchorPeersUpdate ./config/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP
if [ "$?" -ne 0 ]; then
  echo "Failed to generate anchor peer update for Org1MSP..."
  exit 1
fi

configtxgen -profile TwoOrgChannel -outputAnchorPeersUpdate ./config/Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP
if [ "$?" -ne 0 ]; then
  echo "Failed to generate anchor peer update for Org2MSP..."
  exit 1
fi