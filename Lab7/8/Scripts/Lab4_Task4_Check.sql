Use universitatea
Go

SELECT d.Disciplina, LEN(d.Disciplina) as NameLength
FROM discipline as d
WHERE LEN(d.Disciplina) > 20