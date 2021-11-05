BEGIN
    FOR i IN 1..5 LOOP
        dbms_output.put_line('Plumbus');
        FOR j IN 1..5 LOOP
            dbms_output.put_line('Hello World');
        END LOOP;
    END LOOP;
END;
/

DECLARE
    v_count NUMBER := 0;
BEGIN
    FOR i IN 1..5 LOOP
        FOR j IN 1..6 LOOP
            v_count := v_count + 1;
            dbms_output.put_line(i * j || ' .Hello World');
        END LOOP;
    END LOOP;
END;
/

DECLARE
    v_count NUMBER := 0;
BEGIN
    FOR i IN 1..5 LOOP
        FOR j IN 1..6 LOOP
            v_count := v_count + 1;
            dbms_output.put_line('i= '
                                 || i
                                 || ' j= '
                                 || j
                                 || ' '
                                 || v_count
                                 || ' .Hello World');
        END LOOP;
    END LOOP;
END;
/

BEGIN
    << outer_loop >> LOOP
        v_counter := v_counter + 1;
        EXIT WHEN v_counter > 10;
        << inner_loop >> LOOP
            EXIT outer_loop WHEN total_done = 'YES';
            --Leave both loops
                                            EXIT WHEN inner_done = 'YES';
--Leave inner loop only...
                            END LOOP inner_loop;
    END LOOP outer_loop;
END;
/

DECLARE
    v_total SIMPLE_INTEGER := 0;
BEGIN
    FOR i IN 1..10 LOOP
        v_total := v_total + i;
        dbms_output.put_line('Total is: ' || v_total);
        CONTINUE WHEN i > 5;
        v_total := v_total + i;
        dbms_output.put_line('Out of Loop Total is:' || v_total);
    END LOOP;
END;
/

create procedure my_Pro is
    v_total SIMPLE_INTEGER := 0;
BEGIN
    FOR i IN 1..10 LOOP
        v_total := v_total + i;
        dbms_output.put_line('Total is: ' || v_total);
        CONTINUE WHEN i > 5;
        v_total := v_total + i;
        dbms_output.put_line('Out of Loop Total is:' || v_total);
    END LOOP;
END;
/

DECLARE
    v_total NUMBER := 0;
BEGIN
    << beforetoploop >> FOR i IN 1..10 LOOP
        v_total := v_total + 1;
        dbms_output.put_line('Total is: ' || v_total);
        FOR j IN 1..10 LOOP
            CONTINUE beforetoploop WHEN i + j > 5;
            v_total := v_total + 1;
        END LOOP;
    END LOOP;
END two_loop;

SET SERVEROUTPUT ON