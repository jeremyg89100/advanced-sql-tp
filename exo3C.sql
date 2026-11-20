-- CAP/PACELC:
--     Suivi GPS:
--         Le défi est d'envoyer un nombre important de données à l'app,
--         C'est pourquoi j'utiliserai le choix PA/EL afin que l'ajout des
--         données soient tout le temps disponible avec le moins de latence 
--         possible pour respecter la règle des 3 secondes et rentrer les
--         coordonnées GPS de 30k de voiture en simultanés.

--     Facturation bancaire des trajets:
--         Ici il nous faut de la cohérence afin que les données soient toujours
--         correctes, on ne veut pas que l'utilisateur paie plusieurs fois par
--         inadvertance ou par erreur serveur. C'est pourquoi je choisirai 
--         le choix PC/EC. La priorité est à l'intégrité des données.

--     Suggestion d'itinéraires/amis commun à 3 degrés de séparation:
--         Ici le choix parait plus libre. On pourrait choisir PA/EL pour la fluidité de 
--         l'application tout en admettant qu'il puisse y avoir des erreurs ou bien choisir 
--         PC/EC pour un temps de réaction plus long mais une fiabilité des solutions proposées.
--         Je pencherai tout de même pour le PA/EL pour la raison qu'il faut que les requêtes
--         d'itinéraires puissent se faire le plus rapidement possible pour fluidifier l'expérience utilisateur.

-- Cohérence / Scalabilité / Structure / Nature des accès:
--     Suivi GPS: 
--         Ici la cohérence n'est pas le plus gros défi, il faut
--         surtout avoir une faible latence, on peut donc utiliser du noSQL avec
--         DynamoDB ou Cassandra afin de pouvoir entrer un gros volume de données.
--         Ici il faudra une scalabilité horizontale pour répondre au besoin des 10k
--         requêtes par seconde.
--         Comme dit précédemment pour la structure il s'agira de clés valeurs ou alors de colonnes larges.
--         Ici pour les données, il faudra lire les données de position de la voiture de chaque utilisateur.
        

--     Facturation bancaire des trajets:
--         Ici on veut de la cohérence, on privilégie une base de données SQL comme 
--         par exemple PostgreSQL pour les sécuriser. Pour augmenter la capacité du serveur, 
--         on peut commencer par une scalabilité verticale puis horizontale si le besoin se présente.
--         Pour la structure il s'agira d'un tableau avec des colonnes fixes.
--         Pour la nature des accès il faudra s'assurer que ACID est bien respecté 
--         cela permet de bien respecter la cohérence des données.

--     Suggestion d'itinéraires/amis commun à 3 degrés de séparation:
--         Ici il vaut mieux utiliser Neo4j qui permet d'utiliser des graphes afin de
--         faciliter la recherche des amis en commun sur plusieurs degrés. 
--         Pour la scalabilité, le fait d'avoir choisi Neo4j à la place de SQL évite les 
--         requêtes qui pourraient ralentir le serveur.
--         Au niveau de la structure, il s'agira d'un graphe.
--         Pour interroger les données ici il faudra explorer les liens sur 3 niveaux.


