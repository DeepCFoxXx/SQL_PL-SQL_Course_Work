CREATE OR REPLACE VIEW empvu80 AS
    SELECT
        employee_id,
        last_name,
        salary
    FROM
        employees
    WHERE
        department_id = 80;

DESCRIBE empvu80;

SELECT
    *
FROM
    empvu80;

CREATE OR REPLACE VIEW salvu50 AS
    SELECT
        employee_id id_number,
        last_name   name,
        salary * 12 ann_salary
    FROM
        employees
    WHERE
        department_id = 50
    ORDER BY
        1;

DESCRIBE salvu50;

SELECT
    *
FROM
    salvu50;

CREATE OR REPLACE VIEW empvu80 (
    id_number,
    name,
    sal,
    department_id
) AS
    SELECT
        employee_id,
        first_name
        || ' '
        || last_name,
        salary,
        department_id
    FROM
        employees
    WHERE
        department_id = 80;

CREATE OR REPLACE VIEW dept_sum_vu (
    name,
    minsal,
    maxsal,
    avgsal
) AS
    SELECT
        d.department_name,
        MIN(e.salary),
        MAX(e.salary),
        round(AVG(e.salary), 0)
    FROM
             employees e
        JOIN departments d ON ( e.department_id = d.department_id )
    GROUP BY
        d.department_name;

SELECT
    *
FROM
    dept_sum_vu;

CREATE OR REPLACE VIEW empvu20 AS
    SELECT
        *
    FROM
        employees
    WHERE
        department_id = 20
WITH CHECK OPTION CONSTRAINT empvu20_ck;

SELECT
    *
FROM
    empvu20;

UPDATE empvu20
SET
    department_id = 20
WHERE
    employee_id = 202;

CREATE OR REPLACE VIEW empvu10 (
    employee_number,
    employee_name,
    job_title
) AS
    SELECT
        employee_id,
        last_name,
        job_id
    FROM
        employees
    WHERE
        department_id = 10
WITH READ ONLY;

DROP VIEW empvu80;

CREATE SEQUENCE dept_deptid_seq INCREMENT BY 10 START WITH 280 MAXVALUE 9999 NOCACHE NOCYCLE;

SELECT
    dept_deptid_seq.CURRVAL
FROM
    dual;

SELECT
    dept_deptid_seq.NEXTVAL
FROM
    dual;

INSERT INTO departments (
    department_id,
    department_name,
    location_id
) VALUES (
    dept_deptid_seq.NEXTVAL,
    'Support',
    2500
);

SELECT
    dept_deptid_seq.CURRVAL
FROM
    dual;

DROP SEQUENCE dept_deptid_seq;

ALTER SEQUENCE dept_deptid_seq INCREMENT BY 20 MAXVALUE 999999 NOCACHE NOCYCLE;

CREATE INDEX emp_last_name_idx ON
    employees (
        last_name
    );
    
DROP INDEX emp_last_name_idx;    