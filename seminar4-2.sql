DESCRIBE produse;

INSERT INTO produse
VALUES (1,'Coca Cola', 'suc', NULL, NULL, 5);

INSERT INTO produse (id_produs,denumire_produs,descriere,pret_min)
VALUES (2,'Pepsi','suc',5);

SELECT id_produs, denumire_produs
FROM produse
ORDER BY id_produs
FETCH FIRST 2 ROWS ONLY;

UPDATE produse
SET categorie='modificat'
WHERE pret_min BETWEEN 10 AND 200;

DESCRIBE angajati;

UPDATE angajati
SET salariul=salariul*2
WHERE nume LIKE 'a%' OR nume LIKE 'A%';

rollback;

SELECT *
from angajati
WHERE nume LIKE 'a%' OR nume LIKE 'A%';