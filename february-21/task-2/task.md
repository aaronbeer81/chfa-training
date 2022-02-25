#Task 1 - Configure Hyperledger Fabric for HSM

**Auftrag:**
Die Konfigurationsdateien aus dem Ordner /resources sollen angepasst werden, 
damit das imaginär existierende HSM mit den folgenden Eigenschaften genutzt wird:
1. Genutztes Implementation-Interface: PKCS11
2. Pfad zum Library File in den Peers & Orderer: /etc/hyperledger/fabric/libsofthsm2.so
3. Pfad zum Library File in der CA: /etc/hyperledger/fabric-ca-server/libsofthsm2.so
4. Token-Label: techlab
5. Token Pin: 123456789
6. Hash-Funktion: SHA-256
7. Private Keys sollen mutable sein.

