DECLARE
    v_lname VARCHAR2(15);
BEGIN
    SELECT
        last_name
    INTO v_lname
    FROM
        employees
    WHERE
        first_name = 'John';
    dbms_output.put_line('John''s last name is :' || v_lname);
EXCEPTION
    WHEN too_many_rows THEN
        dbms_output.put_line(' Your select statement retrieved multiple rows. Consider using a cursor.');
    WHEN no_data_found THEN
        dbms_output.put_line(sqlerrm);
    WHEN OTHERS THEN
        dbms_output.put_line(' Unknown Error !');
END;
/

DECLARE
    e_insert_excep EXCEPTION;
    PRAGMA exception_init ( e_insert_excep, -01400 );
BEGIN
    INSERT INTO departments (
        department_id,
        department_name
    ) VALUES (
        280,
        NULL
    );
EXCEPTION
    WHEN e_insert_excep THEN
       dbms_output.put_line('INSERT OPERATION FAILED');
        dbms_output.put_line(sqlerrm);
        dbms_output.put_line(sqlcode);
END;
/

DECLARE
    error_code     NUMBER;
    error_message  VARCHAR2(255);
BEGIN exception
    WHEN OTHERS THEN
        ROLLBACK;
        error_code := sqlcode;
        error_message := sqlerrm;
        INSERT INTO errors (
            e_user,
            e_date,
            error_code,
            error_message
        ) VALUES (
            user,
            sysdate,
            error_code,
            error_message
        );
END;
/

DECLARE
    v_deptno  NUMBER := 500;
    v_name    VARCHAR2(20) := 'Testing';
    e_invalid_department EXCEPTION;
BEGIN UPDATE departments
SET
    department_name = v_namewhere department_id = v_deptno;
IF SQL% notfound thenraise e_invalid_department;
END IF;
COMMIT;
EXCEPTION
    WHEN e_invalid_department THEN
        dbms_output.put_line('No such department id.');
END;
/

declare e_update_on_no_row exception begin UPDATE dpeartments
SET
    dpeartment_name = 'Testing';
WHERE
department_id = 500;
if SQL%notfound then raise e_update_on_no_row
END IF;
exception
when e_update_on_no_row then
dbms_output.put_line('Could Not Update Based On Criteria');
when END;
/

DECLARE
    v_deptno  NUMBER := 500;
    v_name    VARCHAR2(20) := 'Testing';
    e_invalid_department EXCEPTION;
BEGIN
UPDATE departmentsset department_name = v_nameWHERE department_id = v_deptno;
IF SQL%NOTFOUND THENRAISE e_invalid_department;
END IF;
COMMIT;EXCEPTIONWHEN
    e_invalid_department thendbms_output.put_line('No such department id.');
END;
/

declare. . .e_no_rowsexception;
e_integrityexception;
PRAGMA EXCEPTION_INIT (e_integrity, -2292);

BEGIN
FOR c_record IN emp_cursor LOOP

BEGIN
SELECT UPDATE IF SQL%NOTFOUND THEN
RAISE e_no_rows;
END IF;
END;
END
LOOP;EXCEPTIONWHEN e_integrity
THEN
WHEN e_no_rows
THEN END;
/