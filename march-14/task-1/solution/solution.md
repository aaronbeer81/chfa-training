# Lösung
Mit den Fehlern, welche beim Ausführen des Start Scripts resultieren, sollte man die Probleme sehr schnell erkennen.

Die Services für die CouchDB der Peers ist falsch und fehlt beim anderen Peer ganz.
Entweder kann der `couchdbService` angepasst oder kopiert werden (für beide Peers). Die Credentials spielen keine Rolle im Rahmen dieser Aufgabe.

Wichtig ist zudem, dass beim Port-Mapping nicht derselbe Port verwendet werden darf. Das Mapping an sich spielt ansonsten aber auch keine Rolle, da auf den Standardport zugegriffen wird (siehe Adresse CouchDB in den Umgebungsvariablen der Peers).

Beim Betrachen der Container failt dann noch derjenige der CA.
Dort sollte beim Blick in die Logs (mit `docker logs ...`) auffallen, dass mit dem client Binary der Server nicht gestartet werden kann.
Fabric-ca-client muss durch fabric-ca-server ersetzt werden.
