-- 1)
-- Have messages table

-- 2)
--declare 
--v_ename employees.last_name%TYPE;
--v_emp_sal employees.salary% type := 6000;

-- 3)
--DECLARE
--    v_ename   employees.last_name%TYPE;
--    v_emp_sal employees.salary%TYPE := 6000;
--BEGIN
--    SELECT
--        last_name
--    INTO v_ename
--    FROM
--        employees
--    WHERE
--        salary = v_emp_sal;
--
--    INSERT INTO messages ( results ) VALUES ( v_ename
--                                              || ' - '
--                                              || v_emp_sal );
--/

-- 4)
DECLARE
    v_ename   employees.last_name%TYPE;
    v_emp_sal employees.salary%TYPE := 6000;
BEGIN
    SELECT
        last_name
    INTO v_ename
    FROM
        employees
    WHERE
        salary = v_emp_sal;

    INSERT INTO messages ( results ) VALUES ( v_ename
                                              || ' - '
                                              || v_emp_sal );

EXCEPTION
    WHEN no_data_found THEN
        INSERT INTO messages ( results ) VALUES ( 'No employee with the salary of ' || to_char(v_emp_sal) );

END;
/

-- 5)
DECLARE
    v_ename   employees.last_name%TYPE;
    v_emp_sal employees.salary%TYPE := 6000;
BEGIN
    SELECT
        last_name
    INTO v_ename
    FROM
        employees
    WHERE
        salary = v_emp_sal;

    INSERT INTO messages ( results ) VALUES ( v_ename
                                              || ' - '
                                              || v_emp_sal );

EXCEPTION
    WHEN no_data_found THEN
        INSERT INTO messages ( results ) VALUES ( 'No employee with the salary of ' || to_char(v_emp_sal) );

    WHEN too_many_rows THEN
        INSERT INTO messages ( results ) VALUES ( 'More than one employee with a salary of ' || to_char(v_emp_sal) );

END;
/

-- 6)
DECLARE
    v_ename   employees.last_name%TYPE;
    v_emp_sal employees.salary%TYPE := 6000;
    -- v_emp_sal employees.salary%TYPE := 2000;
BEGIN
    SELECT
        last_name
    INTO v_ename
    FROM
        employees
    WHERE
        salary = v_emp_sal;

    INSERT INTO messages ( results ) VALUES ( v_ename
                                              || ' - '
                                              || v_emp_sal );

EXCEPTION
    WHEN no_data_found THEN
        INSERT INTO messages ( results ) VALUES ( 'No employee with the salary of ' || to_char(v_emp_sal) );

    WHEN too_many_rows THEN
        INSERT INTO messages ( results ) VALUES ( 'More than one employee with a salary of ' || to_char(v_emp_sal) );

    WHEN OTHERS THEN
        INSERT INTO messages ( results ) VALUES ( 'Some other error occurred.' );

END;
/

-- 7)
SELECT
    *
FROM
    messages;
    
-- 8-2)
-- 1)
--DECLARE
--    e_childrecord_exists EXCEPTION;
--    PRAGMA exception_init ( e_childrecord_exists, -02292 );
--/

-- 2
DECLARE
    e_childrecord_exists EXCEPTION;
    PRAGMA exception_init ( e_childrecord_exists, -02292 );
BEGIN
    dbms_output.put_line(' Deleting department 40');
    DELETE FROM departments
    WHERE
        department_id = 40;

END;
/

-- 3)
DECLARE
    e_childrecord_exists EXCEPTION;
    PRAGMA exception_init ( e_childrecord_exists, -02292 );
BEGIN
    dbms_output.put_line(' Deleting department 40');
    DELETE FROM departments
    WHERE
        department_id = 40;

EXCEPTION
    WHEN e_childrecord_exists THEN
        dbms_output.put_line(' Cannot delete (records exist) ');
END;

end;
/

SET SERVEROUTPUT ON