/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.name AS Product_Name, categories.name AS Category_Name
FROM bestbuy.products
INNER JOIN bestbuy.categories
ON products.categoryID = categories.categoryID
WHERE categories.CategoryID = '1';

SELECT p.name AS Product_Name, c.name AS Category_Name
FROM bestbuy.products p
INNER JOIN bestbuy.categories c
ON p.CategoryID = c.CategoryID
WHERE c.CategoryID = '1';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.name AS Product_Name, p.price AS Price, r.rating as Rating
FROM bestbuy.products p
INNER JOIN bestbuy.reviews r
ON p.ProductID = r.ProductID
WHERE r.Rating = '5';

 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName as First_Name, e.LastName AS Last_Name, SUM(s.Quantity) AS Quantity_Sold
FROM bestbuy.employees e
INNER JOIN bestbuy.sales s
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY SUM(s.Quantity) DESC;

-- How John did it during the review.  
SELECT e.EmployeeID, e.FirstName, e.LastName, SUM(s.Quantity) AS Total_Quantity_Sold
FROM bestbuy.employees e
INNER JOIN bestbuy.sales s
ON e.EmployeeID = s.EmployeeID
GROUP BY s.EmployeeID
ORDER BY Total_Quantity_Sold DESC;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT c.name AS Category_Name, d.name AS Department_Name
FROM bestbuy.categories c
INNER JOIN bestbuy.departments d
ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name ='Games';


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.name AS Product_Name, SUM(s.Quantity) AS Total_Sold, SUM(s.Quantity*S.PricePerUnit) AS Total_Price_Sold
FROM bestbuy.products p
INNER JOIN bestbuy.Sales s 
ON p.ProductID = s.ProductID
WHERE p.ProductID = '97';


/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.name AS Product_Name, r.reviewer AS Reviewer_Name, r.rating AS Rating, r.comment
FROM bestbuy.products p
INNER JOIN bestbuy.reviews r
ON p.ProductID = r.ProductID
WHERE p.name = 'Visio TV' 
ORDER BY r.rating
LIMIT 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name AS Product_Name, SUM(s.Quantity) AS Quanity_Sold
FROM bestbuy.sales s
INNER JOIN bestbuy.employees e
ON s.EmployeeID AND e.EmployeeID
INNER JOIN bestbuy.products p
ON s.ProductID AND p.ProductID
GROUP BY e.EmployeeID, p.Name
ORDER BY e.EmployeeID;

