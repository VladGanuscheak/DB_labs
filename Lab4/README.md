# Tasks

![Task part 1](Task1.png)

![Task part 2](Task2.png)

# Solutions

**1.** Code:
```javascript
    SELECT *
    FROM grupe as g
    ORDER BY g.Nume_Facultate ASC
```
**2.** Code:    
```javascript
    SELECT *
    FROM discipline
    ORDER BY Nr_ore_plan_disciplina DESC
```
**3.** Code (I variant):
```javascript
    SELECT DISTINCT Disciplina, Nume_Profesor, Prenume_Profesor
    FROM discipline as dis, profesori as prof, studenti_reusita as st
    WHERE dis.Id_Disciplina = st.Id_Disciplina
          and prof.Id_Profesor = st.Id_Profesor
    ORDER BY prof.Nume_Profesor DESC, prof.Prenume_Profesor DESC
```
Code (II variant):

```javascript
    SELECT DISTINCT Disciplina, Nume_Profesor, Prenume_Profesor
    FROM (discipline as d INNER JOIN studenti_reusita as st_r
    	ON d.Id_Disciplina = st_r.Id_Disciplina)
    	INNER JOIN profesori as p
    	ON p.Id_Profesor = st_r.Id_Profesor
    ORDER BY Nume_Profesor DESC, Prenume_Profesor DESC
```
**4.** Code:
```javascript
    SELECT Disciplina
    FROM discipline
    WHERE LEN(Disciplina) > 20
```

Check results:

```javascript
    SELECT d.Disciplina, LEN(d.Disciplina) as NameLength
    FROM discipline as d
    WHERE LEN(d.Disciplina) > 20
```
**5.** Code:
```javascript
    SELECT *
    FROM studenti
    WHERE Nume_Student LIKE '%u'
```
**6.** Code (I variant):
```javascript
    SELECT TOP 5 Nume_Student, Prenume_Student
    FROM (studenti as st INNER JOIN studenti_reusita as st_r
    	ON st.Id_Student = st_r.Id_Student)
    	INNER JOIN discipline as d
    	ON st_r.Id_Disciplina = d.Id_Disciplina
    WHERE Tip_Evaluare LIKE '%2' and Disciplina = 'Baze de date'
    ORDER BY Nota DESC
```
    
Code (II variant):

```javascript
    SELECT TOP 5 Nume_Student, Prenume_Student
    FROM studenti as st INNER JOIN studenti_reusita as st_r
    	ON st.Id_Student = st_r.Id_Student
    WHERE Tip_Evaluare LIKE '%2' and st_r.Id_Disciplina = 
    	(SELECT d.Id_Disciplina
    	FROM discipline as d 
    	WHERE d.Disciplina = 'Baze de date')
    ORDER BY Nota DESC
```

**7.** Code (I variant):
```javascript
    SELECT Cod_Grupa
    FROM grupe
    WHERE Id_Grupa IN 
    	(SELECT st_r.Id_Grupa
    	FROM studenti_reusita as st_r
    	WHERE st_r.Id_Student IN 
    		(SELECT st.Id_Student
    		FROM studenti as st
    		WHERE st.Adresa_Postala_Student LIKE '%31 August%')
    	)
```

Code (II variant):

```javascript
    SELECT DISTINCT Cod_Grupa
    FROM (grupe as g INNER JOIN studenti_reusita as st_r
    	ON g.Id_Grupa = st_r.Id_Grupa) INNER JOIN studenti as st
    		ON st_r.Id_Student = st.Id_Student
    	WHERE Adresa_Postala_Student LIKE '%31 August%'
```
**8.** Code (I variant):
```javascript
    SELECT Id_Student, Nume_Student, Prenume_Student
    FROM studenti
    WHERE Id_Student IN
    	(SELECT st_r.Id_Student
    	FROM studenti_reusita as st_r
    	WHERE st_r.Data_Evaluare LIKE '%2018%' and st_r.Tip_Evaluare = 'Examen')
```

Code (II variant):

```javascript
    SELECT DISTINCT st.Id_Student, Nume_Student, Prenume_Student
    FROM studenti as st INNER JOIN studenti_reusita as st_r
    ON st.Id_Student = st_r.Id_Student
    WHERE Data_Evaluare LIKE '%2018%' and Tip_Evaluare = 'Examen'
```
**9.** Code (I variant):
    
```javascript
    SELECT DISTINCT st.Nume_Student, st.Prenume_Student, st.Adresa_Postala_Student, st_r.Id_Disciplina  
    FROM studenti as st, studenti_reusita as st_r
    WHERE st.Id_Student = st_r.Id_Student and st_r.Nota > 8 and st_r.Data_Evaluare LIKE '2018%'
    ORDER BY st.Nume_Student ASC, st.Prenume_Student ASC
```

Code (II variant)

```javascript
    SELECT DISTINCT Nume_Student, Prenume_Student, Adresa_Postala_Student, Id_Disciplina
    FROM studenti as st INNER JOIN studenti_reusita as st_r
    ON st.Id_Student = st_r.Id_Student
    WHERE Nota > 8 and Data_Evaluare LIKE '2018%'
    ORDER BY Nume_Student ASC, Prenume_Student ASC
```

**10.** Code (I variant):

```javascript
    SELECT st.Nume_Student, st.Prenume_Student
    FROM studenti as st
    WHERE st.Id_Student IN
    	(SELECT st_r.Id_Student
    	FROM studenti_reusita as st_r
    	WHERE st_r.Nota < 8 and st_r.Nota > 4 and st_r.Tip_Evaluare = 'Examen' and
    		st_r.Id_Disciplina IN
    		(SELECT d.Id_Disciplina
    		FROM discipline as d
    		WHERE d.Disciplina = 'Baze de date'))
```

Code (II variant):

```javascript
    SELECT Nume_Student, Prenume_Student
    FROM (studenti as st INNER JOIN studenti_reusita as st_r
    	ON st.Id_Student = st_r.Id_Student)
    	INNER JOIN discipline as d
    	ON st_r.Id_Disciplina = d.Id_Disciplina
    	WHERE Disciplina = 'Baze de date' and Nota < 8 and Nota > 4 and Tip_Evaluare = 'Examen'
```

**11.** Code (I variant):

```javascript
    SELECT p.Nume_Profesor, p.Prenume_Profesor
    FROM profesori as p
    WHERE p.Id_Profesor IN
    	(SELECT st_r.Id_Profesor
    	FROM studenti_reusita as st_r
    	WHERE st_r.Tip_Evaluare LIKE 'Reusita%' and st_r.Id_Disciplina IN 
    		(SELECT d.Id_Disciplina
    		FROM discipline as d
    		WHERE d.Disciplina LIKE '%Baze de date%')
    and st_r.Nota < 5 and st_r.Data_Evaluare LIKE '2018%')
```

Code (II variant):

```javascript
    SELECT DISTINCT Nume_Profesor, Prenume_Profesor
    FROM (profesori as p INNER JOIN studenti_reusita as st_r
    	ON p.Id_Profesor = st_r.Id_Profesor) INNER JOIN discipline as d
    		ON st_r.Id_Disciplina = d.Id_Disciplina
    WHERE Disciplina = 'Baze de date' and Data_Evaluare LIKE '%2018%' and Nota < 5 and Tip_Evaluare LIKE 'Reusita%'
```

**12.** Code (I variant):
    
```javascript
    SELECT Nume_Student, Prenume_Student, Disciplina,
    (SELECT DISTINCT ANS1.Nota FROM studenti_reusita as ANS1 WHERE ANS1.Id_Student = st.Id_Student and ANS1.Tip_Evaluare = 'Testul 1' and ANS1.Id_Disciplina = st_r.Id_Disciplina) as Test1,
    (SELECT DISTINCT substring(CONVERT(VARCHAR(8), ANS1_data.Data_Evaluare), 0, 5)  FROM studenti_reusita as ANS1_data WHERE ANS1_data.Id_Student = st.Id_Student and ANS1_data.Tip_Evaluare = 'Testul 1' and ANS1_data.Id_Disciplina = st_r.Id_Disciplina) as 'Testul 1 Year',
    (SELECT DISTINCT ANS2.Nota FROM studenti_reusita as ANS2 WHERE ANS2.Id_Student = st.Id_Student and ANS2.Tip_Evaluare = 'Testul 2' and ANS2.Id_Disciplina = st_r.Id_Disciplina) as Test2,
    (SELECT DISTINCT substring(CONVERT(VARCHAR(8), ANS2_data.Data_Evaluare), 0, 5)  FROM studenti_reusita as ANS2_data WHERE ANS2_data.Id_Student = st.Id_Student and ANS2_data.Tip_Evaluare = 'Testul 2' and ANS2_data.Id_Disciplina = st_r.Id_Disciplina) as 'Testul 2 Year',
    (SELECT DISTINCT ANS3.Nota FROM studenti_reusita as ANS3 WHERE ANS3.Id_Student = st.Id_Student and ANS3.Tip_Evaluare = 'Examen' and ANS3.Id_Disciplina = st_r.Id_Disciplina) as EXAMEN,
    (SELECT DISTINCT substring(CONVERT(VARCHAR(8), ANS3_data.Data_Evaluare), 0, 5)  FROM studenti_reusita as ANS3_data WHERE ANS3_data.Id_Student = st.Id_Student and ANS3_data.Tip_Evaluare = 'Examen' and ANS3_data.Id_Disciplina = st_r.Id_Disciplina) as 'Examen Year',
    (SELECT DISTINCT ANS4.Nota FROM studenti_reusita as ANS4 WHERE ANS4.Id_Student = st.Id_Student and ANS4.Tip_Evaluare LIKE 'Reusita%' and ANS4.Id_Disciplina = st_r.Id_Disciplina) as Final_Note,
    (SELECT DISTINCT substring(CONVERT(VARCHAR(8), ANS4_data.Data_Evaluare), 0, 5)  FROM studenti_reusita as ANS4_data WHERE ANS4_data.Id_Student = st.Id_Student and ANS4_data.Tip_Evaluare LIKE '%Reusita%' and ANS4_data.Id_Disciplina = st_r.Id_Disciplina) as 'Final note Year'
    FROM (studenti as st INNER JOIN studenti_reusita as st_r
    	ON st.Id_Student = st_r.Id_Student) INNER JOIN discipline as d
    		ON st_r.Id_Disciplina = d.Id_Disciplina
    WHERE Prenume_Student = 'Alex' and Tip_Evaluare LIKE 'Reusita%'
```

Code (II variant):

```javascript
    SELECT DISTINCT Nume_Student, Prenume_Student, Disciplina, Tip_Evaluare, Nota, substring(CONVERT(VARCHAR(8), Data_Evaluare), 0, 5) as Anul
    FROM (studenti as st INNER JOIN studenti_reusita as st_r
	    ON st.Id_Student = st_r.Id_Student) INNER JOIN discipline as d
		ON st_r.Id_Disciplina = d.Id_Disciplina
    WHERE Prenume_Student = 'Alex'
```

**13.** Code (I variant):

```javascript
    SELECT d.Disciplina
    ROM discipline as d
    WHERE d.Id_Disciplina IN
	    (SELECT st_r.Id_Disciplina
	    FROM studenti_reusita as st_r
	    WHERE st_r.Id_Student =
		    (SELECT st.Id_Student
		    FROM studenti as st
		    WHERE st.Nume_Student = 'Florea' and st.Prenume_Student = 'Ioan')
```

Code (II variant):
        
```javascript
    SELECT curr_st.Id_Student, d.Disciplina
    FROM studenti as curr_st, discipline as d
    WHERE curr_st.Nume_Student = 'Florea' and curr_st.Prenume_Student = 'Ioan'
    and curr_st.Id_Student IN 
		(SELECT st_r.Id_Student
		FROM studenti_reusita as st_r
		WHERE d.Id_Disciplina = st_r.Id_Disciplina)
```

**14.** Code (I variant):
```javascript
    SELECT st.Nume_Student, st.Prenume_Student, d.Disciplina
    FROM studenti as st, discipline as d
    WHERE st.Id_Student IN 
        (SELECT st_r.Id_Student
        FROM studenti_reusita as st_r
        WHERE st_r.Nota > 8 and st_r.Tip_Evaluare = 'Examen'
    	and d.Id_Disciplina = st_r.Id_Disciplina)
```
    
Code (II variant):
    
```javascript
    SELECT Nume_Student, Prenume_Student, Disciplina
    FROM (studenti as st INNER JOIN studenti_reusita as st_r
    	ON st.Id_Student = st_r.Id_Student) INNER JOIN discipline as d
    	ON d.Id_Disciplina = st_r.Id_Disciplina
    WHERE Nota > 8 and Tip_Evaluare = 'Examen'
```

**16.** Code (I variant):
```javascript
    SELECT d.Disciplina, st.Nume_Student, st.Prenume_Student, pr.Id_Profesor, pr.Nume_Profesor, pr.Prenume_Profesor 
    FROM discipline as d
    	CROSS JOIN 
    	studenti as st
    	CROSS JOIN 
    	profesori as pr
    WHERE d.Nr_ore_plan_disciplina < 60 and
    	EXISTS
    	(SELECT st_r.Id_Student
    	 FROM studenti_reusita as st_r
    	 WHERE st_r.Id_Disciplina = d.Id_Disciplina and 
    		st_r.Id_Student = st.Id_Student and
    			st_r.Id_Profesor = pr.Id_Profesor)
    ORDER BY pr.Id_Profesor ASC
```

Code (II variant):

```javascript
    SELECT DISTINCT Disciplina, Nume_Student, Prenume_Student, pr.Id_Profesor, Nume_Profesor, Prenume_Profesor
    FROM ((studenti as st INNER JOIN studenti_reusita as st_r
    	ON st.Id_Student = st_r.Id_Student) INNER JOIN discipline as d
    	ON st_r.Id_Disciplina = d.Id_Disciplina) INNER JOIN profesori as pr
    	ON st_r.Id_Profesor = pr.Id_Profesor
    WHERE Nr_ore_plan_disciplina < 60
    ORDER BY pr.Id_Profesor ASC
```

**17.** Code (I variant):
    
```javascript
    SELECT DISTINCT pr.Nume_Profesor, pr.Prenume_Profesor
    FROM profesori as pr
    	CROSS JOIN
    	studenti as st
    WHERE EXISTS
    	(SELECT st_r.Id_Disciplina
    	FROM studenti_reusita as st_r
    	WHERE st.Id_Student = 100
    		and pr.Id_Profesor = st_r.Id_Profesor
    		and st.Id_Student = st_r.Id_Student
    	)
```

Code (II variant):
    
```javascript
    SELECT DISTINCT Nume_Profesor, Prenume_Profesor
    FROM (profesori as pr INNER JOIN studenti_reusita as st_r
    	ON pr.Id_Profesor = st_r.Id_Profesor) INNER JOIN studenti as st
    	ON st_r.Id_Student = st.Id_Student
    WHERE st.Id_Student = 100
```

**18.** Code:
    
```javascript
    SELECT DISTINCT Nume_Profesor, Prenume_Profesor
    FROM profesori as p INNER JOIN studenti_reusita as st_r
    	ON p.Id_Profesor = st_r.Id_Profesor
    WHERE NOT EXISTS
    	(SELECT st_r1.Id_Profesor
    	FROM studenti_reusita as st_r1 INNER JOIN discipline as d
    		ON st_r1.Id_Disciplina = d.Id_Disciplina
    	WHERE st_r.Id_Disciplina = st_r1.Id_Disciplina and d.Nr_ore_plan_disciplina >= 60)
```

**19.** Code (I variant):
    
```javascript
    SELECT DISTINCT Nume_Profesor, Prenume_Profesor
    FROM profesori as pr INNER JOIN studenti_reusita as st_r
    	ON pr.Id_Profesor = st_r.Id_Profesor
    WHERE st_r.Nota < 5 and st_r.Id_Student IN
    	(SELECT st.Id_Student
    	FROM studenti as st
    	WHERE st.Nume_Student LIKE 'Cosovanu')
```
    
Code (II variant):
    
```javascript
    SELECT DISTINCT Nume_Profesor, Prenume_Profesor
    FROM (profesori as pr INNER JOIN studenti_reusita as st_r
    	ON pr.Id_Profesor = st_r.Id_Profesor) INNER JOIN studenti as st
    	ON st.Id_Student = st_r.Id_Student
    WHERE st.Nume_Student LIKE 'Cosovanu' and st_r.Nota < 5
```

**20.** Code (I variant):
    
```javascript
    SELECT COUNT(st_r.Id_Student) as Successfull
    FROM studenti_reusita as st_r
    WHERE st_r.Nota > 4 and st_r.Nota IS NOT NULL and st_r.Tip_Evaluare = 'Testul 2' and st_r.Data_Evaluare LIKE '%2017%' and st_r.Id_Disciplina IN
    	(SELECT d.Id_Disciplina
    	FROM discipline as d
    	WHERE d.Disciplina = 'Baze de date')
```
    
Code (II variant):
    
```javascript
    SELECT COUNT(Nota) as Successfull
    FROM discipline as d INNER JOIN studenti_reusita as st_r
    	ON d.Id_Disciplina = st_r.Id_Disciplina
    WHERE d.Disciplina = 'Baze de date' and st_r.Tip_Evaluare = 'Testul 2' and st_r.Nota > 4
```

**21.** Code:
```javascript
    SELECT Nume_Student, Prenume_Student, COUNT(Nota) as 'Numarul de note'
    FROM studenti as st INNER JOIN studenti_reusita as st_r
    	ON st.Id_Student = st_r.Id_Student
    GROUP BY Nume_Student, Prenume_Student
```
**22.** Code:
    
```javascript
    SELECT Nume_Profesor, Prenume_Profesor, COUNT(DISTINCT Id_Disciplina) as 'Nr. de Discipline'
    FROM profesori as p INNER JOIN studenti_reusita as st_r
    	ON p.Id_Profesor = st_r.Id_Profesor
    GROUP BY Nume_Profesor, Prenume_Profesor
```

**26.** Code:

```javascript
    SELECT st.Nume_Student as NUME, st.Prenume_Student as PRENUME, st.Adresa_Postala_Student as ADRESA, 'STUDENT' as WORK
    FROM studenti as st
    WHERE st.Adresa_Postala_Student LIKE '%31 August%'

    UNION

    SELECT pr.Nume_Profesor as NUME, pr.Prenume_Profesor as PRENUME, pr.Adresa_Postala_Profesor as ADRESA, 'PROFESOR' as WORK
    FROM profesori as pr
    WHERE pr.Adresa_Postala_Profesor LIKE '%31 August%'  -- LIKE '%44%'
```
