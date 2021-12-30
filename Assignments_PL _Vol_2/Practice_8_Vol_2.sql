-- 1)
-- a)
CREATE OR REPLACE PROCEDURE check_salary (
    p_the_job    VARCHAR2,
    p_the_salary NUMBER
) IS
    v_minsal jobs.min_salary%TYPE;
    v_maxsal jobs.max_salary%TYPE;
BEGIN
    SELECT
        min_salary,
        max_salary
    INTO
        v_minsal,
        v_maxsal
    FROM
        jobs
    WHERE
        job_id = upper(p_the_job);

    IF p_the_salary NOT BETWEEN v_minsal AND v_maxsal THEN
        raise_application_error(-20100, 'Invalid salary $'
                                        || p_the_salary
                                        || '. '
                                        || 'Salaries for job '
                                        || p_the_job
                                        || ' must be between $'
                                        || v_minsal
                                        || ' and $'
                                        || v_maxsal);

    END IF;

END;
/

-- b)
CREATE OR REPLACE TRIGGER check_salary_trg BEFORE
    INSERT OR UPDATE OF job_id, salary ON employees
    FOR EACH ROW
BEGIN
    check_salary(:new.job_id, :new.salary);
END;
/

-- 2)
-- a)
EXECUTE emp_pkg.add_employee('eleanor', 'beh', 30);

-- b)
UPDATE employees
SET
    salary = 2000
WHERE
    employee_id = 115;

UPDATE employees
SET
    job_id = 'hr_rep'
WHERE
    employee_id = 115;
    
-- c)    
UPDATE employees
SET
    salary = 2800
WHERE
    employee_id = 115;
    
-- 3)
-- a)
CREATE OR REPLACE TRIGGER check_salary_trg BEFORE
    INSERT OR UPDATE OF job_id, salary ON employees
    FOR EACH ROW
    WHEN ( new.job_id <> nvl(old.job_id, '?')
           OR new.salary <> nvl(old.salary, 0) )
BEGIN
    check_salary(:new.job_id, :new.salary);
END;
/

-- b)
BEGIN
    emp_pkg.add_employee('Eleanor', 'Beh', 'EBEH', job => 'IT_PROG', sal => 5000);
END;
/

-- c)
UPDATE employees
SET
    salary = salary + 2000
WHERE
    job_id = 'IT_PROG';
    
-- d)
UPDATE employees
SET
    salary = 9000
WHERE
    employee_id = (
        SELECT
            employee_id
        FROM
            employees
        WHERE
            last_name = 'Beh'
    );
/

-- e)
UPDATE employees
SET
    job_id = 'ST_MAN'
WHERE
    employee_id = (
        SELECT
            employee_id
        FROM
            employees
        WHERE
            last_name = 'Beh'
    );

-- 4)
-- a)
CREATE OR REPLACE TRIGGER delete_emp_trg BEFORE
    DELETE ON employees
DECLARE
    the_day  VARCHAR2(3) := to_char(sysdate, 'DY');
    the_hour PLS_INTEGER := to_number(to_char(sysdate, 'HH24'));
BEGIN
    IF
        ( the_hour BETWEEN 9 AND 18 )
        AND ( the_day NOT IN ( 'SAT', 'SUN' ) )
    THEN
        raise_application_error(-20150, 'Cannot be deleted 9AM / 6PM');
    END IF;
END;
/

-- b)
DELETE FROM employees
WHERE
        job_id = 'SA_REP'
    AND department_id IS NULL;