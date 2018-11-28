Use universitatea
Go

UPDATE studenti_reusita
SET Nota = Nota + 1
WHERE Nota < 10 and Id_Student IN
	(SELECT g.Sef_grupa
	FROM grupe as g)