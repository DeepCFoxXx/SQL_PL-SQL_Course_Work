-- 1)
CREATE OR REPLACE VIEW employees_vu AS
    SELECT
        employee_id,
        last_name employee,
        department_id
    FROM
        employees;
        
-- 2)
SELECT
    *
FROM
    employees_vu;
    
-- 3)
SELECT
    employee,
    department_id
FROM
    employees_vu;
    
-- 4)
CREATE OR REPLACE VIEW dept50 AS
    SELECT
        employee_id   AS empno,
        last_name     AS employee,
        department_id AS deptno
    FROM
        employees
    WHERE
        department_id = 50
WITH CHECK OPTION CONSTRAINT emp_dept_50;

-- 5)
DESCRIBE dept50

SELECT
    *
FROM
    dept50;
    
-- 6)
UPDATE dept50
SET
    deptno = 80
WHERE
    employee = 'Matos';
    
-- Error report -
-- ORA-01402: view WITH CHECK OPTION where-clause violation    
    
-- 7)    
CREATE SEQUENCE dept_id_seq START WITH 200 INCREMENT BY 10 MAXVALUE 1000;

-- 8)
INSERT INTO dept VALUES (
    dept_id_seq.NEXTVAL,
    'Education'
);

INSERT INTO dept VALUES (
    dept_id_seq.NEXTVAL,
    'Administration'
);

-- 9)
CREATE INDEX dept_name_idx ON
    dept (
        name
    );
    
-- 10)
CREATE SYNONYM emp FOR EMPLOYEES;