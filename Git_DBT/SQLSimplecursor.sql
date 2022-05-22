create table emp(
empno int,
ename varchar(5),
sal float,
deptno int
);
insert into emp(empno, ename, sal, deptno)values
(1, 'A', 5000, 1),
(2, 'B', 6000, 1),
(3, 'C', 7000, 1),
(4, 'D', 9000, 2),
(5, 'E', 8000, 2);
select * from emp;

create table tempp(
empno int,
ename varchar(5),
sal float,
deptno int
);
select * from tempp;

delimiter //
create procedure abc()
begin
declare a int;
declare b varchar(15);
declare c int;
declare d int;
declare finished int default 0;
declare c1 cursor for select * from emp;
declare continue handler for not found 
set finished = 1;
open c1;
cursor_c1_loop : loop
	fetch c1 into a, b, c, d;
    if finished = 1 then
		leave cursor_c1_loop;
	end if;
    insert into tempp  values(a, b);
end loop cursor_c1_loop;
end; //
delimiter ;
drop table tempp;
call abc();
select * from tempp;
-- -------------------------------------------------------------
delimiter //
create procedure abc()
begin
declare a int;
declare b varchar(15);
declare c float;
declare d int;
declare finished int default 0;
declare c1 cursor for select empno, lower(ename) as Lower_ename, sal+1500 as Bonus, deptno from emp;
declare continue handler for not found
	set finished = 1;
open c1;
cursor_c1_loop : loop
	fetch c1 into a, b, c, d;
    if finished = 1 then
		leave cursor_c1_loop;
	end if;
    insert into tempp values(a, b, c, d);
end loop cursor_c1_loop;
close c1;
end; //
delimiter ;

call abc();

select * from tempp;

-- -----------------------------------------------------------------------------
create table output(
empno int,
ename varchar(5)
); 

create table dept(
deptno int,
dname varchar(15),
loc varchar(15)
);

insert into dept (deptno, dname, loc)values
(1, 'TRN', 'Bby'),
(2, 'EXP', 'Dlh'),
(3, 'MRK', 'Cal');


delimiter //
create procedure abc()
begin
declare a int;
declare b varchar(15);
declare finished int default 0;
declare c1 cursor for select emp.empno, dept.dname from emp, dept
	where emp.deptno = dept.deptno;
declare continue handler for not found set finished = 1;
open c1;
cursor_c1_loop : loop
	fetch c1 into a, b;
    if finished = 1 then
		leave cursor_c1_loop;
	end if;
    insert into output values(a, b);
end loop cursor_c1_loop;
close c1;
end; //
delimiter ;

call abc();

select * from output;
-- --------------------------------------------------------------------
delimiter //
create procedure abc()
begin
declare a int;
declare b varchar(15);
declare c float;
declare d int;
declare finished int default 0;
declare c1 cursor for select* from emp;
declare continue handler for not found set finished = 1;
open c1;
cursor_c1_loop : loop
	fetch c1 into a, b, c, d;
    if finished = 1 then
		leave cursor_c1_loop;
	end if;
    if c > 7000 then
		update emp set sal = sal+1;
	end if;
end loop cursor_c1_loop;
close c1;
end; //
delimiter ;
call abc();
select * from emp;




