SELECT  l.city,
        D.department_name
FROM   locations L, departments D 
WHERE  L.location_id = D.location_id;


SELECT  l.city, 
        D.department_name
FROM locations L 
JOIN departments D
USING (location_id)
WHERE location_id = 1400;


SELECT	department_id, department_name, 
		location_id, city
FROM	departments 
NATURAL JOIN    locations 

WHERE   location_id IN (20, 50);


SELECT	e.employee_id, e.last_name, e.department_id,
		d.department_id, d.location_id
FROM	employees e  
JOIN  departments d
ON		(e.department_id = d.department_id);



select e.last_name,
        m.last_name
from employees e
join employees m
on (e.manager_id = m.employee_id);


SELECT	E.LAST_NAME, E.SALARY, J.GRADE
FROM	EMPLOYEES E  JOIN JOB_GRADES J
ON		(E.SALARY BETWEEN J.LOWEST_SAL AND J.HIGHEST_SAL)
where   j.grade='A';

select  d.department_id,
        d.department_name,
        l.location_id,
        l.city
from departments d
join locations l
on (d.location_id=l.location_id);


select  e.employee_id,
        e.last_name,
        d.department_name
from employees e
left join departments d
on (e.department_id = d.department_id);


select  d.department_name,
        count(d.department_name)
from employees e
left join departments d
on (e.department_id = d.department_id)
group by d.department_name;
        
        




