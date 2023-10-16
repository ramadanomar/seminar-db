CREATE TABLE abonati
(
nr_abonat NUMBER(3),
cnp CHAR(13) NOT NULL UNIQUE,
nume VARCHAR2(15) NOT NULL,
prenume VARCHAR2(15) NOT NULL,
adresa VARCHAR(255) NOT NULL,
localitate VARCHAR(20) NOT NULL,

CONSTRAINT "abonati_pkey" PRIMARY KEY (nr_abonat)
);

CREATE TABLE carti
(
isbn CHAR(20),
titlu VARCHAR2(20) NOT NULL,
autor VARCHAR2(20) NOT NULL,

CONSTRAINT "carti_pkey" PRIMARY KEY (isbn)
);


CREATE TABLE fisa_imprumut
(
nr_fisa NUMBER(3),
data_imprumut DATE NOT NULL,
nr_abonat NUMBER(3),

CONSTRAINT "fisa_imprumut_pkey" PRIMARY KEY (nr_fisa)
);

ALTER TABLE fisa_imprumut ADD CONSTRAINT "fisa_imprumut_fkey" FOREIGN KEY (nr_abonat) REFERENCES abonati(nr_abonat) ON DELETE CASCADE;

CREATE TABLE detalii_fisa
(
nr_fisa NUMBER(3),
isbn CHAR(20),
data_retur DATE,

PRIMARY KEY (nr_fisa,isbn)
);

ALTER TABLE detalii_fisa ADD CONSTRAINT "detalii_fisa_fkey1" FOREIGN KEY (nr_fisa) REFERENCES fisa_imprumut(nr_fisa) ON DELETE CASCADE;
ALTER TABLE detalii_fisa ADD CONSTRAINT "detalii_fisa_fkey2" FOREIGN KEY (isbn) REFERENCES carti(isbn) ON DELETE CASCADE;

DESCRIBE detalii_fisa;
