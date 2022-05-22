create table output(
sno int,
sname varchar(15)
);

delimiter //
create procedure abc11()
begin
insert into output values(1, 'Himanshu');
insert into output values(2, 'Rajesh');
end; //
delimiter ;

call abc11();

select * from output;