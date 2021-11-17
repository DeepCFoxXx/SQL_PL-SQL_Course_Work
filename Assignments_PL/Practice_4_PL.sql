-- 1)
-- a)
-- DECLARE
-- v_max_deptno NUMBER;

-- b) 
-- DECLARE
--    v_max_deptno NUMBER;
-- BEGIN
--    SELECT
--    MAX(department_id)
--    INTO v_max_deptno
--    FROM
--        departments;

-- END;

-- c)
DECLARE
    v_max_deptno NUMBER;
BEGIN
    SELECT
        MAX(department_id)
    INTO v_max_deptno
    FROM
        departments;

    dbms_output.put_line('The Maximum Department_id Is : ' || v_max_deptno);
END;

--The Maximum Department_id Is : 270

--PL/SQL procedure successfully completed.

-- 2)
-- a)
-- DECLARE
--    v_max_deptno NUMBER;
--    v_dept_name  departments.department_name%TYPE := 'Education';
--    v_dept_id    NUMBER;
-- BEGIN
--    v_dept_id := 10 + v_max_deptno;
--   SELECT
--        MAX(department_id)
--    INTO v_max_deptno
--    FROM
--        departments;

--    dbms_output.put_line('The Maximum Department_id Is : ' || v_max_deptno);
-- END;

-- c)
-- DECLARE
--    v_max_deptno NUMBER;
--    v_dept_name  departments.department_name%TYPE := 'Education';
--    v_dept_id    NUMBER;
-- BEGIN
--    v_dept_id := 10 + v_max_deptno;
--    SELECT
--        MAX(department_id)
--    INTO v_max_deptno
--    FROM
--        departments;

--    INSERT INTO departments (
--        department_id,
--        department_name,
--        location_id
--    ) VALUES (
--        v_dept_id,
--        v_dept_name,
--        NULL
--    );

--    dbms_output.put_line('The Maximum Department_id Is : ' || v_max_deptno);
-- END;

-- d)
--DECLARE
--    v_max_deptno NUMBER;
--    v_dept_name  departments.department_name%TYPE := 'Education';
--    v_dept_id    NUMBER;
--BEGIN
--    SELECT
--        MAX(department_id)
--    INTO v_max_deptno
--    FROM
--        departments;
--
--    v_dept_id := 10 + v_max_deptno;
--    INSERT INTO departments (
--        department_id,
--        department_name,
--        location_id
--    ) VALUES (
--        v_dept_id,
--        v_dept_name,
--        NULL
--    );
--
--    dbms_output.put_line('The Maximum Department_id Is : ' || v_max_deptno);
--    dbms_output.put_line('SQL%ROWCOUNT gives ' || SQL%rowcount);
--END;
--
---- e)
--SELECT
--    *
--FROM
--    departments
--WHERE
--    department_id = 280;
    
-- f)
-- 280	Education	

-- 3)
-- a)
-- BEGIN
--    UPDATE departments
--    SET
--        location_id = 3000
--    WHERE
--        dpeartment_id = 280;
-- END;

-- b)
-- BEGIN
--    UPDATE departments
--    SET
--        location_id = 3000
--    WHERE
--        department_id = 280;
-- END;
-- /
-- select * from departments where department_id = 280;

-- c)
BEGIN
    UPDATE departments
    SET
        location_id = 3000
    WHERE
        department_id = 280;

END;
/

SELECT
    *
FROM
    departments
WHERE
    department_id = 280;

DELETE FROM departments
WHERE
    department_id = 280;
    
-- d)
--PL/SQL procedure successfully completed.
--
-->>Query Run In:Query Result 3
--
--1 row deleted.

SET SERVEROUTPUT ON