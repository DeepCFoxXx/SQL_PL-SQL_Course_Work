BEGIN
    dbms_output.put_line('Hello World');
END;
/

BEGIN
    dbms_output.put_line('Hello World 1');
    dbms_output.put_line('Hello World 2');
END;
/

BEGIN
    dbms_output.put_line('Mark');
    dbms_output.put_line('Edinburgh');
    dbms_output.put_line('34');
END;
/

DECLARE
    v_name VARCHAR2(20);
BEGIN
    v_name := 'Mark';
    dbms_output.put_line('My Name Is ' || v_name);
END;
/

SET SERVEROUTPUT On


DECLARE
    v_myname VARCHAR2(20);
BEGIN
    dbms_output.put_line('My name is: ' || v_myname);
    v_myname := 'John';
    dbms_output.put_line('My name is: ' || v_myname);
END;
/

DECLARE
    v_myname VARCHAR2(20) := 'John';
BEGIN
    v_myname := 'Steven';
    dbms_output.put_line('My name is: ' || v_myname);
END;
/

-- DECLARE
--     v_event VARCHAR2(15);
-- BEGIN
--     v_event := q'!Father's day!';
--     dbms_output.put_line('3rd Sunday in June is :' || v_event);
--     v_event := q'[Mother's day]';
--     dbms_output.put_line('2nd Sunday in May is :' || v_event);
-- END;
-- /

-- DECLARE
--     v_f_name VARCHAR2(25);
-- BEGIN
--     SELECT
--         first_name
--     INTO v_f_name
--     FROM
--         employees
--     WHERE
--         employee_id = 100;
--     dbms_output.put_line(v_f_name);
-- END;
-- /

-- DECLARE
--     v_f_name  VARCHAR2(25);
--     v_l_name  v_f_name%TYPE;
-- BEGIN
--     SELECT
--         first_name,
--         last_name
--     INTO
--         v_f_name,
--         v_l_name
--     FROM
--         employees
--     WHERE
--         employee_id = 101;
--     dbms_output.put_line(v_f_name || ' ' || v_l_name);
-- END;
-- /

-- DECLARE
--     v_d_name  VARCHAR2(30);
--     v_d_id    NUMBER(4, 0);
--     v_emp_id  employees.employee_id%TYPE;
-- BEGIN
--     SELECT
--         department_name,
--         location_id
--     INTO
--         v_d_name,
--         v_d_id
--     FROM
--         departments
--     WHERE
--         department_id = 10;
--     dbms_output.put_line(v_d_name || ' ' || v_d_id);
--     dbms_output.put_line('Name of Department 10: '
--                          || v_d_name
--                          || ' Location Id '
--                          || v_d_id);
-- END;
-- /

-- VARIABLE f_name VARCHAR2

-- SET SERVEROUTPUT ON