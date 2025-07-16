-- 1.Create a stored procedure that displays the books published by “Ekata” Publication.


SELECT * FROM BookList;

CREATE PROCEDURE display_book_publishedby_Ekta AS
SELECT * FROM BookList WHERE Publication = 'Ekta'
GO

exec display_book_publishedby_Ekta;

--2. Create a stored procedure that is used to display the books details written by particular author.The author name is assigned as a parameter during a procedure call.

SELECT * FROM Book;

CREATE PROCEDURE display_givenauthor_books @author_name varchar(30) AS
SELECT * FROM Book WHERE Author = @author_name
GO

exec display_givenauthor_books @author_name = 'Bjarne';

--3. Create a procedure to display the information of employees with salary greater than 20000 and employment date January 25, 2020.

SELECT * FROM Employee;

CREATE PROCEDURE display_employee_condition_date_and_salary AS
SELECT * FROM Employee WHERE
Salary>20000 AND EmploymentDate='2020-10-02'
GO

exec display_employee_condition_date_and_salary;

--4. Create a procedure to display the information of employee where name and salary is given at runtime.

CREATE PROCEDURE display_employee_name_and_salary_runtime @name varchar(30), @salary decimal (10,2) AS
SELECT * FROM Employee WHERE
Ename = @name AND Salary = @salary
GO

exec display_employee_name_and_salary_runtime @name = 'Prayush', @salary = 2737.15;

--5. Create a procedure to insert a new data to booklist relation.

SELECT * FROM BookList;

CREATE PROCEDURE insert_booklist_relation @id int, @name varchar(30), @pub varchar(30) AS
INSERT INTO BookList(Bid, Bname, Publication)
VALUES (@id, @name, @pub)
GO

exec insert_booklist_relation @id=5, @name = 'The Secrets of Prayush', @pub = 'Prayush House';

--6. Create a procedure to update on employee relation. Provide a charge of -50000 to all the salaries less than 25000.

SELECT * FROM Employee;

CREATE PROCEDURE update_employee_charge AS
UPDATE Employee SET Salary = Salary - 50000 WHERE
Salary <25000
GO

exec update_employee_charge;

--7. Modify a procedure created in qno.6 and provide a charge of 35000 to all salaries less than 20000.

ALTER PROCEDURE update_employee_charge AS
UPDATE Employee SET Salary = Salary - 40000 WHERE
Salary<350000
GO

EXEC update_employee_charge;

--8. Create a trigger that sets the salary to null if the salaries are negative after update in the employee table



SELECT * FROM Employee;

CREATE TRIGGER reset_salary ON Employee
AFTER UPDATE
AS
UPDATE Employee SET Salary = 0 WHERE Salary <0;




--9. Create a trigger that sets the employement date to a system data after insertion on the employee table.


CREATE TRIGGER set_employmentdate_to_systemdate ON Employee
AFTER INSERT
AS

BEGIN
UPDATE Employee SET EmploymentDate = GETDATE();

SELECT * FROM Employee;
INSERT INTO Employee (Eid, Ename, EmploymentDate, Salary)
VALUES (15, 'Kalyan', '2010-12-01', 30000000)
END;



exec sp_help 'Employee';

--10. Create an index on eid attribute of employee table.

CREATE INDEX index_eid
ON Employee (Eid);


--11. Display the current system date using built in function.

SELECT GETDATE() AS current_system_date;


--12. Reverse a word and display it using built in function

SELECT REVERSE ('Prayush');

--13. Convert the given text to upper case using built in function.

SELECT UPPER('prayush');

--14. Display total memory space occupied by your database and its object using system stored procedure

EXEC sp_spaceused;



--15. Display list of tables that can be query on in your database using system stored procedure

EXEC sp_tables @table_type = "'TABLE'";
