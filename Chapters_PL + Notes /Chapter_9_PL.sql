CREATE TABLE dept
    AS
        SELECT

            *
        FROM
            departments;
CREATE PROCEDURE add_dept IS
    v_dept_id    dept.department_id%TYPE;
    v_dept_name  dept.department_name%TYPE;
BEGIN
    v_dept_id := 280;
    v_dept_name := 'ST-Curriculum';
    INSERT INTO dept (
        department_id,
        department_name
    ) VALUES (
        v_dept_id,
        v_dept_name
    );
    dbms_output.put_line(' Inserted '
                         || SQL%rowcount
                         || ' row ');
END;
/

SELECT
    *
FROM
    dept;
/

BEGIN
    add_dept;
END;
/

EXECUTE add_dept();
/

SELECT
    department_id,
    department_name
FROM
    dept
WHERE
    department_id = 280;
/

CREATE FUNCTION check_sal RETURN BOOLEAN IS
    v_dept_id  employees.department_id%TYPE;
    v_empno    employees.employee_id%TYPE;
    v_sal      employees.salary%TYPE;
    v_avg_sal  employees.salary%TYPE;
BEGIN
    v_empno := 205;
    SELECT
        salary,
        department_id
    INTO
        v_sal,
        v_dept_id
    FROM
        employees
    WHERE
        employee_id = v_empno;
    SELECT
        AVG(salary)
    INTO v_avg_sal
    FROM
        employees
    WHERE
        department_id = v_dept_id;
    IF v_sal > v_avg_sal THEN
        RETURN true;
    ELSE
        RETURN false;
    END IF;
EXCEPTION
    WHEN no_data_found THEN
        RETURN NULL;
END;
/

BEGIN
    IF ( check_sal IS NULL ) THEN
        dbms_output.put_line('The function returnedNULL due to exception');
    ELSIF ( check_sal ) THEN
        dbms_output.put_line('Salary > average');
    ELSE
        dbms_output.put_line('Salary < average');
    END IF;
END;
/

BEGIN
    IF ( check_sal IS NULL ) THEN
        dbms_output.put_line('The function returned NULL due to exception');
    ELSIF ( check_sal ) THEN
        dbms_output.put_line('Salary > average');
    ELSE
        dbms_output.put_line('Salary < average');
    END IF;
END;
/

BEGIN
    dbms_output.put_line(check_sal);
END;
/

-- DROP FUNCTION check_sal;

CREATE OR REPLACE FUNCTION check_sal (
    p_empno employees.employee_id%TYPE
) RETURN BOOLEAN IS
    v_dept_id  employees.department_id%TYPE;
    v_sal      employees.salary%TYPE;
    v_avg_sal  employees.salary%TYPE;
BEGIN
    SELECT
        salary,
        department_id
    INTO
        v_sal,
        v_dept_id
    FROM
        employees
    WHERE
        employee_id = p_empno;
    SELECT
        AVG(salary)
    INTO v_avg_sal
    FROM
        employees
    WHERE
        department_id = v_dept_id;
    IF v_sal > v_avg_sal THEN
        RETURN true;
    ELSE
        RETURN false;
    END IF;
/

EXECUTE check_sal(170);
/

select * form employees where employee_id = 170;
/

select AVG(salary) from employees where department_id = 80;
/

declare cursor c_emp_id
SELECT
    employee_id
FROM
    employees;
BEGIN
    FOR v_emp_id IN (
        SELECT
            employee_id
        FROM
            employees
    ) LOOP
        dbms_output.put_line('Salary < average');
    END LOOP;
END;
/

SELECT
    employee_id,
    last_name,
    salary,
    department_id,
    check_sal(employee_id)
FROM
    employees;
/

SET SERVEROUTPUT ON