create index iename on emp1(ename);
select * from emp1;
select ename, sal from emp1
	where sal > 6000;

select ename from emp1
	where ename = 'Jack';
    
drop index iename on emp1;

create index i_emp_name on emp1(ename, sal, deptno);

select ename, sal from emp1
	where sal = 3000;
    
show indexes from emp1;

create unique index i_mgr on emp1(mgr);

