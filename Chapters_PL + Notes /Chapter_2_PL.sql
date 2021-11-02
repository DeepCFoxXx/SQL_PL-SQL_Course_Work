DECLARE
    v_new_id NUMBER;
BEGIN
    v_new_id := my_seq.nextval;
END;
/

DECLARE
    v_outer_variable VARCHAR2(20) := 'GLOBAL VARIABLE';
BEGIN
    DECLARE
        v_inner_variable VARCHAR2(20) := 'LOCAL VARIABLE';
    BEGIN
        dbms_output.put_line(v_inner_variable);
        dbms_output.put_line(v_outer_variable);
    END;
    dbms_output.put_line(v_outer_variable);
END;
/

BEGIN
    << outer >> DECLARE
        v_father_name    VARCHAR2(20) := 'Patrick';
       v_date_of_birth  DATE := '20-Apr-1972';
    BEGIN
        DECLARE
            v_child_name     VARCHAR2(20) := 'Mike';
            v_date_of_birth  DATE := '12-Dec-2002';
  BEGIN
            dbms_output.put_line('Father''s Name: ' || v_father_name);
            dbms_output.put_line('Date of Birth: ' || outer.v_date_of_birth);
            dbms_output.put_line('Child''s Name: ' || v_child_name);
            dbms_output.put_line('Date of Birth: ' || v_date_of_birth);
        END;
    END;
END outer;
/

BEGIN
    << outer >> DECLARE
        v_sal      NUMBER(7, 2) := 60000;
        v_comm     NUMBER(7, 2) := v_sal * 0.20;
        v_message  VARCHAR2(255) := ' eligible for commission';
    BEGIN
        DECLARE
            v_sal         NUMBER(7, 2) := 50000;
            v_comm        NUMBER(7, 2) := 0;
            v_total_comp  NUMBER(7, 2) := v_sal + v_comm;
        BEGIN
            v_message := 'CLERK not' || v_message;
            outer.v_comm := v_sal * 0.30;
        END;
        v_message := 'SALESMAN' || v_message;
    END;
END outer;
/

set SERVEROUTPUT ON