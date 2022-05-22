-- ===========================================================  TABLE 1 ============================================================================
create TABLE customers (
customer_Id int(11) NOT NULL,
First_Name varchar(50) NOT NULL,
Last_Name varchar(50) NOT NULL,
phone varchar(50) NOT NULL,
creditLimit decimal(10,2) DEFAULT NULL,
PRIMARY KEY (`customer_Id`)
);
desc customers;

insert into customers(customer_Id,First_Name,Last_Name,phone,creditLimit)
values

(103,'Atelier','Schmitt','08-78966578','21000.00'),
(112,'Signal','King','7025551838','71800.00'),
(114,'Ferguson','Peter','03-9520 4555','117300.00'),
(119,'Labrune','Janine','40.67.8555','118200.00'),
(121,'Bergulfsen','Jonas ','07-989555','81700.00'),
(124,'Nelson','Susan','4155551450','210500.00'),
(125,'Piestrzeniewicz','Zbyszek ','(26)642-7555','0.00'),
(128,'Keitel','Roland','+49 6966 90 2555','59700.00'),
(129,'Murphy','Julie','6505555787','64600.00'),
(131,'Lee','Kwai','2125557818','114900.00'),
(141,'Freyre','Diego ','(91) 555 94 44','227600.00'),
(144,'Berglund','Christina','0921-12 3555','53100.00'),
(145,'Petersen','Jytte ','31 12 3555','83400.00'),
(146,'Saveley','Mary','78.32.5555','123900.00'),
(148,'Eric','Jecob','+65 2217555','103800.00'),
(151,'Young','Jeff','2125557413','138500.00');

select * from customers;

-- ============================================================================  TABLE 2 ==========================================================================

CREATE TABLE orders(
order_Id int(11) NOT NULL,
order_Date date NOT NULL,
shipped_Date date DEFAULT NULL,
Deliver varchar(15) NOT NULL,
customer_Id int(11) NOT NULL,
PRIMARY KEY (order_Id),
FOREIGN KEY (customer_Id) REFERENCES customers(customer_Id) on update cascade 
);
desc orders;

insert into orders(order_Id,order_Date,shipped_Date,Deliver,customer_Id) values
(10100,'2003-01-06','2003-01-13','Shipped',114),
(10101,'2003-01-09','2003-01-18','Shipped',125),
(10102,'2003-01-10','2003-01-18','Shipped',129),
(10103,'2003-01-29','2003-02-07','Shipped',121),
(10104,'2003-01-31','2003-02-09','Shipped',141),
(10105,'2003-02-11','2003-02-21','Shipped',145);
select * from orders;

-- =====================================================================================================================================================================================
-- 1. Write a Query to add a column package_stat to the table orders.
alter table orders
	add column package_stat varchar(20);
    
-- 2. Write a Query to change the package_stat column of orders table with 'not available'for all orders.
update orders set package_stat = 'not available';

-- 3. Write a Query to delete a row from customers table where credit_limit is 0.00
delete from customers where creditLimit = 0.00;


-- 1. Write a Query to display the first_name with the occurrence of ‘el’ in the customers tables.
select First_Name from customers where First_Name like '%el%';

-- 2. Write a Query to prepare a list with customer name ,customer_id ,order_id for the customers whose delivery status is shipped.
select distinct First_Name, customers.customer_Id, order_Id from customers, orders
	where Deliver = any(select Deliver from orders where Deliver ='Shipped');


-- 3. Write a Query to get the number of customers with the creditLimit greater than 50000.
select count(*) from customers 
	where creditLimit > 50000;

-- 4. Write a Query to display the customer_id, name ( first name and last name ), order_id and deliver for all customers.
select customers.customer_id, concat(First_name, concat(' ', Last_name)) as 'Name', order_id, Deliver from customers, orders;

-- 5. Write a Query to customer name in order of creditLimit smallest to highest.
select concat(First_name, concat(' ', Last_name)), creditLimit as 'Name' from customers
	order by creditLimit;
-- 6. Write a stored procedure by name order_day. The procedure should show the customer_id and the day on which he had made the order.
create table output(
cno int,
days date,
daynam varchar(20)
);

delimiter //
create procedure order1()
begin
declare x int;
declare d varchar(20);
declare finished int default 0;
declare dd varchar(20);
declare c1 cursor for select customer_Id ,order_Date from orders;
declare continue handler for not found set finished=1;
open c1;
cursor_c1:loop
fetch c1 into x,d ;
if finished = 1 then
leave cursor_c1;
end if;
set dd = dayname(d);
insert into output values (x,d,dd);
end loop cursor_c1;
close c1;
end ; //
delimiter ;

drop procedure order1;
drop table output;
call order1();
select * from output;

-- 7. Write a stored function by the name of cutomer_search. The stored function should return the maximum creditLimit made by any customer. */
create table jantre(
x decimal(10,2)
);

delimiter //
create function customer_Search(y decimal(10,2))
returns decimal
deterministic
begin
return max(y);
end ; //
delimiter ;
delimiter //

create procedure c()
begin
declare x decimal(10,2);
declare y decimal (10,2);
declare finished int default 0;
declare c1 cursor for select creditLimit from customers;
declare continue handler for not found set finished=1;
open c1;
cursor_c1:loop
fetch c1 into x ;
if finished=1 then
leave cursor_c1;
end if;
set y=customer_Search(x);
insert into jantre values (x);
end loop cursor_c1;
close c1;
end; //
delimiter ;
call c();


-- =================================================================  TABLE 3 ===============================================================================

Create table DEPT (
DEPTNO INT(2),
DNAME VARCHAR (14),
LOC VARCHAR (13));
desc DEPT;

Insert into DEPT values
(10, 'ACCOUNTING','NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

select * from DEPT;

-- =================================================================== TABLE 4 ============================================================================
 Create  table EMP(
EMPNO INT(4),
ENAME VARCHAR (10),
JOB VARCHAR (9),
HIREDATE DATE,
SAL FLOAT(7,2),
COMM FLOAT(7,2),
DEPTNO INT(2));
desc EMP;

Insert into EMP values
(7369, 'SMITH', 'CLERK', '1980-12-17', 800, null, 20),
(7499,' ALLEN', 'SALESMAN', '1981-02-20', 1600, 300, 30),
(7521, 'WARD', 'SALESMAN', '1981-02-22', 1250, 500, 30),
(7566, 'JONES', 'MANAGER',' 1981-04-02', 2975, null, 20),
(7654, 'MARTIN','SALESMAN', '1981-09-28', 1250, 1400, 30),
(7698, 'BLAKE', 'MANAGER',' 1981-05-01', 2850, null, 30),
(7782, 'CLARK', 'MANAGER',' 1981-06-09', 2450, null, 10),
(7788, 'SCOTT', 'ANALYST', '1982-12-09', 3000, null, 20),
(7839, 'KING', 'PRESIDENT', '1981-11-17', 5000, null, 10),
(7844, 'TURNER', 'SALESMAN','1981-09-08', 1500, 0, 30),
(7876, 'ADAMS', 'CLERK', '1983-01-12', 1100, null, 20),
(7900, 'JAMES', 'CLERK', '1981-12-03', 950, null, 30),
(7902, 'FORD', 'ANALYST', '1981-12-03', 3000, null, 20),
(7934, 'MILLER', 'CLERK', '1982-01-23', 1300, null, 10);
select * from EMP;


-- 1. Display only the EMPNO and ENAME columns from EMP table.
select EMPNO,ENAME from EMP;

-- 2. Display all employees who are CLERKs and the MANAGERs.
select ENAME from EMP where job = 'CLERK' OR 'MANAGER';

-- 3. Display the ENAME and JOB for all employees who belong to the same DEPTNO as employee ‘KING’.
select ENAME,JOB from EMP where DEPTNO =(select DEPTNO from EMP where
ENAME like 'KING');

-- 4. Find the names of all employees hired in the month of February (of any year).
select ENAME from EMP WHERE MONTH(HIREDATE)= 02;

-- 5. Display the employees in descending order of DEPTNO.
select ENAME from EMP
order by DEPTNO desc;

-- 6. Display the employee name and employee number of the employees with
-- the headings as NUMBER and NAME.
select ENAME as 'Name',EMPNO as 'Number' from emp;

-- 7. Find the names of all employees who were hired on the last day of
-- the month.
select ENAME from EMP where HIREDATE= any (select last_day(HIREDATE) from EMP);

-- 8. Find the name of the employee who is receiving the maximum salary.
select ENAME from EMP
	where sal=(select max(sal) from EMP);

-- 9. Display the sum of SAL for all the employees belonging to DEPTNO
select sum(sal) from EMP where DEPTNO =10;

-- 10. Display the rows where JOB column ends with the letter ‘T’
select * from EMP where JOB like '%T';



