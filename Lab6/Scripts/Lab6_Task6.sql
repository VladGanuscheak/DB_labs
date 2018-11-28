Use universitatea
Go

DROP TABLE orarul;

CREATE TABLE orarul (
	Id_Grupa INT,
	Id_Disciplina INT,
	Id_Profesor INT,
	Ora varchar(60) NOT NULL DEFAULT '08:00',
	Auditoriu INT NOT NULL DEFAULT 101,
	BLOCUL CHAR NOT NULL DEFAULT 'B',
	PRIMARY KEY (Id_Grupa, Id_Disciplina, Id_Profesor)
);

INSERT INTO orarul
VALUES  (1, 107, 101, '08:00', 202, 'B'),
		(1, 108, 101, '11:30', 501, 'B'),
		(1, 119, 117, '13:00', 501, 'B');