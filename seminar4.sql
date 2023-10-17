DESCRIBE abonati;

ALTER TABLE abonati
ADD nr_telefon CHAR(10);

DESCRIBE abonati;

DELETE FROM abonati;

ALTER TABLE abonati
ADD CONSTRAINT telefon_valid CHECK(LENGTH(TRIM(nr_telefon))=10);

INSERT INTO abonati
VALUES (2,'5040127420017','omar','ramadan','popa nan 150','bucuresti', '0720825308');


INSERT INTO abonati
VALUES (2,'6040127420017','omar','ramadan','popa nan 150','bucuresti', '720825308');

DROP TABLE abonati CASCADE CONSTRAINTS;
DROP TABLE carti CASCADE CONSTRAINTS;
DROP TABLE detalii_fisa CASCADE CONSTRAINTS;
DROP TABLE fisa_imprumut CASCADE CONSTRAINTS;