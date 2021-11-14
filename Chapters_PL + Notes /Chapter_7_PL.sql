DECLARE
    CURSOR c_emp_cursor IS
    SELECT
        employee_id,
        last_name
    FROM
        employees
    WHERE
        department_id = 30;

    declare v_locid number := 1700;
    CURSOR c_dept_cursor IS
    SELECT
        *
    FROM
        departments
    WHERE
        location_id = v_locid;
/

DECLARE
    CURSOR c_emp_cursor IS
    SELECT
        employee_id,
        last_name
    FROM
        employees
    WHERE
        department_id = 30;...BEGIN
OPEN c_emp_cursor;
/

DECLARE
    CURSOR c_emp_cursor IS
    SELECT
        employee_id,
        last_name
    FROM
        employees
    WHERE
        department_id = 30;
    v_empno  employees.employee_id%TYPE;
    v_lname  employees.last_name%TYPE;
BEGIN
    OPEN c_emp_cursor;
    FETCH c_emp_cursor INTO
        v_empno,
        v_lname;
    dbms_output.put_line(v_empno
                         || '  '
                         || v_lname);
END;
/

declare
cursor c_emp_cursor is SELECT
    employee_id,
    last_name
    from employees;
    where department_id = 30;
    order by 2
    v_employee_id employees.employee_id%TYPE;
    v_last_name employees.last_name%TYPE;
BEGIN
    OPEN c_emp_cursor;
    FETCH c_emp_cursor INTO
        v_employee_id,
        v_last_name;
   dbms_output.put_line(v_employee_id
                         || ' '
                         || v_last_name);
   FETCH c_emp_cursor INTO
        v_employee_id,
        v_last_name;
    dbms_output.put_line(v_employee_id
                         || ' '
                         || v_last_name);                     
END;
/

DECLARE
    CURSOR c_emp_cursor IS
    SELECT
        employee_id,
        last_name
    FROM
        employees
    WHERE
        department_id = 30;
    v_empno  employees.employee_id%TYPE;
    v_lname employees.last_name%TYPE;
BEGIN OPEN c_emp_cursor;
loop
fetch c_emp_cursor INTO v_empno,
    v_lname;
    EXIT WHEN c_emp_cursor%notfound;
    dbms_output.put_line(v_empno
                         || '  '
                         || v_lname);
END LOOP;
END;
/

DECLARE
    CURSOR c_emp_cursor IS
    SELECT
        employee_id,
        last_name
    FROM
        employees;
    v_employee_id  employees.employee_id%TYPE;
    v_last_name
    employees.last_name%TYPE;

BEGIN
    OPEN c_emp_cursor;
    LOOP
        FETCH c_emp_cursor INTO
            v_employee_id,
            v_last_name;
        EXIT WHEN c_emp_cursor%notfound;
        dbms_output.put_line(v_employee_id
                             || ' '
                             || v_last_name);
    END LOOP;
END;
/

DECLARE
    CURSOR c_emp_cursor IS
    SELECT
        *
    FROM
        employees;
    rec_emp employees%rowtype;
BEGIN
    OPEN c_emp_cursor;
    LOOP
        FETCH c_emp_cursor INTO
           rec_emp;
        EXIT WHEN c_emp_cursor%notfound;
        dbms_output.put_line( rec_emp.employee_id
|| ' '
|| rec_emp.last_name;
    END loop;
END;
/

DECLARE
    CURSOR c_emp_cursor IS
    SELECT
        employee_id,
        last_name
    FROM
        employees
    WHERE
        department_id = 30;
v_emp_recordc_emp_cursor%ROWTYPE; beginopen
    c_emp_cursor;
    LOOP
        FETCH c_emp_cursor INTO v_emp_record;
        EXIT WHEN c_emp_cursor%notfound;
        dbms_output.put_line(v_emp_record.employee_id
                             || ' '
                             || v_emp_record.last_name);
    END LOOP;
    CLOSE c_emp_cursor;
END;
/

DECLARE
    CURSOR c_emp_cursor IS
    SELECT
        employee_id,
        last_name
    FROM
        employees
    WHERE
        department_id = 30;
BEGIN
    FOR emp_record IN c_emp_cursor LOOP
        dbms_output.put_line(emp_record.employee_id
                             || ' '
                             || emp_record.last_name);
    END LOOP;
END;
/

BEGIN
FOR emp_record IN (
    SELECT
        employee_id,
        last_name
    FROM
        employees
    WHERE
        department_id = 30
) loopdbms_output.put_line(emp_record.employee_id
|| ' '
|| emp_record.last_name);
END LOOP; END;
/

SET SERVEROUTPUT ON