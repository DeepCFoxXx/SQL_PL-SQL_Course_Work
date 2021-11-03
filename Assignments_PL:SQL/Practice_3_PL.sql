-- 1) 
-- a)
-- 2

-- b)
-- Western Europe

-- c)
-- 601 

-- d)
-- 'Product 10012' 'is in stock'

-- e) 
-- Not in upper declare 

-- 2)
-- a)
-- 201

-- b)
-- unisports 

-- c)
-- good

-- d)
-- womansport

-- e)
-- v_name is nested 

-- f)
-- Excellent

-- 3)
-- a)
-- variable b_basic_percent NUMBER
-- variable b_pf_percent NUMBER

-- SET SERVEROUTPUT ON

-- b) 
/*
  :b_basic_percent := 45;
  :b_pf_percent := 12;
*/

-- c)
-- DECLARE 
--  v_basic_percent NUMBER := 45;
--  v_pf_percent NUMBER := 12;
--  v_fname VARCHAR2(15);
--  v_emp_sal NUMBER(10);

-- d)
--DECLARE
--    v_basic_percent NUMBER := 45;
--    v_pf_percent    NUMBER := 12;
--    v_fname         VARCHAR2(15);
--    v_emp_sal       NUMBER(10);
--BEGIN
--    SELECT
--        first_name,
--        salary
--   INTO
--        v_fname,
--        v_emp_sal
--    FROM
--        employees
--    WHERE
--        employee_id = 110;

--END;

-- e)
--DECLARE
--    v_basic_percent NUMBER := 45;
--    v_pf_percent    NUMBER := 12;
--    v_fname         VARCHAR2(15);
--    v_emp_sal       NUMBER(10);
--BEGIN
--    SELECT
--        first_name,
--        salary
--    INTO
--        v_fname,
--        v_emp_sal
--    FROM
--        employees
--    WHERE
--        employee_id = 110;

--    DBMS_output.put_line(' Hello ' || v_fname);
/*
DBMS_OUTPUT.PUT_LINE('Today Is : ' || v_today);
DBMS_OUTPUT.PUT_LINE('Tomorrow Is : ' || v_tomorrow);
*/

-- END;

-- f)
DECLARE
    v_basic_percent NUMBER := 45;
    v_pf_percent    NUMBER := 12;
    v_fname         VARCHAR2(15);
    v_emp_sal       NUMBER(10);
BEGIN
    SELECT
        first_name,
        salary
    INTO
        v_fname,
        v_emp_sal
    FROM
        employees
    WHERE
        employee_id = 110;

    DBMS_output.put_line(' Hello ' || v_fname);
/*
DBMS_OUTPUT.PUT_LINE('Today Is : ' || v_today);
DBMS_OUTPUT.PUT_LINE('Tomorrow Is : ' || v_tomorrow);
*/
    DBMS_output.put_line('Your Salary Is : ' || v_emp_sal);
    DBMS_output.put_line('Your Contribution Towards PF: '
                          || v_emp_sal * v_basic_percent / 100 * v_pf_percent / 100);
END;

-- g)
-- Hello John
-- Your Salary Is : 8200
-- Your Contribution Towards PF: 442.8


-- PL/SQL procedure successfully completed.

SET SERVEROUTPUT ON