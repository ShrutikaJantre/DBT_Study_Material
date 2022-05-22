-- Create S, P, J, SPJ tables as specified below and insert a few rows in each table:-
-- SUPPLIER
-- (S#, Sname, Status, City)
--  S
-- PARTS
-- (P#, Pname, Color, Weight, City)
-- - P
-- PROJECTS
-- (J#, Jname, City)
-- - J
-- SUPPLIER-PARTS-PROJECT
-- (S#, P#, J#, Qty)
-- - SPJ
-- Sample data for S# column:- ‘S1’, ‘S2’, ‘S3’, etc.
-- Sample data for P# column:- ‘P1’, ‘P2’, ‘P3’, etc.
-- Sample data for J# column:- ‘J1’, ‘J2’, ‘J3’, etc.
-- Sample data for Status column:- 10, 20, 30, etc.

create table SUPPLIER(
S char(2),
Sname varchar(15),
Status int,
City varchar(15)
);

insert SUPPLIER(S, Sname, Status, City) values
('S1', 'Shrutika', 10, 'London'),
('S2', 'Himanshu', 20, 'London'),
('S3', 'Snehal', 30, 'Athens'),
('S4', 'Kalyani', 40, 'Paris'),
('S5', 'Jayant', 50, 'Athens');
select * from SUPPLIER;

-- --------------------------------------------------------
create table PARTS(
P char(2),
Pname varchar(15),
Color char(15),
Weight float,
City varchar(15)
);

insert PARTS(P, Pname, Color, Weight, City) values
('P1', 'Engine', 'Black', 450, 'London'),
('P2', 'Gear', 'Grey', 1450, 'London'),
('P3', 'Tyre', 'Black', 600, 'Athens'),
('P4', 'Pivot', 'Black', 5, 'Paris'),
('P5', 'Screw', 'Black', 10, 'Athens');
select * from PARTS;
-- ---------------------------------------------------------------------------
create table PROJECTS(
J char(2),
Jname varchar(15),
City varchar(15)
);

insert PROJECTS(J, Jname, City) values
('J1', 'Maruti', 'London'),
('J2', 'Honda', 'London'),
('J3', 'Hyundai', 'Athens'),
('J4', 'BMW', 'Paris'),
('J5', 'KIA', 'Athens');
select * from PROJECTS;
-- -------------------------------------------------------------------------
create table SUPPLIERPARTSPROJECT(
S char(2),
P char(2),
J char(2),
Qty int
);

insert SUPPLIERPARTSPROJECT(S, P, J, Qty) values
('S1', 'P1', 'J1', 10),
('S1', 'P2', 'J2', 20),
('S2', 'P3', 'J5', 30),
('S3', 'P4', 'J3', 20),
('S2', 'P5', 'J4', 30),
('S5', 'P1', 'J1', 40),
('S4', 'P2', 'J5', 50),
('S5', 'P3', 'J4', 20),
('S4', 'P5', 'J2', 40);
select * from SUPPLIERPARTSPROJECT;