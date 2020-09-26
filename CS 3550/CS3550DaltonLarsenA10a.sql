--1
SELECT pp.FirstName, pp.LastName, pa.AddressLine1, pa.AddressLine2, pa.City, psp.[Name], pea.EmailAddress, ppp.PhoneNumber, ppnt.[Name] AS 'Phone Type'
FROM Person.Person pp
INNER JOIN Person.EmailAddress pea
ON pea.BusinessEntityID = pp.BusinessEntityID
INNER JOIN Person.PersonPhone ppp
ON ppp.BusinessEntityID = pp.BusinessEntityID
INNER JOIN Person.BusinessEntity pbe
ON pbe.BusinessEntityID = pp.BusinessEntityID
INNER JOIN Person.BusinessEntityAddress pbea
ON pbea.BusinessEntityID = pbe.BusinessEntityID
INNER JOIN Person.[Address] pa
ON pa.AddressID = pbea.AddressID
INNER JOIN Person.PhoneNumberType ppnt
ON ppnt.PhoneNumberTypeID = ppp.PhoneNumberTypeID
INNER JOIN Sales.Customer sc
ON pp.BusinessEntityID = sc.PersonID
INNER JOIN Sales.SalesTerritory sst
ON sst.TerritoryID = sc.TerritoryID
INNER JOIN Person.StateProvince psp
ON psp.TerritoryID = sst.TerritoryID
WHERE psp.[Name] = 'California'
ORDER BY pp.LastName, pp.FirstName;

--2
SELECT pp.FirstName, pp.LastName, hre.JobTitle, hre.BirthDate, hrs.[Name] AS 'Shift Name'
FROM Person.Person pp
INNER JOIN HumanResources.Employee hre
ON hre.BusinessEntityID = pp.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory hredh
ON hredh.BusinessEntityID = hre.BusinessEntityID
INNER JOIN HumanResources.[Shift] hrs
ON hrs.ShiftID = hredh.ShiftID
ORDER BY pp.LastName, pp.FirstName;

--3
SELECT pv.[Name] AS 'Vendor Name', pp.[Name] AS 'Product Name'
FROM Purchasing.Vendor pv
INNER JOIN Purchasing.ProductVendor ppv
ON ppv.BusinessEntityID = pv.BusinessEntityID
INNER JOIN Production.Product pp
ON pp.ProductID = ppv.ProductID
ORDER BY pv.[Name], pp.[Name];

--4
SELECT pp.[Name] AS 'Product Name', pp.StandardCost, pp.ListPrice, ppi.Shelf, ppi.Bin, ppi.Quantity, pl.[Name] AS 'Location Name'
FROM Production.Product pp
INNER JOIN Production.ProductInventory ppi
ON ppi.ProductID = pp.ProductID
INNER JOIN Production.Location pl
ON pl.LocationID = ppi.LocationID;

--5
SELECT pp.[Name] AS 'Product Name', psr.[Name] AS 'Scrapped Reason'
FROM Production.Product pp
INNER JOIN Production.WorkOrder pwo
ON pwo.ProductID = pp.ProductID
INNER JOIN Production.ScrapReason psr
ON psr.ScrapReasonID = pwo.ScrapReasonID
ORDER BY pp.[Name], psr.[Name];

--6
SELECT pv.[Name] AS 'Vendor Name', ppoh.[Status], ppoh.ShipDate, ppod.OrderQty, ppod.ReceivedQty, ppod.RejectedQty, pp.[Name] AS 'Product Name'
FROM Purchasing.Vendor pv
INNER JOIN Purchasing.PurchaseOrderHeader ppoh
ON ppoh.VendorID = pv.BusinessEntityID
INNER JOIN Purchasing.PurchaseOrderDetail ppod
ON ppod.PurchaseOrderID = ppoh.PurchaseOrderID
INNER JOIN Production.Product pp
ON pp.ProductID = ppod.ProductID
ORDER BY pv.[Name], pp.[Name];

--7
SELECT pp.[Name] AS 'Product Name', pps.[Name] AS 'Subcategory Name', ppc.[Name] AS 'Category Name', ppm.[Name] AS 'Product Model Name', ppm.CatalogDescription, ppd.[Description]
FROM Production.Product pp
INNER JOIN Production.ProductSubcategory pps
ON pps.ProductSubcategoryID = pp.ProductSubcategoryID
INNER JOIN Production.ProductCategory ppc
ON ppc.ProductCategoryID = pps.ProductCategoryID
INNER JOIN Production.ProductModel ppm
ON pp.ProductModelID = ppm.ProductModelID
INNER JOIN Production.ProductModelProductDescriptionCulture ppmpdc
ON ppmpdc.ProductModelID = ppm.ProductModelID
INNER JOIN Production.ProductDescription ppd
ON ppd.ProductDescriptionID = ppmpdc.ProductDescriptionID
ORDER BY pp.[Name], ppc.[Name], pps.[Name];

--8
SELECT pp.[Name] AS 'Product Name', ssod.OrderQty, ssoh.OrderDate, ssoh.DueDate, ssoh.OnlineOrderFlag
FROM Production.Product pp
INNER JOIN Sales.SpecialOfferProduct ssop
ON ssop.ProductID = pp. ProductID
INNER JOIN Sales.SalesOrderDetail ssod
ON ssod.ProductID = ssop.ProductID
INNER JOIN Sales.SalesOrderHeader ssoh
ON ssoh.SalesOrderID = ssod.SalesOrderID;


--9
SELECT DISTINCT pp.FirstName, pp.LastName
FROM Person.Person pp
INNER JOIN HumanResources.Employee hre
ON hre.BusinessEntityID = pp.BusinessEntityID
INNER JOIN Sales.SalesPerson ssp
ON ssp.BusinessEntityID = hre.BusinessEntityID
INNER JOIN Sales.SalesOrderHeader ssoh
ON ssoh.SalesPersonID = ssp.BusinessEntityID
WHERE MONTH(ssoh.OrderDate) = 10
ORDER BY pp.FirstName, pp.LastName;

--10
SELECT DISTINCT pp.FirstName, pp.LastName, sst.[Name] AS 'Territory Name', ssp.SalesYTD, ssp.Bonus, ssp.CommissionPct, ssp.SalesLastYear
FROM Person.Person pp
INNER JOIN HumanResources.Employee hre
ON hre.BusinessEntityID = pp.BusinessEntityID
INNER JOIN Sales.SalesPerson ssp
ON ssp.BusinessEntityID = hre.BusinessEntityID
INNER JOIN Sales.SalesOrderHeader ssoh
ON ssoh.SalesPersonID = ssp.BusinessEntityID
INNER JOIN Sales.SalesTerritory sst
ON sst.TerritoryID = ssoh.TerritoryID
ORDER BY sst.[Name], pp.LastName, pp.FirstName;






