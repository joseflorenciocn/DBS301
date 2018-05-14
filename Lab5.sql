-- Question 01
-- Display the department name, city, street address and postal code for all departments sorted by city and department name.
select  d.department_name,
        l.city,
        l.street_address,
        l.postal_code
from departments d
join locations l
on (d.location_id = l.location_id);
        

-- Question 02
-- Display full name of the employees using format of Last, First, their  hire date and salary together with their department name and city,
-- but only for departments which names start with an A or S sorted by department name and employee name
select e.last_name || ', ' || e.first_name as "name",
       e.hire_date,
       e.salary,
       d.department_name,
       l.city
from employees e
join departments d
using (department_id)
join locations l
using (location_id)
where substr(d.department_name, 1, 1) = 'A' OR
        substr(d.department_name, 1, 1) = 'S';

-- Question 03
-- Display the full name of the manager of each department in states/provinces of Ontario, California 
-- and Washington along with the department name,
-- city, postal code and province name.   Sort the output by city and then by department name.

select distinct(m.last_name || ', ' || m.first_name) as "name",
       d.department_name,
       l.city,
       l.state_province
from employees e
join employees m
on (e.manager_id = m.employee_id)
join departments d
on (d.department_id = e.department_id)
join locations l
on (l.location_id = d.location_id)
where Upper(l.state_province) in (upper('ontario'), upper('california'), upper('Washington'));


-- Question 04 a
-- Display employee’s last name and employee number along with their manager’s last name and manager number. Label the columns 
-- Employee, Emp#, Manager, and Mgr# respectively.

select e.last_name,
        e.employee_id,
        m.last_name,
       m.employee_id
from employees e
left join employees m
on (e.manager_id = m.employee_id);

-- Question 04 b
-- Display customer number, customer name, country_id, country_cd and country name
-- HINT:
-- This will take some thinking as country_id and country_cd are different lengths except UK. 
-- But there are others that can be matched such as US to USA. or DE to DEN

select c.cust_no,
        c.cname,
        l.country_id,
        c.country_cd
from customers c
left join countries l
on (substr(c.country_cd, 1,2)=l.country_id);

