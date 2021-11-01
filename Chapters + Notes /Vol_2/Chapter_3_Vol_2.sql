SELECT
    months_between(TO_DATE('02-JAN-2000', 'DD-MON-RRRR'), TO_DATE('01-JAN-2000', 'DD-MON-RRRR'))
FROM
    dual;

SELECT
    TO_DATE('02-JAN-2000', 'DD-MON-RRRR') - TO_DATE('01-JAN-2000', 'DD-MON-RRRR')
FROM
    dual;

SELECT
    m.last_name    "Manager",
    e.last_name    "Employee"
FROM
         employees m
    JOIN employees e ON m.employee_id = e.manager_id
WHERE
    e.manager_id = 100;