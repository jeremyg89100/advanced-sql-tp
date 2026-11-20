ALTER TABLE commandes DROP FOREIGN KEY fk_commandes_client;

ALTER TABLE commandes
DROP PRIMARY KEY,
ADD PRIMARY KEY (id, date_commande)
PARTITION BY RANGE (YEAR(date_commande)) (
    PARTITION commandes_2024 VALUES LESS THAN (2025),
    PARTITION commandes_2025 VALUES LESS THAN (2026),
    PARTITION commandes_2026 VALUES LESS THAN (2027)
);
CREATE INDEX idx_prix_commande ON commandes (status, montant_total);
EXPLAIN ANALYZE 
SELECT id, montant_total
FROM commandes
WHERE statut = 'LIVREE'
AND date_commande < '2027-01-01' 
AND date_commande >= '2026-01-01'
ORDER BY montant_total DESC
LIMIT 10;

-- Pour la partie A un idx_commandes_livrees est utilisé,
-- cela donnait un cost=3.35 et rows = 26.
-- Le temps total est 0.178.
-- Pour la partie B le cost est passé à 0.338 et les rows à 6.
-- Cela a donc baissé le coût ainsi que le nombre de lignes lues.
-- Le temps total est 0.0821 ce qui est également une légère amélioration.
-- Le partition pruning permet de rechercher directement à l'année qui est demandé
-- pour notre cas, donc 2026 en ignorant toutes les autres années.
