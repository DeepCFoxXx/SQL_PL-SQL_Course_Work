-- 1)

-- a) today = yes
-- b) last_name = yes
-- c) today's_date = no (' can not be used in naming a variable)
-- d) Number_of_days_in_Febuary_this_year = yes
-- e) IsLeap$year = yes
-- f) #NUMBER = no (cannot start with special chracter)
-- g) NUMBER# = yes
-- h) number1to7 = yes 

-- 2)

-- a) number_of_copies PLS_INTEGER; = yes
-- b) PRINTER_NAME constant VARCHAR2(10); = no (constant not used at this level)
-- c) deliver_to VARCHAR2(10):=Johnson; = no (missing quoates) 
-- d) by_when DATE:=CURRENT_DATE+1;

-- 3)
DECLARE
    v_fname VARCHAR2(20);
    v_lname VARCHAR2(15) DEFAULT 'fernandez';
BEGIN
    dbms_output.put_line(v_fname
                         || ''
                         || v_lname);
END;

-- Answer = a works and prints out the needed string

-- 4)
DECLARE
    v_today    DATE := sysdate;
    v_tomorrow v_today%TYPE;
BEGIN
    v_tomorrow := v_today + 1;
    dbms_output.put_line(' Hello World ');
    dbms_output.put_line('TODAY IS : ' || to_char(v_today, 'dd Mon yyyy'));
    dbms_output.put_line('TOMORROW IS : ' || to_char(v_tomorrow, 'dd Mon yyyy'));
END;

 -- Hello World 
-- TODAY IS : 26 Oct 2021
-- TOMORROW IS : 27 Oct 2021

-- 5)
VARIABLE b_basic_percent NUMBER

VARIABLE b_pf_percent NUMBER
/

:b_basic_percent := 45;

:b_pf_percent := 12;

print b_basic_percent
print b_pf_percent

SET SERVEROUTPUT ON