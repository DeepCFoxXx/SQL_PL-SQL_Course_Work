-- 1)
CREATE TABLE dept (
    id   NUMBER(7),
    name VARCHAR2(25)
);

DESCRIBE dept

-- 2)
INSERT INTO dept
    SELECT
        department_id,
        department_name
    FROM
        departments;
-- 3)
CREATE TABLE emp (
    id         NUMBER(7),
    last_name  VARCHAR2(25),
    first_name VARCHAR2(25),
    dept_id    NUMBER(7)
);

DESCRIBE emp

-- 4)
CREATE TABLE employees2
    AS
        SELECT
            employee_id   id,
            first_name,
            last_name,
            salary,
            department_id dept_id
        FROM
            employees; 

-- 5)
ALTER TABLE employees2 READ ONLY;
 
-- 6)  
INSERT INTO employees2 VALUES (
    34,
    'Grant',
    'Marcie',
    5678,
    10
);
-- SQL Error: ORA-12081: update operation not allowed on table "ADMIN"."EMPLOYEES2"

-- 7) 
ALTER TABLE employees2 READ WRITE;

INSERT INTO employees2 VALUES (
    34,
    'Grant',
    'Marcie',
    5678,
    10
);

-- 8)
ALTER TABLE employees2 READ ONLY;

DROP TABLE employees2;
