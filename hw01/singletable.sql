-- Kun Kang (2301131)
-- for CS342 Database Management
-- Professor Patrick Bailey

--1
USE AP
GO

--2
SELECT VendorContactFName
		, VendorContactLName
		, VendorName
		, VendorState
		, VendorCity
FROM Vendors
ORDER BY VendorState
		, VendorCity
		, VendorContactLName
		, VendorContactFName

--3
SELECT VendorContactLName
		+ ', '
		+ VendorContactFName AS [Full Name]
FROM Vendors
WHERE VendorState = 'OH'
ORDER BY VendorContactLName
		, VendorContactFName

--4
SELECT InvoiceTotal
		, InvoiceTotal * 0.25 AS [25%]
		, InvoiceTotal * 1.25 AS [Plus 25%]
FROM Invoices
WHERE InvoiceTotal > 1000
ORDER BY InvoiceTotal DESC

--5
-- Solution 1
SELECT VendorContactLName
		+ ', '
		+ VendorContactFName AS [Full Name]
FROM Vendors
WHERE LEFT(VendorContactLName, 1) LIKE '[ADEL]%'
ORDER BY VendorContactLName
		, VendorContactFName

--Solution 2
SELECT VendorContactLName
		+ ', '
		+ VendorContactFName AS [Full Name]
FROM Vendors
WHERE SUBSTRING(VendorContactLName, 1, 1) LIKE '[ADEL]%'
ORDER BY VendorContactLName
		, VendorContactFName

-- Solution 3
SELECT VendorContactLName
		+ ', '
		+ VendorContactFName AS [Full Name]
FROM Vendors
WHERE VendorContactLName LIKE '[ADEL]%'
ORDER BY VendorContactLName
		, VendorContactFName

--6
SELECT *
FROM Invoices
WHERE PaymentDate IS NULL
		AND PaymentTotal <> 0

--7
SELECT *
FROM Vendors
WHERE DefaultTermsID = 3

--8
SELECT *
FROM Vendors
WHERE DefaultTermsID = 3
		AND DefaultAccountNo >= 540

--9
SELECT *
FROM Vendors
WHERE VendorName LIKE '%Company%'

--10
SELECT DISTINCT VendorState
		, LEFT(VendorPhone, 5) AS Prefix
FROM Vendors

--11
SELECT DISTINCT VendorState
		, LEFT(VendorPhone, 5) AS Prefix
FROM Vendors
WHERE LEFT(VendorPhone, 5) IS NOT NULL

--12
USE pubs
GO

--13
SELECT TOP 5 title
		, ytd_sales
FROM titles
ORDER BY ytd_sales DESC

--14
SELECT title
		, ytd_sales / price AS Sold
FROM titles

--15
SELECT TOP 3 title
		, ytd_sales / price AS Sold
FROM titles
ORDER BY ytd_sales DESC

--16
/*
	SELECT empName
			, totalPayToDate / DATEDIFF(day, getDate(), hireDate) AS "Pay Time Ratio"
	FROM empRecord
*/
/*
	The query above might encounter a problem because the "Pay Time Ratio" value
		would most likely always show as a negative number. This is because the
		DATEDIFF function provides the difference between given two dates, but
		the hireDate is always going to be in the past as the getDate() function
		is the current date. Because of this reason, the value in the end will
		almost always end up negative.
*/