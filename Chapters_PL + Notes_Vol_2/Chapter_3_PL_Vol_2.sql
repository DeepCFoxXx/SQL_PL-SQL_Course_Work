CREATE OR REPLACE PACKAGE comm_pkg IS
    v_std_comm NUMBER := 0.10;
    PROCEDURE reset_comm (
        p_new_comm NUMBER
    );

END comm_pkg;
/

CREATE OR REPLACE PACKAGE BODY comm_pkg IS
    FUNCTION validate (
        p_comm NUMBER
    ) RETURN BOOLEAN IS
        v_max_comm employees.commission_pct%TYPE;
    BEGIN
        SELECT
            MAX(commission_pct)
        INTO v_max_comm
        FROM
            employees;
        return(p_comm BETWEEN 0.0 AND v_max_comm);
    END validate;
/

    PROCEDURE reset_comm (
        p_new_comm NUMBER
    ) IS
    BEGIN
        IF validate(p_new_comm) THEN
            v_std_comm := p_new_comm;
        ELSE
            raise_application_error(-20210, 'Bad Commission');
        END IF;
    END reset_comm;

--    FUNCTION get_std_comm RETURN NUMBER IS
--    BEGIN
--        RETURN v_std_commm;
--    END get_std_comm;
END comm_pkg;
/

CREATE OR REPLACE PACKAGE BODY comm_pkg IS
    PROCEDURE reset_comm (
        p_new_comm NUMBER
    ) IS
    BEGIN
        IF validate(p_new_comm) THEN
            v_std_comm := p_new_comm;
            else;
        END IF;
    END reset_comm;
END comm_pkg;

EXECUTE comm_pkg.reset_comm(0.15)
EXECUTE scott.comm_pkg.reset_comm(0.15)
/

--begin
--dbms_output.put_line(comm_pkg.v_std_comm);
--end;
--/

CREATE OR REPLACE PACKAGE global_consts IS
    c_mile_2_kilo CONSTANT NUMBER := 1.6093;
    c_kilo_2_mile CONSTANT NUMBER := 0.6214;
    c_yard_2_meter CONSTANT NUMBER := 0.9144;
    c_meter_2_yard CONSTANT NUMBER := 1.0936;
END global_consts;
/

BEGIN
    dbms_output.put_line('20 miles = '
                         || 20 * global_consts.c_mile_2_kilo
                         || ' km');
END;
/

CREATE FUNCTION mtr2yrd (
    p_m NUMBER
) RETURN NUMBER IS
BEGIN
    return(p_m * global_consts.c_meter_2_yard);
END mtr2yrd;
/

EXECUTE dbms_output.put_line(mtr2yrd(1))
/

begin
dbms_output.put_line(comm_pkg.get_std_comm);
end;
/

SELECT
    text
FROM
    user_source
WHERE
        name = 'COMM_PKG'
    AND type = 'PACKAGE'
ORDER BY
    line;
SELECT
    text
FROM
    user_source
WHERE
        name = 'COMM_PKG'
    AND type = 'PACKAGE BODY'
ORDER BY
    line;
/

SET SERVEROUTPUT ON