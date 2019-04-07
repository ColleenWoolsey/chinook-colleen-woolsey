-- 1. non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) 
--    who are not in the US.
SELECT CustomerId, CONCAT(FirstName, ' ', LastName) AS FullName, Country
FROM Customer
WHERE Country NOT LIKE 'USA'

-- 2. brazil_customers.sql: Provide a query only showing the Customers from Brazil.
SELECT CustomerId, CONCAT(c.FirstName, ' ', c.LastName) AS FullName, c.CustomerId, c.Country 
FROM Customer c 
WHERE Country='Brazil';

-- 3. brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. 
--    The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
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

-- 5. unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing countries
--    from the Invoice table.
SELECT DISTINCT BillingCountry FROM Invoice

-- 6. sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. 
--    The resultant table should include the Sales Agent's full name.
SELECT c.SupportRepId, CONCAT(e.FirstName, ' ', e.LastName) AS SalesAgentName, 
i.InvoiceId
FROM Employee e
LEFT JOIN Customer c ON c.SupportRepId = e.EmployeeId
LEFT JOIN Invoice i ON c.CustomerId = i.CustomerId
WHERE Title LIKE 'Sales Support Agent'
ORDER BY SalesAgentName, i.InvoiceId

-- 7. invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and Sale
--    Agent name for all invoices and customers.
SELECT i.InvoiceId, i.BillingCountry, i.Total, 
CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, 
CONCAT(e.FirstName, ' ', e.LastName) AS SalesAgentName
FROM Invoice i
LEFT JOIN Customer c ON c.CustomerId = i.CustomerId
LEFT JOIN Employee e ON e.EmployeeId = c.SupportRepId

-- 8. total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?

SELECT COUNT(*) AS [2013] FROM Invoice i WHERE InvoiceDate LIKE '%2013%'

SELECT COUNT(*) AS [2009]
FROM Invoice i
WHERE InvoiceDate LIKE '%2009%'
SELECT COUNT(*) AS [2011]
FROM Invoice i
WHERE InvoiceDate LIKE '%2011%'

-- ?????? Combining into one

SELECT COUNT(*), InvoiceDate,
CASE
WHEN (InvoiceDate LIKE '%2009%') THEN '2009'
WHEN InvoiceDate LIKE '%2009%' THEN '2011'
END AS 'Totals'
FROM Invoice

-- 9. total_sales_{year}.sql: What are the respective total sales for each of those years?
SELECT COUNT(i.InvoiceId) AS [2009], SUM(i.Total) AS Total
FROM Invoice i
WHERE InvoiceDate LIKE '%2009%'
SELECT COUNT(i.InvoiceId) AS [2011], SUM(i.Total) AS Total
FROM Invoice i
WHERE InvoiceDate LIKE '%2011%'

-- 10. invoice_37_line_item_count.sql: Looking at the InvoiceLine table, provide a query that COUNTs 
--     the number of line items for Invoice ID 37.
SELECT COUNT(*)
FROM InvoiceLine
WHERE InvoiceId = 37

-- 11. line_items_per_invoice.sql: Looking at the InvoiceLine table, provide a query that COUNTs 
--     the number of line items for each Invoice. HINT: GROUP BY
SELECT InvoiceId, COUNT(*) AS CountLineItems
FROM InvoiceLine
GROUP BY InvoiceId

-- 12. line_item_track.sql: Provide a query that includes the purchased track name with each invoice line item.
SELECT il.InvoiceId,
	   il.InvoiceLineId,
	   t.[Name] AS TrackName
FROM InvoiceLine il
LEFT JOIN Track t ON t.TrackId = il.TrackId
ORDER BY il.InvoiceId

-- 13. line_item_track_artist.sql: Provide a query that includes the purchased track name AND 
--     artist name with each invoice line item.
SELECT il.InvoiceId, il.InvoiceLineId, t.Name AS TrackName, art.[Name] AS Artist, alb.[title] AS Album
FROM InvoiceLine il
LEFT JOIN Track t ON t.TrackId = il.TrackId
LEFT JOIN Album alb ON alb.AlbumId = t.AlbumId
LEFT JOIN Artist art on art.ArtistId = alb.ArtistId
ORDER BY il.InvoiceId


-- 14. country_invoices.sql: Provide a query that shows the # of invoices per country. HINT: GROUP BY
SELECT COUNT(*) AS Total, BillingCountry AS Country
FROM Invoice
GROUP BY BillingCountry


-- 15. playlists_track_count.sql: Provide a query that shows the total number of tracks in each playlist. 
--     The Playlist name should be include on the resulant table.
SELECT pl.PlaylistId, COUNT(plt.TrackId) AS TotalTracks
FROM Playlist pl
LEFT JOIN PlaylistTrack plt ON pl.PlaylistId = plt.PlayListId
GROUP BY pl.PlaylistId

-- 16. tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. 
--     The result should include the Album name, Media type and Genre.
SELECT t.[Name] AS Track, a.[Title] AS Album, m.[Name] AS MediaType, g.[Name] AS Genre
FROM Track t
INNER JOIN Album a ON a.AlbumId = t.AlbumId
INNER JOIN MediaType m ON m.MediaTypeId = t.MediaTypeId
INNER JOIN Genre g ON g.GenreId = t.GenreId

-- 17. invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.


-- 18. sales_agent_total_sales.sql: Provide a query that shows total sales made by each sales agent.


-- 19. top_2009_agent.sql: Which sales agent made the most in sales in 2009?
--     Hint: Use the MAX function on a subquery.


-- 20. top_agent.sql: Which sales agent made the most in sales over all?


-- 21. sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.


-- 22. sales_per_country.sql: Provide a query that shows the total sales per country.


-- 23. top_country.sql: Which country's customers spent the most?


-- 24. top_2013_track.sql: Provide a query that shows the most purchased track of 2013.


-- 25. top_5_tracks.sql: Provide a query that shows the top 5 most purchased songs.


-- 26. top_3_artists.sql: Provide a query that shows the top 3 best selling artists.


-- 27. top_media_type.sql: Provide a query that shows the most purchased Media Type.