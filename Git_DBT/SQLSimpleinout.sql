create table output(
fir int,
sec varchar(20)
);

delimiter //
create procedure abc(in y int)
begin
insert into output values(y, 'inside abc');
end; //
delimiter ;

call abc(10);

set @x = 100;
select @x from dual;
call abc(@x);

set @x = 10;
call abc(2*@x + 5);

select * from output;
-- --------------------------------------------------------------
delimiter //
create procedure abc(out y int)
begin
set y = 100;
end; //
delimiter ;

call abc(@x);

select @x from dual;
-- ------------------------------------------
drop procedure abc;

delimiter //
create procedure abc(inout y int)
begin
set y = y*y*y;
end; //
delimiter ;

set @x = 2;
call abc(@x);
select @x from dual;

