-- SQL Library Project 2nd Part

-- Review information
	--select * from books
	--select * from branch
	--select * from employees
	--select * from issued_status
	--select * from members
	--select * from return_status
		-- Validate that all the information it's in place and we can continue with our analysis.

-- Task 1: Identify Members with Overdue Books
	--Write a query to identify members who have overdue books (assume a 30-day return period). 
	--Display the member's_id, member's name, book title, issue date, and days overdue.

-- Review with what are we working on and what tables do we need to use for this request.

select * from issued_status
select * from members
select * from books

-- We need: Member id, member name, Issued Book Name, issued date.

select 
	m.member_id, 
	m.member_name,
	b.book_title,
	iss.issued_date,
	rs.return_date,
	DATEdiff(DAY, iss.issued_date, GETDATE()) as over_due_days
from issued_status as iss
join members as m
	on m.member_id = iss.issued_member_id
join books as b
	on b.isbn = issued_book_isbn
left join return_status as rs
	on rs.issued_id = iss.issued_id
-- The tables that we need to solve the issue. 
where 
	return_date is null
	and DATEdiff(DAY, iss.issued_date, GETDATE()) > 30
	-- How to get all the books that the due date is longer than 30 days.
order by 1

--Task 2: Branch Performance Report
--Create a query that generates a performance report for each branch.
	--showing the number of books issued.
	--the number of books returned
	--and the total revenue generated from book rentals.


--Review what tables do we need to solve this question.
select * from branch -- The Branchs that exists
select * from issued_status -- The status of each request
select * from employees -- The employees for each branch
select * from books -- The Books that exists
select * from return_status -- All the returns done

-- We need to conect the information


SELECT 
	br.branch_id, 
	br.manager_id, 
	count(iss.issued_book_isbn) as Total_Books_Rented,
	count(rs.return_id) as Total_Returned, 
	sum(b.rental_price) as Total_revenue
into branch_report
	from 
		issued_status as iss
	join employees as e
		on e.emp_id = iss.issued_emp_id
	join branch as br
		on e.branch_id = br.branch_id
	left join return_status as rs -- We conect with a left join because there still books missing, we dont want to have nulls.
		on rs.issued_id = iss.issued_id
	join books as b
		on iss.issued_book_isbn = b.isbn
	group by br.branch_id, br.manager_id

select * from branch_report

-- Task 3: Create a table with CTAS.
	-- Use the CTAS to create a new table Active Members containing members who have issued at least one book in the last 6 months.

	--Review possible tables to use.

select * from members -- We have 12 members.
select * from issued_status -- There are 39 ID's

select 
	*
into Active_members
	from members as m
	join issued_status as iss
	on m.member_id = iss.issued_member_id
	where iss.issued_date between dateadd(month, -6,getdate()) and getdate()
select * from Active_members

-- Task 4: Find Employees with the most books processed.
	-- Write a Query to fin the top 3 employees who have processed the most books issues. 
	-- Display the information in the following format:
		-- Name. Number of books. Branch.

-- 1st step, review which tables do we need to use.

select * from employees
select * from issued_status

select 
	top 3 -- Returns only the top 3
	e.emp_name, 
	e.branch_id, 
	count(iss.issued_id) as Number_of_books
from employees as e
join issued_status as iss
on e.emp_id = iss.issued_emp_id
group by e.emp_name, e.branch_id
order by 3 desc -- So we can have the highest issuer employee.