create table emp1(
empno int,
ename varchaR(15),
sal float,
deptno int, 
job char(2),
mgr int
);

insert into emp1(empno, ename, sal, deptno, job, mgr)values
(1, 'Arun', 8000, 1, 'M', 4),
(2, 'Ali', 7000, 1, 'C', 1),
(3, 'kirun', 3000, 1, 'C', 1),
(4, 'Jack', 9000, 2, 'M', null),
(5, 'Thomas', 8000, 2, 'C', 4);

select * from emp1;

select ename from emp1
	where sal = (select min(sal) from emp1);
    
select ename from emp1
	where sal = (select min(sal) from emp1
		where deptno = (select min(deptno) from emp1 ));
        
select ename, max(sal) from emp1
	where sal < (select max(sal) from emp1);
    
select * from emp1
	where deptno = (select deptno where ename = 'Thomas');
    
select * from emp1
	where sal = any(select sal from emp1 where job = 'M');

select * from emp1
	where sal = any(select sal from emp1 where job = 'M');
    
select * from emp1
	where sal in (select sal from emp1 where job = 'M');

select * from emp1
	where sal >= (select min(sal) from emp1 where job = 'M');

update emp1 set sal = 13000 where empno = 3;
select * from emp1
	where sal > (select max(sal) from emp1 where job = 'M');

update emp1 set sal = 3000 where empno = 3;

create table dept1(
deptno int,
dname varchar(5),
loc varchar(10)
);

insert into dept1(deptno, dname, loc)values
(1, 'TRN', 'Bby'),
(2, 'EXP', 'Dlh'),
(3, 'MKT', 'Cal');

select distinct deptno from emp1;

select dname from dept1 where deptno = any(select distinct deptno from emp1);

select dname from dept1 where deptno in
(select distinct deptno from emp1);

select dname from dept1 where deptno not in
(select distinct deptno from emp1);

select dname from emp1, dept1
	where dept1.deptno = emp1.deptno;

select distinct dname from emp1, dept1
	where dept1.deptno = emp1.deptno;

select dname from dept1 where exists
(select deptno from emp1
	where dept1.deptno = emp1.deptno);

select dname from dept1 where not exists
(select deptno from emp1
	where dept1.deptno = emp1.deptno);





select * from dept1;