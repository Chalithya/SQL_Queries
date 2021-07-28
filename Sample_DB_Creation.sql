--CREATE DATABASE testDB;

USE testDB;


CREATE TABLE Student(
	Sno		char(9)			NOT NULL,
	Sname	varchar(20)		NULL,
	Age		int				Null
	);


CREATE UNIQUE INDEX Student_ndx ON Student(Sno)	



CREATE TABLE Course(
	Cno			char(9)			NOT NULL,
	Title		varchar(20)		NULL,
	Credits		int				Null
	);

CREATE UNIQUE INDEX Course_ndx ON Course(Cno)	


CREATE TABLE Professor(
	Fname		varchar(20)		NOT NULL,
	Lname		varchar(20)		NULL,
	Dept		varchar(20)		NULL,
	Rank		varchar(20)		NULL,
	Salary		varchar(20)		NULL,
	Age			int				Null
	);

--DROP TABLE Professor;
CREATE UNIQUE INDEX Prof_name ON Professor(Fname, Lname)


CREATE TABLE Take(
	Sno		char(9)			NOT NULL,
	Cno		char(9)			NOT NULL,
	Grade	varchar(2)		NULL
	);

CREATE TABLE Teach(
	Fname	varchar(20)		NOT NULL,
	Lname	varchar(20)		NULL,
	Cno		char(9)			NOT NULL	
	);

--DROP TABLE Teach;


INSERT INTO Professor ([Fname],[Lname],[Dept],[Rank],[Salary],[Age])
VALUES ('bhagya', 'sithara', 'computing', 'head', 30000, 24 );


INSERT INTO Course([Cno],[Title],[Credits])
VALUES ('CS034', 'Electrical', 1);


INSERT INTO Student([Sno],[Sname],[Age])
VALUES ('std03', 'kimuthu', 20);


INSERT INTO Take ([Sno],[Cno],[Grade])
VALUES ('std03', 'CS003', 'c');

INSERT INTO Teach ([Fname],[Lname],[Cno])
VALUES ('parami', 'hansika', 'CS003');

