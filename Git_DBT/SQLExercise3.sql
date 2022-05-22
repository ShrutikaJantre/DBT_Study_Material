-- 1. Display all the Supplier names with the initial letter capital.
select concat(upper(substr(Sname, 1, 1)), lower(substr(Sname,2))) from SUPPLIER;

-- 2. Display all the Supplier names in upper case.
select upper(Sname) from SUPPLIER;

-- 3. Display all the Supplier names in lower case.
select lower(Sname) from SUPPLIER;

-- 4. Display all the Supplier names padded to 25 characters, with spaces on the left.
select lpad(Sname, 25, ' ') from SUPPLIER;

-- 5. Display all the Supplier names (with ‘la’ replaced by ‘ro’).
-- HINT: REPLACE.


-- 6. Implement the above command such that ‘l’ is replaced with ‘r’ and ‘a’ is replaced with ‘o’.


-- 7. Display the Supplier names and the lengths of the names.
select length(Sname) from SUPPLIER;

-- 8. Use the soundex function to search for a supplier by the name of ‘BLOKE’.
select * from Supplier where soundex(Sname)=soundex('Himanshuuu');

-- 9. Display the Supplier name and the status (as Ten, Twenty, Thirty, etc.).


-- 10. Display the current day (e.g. Thursday).
select dayname(sysdate());