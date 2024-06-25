 
 select*
 from Employees
 -- prueba
 /*
 CREATE VIEW view_name AS
SELECT column1, column2.....
FROM table_name
WHERE condition;
*/


 --1. Seleccionar los clientes que viven en el pa�s de "usa"
  CREATE VIEW  costumers1 AS

 SELECT *      
  FROM Customers WHERE Country='USA'
  
  SELECT * FROM costumers1;

  --2. Seleccionar los proveedores que viven en la ciudad de "BERLIN"
    CREATE VIEW  proveedor2 AS

    SELECT*     
	FROM Suppliers    
	WHERE City='BERLIN' 

	  SELECT * FROM proveedor2 ;
--3. Seleccionar los empleados con c�digo 3,5 y 8.
    CREATE VIEW  empleado3 AS

	SELECT *       
	FROM Employees 
	WHERE EmployeeID in(3,5,8);

	SELECT * FROM empleado3 ;
--4. Seleccionar los productos que tienen stock mayor que cero y son del proveedor 1,3 y 5
 CREATE VIEW  product4 AS

	SELECT *      
	FROM Products 
	WHERE UnitsInStock>0 AND SupplierID IN(1,3,5)

	SELECT * FROM product4 ;
--5. Seleccionar los productos con precio mayor o igual a 20 y menor o igual a 90.
 CREATE VIEW  precio5 AS

	SELECT *      
	FROM Products 
	WHERE UnitPrice BETWEEN 20 AND 90

	SELECT * FROM precio5 ;
--6. Mostrar las �rdenes de compra entre las fechas 01/01/1997 al 15/07/1997.
 CREATE VIEW  ordene6 AS

	set dateformat dmy       
	SELECT *      
	FROM Orders WHERE OrderDate BETWEEN '01/01/1997' AND '15/07/1997'

	SELECT * FROM ordene6 ;
--7. Mostrar las �rdenes de compra hechas en el a�o 1997, que pertenecen a los empleados con c�digos 1 ,3 ,4 ,8.
	set dateformat dmy      
CREATE VIEW  compras7 AS
	SELECT *      
	FROM Orders WHERE (OrderDate BETWEEN '01/01/1997' AND '31/12/1997')  AND (EmployeeID IN (1,3,4,8))
SELECT * FROM compras7 ;

--8. Mostrar las ordenes hechas en el a�o 1996. 
CREATE VIEW  a�o8 AS
	 SELECT *    
	 FROM Orders      WHERE YEAR(OrderDate)='1996' 
SELECT * FROM a�o8 ;
--9. Mostrar las ordenes hechas en el a�o 1997 ,del mes de abril
CREATE VIEW  abril9 AS
	 SELECT *      
	 FROM Orders WHERE YEAR(OrderDate)='1997' AND MONTH( OrderDate)='4'
SELECT * FROM abril9 ;



--10. Mostrar las ordenes hechas el primero de todos los meses, del a�o 1998
CREATE VIEW  meses10 AS
	 SELECT *       
	 FROM Orders WHERE DAY(OrderDate)= '1' AND YEAR(OrderDate)='1998'
SELECT * FROM meses10 ;
--11. Mostrar todos los clientes que no tienen fax. 
CREATE VIEW  clie11 AS
	 SELECT *       
	 FROM Customers WHERE Fax IS NULL 
SELECT * FROM clie11 ;
--12. Mostrar todos los clientes que tienen fax.
CREATE VIEW  fax12 AS
	 SELECT *      
	 FROM Customers WHERE Fax IS NOT NULL 
SELECT * FROM fax12 ;
--13. Mostrar el nombre del producto, el precio, el stock y el nombre de la categor�a a la que pertenece. 
CREATE VIEW  stok13 AS
	 SELECT ProductName,UnitPrice,UnitsInStock,CategoryName     
	 FROM Products       
	 INNER JOIN Categories ON Categories.CategoryID=Products.CategoryID
SELECT * FROM stok13 ;
--14. Mostrar el nombre del producto, el precio producto, el c�digo del proveedor y el nombre de  la compa��a proveedora.
CREATE VIEW  proveedo14 AS
	 SELECT ProductName,UnitPrice,P.SupplierID,CompanyName     
	 FROM Products AS P       
	 INNER JOIN Suppliers AS S ON S.SupplierID=P.SupplierID
SELECT * FROM proveedo14 ;
--15. Mostrar el n�mero de orden, el c�digo del producto, el precio, la cantidad y el total pagado por producto.
CREATE VIEW  cant15 AS
	 SELECT OrderID,ProductID,UnitPrice,Quantity, (UnitPrice*Quantity) AS TOTAL  FROM [Order Details]
SELECT * FROM cant15 ;