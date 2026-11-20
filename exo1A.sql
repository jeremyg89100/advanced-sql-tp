EXPLAIN ANALYZE
SELECT id, date_commande, montant_total
FROM commandes
WHERE YEAR(date_commande) = 2026
AND statut = 'LIVREE'
ORDER BY montant_total DESC
LIMIT 10;

-- Le premier défaut est qu'il y a une condition non-SARGable sur 
-- date_commande. Cela empêche d'utiliser un index B-tree et doit lire ligne par ligne.
-- Le second est qu'il s'agit d'un seq scan qui va lire toute la table et seulement 
-- prendre les lignes avec les données du WHERE correspondant. Si il y a de nombreuses
-- données cela peut ralentir le serveur. Sans un index adapté, la requête peut être couteuse.
