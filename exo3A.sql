SELECT id, nom
FROM employes e
WHERE NOT EXISTS (
    SELECT manager_id 
    FROM employes m 
    WHERE e.id = m.manager_id
)

-- Le problème avec la requête proposée est que Le
-- manager_id du CEO est égal à NULL. Par conséquent 
-- le boolean deviendra faux et notre requête ne nous renverra
-- donc aucune donnée.
