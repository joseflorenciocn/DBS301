-- Question 01
-- Display the location id, address, city, state and country for each location id. Be careful of nulls in country_id

select l.location_id,
        l.city,
        l.country_id,
        c.country_name
from locations l
join countries c
on (c.country_id = l.country_id); 


-- Question 02
-- Display the employee id, last name, job, department name, and job grade for all employees.
-- HINT: You need to consider showing ALL employees

select e.employee_id,
        e.last_name,
        e.job_id,
        d.department_name,
        j.grade
from employees e
left join departments d
on (e.department_id = d.department_id)
left join job_grades j
on (e.salary between lowest_sal and highest_sal);

-- Question 03
-- Display the employee id and last name of every employee along with the name and id of the employee's manager (if applicable).



-- Question 04
-- Display the employee id, last name of every employee and the name of the department and city that the employee is assigned to (if applicable). 
-- The display line is long, so it may word wrap a bit.



-- Question 05
-- Display the name of each employee and the city they are assigned to (if applicable).

SELECT e.first_name || ' ' || e.last_name AS "Employee",
       l.city AS "City"
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id
ORDER BY 1 ASC;

-- Question 06
-- Display the name of each city and the names of employees assigned to that city (if applicable).

SELECT e.first_name || ' ' || e.last_name AS "Employee",
       l.city AS "City"
FROM employees e
left JOIN departments d
ON e.department_id = d.department_id
right JOIN locations l
ON d.location_id = l.location_id
ORDER BY 1 ASC;

-- Question 07
-- Display all employees and all cities.

-- EXTRA QUESTION 8
-- I give you the select you finish it. Sort by customer name. 
-- Because I don't want 1255 rows I need it limited to 20 rows. So add the following to your WHERE statement.
-- AND ROWNUM <= 20
-- Display ... etc 
--select cname, o.order_no, p.Prod_no, prod_name