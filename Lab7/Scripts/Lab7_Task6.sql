Use universitatea
Go

-- plan_studii SCHEMA
CREATE SCHEMA plan_studii
Go
ALTER SCHEMA plan_studii TRANSFER [dbo].[orarul]
Go
ALTER SCHEMA plan_studii TRANSFER [dbo].[discipline]
Go
-- cadre_didactice SCHEMA
CREATE SCHEMA cadre_didactice 
Go
ALTER SCHEMA cadre_didactice TRANSFER [dbo].[profesori]
Go
-- studenti SCHEMA
CREATE SCHEMA studenti
Go
ALTER SCHEMA studenti TRANSFER [dbo].[studenti]
Go
ALTER SCHEMA studenti TRANSFER [dbo].[studenti_reusita];
