SELECT UPPER(nume) as Nume,
    salariul || ' RON' as Salariu,
    salariul + salariul * 0.2 || ' RON' as salariu_majorat,
    ROUND((SYSDATE - data_angajare) / 365) as vechime,
    ROUND((SYSDATE - data_angajare) / 365, 2) as vechime_round,
    TRUNC((SYSDATE - data_angajare) / 365, 2) as vechime_trunc
FROM angajati;