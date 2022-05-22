--  5. Display all the data from the S table.
select * from SUPPLIER;

-- 6. Display only the S# and SNAME fields from the S table.
select S, Sname from SUPPLIER;

-- 7. Display the PNAME and COLOR from the P table for the CITY=”London”.
select Pname, Color from PARTS
	where city = 'London';

-- 8. Display all the Suppliers from London.
select * from SUPPLIER
	where city = 'London';

-- 9. Display all the Suppliers from Paris or Athens.
select * from SUPPLIER
	where city = 'Paris' or city = 'Athens';

-- 10. Display all the Projects in Athens.
select * from PROJECTS
	where city = 'Athens';

-- 11. Display all the Partnames with the weight between 12 and 14 (inclusive of both).
select *from PARTS
	where weight >= 5 and weight <= 10;

-- 12. Display all the Suppliers with a Status greater than or equal to 20.
select * from SUPPLIER
	where status >= 20;
    
-- 14. Display only the Cities from where the Suppliers come from.
select city from SUPPLIER;

-- 15. Assuming that the Part Weight is in GRAMS, display the same in
-- MILLIGRAMS and KILOGRAMS.
select Pname, weight*1000 "Weight in MILLIGRAMS", weight*0.001 "Weight in KG" from Parts;