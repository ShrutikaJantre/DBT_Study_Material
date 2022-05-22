create table tempp1(
x char(15),
y float,
z float,
hra float
);


delimiter //
create procedure hra1(x char(15), y float, z float)
begin
declare hra float;
set hra = y*z;
insert into tempp1 values(x, y, z, hra);
end; //
delimiter ;

call hra1('Himanshu', 10000, 0.4);
call hra1('Rajesh', 20000, 0.4);
select * from tempp1;

