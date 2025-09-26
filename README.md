# SQL-For-Data-Analysis
This project contains the raw datasets and SQL queries which were operated on to gain insights from the raw datasets. SQL commands are from basic to intermediate levels including subqueries, joins and views along with the basic mathematical operations at various stages as required.
<br>Tools Used: SQL.
<br>Various SQL techniques like Count, Sum, Avg, Max, Min, Where clause, Group By, Having, Subqueries, Joins, Views have been used to analyse the dataset<br>
<br>Project Overview<br>
<br>The goal is to simulate how actual data analysts in the E-Commerce or retail industries work behind the scenes to use SQL to:
<br>Set up a messy, real-world E-Commerce inventory database.
<br>Perform Exploratory Data Analysis (EDA) to explore product categories, availability, and pricing inconsistencies.
<br>Implement Data Cleaning to handle null values, remove invalid entries, and convert pricing from paise to rupees.
<br>Write business-driven SQL queries to derive insights around **pricing, inventory, stock availability, revenue and more<br>
Each row represents a unique ID for a product. Duplicate product names exist because the same product may appear multiple times in different package sizes, weights, discounts, or categories to improve visibility – exactly how real catalog data looks.<br>
<br>Columns:<br>
<br>-ID: Unique identifier for each product entry (Synthetic Primary Key)
<br>-name: Product name as it appears on the app
<br>-category: Product category like Fruits, Snacks, Beverages, etc.
<br>-mrp: Maximum Retail Price (originally in paise, converted to Rs.)
<br>-discountPercent: Discount applied on MRP
<br>-discountedSellingPrice: Final price after discount (also converted to Rs.)
<br>-availableQuantity: Units available in inventory
<br>-weightInGms: Product weight in grams
<br>-outOfStock: Boolean flag indicating stock availability
<br>-quantity: Number of units per package (mixed with grams for loose produce)<br>
<br>Project Workflow<br>
<br>Here’s a step-by-step breakdown of what we do in this project:<br>
<br>1. Data Import<br>
<br>-Loaded CSV using SQL Server import feature.<br>
<br>2. Data Exploration<br>
<br>-Counted the total number of records in the dataset
<br>- Viewed a sample of the dataset to understand structure and content
<br>- Checked for null values across all columns
<br>- Identified distinct product categories available in the dataset
<br>- Compared in-stock vs out-of-stock product counts
<br>- Detected products present multiple times, representing different IDs<br>
<br>3. Data Cleaning<br>
<br>-Identified and removed rows where MRP or discounted selling price was zero
<br>-Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability<br>
<br>4. Business Insights<br>
<br>- Found top 10 best-value products based on discount percentage
<br>- Identified high-MRP products that are currently out of stock
<br>- Estimated potential revenue for each product category
<br>- Filtered expensive products (MRP > ₹500) with minimal discount
<br>- Ranked top 5 categories offering highest average discounts
<br>- Calculated price per gram to identify value-for-money products
<br>- Grouped products based on weight into Low, Medium, and Bulk categories
<br>- Measured total inventory weight per product category<br>
<br>5. Use of Views, Subqueries to further simplify as required<br>
<br>View is created for analysing the heavy products by wieght, having greater weights than all items' average.
<br>Subquery is used to find out the 2nd maximum product name as required within the dataset
<br><br>Regards,
<br>Shrish
