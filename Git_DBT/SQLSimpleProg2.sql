create table tempp(
x char(15),
y float,
z float,
hra float
);


delimiter //
create procedure hra()
begin
declare x char(15) default 'KING';
declare y float default 3000;
declare z float default 0.4;
declare hra float;
set hra = y*z;
insert into tempp values(x, y, z, hra);
set x = 'Rajesh';
insert into tempp values(x, y, z, hra);
end; //
delimiter ;

call hra();

select * from tempp;