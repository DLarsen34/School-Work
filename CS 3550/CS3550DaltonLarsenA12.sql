--1. Display the name of the day, the average online order sales subtotal and average in-store order sales subtotal 
--for each day of the week (Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday). 
--You should have days of the week as headers across the top and Online vs In store down the side

SELECT 'Online Order' AS OrderType, [Sunday], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday]
FROM
(SELECT DATENAME(WEEKDAY, ssoh.OrderDate) AS Day, ssoh.SubTotal
FROM Sales.SalesOrderHeader ssoh
WHERE ssoh.OnlineOrderFlag = 1) AS PivotData
PIVOT
(
	AVG(SubTotal)
	FOR Day IN ([Sunday], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday])
) AS PivotTable
UNION
SELECT 'In Store Purchase' AS OrderType, [Sunday], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday]
FROM
(SELECT DATENAME(WEEKDAY, ssoh.OrderDate) AS Day, ssoh.SubTotal
FROM Sales.SalesOrderHeader ssoh
WHERE ssoh.OnlineOrderFlag = 0) AS PivotData
PIVOT
(
	AVG(SubTotal)
	FOR Day IN ([Sunday], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday])
) AS PivotTable
ORDER BY OrderType DESC;

--2. List each product category and the total number of units sold by month.
--You should have names of the months as headers across the top and product categories down the side

SELECT [Name] AS Category, [January], [February], [March], [April], [May], [June], [July], [August], [September], [October], [November], [December]
FROM
(SELECT ppc.[Name], DATENAME(mm, ssoh.OrderDate) AS Month, ssod.OrderQty
FROM Production.ProductCategory ppc
INNER JOIN Production.ProductSubcategory ppsc
ON ppsc.ProductCategoryID = ppc.ProductCategoryID
INNER JOIN Production.Product pp
ON pp.ProductSubcategoryID = ppsc.ProductSubcategoryID
INNER JOIN Sales.SpecialOfferProduct ssop
ON ssop.ProductID = pp.ProductID
INNER JOIN Sales.SalesOrderDetail ssod
ON ssod.SpecialOfferID = ssop.SpecialOfferID
AND ssod.ProductID = ssop.ProductID
INNER JOIN Sales.SalesOrderHeader ssoh
ON ssoh.SalesOrderID = ssod.SalesOrderID) AS PivotData
PIVOT
(
	SUM(OrderQty)
	FOR Month IN([January], [February], [March], [April], [May], [June], [July], [August], [September], [October], [November], [December])
) AS PivotTable
ORDER BY Category;

DECLARE @Columns1 NVARCHAR(MAX), @SQL1 NVARCHAR(MAX);
SET @Columns1 = N'';
SELECT @Columns1 += N', ' + QUOTENAME(t1.Month)
FROM
(SELECT DISTINCT DATENAME(mm, ssoh.OrderDate) AS Month
FROM Sales.SalesOrderHeader ssoh) t1;
SET @Columns1 = STUFF(@Columns1, 1, 2, '');

SET @SQL1 = N'SELECT [Name] AS Category, ' + @Columns1 + N'
FROM
(SELECT ppc.[Name], DATENAME(mm, ssoh.OrderDate) AS Month, ssod.OrderQty
FROM Production.ProductCategory ppc
INNER JOIN Production.ProductSubcategory ppsc
ON ppsc.ProductCategoryID = ppc.ProductCategoryID
INNER JOIN Production.Product pp
ON pp.ProductSubcategoryID = ppsc.ProductSubcategoryID
INNER JOIN Sales.SpecialOfferProduct ssop
ON ssop.ProductID = pp.ProductID
INNER JOIN Sales.SalesOrderDetail ssod
ON ssod.SpecialOfferID = ssop.SpecialOfferID
AND ssod.ProductID = ssop.ProductID
INNER JOIN Sales.SalesOrderHeader ssoh
ON ssoh.SalesOrderID = ssod.SalesOrderID) AS PivotData
PIVOT
(
	SUM(OrderQty)
	FOR Month IN('+ @Columns1 + N')
) AS PivotTable
ORDER BY Category;'
EXECUTE sp_executesql @SQL1;
