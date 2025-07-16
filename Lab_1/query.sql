CREATE DATABASE HCOE2082;
use HCOE2082;

--Student(SID, Name, RN, Batch)
/*Teacher (TID, Name, Faculty)*/

CREATE TABLE student 
(	SID int, 
	Name varchar(25),
	RN int, 
	Batch char(4),
);

CREATE TABLE Teacher
(	TID int, 
	Name varchar(25), 
	Faculty char(4)
);

-- use of stored procedure
exec sp_help 'student';

exec sp_help 'teacher';

--Insert five records in student table

INSERT INTO student (SID, Name, RN, Batch)
values (1000, 'Ram', 1, '2079'),
		(1001, 'Madan', 2, '2079'),
		(1002, 'Hari', 3, '2079'),
		(1003, 'Geeta', 4, '2079'),
		(1004, 'Shyam', 5, '2079');


-- Insert five records in teacher table

INSERT INTO Teacher(TID, Name, Faculty)
values (101, 'Sammy', 'BCT'),
		(102, 'Antonio', 'BEI'),
		(103, 'Braddy', 'BCE'),
		(104, 'Thomas', 'BCT'),
		(105, 'Hari', 'BEI');




-- Display all records from student table
SELECT * FROM student;

-- Display all records from teacher table
SELECT * FROM Teacher;


--Display only SID and Name from student table.

SELECT SID, NAME FROM student;

--Display Name and faculty from Teacher table.

SELECT NAME, FACULTY FROM Teacher;

-- Remove ‘RN’ attribute from student relation.

ALTER TABLE student
DROP COLUMN RN;

-- Add ‘salary’ attribute to teacher relation.

ALTER TABLE Teacher
ADD Salary Money;

--Copy SID and name attribute to new relation ‘info_student’


SELECT SID, Name
INTO info_student
FROM student;

SELECT * FROM info_student;
exec sp_help info_student;

--Delete all contents from info_student relation
TRUNCATE TABLE info_student;