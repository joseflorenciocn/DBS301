--Q2
--Display the last names of all employees who are in the same department as the employee named davies. You need to consider 
--that the name can be input in any mix of case (example AbEl, abel, abEL)

select last_name
from employees
where department_id = (
                        select department_id
                        from employees
                        where Upper(last_name)=Upper('davies')
                      );


--Q3
--Display the first name of the lowest paid employee(s)

select first_name
from employees
where salary = (
                select min(salary)
                from employees
                );

--Q4
--Display the city that the highest paid employee(s) are located in.

select l.city
from locations l 
join departments d
on (d.location_id = l.location_id)
join employees e
on (e.department_id = d.department_id)
where salary = (
                select max(salary)
                from employees
                );

--Q5
--Display the last name, salary, department_id of the lowest paid employee(s) in each department as long as the 
--department_id is above 75

select last_name,
        salary,
        department_id
from employees
where ( (salary, department_id) IN 
        (select min(e.salary),
                d.department_id
        from departments d
        right join employees e
        on (d.department_id = e.department_id)
        group by d.department_id ) 
        and department_id >75);

--Q6
--Display the last name of the lowest paid employee(s) in each city

select l.city,
        e.last_name
from locations l
join departments d
on (d.location_id = l.location_id)
join employees e
on (e.department_id = d.department_id)
where ((l.city, e.salary) in (
                                select l.city,
                                        min(e.salary)
                                from locations l
                                join departments d
                                on (d.location_id = l.location_id)
                                join employees e
                                on (e.department_id = d.department_id)
                                group by l.city));

--Q7
--Display last name and salary for all employees who earn less than the lowest salary in ANY department.
--Sort the output by top salaries first and then by last name.
select  salary,
        last_name
from employees 
where (salary < ANY (select min(salary)
                     from employees 
                     group by department_id));

--Q8
--Display last name, job title and salary for all employees whose salary matches any of the salaries from the IT Department.
--Do NOT use Join method.
-- Sort the output by salary ascending first and then by last_name

select  last_name,
        job_id,
        salary
from employees
where ( salary in ( select salary
                    from employees
                    where (department_id = (select department_id
                                            from departments
                                            where Upper(department_name) = upper('it')))));

--Q9
--Display the department_id  and lowest salary for any department_id that is a department_id greater than that of Abel

select  department_id,
        min(salary)
from employees
where (department_id > ( select distinct (department_id)
                        from employees
                        where Upper(last_name) = Upper('Abel')))
group by department_id; 


