-- 1. Display the Supplier table in the descending order of CITY.
select * from Supplier
	order by City desc;

-- 2. Display the Part Table in the ascending order of CITY and within the city in the ascending order of Part names.
select * from Parts
	order by City asc, Pname asc; 

-- 3. Display all the Suppliers with a status between 10 and 20.
select * from Supplier
	where Status between 10 and 20;

-- 4. Display all the Parts and their Weight, which are not in the range of 10 and 15.
select Pname, Weight from PARTS
	where Weight not between 5 and 10;

-- 5. Display all the Part names starting with the letter ‘S’.
select Pname from PARTS
	where Pname like 'S%';

-- 6. Display all the Suppliers, belonging to cities starting with the letter ‘L’.
select Sname, city from Supplier
	where city like "L%";

-- 7. Display all the Projects, with the third letter in JNAME as ‘n’.
select J, JNAME from PROJECTS
	where JNAME like "__n%";



