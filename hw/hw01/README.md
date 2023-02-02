# cs342 hw01 for Kun Kang (2301131)

 Points: 10
To start, create a flat text file with Notepad.  Name it singletable.sql.   For each problem, note the problem number with the appropriate commenting notation for SQL Server Management Studio.  Then, beneath that copy/paste in the query that solves the problem.   Queries should separate column names, table names and portions of where clauses on separate lines.  An example of how a query should be composed appears below (Note the commenting for the problem number and the use of GO to mark the end of the query):
--2
Select VendorName
	,VendorCity
	,VendorState
FROM Vendors
GO
1.	Switch context to use the AP database.  
2.	From Chapter 3 Exercises, modify Problem 1 as follows: Keep all of it and add the following: Add the state and the city as part of the projection and also to the beginning of the sort list.
3.	From Chapter 3 Exercises, modify Problem 3 as follows: Limit the query to show only those vendors in Ohio
4.	From Chapter 3 Exercises, modify Problem 4 – Change the 10% to 25%
5.	From Chapter 3 Exercises, modify Problem 6 – Instead of the start letters listed, use A, D, E, and L.  Further write two possible solutions to the problem.
6.	Write a query for the Invoices table that will project all the columns of rows where the PaymentDate is not known and a PaymentTotal is something other than zero.
7.	Write a query that will list only those vendors that have Default Terms of 3.
8.	Make a copy of the previous query and modify it so that it will also limit that result to those with a Default Account number of at least 540 as a value.
9.	Write a query that will list only those vendors whose name has “Company” in it.
10.	Write a query that will show only unique combinations of Vendor States along with the first five characters of the phone number.  The results should look similar to the following:
 	
11.	Copy the query used for problem 10 and change it so that rows with Null values do not show up.
12.	Switch the database context to pubs 
13.	Using the titles table, write a query that will show the title name and year to date sales of the five books with the highest year to date sales.  Only the five books should show up.
14.	Using the titles table, write a query that will list the title name of the book and the total year to dates sales divided by the price.  The calculated column should be named “Sold”  The results will look similar to the following:
 
15.	Modify problem 14 so that only the three books with most sold show up.  You may not use a comparison operator in this problem.
16.	In a comment, explain why the following query might encounter a problem.  Assume there are no syntax errors, the column names are valid, the database context is correct etc.

SELECT empName
             , totalPayToDate / DATEDIFF(day, getdate(), hireDate) AS  "Pay Time Ratio"
FROM empRecord
