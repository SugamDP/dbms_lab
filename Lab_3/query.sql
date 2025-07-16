
SELECT * FROM Employee;
SELECT * FROM Teacher;
SELECT * FROM Book;
SELECT * FROM BookIssue;
SELECT * FROM BookList;
SELECT * FROM student;



-- 1. Perform a Cartesian join on employee and teacher table and display the result


SELECT * FROM Employee, Teacher;

SELECT * FROM Employee CROSS JOIN Teacher;

-- 2. Perform a Cartesian join on employee and teacher table based on a common key attribute.

SELECT * FROM Employee CROSS JOIN Teacher 
Where Employee.Eid = Teacher.TID;

-- Another way

SELECT * FROM Employee, Teacher WHERE Employee.Eid = Teacher.TID;

-- OR
SELECT * FROM Employee E, Teacher T WHERE E.Eid = T.TID;

-- Another way

SELECT * FROM Employee E JOIN Teacher T on E.Eid = T.TID;


-- 3. Find all the book name, publication name and author name where publication name is “Ekta”

SELECT B.Bname,
	(SELECT Publication FROM BookList BL WHERE BL.Bid = B.Bid) AS Publication ,
	B.Author
FROM Book B
WHERE B.Bid IN (
	SELECT Bid FROM BookList WHERE Publication = 'Ekta'
	
);

SELECT B.Bname, BL.Publication, B.Author
FROM Book B
JOIN BookList BL on B.Bid = BL.Bid
WHERE BL.Publication = 'Ekta';

-- 4. Find the teachers name and faculty who issued book on May 1, 2024.
SELECT Name, Faculty 
FROM Teacher T
JOIN BookIssue BI on T.TID = BI.Eid 
WHERE BI.DateOfIssue='2024-05-01';


-- 5. Find the employee name whose salary is greater than 10000 and faculty is “BEI”.
SELECT Ename
FROM Employee E
JOIN Teacher T on E.Eid = T.TID
WHERE Salary>10000 AND Faculty = 'BEI';

-- OR USING SUB QUERY
SELECT Ename
FROM Employee
WHERE Eid IN (
	SELECT Tid FROM Teacher WHERE Faculty='BEI')
AND Salary>10000;

-- 6. . Find the student’s name who have issued book named ‘DBMS’
SELECT Name FROM student
WHERE SID IN ( SELECT SID FROM BookIssue WHERE Bname = 'Data');

-- OR

SELECT Name
FROM student S
JOIN BookIssue BI ON S.SID = BI.Sid
WHERE BI.Bname = 'Data';

-- 7. Add attribute bid on BookIssue relation
ALTER TABLE BookIssue 
ADD Bid VARCHAR(10);

-- 8. Update the data in bid column.
UPDATE BookIssue SET Bid=(
	SELECT Bid FROM Book Where Book.Bname = BookIssue.Bname);

-- 9. Find the employee name, book name, book’s author name taken by him where the price of book is less than 2500

SELECT E.Ename, B.Bname, B.Author
FROM Employee E
JOIN BookIssue BI ON E.Eid = BI.Eid
JOIN Book B on BI.Bname = B.Bname
WHERE Price<2500;


-- 10. Find the Teacher’s name, and book name issued by the teacher whose name starts with “S”.

SELECT T.Name, B.Bname
FROM Teacher T
JOIN BookIssue BI ON T.TID = BI.Eid AND T.Name LIKE 'S%'
JOIN Book B ON BI.Bname = B.Bname;

-- 11.  Update all salary by 10 %.

SELECT * FROM Employee;
UPDATE Employee SET Salary = Salary * 1.10;

-- 12. Update book name Data as Database
SELECT * FROM Book;
UPDATE Book SET Bname = 'DATABASE' WHERE Bname = 'Data';

--13. Update the salary of all employee by 20% whose salary is less than 5000
SELECT * FROM Employee;
UPDATE Employee SET Salary = Salary*1.2 WHERE Salary<5000;

--14. Provide 5% increment to all salaries whose salary is greater than 20000 and 20% increment in rest of salaries.


SELECT * FROM Employee;
UPDATE Employee
SET Salary = Salary * 
    CASE 
        WHEN Salary > 20000 THEN 1.05
        ELSE 1.20
    END;


--15. Delete the records from employee table whose eid is E101.
SELECT * FROM Employee;
DELETE FROM Employee WHERE Eid = 101;


--16. Use sub query to find all teachers name and faculty whose date of employee is november 11, 2011

SELECT * FROM Employee;
SELECT * FROM Teacher;
SELECT Name, Faculty
FROM Teacher
WHERE TID IN (
    SELECT Eid FROM Employee WHERE EmploymentDate = '2008-11-11'
);

--17. Use sub query to find all the book name and author name whose publication is “Everest”.
SELECT * FROM Book;
SELECT * FROM BookList;
SELECT Bname, Author
FROM Book
WHERE Bid in (
	SELECT Bid FROM BookList WHERE Publication='Ekta'
	);


--18. Find all the students name and batch who have issued the book from library in may 1 2024. Use sub query.
SELECT * FROM student;
SELECT * FROM BookIssue;
SELECT S.Name, S.Batch
FROM Student S
WHERE S.SID IN (
    SELECT Sid FROM BookIssue WHERE DateOfIssue = '2024-05-01'
);


--19. Use a sub query to display the name of teachers who have issued the books.
SELECT * FROM Teacher;
SELECT * FROM BookIssue;

SELECT Name
FROM Teacher T 
WHERE T.TID IN (
	SELECT TID FROM BookIssue
);


--20. Use a sub query to display the name of teachers who have issued the book name starting from ‘C’.

SELECT * FROM Teacher;
SELECT * FROM BookIssue;

SELECT Name
FROM Teacher T 
WHERE T.TID IN (
	SELECT BI.Eid FROM BookIssue BI WHERE Bname LIKE 'C%'
);


--21. Find all books issued by employees whose salary is between 9000 and 12000.

SELECT * FROM Employee;
SELECT * FROM BookIssue;


SELECT *
FROM Employee E 
JOIN BookIssue BI ON E.Eid = BI.Eid WHERE E.Salary BETWEEN 9000 AND 12000;


--22. List the names of employees who have not issued any books.
SELECT E.Ename
FROM Employee E
WHERE E.Eid NOT IN (SELECT Eid FROM BookIssue);



-- 23. Count the total number of books issued by each employee.
SELECT BI.Eid, E.Ename, COUNT(BI.Bname) AS TotalBooksIssued
FROM BookIssue BI
JOIN Employee E ON BI.Eid = E.Eid
GROUP BY E.Ename, BI.Eid;


--24. Display the name and publication of the most expensive book.
SELECT * FROM Book;

SELECT * FROM Book
WHERE Price = (SELECT MAX(Price) FROM Book);

-- 25. Display all books and mention whether they are issued or not using CASE.

SELECT 
    B.Bid,
    B.Bname,
    B.Author,
    B.Price,
    CASE 
        WHEN BI.Bid IS NOT NULL THEN 'Issued'
        ELSE 'Not Issued'
    END AS IssueStatus
FROM Book B
LEFT JOIN BookIssue BI ON B.Bid = BI.Bid;

