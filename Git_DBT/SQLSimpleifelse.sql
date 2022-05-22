create table output(
sal float,
salstatus char(15)
);

delimiter //
create procedure ifelse()
begin
declare x int;
select sal into x from emp2
where ename = 'Snehal';
if x > 4000 then
	insert into output values(x, 'High Sal');
else
	if x < 4000 then 
		insert into output values (x, 'Low Sal');
	else
		insert into output values (x, 'Medium Sal');
	end if;
end if;
end; //
delimiter ;
-- drop procedure ifelse;
call ifelse();
drop table output;
select * from output;