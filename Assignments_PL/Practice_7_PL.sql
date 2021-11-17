-- 1)
-- a)
--declare 
--v_deptno number := 10; 
--/

-- b)
--DECLARE
--    v_deptno NUMBER := 10;
--cursor c_emp_cursor is
--select last_name, salary, manager_id
--from employees
--where department_id = v_deptno;
--/ 

-- c)
--DECLARE
--    v_deptno NUMBER := 10;
--cursor c_emp_cursor is
--select last_name, salary, manager_id
--from employees
--where department_id = v_deptno;
--/ 

-- d)
DECLARE
    v_deptno NUMBER := 10;
--    v_deptno NUMBER := 20;
--    v_deptno NUMBER := 50;
--    v_deptno NUMBER := 80;
    CURSOR c_emp_cursor IS
    SELECT
        last_name,
        salary,
        manager_id
    FROM
        employees
    WHERE
        department_id = v_deptno;

BEGIN
    FOR emp_record IN c_emp_cursor LOOP
        IF
            emp_record.salary < 5000
            AND ( emp_record.manager_id = 101 OR emp_record.manager_id = 124 )
        THEN
            dbms_output.put_line(emp_record.last_name || ' Due For A Raise');
        ELSE
            dbms_output.put_line(emp_record.last_name || ' Not Due For A Raise');
        END IF;
    END LOOP;
END;
/ 

-- 2)
-- a)
--DECLARE
--    CURSOR c_dept_cursor IS
--    SELECT
--        department_id,
--        department_name
--    FROM
--        departments
--    WHERE
--        dpeartment_id < 100;
--/

-- b)
--DECLARE
--    CURSOR c_dept_cursor IS
--    SELECT
--        department_id,
--        department_name
--    FROM
--        departments
--    WHERE
--        dpeartment_id < 100;
--        CURSOR c_emp_cursor (
--        v_deptno NUMBER
--    ) IS
--    SELECT
--        last_name,
--        job_id,
--        hire_date,
--        salary
--    FROM
--        employees
--    WHERE
--            dpeartment_id = v_deptno
--        AND employee_id < 120;
--/

-- c)
DECLARE
    CURSOR c_dept_cursor IS
    SELECT
        department_id,
        department_name
    FROM
        departments
    WHERE
        dpeartment_id < 100;
        CURSOR c_emp_cursor (
        v_deptno NUMBER
    ) IS
    SELECT
        last_name,
        job_id,
        hire_date,
        salary
    FROM
        employees
    WHERE
            dpeartment_id = v_deptno
        AND employee_id < 120;
    v_current_deptno departments.department_id%TYPE;
    v_current_dname depertments.department_name%TYPE;
    v_ename employees.last_name%TYPE;
    v_job employees.job_id%TYPE;
    v_hiredate employees.hire_date%TYPE;
    v_sal employees.salary%TYPE;
/

-- d)
DECLARE
    CURSOR c_dept_cursor IS
    SELECT
        department_id,
        department_name
    FROM
        departments
    WHERE
        dpeartment_id < 100;
        CURSOR c_emp_cursor (
        v_deptno NUMBER
    ) IS
    SELECT
        last_name,
        job_id,
        hire_date,
        salary
    FROM
        employees
    WHERE
            dpeartment_id = v_deptno
        AND employee_id < 120;
    v_current_deptno departments.department_id%TYPE;
    v_current_dname depertments.department_name%TYPE;
    v_ename employees.last_name%TYPE;
    v_job employees.job_id%TYPE;
    v_hiredate employees.hire_date%TYPE;
    v_sal employees.salary%TYPE;
begin OPEN c_dept_cursor;
loop
fetch c_dept cursor into v_current_deptno,
v_current_dname;

EXIT WHEN c_dept_cursor%notfound;

dbms_output.put_line(' Dep Num '
                     || v_current_deptno
                     || ' Dep Name '
                     || v_current_dname);
/

-- e)
DECLARE
    CURSOR c_dept_cursor IS
    SELECT
        department_id,
        department_name
    FROM
        departments
    WHERE
        dpeartment_id < 100;
        CURSOR c_emp_cursor (
        v_deptno NUMBER
    ) IS
    SELECT
        last_name,
        job_id,
        hire_date,
        salary
    FROM
        employees
    WHERE
            dpeartment_id = v_deptno
        AND employee_id < 120;
    v_current_deptno departments.department_id%TYPE;
    v_current_dname depertments.department_name%TYPE;
    v_ename employees.last_name%TYPE;
    v_job employees.job_id%TYPE;
    v_hiredate employees.hire_date%TYPE;
    v_sal employees.salary%TYPE;
begin OPEN c_dept_cursor;
loop
fetch c_dept cursor into v_current_deptno,
v_current_dname;

EXIT WHEN c_dept_cursor%notfound;

dbms_output.put_line(' Dep Num '
                     || v_current_deptno
                     || ' Dep Name '
                     || v_current_dname);
IF c_emp_cursor%isopen THEN
    CLOSE c_emp_cursor;
END IF;

OPEN c_emp_cursor(v_current_deptno);

LOOP
    FETCH c_emp_cursor INTO
        v_ename,
        v_job,
        v_hiredate,
        v_sal;
    EXIT WHEN c_emp_cursor%notfound;
    dbms_output.put_line(v_ename
                         || ' '
                         || v_job
                         || ' '
                         || v_hiredate
                         || ' '
                         || v_sal);

END LOOP;

dbms_output.put_line('-----------');

CLOSE c_emp_cursor;
/

-- f)
DECLARE
    CURSOR c_dept_cursor IS
    SELECT
        department_id,
        department_name
    FROM
        departments
    WHERE
        department_id < 100;
        CURSOR c_emp_cursor (
        v_deptno NUMBER
    ) IS
    SELECT
        last_name,
        job_id,
        hire_date,
        salary
    FROM
        employees
    WHERE
            department_id = v_deptno
        AND employee_id < 120;
    v_current_deptno departments.department_id%TYPE;
    v_current_dname departments.department_name%TYPE;
    v_ename employees.last_name%TYPE;
    v_job employees.job_id%TYPE;
    v_hiredate employees.hire_date%TYPE;
    v_sal employees.salary%TYPE;
begin OPEN c_dept_cursor;
loop
fetch c_dept_cursor into v_current_deptno,
v_current_dname;

EXIT WHEN c_dept_cursor%notfound;

dbms_output.put_line(' Dep Num '
                     || v_current_deptno
                     || ' Dep Name '
                     || v_current_dname);
IF c_emp_cursor%isopen THEN
    CLOSE c_emp_cursor;
END IF;

OPEN c_emp_cursor(v_current_deptno);

LOOP
    FETCH c_emp_cursor INTO
        v_ename,
        v_job,
        v_hiredate,
        v_sal;
    EXIT WHEN c_emp_cursor%notfound;
    dbms_output.put_line(v_ename
                         || ' '
                         || v_job
                         || ' '
                         || v_hiredate
                         || ' '
                         || v_sal);

END LOOP;

dbms_output.put_line('-----------');
    close c_emp_cursor;
    end loop;
    close c_dept_cursor;
end;
/

-- g)
--Dep Num 10 Dep Name Administration
-------------
-- Dep Num 20 Dep Name Marketing
-------------
-- Dep Num 30 Dep Name Purchasing
--Raphaely PU_MAN 07-DEC-94 11000
--Khoo PU_CLERK 18-MAY-95 3100
--Baida PU_CLERK 24-DEC-97 2900
--Tobias PU_CLERK 24-JUL-97 2800
--Himuro PU_CLERK 15-NOV-98 2600
--Colmenares PU_CLERK 10-AUG-99 2500
-------------
-- Dep Num 40 Dep Name Human Resources
-------------
-- Dep Num 50 Dep Name Shipping
-------------
-- Dep Num 60 Dep Name IT
--Hunold IT_PROG 03-JAN-90 9000
--Ernst IT_PROG 21-MAY-91 6000
--Austin IT_PROG 25-JUN-97 4800
--Pataballa IT_PROG 05-FEB-98 4800
--Lorentz IT_PROG 07-FEB-99 4200
-------------
-- Dep Num 70 Dep Name Public Relations
-------------
-- Dep Num 80 Dep Name Sales
-------------
-- Dep Num 90 Dep Name Executive
--King AD_PRES 17-JUN-87 24000
--Kochhar AD_VP 21-SEP-89 17000
--De Haan AD_VP 13-JAN-93 17000
-------------
--
--
--PL/SQL procedure successfully completed.
/

-- 7-2)
-- 1)
-- CREATE TABLE top_salaries(salary NUMBER(8,2));
/

-- 2)
--DECLARE
--    num   NUMBER(3) := 5;
--    v_sal employees.salary%TYPE;
--    CURSOR c_emp_cursor IS
--    SELECT DISTINCT
--        salary
--    FROM
--        employees
--    ORDER BY
--        salary DESC;
--/

-- 3)
DECLARE
    num   NUMBER(3) := 5;
    v_sal employees.salary%TYPE;
    CURSOR c_emp_cursor IS
    SELECT DISTINCT
        salary
    FROM
        employees
    ORDER BY
        salary DESC;
BEGIN
    OPEN c_emp_cursor;
    FETCH c_emp_cursor INTO v_sal;
    WHILE
        c_emp_cursor%rowcount <= num
        AND c_emp_cursor%found
    LOOP
        INSERT INTO top_salaries ( salary ) VALUES ( v_sal );

        FETCH c_emp_cursor INTO v_sal;
    END LOOP;

    CLOSE c_emp_cursor;
END;
/

-- SELECT * FROM top_salaries;
/

SET SERVEROUTPUT ON