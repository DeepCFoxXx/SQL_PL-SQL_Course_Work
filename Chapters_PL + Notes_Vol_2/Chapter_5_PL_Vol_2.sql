CREATE OR REPLACE TRIGGER restrict_salary BEFORE
    INSERT OR UPDATE OF salary ON employees
    FOR EACH ROW
BEGIN
    IF
        NOT ( :new.job_id IN ( 'AD_PRES', 'AD_VP' ) )
        AND :new.salary > 15000
    THEN
        raise_application_error(-20202, 'Employee cannot earn more than $15,000.');
    END IF;
END;
/

UPDATE employees
SET
    salary = 15500,
    job_id = 'AD_VP'
WHERE
    employee_id = 106;
/

CREATE TABLE audit_emp (
    user_name      VARCHAR2(30),
    time_stamp     DATE,
    id             NUMBER(6),
    old_last_name  VARCHAR2(25),
    new_last_name  VARCHAR2(25),
    old_title      VARCHAR2(10),
    new_title      VARCHAR2(10),
    old_salary     NUMBER(8, 2),
    new_salary     NUMBER(8, 2)
)
/

CREATE OR REPLACE TRIGGER audit_emp_values AFTER
    DELETE OR INSERT OR UPDATE ON employees
    FOR EACH ROW
BEGIN
    INSERT INTO audit_emp (
        user_name,
        time_stamp,
        id,
        old_last_name,
        new_last_name,
        old_title,
        new_title,
        old_salary,
        new_salary
    ) VALUES (
        user,
        sysdate,
        :old.employee_id,
        :old.last_name,
        :new.last_name,
        :old.job_id,
        :new.job_id,
        :old.salary,
        :new.salary
    );
END;
/

INSERT INTO employees (
    employee_id,
    last_name,
    job_id,
    salary,
    email,
    hire_date
) VALUES (
    999,
    'Temp emp',
    'SA_REP',
    6000,
    'TEMPEMP',
    trunc(sysdate)
)
/

UPDATE employees
SET
    salary = 7000,
    last_name = 'Smith'
WHERE
    employee_id = 999
/

SELECT
    *
FROM
    audit_emp;
/

DELETE FROM employees
WHERE
    employee_id = 999;
/

CREATE OR REPLACE TRIGGER derive_commission_pct BEFORE
    INSERT OR UPDATE OF salary ON employees
    FOR EACH ROW
    WHEN ( new.job_id = 'SA_REP' )
BEGIN
    IF inserting THEN
        :new.commission_pct := 0;
    ELSIF :old.commission_pct IS NULL THEN
        :new.commission_pct := 0;
    ELSE
        :new.commission_pct := :old.commission_pct + 0.05;
    END IF;
END;
/

UPDATE employees
SET
    department_id = 999
WHERE
    employee_id = 170;
/

CREATE OR REPLACE TRIGGER employee_dept_fk_trg AFTER
    UPDATE OF department_id ON employees
    FOR EACH ROW
BEGIN
    INSERT INTO departments VALUES (
        :new.department_id,
        'Dept ' || :new.department_id,
        NULL,
        NULL
    );
EXCEPTION
    WHEN dup_val_on_index THEN
        NULL;
END;
/

UPDATE employees
SET
    department_id = 999
WHERE
    employee_id = 170;
/   

CREATE TABLE new_emps
    AS
        SELECT
            employee_id,
            last_name,
            salary,
            department_id
        FROM
            employees;
CREATE TABLE new_depts
    AS
        SELECT
            d.department_id,
            d.department_name,
            SUM(e.salary) dept_sal
        FROM
            employees    e,
            departments  d
        WHERE
            e.department_id = d.department_id;
CREATE VIEW emp_details AS
    SELECT
        e.employee_id,
        e.last_name,
        e.salary,
        e.department_id,
        d.department_name
    FROM
        employees    e,
        departments  d
    WHERE
        e.department_id = d.department_id
    GROUP BY
        d.department_id,
        d.department_name;
/

UPDATE emp_details
SET
    department_name = 'Presidential '
WHERE
    employee_id = 100;
/

CREATE OR REPLACE TRIGGER new_emp_dept INSTEAD OF
    INSERT OR UPDATE OR DELETE ON emp_details
    FOR EACH ROW BEGIN IF inserting THEN
    INSERT INTO new_emps VALUES (
        :new.employee_id,
        :new.last_name,
        :new.salary,
        :new.department_id
    );
    UPDATE new_depts set dept_sal = dept_sal+ :NEW.salary
    WHERE department_id = :NEW.department_id;ELSIF DELETING THEN DELETE FROM new_emps
    WHERE employee_id = :OLD.employee_id;UPDATE new_depts SET dept_sal= dept_sal-:OLD.salary
    WHERE department_id = :OLD.department_id;ELSIF UPDATING ('salary') THEN UPDATE new_emps SET salary = :NEW.salary
    WHERE employee_id = :OLD.employee_id;UPDATE new_depts SET dept_sal= dept_sal+ (:NEW.salary -:OLD.salary)
    WHERE department_id = :OLD.department_id; ELSIF UPDATING ('department_id')
    THEN UPDATE new_emps SET department_id = :NEW.department_id
    WHERE employee_id = :OLD.employee_id; UPDATE new_depts SET dept_sal= dept_sal-:OLD.salary
    WHERE department_id = :OLD.department_id;UPDATE new_depts
SET dept_sal = dept_sal + :new.salary
WHERE
department_id = :new.department_id;
END IF;
END;
/

UPDATE emp_details
SET
    employee_id = 80
WHERE
    employee_id = 100;
/

ALTER TRIGGER trigger_name DISABLE;
-- ENABLE;
ALTER TABLE table_name DISABLE ALL TRIGGERS;
-- ENABLE ALL
ALTER TRIGGER trigger_name COMPILE;
/