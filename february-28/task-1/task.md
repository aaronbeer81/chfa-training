##      Aufgabe CHFA 28.02.2022
1) Mounte den Chaincode Ordner der Task Ressourcen in die CLI an einem gewünsten Ort 
> Beispiel: /opt/gopath/src/github.com/chaincode/sacc
2) Installiere die smart contract dependencies. Der Chaincode ist in go geschrieben.
> Wenn die Aufgabe in PF Netz durchgeführt wird kann es sein, dass die dependencies nicht installiert werden können. 
> Holen sie in diesem Fall ein chaincode Paket z.b von b4u 
> 
> ``curl -Lk https://repo.pnet.ch/artifactory/blckchn-generic-local/release/chaincode/b4u-chaincode/2.3.5/b4u-chaincode-2.3.5.tar.gz --output /opt/gopath/src/github.com/chaincode/b4u ``
3) Erstelle das Chaincode Package
4) Installiere den Chaincode

### 	Tipps
>   Mit dem Netzwerk kann mit dem folgenden Scripts interagiert werden:   
>   `./teardown.sh && ./generate.sh && ./start.sh`
> 
>   Um die go smart contract depenencies zu installieren verwende folgenden command:
>   GO111MODULE=on go mod vendor
