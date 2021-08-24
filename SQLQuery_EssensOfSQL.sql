USE testDB;

SELECT  Sno,Grade 
FROM    Take
WHERE   (Cno = 'CS001');

SELECT  * 
FROM    Take
WHERE   (Cno = 'CS001');


SELECT Student.Sno,Sname
FROM   Student, Take
WHERE  (Student.Sno=Take.Sno) AND (Cno='CS001')

SELECT Student.Sno,Student.Sname
FROM   Student, Take
WHERE  (Student.Sno=Take.Sno) AND (Take.Cno='CS001')

SELECT DISTINCT	Sno
FROM			Take
WHERE			(Cno='CS001')
	OR			(Cno='CS002');

SELECT DISTINCT	Sno
FROM			Take
WHERE			(Cno IN('CS001','CS002'))


/* Wrong Query
SELECT	Sno
FROM	Take
WHERE	(Cno='CS001')
	AND	(Cno='CS002')
*/

SELECT	Take.Sno
FROM	Take X, Take
WHERE	(X.Sno = Take.Sno)
	AND	(X.Cno = 'CS001')
	AND	(Take.Cno = 'CS002')

SELECT	Y.Sno
FROM	Take X, Take Y
WHERE	(X.Sno = Y.Sno)
	AND	(X.Cno = 'CS001')
	AND	(Y.Cno = 'CS002')


SELECT DISTINCT	Sno
FROM			Take
WHERE			(Cno !='CS001')

/* Wrong
SELECT DISTINCT S.Sno
FROM			Student S, Take T		
WHERE			(S.Sno = T.Sno)
	AND		NOT	(T.Cno = 'CS001')
*/

----------------------------------------------------------------
--8th Chapter

SELECT DISTINCT	T.Sno
FROM			Take T, Take
WHERE			(T.Sno = Take.Sno)
	AND			(T.Cno != Take.Cno)

SELECT DISTINCT	X.Sno
FROM			Take X, Take Y, Take
WHERE			(X.Sno = Take.Sno)
	AND			(X.Sno = Y.Sno)
	AND			(X.Cno != Take.Cno)
	AND			(X.Cno != Y.Cno)
	AND			(Y.Cno != Take.Cno)


SELECT DISTINCT	X.Sno
FROM			Take X, Take Y, Take
WHERE			(X.Sno = Take.Sno)
	AND			(X.Sno = Y.Sno)
	AND			(X.Cno < Y.Cno)
	AND			(Y.Cno < Take.Cno)


---------------------------------------
--10th Chapter

--E5

SELECT Sno, Sname
FROM Student
WHERE NOT (Sno  IN 
		(SELECT Sno	
		FROM Take	
		WHERE (Cno = 'CS001')));

	--Professors who doesnt teach CS001
/* 
SELECT Fname, Lname
FROM Professor
WHERE   (Fname+Lname  NOT IN 
		(SELECT Fname+Lname	
		FROM Teach	
		WHERE (Cno = 'CS001')))
		
*/
	

------------------------------------------
--Chap 12
--E8)
SELECT Sno
FROM Student
WHERE NOT (Sno IN
		(SELECT X.Sno
			FROM	Take X, Take Y, Take
			WHERE	(X.Sno = Y.Sno)
			AND		(Y.Sno = Take.Sno)
			AND		(X.Cno<Y.Cno)
			AND		(Y.Cno<Take.Cno)))


-- E9 - Who takes exactly  courses?
SELECT	X.Sno
FROM	Take X, Take
WHERE	(X.Sno = Take.Sno)
	AND	(X.Cno < Take.Cno)
	AND	NOT (X.Sno IN (
		SELECT	X.Sno
		FROM	Take X, Take Y, Take
		WHERE	(X.Sno = Y.Sno)
			AND	(Y.Sno = Take.Sno)
			AND	(X.Cno < Y.Cno)
			AND	(Y.Cno < Take.Cno)))


			--ElO- Who takes only CS112?  (Following all methods are right)
SELECT	Sno
FROM	Take
WHERE	(Cno = 'CS001')
	AND	NOT	(Sno IN 
		(SELECT X.Sno
		FROM	Take X, Take
		WHERE	(X.Sno = Take.Sno)
			AND	(X.Cno < Take.Cno)))

SELECT	Sno
FROM	Take
WHERE	(Cno = 'CS001')
	AND	NOT	(Sno IN  
		(SELECT Sno
		FROM	Take 
		WHERE	(Cno != 'CS001')))

SELECT	Sno
FROM	Take
WHERE	NOT	(Sno IN 
		(SELECT Sno
		FROM	Take 
		WHERE	(Cno != 'CS001')))

		--Ell- Who takes either CS112 or CS114?

SELECT	Sno
FROM	Take
WHERE	((Cno = 'CS001')
	OR	(Cno = 'CS002'))
	AND NOT(Sno IN
		(SELECT X.Sno
		FROM	Take X, Take
		WHERE	(X.Sno = Take.Sno)
			AND	(X.Cno = 'CS001'))
			AND	(Take.Cno = 'CS002'))



-- E12 - Who are the  youngest students?

SELECT	Sno
FROM	Student
WHERE	NOT (Age IN 
	(SELECT X.Age
	FROM	Student X, Student
	WHERE	(X.Age > Student.Age)))



-- Chap 14----------Enhance ment--------------------------
SELECT DISTINCT Fname, Lname
FROM Professor

-- Can assign new column names
SELECT Fname as Name, 'Last Name' = Lname
FROM	Professor

---Sorting---- ASC, DESC ----------
SELECT	Sname, Age
FROM	Student, Take
WHERE	(Student.Sno = Take.Sno)
	AND	(Cno = 'CS001')
ORDER BY Sname, Age DESC

--- Arithmatic operations ----------
SELECT DISTINCT	Sname, "New Age"= Age*10
FROM	Student, Take
WHERE	(Student.Sno = Take.Sno)
	AND (Student.Age > 200/10)
	
----- Formatting the Strings ----------

SELECT	'Full Name' = (Fname + ',' + substring(Lname,1,1) + '.' )
FROM	Professor


--------------------- Chapter 15 --------------------------
--What are full names and ages of professors who teach CS1

SELECT	P.Fname, P.Lname, Age
FROM	Professor P,  Teach T
WHERE	(P.Fname = T.Fname)
	AND	(P.Lname = T.Lname)
	AND	(T.Cno = 'CS001')


----  Which courses are taught by at least 2 professors

SELECT DISTINCT X.Cno
FROM	Teach X, Teach Y
WHERE	(X.Cno = Y.Cno)
	AND	(X.Fname != Y.Fname)
	AND	(X.Lname != Y.Lname) 
	OR (X.Lname IS NULL AND Y.Lname IS NULL)


