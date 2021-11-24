-- 1)
-- a)
CREATE OR REPLACE FUNCTION get_job (
    v_job_id IN jobs.job_id%TYPE
) RETURN jobs.job_title%TYPE IS
    v_title jobs.job_title%TYPE;
BEGIN
    SELECT
        job_title
    INTO v_title
    FROM
        jobs
    WHERE
        job_id = v_job_id;

    RETURN v_title;
END get_job;
/

-- b) 
VARIABLE v_title VARCHAR2(35);
EXECUTE :v_title := get_job('sa_rep');
PRINT v_title;

-- 2)
-- a)
CREATE OR REPLACE FUNCTION get_annual_comp (
    v_sal  IN employees.salary%TYPE,
    v_comm IN employees.commission_pct%TYPE
) RETURN NUMBER IS
BEGIN
    RETURN ( nvl(v_sal, 0) * 12 + ( nvl(v_comm, 0) ) * ( nvl(v_sal, 0) * 12 ) );
END get_annual_comp;
/

-- b)
SELECT
    employee_id,
    last_name,
    get_annual_comp(salary, commission_pct)
FROM
    employees
WHERE
    department_id = 30;

-- 3) 
-- a)
CREATE OR REPLACE FUNCTION valid_dept_id (
    v_dept_id IN departments.department_id%TYPE
) RETURN BOOLEAN IS
    v_var PLS_INTEGER;
BEGIN
    SELECT
        1
    INTO v_var
    FROM
        departments
    WHERE
        department_id = v_dept_id;

    RETURN true;
EXCEPTION
    WHEN no_data_found THEN
        RETURN false;
END valid_dept_id;
/

-- b)
CREATE OR REPLACE PROCEDURE add_employee (
    v_first_name employees.first_name%TYPE,
    v_last_name  employees.last_name%TYPE,
    v_email      employees.email%TYPE,
    v_job        employees.job_id%TYPE DEFAULT 'sa_rep',
    v_mgr        employees.manager_id%TYPE DEFAULT 145,
    v_sal        employees.manager_id%TYPE DEFAULT 1000,
    v_comm       employees.commission_pct%TYPE DEFAULT 0,
    v_dept_id    employees.department_id%TYPE DEFAULT 30
) IS
BEGIN
    IF valid_dept_id(v_dept_id) THEN
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
            v_first_name,
            v_last_name,
            v_email,
            v_job,
            v_mgr,
            trunc(sysdate),
            v_sal,
            v_comm,
            v_dept_id
        );

    ELSE
        raise_application_error(-22222, 'Failed try again');
    END IF;
END add_employee;
/

-- c)
EXECUTE add_employee('Jane','Harris','JAHARRIS', v_dept_id=>15)