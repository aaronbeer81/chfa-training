# Lösung
1. Im docker-compose.yml unter "orderer.example.com:" und "peer1.org1.example.com:" den Parameter FABRIC_LOGGING_SPEC von "DEBUG" auf "INFO", "WARNING", "ERROR", "PANIC" oder "FATAL" stellen.
2. Weil HLF defaultmässig alle Logs auf stderr ausgibt.
3. "docker logs orderer.example.com 2> orderer.log" oder "docker logs orderer.example.com &> orderer.log"
