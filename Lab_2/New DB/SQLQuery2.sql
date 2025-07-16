create database Lab2;

CREATE TABLE Departments(
	
	DepartmentID int PRIMARY KEY, 
	DepartmentName NVARCHAR(50)

);

CREATE TABLE Courses(
	CourseID INT PRIMARY KEY, 
	CourseName NVARCHAR(50),
	Credit INT

);

CREATE TABLE Students(
	StudentID INT PRIMARY KEY, 
	Name NVARCHAR(50),
	Age INT, 
	DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID)

);

CREATE TABLE Enrollments(
	EnrollID INT PRIMARY KEY, 
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID), 
	CourseID INT FOREIGN KEY REFERENCES Courses(COURSEID),
	Grade CHAR

);


exec sp_help 'Students';
exec sp_help 'Departments';
exec sp_help 'Courses';
exec sp_help 'Enrollments';



INSERT INTO Departments(DepartmentID, DepartmentName)
VALUES (1, 'BEI'),
(2, 'BCT'), 
(3, 'BEL'), 
(4, 'BCE'), 
(5, 'BAG');

SELECT * FROM Departments;

INSERT INTO Courses(CourseID, CourseName, Credit) 
VALUES (1001, 'Object Oriented Programming', 45),
(1002, 'Data Science with Python', 30),
(1003, 'Kinematics and Inverse Kinematics', 60),
(1004, 'Path Planning in Robotics', 70),
(1005, 'Data Structure and Algorithms', 30), 
(1006, 'उन्नत नेपाली व्याकरण', 100);


INSERT INTO Courses(CourseID, CourseName, Credit) 
VALUES
(1006, N'उन्नत नेपाली व्याकरण', 100);

SELECT * FROM Courses;


INSERT INTO Students(StudentID, Name, Age, DepartmentID)
VALUES (101, 'Prayush', 20, 1 ), 
(102, 'Alex', 22, 5 ), 
(103, 'Sudip', 20, 4 ), 
(104, 'Kalyan', 22, 3 ), 
(105, 'Tek', 20, 2 );


SELECT * FROM Students;

INSERT INTO Enrollments (EnrollID, StudentID, CourseID, Grade) VALUES
(70, 101, 1005, 'A'), 
(71, 102, 1002, 'F'), 
(72, 103, 1003, 'B'), 
(73, 104, 1004, 'A'), 
(74, 105, 1001, 'C');

SELECT * FROM Enrollments;

