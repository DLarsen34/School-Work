SELECT t3.FirstName, t3.LastName, t3.TerritoryID, t3.SalesYTD, t3.TerritoryName
FROM
(SELECT pp.FirstName, pp.LastName, ISNULL(ssp.TerritoryID, 0) AS TerritoryID, ssp.SalesYTD, ISNULL(sst.[Name], 'N/A') AS TerritoryName
FROM Person.Person pp
INNER JOIN HumanResources.Employee e
ON e.BusinessEntityID = pp.BusinessEntityID
INNER JOIN Sales.SalesPerson ssp
ON ssp.BusinessEntityID = e.BusinessEntityID
LEFT OUTER JOIN Sales.SalesTerritory sst
ON sst.TerritoryID = ssp.TerritoryID) t3
INNER JOIN 
	(SELECT TerritoryName, MAX(SalesYTD) AS HighestSales
	FROM
		(SELECT pp.FirstName, pp.LastName, ISNULL(ssp.TerritoryID, 0) AS TerritoryID, ssp.SalesYTD, ISNULL(sst.[Name], 'N/A') AS TerritoryName
		FROM Person.Person pp
		INNER JOIN HumanResources.Employee e
		ON e.BusinessEntityID = pp.BusinessEntityID
		INNER JOIN Sales.SalesPerson ssp
		ON ssp.BusinessEntityID = e.BusinessEntityID
		LEFT OUTER JOIN Sales.SalesTerritory sst
		ON sst.TerritoryID = ssp.TerritoryID) t1
	GROUP BY TerritoryName)t2
ON t2.TerritoryName = t3.TerritoryName
AND t2.HighestSales = t3.SalesYTD
ORDER BY t3.TerritoryName;

SELECT 'db.Territory.save({'
+ '"firstName":"'+ pp.FirstName + '",'
+ '"lastName":"' + pp.LastName + '",'
+ '"territoryID":"' + CONVERT(VARCHAR(MAX),ISNULL(ssp.TerritoryID, 0)) + '",'
+ '"salesYTD":' + CONVERT(VARCHAR(MAX),ssp.SalesYTD) + ',' 
+ '"TerritoryName":"' + ISNULL(sst.[Name], 'N/A') + '"})'
FROM Person.Person pp
INNER JOIN HumanResources.Employee e
ON e.BusinessEntityID = pp.BusinessEntityID
INNER JOIN Sales.SalesPerson ssp
ON ssp.BusinessEntityID = e.BusinessEntityID
LEFT OUTER JOIN Sales.SalesTerritory sst
ON sst.TerritoryID = ssp.TerritoryID;