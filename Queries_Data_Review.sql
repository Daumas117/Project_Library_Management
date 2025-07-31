-- CRUD Operations
---- Create:This operation adds new data records to a database or data store. For example, in a database table, a new row is added. 
---- Read:This operation retrieves or reads existing data from a database or data store. This is often done through queries or searches. 
---- Update:This operation modifies existing data records in a database or data store. For example, changing a user's email address in a database. 
---- Delete:This operation removes data records from a database or data store. For example, deleting a user record from a database. 

-- Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

Insert into books (isbn, book_title, category, rental_price, status, author, publisher)
values ('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')
select * from books -- Value added succesfully.

-- Task 2: Update an Existing Member's Address Member_id = C103 - New Address '125 Oak st'

select *
from members
where member_id = 'C103'
-- Current address 789 Oak ST

update members
set member_address = '125 Oak st'
where member_id = 'C103'

select *
from members
where member_id = 'C103'

-- New Address Updated.

-- Task 3: Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.
select *
from issued_status
where issued_id = 'IS121'

-- Issued Book Name The Shining

delete from issued_status
where issued_id = 'IS121'

select *
from issued_status
where issued_id = 'IS121'

-- Id deleted

-- Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.

select *
from issued_status
where issued_emp_id = 'E101'

--Moby Dick and To Kill a Mochingbird.

-- Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.

select issued_emp_id, count(*) as NumberOfBooksIssued
from issued_status
group by issued_emp_id
having COUNT(*) > 1

-- E101, E102, E104, E105 ... E110

--Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**

select
	b.isbn, 
	b.book_title, 
	COUNT(ist.issued_id) as  issued_count
into book_issue_summary
from issued_status as ist
left join books as b
on ist.issued_book_isbn = b.isbn
group by b.isbn, b.book_title

select *
from book_issue_summary

-- Task 7. Retrieve All Books in a Specific Category:

select category, book_title,author, rental_price
from books
where category = 'Classic'

-- Task 8: Find Total Rental Income by Category

select b.category, count(*) as BooksIssued, sum(b.rental_price) as TotalAmount
from issued_status as ist 
left join books as b
on b.isbn = ist.issued_book_isbn
group by b.category

-- Task 9: List Employees with their branch Manager's name and their branch detail.

select 
	e.emp_id,
	e.emp_name,
	e.position,
	e.salary,
	b.*,
	e1.emp_name as manager
from employees as e
left join branch as b
	on e.branch_id = b.branch_id
join 
employees as e1
	on e1.emp_id = b.manager_id


-- Task 10: Create a table of books with rental price above certain Threshold.

select *
into Expensive_books
from books
where rental_price > 5

select *
from Expensive_books

-- Task 11: Retrive the list of books not yet returned.

select *
from issued_status as i
left join return_status as r
on r.return_id = i.issued_id
where r.return_id is null