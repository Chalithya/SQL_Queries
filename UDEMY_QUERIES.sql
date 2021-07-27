USE school;
/*
CREATE TABLE Students(
	id int primary key identity(1,1) NOT NULL ,
	lastname nvarchar(50) NOT NULL,
	firstname nvarchar(50) NOT NULL,
	dateofbirth datetime NOT NULL,
	enrollmentdate datetime

);

DROP TABLE Students;

CREATE TABLE Courses(
	CourseID int identity(1,1) primary key NOT NULL,
	Title nvarchar(50),
	NumberOFCredits int,
	CourseCode nvarchar(5) NOT NULL
);


INSERT INTO Students ([lastname], [firstname],[dateofbirth],[enrollmentdate] )
VALUES ('chalithya', 'sangeeth', '1997-06-01', '2021-07-027');

*/

CREATE TABLE Students(
	id int primary key identity(1,1) NOT NULL ,
	lastname nvarchar(50) NOT NULL,
	firstname nvarchar(50) NOT NULL,
	dateofbirth datetime NOT NULL,
	enrollmentdate datetime

);

