--As3
--Q1

create table division
(
division_id number (3),
division_name varchar (25) not null unique,

constraint division_div_id_pk
primary key (division_id)

);

create table warehouse
(
WAREHOUSE_ID number (3),
CITY varchar (15) not null unique,
RATING char (1) constraint warehouse_rat_ck check (RATING in ('A', 'B', 'C', 'D')),
FOUND_DATE date not null,
DIVISION_ID number (3) not null,

constraint warehouse_war_id_pk
primary key (warehouse_id),

constraint warehouse_div_id_fk
foreign key (division_id)
references division(division_id)
);

create table section
(
WAREHOUSE_ID number (3),
SECTION_ID number (2),
DESCRIPTION varchar (50) not null,
CAPACITY number (8),

constraint section_war_sec_id_pk
primary key (warehouse_id, section_id),

constraint section_war_id_fk
foreign key (warehouse_id)
references warehouse(warehouse_id)
);

insert INTO division VALUES (10, 'East Coast');
insert INTO division VALUES (20, 'Quebec');
insert INTO division VALUES (30, 'Ontario');

insert INTO warehouse VALUES (1, 'Montreal', SYSDATE, 10, 'A');
insert INTO warehouse VALUES (7, 'Hamilton', SYSDATE, 10, 'B');
insert INTO warehouse VALUES (10, 'Toronto', SYSDATE, 30, 'A');

insert INTO section (WAREHOUSE_ID, SECTION_ID, DESCRIPTION, CAPACITY) VALUES (1, 1, 'Whse 1 Floor 1', 2000);
insert INTO section VALUES (1, 2, 'Whse 1 Floor 2', 500);
insert INTO section VALUES (7, 1, 'Whse 7 Floor 1', 15000);



--Q2
alter table section
add (mgr_id number (6), 
    constraint section_mgr_id_fk 
    foreign key (mgr_id)
    references employees (employee_id)
    );

--Q3
alter table warehouse
drop column rating;

alter table warehouse
add (rating char(1),
    constraint warehouse_rat_ck
    check (rating in ('A', 'B', 'C', 'D', 'Z'))
    );

--Q4 
create sequence your_email_seq
start with 330
maxvalue 900
increment by 10
nocycle
nocache;

--Q5
insert into warehouse (warehouse_id, city, found_date, division_id) values (your_email_seq.nextval, 'Atlanta', sysdate, 30);

--Q6
create table cities as
(
select * from locations
where location_id < 2000
);

--Q7
desc cities;

--Q8
create view whs_sec_man_vu as
(
select 
w.WAREHOUSE_ID,
s.SECTION_ID,
w.CITY,
d.DIVISION_ID as "Group",
e.last_name as "Lname"
from warehouse w
join section s
on (w.warehouse_id = s.warehouse_id)
join division d
on (w.division_id = d.division_id)
join employees e
on (s.mgr_id = e.employee_id)
);

--Q9
select * from whs_sec_man_vu;


drop table section;
drop table warehouse;
drop table division;