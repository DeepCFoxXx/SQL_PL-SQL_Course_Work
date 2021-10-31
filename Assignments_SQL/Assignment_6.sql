-- 1)
select location_id, street_address, city, state_province, country_name
from locations
natural join countries;

-- 2)
select  e.last_name, e.department_id, d.department_name 
from employees e 
left join departments d 
on e.department_id = d.department_id;

-- 3)
select e.last_name, e.job_id, e.department_id, d.department_name 
from   employees e 
join departments d  
on (e.department_id = d.department_id) 
join locations l 
on (d.location_id = l.location_id) 
where l.city = 'Toronto'; 

-- 4) 
select w.last_name as "employee", w.employee_id as "emp#", m.last_name as "manager", m.employee_id as "mgr#" 
from employees w 
join employees m 
on w.manager_id = m.employee_id;

-- 5)
select w.last_name as "employee", w.employee_id as "emp#", m.last_name as "manager", m.employee_id as "mgr#" 
from employees w 
left join employees m 
on w.manager_id = m.employee_id
order by w.employee_id;

-- 6)
select
    e.department_id as  "department",
    e.last_name as "employee",
    c.last_name as "work_friend"
from
    employees e,
    employees c
where
    e.department_id = c.department_id
and
    e.last_name <> c.last_name;
    
-- 7) 
select e.first_name, e.last_name, e.job_id, e.salary, d.department_name, j.grade_level
from employees e 
join departments d
on e.department_id = d.department_id
join job_grades J
on e.salary between J.lowest_sal and J.highest_sal
order by 1;

-- 8)
select e.last_name, e.hire_date 
from employees e 
join employees davies 
on (davies.last_name = 'Davies') 
where davies.hire_date < e.hire_date;

-- 9)
select w. first_name, w.last_name, w.hire_date, m.first_name, m.last_name, m.hire_date 
from employees w 
join employees m   
on (w.manager_id = m.employee_id)
where m.hire_date <= m.hire_date
order by 1; 