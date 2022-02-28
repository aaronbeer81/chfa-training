env | grep -i core
cd /opt/gopath/src/github.com/chaincode/sacc
GO111MODULE=on go mod vendor
peer lifecycle chaincode package sacc.tar.gz --path /opt/gopath/src/github.com/chaincode/sacc/ --lang golang --label sacc1
peer lifecycle chaincode install sacc.tar.gz
peer lifecycle chaincode queryinstalled
