-- 1)
SELECT
    department_id
FROM
    employees
MINUS
SELECT
    department_id
FROM
    employees
WHERE
    upper(job_id) = upper('st_clerk')
ORDER BY
    1;

-- 2)
SELECT
    country_id,
    country_name
FROM
    countries
MINUS
SELECT
    country_id,
    country_name
FROM
         countries c
    JOIN locations   l USING ( country_id )
    JOIN departments d USING ( location_id )
WHERE
    department_id IS NOT NULL;

-- 3)
SELECT DISTINCT
    job_id,
    department_id
FROM
    employees
WHERE
    department_id = 10
UNION ALL
SELECT DISTINCT
    job_id,
    department_id
FROM
    employees
WHERE
    department_id = 50
UNION ALL
SELECT DISTINCT
    job_id,
    department_id
FROM
    employees
WHERE
    department_id = 20;
    
-- 4)
SELECT
    employee_id,
    job_id
FROM
    employees
INTERSECT
SELECT
    employee_id,
    job_id
FROM
    job_history
ORDER BY
    1;
    
-- 5)
SELECT
    last_name,
    department_id,
    to_char('null')
FROM
    employees
UNION
SELECT
    to_char('null'),
    department_id,
    department_name
FROM
    departments
ORDER BY
    1;