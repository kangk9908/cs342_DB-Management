-- Kun Kang (2301131)
-- for CS342 Database Management
-- Professor Patrick Bailey

--1
USE AP
GO

--2
SELECT *
FROM Vendors v INNER JOIN Invoices i
	ON v.VendorID = i.VendorID
WHERE VendorCity = 'New York'

--3
SELECT VendorName
		, InvoiceNumber
		, InvoiceDate
		, InvoiceTotal - (PaymentTotal + CreditTotal) 
			AS Balance 
FROM Vendors v JOIN Invoices i
	ON v.VendorID = i.VendorID
WHERE InvoiceTotal - (PaymentTotal + CreditTotal) > 0
ORDER BY Balance Desc

--4
	SELECT VendorName
			, VendorState
	FROM Vendors
	WHERE VendorState IN ('CA', 'NY')
UNION
	SELECT VendorName, 'Neither'
	FROM Vendors
	WHERE VendorState NOT IN ('CA', 'NY')
ORDER BY VendorName;

--5
USE pubs
GO

--6
SELECT *
FROM authors
WHERE LEFT(phone, 3) LIKE '801'

--7
SELECT au_fname
		, au_lname
		, title
FROM authors a 
		LEFT OUTER JOIN titleauthor ta
			ON a.au_id = ta.au_id
		LEFT OUTER JOIN titles t
			ON ta.title_id = t.title_id

--8
SELECT 'Publisher' AS [Type], pub_name AS [Name], state AS [State]
FROM pubs.dbo.publishers
UNION
SELECT 'Vendor' AS [Type], VendorName AS [Name], VendorState AS [State]
FROM AP.dbo.Vendors
ORDER BY State

--9
SELECT au_lname
		+ ', '
		+ au_fname AS [Author]
		, title AS [Title]
		, stor_name AS [Store Name]
		, st.state AS [Store State]
FROM authors a 
		LEFT OUTER JOIN titleauthor ta
			ON a.au_id = ta.au_id
		LEFT OUTER JOIN titles t
			ON ta.title_id = t.title_id
		LEFT OUTER JOIN sales sa
			ON t.title_id = sa.title_id
		LEFT OUTER JOIN stores st
			ON sa.stor_id = st.stor_id
ORDER BY Author, [Store Name]

--10
USE AdventureWorks2017
GO

--11
SELECT TOP 5 he.BusinessEntityID AS [Employee ID]
		, LoginID as [Employee Login ID]
		, rate AS [Pay Rate]
		, RateChangeDate AS [Pay Rate Change Date]
FROM HumanResources.Employee he
	JOIN HumanResources.EmployeePayHistory heph
		ON he.BusinessEntityID = heph.BusinessEntityID
ORDER BY rate DESC

--12
SELECT he.LoginID as [Employee Login ID]
FROM HumanResources.Employee he
JOIN Person.BusinessEntityAddress pbea
		ON he.BusinessEntityID = pbea.BusinessEntityID
LEFT JOIN Person.Address pa
		ON pbea.AddressID = pa.AddressID
WHERE pa.AddressLine1 IS NULL