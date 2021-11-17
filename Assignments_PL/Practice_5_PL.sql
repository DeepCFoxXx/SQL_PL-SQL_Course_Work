-- 1)
-- a)
--CREATE TABLE messages (
--    results VARCHAR2(80)
--);

-- Alter table emp Add (stars varchar2 (50));
--
--BEGIN
--    FOR i IN 1..10 LOOP
--        IF i = 6 OR i = 8 THEN
--            NULL;
--        ELSE
--            INSERT INTO messages ( results ) VALUES ( i );
--
--        END IF;
--    END LOOP;
--END;
--/

-- b)
--BEGIN
--    FOR i IN 1..10 LOOP
--        IF i = 6 OR i = 8 THEN
--            NULL;
--        ELSE
--            INSERT INTO messages ( results ) VALUES ( i );
--
--        END IF;
--    END LOOP;
--
--    COMMIT;
--END;
--/

-- c)
--SELECT
--    *
--FROM
--    messages;
    
-- 2)
-- a)
--CREATE TABLE emp
--    AS
--        SELECT
--            *
--        FROM
--            employees;

--DECLARE
--    v_empno    emp.employee_id%TYPE := 176;
--    v_asterisk emp.stars%TYPE := NULL;
--    v_sal      emp.salary%TYPE;

-- b)
--DECLARE
--    v_empno    emp.employee_id%TYPE := 176;
--    v_asterisk emp.stars%TYPE := NULL;
--    v_sal      emp.salary%TYPE;
--Begin
--SELECT
--    nvl(round(salary / 1000), 0)
--INTO v_sal
--FROM
--    emp
--WHERE
--    employee_id = v_empno;
--
--FOR i IN 1..v_sal LOOP
--    v_asterisk := v_asterisk || '*';
--END LOOP;
--END;

-- c)
DECLARE
    v_empno    emp.employee_id%TYPE := 176;
    v_asterisk emp.stars%TYPE := NULL;
    v_sal      emp.salary%TYPE;
BEGIN
    SELECT
        nvl(round(salary / 1000), 0)
    INTO v_sal
    FROM
        emp
    WHERE
        employee_id = v_empno;

    FOR i IN 1..v_sal LOOP
        v_asterisk := v_asterisk || '*';
    END LOOP;

    UPDATE emp
    SET
        stars = v_asterisk
    WHERE
        employee_id = v_empno;
    COMMIT;
END;

-- d)
SELECT
    *
FROM
    emp
WHERE
    employee_id = 176;
-- e)
-- 176	Jonathon	Taylor	JTAYLOR	011.44.1644.429265	24-MAR-98	SA_REP	8600	0.2	149	80	*********