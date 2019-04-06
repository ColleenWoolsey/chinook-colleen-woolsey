-- 6. sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. 
--    The resultant table should include the Sales Agent's full name.


SELECT DISTINCT 
c.SupportRepId,
e.FirstName,
e.LastName,

i.InvoiceId,
i.InvoiceDate,
i.BillingCity,
i.CustomerId

FROM Customer c
LEFT JOIN Employee e ON c.SupportRepId = e.EmployeeId
LEFT JOIN Invoice i ON c.CustomerId = i.CustomerId
ORDER BY c.SupportRepId, i.CustomerId, InvoiceId
 