##  Lösung

- Im configtx.yaml sollte ein neues Profil erstellt werden (ende des Dokuments)
- Channel mit dem Profil generieren

`configtxgen -profile TaskChannel -outputCreateChannelTx ./config/channel1.tx -channelID channel1 -configPath /home/hlfa/Desktop/lfs272-assets/networkFiles/`

- Neuen Channel erstellen

`docker exec -it cli /bin/bash`

`peer channel create -o orderer.example.com:7050 -c channel1 -f /etc/hyperledger/configtx/channel1.tx --tls --cafile $ORDERER_TLS_CA`

`peer channel join -b channel1.block`
- Überprüfung 

` peer channel list`
