-- 1)
-- a)
CREATE OR REPLACE PROCEDURE employee_report (
    p_dir      IN VARCHAR2,
    p_filename IN VARCHAR2
) IS f UTL_FILE.FILE_TYPE;   
CURSOR cur_avg IS 
  SELECT last_name, department_id, salary    
  FROM employees outer
  WHERE salary > (SELECT AVG(salary)   
                  FROM  employees inner    
                  GROUP BY outer.department_id)     
  ORDER BY department_id;
BEGIN
    f := utl_file.fopen(p_dir, p_filename, 'W');
    utl_file.put_line(f, 'Employees who earn more than average       salary: ');
    utl_file.put_line(f, 'REPORT GENERATED ON ' || sysdate);
    utl_file.new_line(f);
    FOR emp IN cur_avg LOOP
        utl_file.put_line(f, rpad(emp.last_name, 30)
                             || ' '
                             || lpad(nvl(to_char(emp.department_id, '9999'), '-'), 5)
                             || ' '
                             || lpad(to_char(emp.salary, '$99,999.00'), 12));
    END LOOP;

    utl_file.new_line(f);
    utl_file.put_line(f, '*** END OF REPORT ***');
    utl_file.fclose(f);
END employee_report;
/ 

-- b)
-- Procedure EMPLOYEE_REPORT compiled
--/

-- 2)
-- EXECUTE employee_report('REPORTS_DIR','sal_rpt61.txt') 

-- 3) 
-- done but from a MAC / Linux point of view 


