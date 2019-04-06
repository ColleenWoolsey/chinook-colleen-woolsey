-- 7 invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and 
-- Sale Agent name for all invoices and customers.

SELECT  i.InvoiceId,
c.FirstName AS CustFirstname,
c.LastName As CustLastname,
c.Country,
c.SupportRepId,
e.FirstName AS RepFirstname,
e.LastName AS RepLastname,
il.InvoiceLineId,
il.UnitPrice

FROM InvoiceLine il
LEFT JOIN Invoice i ON i.InvoiceId = il.InvoiceId
LEFT JOIN Customer c ON c.CustomerId = i.CustomerId
LEFT JOIN Employee e ON e.EmployeeId = c.SupportRepId

