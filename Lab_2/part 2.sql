-- Insertion of Data

-- Employee 
INSERT INTO Employee (Eid, Ename, EmploymentDate, Salary) VALUES
(10, 'Sita', '2020-10-02', 12000),
(11, 'Geeta', '2018-04-10', 9500),
(12, 'Ram', '2009-10-10', 8000),
(13, 'Sumita', '2008-11-11', 11000)
;

INSERT INTO Employee (Eid, Ename, Salary) VALUES
(14, 'Prayush' , 11000000);



--Booklist
INSERT INTO BookList (Bid, Bname, Publication) VALUES
(001, 'C++101', 'Oxford'),
(002, 'Data', 'Pearson'),
(003, 'Algo', 'Ekta'),
(004, 'Java', 'Everest');


--Book
INSERT INTO Book (Bid, Bname, Author, Price) VALUES
(001, 'C++101', 'Bjarne', 4500),
(002, 'Data', 'Navathe', 3000),
(003, 'Algo', 'CLRS', 4900),
(004, 'Java', 'Gosling', 3800);



--BookIssue

INSERT INTO BookIssue (Eid, Sid, Bname, DateOfIssue) VALUES
(10, 1000, 'C++101', '2024-05-01'), 
(11, 1002, 'Data', '2024-05-02'), 
(12, 1003, 'Algo', '2024-05-03'), 
(13, 1004, 'Java', '2024-05-04');



ALTER TABLE teacher
DROP COLUMN Salary;

TRUNCATE TABLE teacher;
INSERT INTO Teacher (TID, Name, Faculty) VALUES
(10, 'Sita', 'BEI'), 
(11, 'Geeta', 'BCT'), 
(12, 'Ram', 'BCE'), 
(13, 'Sumita', 'BEL');



-- Lab Tasks


-- 8 Display all records from all relations
SELECT * FROM Employee;
SELECT * FROM BookList;
SELECT * FROM Book;
SELECT * FROM BookIssue;
SELECT * FROM student;
SELECT * FROM Teacher;

-- 9 Display Employee id and Employee name of all employees whose salary is less than 10000.
Select Eid, Ename FROM Employee WHERE Salary <10000;

-- 10 Display all record of book whose price ranges from 2500 to 5000
SELECT * from Book Where Price>=2500 AND Price <=5000;

-- 11 Display all the records from Booklist relation whose publication name starts from ‘E’ e.g. Ekta
SELECT * FROM BookList WHERE Publication LIKE 'E%';

--12 . Display all records from employee table whose name ends with ‘ta’ e.g. Sita, Geeta etc.
SELECT * FROM Employee WHERE Ename LIKE '%ta';

--13 . Display all from book table with Book name exactly consist of 4 characters.
SELECT * FROM Book WHERE Bname LIKE '____';

--14 Display id, name and salary from employee table where Employee name starts with ‘S’ and salary greater than 10000.

SELECT Eid, Ename, Salary FROM Employee WHERE Ename LIKE 'S%' AND Salary>10000;

--15 . Display all records from book table where either book id lies in range 001 to 999 or price range in 1000 to 2500.
SELECT * FROM Book WHERE (Bid BETWEEN 001 AND 999) OR (Price BETWEEN 1000 AND 2500);

--16 Display Book number and book name where booklist must not contain Book id with number 003.
SELECT Bid, Bname FROM BookList WHERE Bid <> 003;
-- <> is equivalent to !=

--17 Remove the salary column from the teacher table.
ALTER TABLE teacher
DROP COLUMN salary;

