 
 --1. Seleccionar los clientes que viven en el país de "usa"
 SELECT *      
  FROM Customers WHERE Country='USA'
  --2. Seleccionar los proveedores que viven en la ciudad de "BERLIN"
    SELECT*     
	FROM Suppliers    
	WHERE City='BERLIN' 
--3. Seleccionar los empleados con código 3,5 y 8.
	SELECT *       
	FROM Employees 
	WHERE EmployeeID in(3,5,8);
--4. Seleccionar los productos que tienen stock mayor que cero y son del proveedor 1,3 y 5
	SELECT *      
	FROM Products 
	WHERE UnitsInStock>0 AND SupplierID IN(1,3,5)
--5. Seleccionar los productos con precio mayor o igual a 20 y menor o igual a 90.
	SELECT *      
	FROM Products 
	WHERE UnitPrice BETWEEN 20 AND 90
--6. Mostrar las órdenes de compra entre las fechas 01/01/1997 al 15/07/1997.
	set dateformat dmy       
	SELECT *      
	FROM Orders WHERE OrderDate BETWEEN '01/01/1997' AND '15/07/1997'

--7. Mostrar las órdenes de compra hechas en el año 1997, que pertenecen a los empleados con códigos 1 ,3 ,4 ,8.
	set dateformat dmy      
	SELECT *      
	FROM Orders WHERE (OrderDate BETWEEN '01/01/1997' AND '31/12/1997')  AND (EmployeeID IN (1,3,4,8))

--8. Mostrar las ordenes hechas en el año 1996. 
	 SELECT *    
	 FROM Orders      WHERE YEAR(OrderDate)='1996' 

--9. Mostrar las ordenes hechas en el año 1997 ,del mes de abril
	 SELECT *      
	 FROM Orders WHERE YEAR(OrderDate)='1997' AND MONTH( OrderDate)='4'

--10. Mostrar las ordenes hechas el primero de todos los meses, del año 1998
	 SELECT *       
	 FROM Orders WHERE DAY(OrderDate)= '1' AND YEAR(OrderDate)='1998'

--11. Mostrar todos los clientes que no tienen fax. 
	 SELECT *       
	 FROM Customers WHERE Fax IS NULL 

--12. Mostrar todos los clientes que tienen fax.
	 SELECT *      
	 FROM Customers WHERE Fax IS NOT NULL 

--13. Mostrar el nombre del producto, el precio, el stock y el nombre de la categoría a la que pertenece. 
	 SELECT ProductName,UnitPrice,UnitsInStock,CategoryName     
	 FROM Products       
	 INNER JOIN Categories ON Categories.CategoryID=Products.CategoryID

--14. Mostrar el nombre del producto, el precio producto, el código del proveedor y el nombre de  la compañía proveedora.
	 SELECT ProductName,UnitPrice,P.SupplierID,CompanyName     
	 FROM Products AS P       
	 INNER JOIN Suppliers AS S ON S.SupplierID=P.SupplierID

--15. Mostrar el número de orden, el código del producto, el precio, la cantidad y el total pagado por producto.
	 SELECT OrderID,ProductID,UnitPrice,Quantity, (UnitPrice*Quantity) AS TOTAL  FROM [Order Details]