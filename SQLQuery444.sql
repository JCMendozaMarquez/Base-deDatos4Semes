--Pract Aqt SiS


use Northwind

select*
from Employees

Select DATEDIFF(YEAR,BirthDate,GETDATE())
-(CASE
   WHEN DATEADD(YY,DATEDIFF(YEAR,Employees.BirthDate,GETDATE()),Employees.BirthDate)>GETDATE() THEN
      1
   ELSE
      0 
   END) as Edad,LastName,FirstName
 from Employees

 ---- Ejemplos clase
 SELECT *
FROM Products
WHERE ProductName='Aniseed Syrup' AND (CategoryID = 2 OR UnitPrice =10.00)

SELECT *
FROM Products
ORDER BY UnitPrice ASC
---ejemplos----0111
SELECT *
FROM Products
ORDER BY UnitPrice desc

SELECT *
FROM Products
ORDER BY ProductID DESC

-----4
SELECT ProductID AS CategoryID , ProductName AS  ProductNameFirst
FROM products


-----5
SELECT *
FROM Region
-----6
SELECT *
FROM Region
ORDER BY RegionID ASC



---7
SELECT *
FROM Region
ORDER BY RegionID DESC
----8
SELECT ContactName, Phone
FROM Customers
ORDER BY CustomerID DESC



---9
SELECT ContactName, Phone, CompanyName AS OCU, Address AS DIR
FROM Customers
ORDER BY CustomerID ASC


---10
SELECT *
FROM Customers
WHERE PostalCode BETWEEN '05021' AND '12209'
ORDER BY CustomerID ASC

----11
SELECT *
FROM Customers
WHERE ContactName LIKE 'M%' AND ContactTitle like 'S%'


.----12--
SELECT *
FROM Territories
WHERE RegionID LIKE '%1' AND '%3'
--13
SELECT *
FROM Territories
WHERE RegionID LIKE '%1' AND LIKE '%3'
--14
select*
from Territories
where RegionID like '%1' or RegionID like '%3'
---15
---- malo
select*
from Territories
where RegionID=3 or RegionID=1 

-------------------Opcion4-------------
SELECT *
FROM Territories
WHERE TerritoryID LIKE '%1' OR TerritoryID LIKE '%3'





