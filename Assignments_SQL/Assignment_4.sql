-- 1)
select last_name || ' earns £' || salary ||' monthly but wants £' || salary * 3  as "Dream Salary"
from employees;

-- 2)
select last_name, hire_date, to_char(next_day(add_months(hire_date, 6), 'Monday'), 'fmDay, "the" Ddspth "of" Month, YYYY') as "Review" 
from employees; 

-- 3)
select last_name, hire_date, TO_CHAR(hire_date, 'DAY') as "Day" 
from employees
order by TO_CHAR(hire_date - 1, 'd');

-- 4)
select last_name, NVL(TO_CHAR(commission_pct), 'No Commission') as "Comm" 
from employees;

-- 5)
select job_id, decode (job_id, 'ST_CLERK',  'E', 'SA_REP', 'D', 'IT_PROG', 'C', 'ST_MAN', 'B', 'AD_PRES', 'A', '0') as  "Grade" 
from employees; 

-- 6) 
select job_id, 
case job_id                
     when 'ST_CLERK' then 'E'                
     when 'SA_REP'   then 'D'                
     when 'IT_PROG'  then 'C'                
     when 'ST_MAN'   then 'B'                
     when 'AD_PRES'  then 'A'               
else '0'  
end as "Grade" 
from employees; 