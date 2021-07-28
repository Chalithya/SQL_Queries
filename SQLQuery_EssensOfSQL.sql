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
