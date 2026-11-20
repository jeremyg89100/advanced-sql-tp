WITH RECURSIVE hierarchie AS (
    SELECT id, 
        nom,
        1 AS niveau,
        CAST(nom AS CHAR(1000)) AS chemin
    FROM employes
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.id, e.nom, h.niveau +1 AS niveau,
    CONCAT(h.chemin, ' > ', e.nom) AS chemin
    FROM employes e
    INNER JOIN hierarchie h ON e.manager_id = h.id
    WHERE h.niveau < 5
)
SELECT niveau, chemin, nom
FROM hierarchie
ORDER BY niveau ASC;
