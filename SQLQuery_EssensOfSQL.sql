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
	AND		NOT	(T.Sno = 'CS001')
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


