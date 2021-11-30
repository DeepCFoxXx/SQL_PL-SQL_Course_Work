-- 1)
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

    PROCEDURE add_employee (
        p_first_name employees.first_name%TYPE,
        p_last_name  employees.last_name%TYPE,
        p_deptid     employees.department_id%TYPE
    );

    PROCEDURE get_employee (
        p_empid IN employees.employee_id%TYPE,
        p_sal   OUT employees.salary%TYPE,
        p_job   OUT employees.job_id%TYPE
    );

END emp_pkg;
/

-- b)
-- Package EMP_PKG compiled

-- c)
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
            raise_application_error(-20204, 'Wrong Department');
        END IF;
    END add_employee;

    PROCEDURE add_employee (
        p_first_name employees.first_name%TYPE,
        p_last_name  employees.last_name%TYPE,
        p_deptid     employees.department_id%TYPE
    ) IS
        p_email employees.email%TYPE;
    BEGIN
        p_email := upper(substr(p_first_name, 1, 1)
                         || substr(p_last_name, 1, 7));

        add_employee(p_first_name, p_last_name, p_email, p_deptid => p_deptid);
    END;

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

-- d)
EXECUTE emp_pkg.add_employee('Samuel', 'Joplin', 30);

-- e)
SELECT
    *
FROM
    employees
WHERE
    last_name = 'Joplin';

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

    PROCEDURE add_employee (
        p_first_name employees.first_name%TYPE,
        p_last_name  employees.last_name%TYPE,
        p_deptid     employees.department_id%TYPE
    );

    PROCEDURE get_employee (
        p_empid IN employees.employee_id%TYPE,
        p_sal   OUT employees.salary%TYPE,
        p_job   OUT employees.job_id%TYPE
    );

    FUNCTION get_employee (
        p_emp_id employees.employee_id%TYPE
    ) RETURN employees%rowtype;

    FUNCTION get_employee (
        p_family_name employees.last_name%TYPE
    ) RETURN employees%rowtype;

END emp_pkg;
/

-- b)
-- Package EMP_PKG compiled

-- c)
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

    PROCEDURE add_employee (
        p_first_name employees.first_name%TYPE,
        p_last_name  employees.last_name%TYPE,
        p_deptid     employees.department_id%TYPE
    );

    PROCEDURE get_employee (
        p_empid IN employees.employee_id%TYPE,
        p_sal   OUT employees.salary%TYPE,
        p_job   OUT employees.job_id%TYPE
    );

    FUNCTION get_employee (
        p_emp_id employees.employee_id%TYPE
    ) RETURN employees%rowtype;

    FUNCTION get_employee (
        p_family_name employees.last_name%TYPE
    ) RETURN employees%rowtype;

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
            raise_application_error(-20204, 'Wrong Departmemt');
        END IF;
    END add_employee;

    PROCEDURE add_employee (
        p_first_name employees.first_name%TYPE,
        p_last_name  employees.last_name%TYPE,
        p_deptid     employees.department_id%TYPE
    ) IS
        p_email employees.email%TYPE;
    BEGIN
        p_email := upper(substr(p_first_name, 1, 1)
                         || substr(p_last_name, 1, 7));

        add_employee(p_first_name, p_last_name, p_email, p_deptid => p_deptid);
    END;

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

    FUNCTION get_employee (
        p_emp_id employees.employee_id%TYPE
    ) RETURN employees%rowtype IS
        rec_emp employees%rowtype;
    BEGIN
        SELECT
            *
        INTO rec_emp
        FROM
            employees
        WHERE
            employee_id = p_emp_id;

        RETURN rec_emp;
    END;

    FUNCTION get_employee (
        p_family_name employees.last_name%TYPE
    ) RETURN employees%rowtype IS
        rec_emp employees%rowtype;
    BEGIN
        SELECT
            *
        INTO rec_emp
        FROM
            employees
        WHERE
            last_name = p_family_name;

        RETURN rec_emp;
    END;

END emp_pkg;
/

-- d)
-- Package EMP_PKG compiled
-- Package Body EMP_PKG compiled

-- e)
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

    PROCEDURE add_employee (
        p_first_name employees.first_name%TYPE,
        p_last_name  employees.last_name%TYPE,
        p_deptid     employees.department_id%TYPE
    );

    PROCEDURE get_employee (
        p_empid IN employees.employee_id%TYPE,
        p_sal   OUT employees.salary%TYPE,
        p_job   OUT employees.job_id%TYPE
    );

    FUNCTION get_employee (
        p_emp_id employees.employee_id%TYPE
    ) RETURN employees%rowtype;

    FUNCTION get_employee (
        p_family_name employees.last_name%TYPE
    ) RETURN employees%rowtype;

    PROCEDURE print_employee (
        p_rec_emp employees%rowtype
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
            raise_application_error(-20204, 'Wrong Department');
        END IF;
    END add_employee;

    PROCEDURE add_employee (
        p_first_name employees.first_name%TYPE,
        p_last_name  employees.last_name%TYPE,
        p_deptid     employees.department_id%TYPE
    ) IS
        p_email employees.email%TYPE;
    BEGIN
        p_email := upper(substr(p_first_name, 1, 1)
                         || substr(p_last_name, 1, 7));

        add_employee(p_first_name, p_last_name, p_email, p_deptid => p_deptid);
    END;

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

    FUNCTION get_employee (
        p_emp_id employees.employee_id%TYPE
    ) RETURN employees%rowtype IS
        rec_emp employees%rowtype;
    BEGIN
        SELECT
            *
        INTO rec_emp
        FROM
            employees
        WHERE
            employee_id = p_emp_id;

        RETURN rec_emp;
    END;

    FUNCTION get_employee (
        p_family_name employees.last_name%TYPE
    ) RETURN employees%rowtype IS
        rec_emp employees%rowtype;
    BEGIN
        SELECT
            *
        INTO rec_emp
        FROM
            employees
        WHERE
            last_name = p_family_name;

        RETURN rec_emp;
    END;

    PROCEDURE print_employee (
        p_rec_emp employees%rowtype
    ) IS
    BEGIN
        dbms_output.put_line(p_rec_emp.department_id
                             || ' '
                             || p_rec_emp.employee_id
                             || ' '
                             || p_rec_emp.first_name
                             || ' '
                             || p_rec_emp.last_name
                             || ' '
                             || p_rec_emp.job_id
                             || ' '
                             || p_rec_emp.salary);
    END;

END emp_pkg;
/ 

-- f)
-- Package Body EMP_PKG compiled
-- Package Body EMP_PKG compiled

-- g)
BEGIN
    emp_pkg.print_employee(emp_pkg.get_employee(100));
    emp_pkg.print_employee(emp_pkg.get_employee('Joplin'));
END;
/

-- 3)
-- a)
--    PROCEDURE init_departments 
    
-- b)
--    TYPE boolean_tab_type IS
--        TABLE OF BOOLEAN INDEX BY BINARY_INTEGER;
--    valid_departments boolean_tab_type;
--/    
--PROCEDURE init_departments IS
--    BEGIN
--        FOR rec IN (
--            SELECT
--                department_id
--            FROM
--                departments
--        ) LOOP
--            valid_departments(rec.department_id) := true;
--        END LOOP;
--    END;
--/

-- c)
BEGIN
    init_departments;
END;
/

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

    PROCEDURE add_employee (
        p_first_name employees.first_name%TYPE,
        p_last_name  employees.last_name%TYPE,
        p_deptid     employees.department_id%TYPE
    );

    PROCEDURE get_employee (
        p_empid IN employees.employee_id%TYPE,
        p_sal   OUT employees.salary%TYPE,
        p_job   OUT employees.job_id%TYPE
    );

    FUNCTION get_employee (
        p_emp_id employees.employee_id%TYPE
    ) RETURN employees%rowtype;

    FUNCTION get_employee (
        p_family_name employees.last_name%TYPE
    ) RETURN employees%rowtype;

    PROCEDURE init_departments;

    PROCEDURE print_employee (
        p_rec_emp employees%rowtype
    );

END emp_pkg;
/

CREATE OR REPLACE PACKAGE BODY emp_pkg IS

    TYPE boolean_tab_type IS
        TABLE OF BOOLEAN INDEX BY BINARY_INTEGER;
    valid_departments boolean_tab_type;

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
            raise_application_error(-20204, 'Wrong Department');
        END IF;
    END add_employee;

    PROCEDURE add_employee (
        p_first_name employees.first_name%TYPE,
        p_last_name  employees.last_name%TYPE,
        p_deptid     employees.department_id%TYPE
    ) IS
        p_email employees.email%TYPE;
    BEGIN
        p_email := upper(substr(p_first_name, 1, 1)
                         || substr(p_last_name, 1, 7));

        add_employee(p_first_name, p_last_name, p_email, p_deptid => p_deptid);
    END;

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

    FUNCTION get_employee (
        p_emp_id employees.employee_id%TYPE
    ) RETURN employees%rowtype IS
        rec_emp employees%rowtype;
    BEGIN
        SELECT
            *
        INTO rec_emp
        FROM
            employees
        WHERE
            employee_id = p_emp_id;

        RETURN rec_emp;
    END;

    FUNCTION get_employee (
        p_family_name employees.last_name%TYPE
    ) RETURN employees%rowtype IS
        rec_emp employees%rowtype;
    BEGIN
        SELECT
            *
        INTO rec_emp
        FROM
            employees
        WHERE
            last_name = p_family_name;

        RETURN rec_emp;
    END;

    PROCEDURE print_employee (
        p_rec_emp employees%rowtype
    ) IS
    BEGIN
        dbms_output.put_line(p_rec_emp.department_id
                             || ' '
                             || p_rec_emp.employee_id
                             || ' '
                             || p_rec_emp.first_name
                             || ' '
                             || p_rec_emp.last_name
                             || ' '
                             || p_rec_emp.job_id
                             || ' '
                             || p_rec_emp.salary);
    END;

    PROCEDURE init_departments IS
    BEGIN
        FOR rec IN (
            SELECT
                department_id
            FROM
                departments
        ) LOOP
            valid_departments(rec.department_id) := true;
        END LOOP;
    END;

BEGIN
    init_departments;
END emp_pkg;
/

-- d)
-- Package Body EMP_PKG compiled
-- Package EMP_PKG compiled

-- 4)
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

    PROCEDURE add_employee (
        p_first_name employees.first_name%TYPE,
        p_last_name  employees.last_name%TYPE,
        p_deptid     employees.department_id%TYPE
    );

    PROCEDURE get_employee (
        p_empid IN employees.employee_id%TYPE,
        p_sal   OUT employees.salary%TYPE,
        p_job   OUT employees.job_id%TYPE
    );

    FUNCTION get_employee (
        p_emp_id employees.employee_id%TYPE
    ) RETURN employees%rowtype;

    FUNCTION get_employee (
        p_family_name employees.last_name%TYPE
    ) RETURN employees%rowtype;

    PROCEDURE init_departments;

    PROCEDURE print_employee (
        p_rec_emp employees%rowtype
    );

END emp_pkg;
/

CREATE OR REPLACE PACKAGE BODY emp_pkg IS

    TYPE boolean_tab_type IS
        TABLE OF BOOLEAN INDEX BY BINARY_INTEGER;
    valid_departments boolean_tab_type;

    FUNCTION valid_deptid (
        p_deptid IN departments.department_id%TYPE
    ) RETURN BOOLEAN IS
        v_dummy PLS_INTEGER;
    BEGIN
        RETURN valid_departments.EXISTS(p_deptid);
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
            raise_application_error(-20204, 'Wrong Department');
        END IF;
    END add_employee;

    PROCEDURE add_employee (
        p_first_name employees.first_name%TYPE,
        p_last_name  employees.last_name%TYPE,
        p_deptid     employees.department_id%TYPE
    ) IS
        p_email employees.email%TYPE;
    BEGIN
        p_email := upper(substr(p_first_name, 1, 1)
                         || substr(p_last_name, 1, 7));

        add_employee(p_first_name, p_last_name, p_email, p_deptid => p_deptid);
    END;

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

    FUNCTION get_employee (
        p_emp_id employees.employee_id%TYPE
    ) RETURN employees%rowtype IS
        rec_emp employees%rowtype;
    BEGIN
        SELECT
            *
        INTO rec_emp
        FROM
            employees
        WHERE
            employee_id = p_emp_id;

        RETURN rec_emp;
    END;

    FUNCTION get_employee (
        p_family_name employees.last_name%TYPE
    ) RETURN employees%rowtype IS
        rec_emp employees%rowtype;
    BEGIN
        SELECT
            *
        INTO rec_emp
        FROM
            employees
        WHERE
            last_name = p_family_name;

        RETURN rec_emp;
    END;

    PROCEDURE print_employee (
        p_rec_emp employees%rowtype
    ) IS
    BEGIN
        dbms_output.put_line(p_rec_emp.department_id
                             || ' '
                             || p_rec_emp.employee_id
                             || ' '
                             || p_rec_emp.first_name
                             || ' '
                             || p_rec_emp.last_name
                             || ' '
                             || p_rec_emp.job_id
                             || ' '
                             || p_rec_emp.salary);
    END;

    PROCEDURE init_departments IS
    BEGIN
        FOR rec IN (
            SELECT
                department_id
            FROM
                departments
        ) LOOP
            valid_departments(rec.department_id) := true;
        END LOOP;
    END;

BEGIN
    init_departments;
END emp_pkg;
/

-- b)
EXECUTE emp_pkg.add_employee('James', 'Bond', 15);
/

-- c)
INSERT INTO departments (
    department_id,
    department_name
) VALUES (
    15,
    'Security'
);

COMMIT;
/

-- d)
EXECUTE emp_pkg.add_employee('James', 'Bond', 15);
/

-- e)
EXECUTE emp_pkg.init_departments;
/

-- f)
EXECUTE emp_pkg.add_employee('James', 'Bond', 15);
/

-- g)
DELETE FROM employees
WHERE
        first_name = 'James'
    AND last_name = 'Bond';

DELETE FROM departments
WHERE
    department_id = 15;

COMMIT;

-- e)
EXECUTE emp_pkg.init_departments;
/

-- 5)
-- a)
CREATE OR REPLACE PACKAGE BODY emp_pkg IS

    TYPE boolean_tab_type IS
        TABLE OF BOOLEAN INDEX BY BINARY_INTEGER;
    valid_departments boolean_tab_type;

    FUNCTION valid_deptid (
        p_deptid IN departments.department_id%TYPE
    ) RETURN BOOLEAN IS
        v_dummy PLS_INTEGER;
    BEGIN
        RETURN valid_departments.EXISTS(p_deptid);
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
            raise_application_error(-20204, 'Wrong Department');
        END IF;
    END add_employee;

    PROCEDURE add_employee (
        p_first_name employees.first_name%TYPE,
        p_last_name  employees.last_name%TYPE,
        p_deptid     employees.department_id%TYPE
    ) IS
        p_email employees.email%TYPE;
    BEGIN
        p_email := upper(substr(p_first_name, 1, 1)
                         || substr(p_last_name, 1, 7));

        add_employee(p_first_name, p_last_name, p_email, p_deptid => p_deptid);
    END;

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

    FUNCTION get_employee (
        p_emp_id employees.employee_id%TYPE
    ) RETURN employees%rowtype IS
        rec_emp employees%rowtype;
    BEGIN
        SELECT
            *
        INTO rec_emp
        FROM
            employees
        WHERE
            employee_id = p_emp_id;

        RETURN rec_emp;
    END;

    FUNCTION get_employee (
        p_family_name employees.last_name%TYPE
    ) RETURN employees%rowtype IS
        rec_emp employees%rowtype;
    BEGIN
        SELECT
            *
        INTO rec_emp
        FROM
            employees
        WHERE
            last_name = p_family_name;

        RETURN rec_emp;
    END;

    PROCEDURE print_employee (
        p_rec_emp employees%rowtype
    ) IS
    BEGIN
        dbms_output.put_line(p_rec_emp.department_id
                             || ' '
                             || p_rec_emp.employee_id
                             || ' '
                             || p_rec_emp.first_name
                             || ' '
                             || p_rec_emp.last_name
                             || ' '
                             || p_rec_emp.job_id
                             || ' '
                             || p_rec_emp.salary);
    END;

    PROCEDURE init_departments IS
    BEGIN
        FOR rec IN (
            SELECT
                department_id
            FROM
                departments
        ) LOOP
            valid_departments(rec.department_id) := true;
        END LOOP;
    END;

BEGIN
    init_departments;
END emp_pkg;
/

-- b)
CREATE OR REPLACE PACKAGE BODY emp_pkg IS

    TYPE boolean_tab_type IS
        TABLE OF BOOLEAN INDEX BY BINARY_INTEGER;
    valid_departments boolean_tab_type;

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
            raise_application_error(-20204, 'Wrong Department');
        END IF;
    END add_employee;

    PROCEDURE add_employee (
        p_first_name employees.first_name%TYPE,
        p_last_name  employees.last_name%TYPE,
        p_deptid     employees.department_id%TYPE
    ) IS
        p_email employees.email%TYPE;
    BEGIN
        p_email := upper(substr(p_first_name, 1, 1)
                         || substr(p_last_name, 1, 7));

        add_employee(p_first_name, p_last_name, p_email, p_deptid => p_deptid);
    END;

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

    FUNCTION get_employee (
        p_emp_id employees.employee_id%TYPE
    ) RETURN employees%rowtype IS
        rec_emp employees%rowtype;
    BEGIN
        SELECT
            *
        INTO rec_emp
        FROM
            employees
        WHERE
            employee_id = p_emp_id;

        RETURN rec_emp;
    END;

    FUNCTION get_employee (
        p_family_name employees.last_name%TYPE
    ) RETURN employees%rowtype IS
        rec_emp employees%rowtype;
    BEGIN
        SELECT
            *
        INTO rec_emp
        FROM
            employees
        WHERE
            last_name = p_family_name;

        RETURN rec_emp;
    END;

    PROCEDURE init_departments IS
    BEGIN
        FOR rec IN (
            SELECT
                department_id
            FROM
                departments
        ) LOOP
            valid_departments(rec.department_id) := true;
        END LOOP;
    END;

    PROCEDURE print_employee (
        p_rec_emp employees%rowtype
    ) IS
    BEGIN
        dbms_output.put_line(p_rec_emp.department_id
                             || ' '
                             || p_rec_emp.employee_id
                             || ' '
                             || p_rec_emp.first_name
                             || ' '
                             || p_rec_emp.last_name
                             || ' '
                             || p_rec_emp.job_id
                             || ' '
                             || p_rec_emp.salary);
    END;

    FUNCTION valid_deptid (
        p_deptid IN departments.department_id%TYPE
    ) RETURN BOOLEAN IS
        v_dummy PLS_INTEGER;
    BEGIN
        RETURN valid_departments.EXISTS(p_deptid);
    EXCEPTION
        WHEN no_data_found THEN
            RETURN false;
    END valid_deptid;

BEGIN
    init_departments;
END emp_pkg;
/

-- c)
CREATE OR REPLACE PACKAGE BODY emp_pkg IS

    TYPE boolean_tab_type IS
        TABLE OF BOOLEAN INDEX BY BINARY_INTEGER;
    valid_departments boolean_tab_type;
    FUNCTION valid_deptid (
        p_deptid IN departments.department_id%TYPE
    ) RETURN BOOLEAN;

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
            raise_application_error(-20204, 'Wrong Department');
        END IF;
    END add_employee;

    PROCEDURE add_employee (
        p_first_name employees.first_name%TYPE,
        p_last_name  employees.last_name%TYPE,
        p_deptid     employees.department_id%TYPE
    ) IS
        p_email employees.email%TYPE;
    BEGIN
        p_email := upper(substr(p_first_name, 1, 1)
                         || substr(p_last_name, 1, 7));

        add_employee(p_first_name, p_last_name, p_email, p_deptid => p_deptid);
    END;

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

    FUNCTION get_employee (
        p_emp_id employees.employee_id%TYPE
    ) RETURN employees%rowtype IS
        rec_emp employees%rowtype;
    BEGIN
        SELECT
            *
        INTO rec_emp
        FROM
            employees
        WHERE
            employee_id = p_emp_id;

        RETURN rec_emp;
    END;

    FUNCTION get_employee (
        p_family_name employees.last_name%TYPE
    ) RETURN employees%rowtype IS
        rec_emp employees%rowtype;
    BEGIN
        SELECT
            *
        INTO rec_emp
        FROM
            employees
        WHERE
            last_name = p_family_name;

        RETURN rec_emp;
    END;

    PROCEDURE init_departments IS
    BEGIN
        FOR rec IN (
            SELECT
                department_id
            FROM
                departments
        ) LOOP
            valid_departments(rec.department_id) := true;
        END LOOP;
    END;

    PROCEDURE print_employee (
        p_rec_emp employees%rowtype
    ) IS
    BEGIN
        dbms_output.put_line(p_rec_emp.department_id
                             || ' '
                             || p_rec_emp.employee_id
                             || ' '
                             || p_rec_emp.first_name
                             || ' '
                             || p_rec_emp.last_name
                             || ' '
                             || p_rec_emp.job_id
                             || ' '
                             || p_rec_emp.salary);
    END;

    FUNCTION valid_deptid (
        p_deptid IN departments.department_id%TYPE
    ) RETURN BOOLEAN IS
        v_dummy PLS_INTEGER;
    BEGIN
        RETURN valid_departments.EXISTS(p_deptid);
    EXCEPTION
        WHEN no_data_found THEN
            RETURN false;
    END valid_deptid;

BEGIN
    init_departments;
END emp_pkg;
/

SET SERVEROUTPUT ON