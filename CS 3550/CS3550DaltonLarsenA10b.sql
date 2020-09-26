--1
SELECT pp.FirstName, pp.LastName, SUM(ssoh.SubTotal) AS Sales_Totals
FROM Person.Person pp
INNER JOIN HumanResources.Employee hre
ON pp.BusinessEntityID = hre.BusinessEntityID
INNER JOIN Sales.SalesPerson ssp
ON ssp.BusinessEntityID = hre.BusinessEntityID
INNER JOIN Sales.SalesOrderHeader ssoh
ON ssoh.SalesPersonID = ssp.BusinessEntityID
GROUP BY pp.FirstName, pp.LastName
ORDER BY pp.FirstName, pp.LastName;

--2
SELECT AVG(pp.StandardCost) AS Average_Standard_Cost
FROM Production.Product pp
INNER JOIN Production.ProductModel ppm
ON ppm.ProductModelID = pp.ProductModelID
INNER JOIN Production.ProductModelProductDescriptionCulture ppmpdc
ON ppmpdc.ProductModelID = ppm.ProductModelID
INNER JOIN Production.Culture pc
ON pc.CultureID = ppmpdc.CultureID
WHERE pc.[Name] = 'English';

--3
SELECT hd.[Name], COUNT(*) AS Num_Employees
FROM Person.Person pp
INNER JOIN HumanResources.Employee hre
ON pp.BusinessEntityID = hre.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory hredh
ON hredh.BusinessEntityID = hre.BusinessEntityID
INNER JOIN HumanResources.Department hd
ON hd.DepartmentID = hredh.DepartmentID
GROUP BY hd.[Name]
ORDER BY hd.[Name];

--4
SELECT hre.JobTitle, AVG(hreph.Rate) AS Avg_Rate
FROM HumanResources.Employee hre
INNER JOIN HumanResources.EmployeePayHistory hreph
ON hreph.BusinessEntityID = hre.BusinessEntityID
WHERE hre.JobTitle LIKE '%Production%'
GROUP BY hre.JobTitle;

--5
SELECT pa.PostalCode, COUNT(*) AS Num_Living
FROM Person.[Address] pa
INNER JOIN Person.BusinessEntityAddress pbea
ON pbea.AddressID = pa.AddressID
INNER JOIN Person.BusinessEntity pbe
ON pbe.BusinessEntityID = pbea.BusinessEntityID
INNER JOIN Person.Person pp
ON pp.BusinessEntityID = pbe.BusinessEntityID
GROUP BY pa.PostalCode
ORDER BY pa.PostalCode;

--6
SELECT pp.FirstName, pp.LastName, ssp.SalesYTD
FROM Person.Person pp
INNER JOIN HumanResources.Employee hre
ON hre.BusinessEntityID = pp.BusinessEntityID
INNER JOIN Sales.SalesPerson ssp
ON ssp.BusinessEntityID = hre.BusinessEntityID
WHERE ssp.SalesYTD IN(
SELECT MAX(SalesYTD)
FROM Sales.SalesPerson);

--7
SELECT pp.[Name], SUM(pwo.ScrappedQty)
FROM Production.Product pp
INNER JOIN Production.WorkOrder pwo
ON pwo.ProductID = pp.ProductID
WHERE pwo.ScrappedQty > 0
GROUP BY pp.[Name]
ORDER BY pp.[Name];

--8
SELECT psp.[Name], COUNT(*) AS Num_Living
FROM Person.StateProvince psp
INNER JOIN Sales.SalesTerritory sst
ON sst.TerritoryID = psp.TerritoryID
INNER JOIN Sales.SalesPerson ssp
ON ssp.TerritoryID = sst.TerritoryID
INNER JOIN HumanResources.Employee hre
ON hre.BusinessEntityID = ssp.BusinessEntityID
INNER JOIN Person.Person pp
ON pp.BusinessEntityID = hre.BusinessEntityID
GROUP BY(psp.[Name])
ORDER BY psp.[Name];

--9
SELECT COUNT(*) AS Num_Employees
FROM HumanResources.Employee hre
WHERE VacationHours > 70;

--10
SELECT COUNT(*) AS Num_Scrapped
FROM Production.[Location] pl
INNER JOIN Production.ProductInventory ppi
ON ppi.LocationID = pl.LocationID
INNER JOIN Production.Product pp
ON pp.ProductID = ppi.ProductID
INNER JOIN Production.WorkOrder pwo
ON pwo.ProductID = pp.ProductID
INNER JOIN Production.ScrapReason psr
ON psr.ScrapReasonID = pwo.ScrapReasonID
WHERE pl.[Name] = 'Frame Welding'
	AND psr.[Name] = 'Drill size too small';