create table tempp2(
y float,
x char(15)
-- z float,
-- hra float
);

create table emp2(
ename varchar(15),
sal float,
job char(2)
);

insert into emp2(ename, sal, job)values
('Shrutika', 7000, 'M'),
('Himanshu', 8000, 'M'),
('Snehal', 5000, 'C'),
('Jayant', 6000, 'M');
select * from emp2;

delimiter //
create procedure hra2()
begin
declare z float;
select sal into z from emp2
where ename = 'Himanshu';
-- declare hra float;
-- set hra = y*z;
insert into tempp2 values(z, 'Himanshu');
end; //
delimiter ;

call hra2();

select * from tempp2;

-- --------------------------------------------------------------------
create table tempp3(
x char(15),
y float,
z float,
hra float
);

delimiter //
create procedure hra3()
begin
declare y float;
declare hra float;
declare z float default 0.4;
select sal into y from emp2
where ename = 'Himanshu';
set hra = y*z;
insert into tempp3 values('Himanshu', y, z, hra);
end; //
delimiter ;

call hra3();

select * from tempp3;
-- ---------------------------------------------------------------
delete from tempp;

delimiter //
create procedure hra5(y char(15))
begin
declare x int;
declare hra float;
declare z float default 0.4;
select sal into x from emp2
	where ename = y;
set hra = x*z;
insert into tempp values(y, x, z, hra);
end; //
delimiter ;

call hra5('Jayant');

select * from tempp;
-- ------------------------------------------------------------
