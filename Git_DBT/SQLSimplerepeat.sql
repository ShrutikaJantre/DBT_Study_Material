create table output1(
x int,
loopp char(15)
);

delimiter //
create procedure repeatloop()
begin
declare y int default 2; 
declare x int default 0;
declare z int;
repeat 
	set x = x+1;
	set z = y*x;
    insert into output1 values(z, 'in x loop');
    
until x > 10
end repeat;
end; //
delimiter ;


drop procedure repeatloop;
call repeatloop();
drop table output1;
select * from output1;
-- -----------------------------
delimiter //
create procedure repeatloop1()
begin
declare x int default 1;
abc_loop : loop
	if x > 10 then
		leave abc_loop;
	end if;
    set x = x + 1;
    if mod(x, 2)!=0 then
		iterate abc_loop;
	else
		insert into output1 values(x, 'Inside loop');
	end if;
end loop;
end; //
delimiter ;

call repeatloop1();

select * from output1;
    
