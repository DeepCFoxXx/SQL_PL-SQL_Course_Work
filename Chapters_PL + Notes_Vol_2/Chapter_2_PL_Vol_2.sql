CREATE OR REPLACE FUNCTION get_sal (
    p_id employees.employee_id%TYPE
) RETURN NUMBER IS
    v_sal employees.salary%TYPE := 0;
BEGIN
    SELECT
        salary
    INTO v_sal
    FROM
        employees
    WHERE
        employee_id = p_id;
    RETURN v_sal;
END get_sal;
/

EXECUTE dbms_output.put_line(get_sal(100))
/

VARIABLE b_salary NUMBER

EXECUTE :b_salary := get_sal(100)

SET SERVEROUTPUT ON

DECLARE
    sal employees.salary%TYPE;
BEGIN
    sal := get_sal(100);
    dbms_output.put_line('The salary is: ' || sal);
END;
/

SELECT
    job_id,
    get_sal(employee_id)
FROM
    employees;
/

CREATE OR REPLACE FUNCTION tax (
    p_value IN NUMBER
) RETURN NUMBER IS
BEGIN
    IF p_value < 10000 THEN
        RETURN p_value * 0.1;
    ELSIF p_value < 20000 THEN
        RETURN p_value * 0.15;
    ELSE
        RETURN p_value * 0.20;
    END IF;
END tax;
/

SELECT
    employee_id,
    last_name,
    salary,
    tax(salary)
FROM
    employees
WHERE
    department_id = 100;
/

-- Will fail " Table has been mutated "
CREATE OR REPLACE FUNCTION dml_call_sql (
    p_sal NUMBER
) RETURN NUMBER IS
BEGIN
    INSERT INTO copy_emp (
        employee_id,
        last_name,
        email,
        hire_date,
        job_id,
        salary
    ) VALUES (
        1,
        'Frost',
        'jfrost@company.com',
        sysdate,
        'SA_MAN',
        p_sal
    );
    return(p_sal + 100);
END;
/

UPDATE employees
SET
    salary = dml_call_sql(2000)
WHERE
    employee_id = 170;
/

CREATE OR REPLACE FUNCTION f (
    p_parameter_1  IN  NUMBER DEFAULT 1,
    p_parameter_5  IN  NUMBER DEFAULT 5
) RETURN NUMBER IS
    v_var NUMBER;
BEGIN
    v_var := p_parameter_1 + ( p_parameter_5 * 2 );
    RETURN v_var;
END f;
/

SELECT f(p_parameter_5 => 10) FROM DUAL;
/

DESCRIBE user_source

SELECT
    text
FROM
    user_source
WHERE
    type = 'FUNCTION'
ORDER BY
    line;
/

SET SERVEROUTPUT ON