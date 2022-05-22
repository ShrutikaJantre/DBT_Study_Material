create table dept3(
deptno int,
dname varchar(15),
loc varchar(15)
);

insert into dept3(deptno, dname, loc) values
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

select * from dept3;

create table emp3(
empno int,
ename varchar(10),
job varchar(9),
hiredate date,
sal float,
comm float,
deptno int
);

insert into emp3(empno, ename, job, hiredate, sal, comm, deptno) values
(7839, 'KING', 'MANAGER', '1991-11-17', 5000, NULL, 10),
(7698, 'BLAKE', 'CLERK', '1981-05-01', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', '1981-06-09', 2450, NULL, 10),
(7566, 'JONES', 'CLERK', '1981-04-02', 2975, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', '1981-09-28', 1250, 1400, 30),
(7499, 'ALLEN', 'SALESMAN', '1981-02-20', 1600, 300, 30);

select * from emp3;
-- 1. Find the names of all employees hired in the month of February (of
-- any year).

select ename from emp3 
	where month(hiredate) = '02';

-- 2. Find the names of all employees whose name ends with the letter
-- ‘M’.
select ename from emp3
	where ename like '%N';
    
-- 3. Display the ENAME and JOB for all employees who belong to the
-- same DEPTNO as employee ‘KING’.
select ename, job from emp3
	where emp3.deptno = (select deptno from emp3 where ename = 'KING');

-- 4. Display the HRA for each employee given that HRA is 20% of
-- SAL.

select empno, ename, sal*0.2 'HRA' from emp3;

-- 5. Display the JOB column with duplicate values suppressed.
select distinct job from emp3;

-- 6. Display the Enames and the corresponding Dnames.
select emp3.ename, dept3.dname from emp3, dept3
	where dept3.deptno = emp3.deptno;

-- 7. Display the employees in descending order of DEPTNO.
select * from emp3
	order by emp3.deptno desc;

-- 8. Find the names of all employees who do not receive any
-- commission.
select ename from emp3
	where comm is Null;

-- 9. Display the employee name and employee number of the
-- employees with the headings as NUMBER and NAME.
select emp3.empno as 'NUMBER', emp3.ename as 'NAME' from emp3;

-- 10.Find the name of the employee who is receiving the maximum
-- salary.
select ename, max(sal) 'Maximum Salary' from emp3;

-- 11.Display the sum of SAL for all the employees belonging to
-- DEPTNO 10.

select empno, ename, sum(sal) from emp3
	group by deptno = 10; 

-- 12.Display the rows where JOB column ends with the letter ‘T’.
select * from emp3
	where job like '%R';
    
/* 81.Write a stored procedure to convert a temperature in Fahrenheit (F) to its
temperature in Fahrenheit (F) . The required formula is:- C= (F-32)*5/9 Insert the
temperature in Centigrade into TEMPP table. Calling program for the stored
procedure need not be written.  */
create table tempp(
f float,
c float
);

delimiter //
create procedure temptofar(f float)
begin
declare c float default 0;
set c = (F-32)*(5/9);
insert into tempp values(f, c);
select f as 'Temperature in Fahrenheit (F)', c as 'Temperature in Centigrade (C)' from tempp;
end; //
delimiter ;
call temptofar(100);

/* 2. Write a stored function by the name of Num_cube. The stored function
should return the cube of a number ‘N’. The number ‘N’ should be passed to the
stored function as a parameter. Calling program for the stored function need not
be written. */
create table tempp(
x float,
c float
); 
delimiter //
create function Num_cube(y float)
returns float
deterministic
begin
return y*y*y;
end; //
delimiter ;

delimiter //
create procedure call_num_cube(x float)
begin
declare c float default 0;
set c = Num_cube(x);
insert into tempp values(x, c);
select x as 'Number', c as 'Cube' from tempp;
end; //
delimiter ;

call call_num_cube(2);
