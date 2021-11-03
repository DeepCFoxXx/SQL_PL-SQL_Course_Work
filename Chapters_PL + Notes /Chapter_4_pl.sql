DECLARE
    v_myage NUMBER := 31;
BEGIN
    IF v_myage < 11 THEN
        dbms_output.put_line(' I am a child ');
    END IF;
END;
/

DECLARE
    v_myage NUMBER := 31;
BEGIN
    IF v_myage < 11 THEN
        dbms_output.put_line(' I am a child ');
    ELSE
        dbms_output.put_line(' I am not a child ');
    END IF;
END;
/

DECLARE
    v_myage NUMBER := 31;
BEGIN
    IF v_myage < 11 THEN
        dbms_output.put_line(' I am a child ');
    ELSIF v_myage < 20 THEN
        dbms_output.put_line(' I am young ');
    ELSIF v_myage < 30 THEN
        dbms_output.put_line(' I am in my twenties');
    ELSIF v_myage < 40 THEN
        dbms_output.put_line(' I am in my thirties');
    ELSE
        dbms_output.put_line(' I am always young ');
    END IF;
END;
/

-- Null on either side of the code = Null
DECLARE
    v_myage NUMBER;
BEGIN
    IF v_myage < 11 THEN
        dbms_output.put_line(' I am a child ');
    ELSE
        dbms_output.put_line(' I am not a child ');
    END IF;
END;
/

SET VERIFY OFF

DECLARE
    v_grade      CHAR(1) := upper('&grade');
    v_appraisal  VARCHAR2(20);
BEGIN
    v_appraisal :=
        CASE v_grade
            WHEN 'A' THEN
                'Excellent'
            WHEN 'B' THEN

                'Very Good'
            WHEN 'C' THEN
                'Good'
            ELSE 'No such grade'
        END;
    dbms_output.put_line('Grade: '
                         || v_grade
                         || 'Appraisal '
                         || v_appraisal);
END;
/

DECLARE
    v_grade      CHAR(1) := upper('&grade');
    v_appraisal  VARCHAR2(20);
BEGIN
    v_appraisal :=
        CASE
            WHEN v_grade = 'A' THEN
                'Excellent'
            WHEN v_grade IN ( 'B', 'C' ) THEN
             'Good'
            ELSE 'No such grade'
        END;
    dbms_output.put_line('Grade: '
                         || v_grade
                         || 'Appraisal '
                         || v_appraisal);
END;
/

DECLARE
    v_deptid    NUMBER;
    v_deptname  VARCHAR2(20);
    v_emps      NUMBER;
    v_mngid     NUMBER := 108;
BEGIN
    CASE v_mngid
        WHEN 108 THEN
            SELECT
                department_id,
                department_name
            INTO
                v_deptid,
                v_deptname
            FROM
                departments
            WHERE
                manager_id = 108;
            SELECT
                COUNT(*)
            INTO v_emps
            FROM
                employees
            WHERE
                department_id = v_deptid;
    END CASE;
    dbms_output.put_line('You are working in the '
                         || v_deptname
                         || ' department. There are '
                         || v_emps
                         || ' employees in this
department');
END;
/

DECLARE
    v_countryid  locations.country_id%TYPE := 'CA';
    v_loc_id     locations.location_id%TYPE;
    v_counter    NUMBER(2) := 1;
    v_new_city   locations.city%TYPE := 'Montreal';
BEGIN
    SELECT
        MAX(location_id)
    INTO v_loc_id
    FROM
        locations
    WHERE
        country_id = v_countryid;
    LOOP
        INSERT INTO locations (
            location_id,
            city,
            country_id
        ) VALUES (
            ( v_loc_id + v_counter ),
            v_new_city,
            v_countryid
        );
        v_counter := v_counter + 1;
        EXIT WHEN v_counter > 3;
    END LOOP;
END;
/

DECLARE
    v_counter NUMBER DEFAULT 0;
BEGIN
    LOOP
        dbms_output.put_line(v_counter + 1 || '.Hello world');
        v_counter := v_counter + 1;
        EXIT WHEN v_counter = 10;
    END LOOP;
END;
/

DECLARE
    v_countryid  locations.country_id%TYPE := 'CA';
    v_loc_id     locations.location_id%TYPE;
    v_new_city   locations.city%TYPE := 'Montreal';
    v_counter    NUMBER := 1;
BEGIN
    SELECT
        MAX(location_id)
    INTO v_loc_id
    FROM
        locations
    WHERE
        country_id = v_countryid;
    WHILE v_counter <= 3 LOOP
        INSERT INTO locations (
            location_id,
            city,
            country_id
        ) VALUES (
            ( v_loc_id + v_counter ),
            v_new_city,
            v_countryid
        );
        v_counter := v_counter + 1;
    END LOOP;
END;
/

DECLARE
    v_countryid  locations.country_id%TYPE := 'CA';
    v_loc_id     locations.location_id%TYPE;
    v_new_city   locations.city%TYPE := 'Montreal';
BEGIN
    SELECT
        MAX(location_id)
    INTO v_loc_id
    FROM
        locations
    WHERE
        country_id = v_countryid;
    FOR i IN 1..3 LOOP
        INSERT INTO locations (
            location_id,
            city,
            country_id
        ) VALUES (
            ( v_loc_id + i ),
            v_new_city,
            v_countryid
        );
    END LOOP;
END;
/

DECLARE
    v_countryid  locations.country_id%TYPE := 'CA';
    v_loc_id     locations.location_id%TYPE;
    v_new_city   locations.city%TYPE := 'Montreal';
    v_counter    NUMBER := 1;
BEGIN
    SELECT
        MAX(location_id)
    INTO v_loc_id
    FROM
        locations
    WHERE
        country_id = v_countryid;
    WHILE v_counter <= 3 LOOP
        INSERT INTO locations (
            location_id,
            city,
            country_id
        ) VALUES (
            ( v_loc_id + v_counter ),
            v_new_city,
            v_countryid
        );
        v_counter := v_counter + 1;
    END LOOP;
END;
/

DECLARE
    v_countryid  locations.country_id%TYPE := 'CA';
    v_loc_id     locations.location_id%TYPE;
    v_new_city   locations.city%TYPE := 'Montreal';
    v_times      NUMBER := 3;
BEGIN
    SELECT
        MAX(location_id)
    INTO v_loc_id
    FROM
        locations
    WHERE
        country_id = v_countryid;

    FOR i IN 1..v_times LOOP
        INSERT INTO locations (
            location_id,
            city,
            country_id
        ) VALUES (
            ( v_loc_id + i ),
            v_new_city,
            v_countryid
        );
    END LOOP;
END;
/

BEGIN
    << outer_loop >> LOOP
        v_counter := v_counter + 1;
        EXIT WHEN v_counter > 10;
        << inner_loop >> LOOP
            EXIT outer_loop WHEN total_done = 'YES';
-- Leave both loops
            EXIT WHEN inner_done = 'YES';
-- Leave inner loop only
        END LOOP inner_loop;
    END LOOP outer_loop;
END;
/
SET SERVEROUTPUT ON