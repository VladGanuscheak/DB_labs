# Tasks

![Task part 1](Task1.png)

# Solutions

**1.** ![IMG_LAB6_TASK1](Images/Lab7_Task1.png)

**2.** ![IMG_LAB6_TASK3](Images/Lab7_Task2.png)

**3.** ![IMG_LAB6_TASK3](Images/Lab7_Task3.png)

**4.** ![IMG_LAB6_TASK4](Images/Lab7_Task4_A.png)
![IMG_LAB6_TASK4](Images/Lab7_Task4_B.png)

**5.** ![IMG_LAB6_TASK5](Images/Lab7_Task3.png)

**6.** [Code:](Scripts/Lab7_Task6.sql)
```SQL
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

```
![IMG_LAB6_TASK6](Images/Lab7_Task6.png)

**7.** [Code:](Scripts/Lab7_Task7.sql)
```SQL

```
![IMG_LAB6_TASK7](Images/Lab7_Task7.png)

**8.** [Code:](Scripts/Lab7_Task8.sql)
```SQL

```
![IMG_LAB6_TASK7](Images/Lab7_Task8.png)