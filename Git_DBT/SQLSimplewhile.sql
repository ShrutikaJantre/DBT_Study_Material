create table output(
x int,
loopp char(15)
);

delimiter //
create procedure whileloop()
begin
declare x int default 1;
while x < 10 do
	insert into output values(x, 'in while loop');
    set x = x+1;
end while;
end; //
delimiter ;

call whileloop();

select * from output;
-- ---------------------------------------------------
delete from output;
delimiter //
create procedure whileloop1()
begin
declare x int default 1;
declare y int default 1;
while x < 10 do
	while y < 10 do
		insert into output values(y, 'in y while loop');
        set y = y+1;
        end while;
	insert into output values(x, 'in x while loop');
    set x = x+1;
end while;
end; //
delimiter ;

call whileloop1();

select * from output;

select * from output;