Use universitatea
Go

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