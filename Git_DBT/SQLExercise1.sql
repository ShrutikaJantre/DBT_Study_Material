-- 1. Create the table SEMP with the following structure:-
-- EMPNO CHAR(4)
-- EMPNAME CHAR(20)
-- BASIC FLOAT
-- DEPTNO CHAR(2)
-- DEPTHEAD CHAR(4)
show databases;
create table SEMP(
EMPNO char(4),
EMPNAME char(20),
BASIC float,
DEPTNO char(2),
DEPTHEAD char(4)
);

insert into SEMP(EMPNO, EMPNAME, BASIC, DEPTNO, DEPTHEAD) values
('0001', 'SUNIL', 6000, '10', null),
('0002', 'HIREN', 8000, '20', null),
('0003', 'ALI', 4000, '10', '0001'),
('0004', 'GEORGE', 6000, null, '0002');
select * from SEMP;
-- -------------------------------------------------------------------------
-- 2. Create the table SDEPT with the following structure:-
-- DEPTNO CHAR(2)
-- DEPTNAME CHAR(15)

create table SDEPT(
DEPTNO char(2),
DEPTNAME char(15)
);

insert into SDEPT(DEPTNO, DEPTNAME) values
('10', 'Development'),
('20', 'Training');
select * from SDEPT;
-- ---------------------------------------------------------------------------

show tables;