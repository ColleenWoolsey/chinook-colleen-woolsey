-- 1. non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) 
-- who are not in the US.
SELECT CustomerId, CONCAT(FirstName, ' ', LastName) AS FullName, Country
FROM Customer
WHERE Country NOT LIKE 'USA'

-- 2. brazil_customers.sql: Provide a query only showing the Customers from Brazil.
SELECT CustomerId, CONCAT(c.FirstName, ' ', c.LastName) AS FullName, c.CustomerId, c.Country 
FROM Customer c 
WHERE Country='Brazil';

-- 3. brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. 
-- The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT 
CONCAT(c.FirstName, ' ', c.LastName)AS FullName,
c.CustomerId,
c.Country,
i.InvoiceId,
i.InvoiceDate,
i.BillingCountry
FROM Customer c
LEFT JOIN Invoice i ON c.CustomerId = i.CustomerId
WHERE c.Country='Brazil';

-- 4. sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.
SELECT DISTINCT 
c.SupportRepId,
CONCAT(e.FirstName, ' ', e.LastName) AS FullName
FROM Customer c
LEFT JOIN Employee e ON c.SupportRepId = e.EmployeeId
