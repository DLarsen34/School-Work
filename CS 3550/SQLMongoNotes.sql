SELECT cat.ProductCategoryID, cat.[Name] AS CategoryName, subcat.ProductSubcategoryID, subcat.[Name] AS SubcategoryName
FROM Production.ProductSubcategory subcat
INNER JOIN Production.ProductCategory cat
ON subcat.ProductCategoryID = cat.ProductCategoryID
FOR JSON AUTO, WITHOUT_Array_Wrapper;

SELECT c.ProductCategoryID, c.[Name] AS CategoryName, COUNT(*) AS NumSubCategories
FROM Production.ProductSubcategory s
INNER JOIN Production.ProductCategory c
ON s.ProductCategoryID = c.ProductCategoryID
GROUP BY c.ProductCategoryID, c.[Name];

SELECT 'db.subcategories.save({"catID":'
+ '"' + CONVERT(varchar(2), cat.ProductCategoryID)
+ '","catName":'
+ '"' + cat.Name + '",'
+ '"SubID"'
+ ':"' +CONVERT(varchar(2), subcat.ProductSubcategoryID)
+ '","SubName"'
+ ':"'+subcat.Name
+'"})'
FROM Production.ProductSubcategory subcat
INNER JOIN Production.ProductCategory cat
ON cat.ProductCategoryID = subcat.ProductCategoryID

db.subcategories.aggregate([{$group:{_id:{catID:"$catID",catName:"$catName"}, count:{$sum:1}}}, {$sort:{"count":-1}}])
db.subcategories.aggregate([{$group:{_id:"$catID", count:{$sum:1}}}, {$sort:{"count":-1}}])
db.subcategories.aggregate([{$group:{_id:"$catID", count:{$sum:1}}}, {$sort:{"count":1}}])
db.subcategories.aggregate([{$group:{_id:"$catID", count:{$sum:1}}}, {$sort:{"_id":1}}])