USE testDB;
--E4 - Who takes both CS112 and CS114? 

SELECT	X.Sno
FROM	Take X, Take
WHERE	(X.Sno = Take.Sno)
	AND	(X.Cno = 'CS001')
	AND	(Take.Cno = 'CS002')

--E5 -  Who does not take CS112? 

SELECT	Sno
FROM	Student
WHERE	Not	(Sno IN 
		(SELECT Sno
		FROM	Take
		WHERE	(Cno = 'CS001')))

--E6 -  Who takes a course which is not CS112? 

SELECT DISTINCT	Sno
FROM			Take
WHERE		NOT	(Cno ='CS001')


--E7 - Who takes at least 2 courses (i.e., at least 2 courses with different course numbers)? 

SELECT DISTINCT	X.Sno
FROM	Take X,Take
WHERE	(X.Sno = Take.Sno)
	AND	(X.Cno < Take.Cno)

--E8 - Who takes at most 2 courses? 

SELECT	Sno
FROM	Student
WHERE NOT (Sno IN
	(SELECT X.Sno
	FROM	Take X, Take Y, Take
	WHERE	(X.Sno = Take.Sno)
		AND	(Take.Sno = Y.Sno)
		AND	(X.Cno < Take.Cno)
		AND	(Take.Sno < Y.Sno)))

--E9 - Who takes exactly 2 courses? 
SELECT	X.Sno
FROM	Take X, Take
WHERE	(X.Sno = Take.Sno)
	AND	(X.Cno < Take.Sno)
	AND	(X.Sno NOT IN
		(SELECT X.Sno
		FROM	Take X, Take Y, Take
		WHERE	(X.Sno = Take.Sno)
			AND	(Take.Sno = Y.Sno)
			AND	(X.Cno < Y.Cno)
			AND	(Y.Cno < Take.Cno)))

--E10 - Who takes only CS112? 

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


--E11 -  Who takes either CS112 or CS114? 

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

SELECT Sno
FROM	Take
WHERE	((Cno = 'CS001')
	OR	(Cno = 'CS002'))
	AND	NOT (Sno IN 
		(SELECT X.Sno
		FROM	Take X, Take Y
		WHERE	(X.Sno = Y.Sno)
			AND	(X.Cno = 'CS001')
			AND	(Y.Cno = 'CS002')))

-- E12 - Who are the  youngest students?

SELECT	Sno
FROM	Student
WHERE	NOT (Age IN 
	(SELECT X.Age
	FROM	Student X, Student
	WHERE	(X.Age > Student.Age)))

--What are full names and ages of professors who teach CS1

SELECT	P.Fname, P.Lname, Age
FROM	Professor P,  Teach T
WHERE	(P.Fname = T.Fname)
	AND	(P.Lname = T.Lname)
	AND	(T.Cno = 'CS001')


----  Which courses are taught by at least 2 professors


SELECT	X.Fname, X.Lname
FROM	Teach X, Teach Y
WHERE	(X.Cno = Y.Cno)
	AND	((X.Fname != Y.Fname)
	OR	(X.Lname != Y.Lname))


-- Chap 15---------------------------------------------------------------------------
--What are full names and ages of professors who teach CS1

SELECT	 P.Fname, P.Lname, age
FROM	Professor P, Teach T
WHERE	(P.Fname = T.Fname)
	AND	(P.Lname = T.Lname)
	AND	(T.Cno = 'CS001')


----  Which courses are taught by at least 2 professors

SELECT DISTINCT	X.Fname, X.Lname
FROM	Teach X, Teach Y
WHERE	(X.Cno = Y.Cno)
	AND	((X.Fname != Y.Fname)
	OR	(X.Lname != Y.Lname))

----  Which courses are taught by at least 3 professors

SELECT DISTINCT	X.Fname, X.Lname
FROM	Teach X, Teach Y, Teach Z
WHERE	(X.Cno = Y.Cno)
	AND	(Y.Cno = Z.Cno)
	AND	((X.Fname < Y.Fname)
		OR	(X.Lname < Y.Lname)
	AND	((Y.Fname < Z.Fname)
		OR	(Y.Lname < Z.Lname)))


