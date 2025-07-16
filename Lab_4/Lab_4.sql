--1. Sort the employee records in descending order
SELECT * FROM Employee;

SELECT * FROM Employee
ORDER BY Eid DESC;

--2. Display book name and publication name in ascending order sorted on the basis of book name.

SELECT * FROM BookList;

SELECT Bname, Publication FROM BookList
ORDER BY Bname ASC;


--3. Display top three records from teacher relation

SELECT * FROM Teacher;

SELECT TOP 3 * FROM Teacher;

--4. Display the sum of salaries of all employees
SELECT SUM(Salary) AS Sum_Salary FROM Employee;

--5. Display the minimum salary of employee.

SELECT * FROM Employee;
SELECT MIN(Salary) AS MinSalary FROM Employee;

--6. Display the average price of book written by same author.

SELECT * FROM Book;

SELECT Author, AVG(Price) AS AvgPrice
FROM Book
GROUP BY Author;

--7. Display publication name and number of books published by it from book list relation publication wise

SELECT * FROM BookList;

SELECT Publication, COUNT(Bname) AS total_publications
FROM BookList
GROUP BY Publication;

--8. Display the bid and bname of books whose price is greater than average prices of book

SELECT Bid, Bname
FROM Book
WHERE Price > (SELECT AVG(Price) FROM Book);


--9. Find the bid, bname and author in ascending order where author name is started by “G”.

SELECT * FROM Book;


SELECT Bid, Bname, Author
FROM Book
WHERE Author LIKE 'G%'
ORDER BY Author ASC;

--10. Find the teachers name and book taken by him. The teacher’s salary who takes the book should be the maximum salary
SELECT * FROM Teacher;
SELECT * FROM BookIssue;
SELECT * FROM Employee;


SELECT E.Ename, BI.Bname
FROM Employee E JOIN
BookIssue BI ON E.Eid = BI.Eid 
WHERE E.Salary =(SELECT MAX(Salary) FROM Employee);

--11. Find the authors name who have written more than one book.
SELECT * FROM Book;

SELECT Author
FROM Book
GROUP BY Author
HAVING COUNT(*) > 1;



