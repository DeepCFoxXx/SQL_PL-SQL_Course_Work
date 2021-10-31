-- 1)
CREATE TABLE my_employee (
    id         NUMBER(4)
        CONSTRAINT my_employee_id_nn NOT NULL,
    last_name  VARCHAR2(25),
    first_name VARCHAR2(25),
    userid     VARCHAR2(8),
    salary     NUMBER(9, 2)
);

-- 2)
DESCRIBE my_employee

-- 3)
INSERT INTO my_employee VALUES (
    1,
    'patel',
    'ralph',
    'rpatel',
    895
);
    
-- 4) 
INSERT INTO my_employee (
    id,
    last_name,
    first_name,
    userid,
    salary
) VALUES (
    2,
    'dancs',
    'betty',
    'bdancs',
    860
);

-- 5)
SELECT
    *
FROM
    my_employee;
    
-- 6) 
INSERT INTO my_employee VALUES (
    &p_id,
    '&p_last_name',
    '&p_first_name',
    '&p_userid',
    &p_salary
);

--7) 
INSERT INTO my_employee VALUES (
    &p_id,
    '&p_last_name',
    '&p_first_name',
    '&p_userid',
    &p_salary
);
-- 9
-- Luke 
-- Skywalker
-- 9
-- 999

-- 8)
SELECT
    *
FROM
    my_employee;
    
-- 9)
COMMIT;

-- 10)
UPDATE my_employee
SET
    last_name = 'Drexler'
WHERE
    id = 3;

-- 11)
UPDATE my_employee
SET
    salary = 1000
WHERE
    salary < 900;
    
-- 12)
SELECT
    *
FROM
    my_employee;

-- 13)
DELETE FROM my_employee
WHERE
    last_name = 'dancs';
    
-- 14)
SELECT
    *
FROM
    my_employee;

-- 15) 
COMMIT;

-- 16)
INSERT INTO my_employee VALUES (
    &p_id,
    '&p_last_name',
    '&p_first_name',
    '&p_userid',
    &p_salary
);

-- 17)
SELECT
    *
FROM
    my_employee;

-- 18)
SAVEPOINT step_17; 

-- 19) 
DELETE FROM my_employee; 

-- 20)
SELECT
    *
FROM
    my_employee;
    
-- 21)
ROLLBACK TO step_17; 

-- 22)
SELECT
    *
FROM
    my_employee;
    
-- 23)  
COMMIT;

-- 24)
INSERT INTO my_employee VALUES (
    &p_id,
    '&&p_last_name',
    '&&p_first_name',
    lower(substr('&p_first_name', 1, 1)
          || substr('&p_last_name', 1, 7)),
    &p_salary
);

--25)
-- 6
-- Anthony
-- Mark
-- 1230

-- 26)
SELECT
    *
FROM
    my_employee;