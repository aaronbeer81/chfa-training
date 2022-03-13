# Solution

In der Fabric CA Konfiguration hat sich ein Fehler eingeschlichen. Und zwar wurde bei der DB sqlite anstelle von sqlite3 angegeben.
Dies ersichtlich sobald man die CA startet und die Logs analysiert.
Nachdem man das Problem behoben hat und die CA erneut startet ist es anschliessend möglich den admin Benutzer zu enrollen.

Ressourcen in Doku: https://hyperledger-fabric-ca.readthedocs.io/en/release-1.4/users-guide.html

Commands:
fabric-ca-server start -b admin:adminpw
fabric-ca-client enroll -u http://admin:adminpw@localhost:7054


