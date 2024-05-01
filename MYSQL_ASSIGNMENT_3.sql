-- TASK 1 --
create database hmbank;
use hmbank;
create table Customers ( 
                       customer_id int primary key, first_name varchar(20),
                       last_name varchar(20), DOB date, email varchar(30),
                       phone_number int,address varchar(100));
                       
create table Accounts ( 
                      account_id int primary key, customer_id int,
                      foreign key(customer_id) references Customers(customer_id),
                      account_type varchar (20), balance decimal);
create table Transactions ( transaction_id int primary key, account_id int,
                       foreign key(account_id) references Accounts(account_id),
                       transaction_type varchar(20), amount int, 
                       transaction_date date);
                   
                   
                   

-- TASK 2 --
insert into Customers (customer_id, first_name, last_name, DOB, email, phone_number) VALUES
	  ( 101, 'Devi', 'Sri', '2002 -03- 24', 'devisri01@gmail.com',9876347930,'31, manoj nagar, chennai'),
      (102, 'Ram' , 'Kumar', '1999-12-28', 'ramkumar02@gmail.com', 9723647834, '81 C, Nagar, coimbatore'),
      (103,'James','William','2000-08-23','jameswilliam23@outlook.com',8635268736,'6 Jublee Street ,Bangalore'),
      (104, 'Anjali','Krishnan','2003-04-27','anjali34@gmail.com',8264958702,'ABC Nagar,chennai'),
      (105,'Jessica','Jasmine','2002-05-30','jessi23@gmail.com',9477438340, ' 23 ,vaigai street, Hyderabad'),
      (106,'Asifa','Nazar','1998-07-27', 'asifa43@outlook.com',8567324583,'ABC Nagar, Pune'),
      (107,'Jaanu','Ram','1996-09-18', 'jaanuram@gmail.com', 9357482920, 'Bharath street, Nagpur'),
      (108,'Casein','Nitrate','1996-09-28', 'casein267@outlook.com', 9876546789,'sidhh street, Kolkata'),
      (109, 'Harshu', 'Ravi', '2004-10-08', 'harshuravi@gmail.com', 8473284793, 'DEF nagar, New Delhi'),
      (110,'Vinu','Prabhu','2003-02-15','vinuprabhu10@gmail.com',8360999820, 'Shiro Street, Mumbai');
      
insert into Accounts(account_id, customer_id, account_type, balance) VALUES
	   ( 401, 101, 'savings' , 45000.00),
       ( 402, 103, 'current' , 50000.00),
       ( 403, 104, 'savings' , 5000.00),
       ( 404, 102, 'zero balance' , 00.00),
       ( 405, 105, 'savings' , 24000.00),
       ( 406, 106, 'current' , 8000.00),
       ( 407, 107, 'savings' , 12000.00),
       ( 408, 108, 'current' , 67800.00),
       ( 409, 109, 'savings' , 4000.00),
       ( 410, 110, 'current' , 5050.00);
       
INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date) VALUES
(501, 101, 'deposit', 1000.00, '2024-04-01'),
(502, 102, 'deposit', 2000.00, '2024-04-02'),
(503, 103, 'withdrawal', 500.00, '2024-04-03'),
(504, 104, 'deposit', 1000.00, '2024-04-04'),
(505, 105, 'withdrawal', 1000.00, '2024-04-05'),
(506, 106, 'deposit', 500.00, '2024-04-06'),
(507, 107, 'withdrawal', 1000.00, '2024-04-07'),
(508, 108, 'deposit', 1500.00, '2024-04-08'),
(509, 109, 'withdrawal', 800.00, '2024-04-09'),
(510, 110, 'deposit', 2000.00, '2024-04-10');

select c.first_name,c.last_name, a.account_type,c.email
from customers c
join accounts a on c.customer_id = a.customer_id;

Select c.first_name, c.last_name, t.transaction_id, t.transaction_type, t.amount, t.transaction_date
from Customers c
join Accounts a on c.customer_id = a.customer_id
join Transactions t on a.account_id = t.account_id;

update accounts
set balance= balance + 250
where account_id=106;

select concat(first_name, ' ', last_name) as full_name
from Customers;

delete from Accounts
where balance = 0 AND account_type = 'savings';

Select * from Customers
where city = 'chennai';

Select balance from Accounts
where account_id = 406;

select * from Accounts
where account_type = 'current' AND balance > 1000.00;

Select * from Transactions
where account_id = 407;

Select account_id, balance * 0.03 AS interest
from Accounts
where account_type = 'savings';

Select * from accounts
where balance < -500;

Select * from Customers
Where city <> 'chennai';


-- TASK 3--
 select avg(balance) from accounts;
 
 select * from accounts order by balance desc limit 10;
 
 select sum(amount) from transactions 
 where transaction_type = 'deposit' and transaction_date='2024 -04-07';
 
 select min(DOB) as old_customers, max(DOB) as new_customers 
 from customers;
 
 select t.*, a.account_Type from transactions t
 join accounts a on t.account_id = a.account_id;
 
select c.*, a.* from Customers c
join Accounts a on c.customer_id = a.customer_id;

select t.*, c.* from Transactions t
join Accounts a on t.account_id = a.account_id
join Customers c on a.customer_id = c.customer_id
where t.account_id = 102;

select customer_id, count(*) as num_accounts from Accounts
group by customer_id
having count(*) > 1;

select account_id, 
       sum(CASE WHEN transaction_type = 'deposit' THEN amount ELSE -amount END) AS transaction_difference
from Transactions
group by account_id;

select account_id, AVG(balance) from Transactions
where transaction_date BETWEEN 'start_date' AND 'end_date'
GROUP BY account_id;

Select  account_type, SUM(balance) AS total_balance
FROM Accounts
GROUP BY account_type;

SELECT account_id, COUNT(*) AS num_transactions
FROM Transactions
GROUP BY account_id
ORDER BY num_transactions DESC;

SELECT c.customer_id, c.first_name, c.last_name, a.account_type, SUM(a.balance) AS total_balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, a.account_type
ORDER BY total_balance DESC;

SELECT transaction_id, amount, transaction_date, account_id, COUNT(*) AS duplicate_count
FROM Transactions
GROUP BY amount, transaction_date, account_id
HAVING COUNT(*) > 1;





-- TASK 4 --
 select  * from Customers
where customer_id = (select customer_id from Accounts ORDER BY balance DESC LIMIT 1);

select avg(balance) from  Accounts
where customer_id in (select customer_id from Accounts group by customer_id having count(*) > 1);

select * from Accounts
where account_id in (select account_id from Transactions where amount > (select avg(amount) from transactions));

select * from Customers
where customer_id not in (select distinct customer_id from Transactions);

select SUM(balance) from Accounts
where account_id not in (select distinct account_id from Transactions);

select * from Transactions
where account_id = (select account_id from Accounts order by  balance asc limit 1);

select customer_id from Accounts
group by  customer_id
having count(DISTINCT account_type) > 1;

select account_type, count(*) * 100.0 / (select count(*) from Accounts) 
from Accounts
group by account_type;

select * from Transactions
where account_id in (select account_id from Accounts where customer_id = 108);

select account_type,(select sum(balance) from Accounts where account_type = a.account_type) 
from Accounts a
group by account_type;






















 
