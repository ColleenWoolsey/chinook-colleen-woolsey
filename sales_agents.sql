-- sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.

SELECT DISTINCT 
c.SupportRepId,
e.FirstName,
e.LastName

FROM Customer c
LEFT JOIN Employee e ON c.SupportRepId = e.EmployeeId