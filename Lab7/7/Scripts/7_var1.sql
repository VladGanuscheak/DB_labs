Use universitatea
Go

SELECT Cod_Grupa
    FROM grupe
    WHERE Id_Grupa IN 
    	(SELECT st_r.Id_Grupa
    	FROM studenti.studenti_reusita as st_r
    	WHERE st_r.Id_Student IN 
    		(SELECT st.Id_Student
    		FROM studenti.studenti as st
    		WHERE st.Adresa_Postala_Student LIKE '%31 August%')
    	)