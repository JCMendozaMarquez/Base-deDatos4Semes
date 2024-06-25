--Pract Aqt SiS



delete from Emp
--where Fecha_Alt=
go
drop table Emp
select*
from  Emp

--1.	Realizar un procedimiento almacenado que muestre todos los
-- empleados que tengan un salario mayor a 100000.
USE Hospital_BD
GO

create procedure almacenamientoM10
as
begin
(select*
from emp
where Salario>100000  )
end

drop procedure almacenamientoM10

Exec almacenamientoM10

--2.	Realizar un procedimiento almacenado que use el order by

create procedure  departamentoAgrup
as
SELECT *
FROM emp aS e , dept AS d
order by e.Dept_No, d.Dept_No 

--where Dept_No(order by )
drop procedure departamentoAgrup

Exec departamentoAgrup
--3.	Realizar una función que devuelva la cantidad de doctores según la especialidad del mismo.

--CREATE FUNCTION dbo.CantidadDoc( @fNumber varchar, @a varchar)
CREATE FUNCTION dbo.CantidadDoc(@Numero  varchar )
RETURNS varchar
AS
BEGIN
DECLARE @i  varchar
--(select Especialidad  from Doctor) 
if @i='Cardiologia'
SET @i = 2
else
SET @i = 1
RETURN (@i) 
END
drop function dbo.CantidadDoc
--Para ejecutar la función use los siguientes datos:
   select dbo.CantidadDoc('Urologia')


   --4.	Crear un Trigger que se active cuando Actualicemos alguna sala del hospital, 
   --    modificando sus tablas relacionadas. Mostrar el registro Actualizado. 
  


CREATE  TRIGGER ActualizaHosp
ON  Sala    
 for update  
 AS
 begin
 update Sala
 set  Sala_Cod=7,Hospital_Cod=19,Nombre='Cuidados Intensivos' , Num_Cama=4
 end
  
  select*
  from Sala

drop trigger ActualizaHosp