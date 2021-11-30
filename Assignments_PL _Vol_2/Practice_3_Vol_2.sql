-- 1)
-- a)
CREATE OR REPLACE PACKAGE job_pkg IS
    PROCEDURE add_job (
        p_jobid    jobs.job_id%TYPE,
        p_jobtitle jobs.job_title%TYPE
    );

    PROCEDURE del_job (
        p_jobid jobs.job_id%TYPE
    );

    FUNCTION get_job (
        p_jobid IN jobs.job_id%TYPE
    ) RETURN jobs.job_title%TYPE;

    PROCEDURE upd_job (
        p_jobid    IN jobs.job_id%TYPE,
        p_jobtitle IN jobs.job_title%TYPE
    );

END job_pkg;
/

-- b)
CREATE OR REPLACE PACKAGE BODY job_pkg IS

    PROCEDURE add_job (
        p_jobid    jobs.job_id%TYPE,
        p_jobtitle jobs.job_title%TYPE
    ) IS
    BEGIN
        INSERT INTO jobs (
            job_id,
            job_title
        ) VALUES (
            p_jobid,
            p_jobtitle
        );

        COMMIT;
    END add_job;

    PROCEDURE del_job (
        p_jobid jobs.job_id%TYPE
    ) IS
    BEGIN
        DELETE FROM jobs
        WHERE
            job_id = p_jobid;

        IF SQL%notfound THEN
            raise_application_error(-20203, 'Nothing Deleted');
        END IF;
    END del_job;

    FUNCTION get_job (
        p_jobid IN jobs.job_id%TYPE
    ) RETURN jobs.job_title%TYPE IS
        v_title jobs.job_title%TYPE;
    BEGIN
        SELECT
            job_title
        INTO v_title
        FROM
            jobs
        WHERE
            job_id = p_jobid;

        RETURN v_title;
    END get_job;

    PROCEDURE upd_job (
        p_jobid    IN jobs.job_id%TYPE,
        p_jobtitle IN jobs.job_title%TYPE
    ) IS
    BEGIN
        UPDATE jobs
        SET
            job_title = p_jobtitle
        WHERE
            job_id = p_jobid;

        IF SQL%notfound THEN
            raise_application_error(-20202, 'Nothing Updated.');
        END IF;
    END upd_job;

END job_pkg;
/

-- c) 
-- drop procedure add_job upd_job del_job
-- drop function 

-- d)
EXECUTE job_pkg.add_job('IT_SYSAN', 'Systems Analyst');

-- e)
SELECT
    *
FROM
    jobs
WHERE
    job_id = 'IT_SYSAN';
    
-- 2)
-- a)
CREATE OR REPLACE PACKAGE emp_pkg IS
    PROCEDURE add_employee (
        p_first_name employees.first_name%TYPE,
        p_last_name  employees.last_name%TYPE,
        p_email      employees.email%TYPE,
        p_job        employees.job_id%TYPE DEFAULT 'SA_REP',
        p_mgr        employees.manager_id%TYPE DEFAULT 145,
        p_sal        employees.salary%TYPE DEFAULT 1000,
        p_comm       employees.commission_pct%TYPE DEFAULT 0,
        p_deptid     employees.department_id%TYPE DEFAULT 30
    );

    PROCEDURE get_employee (
        p_empid IN employees.employee_id%TYPE,
        p_sal   OUT employees.salary%TYPE,
        p_job   OUT employees.job_id%TYPE
    );

END emp_pkg;
/

CREATE OR REPLACE PACKAGE BODY emp_pkg IS

    FUNCTION valid_deptid (
        p_deptid IN departments.department_id%TYPE
    ) RETURN BOOLEAN IS
        v_dummy PLS_INTEGER;
    BEGIN
        SELECT
            1
        INTO v_dummy
        FROM
            departments
        WHERE
            department_id = p_deptid;

        RETURN true;
    EXCEPTION
        WHEN no_data_found THEN
            RETURN false;
    END valid_deptid;

    PROCEDURE add_employee (
        p_first_name employees.first_name%TYPE,
        p_last_name  employees.last_name%TYPE,
        p_email      employees.email%TYPE,
        p_job        employees.job_id%TYPE DEFAULT 'SA_REP',
        p_mgr        employees.manager_id%TYPE DEFAULT 145,
        p_sal        employees.salary%TYPE DEFAULT 1000,
        p_comm       employees.commission_pct%TYPE DEFAULT 0,
        p_deptid     employees.department_id%TYPE DEFAULT 30
    ) IS
    BEGIN
        IF valid_deptid(p_deptid) THEN
            INSERT INTO employees (
                employee_id,
                first_name,
                last_name,
                email,
                job_id,
                manager_id,
                hire_date,
                salary,
                commission_pct,
                department_id
            ) VALUES (
                employees_seq.NEXTVAL,
                p_first_name,
                p_last_name,
                p_email,
                p_job,
                p_mgr,
                trunc(sysdate),
                p_sal,
                p_comm,
                p_deptid
            );

        ELSE
            raise_application_error(-20204, 'Invalid department ID. Try again.');
        END IF;
    END add_employee;

    PROCEDURE get_employee (
        p_empid IN employees.employee_id%TYPE,
        p_sal   OUT employees.salary%TYPE,
        p_job   OUT employees.job_id%TYPE
    ) IS
    BEGIN
        SELECT
            salary,
            job_id
        INTO
            p_sal,
            p_job
        FROM
            employees
        WHERE
            employee_id = p_empid;

    END get_employee;

END emp_pkg;
/

-- c)
EXECUTE emp_pkg.add_employee('David', 'Smith', 'DASMITH', p_deptid => 80);

-- d)
SELECT
    *
FROM
    employees
WHERE
    last_name = 'Smith';