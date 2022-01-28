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

docker-compose -f docker-compose.yml up -d ca.org1.example.com orderer.example.com peer0.org1.example.com peer1.org1.example.com cli

