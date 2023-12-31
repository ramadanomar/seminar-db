--- Ex 1
CREATE TABLE dep(
    id NUMBER GENERATED BY DEFAULT AS IDENTITY,
    denumire VARCHAR2(25) NOT NULL,
    PRIMARY KEY(id)
);
-- Verificare Ex 1
DESCRIBE dep;
-- Ex 2
INSERT INTO dep
SELECT id_departament,
    denumire_departament
FROM departamente;
-- Verificare Ex 2
SELECT *
FROM dep;
-- Ex 3
CREATE TABLE ang(
    id NUMBER(7) GENERATED BY DEFAULT AS IDENTITY,
    prenume VARCHAR2(25),
    nume VARCHAR2(25),
    dep_id NUMBER NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(dep_id) REFERENCES dep(id)
);
-- Verificare Ex 3
DESCRIBE ang -- Ex 4
ALTER TABLE ang
ADD(varsta NUMBER(2));
-- Ex 5
ALTER TABLE ang
ADD CONSTRAINT verifica_varsta CHECK(
        varsta BETWEEN 18 AND 65
    );
-- Ex 6
ALTER TABLE ang DISABLE CONSTRAINT verifica_varsta;
-- Ex 7
DESCRIBE ang;
ALTER TABLE ang
MODIFY nume VARCHAR(30);
-- Ex 8
ALTER TABLE ang
    RENAME TO ang2;
-- Ex 9
CREATE TABLE salariati AS
SELECT *
FROM Angajati;
DESCRIBE salariati;
-- Ex 10
DESCRIBE salariati;
SELECT to_date('17-06-1987', 'DD-MM-YYYY')
FROM DUAL;
INSERT INTO salariati
VALUES(
        1,
        'Steven',
        'Kong',
        'SKONG',
        '515.123.4567',
        to_date('17-06-1987', 'DD-MM-YYYY'),
        'AD_PRES',
        24000,
        0.1,
        NULL,
        90
    );
SELECT *
FROM salariati
WHERE id_angajat = 1;
INSERT INTO salariati (
        id_angajat,
        prenume,
        nume,
        email,
        telefon,
        data_angajare,
        id_functie,
        salariul,
        comision,
        id_manager,
        id_departament
    )
VALUES (
        2,
        'Neena',
        'Koch',
        'NKOCH',
        '515.123.4568',
        to_date('21-09-1989', 'DD-MM-YYYY'),
        'AD_VP',
        17000,
        0.1,
        100,
        90
    );
INSERT INTO salariati (
        id_angajat,
        prenume,
        nume,
        email,
        telefon,
        data_angajare,
        id_functie,
        salariul,
        comision,
        id_manager,
        id_departament
    )
VALUES (
        3,
        'Lex',
        'Haan',
        'LHAAN',
        '515.123.4569',
        to_date('21-09-1993', 'DD-MM-YYYY'),
        'AD_VP',
        17000,
        0.2,
        100,
        90
    );
SELECT *
FROM salariati
WHERE id_angajat < 4;
-- Ex 11 & 12
UPDATE salariati
SET prenume = 'John',
    email = 'JHAAN'
WHERE id_angajat = 3;
-- Ex 13
UPDATE salariati
SET salariul = salariul + salariul * 0.1
WHERE salariul < 20000;
-- Ex 14
UPDATE salariati
SET id_functie = 'AD_PRES'
WHERE id_angajat = 2;
-- Ex 15
UPDATE salariati
SET comision = (
        SELECT comision
        FROM salariati
        WHERE id_angajat = 3
    )
WHERE id_angajat = 2;
-- Ex 16
DELETE FROM salariati
WHERE id_angajat = 1;