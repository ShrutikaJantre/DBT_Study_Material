create table temppp(
-- num int,
-- sent varchar(20)
fir float,
sec char(15)
);

delimiter //
create function abc()
returns int
deterministic
begin
return 10;
end; //
delimiter ;

delimiter //
create procedure pqr()
begin
declare x int;
set x = abc();
insert into temppp values(x, 'after abc');
end; //
delimiter ;
call pqr();
select * from temppp;

-- ----------------------------------------------------------
delimiter //
create function abc(y int)
returns int
deterministic
begin
return y*y;
end; //
delimiter ;

delimiter //
create procedure pqr()
begin
declare x int;
set x = abc(10);
insert into temppp values(x, 'after abc()');
end; //
delimiter ;

call pqr();

select * from temppp;
-- -------------------------------------------------------------------------------
delimiter //
create function abc(y int)
returns int
deterministic
begin
if y > 5000 then 
	return true;
else
	return faLse;
end if;
end; //
delimiter ;

delimiter //
create procedure pqr()
begin
declare x int;
select sal into x from emp2 where ename = 'Himanshu';
if abc(x) then
	insert into temppp values(x, '>5000');
else
	insert into temppp values(x, '<5000');
end if;
end; //

call pqr();

select * from temppp;
