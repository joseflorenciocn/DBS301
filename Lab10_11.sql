/*Q1)*/
create table salesrep
as(
select employee_id as "repid",
first_name,
last_name,
phone_number,
salary,
COMMISSION_PCT
from employees
where department_id = 80 ) 

/*Q2)*/
create table cust
(
cust# number(6),
custname varchar2(30) not null,
city varchar2(20),
ratings char(1),
comments varchar2(200),
salesrep# number(7),

constraint cust_cust#_pk
primary key (cust#),

constraint cust_cusname_city_uk
unique (custname, city),

constraint cust_rat_chk
check (ratings in ('A', 'B', 'C', 'D')),

constraint cust_salesrep_fk
foreign key (salesrep#)
references employees (employee_id)

)

drop table cust;


/*Q3)*/
insert all 
into cust values (501, 'ABC LTD', 'Montreal', 'C', NULL, 201)
INTO CUST values (701, 'MIKE and SAM inc.', 'Kingston', 'A', NULL, 102)
INTO CUST values (703, 'RED PLANET', 'Mississauga', 'C', NULL, 107)
INTO CUST values (717, 'blue sky ltd', 'Regina', 'D', NULL, 102)
INTO CUST values (502, 'Black Giant', 'Ottawa', 'B', NULL, 202)
INTO CUST values (503, 'Mother Goose', 'London', 'B', NULL, 202)
INTO CUST values (702, 'MIKE and SAM Inc', 'Kingston', 'A', NULL, 102)
select * from dual;

/*Q4*/
create table goodcust as
(
select 
cust# as "custid",
custname as "name",
city as "location",
SALESREP# as "repid"
from cust
where ratings in ('A', 'B')
)

drop table goodcust

/*Q5*/
alter table salesrep
add 
jobid number(12)

alter table salesrep
drop column jobid 

desc cust

/*Q6*/
create table cities as
( select * from locations where location_id < 2000) 

desc cities

create table towns as
( select * from locations where location_id < 1500) 

drop table towns

create view can_city_vu as
(select street_address,
postal_code,
state_province
from cities
where country_id = 'CA')

select * from can_city_vu

drop view can_city_vu

create view can_city_vu as
(select street_address as "Str_add",
postal_code as "P_code",
state_province as "Prov"
from cities
where country_id In ('CA', 'IT'))

select * from can_city_vu;

create view city_dname_vu as
(select d.department_name,
c.city,
c.state_province as "Prov"
from cities c
left join departments d
on d.location_id = c.location_id
where c.country_id In ('CA', 'IT'))

select * from city_dname_vu;

drop view city_dname_vu;

alter view city_dname_vu
