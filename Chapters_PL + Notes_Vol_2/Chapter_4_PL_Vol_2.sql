CREATE OR REPLACE PACKAGE dept_pkg IS
    PROCEDURE add_department (
        p_deptno  departments.department_id%TYPE,
        p_name    departments.department_name%TYPE := 'unknown',
        p_loc     departments.location_id%TYPE := 1700
    );

    PROCEDURE add_department (
        p_name  departments.department_name%TYPE := 'unknown',
        p_loc   departments.location_id%TYPE := 1700
    );
END dept_pkg;
/

CREATE OR REPLACE PACKAGE BODY dept_pkg IS
    PROCEDURE add_department (
        p_deptno  departments.department_id%TYPE,
        p_name    departments.department_name%TYPE := 'unknown',
        p_loc     departments.location_id%TYPE := 1700
    ) IS
    BEGIN
        INSERT INTO departments (
            department_id,
            department_name,
            location_id
        ) VALUES (
            p_deptno,
            p_name,
            p_loc
        );
    END add_department;

    PROCEDURE add_department (
        p_name  departments.department_name%TYPE := 'unknown',
        p_loc   departments.location_id%TYPE := 1700
    ) IS
    BEGIN
        INSERT INTO departments (
            department_id,
            department_name,
            location_id
        ) VALUES (
            departments_seq.NEXTVAL,
            p_name,
            p_loc
        );
    END add_department;
END dept_pkg;
/

EXECUTE dept_pkg.add_department(980, 'Education', 2500)
/

SELECT
    *
FROM
    departments
WHERE
    department_id = 980;
/

EXECUTE dept_pkg.add_department('Training', 2400)
/

SELECT
    *
FROM
    departments
WHERE
    department_name = 'Training';
/

CREATE OR REPLACE PACKAGE taxes IS
    v_tax NUMBER;
END taxes;
/

CREATE OR REPLACE PACKAGE BODY taxes IS BEGIN
    SELECT
        rate_value
    INTO v_tax
    FROM
        tax_rates
    WHERE
        rate_name = 'TAX';
END taxes;
/

CREATE OR REPLACE PACKAGE taxes_pkg IS
    FUNCTION tax (
        p_value IN NUMBER
    ) RETURN NUMBER;
END taxes_pkg;
/

CREATE OR REPLACE PACKAGE BODY taxes_pkg IS
    FUNCTION tax (
        p_value IN NUMBER
    ) RETURN NUMBER IS
        v_rate NUMBER := 0.08;
    BEGIN
        return(p_value * v_rate);
    END tax;
END taxes_pkg;
/

SELECT
    taxes_pkg.tax(salary),
    salary,
    last_name
FROM
    employees;
/

CREATE OR REPLACE PACKAGE curs_pkg IS
    PROCEDURE open;
    FUNCTION next (
        p_n NUMBER := 1
    ) RETURN BOOLEAN;
    PROCEDURE close;
END curs_pkg;
/

CREATE OR REPLACE PACKAGE BODY curs_pkg IS
    CURSOR cur_c IS
    SELECT
        employee_id
    FROM
        employees;
    PROCEDURE open IS
    BEGIN
        IF NOT cur_c%isopen THEN
            OPEN cur_c;
        END IF;
    END open;

    FUNCTION next (
        p_n NUMBER := 1
    ) RETURN BOOLEAN IS
        v_emp_id employees.employee_id%TYPE;
    BEGIN
        FOR count IN 1..p_n LOOP
            FETCH cur_c INTO v_emp_id;
            EXIT WHEN cur_c%notfound;
            dbms_output.put_line('Id: ' ||(v_emp_id));
        END LOOP;
        RETURN cur_c%found;
    END next;
    PROCEDURE close IS
    BEGIN
        IF cur_c%isopen THEN
            CLOSE cur_c;
        END IF;
    END close;
END curs_pkg;
/

CREATE OR REPLACE PACKAGE emp_pkg IS
    TYPE emp_table_type IS
        TABLE OF employees%rowtype INDEX BY BINARY_INTEGER;
    PROCEDURE get_employees (
        p_emps OUT emp_table_type
    );
END emp_pkg;
/

CREATE OR REPLACE PACKAGE BODY emp_pkg IS PROCEDURE get_employees (
    p_emps OUT emp_table_type
) is v_i
   binary_integer := 0;
    BEGIN
        FOR emp_record IN (
            SELECT
                *
            FROM
                employees
        ) LOOP
            p_emps(v_i) := emp_record;
            v_i := v_i + 1;
        END LOOP;
    END get_employees;
END emp_pkg;
/

BEGIN
    curs_pkg.open;
    IF curs_pkg.next(8) THEN
        dbms_output.put_line('New values were fetched');
    ELSE
        dbms_output.put_line('Cursor will restart');
        curs_pkg.close;
    END IF;
END;
/

DECLARE
    v_employees emp_pkg.emp_table_type;
BEGIN
    emp_pkg.get_employees(v_employees);
    dbms_output.put_line('Emp 5: ' || v_employees(4).last_name || ' ' || v_employees(4).department_id);
END;
/

SET SERVEROUTPUT ON