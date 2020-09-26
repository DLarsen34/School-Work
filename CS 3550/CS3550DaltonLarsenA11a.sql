--Dalton Larsen
--CS 3550 Dr. Drew Weidman

--1
SELECT pp.FirstName, pp.LastName, hre.Gender, DATEDIFF(YY, hre.BirthDate, GETDATE()) AS Age, hre.BirthDate, hre.JobTitle
FROM Person.Person pp
INNER JOIN HumanResources.Employee hre
ON hre.BusinessEntityID = pp.BusinessEntityID
WHERE DATEDIFF(YY, hre.BirthDate, GETDATE()) = (
SELECT MAX(DATEDIFF(YY, hre.BirthDate, GETDATE()))
FROM HumanResources.Employee hre);

--2
SELECT CAST((SELECT CAST(COUNT(*) AS decimal(5,2)) AS Male
FROM HumanResources.Employee hre
WHERE hre.Gender = 'M') /
(SELECT CAST(COUNT(*) AS decimal(4,2)) AS Female
FROM HumanResources.Employee hre
WHERE hre.Gender = 'F') as decimal(3,2)) AS Ratio;

--3
SELECT pp.[Name], pp.ProductID, SUM(ssod.OrderQty) AS Quantity
FROM Production.Product pp
INNER JOIN Sales.SpecialOfferProduct ssop 
ON ssop.ProductID = pp.ProductID
INNER JOIN Sales.SalesOrderDetail ssod
ON ssod.ProductID = ssop.ProductID
AND ssod.SpecialOfferID = ssop.SpecialOfferID
GROUP BY pp.[Name], pp.ProductID
HAVING SUM(ssod.OrderQty) IN
(SELECT MAX(t1.Quantity)
FROM
(SELECT pp.[Name], pp.ProductID, SUM(ssod.OrderQty) AS Quantity
FROM Production.Product pp
INNER JOIN Sales.SpecialOfferProduct ssop 
ON ssop.ProductID = pp.ProductID
INNER JOIN Sales.SalesOrderDetail ssod
ON ssod.ProductID = ssop.ProductID
AND ssod.SpecialOfferID = ssop.SpecialOfferID
GROUP BY pp.[Name], pp.ProductID)t1);

--4
SELECT psp.[Name]
FROM Person.StateProvince psp
INNER JOIN Person.[Address] pa
ON pa.StateProvinceID = psp.StateProvinceID
INNER JOIN Sales.SalesOrderHeader ssoh
ON ssoh.ShipToAddressID = pa.AddressID
WHERE ssoh.OnlineOrderFlag = '1'
GROUP BY psp.[Name]
HAVING COUNT(*) =
(SELECT MAX(t1.Quantity)
FROM
(SELECT psp.[Name], COUNT(*) Quantity
FROM Person.StateProvince psp
INNER JOIN Person.[Address] pa
ON pa.StateProvinceID = psp.StateProvinceID
INNER JOIN Sales.SalesOrderHeader ssoh
ON ssoh.ShipToAddressID = pa.AddressID
WHERE ssoh.OnlineOrderFlag = '1'
GROUP BY psp.[Name]) t1);

--5
SELECT pv.[Name], pv.CreditRating, pa.AddressLine1 +  ', ' + pa.City + ', ' + psp.[name] AS [Address]
FROM Purchasing.Vendor pv
INNER JOIN Person.BusinessEntity pbe
ON pbe.BusinessEntityID = pv.BusinessEntityID
INNER JOIN Person.BusinessEntityAddress pbea
ON pbea.BusinessEntityID = pv.BusinessEntityID
INNER JOIN Person.[Address] pa
ON pa.AddressID = pbea.AddressID
INNER JOIN Person.StateProvince psp
ON psp.StateProvinceID = pa.StateProvinceID
WHERE pv.CreditRating >3
ORDER BY pv.[Name];
