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
ORDER BY InvoiceTotal - (PaymentTotal + CreditTotal) Desc

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
SELECT 'Publisher' as [Type]
FROM pubs.dbo.publishers
UNION
SELECT 'Vendor' as [Type]
FROM AP.dbo.Vendors