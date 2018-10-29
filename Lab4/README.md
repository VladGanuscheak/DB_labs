# Tasks

![Task part 1](Task1.png)

![Task part 2](Task2.png)

# Solutions

1. Code:
   ```javascript
    SELECT *
    FROM grupe as g
    ORDER BY g.Nume_Facultate ASC
   ```
2. Code:
    ```javascript
    SELECT *
    FROM discipline
    ORDER BY Nr_ore_plan_disciplina DESC
    ```
3. Code (I variant):
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
4. Code:
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
5. Code:
    ```javascript
    SELECT *
    FROM studenti
    WHERE Nume_Student LIKE '%u'
    ```
6. Code (I variant):
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
7. Code (I variant):
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
8. Code (I variant):
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
9. Code (I variant):
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
10. Code (I variant):
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
11. Code (I variant):
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
12. Code:
    ```javascript
    SELECT DISTINCT Nume_Student, Prenume_Student, Disciplina,
    (SELECT DISTINCT ANS1.Nota FROM studenti_reusita as ANS1 WHERE ANS1.Id_Student = st.Id_Student and ANS1.Tip_Evaluare = 'Testul 1' and ANS1.Id_Disciplina = st_r.Id_Disciplina) as Test1,
    (SELECT DISTINCT ANS2.Nota FROM studenti_reusita as ANS2 WHERE ANS2.Id_Student = st.Id_Student and ANS2.Tip_Evaluare = 'Testul 2' and ANS2.Id_Disciplina = st_r.Id_Disciplina) as Test2,
    (SELECT DISTINCT ANS3.Nota FROM studenti_reusita as ANS3 WHERE ANS3.Id_Student = st.Id_Student and ANS3.Tip_Evaluare = 'Examen' and ANS3.Id_Disciplina = st_r.Id_Disciplina) as EXAMEN,
    (SELECT DISTINCT ANS4.Nota FROM studenti_reusita as ANS4 WHERE ANS4.Id_Student = st.Id_Student and ANS4.Tip_Evaluare LIKE 'Reusita%' and ANS4.Id_Disciplina = st_r.Id_Disciplina) as Final_Note,
    substring(CONVERT(VARCHAR(8), Data_Evaluare), 0, 5) as Anul
    FROM (studenti as st INNER JOIN studenti_reusita as st_r
    	ON st.Id_Student = st_r.Id_Student) INNER JOIN discipline as d
    		ON st_r.Id_Disciplina = d.Id_Disciplina
    WHERE Prenume_Student = 'Alex' and Tip_Evaluare LIKE 'Reusita%'
    ```
