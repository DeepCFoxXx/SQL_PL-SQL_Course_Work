-- 1)
-- a)
--DECLARE
--    TYPE c_rec IS RECORD (
--        v_country_id  CHAR(2 BYTE),
--        v_county_name VARCHAR2(40 BYTE),
--        v_region_id   NUMBER
--    );
--    v_myrec c_rec;

-- b)
--DECLARE
--v_countryid varchar2(20) := 'ca';

-- c)
--v_country_record countries%ROWTYPE;

-- d)
DECLARE
    TYPE c_rec IS RECORD (
        v_country_id  CHAR(2 BYTE),
        v_county_name VARCHAR2(40 BYTE),
        v_region_id   NUMBER
    );
    v_myrec      c_rec;
    v_country_id VARCHAR2(20) := 'ca';
    v_myrec      countries%rowtype;
BEGIN
    SELECT
        *
    INTO v_myrec
    FROM
        countries
    WHERE
        country_id = v_country_id;

    dbms_output.put_line('country id '
                         || v_myrec.v_country_id
                         || 'country name'
                         || v_myrec.v_county_name
                         || 'region'
                         || v_myrec.v_region_id);

END;
/

-- e)
DECLARE
    TYPE c_rec IS RECORD (
        v_country_id  CHAR(2 BYTE),
        v_county_name VARCHAR2(40 BYTE),
        v_region_id   NUMBER
    );
    v_myrec       c_rec;
    v_country_id  VARCHAR2(20) := 'ca';
    v_country1_id VARCHAR2(20) := 'de';
    v_country2_id VARCHAR2(20) := 'uk';
    v_country3_id VARCHAR2(20) := 'us';
    v_myrec       countries%rowtype;
BEGIN
    SELECT
        *
    INTO v_myrec
    FROM
        countries
    WHERE
        country_id = v_country_id;

    dbms_output.put_line('country id '
                         || v_myrec.v_country_id
                         || 'country name'
                         || v_myrec.v_county_name
                         || 'region'
                         || v_myrec.v_region_id);

END;
/

-- 2)
-- a)
--declare 
--type dept_table_type is table of departments.department_name%type index by pls_integer;
--mydept_table dept_table_type;
--
--/

-- b)
--declare 
--v_loop_count number (2):=10;
--v_deptno number (4):=0;
--/

-- c)
DECLARE
    TYPE dept_table_type IS
        TABLE OF departments.department_name%TYPE INDEX BY PLS_INTEGER;
    my_dept_table dept_table_type;
    v_loop_count  NUMBER(2) := 10;
    v_deptno      NUMBER(4) := 0;
BEGIN
    FOR i IN 1..v_loop_count LOOP
        v_deptno := v_deptno + 10;
        SELECT
            department_name
        INTO
            my_dept_table
        (i)
        FROM
            departments
        WHERE
            department_id = v_deptno;

    END LOOP;
END;
/

-- 3)
-- a)
DECLARE
    TYPE dept_table_type IS
        TABLE OF departments.department_name%TYPE INDEX BY PLS_INTEGER;
    my_dept_table dept_table_type;
    v_loop_count  NUMBER(2) := 10;
    v_deptno      NUMBER(4) := 0;
BEGIN
    FOR i IN 1..v_loop_count LOOP
        v_deptno := v_deptno + 10;
        SELECT
            department_name
        INTO
            my_dept_table
        (i)
        FROM
            departments
        WHERE
            department_id = v_deptno;

    END LOOP;
END;
/

-- b)
DECLARE
    TYPE dept_table_type IS
        TABLE OF departments.department_name%rowtype INDEX BY PLS_INTEGER;
    my_dept_table dept_table_type;
    v_loop_count  NUMBER(2) := 10;
    v_deptno      NUMBER(4) := 0;
BEGIN
    FOR i IN 1..v_loop_count LOOP
        v_deptno := v_deptno + 10;
        SELECT
            department_name
        INTO
            my_dept_table
        (i)
        FROM
            departments
        WHERE
            department_id = v_deptno;

    END LOOP;
END;
/

-- c)
DECLARE
    TYPE dept_table_type IS
        TABLE OF departments.department_name%rowtype INDEX BY PLS_INTEGER;
    my_dept_table dept_table_type;
    v_loop_count  NUMBER(2) := 10;
    v_deptno      NUMBER(4) := 0;
BEGIN
    FOR i IN 1..v_loop_count LOOP
        v_deptno := v_deptno + 10;
        SELECT
            *
        INTO
            my_dept_table(i)
        FROM
            departments
        WHERE
            department_id = v_deptno;

    END LOOP;
END;
/

-- d)
DECLARE
    TYPE dept_table_type IS
        TABLE OF departments.department_name%rowtype INDEX BY PLS_INTEGER;
    my_dept_table dept_table_type;
    v_loop_count  NUMBER(2) := 10;
    v_deptno      NUMBER(4) := 0;
BEGIN
    FOR i IN 1..v_loop_count LOOP
        v_deptno := v_deptno + 10;
        SELECT
            *
        INTO
            my_dept_table(i)
        FROM
            departments
        WHERE
            department_id = v_deptno;

    END LOOP;
    FOR i IN 1..v_loop_count LOOP
        dbms_output.put_line ('Dep Number ' || my_dept_table(i).department_id 
        || 'Dep Name ' || my_dept_table(i).department_name
        || 'Man Id ' || my_dept_table(i).department_id
        || 'Loc Id ' || my_dept_table(i).department_name);
    END LOOP;
END;
/


SET SERVEROUTPUT ON