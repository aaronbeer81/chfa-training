#Task 1 - Create Channel with 2 Orgs

**Ausgangslage:**

Netzwerk, welches standardmässig einen Channel "allarewelcome" hat, mit der Organisation "Org1". Der Peer dieser Organisation ist dem Channel beigetreten.

Es gibt auch eine "Org2", welche momentan nicht in dem Channel berechtigt ist und einen Peer ohne Channel hat. Kryptomaterial für die Org2 und Docker Konfiguration für den Peer der Org2 bestehen bereits.
Das Ziel ist, den Channel neu zu erstellen mit beiden Organisationen und beiden Peers.

**Auftrag:**
1. Modifiziere die Konfiguration so, dass man mit einem neuen Profil einen Channel für beide Orgs erstellen kann.
2. Passe das generate.sh Script so an, dass der Channel mit dem neuen Profil erstellt wird. 
3. Stelle sicher, dass der Org2-Peer dem Channel beigetreten ist.

Tipp: TODO's