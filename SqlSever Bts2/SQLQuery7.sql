use Northwind


-- trigger
create table HistorialEliminacion(
codigo int identity (1,1) primary key,
fecha date,
accion varchar(100),
usario varchar(100)
)
go

create table HistorialEliminacion222(
codigo varchar(100),
fecha date,
accion varchar(100),
usario varchar(100)
)
go

CREATE TRIGGER AutoGUARDADOeliminacion2 on  HistorialEliminacion222
AFTER INSERT
AS
alter table HistorialEliminacion222 
 select  (codigo,fecha,accion, usario)
 

 drop trigger AutoGUARDADOeliminacion2







CREATE TRIGGER AutoGUARDADOeliminacion
 ON  [dbo].[Customers] 
 AFTER update  as 
 delete from[dbo].[Customers]
 where  CustomerID='ALFKI'

BEGIN 
SET IDENTITY_INSERT  HistorialEliminacion on
  INSERT INTO HistorialEliminacion(codigo,fecha,accion, usario)
   VALUES (2,GETDATE(), 'Se elimino un cliente', 'AlFKI')
 SET IDENTITY_INSERT HistorialEliminacion  OFF  
  
END; 

drop trigger AutoGUARDADOeliminacion2

delete from [dbo].[Customers]
where CustomerID='WOLZA'
go


select CustomerID
from [dbo].[Customers]

SET IDENTITY_INSERT  HistorialEliminacion on
  INSERT INTO HistorialEliminacion(codigo,fecha,accion, usario)
   VALUES (1,GETDATE(), 'Se elimino un cliente', 'Maria Anders')
 SET IDENTITY_INSERT HistorialEliminacion  OFF   
 

delete from[dbo].[Customers]
  where  CustomerID='ALFKI'

  delete from[dbo].[HistorialEliminacion]
  where  usario='Maria Anders'

select*
from HistorialEliminacion222

--CustomerID	CompanyName	ContactName	ContactTitle	Address	City	Region	PostalCode	Country	Phone	Fax
--ALFKI	Alfreds Futterkiste	Maria Anders	Sales Representative	Obere Str. 57	Berlin	NULL	12209	Germany	030-0074321	030-0076545