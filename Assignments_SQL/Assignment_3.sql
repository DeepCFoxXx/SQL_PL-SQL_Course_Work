-- 1)
select sysdate from dual;

-- 2) 
select employee_id, last_name, salary, salary + (salary * 15.5/100) "Salary + 15%"
from employees;

-- 3) 
100	King	24000	27720
101	Kochhar	17000	19635
102	De Haan	17000	19635
103	Hunold	9000	10395
104	Ernst	6000	6930
105	Austin	4800	5544
106	Pataballa	4800	5544
107	Lorentz	4200	4851
108	Greenberg	12000	13860
109	Faviet	9000	10395
110	Chen	8200	9471
111	Sciarra	7700	8893.5
112	Urman	7800	9009
113	Popp	6900	7969.5
114	Raphaely	11000	12705
115	Khoo	3100	3580.5
116	Baida	2900	3349.5
117	Tobias	2800	3234
118	Himuro	2600	3003
119	Colmenares	2500	2887.5

-- 4) 
select employee_id, last_name, salary, salary + (salary * 15.5/100) "Salary + 15%", (salary + (salary * 15.5/100)) - salary "Difference"
from employees;

-- 5)
select initcap(last_name) "Name", length(last_name) "Number Of Letters"
from employees
where last_name like 'J%' or last_name like 'A%' or last_name like 'M%'
order by last_name;

select initcap(last_name) "Name", length(last_name) "Number Of Letters"
from employees
where last_name like '&name%'
-- where last_name like upper '&name%'
order by last_name;

-- 6)
select last_name, round(months_between(sysdate,hire_date),0) Months_worked 
from employees
order by 2;

-- 7)
select first_name,
LPAD(salary, 15, '£') SALARY
from employees;
-- Not working correctly

-- 8) 
select rpad(last_name, 8)||' '|| rpad(' ', salary/1000+1, '*') EMPLOYEES_AND_THEIR_SALARIES 
from employees 
-- Not working correctly 

-- 9)
select last_name, trunc(SYSDATE-hire_date) AS TENURE 
from  employees 
where department_id = 90 order by TENURE desc 
