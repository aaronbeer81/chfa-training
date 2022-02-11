fabric-ca-client identity list * -u http://localhost:7054
fabric-ca-client revoke -e peer1 -r 'keycompromise' -uhttp://localhost:7054
fabric-ca-client gencrl -u http://localhost:7054
cd /etc/hyperledger/fabric-ca-server/msp/crls/
openssl crl -inform PEM -text -in crl.pem
fabric-ca-client certificate list --revocation 2019-01-01::2030-12-30 -u http://localhost:7054