use regex1;


CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    publication_year INT NOT NULL
);


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    book_id INT,
    customer_name VARCHAR(100) NOT NULL,
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);


INSERT INTO Books (book_id, title, author, genre, price, publication_year) VALUES
(1, 'The Silent Patient', 'Alex Michaelides', 'Thriller', 15.99, 2019),
(2, 'Where the Crawdads Sing', 'Delia Owens', 'Mystery', 18.99, 2018),
(3, 'Atomic Habits', 'James Clear', 'Self-help', 21.50, 2018),
(4, 'The Midnight Library', 'Matt Haig', 'Fiction', 17.25, 2020),
(5, 'Educated', 'Tara Westover', 'Memoir', 14.75, 2018),
(6, 'Becoming', 'Michelle Obama', 'Biography', 22.99, 2018),
(7, 'The Alchemist', 'Paulo Coelho', 'Fiction', 12.99, 1988);


INSERT INTO Orders (order_id, book_id, customer_name, order_date, quantity, total_price) VALUES
(101, 1, 'John Doe', '2023-01-15', 2, 31.98),
(102, 2, 'Jane Smith', '2023-02-10', 1, 18.99),
(103, 3, 'Alice Johnson', '2023-03-05', 3, 64.50),
(104, 4, 'David Brown', '2023-04-12', 1, 17.25),
(105, 1, 'Sophia Wilson', '2023-05-25', 4, 63.96),
(106, 6, 'Michael Lee', '2023-06-08', 2, 45.98),
(107, 3, 'Emma Davis', '2023-07-19', 1, 21.50),
(108, 5, 'Olivia Taylor', '2023-08-01', 2, 29.50),
(109, 7, 'Daniel Martinez', '2023-09-05', 3, 38.97),
(110, 2, 'Lucas White', '2023-10-20', 2, 37.98);

select * from Books;

select title, author from Books where price = (select max(price) from Books);

-- find out the cust name who have placed the most expensive order

select * from Orders where total_price = (select max(total_price) from Orders);

-- Find out the book name and year for the first book publish
select * from Books;

select title, publication_year from Books where publication_year = (select min(publication_year)
 from Books);
 
 INSERT INTO Books (book_id, title, author, genre, price, publication_year) VALUES
(8, 'Silent Killer', 'Alex Michaelides', 'comedy', 15.99, 2020);

 -- Findout books and the price for those that havee the same price as of atleast one other book
 
 select b.title, b.price from Books as b join Books as a
 where b.book_id != a.book_id and b.price = a.price; 
 
 -- or
 
 select title, price from Books where price = (select price from Books group by price having count(*)>1);
 
 -- Get those cust who have place same book as that of cust name as "John Doe"

select * from Orders;

select * from Orders where book_id in (select book_id from Orders where customer_name = 'John Doe');

INSERT INTO Orders (order_id, book_id, customer_name, order_date, quantity, total_price) VALUES
(111, 2, 'John Doe', '2023-01-15', 5, 50.25);

select * from Orders;

-- Find the books that have been ordered on multiple different date

select * from Orders where book_id in
(select book_id from Orders group by book_id having count(distinct order_date) > 1);

-- Find the book with the second highest price

select * from Books;

select * from Books where price = 
(select max(price) from Books where price != (select max(price) from Books) );

-- Find the book with the lowest quantity sold

select * from Orders;

select * from Orders where book_id = (
select book_id from Orders group by book_id order by sum(quantity) limit 1);

-- find all the books that were order by more than one customer

select * from Books where book_id in(
select book_id from Orders group by book_id having count(customer_name)>1);

-- Learning Assign 
-- Triggers and types of triggers in sql 