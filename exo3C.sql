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
--         inadvertance ou pas erreur serveur. C'est pourquoi je choisirai 
--         le choix PC/EC. La priorité est à l'intégrité des données.

--     Suggestion d'itinéraires/amis commun à 3 degrés de séparation:
--         Ici le choix parait plus libre. On pourrait choisir PA/EL pour la fluidité de 
--         l'application tout en admettant qu'il puisse y avoir des erreurs ou bien choisir 
--         PC/EC pour un temps de réaction plus long mais une fiabilité des solutions proposées.
--         Je pencherai tout de même pour le PC/EC pour la simple raison qu'il y a les suggestions
--         d'itinéraires et qu'il est mieux qu'elles prennent plus de temps mais qu'elles soient 
--         toute pertinente.

-- Cohérence / Scalabilité / Structure / Nature des accès:
--     Suivi GPS: 
--         Ici la cohérence n'est pas le plus gros défi, il faut
--         surtout avoir une faible latence, on peut donc utiliser du noSQL avec
--         DynamoDB ou Cassandra afin de pouvoir entrer un gros volume de données.
--         Ici il n'y aura pas de problème de scalabilité avec Cassandra qui sont des
--         colonnes larges ou DynamoDB qui sont simplement des clés valeurs.
--         Comme dit précédemment pour la structure il s'agira de simple clés valeurs.
--         Ici pour les données, il y aura juste à interroger la clé pour connaitre la valeur
--         qui y est attachée.
        

--     Facturation bancaire des trajets:
--         Ici on veut de la cohérence, on privilégie une base de données SQL comme 
--         par exemple PostgreSQL pour les sécuriser. Pour augmenter la capacité du serveur, 
--         on peut simplement en prendre un plus gros ou alors en prendre plusieurs.
--         Pour la structure il s'agira d'un tableau avec des colonnes fixes.
--         Pour la nature des accès il faudra s'assurer que ACID est bien respecté et faire des
--         requêtes SQL qui respectent bien la cohérence des données.

--     Suggestion d'itinéraires/amis commun à 3 degrés de séparation:
--         Ici il vaut mieux utiliser Neo4j qui permet d'utiliser des graphes afin de
--         faciliter la recherche des amis en commun sur plusieurs degrés. 
--         Pour la scalabilité, le fait d'avoir choisi Neo4j à la place de SQL évite les 
--         requêtes qui pourraient ralentir le serveur.
--         Au niveau de la structure, il s'agira d'un graphe.
--         Pour interroger les données ici il faudra explorer les liens sur 3 niveaux.


