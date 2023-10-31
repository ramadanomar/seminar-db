SELECT SUM(salariul) AS sal_total,
    MIN(salariul) AS sal_min,
    ROUND(AVG(salariul)) AS sal_mediu,
    MAX(salariul) AS sal_max,
    MIN(nume) AS primul_nume
FROM angajati;
SELECT MIN(nume) AS primul_nume,
    MAX(data_angajare) cel_recent
FROM angajati;
SELECT UNIQUE COUNT(*)
FROM angajati;
SELECT COUNT(id_angajat)
FROM angajati;
-- nr angajati IT
SELECT UNIQUE COUNT(*) as marime_it
FROM angajati
WHERE LOWER(id_functie) LIKE '%it%';
DESCRIBE angajati;
SELECT *
from angajati;
SELECT COUNT(id_angajat)
FROM angajati
WHERE id_departament IN (80, 90, 100)
    AND salariul > 5000;
SELECT id_departament,
    COUNT(id_angajat) as nr
FROM angajati
WHERE salariul > 5000
GROUP BY id_departament
HAVING COUNT(id_angajat) > 5
ORDER BY nr DESC;