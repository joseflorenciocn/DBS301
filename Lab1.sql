--For all orders in the orders table supply order date and count of the number of orders on that date. 
--Only include those from 2015 and have more then 1 order on that date.

SELECT TO_DATE(order_dt, 'DD-MM-YYY') AS "Order Date",
       COUNT (order_no) AS "Number of Orders"  
FROM orders
GROUP BY order_dt
HAVING order_dt LIKE '%2015' AND COUNT (order_no) > 1;

ORDER BY "Order Date" ASC;
              
        
--The Sales Manager would like to see all orders in 2014 from United Kingdom and Canada.
--Show the customer number, customer name and country name

SELECT o.order_no AS "Order",
       o.cust_no AS "Customer Number",
       c.cname AS "Customer Name",
       co.country_name AS "Country Name"
FROM orders o
JOIN (customers c)
ON (c.cust_no=o.cust_no)
JOIN (countries co)
ON (co.country_id = substr(c.country_cd,1,2))
WHERE c.country_cd IN ('UK', 'CAN') AND
      o.order_dt LIKE '%2014'
ORDER BY "Order" ASC;   

--Show what customers (number and name) along with the country name for all customers that are in the same countries 
--as the Supra customers. Limit the list to any customer that starts with the letters A or B.

SELECT cname AS "Customer Name",
       cust_no AS "Customer Number",
       country_cd AS "Country Name"
FROM customers
WHERE country_cd IN (SELECT country_cd
                    FROM customers
                    WHERE UPPER(cname) LIKE UPPER('%Supra%')) AND
                    (UPPER(cname) LIKE ('A%') OR
                     UPPER(cname) LIKE ('B%'))
ORDER BY 1 ASC;
                    