-- 1)
-- a)
--CREATE PROCEDURE greet IS
--    v_today    DATE := sysdate;
--    v_tomorrow today%TYPE;
--BEGIN
--    v_tomorrow := v_today + 1;
--    dbms_output.put_line(' Hello World ');
--    dbms_output.put_line('TODAY IS : ' || to_char(v_today, 'dd Mon yyyy'));
--    dbms_output.put_line('TOMORROW IS : ' || to_char(v_tomorrow, 'dd Mon yyyy'));
--END;
--/

-- b)
-- run procedure

-- c)
-- Save

-- d)
-- clear

-- e)
BEGIN
    greet;
END;
/

-- 2)
-- a)
-- drop procedure greet;

-- b)
CREATE PROCEDURE greet(p_name varchar2) IS
    v_today    DATE := sysdate;
    v_tomorrow today%TYPE;
BEGIN
    v_tomorrow := v_today + 1;
    dbms_output.put_line(' Hello World ');
    dbms_output.put_line('TODAY IS : ' || to_char(v_today, 'dd Mon yyyy'));
    dbms_output.put_line('TOMORROW IS : ' || to_char(v_tomorrow, 'dd Mon yyyy'));
END;
/

-- c)
CREATE PROCEDURE greet(p_name varchar2) IS
    v_today    DATE := sysdate;
    v_tomorrow today%TYPE;
BEGIN
    v_tomorrow := v_today + 1;
    dbms_output.put_line(' Hello ' ||  p_name);
    dbms_output.put_line('TODAY IS : ' || to_char(v_today, 'dd Mon yyyy'));
    dbms_output.put_line('TOMORROW IS : ' || to_char(v_tomorrow, 'dd Mon yyyy'));
END;
/

-- d)
-- save

-- e)
-- run

-- f)
BEGIN
    greet('Luke');
END;
/

SET SERVEROUTPUT ON