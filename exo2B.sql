WITH rang_prix_plus_haut AS (
    SELECT p.nom, p.prix_unitaire, c.id AS categorie_id, c.nom AS categorie_nom,
    DENSE_RANK() OVER (PARTITION BY c.id ORDER BY p.prix_unitaire DESC) AS prix_classement
    FROM produits p
    JOIN categories c ON p.categorie_id = c.id
)
SELECT  categorie_nom, nom, prix_unitaire, prix_classement
FROM rang_prix_plus_haut
WHERE prix_classement <= 2
ORDER BY categorie_nom ASC, prix_unitaire DESC
