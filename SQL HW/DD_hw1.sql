USE AdventureWorks2019
GO
-- 1.	Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, with no filter.
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product
-- 2.	Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, exclude the rows that are 0 for the column ListPrice
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product
WHERE ListPrice <> 0
-- 3.	Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are rows that are NULL for the Color column.
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product
WHERE Color IS NULL
-- 4.	Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are not NULL for the Color column.
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product
WHERE Color IS NOT NULL
-- 5.	Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are not NULL for the column Color, and the column ListPrice has a value greater than zero.
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product
WHERE Color IS NOT NULL AND ListPrice > 0
-- 6.	Generate a report that concatenates the columns Name and Color from the Production.Product table by excluding the rows that are null for color.
SELECT Name + ' ' + Color AS [Name And Color]
FROM Production.Product
WHERE Color IS NOT NULL
-- 7.	Write a query that generates the following result set from Production.Product:
-- Name And Color
-- --------------------------------------------------
-- NAME: LL Crankarm  --  COLOR: Black
-- NAME: ML Crankarm  --  COLOR: Black
-- NAME: HL Crankarm  --  COLOR: Black
-- NAME: Chainring Bolts  --  COLOR: Silver
-- NAME: Chainring Nut  --  COLOR: Silver
-- NAME: Chainring  --  COLOR: Black
--     ………
SELECT 'NAME: ' + Name + '  --  COLOR: ' + ISNULL(Color, 'No Color') AS [Name And Color]
FROM Production.Product
-- 8.	Write a query to retrieve the columns ProductID and Name from the Production.Product table filtered by ProductID from 400 to 500
SELECT ProductID, Name
FROM Production.Product
WHERE ProductID BETWEEN 400 AND 500
-- 9.	Write a query to retrieve the columns  ProductID, Name and Color from the Production.Product table restricted to the colors black and blue
SELECT ProductID, Name, Color
FROM Production.Product
WHERE Color IN ('Black', 'Blue')
-- 10.	Write a query to generate a report on products that begins with the letter S. 
SELECT Name AS [Product Name]
FROM Production.Product
WHERE Name LIKE 'S%'
-- 11.	Write a query that retrieves the columns Name and ListPrice from the Production.Product table. Your result set should look something like the following. Order the result set by the Name column.
-- Name                                               ListPrice
-- -------------------------------------------------- -----------
-- Seat Lug                                           0,00
-- Seat Post                                          0,00
-- Seat Stays                                         0,00
-- Seat Tube                                          0,00
-- Short-Sleeve Classic Jersey, L                     53,99
-- Short-Sleeve Classic Jersey, M                     53,99
--                ………
SELECT Name, ListPrice
FROM Production.Product
ORDER BY Name
-- 12.	 Write a query that retrieves the columns Name and ListPrice from the Production.Product table. Your result set should look something like the following. Order the result set by the Name column. The products name should start with either 'A' or 'S'
-- Name                                               ListPrice
-- -------------------------------------------------- ----------
-- Adjustable Race                                    0,00
-- All-Purpose Bike Stand                             159,00
-- AWC Logo Cap                                       8,99
-- Seat Lug                                           0,00
-- Seat Post                                          0,00
--                ………
SELECT Name, ListPrice
FROM Production.Product
WHERE Name LIKE '[A, S]%'
ORDER BY Name
-- 13.	Write a query so you retrieve rows that have a Name that begins with the letters SPO, but is then not followed by the letter K. After this zero or more letters can exists. Order the result set by the Name column.
SELECT Name
FROM Production.Product
WHERE Name LIKE 'SPO[^K]%'
ORDER BY Name
-- 14.	Write a query that retrieves unique colors from the table Production.Product. Order the results in descending manner
SELECT DISTINCT Color
FROM Production.Product
ORDER BY Color DESC
-- 15.	Write a query that retrieves the unique combination of columns ProductSubcategoryID and Color from the Production.Product table. Format and sort so the result set accordingly to the following. We do not want any rows that are NULL in any of the two columns in the result.
-- INNER JOIN method
SELECT DISTINCT a.ProductSubcategoryID, a.Color
FROM Production.Product a JOIN Production.Product b ON a.ProductSubcategoryID = b.ProductSubcategoryID
WHERE a.Color IS NOT NULL
-- Simple method
SELECT DISTINCT ProductSubcategoryID, Color
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL AND Color IS NOT NULL
-- 16.      Something is “wrong” with the WHERE clause in the following query. 
-- We do not want any Red or Black products from any SubCategory than those with the value of 1 in column ProductSubCategoryID, unless they cost between 1000 and 2000.
-- Note: The LEFT() function will be covered in a forthcoming module.
-- This query shows the results that are restrict to red and black colors
SELECT ProductSubCategoryID
      , LEFT([Name],35) AS [Name]
      , Color, ListPrice 
FROM Production.Product
WHERE Color IN ('Red','Black') 
      AND ListPrice BETWEEN 1000 AND 2000 
      AND ProductSubCategoryID <> 1
UNION 
SELECT ProductSubCategoryID
      , LEFT([Name],35) AS [Name]
      , Color, ListPrice 
FROM Production.Product
WHERE Color IN ('Red','Black') 
      AND ProductSubCategoryID = 1
ORDER BY ProductSubCategoryID
-- This query shows the results that are not restrict to red and black colors
SELECT ProductSubcategoryID,
      LEFT([NAME],35) AS [NAME],
      color, ListPrice 
      FROM Production.Product
WHERE ListPrice BETWEEN 1000 AND 2000 OR ( ProductSubcategoryID = 1 AND Color IN ('Red','Black'))
ORDER BY ProductSubcategoryID