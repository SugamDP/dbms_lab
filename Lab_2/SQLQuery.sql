 exec sp_help 'employee';

-- 1. Employee Table 
CREATE TABLE Employee (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(100),
    EmploymentDate DATE,
    Salary DECIMAL(10, 2)
);

-- 2. BookList Table 
CREATE TABLE BookList (
    Bid INT PRIMARY KEY,
    Bname VARCHAR(200),
    Publication VARCHAR(100)
);

-- 3. Book Table 
CREATE TABLE Book (
    Bid INT,
    Bname VARCHAR(200),
    Author VARCHAR(100),
    Price DECIMAL(10, 2)
);

-- 4. BookIssue Table 
CREATE TABLE BookIssue (
    Eid INT,
    Sid INT,
    Bname VARCHAR(200),
    DateOfIssue DATE
);


-- 1.

ALTER TABLE student
    ALTER COLUMN SID INT NOT NULL;

ALTER TABLE student
    ADD CONSTRAINT pk_student PRIMARY KEY (SID);




exec sp_help 'student'; 
exec sp_help 'student'; 


ALTER TABLE Teacher
ADD CONSTRAINT fk_teacher_employee FOREIGN KEY (TID) REFERENCES Employee(Eid);

TRUNCATE TABLE teacher;



INSERT INTO Employee (Eid, Ename, EmploymentDate, Salary)
VALUES (101, 'Thonny', '2023-01-15', 50000);

INSERT INTO Teacher (Tid, Name, Faculty, Salary)
VALUES (101, 'Thonny', 'BCT', 50000);


-- 2. Set default value of ‘employmentDate’ attribute as December 1, 2010

exec sp_help 'Employee';
ALTER TABLE Employee
ADD CONSTRAINT df_employmentDate DEFAULT '2010-12-01' FOR EmploymentDate;

-- 3. Assign foreign key to attributes: ‘Bid’ in Book and Eid and Sid in BookIssue relation (Allow Null values if required).

exec sp_help 'book';
exec sp_help 'BookList';


ALTER TABLE Book
ADD CONSTRAINT fk_book_booklist FOREIGN KEY (Bid) REFERENCES BookList(Bid);


exec sp_help 'BookIssue';
exec sp_help 'Student';

ALTER TABLE BookIssue
ADD CONSTRAINT fk_bookissue_student FOREIGN KEY (Sid) REFERENCES Student(Sid);

ALTER TABLE BookIssue
ADD CONSTRAINT fk_bookissue_employee FOREIGN KEY (Eid) REFERENCES Employee(Eid);

-- 4. All the price of books must be less than 5000.
exec sp_help 'book';

ALTER TABLE Book
ADD CONSTRAINT chk_book_price CHECK (Price < 5000);

-- 5. Ename , Bname attribute of each relation must contain some value

exec sp_help 'Employee';
ALTER TABLE Employee
ALTER COLUMN Ename VARCHAR(100) NOT NULL;

ALTER TABLE BookList
ALTER COLUMN Bname VARCHAR(200) NOT NULL;

ALTER TABLE Book
ALTER COLUMN Bname VARCHAR(200) NOT NULL;

ALTER TABLE BookIssue
ALTER COLUMN Bname VARCHAR(200) NOT NULL;



-- 6. Bname attribute of Booklist relation must be unique

ALTER TABLE BookList
ADD CONSTRAINT Bname_unique UNIQUE (Bname);
exec sp_help 'BookList';

exec sp_helpconstraint 'Book';
exec sp_help 'student';
exec sp_help 'employee';
exec sp_help 'Teacher';
exec sp_help 'BookIssue';
exec sp_help 'BookList';
exec sp_help 'Book';
