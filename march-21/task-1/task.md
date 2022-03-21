<strong> In dieser Aufgabe müssen einige Fehler behoben werden damit die Umgebung gestartet und auf dem CA ein Benutzer initialisiert werden kann. 
</strong>

1. Behebe anhand der Logs alle Fehler damit das Netzwerk gestartet werden kann.
2. Der Orderer hat keine Logs, dies ist unpraktisch und du würdest gerne anhand der Logs informiert werden über die Geschehnisse. Konfiguriere deshalb den Orderer damit er wieder Logs ausgiebt.
3. Zum Abschluss wollen wir noch auf den CA verbinden und dann initialisieren, dafür kannst du den "fabric-ca-server init -b caServerAdmin:AdminsRock" Befehl verwenden.

Falls irgendwo etwas fehlschlagen würde, sollte dies durch eine Änderung der Konfiguration zu beheben sein.