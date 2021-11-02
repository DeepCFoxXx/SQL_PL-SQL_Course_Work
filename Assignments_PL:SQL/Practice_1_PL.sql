-- 1)

-- a)
-- BEGIN
-- END;
-- does not execute, no code 

-- b)
--DECLARE
--v_amount INTEGER(10);
--END;
-- does not execute, missing begin 

-- c)
-- DECLARE
-- BEGIN
-- END;
-- does not execute, no code 

-- d)
   DECLARE
   v_amount integer(10);
   BEGIN
   dbms_output.put_line('amount');
   END;
-- executes 

--2)
BEGIN
    dbms_output.put_line('Hello World');
END;

SET SERVEROUTPUT ON