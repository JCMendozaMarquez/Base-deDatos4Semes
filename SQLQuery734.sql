--Pract Aqt SiS

use Hospital_BD
----------1----------
SELECT*
from Dept

INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(50,'traumatologia','BOLIVIA22')

-----------2---------------
CREATE TABLE libros
(
	Cod_Libro    	INT				NOT NULL,
	Detalles		VARCHAR(50)		NULL,	
)	
GO
INSERT INTO libros(Cod_Libro,Detalles) VALUES(10,'Sistema Nervioso')
INSERT INTO libros(Cod_Libro,Detalles) VALUES(20,'Sistema esquelético')
INSERT INTO libros(Cod_Libro,Detalles) VALUES(30,'Sistema endocrino')

select*
from libros
DELETE from libros WHERE Cod_Libro=20;

-----------3--------------
CREATE TABLE libros22
(
	Cod_Libro    	INT				NOT NULL,
	Detalles		VARCHAR(50)		NULL,	
	Prueba  		INT    	NULL,	
)	
GO

DROP TABLE libros22

select*
from libros22
INSERT INTO libros22(Cod_Libro,Detalles,Prueba) VALUES(10,'Sistema Nervioso',2)
INSERT INTO libros22(Cod_Libro,Detalles,Prueba) VALUES(20,'Sistema esquelético',3)
INSERT INTO libros22(Cod_Libro,Detalles,Prueba) VALUES(30,'Sistema endocrino',4)

UPDATE libros22
SET Prueba = 5
where Cod_Libro=20


---------4----------
select*
from Hospital
select*
from Doctor

SELECT * 
FROM [dbo].[Hospital] Ho
JOIN [dbo].[Doctor] Do
ON Ho.Hospital_Cod = Do.Hospital_Cod
 

