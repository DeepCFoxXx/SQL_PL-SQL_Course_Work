DECLARE
    TYPE t_rec IS RECORD (
        v_sal        NUMBER(8),
        v_minsal     NUMBER(8) DEFAULT 1000,
        v_hire_date  employees.hire_date%TYPE,
        v_rec1       employees%rowtype
    );
    v_myrec t_rec;
BEGIN
    v_myrec.v_sal := v_myrec.v_minsal + 500;
    v_myrec.v_hire_date := sysdate;
    SELECT
        *
    INTO v_myrec.v_rec1
    FROM
        employees
    WHERE
        employee_id = 100;
    dbms_output.put_line(v_myrec.v_rec1.last_name
                         || ' '
                         || to_char(v_myrec.v_hire_date)
                         || ' '
                         || to_char(v_myrec.v_sal));
END;
/

DECLARE
    TYPE t_emp IS RECORD (
        v_emp_id  NUMBER(6),
        v_l_name  VARCHAR2(25),
        v_salary  NUMBER(8, 2)
    );
    rec v_emp t_emp;
BEGIN
    SELECT
        employee_id,
        last_name,
        salary
    INTO rec_emp
    FROM
        employees
    WHERE
        employee_id = 100;
    SELECT
        employee_id,
        last_name,
       salary
    INTO rec_emp1
    FROM
        employees
    WHERE
        employee_id = 102;
    dbms_output.put('rec.v_emp_id'
                    || ' '
                    || rec.v_l_name
                    || ' '
                    || 'rec.v_salary');
END;
/

DECLARE
    TYPE t_emp IS RECORD (
        v_emp_id  NUMBER(6),
        v_l_name  VARCHAR2(25),
        v_salary  NUMBER(8, 2)
    );
    rec v_emp t_emp;
BEGIN
    SELECT
        employee_id,
        last_name,
        salary
    INTO rec_emp
    FROM
        employees
    WHERE
        employee_id = 100;
    dbms_output.put('rec.v_emp_id'
                    || ' '
                    || rec.v_l_name
                    || ' '
                    || 'rec.v_salary');
END;
/

DECLARE
    rec_employee employees%rowtype;
BEGIN
    SELECT
        *
    INTO rec_employee
    FROM
        employees
    WHERE
        employee_id = 100;
    dbms_output.put(rec.employee.employee_id
                    || ' '
                    || rec_employee.first_name);
END;
/

CREATE TABLE retired_emps (
    empno      NUMBER(4),
    ename      VARCHAR2(10),
    job        VARCHAR2(9),
    mgr        NUMBER(4),
    hiredate   DATE,
    leavedate  DATE,
    sal        NUMBER(7, 2),
    comm       NUMBER(7, 2),
    deptno     NUMBER(2)
)
/

DECLARE
    v_employee_number  NUMBER := 124;
    v_emp_rec          employees%rowtype;
BEGIN
    SELECT
        *
    INTO v_emp_rec
    FROM
        employees
    WHERE
        employee_id = v_employee_number;

    INSERT INTO retired_emps (
        empno,
        ename,
        job,
        mgr,
        hiredate,
        leavedate,
        sal,
        comm,
        deptno
    ) VALUES (
        v_emp_rec.employee_id,
        v_emp_rec.last_name,
        v_emp_rec.job_id,
        v_emp_rec.manager_id,
        v_emp_rec.hire_date,
        sysdate,
        v_emp_rec.salary,
        v_emp_rec.commission_pct,
        v_emp_rec.department_id
    );
END;
/

INSERT
    INTO retired_emps (
        empno,
        ename,
        job,
        mgr,
        hiredate,
        leavedate,
        sal,
        comm,
        deptno
    )
VALUES ( ( SELECT
    employee_id
FROM
    employees
WHERE
    employee_id = 124),
(
    SELECT
        last_name
    FROM
        employees
    WHERE
        employee_id = 124
),
    );
/

DECLARE
    v_employee_number  NUMBER := 124;
    v_emp_rec          retired_emps%rowtype;
BEGIN SELECT
          employee_id,
          last_name,
          job_id,
          manager_id,
          hire_date,
          hire_date,
          salary,
          commission_pct,
          department_id
      INTO v_emp_rec
      FROM
          employeeswhere employee_id = v_employee_number;
    INSERT INTO retired_emps VALUES v_emp_rec;
END;
/

SELECT
    *
FROM
    retired_emps;
/

SELECT
    current_date
FROM
    dual;
/

set verify OFF DECLARE

    v_employee_number  NUMBER := 124;

    v_emp_rec          retired_emps%rowtype;
begin

select * into v_emp_rec

FROM
    retired_emps;
    v_emp_rec.leavedate := current_date;
    UPDATE retired_emps
    SET
        row = v_emp_rec
    WHERE
        empno = v_employee_number;
END;
/

SELECT
    *
FROM
    retired_emps;
/

TYPE type_name
IS TABLE OF {column_type | variable%TYPE| table.column%TYPE} [NOT NULL] | table%ROWTYPE  | INDEX BY PLS_INTEGER | BINARY_INTEGER| VARCHAR2 ( < size > );identifiertype_name;
/

DECLARE
    TYPE ename_table_type IS
        TABLE OF employees.last_name%TYPE INDEX BY PLS_INTEGER;
TYPE hiredate_table_type IS
    TABLE OF dateindex by PLS_INTEGER;
ename_table      
ename_table_type; hiredate_table  
hiredate_table_type;BEGINename_table(1):= 'CAMERON';
hiredate_table(8) := SYSDATE + 7;IF ename_table.EXISTS(1) THEN
INSERT INTO ......END;
/ DECLARE
    TYPE ename_table_type IS
        TABLE OF VARCHAR2 INDEX BY PLS_INTEGER;
    emp_type
    ename_table_type;

BEGIN
    emp_table(1) := 'Cameron';
    emp_table(2) := 'Smith';
    emp_table(4) := 'John';
    emp_table(3) := 'Ronny';
    emp_table(1) := 'Basit';
    dbmas_output.put_line(emp_table(1));
    dbmas_output.put_line(emp_table(2));
    dbmas_output.put_line(emp_table(4));
    dbmas_output.put_line(emp_table(3));
END;
/

begin FOR i IN 100..105 loop SELECT
                                 last_name
                             INTO
                                 emp_table
                             (100)
                             FROM
                                 employees
                             WHERE
                                 employees_id = i
dbmas_output.put_line(emp_table(1));
end loop END;
/

DECLARE
    TYPE emp_table_type IS
        TABLE OF employees%rowtype INDEX BY PLS_INTEGER;
    my_emp_table  emp_table_type;
    max_count     NUMBER(3) := 104;
beginfor i in 100..max_countLOOPSELECT * INTO my_emp_table(i) FROM employees
WHERE employee_id = i;
END LOOP;FOR i IN my_emp_table.FIRST..my_emp_table.last loopdbms_output.put_line(my_emp_table(i).last_name);
END LOOP;
END;
/

DECLARE
    TYPE ename_table_type IS
        TABLE OF VARCHAR2 INDEX BY PLS_INTEGER;
    emp_type
    ename_table_type;
BEGIN
    emp_table(1) := 'Cameron';
    emp_table(2) := 'Smith';
    emp_table(4) := 'John';
    emp_table(3) := 'Ronny';
    emp_table(1) := 'Basit';
    if emp_table(3).exists then
    dbmas_output.put_line(emp_table(3));
    end if;
END;
/

DECLARE TYPE dept_table_type IS
    TABLE OF departments%rowtype index PLS_INTEGER;
dept_table dept_table_type;
--Each element of dept_table is a record
BeginSELECT * INTO dept_table(1)
FROM departmentsWHERE department_id = 10;
DBMS_OUTPUT.PUT_LINE(dept_table(1).department_id || ||dept_table(1).department_name ||
|| dept_table(1).manager_id );
END;
/

for i in emp_table.FIRST..emp_table.LAST
/

DECLARE
    TYPE location_type IS
        TABLE OF locations.city%TYPE;
    offices      location_type;
        table_count  NUMBER;
    beginoffices := location_type('Bombay', 'Tokyo', 'Singapore', 'Oxford');
    FOR i IN 1..offices.count() LOOP
        dbms_output.put_line(offices(i));
    END LOOP;
END;
/

DECLARE
    i PLS_INTEGER := 10;
BEGIN WHILE ( i < 70 ) LOOP i + i + 10
end loop;
END;
/

offices(4) := 'London';
offices.extend(1);
offices(5) := 'Paris';
-- offices.extend(2);
/

TYPE location_type IS VARRAY(3) OF locations.city% type;offices
location_type;
/

SET SERVEROUTPUT ON