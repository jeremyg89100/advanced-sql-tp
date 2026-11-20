CREATE INDEX idx_synthese_segments
ON clients (segment);
SELECT 
    cl.segment,
    COUNT(*) AS nombre_commandes,
    SUM(co.montant_total) AS ca_total 
FROM clients cl
JOIN commandes co ON co.client_id = cl.id
GROUP BY cl.segment
ORDER BY cl.segment ASC;

INSERT INTO commandes (client_id, date_commande, montant_total, statut) 
VALUES (2, '2025-01-03 10:29:30', 2350.00, 'LIVREE');

-- Etant sur sql et utilisant un index, l'update est
-- mis à jour directement. Contrairement à Postgre, si l'on utilise
-- une vue matérialisée, il faudrait la refresh pour que les données
-- soient à jour.
