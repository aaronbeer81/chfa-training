# Solution
The solution is adapted from the official [Channel Update Tutorial](https://hyperledger-fabric.readthedocs.io/en/release-2.2/channel_update_tutorial.html#updating-the-channel-config-to-include-an-org3-anchor-peer-optional).

Possible Pitfall:
- The tutorial states regarding _Updating the Channel Config to include an OrgX Anchor Peer_:
  
  > Since this is only an update to OrgX we only need to have OrgX sign off on the update.
  
  That means we have to adjust env vars `CORE_PEER_LOCALMSPID` and `CORE_PEER_MSPCONFIGPATH` to point to Org2,
  since the `peer` binary takes them into account when executing the `peer channel update` command. 

```sh
docker exec -it cli /bin/bash

mkdir -p channel-artifacts

peer channel fetch config channel-artifacts/config_block.pb \
  -o orderer.example.com:7050 \
  -c allarewelcome \
  --tls \
  --cafile $ORDERER_TLS_CA

cd channel-artifacts

configtxlator proto_decode \
  --input config_block.pb \
  --type common.Block \
  --output config_block.json

jq .data.data[0].payload.data.config config_block.json > config.json
jq '.channel_group.groups.Application.groups.Org2MSP.values += {"AnchorPeers":{"mod_policy": "Admins","value":{"anchor_peers": [{"host": "peer0.org2.example.com","port": 7051},{"host": "peer1.org2.example.com","port": 7051}]},"version": "0"}}' config.json > modified_anchor_config.json

configtxlator proto_encode \
  --input config.json \
  --type common.Config \
  --output config.pb

configtxlator proto_encode \
  --input modified_anchor_config.json \
  --type common.Config \
  --output modified_anchor_config.pb

configtxlator compute_update \
  --channel_id allarewelcome \
  --original config.pb \
  --updated modified_anchor_config.pb \
  --output anchor_update.pb

configtxlator proto_decode \
  --input anchor_update.pb \
  --type common.ConfigUpdate \
  --output anchor_update.json

echo '{"payload":{"header":{"channel_header":{"channel_id":"allarewelcome", "type":2}},"data":{"config_update":'$(cat anchor_update.json)'}}}' | jq . > anchor_update_in_envelope.json

configtxlator proto_encode \
  --input anchor_update_in_envelope.json \
  --type common.Envelope \
  --output anchor_update_in_envelope.pb

env | sort

export CORE_PEER_LOCALMSPID=Org2MSP
export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp

peer channel update \
  -f anchor_update_in_envelope.pb \
  -c allarewelcome \
  -o orderer.example.com:7050 \
  --tls \
  --cafile $ORDERER_TLS_CA

exit

docker logs \
  -f peer0.org1.example.com
```

## Commands to remember
- `env | sort`
- `peer channel fetch config`
- `configtxlator proto_encode`
- `configtxlator proto_decode`
- `peer channel update`
- `jq -c 'paths' config.json`
- `jq -c 'paths | select(.[-1] == "AnchorPeers")' config.json`
- `jq '..|.AnchorPeers?|select(length>0)' config.json`
- Service Discovery (which peers are currently running in the channel):
  ```sh
  cd crypto/peerOrganizations/org1.example.com/users/User1@org1.example.com
  
  discover saveConfig \
    --configFile conf.yaml \
    --peerTLSCA tls/ca.crt \
    --userKey msp/keystore/priv_sk \
    --userCert msp/signcerts/User1\@org1.example.com-cert.pem \
    --MSP Org1MSP
  
  discover peers \
    --configFile conf.yaml \
    --channel allarewelcome \
    --server peer0.org1.example.com:7051 \
    | jq .
  ```

---

```sh
jq -c 'paths | select(.[-1] == "AnchorPeers")' config.json
```
```text
["channel_group","groups","Application","groups","Org1MSP","values","AnchorPeers"]
["channel_group","groups","Application","groups","Org2MSP","values","AnchorPeers"]
```

```sh
jq '..|.AnchorPeers?|select(length>0)' config.json
```
```text
{
  "mod_policy": "Admins",
  "value": {
    "anchor_peers": [
      {
        "host": "peer1.org1.example.com",
        "port": 7051
      }
    ]
  },
  "version": "0"
}
{
  "mod_policy": "Admins",
  "value": {
    "anchor_peers": [
      {
         "host": "peer1.org2.example.com",
         "port": 7051
      }
    ]
  },
  "version": "0"
}
```
