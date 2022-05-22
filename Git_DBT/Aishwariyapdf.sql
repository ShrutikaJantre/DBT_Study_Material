create table dept(
DEPTNO int,
DNAME varchar(15),
LOC varchar(10)
);

insert into dept(deptno, dname, loc) values
(10, 'ACCOUNTING', 'NAINITAL'),
(20, 'RESEARCH', 'DEHRADUN'),
(30, 'SALES', 'CHENNAI'),
(40, 'OPERATIONS', 'BILASPUR');

select * from dept;

create table emp(
EMPNO int,
ENAME varchar(10),
JOB varchar(9),
HIREDATE date,
SAL float,
COMM float,
DEPTNO int
);

insert into emp(empno, ename, job, hiredate, sal, comm, deptno)values
(7839, 'KAILASH', 'MANAGER', '1991-11-17', 5000, NULL, 10),
(7698, 'BELA', 'CLERK', '1981-05-01', 2850, NULL, 30),
(7782, 'CHETAN','MANAGER', '1981-06-09', 2450, NULL, 10),
(7566, 'JASPREET', 'CLERK', '1981-04-02', 2975, NULL, 20),
(7654, 'MAMTA', 'SALESMAN', '1981-09-28', 1250, 1400, 30),
(7499, 'AMAR', 'SALESMAN', '1981-02-20', 1600, 300, 30);

select * from emp;

-- 3. Display the last day of the month for every HIREDATE.
select last_day(Hiredate) from emp;

-- 4. Display the annual SAL for each employee.
select ename, sal*12 as 'Annual' from emp;

-- 5. Display the ENAME and JOB for all employees who belong to the same DEPTNO as employee ‘KING’.
select ename, job from emp
	where deptno = (select deptno from emp where ename = 'KAILASH');

-- 6. Display the names of all employees replacing any ‘A’ with ‘a’.
select replace(ename, 'A', 'a') from emp;
	

-- 7. Display the employee name and employee number of the employees with the headings as NUMBER and NAME.
select empno as 'Number', ename as 'Name' from emp;

-- 8. Find the name of the employee who is receiving the maximum salary.
select ename from emp
	where sal = (select max(sal) from emp);

-- 9. Display the sum of SAL for all the employees belonging to DEPTNO 10.
select sum(sal) from emp
	where deptno = 10;

-- 10. Display the rows where JOB column ends with the letter ‘T’.
select job from emp
	where job like '%N';

/* 1. Write a stored procedure by the name of HRA_calc. The Empno, Deptno and Sal should be passed 
as parameters to your stored procedure. 
The formulae are as follows:-
If deptno = 10 then HRA = 20% of sal,
If deptno = 20 then HRA = 30% of sal,
For all other deptnos, HRA = 10% of sal.
Your stored procedure should insert the Empno, Deptno, Sal and the HRA into a suitable TEMPP output table.
 Calling program for the stored procedure need not be written. */
 
 create table tempp(
 EMPNO int,
 DEPTNO int,
 SAL float,
 HRA float
 );
 
 
 delimiter //
 create procedure HRA_calc (empno int, deptno int, sal float)
 begin
 declare hra float default 0;
 if deptno = 10 then
	set hra = sal*0.20;
	elseif deptno = 20 then
		set hra = sal*0.30;
	else
		set hra = sal*0.10;
	end if;
insert into tempp values(empno, deptno, sal, hra);
select * from tempp;
end; //
delimiter ;

call HRA_calc(1, 40, 5000);
 
 
 
 /* Write a stored function by the name of Num_cube. The stored function should return the cube of a number ‘N’. 
 The number ‘N’ should be passed to the stored function as a parameter. Calling program for the stored function need not be written.*/
 
 create table temppp(
 Numberr float,
 Cubee float
 );
 
 delimiter //
 create function Num_cube(num float)
 returns float
 deterministic
 begin
 return num*num*num;
 end; //
 delimiter ;
 
 delimiter //
 create procedure Num(num float)
 begin
 declare cubee float default 0;
 set cubee = Num_cube(num);
 insert into temppp values(num, cubee);
 select * from temppp;
 end; //
 delimiter ;
 
 call Num(2);
 
 
 
 
 
