--CREATE PROCEDURE raise_sal(p_id NUMBER, p_sal NUMBER) IS
--BEGIN
--END raise_sal;
--/

--v_emp_id := 100;
--raise_sal(v_emp_id, 2000);
--/

CREATE OR REPLACE PROCEDURE raise_salary (
    p_id       IN  employees.employee_id%TYPE,
    p_percent  IN  NUMBER
) IS
BEGIN
    UPDATE employees
    SET
        salary = salary * ( 1 + p_percent / 100 )
    WHERE
        employee_id = p_id;
END raise_salary;
/

EXECUTE raise_salary(176, 10)
/

CREATE OR REPLACE PROCEDURE query_emp (
    p_id       IN   employees.employee_id%TYPE,
    p_nameout  employees.last_name%TYPE,
    p_salary   OUT  employees.salary%TYPE
) IS
BEGIN
    SELECT
        last_name,
        salary
    INTO
        p_name,
        p_salary
    FROM
        employees
    WHERE
        employee_id = p_id;
END query_emp;
/

DECLARE
    v_emp_name  employees.last_name%TYPE;
    v_emp_sal   employees.salary%TYPE;
BEGIN
   query_emp(171, v_emp_name, v_emp_sal);
   dbms_output.put_line(v_emp_name
                         || ' earns '
                         || to_char(v_emp_sal, '$999,999.00'));
END;
/

CREATE OR REPLACE PROCEDURE format_phone (
    p_phone_noin OUT VARCHAR2
) IS
BEGIN
        p_phone_no := '('
                  || substr(p_phone_no, 1, 3)
                  || ') '
                  || substr(p_phone_no, 4, 3)
                  || '-'
                  || substr(p_phone_no, 7);
END format_phone;
/

DECLARE
    v_phone_number VARCHAR2(14);
BEGIN
    v_phone_number := 8006330575;
    format_phone(v_phone_number);
    dbms_output.put_line('Number is: ' || format_phone);
END;
/

DECLARE
    v_emp_name  employees.last_name%TYPE;
    v_emp_sal   employees.salary%TYPE;
BEGIN
    query_emp(171, v_emp_name, v_emp_sal);
    dbms_output.put_line('Name: ' || v_emp_name);
    dbms_output.put_line('Salary: ' || v_emp_sal);
END;
/

CREATE OR REPLACE PROCEDURE add_dept (
    p_namein  departments.department_name%TYPE,
    p_locin   departments.location_id%TYPE
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
END add_dept;
/

VARIABLE b_name VARCHAR2(25);
VARIABLE b_sal NUMBER;
EXECUTE query_emp(171, :b_name, :b_sal);
PRINT b_name
b_sal;
/

SET AUTOPRINT ON

VARIABLE b_phone_no VARCHAR2

ACCEPT b_phone_no CHAR PROMPT 'Enter Phone Number'

EXECUTE format_phone(b_phone_no);
/

EXECUTE add_dept('TRAINING', 2500);
/

EXECUTE add_dept(p_loc => 2400, p_name => 'EDUCATION');
/

CREATE OR REPLACE PROCEDURE add_dept (
    p_man_id  departments.manager_id%TYPE DEFAULT 100,
    p_name    departments.department_name%TYPE := 'New Department',
    p_loc     departments.location_id%TYPE DEFAULT 1700
) IS
BEGIN
    INSERT INTO departments (
        manager_id,
        department_id,
        department_name,
        location_id
    ) VALUES (
        p_man_id,
        departments_seq.NEXTVAL,
        p_name,
        p_loc
    );
END add_dept;
/

EXECUTE add_dept;

EXECUTE add_dept('ADVERTISING', p_loc => 1200);

EXECUTE add_dept(p_loc => 1200);

EXECUTE add_dept(NULL, 'creative');
/

CREATE OR REPLACE PROCEDURE process_employees IS
    CURSOR cur_emp_cursor IS
    SELECT
        employee_id
    FROM
        employees;
BEGIN
    FOR emp_rec IN cur_emp_cursor LOOP
        raise_salary(emp_rec.employee_id, 10);
    END LOOP;
    COMMIT;
END process_employees;
/

EXECUTE process_employees
select * from employees;
/

CREATE PROCEDURE add_departments (
    p_name  VARCHAR2,
    p_mgr   NUMBER,
    p_loc   NUMBER
) IS BEGIN
    INSERT INTO departments (
        department_id,
        department_name,
        manager_id,
        location_id
    ) VALUES (
        departments_seq.NEXTVAL,
        p_name,
        p_mgr,
        p_loc
    );
    dbms_output.put_line('Added Dept: ' || p_name);
exception when
    others then dbms_output.put_line('Err: adding dept: ' || p_name);
END;
/

CREATE PROCEDURE create_departments IS
BEGIN
    add_departments('Media', 100, 1800);
    add_departments('Editing', 99, 1800);
    add_departments('Advertising', 101, 1800);
END;
/
execute create_departments
/

DESCRIBE user_source

SELECT
    text
FROM
   user_source
WHERE
        name = 'ADD_DEPT'
    AND type = 'PROCEDURE'
ORDER BY
    line;
/

select *
from all_source;
/