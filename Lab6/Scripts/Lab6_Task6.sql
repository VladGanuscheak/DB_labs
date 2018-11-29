Use universitatea
Go

DROP TABLE IF EXISTS orarul;

CREATE TABLE orarul (
	Id_Disciplina INT NOT NULL,
	Id_Profesor INT,
	Id_Grupa SMALLINT,
	Zi CHAR(2) DEFAULT('Mo'),
	Ora TIME DEFAULT('08:00'),
	Auditoriu INT DEFAULT('101'),
	Bloc CHAR(1) NOT NULL DEFAULT('B'),
	PRIMARY KEY (Id_Grupa, Zi, Ora, Auditoriu)
);

INSERT INTO orarul (Id_Grupa, Id_Disciplina, Id_Profesor, Ora, Auditoriu)
VALUES  (1, 107, 101, '08:00', 202),
		(1, 108, 101, '11:30', 501),
		(1, 119, 117, '13:00', 501);

		-- 7

	DECLARE @ID_INF171 SMALLINT = -1;

 SELECT @ID_INF171 = g.Id_Grupa
 FROM grupe as g
 WHERE g.Cod_Grupa = 'INF171';