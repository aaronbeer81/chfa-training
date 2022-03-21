<t>Um die Aufgabe zu lösen muss man lediglich einige Zeilen im docker-compose.yaml File anpassen.</t>

<strong>Zeile 19/20 (keine Port)</strong>
</br> anstelle von:
</br> - ports:
</br> - ""
</br>
</br> - ports:
</br> - "7054:7054"
</br>
</br>

<strong>Zeile 19/20 (bereits benutzer Port und zweimal gleicher)</strong>
</br> anstelle von:
</br> - ports:
</br> - 7050:7050
</br> - 7050:7050
</br>
</br> - ports:
</br> - 7051:7051
</br> - 7053:7053
</br>
</br>

<strong>Zeile 32 (falsches Log Level)</strong>
</br> anstelle von:
</br> - FABRIC_LOGGING_SPEC=ERROR
</br>
</br> - FABRIC_LOGGING_SPEC=INFO
</br>
</br>

<strong>Zeile 24 (falscher Containername)</strong>
</br> anstelle von:
</br> container_name: peer0.org1.example.com
</br>
</br> container_name: ca.org1.example.com
</br>
</br>

<strong>Zeile 58 (falscher Containername)</strong>
</br> anstelle von:
</br> container_name: ca.org1.example.com
</br>
</br> container_name: peer0.org1.example.com
</br>
</br>
</br>Sobald all diese Fehler behoben wurden kann man auf die CA connecten und dort den Benutzer initialisieren.
</br>Falls dir aufgefallen ist, dass die Containernamen nicht stimmen kann man auch ohne diese anzupassen einfach auf den peer0.org1.example.com Container connecten und dort den Benutzer initialisieren.