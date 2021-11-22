-- 1)
-- a)
CREATE OR REPLACE PROCEDURE add_job (
    v_job_id    jobs.job_id%TYPE,
    v_job_title jobs.job_title%TYPE
) IS
BEGIN
    INSERT INTO jobs (
        job_id,
        job_title
    ) VALUES (
        v_job_id,
        v_job_title
    );

    COMMIT;
END add_job;
/

-- b)
EXECUTE add_job('it_dba', 'Database Admin')

SELECT
    *
FROM
    jobs
WHERE
    job_id = 'it_dba';
/    

-- c)
EXECUTE add_job('st_man', 'Stock Manager')

SELECT
    *
FROM
    jobs
WHERE
    job_id = 'st_man';
    
-- 00001. 00000 -  "unique constraint (%s.%s) violated"    
    
/    

-- 2)
-- a)
CREATE OR REPLACE PROCEDURE upd_job (
    v_job_id    IN jobs.job_id%TYPE,
    v_job_title IN jobs.job_title%TYPE
) IS
BEGIN
    UPDATE jobs
    SET
        job_title = v_job_title
    WHERE
        job_id = v_job_id;

    IF SQL%notfound THEN
        raise_application_error(21500, 'Unsuccessful Update');
    END IF;
    COMMIT;
END upd_job;
/

-- b)
EXECUTE upd_job('it_dba', 'Database Administrator')

SELECT
    *
FROM
    jobs
WHERE
    job_id = 'it_dba';
/

-- c)
EXECUTE upd_job('it_web', 'Web Master')

SELECT
    *
FROM
    jobs
WHERE
    job_id = 'it_web';
/

-- 3)
-- a)
CREATE OR REPLACE PROCEDURE del_job (
    v_job_id IN jobs.job_id%TYPE
) IS
BEGIN
    DELETE FROM jobs
    WHERE
        job_id = v_job_id;

    IF SQL%notfound THEN
        raise_application_error(21500, 'Unsuccessful Delete');
    END IF;
    COMMIT;
END del_job;
/

-- b)
EXECUTE del_job('it_dba')

SELECT
    *
FROM
    jobs
WHERE
    job_id = 'it_dba';
/

-- c)
--ORA-21000: error number argument to raise_application_error of -9001 is out of range
--ORA-06512: at "ADMIN.DEL_JOB", line 10
--ORA-06512: at line 1
--/

-- 4)
-- a)
CREATE OR REPLACE PROCEDURE get_employee (
    v_emp_id IN employees.employee_id%TYPE,
    v_sal    OUT employees.salary%TYPE,
    v_job_id OUT employees.job_id%TYPE
) IS
BEGIN
    SELECT
        salary,
        job_id
    INTO
        v_sal,
        v_job_id
    FROM
        employees
    WHERE
        employee_id = v_emp_id;

END get_employee;
/

-- b)
--VARIABLE v_sal NUMBER
--VARIABLE v_job VARCHAR(15);
--EXECUTE get_employee(120, :v_sal, :v_job);
--PRINT v_sal v_job;

VARIABLE v_sal NUMBER;
VARIABLE v_job_id VARCHAR2(120);
EXECUTE get_employee(171, :v_sal, :v_job_id);
PRINT v_sal v_job;

-- c)
-- SP2-0552: Bind variable "V_JOB" not declared.
