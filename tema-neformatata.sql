SELECT nume, prenume, salariul
FROM angajati
WHERE salariul > 12000;
--
SELECT nume, id_departament
FROM angajati
WHERE id_angajat=176;
--
SELECT nume, salariul
FROM angajati
WHERE salariul NOT BETWEEN 5000 AND 12000
FETCH FIRST 10000 ROWS ONLY;
--
SELECT nume, id_functie, data_angajare
FROM angajati
WHERE nume IN ('Matos', 'Taylor')
ORDER BY data_angajare ASC;
--
SELECT nume, id_departament
FROM angajati
WHERE id_departament IN (20,50)
ORDER BY nume ASC;
--
SELECT nume as Employee, salariul as Salary
FROM angajati
WHERE salariul BETWEEN 5000 AND 12000 AND id_departament IN (20,50)
FETCH FIRST 10000 ROWS ONLY;
--
SELECT nume, data_angajare
FROM angajati
WHERE data_angajare >= date '1994-01-01' AND data_angajare < date '1995-01-01';
--
SELECT nume, id_functie
FROM angajati
WHERE id_manager IS NULL;
--
SELECT nume, salariul, comision
FROM angajati
WHERE comision IS NOT NULL AND comision > 0
ORDER BY salariul DESC, comision DESC;
--
SELECT nume, salariul
FROM angajati
WHERE salariul > :a;
--
DECLARE
    a NUMBER;
    TYPE ref_cursor IS REF CURSOR;
    c_angajat ref_cursor;
    v_nume angajati.nume%TYPE;
    v_salariul angajati.salariul%TYPE;
BEGIN
    a := :a;
    OPEN c_angajat FOR
        SELECT nume, salariul
        FROM angajati
        WHERE salariul > a;
        
    LOOP
        FETCH c_angajat INTO v_nume, v_salariul;
        EXIT WHEN c_angajat%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Nume: ' || v_nume || ', Salariul: ' || v_salariul);
    END LOOP;

    CLOSE c_angajat;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('404');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Too many lines returned');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;

--
DECLARE
    v_manager_id angajati.id_manager%TYPE := :user_input_manager_id;
    v_order_column VARCHAR2(50) :=  :orderby_col;

    TYPE employee_rec IS RECORD (
        id_angajat angajati.id_angajat%TYPE,
        nume angajati.nume%TYPE,
        salariul angajati.salariul%TYPE,
        id_functie angajati.id_functie%TYPE
    );
    
    TYPE ref_cursor IS REF CURSOR;
    c_employee ref_cursor;
    
    v_employee employee_rec;
    
    v_sql_stmt VARCHAR2(500);
BEGIN
    v_sql_stmt := 'SELECT id_angajat, nume, salariul, id_functie FROM angajati WHERE id_manager = :manager ORDER BY ' || v_order_column;

    OPEN c_employee FOR v_sql_stmt USING v_manager_id;

    LOOP
        FETCH c_employee INTO v_employee;
        EXIT WHEN c_employee%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_employee.id_angajat || ', Name: ' || v_employee.nume || ', Salary: ' || v_employee.salariul || ', Function ID: ' || v_employee.id_functie);
    END LOOP;
    
    CLOSE c_employee;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found for this manager.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
--
SELECT nume
FROM angajati
WHERE nume LIKE '__a%';
--
SELECT nume
FROM angajati
WHERE nume LIKE '%a%' AND nume LIKE '%e%';
--
SELECT nume, id_functie, salariul
FROM angajati
WHERE salariul NOT IN ('2500','3500','7000') AND id_functie IN ('SA_REP', 'ST_CLERK');
--
SELECT nume, salariul, comision
FROM angajati
WHERE comision IS NOT NULL AND comision > 0.2
ORDER BY salariul DESC, comision DESC;