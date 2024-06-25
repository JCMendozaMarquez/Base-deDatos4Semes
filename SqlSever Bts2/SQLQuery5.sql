--Clientes y  pedidos   --1 
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM Orders
SELECT COUNT(*) FROM Customers, Orders
-- seleccion del número de venta, el código y nombre del cliente y la fecha de venta ---2
SELECT OrderID, C.CustomerID, CompanyName, OrderDate
FROM Customers C, Orders O
WHERE C.CustomerID = O.CustomerID
--este caso son con las tablas de empleados, clientes y ventas  ---3
SELECT OrderID, C.CustomerID, CompanyName, OrderDate
FROM Customers C, Orders O, Employees E
WHERE C.CustomerID = O.CustomerID AND O.EmployeeID = E.EmployeeID
--el mismo caso como el anterior pero ahora necesitamos que el cliente sea de España o el vendedor sea el número (5).--4
SELECT OrderID, C.CustomerID, CompanyName, OrderDate
FROM Customers C JOIN Orders O ON C.CustomerID = O.CustomerID JOIN Employees E ON O.EmployeeID = E.EmployeeID
WHERE C.Country = 'Spain' OR E.EmployeeID = 5
--

--1. Seleccionar los clientes que viven en el país de "usa"
  CREATE VIEW  costumers11 AS

 SELECT CustomerID, City  
  FROM Customers WHERE Country='USA'
  
  SELECT * FROM costumers11;

  --2. Seleccionar los proveedores que viven en la ciudad de "BERLIN"
    CREATE VIEW  proveedor22 AS

    SELECT SupplierID, CompanyName, Phone    
	FROM Suppliers    
	WHERE City='BERLIN' 

	  SELECT * FROM proveedor22 ;
--3. Seleccionar los empleados con código 3,5 y 8.
    CREATE VIEW  empleado33 AS

	SELECT EmployeeID, FirstName ,City      
	FROM Employees 
	WHERE EmployeeID in(3,5,8);

	SELECT * FROM empleado33 ;
--4. Seleccionar los productos que tienen stock mayor que cero y son del proveedor 1,3 y 5
 CREATE VIEW  product44 AS

	SELECT ProductID, ProductName,UnitsInStock      
	FROM Products 
	WHERE UnitsInStock>0 AND SupplierID IN(1,3,5)

	SELECT * FROM product44 ;
--5. Seleccionar los productos con precio mayor o igual a 20 y menor o igual a 90.
 CREATE VIEW  precio55 AS

	SELECT ProductID, ProductName,  UnitPrice    
	FROM Products 
	WHERE UnitPrice BETWEEN 20 AND 90

	SELECT * FROM precio55 ;
--6. Mostrar las órdenes de compra entre las fechas 01/01/1997 al 15/07/1997.
 CREATE VIEW  ordene66 AS

	set dateformat dmy       
	SELECT OrderID, EmployeeID,OrderDate , RequiredDate,      ShippedDate
	FROM Orders WHERE OrderDate BETWEEN '01/01/1997' AND '15/07/1997'

	SELECT * FROM ordene66 ;
--7. Mostrar las órdenes de compra hechas en el año 1997, que pertenecen a los empleados con códigos 1 ,3 ,4 ,8.
	set dateformat dmy      
CREATE VIEW  compras77 AS
	SELECT OrderID, OrderDate      
	FROM Orders WHERE (OrderDate BETWEEN '01/01/1997' AND '31/12/1997')  AND (EmployeeID IN (1,3,4,8))
SELECT * FROM compras77 ;

--8. Mostrar las ordenes hechas en el año 1996. 
CREATE VIEW  año88 AS
	 SELECT EmployeeID, OrderDate    
	 FROM Orders      WHERE YEAR(OrderDate)='1996' 
SELECT * FROM año88 ;
--9. Mostrar las ordenes hechas en el año 1997 ,del mes de abril
CREATE VIEW  abril99 AS
	 SELECT  EmployeeID, OrderDate     
	 FROM Orders WHERE YEAR(OrderDate)='1997' AND MONTH( OrderDate)='4'
SELECT * FROM abril99 ;
--10. Mostrar las ordenes hechas el primero de todos los meses, del año 1998
CREATE VIEW  meses101 AS
	 SELECT		EmployeeID, OrderDate ,ShippedDate      
	 FROM Orders WHERE DAY(OrderDate)= '1' AND YEAR(OrderDate)='1998'
SELECT * FROM meses101 ;
--11. Mostrar todos los clientes que no tienen fax. 
CREATE VIEW  clie111 AS
	 SELECT CompanyName ,ContactName , City       
	 FROM Customers WHERE Fax IS NULL 
SELECT * FROM clie111 ;
