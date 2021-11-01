
select *
from employees
where last_name = 'Able';

select *
from employees
where salary > (
                select salary
                from employees
                where employee_id = 174
                );

select *
from employees
where salary > (
                select salary
                from employees
                where last_name = 'Taylor'
                );        

select employee_id, first_name, last_name, salary
from employees
where department_id in(90, 100, 50);

SELECT last_name, job_id, salary
FROM   employees
WHERE  job_id =  (
                  SELECT job_id
                  FROM employees
                  WHERE employee_id = '176'
                 )
AND   
salary >(
         SELECT salary
         FROM   employees
         WHERE employee_id = '176'
        );

       
select *
from employees
where job_id = (
                select job_id
                from employees
                where employee_id = 176
                )
and salary > (
              select salary
              from employees
              where employee_id = 176
              );  

              
select *
from employees
where salary = (
               select min(salary)
               from employees
               );

select *
from employees
where salary = (
               select max(salary)
               from employees
               );        

SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) >(SELECT MIN(salary)
FROM  employees
WHERE department_id = 50);   

SELECT employee_id, last_name
FROM   employees
WHERE  salary =(
                SELECT  MIN(salary)
                FROM     employees
                GROUP BY department_id
                );

SELECT last_name, job_id
FROM   employees
WHERE  job_id =(
                SELECT job_id
                FROM   employees
                WHERE  last_name = 'Haas'
                );

SELECT last_name, salary, department_id
FROM   employees
WHERE  salary
IN (SELECT   MIN(salary)
FROM     employees
GROUP BY department_id);     

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE  salary < ANY(
                    SELECT salary
                    FROM   employees
                    WHERE  job_id = 'IT_PROG'
                    )
AND job_id <> 'IT_PROG';

select *
from employees
where salary > any(
                   SELECT salary
                   FROM   employees
                   WHERE  job_id = 'IT_PROG'          
                   )
AND job_id != 'IT_PROG';

select *
from employees
where salary > all(
                  SELECT salary
                  FROM   employees
                  WHERE  job_id = 'IT_PROG'          
                   )
AND job_id != 'IT_PROG';

SELECT *
FROM departments
WHERE NOT EXISTS(SELECT * FROM employees
WHERE employees.department_id = departments.department_id);

SELECT *
FROM departments
WHERE EXISTS(SELECT * FROM employees
WHERE employees.department_id = departments.department_id);

select *
from departments
where department_id in (select distinct department_id from employees);

select distinct department_id
from employees
where department_id is not null
order by 1;

select manager_id
from employees;

SELECT emp.last_name, emp.employee_id
FROM   employees emp
WHERE  emp.employee_id in(
                          SELECT mgr.manager_id
                          FROM   employees mgr
                          );

SELECT emp.last_name, emp.employee_id
FROM   employees emp
WHERE  emp.employee_id not in(
                              SELECT nvl(mgr.manager_id, 0)
                              FROM   employees mgr
                              );           

                              

-- list of managers and total of employees
select
    m.employee_id,
    m.first_name,
    m.last_name,
    count (e.employee_id) as number_of_employees
from employees e
join employees m
on e.manager_id = m.employee_id
group by m.employee_id, m.first_name, m.last_name, e.employee_id;

select department_id, count(*)
from employees
group by department_id;

select d.department_name, table2.count
from departments d
join (
      select department_id, count(*) as count
      from employees
      group by department_id
      ) table2
on d.department_id = table2.department_id;

select  manager_id, count(*)
from employees
group by manager_id;

select employee_id, first_name, last_name, count as "Number of Employees"
from employees e join (
                       select manager_id, count(*) as count
                       from employees
                       group by manager_id
                       ) t2
on e.employee_id = t2.manager_id
order by 4 desc;     