CREATE OR REPLACE TRIGGER check_salary BEFORE
    INSERT OR UPDATE OF salary, job_id ON employees
    FOR EACH ROW
    WHEN ( new.job_id <> 'AD_PRES' )
DECLARE
    v_minsalary  employees.salary%TYPE;
    v_maxsalary  employees.salary%TYPE;
BEGIN
    SELECT
        MIN(salary),
        MAX(salary)
    INTO
        v_minsalary,
        v_maxsalary
    FROM
        employees
    WHERE
        job_id = :new.job_id;

    IF :new.salary < v_minsalary OR :new.salary > v_maxsalary THEN
        raise_application_error(-20505, 'Out of range');
    END IF;
END;
/

UPDATE employees
SET
    salary = 3400
WHERE
    last_name = 'Stiles';
/

CREATE OR REPLACE TRIGGER check_salary FOR
    INSERT OR UPDATE OF salary, job_id ON employees
    WHEN ( new.job_id <> 'AD_PRES' )
COMPOUND TRIGGER
    TYPE salaries_t IS
    TABLE OF employees.salary%TYPE;
    min_salaries             salaries_t;
    max_salaries             salaries_t;
    TYPE department_ids_t IS
    TABLE OF employees.department_id%TYPE;
    department_ids           department_ids_t;
    TYPE department_salaries_t IS
    TABLE OF employees.salary%TYPE INDEX BY VARCHAR2(80);
    department_min_salaries  department_salaries_t;
    department_max_salaries  department_salaries_t;

    BEFORE STATEMENT IS BEGIN
        SELECT
            MIN(salary),
            MAX(salary),
            nvl(department_id, - 1)
        BULK COLLECT
        INTO
            min_salaries,
            max_salaries,
            department_ids
        FROM
            employees
        GROUP BY
            department_id;

        FOR j IN 1..department_ids.count() LOOP
            department_min_salaries(department_ids(j)) := min_salaries(j);
            department_max_salaries(department_ids(j)) := max_salaries(j);
        END LOOP;

    END BEFORE STATEMENT;
    AFTER EACH ROW IS BEGIN
        IF :new.salary < department_min_salaries(:new.department_id) OR :new.salary > department_max_salaries(:new.department_id)
        THEN
            raise_application_error(-20505, 'New Salary is out of acceptable   range');
        END IF;
    END AFTER EACH ROW;
END check_salary;
/

UPDATE employees
SET
    salary = 3400
WHERE
    last_name = 'Stiles';
/

SELECT
    employee_id,
    first_name,
    last_name,
    job_id,
    department_id,
    salary
FROM
    employees
WHERE
    last_name = 'Stiles';
/

SELECT
    MAX(salary)
FROM
    employees
WHERE
    last_name = 'Stiles';
/

CREATE OR REPLACE TRIGGER logon_trig AFTER LOGON ON SCHEMA BEGIN
    INSERT INTO log_trig_table (
        user_id,
        log_date,
        action
    ) VALUES (
        user,
        sysdate,
        'Logging on'
    );
END;
/

CREATE OR REPLACE TRIGGER logoff_trig BEFORE LOGOFF ON SCHEMA BEGIN
    INSERT INTO log_trig_table (
        user_id,
        log_date,
        action
    ) VALUES (
        user,
        sysdate,
        'Logging off'
    );
END;
/

CREATE OR REPLACE TRIGGER salary_check BEFORE
    UPDATE OF salary, job_id ON employees
    FOR EACH ROW
    WHEN ( new.job_id <> 'AD_PRES' )
CALL check_salary(:new.job_id, :new.salary)
/