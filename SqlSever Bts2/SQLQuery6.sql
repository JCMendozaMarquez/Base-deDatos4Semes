--Procedimientos 
--1 Realizar un procedimiento almacenado que devuelva los
--  clientes (Customers) según el país (Country).
CREATE PROCEDURE usp_Clientes_Pais_LIKE
 @Pais VARCHAR(20)
AS
SELECT CompanyName,ContactName,Country FROM
Customers WHERE Country LIKE @Pais+'%';
---Probar
EXECUTE usp_Clientes_Pais_LIKE 'P';

--- Solución B. usando = (igual)(exactamente igual)
CREATE PROCEDURE usp_Clientes_Pais_IGUAL
 @Pais VARCHAR(20)
AS
SELECT CompanyName,ContactName,Country FROM
Customers WHERE Country = @Pais;
---Probar
EXECUTE usp_Clientes_Pais_LIKE 'Austria';

-- 2 Crear un procedimiento que determine la cantidad de
-- clientes cuyo identificador (o sea el código) inicia con un
-- determinado carácter.CREATE PROCEDURE usp_Cantidad_Clientes
@ID varchar(10),
@Cantidad int output
AS
 SELECT @Cantidad = COUNT(*)
 FROM Customers
WHERE CustomerID LIKE @ID+'%';
GO;---Probar
declare @Cantidad int
Execute usp_Cantidad_Clientes 'A', @cantidad output
SELECT @Cantidad AS Cantidad;-- 3 Realizar un procedimiento que determine la cantidad de
-- registros que un cliente está en la tabla ORDERS.CREATE PROCEDURE usp_Clientes_ordenes
 @CustomerID VARCHAR(20),
 @Cantidad int output
AS
SELECT @Cantidad = COUNT(*) FROM Orders WHERE
CustomerID = @CustomerID;
---Probar
DECLARE @Cant int
EXECUTE usp_Clientes_ordenes 'ALFKI', @Cant output;
SELECT @Cant AS Cantidad
-- 4 Realizar un procedimiento que seleccione todos los
--   registros de tabla Productos y Categories a la vez.
CREATE PROCEDURE usp_Productos_Categorias
AS
SELECT c.CategoryName, c.Description, p.*
FROM Categories AS c, Products AS p
 WHERE c.CategoryID = p.CategoryID;
---Probar
EXECUTE usp_Pructos_Categorias;

-- 5 Realizar un procedimiento que seleccione todos los
-- productos que no corresponde a la categoría bebidas (1)
CREATE PROCEDURE usp_Productos_No_Bebidas_B
AS
SELECT c.CategoryName,p.* FROM Products AS p,
Categories AS c
 WHERE c.CategoryID = p.CategoryID AND
 c.CategoryName <> 'Beverages';
---Probar
EXECUTE usp_Pructos_No_Bebidas_B;
-- 6 Realizar un procedimiento que obtenga la cantidad de
--  registros que no corresponde a condimentos
CREATE
PROCEDURE usp_Cantidad_Productos_No_Condimentos
AS
DECLARE @Cantidad int
SELECT @Cantidad = COUNT(*) FROM Products
 WHERE CategoryID <> 2
RETURN @Cantidad;
---Probar
DECLARE @Cant int
EXECUTE
@Cant = usp_Cantidad_Pructos_No_Condimentos;
SELECT @Cant AS Cantidad

--7 Realizar un procedimiento que seleccionar todos los
--campos de los registros que no corresponden a
--categoría mariscos de la tabla productos.
CREATE PROCEDURE usp_Pructos_No_ID
@CategoryID int
AS
SELECT * FROM Products
 WHERE CategoryID <> @CategoryID
---Probar
EXECUTE usp_Pructos_No_ID 8;

--8 Realizar un procedimiento que seleccionar los campos
-- nombre del producto y precio (únicamente) de los
-- productos diferentes a cárnicos
CREATE PROCEDURE usp_Pructos_No_Carnicos
@CategoryID int
AS
SELECT ProductName,UnitPrice FROM Products 
WHERE CategoryID <> @CategoryID
---Probar
EXECUTE usp_Pructos_No_ID 6;

--9 Realizar un procedimiento que obtenga la cantidad de
-- productos granos y cereales.
CREATE PROCEDURE usp_Cantidad_Productos
@CategoryID int
AS
DECLARE @Cantidad int
SELECT @Cantidad = COUNT(*) FROM Products
 WHERE CategoryID = @CategoryID
RETURN @Cantidad;
---Probar
DECLARE @Cant int
EXECUTE @Cant = usp_Cantidad_Productos 5;
SELECT @Cant AS Cantidad
--10 Realizar un procedimiento que seleccionar los campos
-- nombre del producto y precio (únicamente) de los
-- quesos y productos cárnicos.
CREATE PROCEDURE usp_Productos_varios
AS
SELECT ProductName,UnitPrice FROM Products
 WHERE CategoryID in (4,5)
---Probar
EXECUTE usp_Productos_varios;

--11 Realizar un procedimiento que seleccionar los campos
-- nombre del producto, precio y stock (únicamente) de
-- las frutas secas y mariscos.CREATE PROCEDURE usp_Productos_varios_2
AS
SELECT ProductName,UnitPrice,UnitsInStock FROM
Products
 WHERE CategoryID in (7,8)
---Probar
EXECUTE usp_Productos_varios_2;

--12 Realizar un procedimiento que seleccione el promedio
--  de los precios de los confites.CREATE PROCEDURE usp_Productos_confites
AS
SELECT SUM(unitPrice)/COUNT(unitPrice) AS promedio
FROM Products WHERE CategoryID = 3;
---Probar
EXECUTE usp_Productos_confites;


--Funciones 
-- 1 Funcion escalar recibe un parametro de tipo flot y retorna el cubo del valor ingresado como parametro
CREATE FUNCTION dbo.Cubo( @fNumber float)
RETURNS float
AS
BEGIN
RETURN(@fNumber * @fNumber * @fNumber)
END

drop function dbo.Cubo
--Para ejecutar la función use los siguientes datos:
   select dbo.Cubo(4.0*12.9*13.8)

-- 2 Función escalar recibe un parámetro de tipo int y retorna  el factorial del  valor
--ingresado como parámetro, si el número ingresado en negativo regresa uno (1)

CREATE FUNCTION dbo.Factorial ( @Numero  int )
RETURNS INT
AS
BEGIN
DECLARE @i  int

IF @Numero <= 1
SET @i = 1
ELSE
SET @i = @Numero * dbo.Factorial(@Numero - 1 )
RETURN (@i)
END
--Ejecutar
Select dbo.Factorial(-5)

--3 Función escalar recibe tres  parámetros de tipo decimal y retorna  el volumen. 
CREATE FUNCTION dbo.Volume ( @Alto decimal(5,2),
@Largo decimal(5,2), @Ancho decimal(5,2) )
RETURNS decimal (15,4)
AS
BEGIN
RETURN (@Alto * @Largo * @Ancho)
END
--Ejecutar 
Select dbo.Volume(4, 5.6, 7.8)

--4 Realizar un procedimiento que seleccione todos los productos
-- que no corresponde a la categoria bebidas y dbes ingresar la categoria
CREATE PROCEDURE usp_Productos_NoBebidas_C
AS
SELECT c.CategoryName,p.* FROM Products AS p,
Categories AS c
 WHERE c.CategoryID <> p.CategoryID

 Drop procedure usp_Productos_NoBebidas_C
---Probar
EXECUTE usp_Pructos_NoBebidas_C;

--5 Realizar un procedimiento que seleccione el promedio
--  de los precios de los confites. ????CREATE PROCEDURE usp_Productos_confites
AS
SELECT SUM(unitPrice)/COUNT(unitPrice) AS promedio
FROM Products WHERE CategoryID = 3;
---Probar
EXECUTE usp_Productos_confites;