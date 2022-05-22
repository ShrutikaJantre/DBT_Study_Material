create table emp(
sno char(4),
ename varchar(15),
city varchar(15),
sal float,
desig char(5),
jdate varchar(20),
deptno int
);

insert into emp(sno, ename, city, sal, desig, jdate, deptno)values
('01', 'Shrutika', 'Mumbai', 6000, 'M', '2020-12-27', 4),
('02', 'Himanshu', 'Kanpur', 8000, 'M', '2020-12-26', 4),
('03', 'Kalyani', 'Mumbai', null, 'C', '2020-12-25', 1),
('04', 'Snehal', 'Nagpur', 5000, 'M', '2020-12-24', null),
('05', 'Jayant', 'Jalgaon', 2000, 'C', '2020-12-23', 4);
drop table emp;
select * from emp;

select emp.sno, emp.ename, emp.city, emp.sal, emp.desig, emp.jdate from emp;

select emp.sno, emp.ename, emp.city from emp;

select emp.sno, emp.ename, emp.city from emp
	where emp.sno = '01';
    
select emp.sno, emp.ename, emp.city, emp.sal from emp
	where emp.sno = '01';
    
select emp.sno, emp.ename, emp.city, emp.sal from emp
	where emp.sal > 6000;
    
select emp.sno, emp.ename, emp.city, emp.sal from emp
	where emp.sal != 6000;
    
select emp.sno, emp.ename, emp.city, emp.sal from emp
	where emp.sal <> 6000;

select emp.sno, emp.ename, emp.city, emp.sal from emp
	where emp.sal between 6000 and 8000;    

select emp.sno, emp.ename, emp.city, emp.sal from emp
	where emp.ename = 'Kalyani' and emp.sal = 9000;  
    
select emp.sno, emp.ename, emp.city, emp.sal*12 "Annual" from emp;

select emp.ename, emp.sal from emp
	where emp.sal*12 > 72000;
    
select distinct emp.city, emp.ename from emp;

select emp.sno, emp.ename, emp.city, emp.sal, emp.desig, emp.jdate from emp
    order by 6 desc; -- ordered by date whose col number is 6
    
update emp set emp.ename = 'Snehal' where emp.sno = '04';

update emp set emp.ename = 'Snehal' where emp.city = 'Mumbai';

update emp set emp.ename = 'Shrutika' where emp.sno = '01';
update emp set emp.ename = 'Kalyani' where emp.sno = '03';

select * from emp
	where emp.ename like '__m_n%';
    
select * from emp
	where emp.ename not like 'S%';
    
select emp.ename, emp.jdate from emp
	where emp.sal between 6000 and 9000;
    
select emp.ename, emp.jdate from emp
	where ename between 'H' and 'J'; -- doesnt count last one in range
    
select emp.ename, emp.jdate from emp
	where ename between 'H' and 'k';
    
select emp.ename, emp.sal, emp.jdate from emp
	where emp.sal in (2000, 8000);

select emp.ename, emp.sal, emp.jdate from emp
	where emp.city in ('Mumbai', 'Delhi'); -- logical or

update emp set emp.ename = 'Himanshi', city = 'Pune' where emp.sno = '02';

select concat(emp.ename, emp.city) from emp;

select concat(upper(substr(emp.ename, 1, 1)),lower(substr(emp.ename, 2))) from emp
	order by emp.sal desc;
    
select rpad(emp.ename, length(emp.ename) + 5, '*') from emp;

select replace('Himanshi', 'i', 'u') from emp; -- later

update emp set emp.ename = 'Himanshu' where emp.sno = '02';

select instr('Kalyani', 'an') from emp;

select distinct instr('Kalyani', 'an') from emp;

select ascii(emp.sal) from emp;

select ascii('X') from dual;

select * from emp where soundex(ename) = soundex('Himaaaanssshhuuu');

select round(emp.sal) from emp;

select round(7500.5656, 2) from emp;

select round(7500.5656, 2) from dual;

select round(7850.2020, -2) from dual;

select  ceil(7850.5656) from dual;

select floor(7850.5656) from dual; -- removes everythinh aft dec

select sign(-15) from dual;

select mod(21.2, 5.1) from dual;

select sqrt(144) from dual;

select power(10, 3) from dual;

select abs(-25) from dual;

select sin(90) from dual;
select cos(90) from dual;
select tan(90) from dual;

select emp.ename, emp.sal, sign(emp.sal - 7000) from emp;

select distinct emp.ename mod(emp.sal, 3) from emp;

select sysdate() from dual;

select now() from dual;

select distinct dayname(sysdate()) from emp;

select sysdate(), now(), sleep(20), sysdate(), now() from dual;

select adddate(sysdate(), 1) from dual;

select adddate(sysdate(), -1) from dual;

select datediff(sysdate(), jdate) from emp;

select date_add(jdate, interval 2 month) from emp;

select date_add(jdate, interval -2 month) from emp;

select last_day(jdate) from emp;

select addtime('2020-02-10 11:00:00', '15') from dual;

select addtime('2020-02-10 11:00:00', '01:30:15') from dual;



alter table emp add Comm float;
insert into emp(comm) values
(100),
(600),
(null),
(50),
(800);

select ifnull(emp.sal, 0) from emp;

select emp.ename, emp.sal, greatest(emp.sal, 7000) from emp;

select emp.ename, emp.sal, least(emp.sal*0.1, 1000) from emp
	order by 3;

select emp.ename, emp.sal,
case
when emp.sal = 2000 then 'Gareeb'
when emp.sal = 5000 then 'Thoda Gareeb'
when emp.sal = 6000 then 'Thoda kam Gareeb'
when emp.sal = 8000 then 'Ameer'
else 'Bahot Ameeerrr' 
end "Cdac"
from emp
order by 2;

select emp.ename, emp.sal,
case
when sign(emp.sal - 6000) = 1 then 'Ameer'
when sign(emp.sal - 6000) = -1 then 'Gareeb'
else 'Middle class'
end "Aukat" from emp
order by 2;

select sum(emp.sal) from emp;

update emp set emp.sal = null where emp.sno = '03';
select sum(emp.sal) from emp; -- doesnt count null row
select sum(ifnull(emp.sal, 0)) from emp;

select avg(emp.sal) from emp;        -- 5250
select avg(ifnull(emp.sal, 0)) from emp;  -- 4200 counts null row

select min(emp.sal) from emp; -- 2000
select min(ifnull(emp.sal, 0)) from emp; -- 0

select max(emp.sal) from emp; -- 8000
select max(emp.sal)/min(emp.sal) from emp; -- 4

select count(*) from emp;

select count(emp.sal) from emp;

select count(*) - count(emp.sal) from emp;

select sum(emp.sal)/count(*) from emp; -- faster than avg method using ifnull

update emp set emp.ename = 'Snehal' where city = 'Nagpur';

select emp.ename, min(emp.sal) from emp;-- output meaningless 

select count(emp.ename), min(sal) from emp;

select deptno, desig, sum(emp.sal) from emp group by desig;

select ename, deptno from emp group by deptno;-- meaningless output

select sum(sal) from emp where deptno = 4;

select deptno, sum(sal) from emp group by deptno;

select deptno, max(sal) from emp group by deptno;

-- whatever we are writing in sel statement must be wrtitten in group by clause or else output will be meaningless
select desig, sum(sal) from emp where sal >= 6000 group by desig;

select deptno, desig, sum(sal) from emp group by deptno;

select deptno, desig, sum(sal) from emp group by deptno, desig;

select deptno, sum(sal) from emp group by deptno having sum(sal)> 10000;

select deptno, sum(sal) from emp group by deptno having deptno > 2;

select deptno, sum(sal) from emp group by deptno having count(*) > 2;

select deptno, sum(sal) from emp group by deptno 
having sum(sal) > 3000 and sum(sal) < 20000
order by deptno;

create table dept(
depno int,
deptname varchar(15),
loc varchar(15)
);
drop table dept;
insert into dept(dept.depno, dept.deptname, dept.loc)values
(4, 'TRN', 'Mumbai'),
(1, 'EXP', 'Kanpur'),
(3, 'MRK', 'Delhi');

select  emp.ename, dept.deptname, dept.loc  from emp, dept
	where dept.depno = emp.deptno;
    
select  emp.ename, dept.depno, dept.deptname, dept.loc  from emp, dept
	where dept.depno = emp.deptno
    order by dept.deptname;


select  emp.ename, dept.depno, dept.deptname, dept.loc  from emp, dept
	where dept.depno != emp.deptno
    order by dept.deptname;
    

select  emp.ename, dept.depno, dept.deptname, dept.loc  from emp, dept
	where dept.depno != emp.deptno
    order by dept.deptname;
    
create table  depthead(
deptno int,
dhead varchar(15)
);

insert into depthead(deptno, dhead)values
(1, 'Kalyani'),
(4, 'Jayant');

select depthead.deptno, depthead.dhead from depthead;

select emp.ename, dept.deptname, depthead.dhead from emp, dept, depthead
	where emp.deptno = dept.depno and dept.depno = depthead.deptno
		group by dept.deptname
		order by 2;

select emp.ename, emp.sal from emp
	where emp.sal = (select min(emp.sal) from emp);

select max(emp.sal) from emp
	where emp.sal < (select max(emp.sal) from emp);

select emp.ename, max(emp.sal) from emp
	where emp.sal < (select max(emp.sal) from emp 
		where emp.sal < (select max(emp.sal) from emp));
      
update emp set emp.sal = 9000 where emp.sno = '03';
     
select emp.ename, min(emp.sal) from emp
	where emp.sal > (select min(emp.sal) from emp 
		where emp.sal > (select min(emp.sal) from emp
			where emp.sal > (select min(emp.sal) from emp)));
            
select emp.sal, count(*)-1 from emp
	-- where count(*)-1
	order by emp.sal desc;
    
select emp.ename, emp.sal from emp
	-- where count(*)-1
	order by emp.sal desc;

-- Display the 4th largest salary
select emp.ename, emp.sal from emp
	where sno = (select count(*)-2 from emp order by emp.sal desc);

select emp.ename, emp.sal from emp
	where sno = (select * from emp)
		order by emp.sal desc ;
        
        
        
        
        
        
        
select emp.sno, emp.ename, emp.city, emp.sal, emp.desig, emp.jdate from emp;
