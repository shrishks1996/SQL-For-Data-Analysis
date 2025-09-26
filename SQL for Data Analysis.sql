--Command to use this particular database from the SQL Server after creation 
use E_Commerce;

--.csv file imported with the table name as zepto
select * from zepto;


--data exploration

--count of rows
select count(*) from zepto;

--sample data
SELECT TOP 10 * FROM zepto ORDER BY discountPercent;

--null values
SELECT * FROM zepto WHERE name IS NULL OR category IS NULL OR mrp IS NULL OR discountPercent IS NULL 
OR discountedSellingPrice IS NULL OR weightInGms IS NULL OR availableQuantity IS NULL OR outOfStock IS NULL OR quantity IS NULL;

--different product categories
SELECT DISTINCT category FROM zepto ORDER BY category;

--products in stock vs out of stock
SELECT outOfStock, COUNT(ID) as Total FROM zepto GROUP BY outOfStock;

--product names present multiple times
SELECT name, COUNT(ID) AS "Number of Items" FROM zepto GROUP BY name HAVING count(ID) > 1 ORDER BY count(ID) DESC;


--data cleaning

--products with price = 0
SELECT * FROM zepto WHERE mrp = 0 OR discountedSellingPrice = 0; 
DELETE FROM zepto WHERE mrp = 0;

--convert paise to rupees
UPDATE zepto
SET mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice / 100.0;

SELECT mrp, discountedSellingPrice FROM zepto;


--data analysis

--1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT Top 10 name, mrp, discountPercent FROM zepto ORDER BY discountPercent DESC;

--2.What are the Products with High MRP but Out of Stock
SELECT DISTINCT name,mrp FROM zepto WHERE outOfStock = 1 and mrp > 300 ORDER BY mrp DESC;

--3.Calculate Estimated Revenue for each category
SELECT category, SUM(discountedSellingPrice * availableQuantity) AS total_revenue FROM zepto GROUP BY category ORDER BY total_revenue;

--4. Find all products where MRP is greater than ?500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent FROM zepto WHERE mrp > 500 AND discountPercent < 10 ORDER BY mrp DESC, discountPercent DESC;

--5. Identify the top 5 categories offering the highest average discount percentage.
SELECT Top 10 category, ROUND(AVG(discountPercent),2) AS avg_discount FROM zepto GROUP BY category ORDER BY avg_discount DESC;

--6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice, ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto WHERE weightInGms >= 100 ORDER BY price_per_gram;

--7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;

--8.What is the Total Inventory Weight Per Category 
SELECT category, SUM(weightInGms * availableQuantity) AS total_weight FROM zepto GROUP BY category ORDER BY total_weight;




--For Zepto_Sep Database-

use E_Commerce;

select * from zepto_sep;

--Adding the ID column to be served as Primary Key.
ALTER TABLE zepto_sep
ADD ID INT IDENTITY(1,1) PRIMARY KEY;



--data exploration

--count of rows
select count(*) from zepto_sep;

--sample data
SELECT TOP 10 * FROM zepto_sep ORDER BY discountPercent;

--null values
SELECT * FROM zepto_sep WHERE name IS NULL OR category IS NULL OR mrp IS NULL OR discountPercent IS NULL 
OR discountedSellingPrice IS NULL OR weightInGms IS NULL OR availableQuantity IS NULL OR outOfStock IS NULL OR quantity IS NULL;

--different product categories
SELECT DISTINCT category FROM zepto_sep ORDER BY category;

--products in stock vs out of stock
SELECT outOfStock, COUNT(ID) as Total FROM zepto_sep GROUP BY outOfStock;

--product names present multiple times
SELECT name, COUNT(ID) AS "Number of Items" FROM zepto_sep GROUP BY name HAVING count(ID) > 1 ORDER BY count(ID) DESC;


--data cleaning

--products with price = 0
SELECT * FROM zepto WHERE mrp = 0 OR discountedSellingPrice = 0; 
DELETE FROM zepto_sep WHERE mrp = 0;

--convert paise to rupees
UPDATE zepto_sep
SET mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice / 100.0;

SELECT mrp, discountedSellingPrice FROM zepto_sep;


--data analysis

--1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT Top 10 name, mrp, discountPercent FROM zepto_sep ORDER BY discountPercent DESC;

--2.What are the Products with High MRP but Out of Stock
SELECT DISTINCT name,mrp FROM zepto_sep WHERE outOfStock = 1 and mrp > 300 ORDER BY mrp DESC;

--3.Calculate Estimated Revenue for each category
SELECT category, SUM(discountedSellingPrice * availableQuantity) AS total_revenue FROM zepto_sep GROUP BY category ORDER BY total_revenue;

--4. Find all products where MRP is greater than ?500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent FROM zepto_sep WHERE mrp > 500 AND discountPercent < 10 ORDER BY mrp DESC, discountPercent DESC;

--5. Identify the top 5 categories offering the highest average discount percentage.
SELECT Top 10 category, ROUND(AVG(discountPercent),2) AS avg_discount FROM zepto_sep GROUP BY category ORDER BY avg_discount DESC;

--6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice, ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto_sep WHERE weightInGms >= 100 ORDER BY price_per_gram;

--7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto_sep;

--8.What is the Total Inventory Weight Per Category 
SELECT category, SUM(weightInGms * availableQuantity) AS total_weight FROM zepto_sep GROUP BY category ORDER BY total_weight;



--Using Joins-


use E_Commerce;
select * from zepto;
select * from zepto_Sep

--Fetching the category, name, mrp and availability of the products from zepto and zepto_sep tables, which have the same category
select z.category, z.name, z.mrp, z.availableQuantity, zs.name, zs.mrp, zs.availableQuantity
From zepto as z INNER JOIN Zepto_Sep as zs
On z.category=zs.category
Order by z.category

--Fetching the category, name, mrp, availability of all the products from zepto table and the matching category items from the zepto_sep table.
select z.category, z.name, z.mrp, z.availableQuantity, zs.name, zs.mrp, zs.availableQuantity
From zepto as z LEFT JOIN Zepto_Sep as zs
On z.category=zs.category
Order by z.category

--Fetching the category, name, mrp, availability of all the products from zepto_Sep table and the matching category items from the zepto table.
select z.category, z.name, z.mrp, z.availableQuantity, zs.name, zs.mrp, zs.availableQuantity
From zepto as z RIGHT JOIN Zepto_Sep as zs
On z.category=zs.category
Order by z.category

--Fetching the category, name, mrp, availability of all the products from zepto table and from the zepto_sep table. When the products have the same category in both the tables or when the other one has NULL data.
select z.category, z.name, z.mrp, z.availableQuantity, zs.name, zs.mrp, zs.availableQuantity
From zepto as z FULL OUTER JOIN Zepto_Sep as zs
On z.category=zs.category
Order by z.category



Subqueries-

use E_Commerce;

-- Fetching the 2nd highest mrp
Select max(mrp) from zepto where mrp<(Select max(mrp) from zepto)

-- Fetching the 2nd lowest selling price
Select min(discountedSellingPrice) from zepto where discountedSellingPrice>(Select min(discountedSellingPrice) from zepto)




Views-


-- Creting view to hold the item which are in abundance, i.e., whose quantity is above the average of all items
Create View Above_Par_Products AS
(
Select name, category, discountPercent, mrp, quantity from zepto
where quantity>(Select AVG(quantity) from zepto)
)

-- Creating view to have the heavy items, whose weight is more than the average of all items.
Create View Heavy_Products AS
(
Select name, category, mrp, quantity, weightInGms from zepto
where weightInGms>(Select AVG(weightInGms) from zepto)
)

--Using Views
Select Category, name, mrp from Heavy_Products where quantity>(select AVG(quantity) from zepto) order by mrp



--Creating Indices for bot the tables on primary keys of both the tables-

CREATE INDEX prime_index ON zepto (ID);
CREATE INDEX prime_index ON zepto_Sep (ID);