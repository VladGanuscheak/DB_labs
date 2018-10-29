#Tasks

![Task part 1](Task1.png)

![Task part 2](Task2.png)

#Solutions

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
    
