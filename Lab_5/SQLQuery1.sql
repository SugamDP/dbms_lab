-- 1. Perform join operation on teacher and employee table and display the Employee name, Faculty and salary.


SELECT * FROM Teacher;
SELECT * FROM Employee;

SELECT Ename, Faculty, SALARY
FROM Employee
JOIN Teacher ON Employee.Eid = Teacher.TID;


-- 2. Perform left join on table book list and book table

SELECT * FROM Book;
SELECT * FROM BookList;


SELECT * FROM 
BookList LEFT JOIN 
Book ON BookList.Bid = Book.Bid;


--3.  Perform right join on booklist and book table.


SELECT * FROM 
BookList RIGHT JOIN
Book ON BookList.Bid = Book.Bid;


--4. Perform Full join on student and issues table.

SELECT * FROM student;
SELECT * FROM BookIssue;


SELECT * FROM 
student FULL OUTER JOIN 
BookIssue ON
student.SID = BookIssue.Sid;

--5. Find those employees name and id who have issued the book named “data”.


SELECT * FROM Employee;
SELECT * FROM BookIssue;


SELECT E.Ename, E.Eid  FROM
Employee E JOIN
BookIssue BI ON
E.Eid = BI.Eid AND BI.Bname = 'Data';

--6. Find the book name, bid, author name and the book published by “Ekata” Publication

SELECT * FROM Book;
SELECT * FROM BookList;

SELECT B.Bname, B.Bid, B.Author
FROM Book B WHERE
B.Bid IN (SELECT BL.Bid FROM BookList BL WHERE BL.Publication='Ekta');

--7. Display those employees name and salary whose name starts with‘s’ or whose name consist ‘ni’ as sub string.

SELECT * FROM Employee;



SELECT Ename, Salary 
FROM Employee WHERE Ename LIKE 's%' or Ename LIKE '%ni%';

--8.  Display name of the employee who is also a teacher

SELECT * FROM Employee;
SELECT * FROM Teacher;

SELECT E.Ename
FROM Employee E
WHERE E.Eid IN (
	SELECT Tid FROM Teacher T);


--9. Display all employees name except the name who are teachers.

SELECT E.Ename
FROM Employee E
WHERE E.Eid NOT IN (
	SELECT Tid FROM Teacher T);


--10. Create a view “Employee-view” which consist of eid, ename, salary as attributes.

CREATE VIEW Employee_view AS
SELECT Eid, Ename, Salary FROM Employee;

SELECT * FROM Employee_view;

--11. Insert a new record in recently created view. And also display the contents its primary table.

INSERT INTO Employee_view (Eid, Ename, Salary)
VALUES (3000, 'Sugam', 11000);


SELECT * FROM Employee;


--12. . Create a view “Employee_Info” which consist of employee name faculty and salary as its members and the salary should be less than 50000.

SELECT * FROM Employee;
SELECT * FROM Teacher;


CREATE VIEW Employee_Info AS
SELECT E.Ename, T.Faculty, E.Salary
FROM Employee E JOIN Teacher T ON E.Eid = T.TID
WHERE E.Salary<50000;

SELECT * FROM Employee_Info;



--13. Delete the information from “Employee-view” where salary are in range between 5000 to 15000.


SELECT * FROM Employee;

exec sp_help Employee;


SELECT * FROM Employee_view;




-- alt
DELETE FROM Employee_view
WHERE Salary BETWEEN 5000 AND 20000
AND Eid NOT IN (
    SELECT DISTINCT Eid FROM BookIssue
)
AND Eid NOT IN (
    SELECT DISTINCT TID FROM Teacher
);


EXEC sp_helptext 'Employee_view';














SELECT * FROM Employee
WHERE Salary BETWEEN 5000 AND 15000;


















