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
	Fnmae	varchar(20)		NOT NULL,
	Lname	varchar(20)		NULL,
	Cno		char(9)			NOT NULL	
	);


SELECT Sno FROM Take WHERE (Cno = 'CS112');

