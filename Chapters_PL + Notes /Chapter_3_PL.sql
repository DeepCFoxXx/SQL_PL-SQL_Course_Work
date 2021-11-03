DECLARE
    v_fname VARCHAR2(25);
BEGIN
    SELECT
        first_name
    INTO v_fname
    FROM
        employees
    WHERE
        employee_id = 200;
    dbms_output.put_line(' First Name is : ' || v_fname);
END;
/

DECLARE
    v_emp_hiredate  employees.hire_date%TYPE;
    v_emp_salary    employees.salary%TYPE;
BEGIN
    SELECT
        hire_date,
        salary
    INTO
        v_emp_hiredate,
        v_emp_salary
    FROM
        employees
    WHERE
        employee_id = 100;
    dbms_output.put_line('Hire date is :' || v_emp_hiredate);
    dbms_output.put_line('Salary is :' || v_emp_salary);
END;
/

DECLARE
    v_sum_sal  NUMBER(10, 2);
    v_deptno   NUMBER NOT NULL := 60;
BEGIN
    SELECT
        SUM(salary) -- group function
                        INTO v_sum_sal
    FROM
        employees
    WHERE
        department_id = v_deptno;
    dbms_output.put_line('The sum of salary is ' || v_sum_sal);
END;
/

DECLARE
    v_sum_sal  NUMBER(10, 2);
    v_deptno   NUMBER NOT NULL := 60;
BEGIN
    SELECT
        SUM(salary)
    INTO v_sum_sal
    FROM
        employees
    WHERE
        department_id = v_deptno;
    dbms_output.put_line('The sum of salary is ' || v_sum_sal);
END;
/

DECLARE
    v_sum_sal  NUMBER(12, 2);
    v_dept_id  departments.department_id%TYPE;
BEGIN
    v_dept_id := 60;
    SELECT
        SUM(salary)
    INTO v_sum_sal
    FROM
        employees
    WHERE
        department_id = v_dept_id;
    dbms_output.put_line(' Sum of salaries of dpeartment ' || v_sum_sal);
END;
/

-- Naming Ambiguities
DECLARE
    hire_date    employees.hire_date%TYPE;
    sysdate      hire_date%TYPE;
    employee_id  employees.employee_id%TYPE := 176;
BEGIN
    SELECT
        hire_date,
        sysdate
    INTO
        hire_date,
        sysdate
    FROM
        employees
    WHERE
        employee_id = employee_id;
END;
/

-- Naming Ambiguities
BEGIN
    INSERT INTO employees (
        employee_id,
        first_name,
        last_name,
        email,
        hire_date,
        job_id,
        salary
    ) VALUES (
        employees_seq.NEXTVAL,
        'Ruth',
        'Cores',
        'RCORES',
        current_date,
        'AD_ASST',
        4000
    );
END;
/

DECLARE
    sal_increase employees.salary%TYPE := 800;
BEGIN
    UPDATE employees
    SET
        salary = salary + sal_increase
    WHERE
        job_id = 'ST_CLERK';
END;
/

DECLARE
    deptno employees.department_id%TYPE := 10;
BEGIN
    DELETE FROM employees
    WHERE
        department_id = deptno;
END;
/

-- BEGIN MERGE INTO copy_emp c
--  USING employees e ON ( e.employee_id = c.empno )
-- WHEN MATCHED THEN UPDATE
-- SET c.first_name = e.first_name,
  --  c.last_name = e.last_name,
  --  c.email = e.email,
  --  . . .
-- WHEN NOT MATCHED THEN
-- INSERT VALUES(e.employee_id, e.first_name, e.last_name,
-- . ..,
--    e.department_id
-- );
-- END;
--/

BEGIN
    MERGE INTO copy_emp c
    USING employees e ON ( e.employee_id = c.empno )
    WHEN MATCHED THEN UPDATE
    SET c.first_name = e.first_name,
        c.last_name = e.last_name,
        c.email = e.email,
        c.phone_number = e.phone_number,
        c.hire_date = e.hire_date,
        c.job_id = e.job_id,
        c.salary = e.salary,
        c.commission_pct = e.commission_pct,
        c.manager_id = e.manager_id,
        c.department_id = e.department_id
    WHEN NOT MATCHED THEN
    INSERT
    VALUES
        ( e.employee_id,
          e.first_name,
          e.last_name,
          e.email,
          e.phone_number,
          e.hire_date,
          e.job_id,
          e.salary,
          e.commission_pct,
          e.manager_id,
          e.department_id );
END;
/

DECLARE
    v_rows_deleted  VARCHAR2(30);
    v_empno         employees.employee_id%TYPE := 176;
BEGIN
    DELETE FROM employees
    WHERE
        employee_id = v_empno;
    v_rows_deleted := ( SQL%rowcount
                        || ' row deleted.' );
    dbms_output.put_line(v_rows_deleted);
END;
/

DECLARE
    sal_increase employees.salary%TYPE := 800;
BEGIN
    UPDATE employees
    SET
        salary = salary + sal_increase
    WHERE
        job_id = 'ST_CLERK';
    dbms_output.put_line(SQL%rowcount || ' Rows updated... ');
END;
/

DECLARE
    v_rows_deleted  VARCHAR2(30);
    v_empno         employees.employee_id%TYPE := 176;
BEGIN
    DELETE FROM employees
    WHERE
        employee_id = v_empno;
    v_rows_deleted := ( SQL%rowcount
                        || ' row deleted.' );
    dbms_output.put_line(v_rows_deleted);
END;
/