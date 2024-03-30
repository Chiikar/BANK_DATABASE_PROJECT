--CREATE DATABASE FOR A BANKING AND FINANCE INDUSTRY 
CREATE DATABASE SparksBank_DB;

USE SparksBank_DB;


--Database Design and Normalization
--Creating Tables Customer Account, transaction, Loans, since it is a banking Database added an extra table which is for employees

-- Accounts Table
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
	account_number INT,
    account_name VARCHAR(100),
    account_type VARCHAR(50),
    balance DECIMAL(18, 2),
    opening_date DATE,
    CONSTRAINT chk_balance CHECK (balance >= 1000) -- Add constraints for data intergrity and security, Ensure balance is non-negative
);

SELECT *
FROM accounts;


-- Transactions Table
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT FOREIGN KEY REFERENCES accounts(account_id),
    transaction_type VARCHAR(50),
    amount DECIMAL(18, 2),
    transaction_date DATE,
	transanction_time TIME,
    CONSTRAINT chk_amount CHECK (amount > 1000) -- Add constraint for data integrity, Ensure amount is positive
);
 
SELECT *
FROM transactions;

-- Loans Table
CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
	account_id INT FOREIGN KEY REFERENCES accounts(account_id),
    loan_type VARCHAR(50),
    amount DECIMAL(18, 2),
    interest_rate DECIMAL(5, 2),
	Payment_schedule Varchar(50),
    installment_amount DECIMAL(18, 2),
    due_date DATE,
    remaining_balance DECIMAL(18, 2),
    loan_status VARCHAR(20), 
    CONSTRAINT chk_remaining_balance CHECK (remaining_balance >= 0) -- Ensure remaining_balance is non-negative
);

SELECT *
FROM loans;


--Employee table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    years_of_service INT,
    department VARCHAR(50)
);

SELECT *
FROM employees;


--Table Creation and Population
--Populate the table with values 

-- Populate accounts table 
INSERT INTO accounts (account_id,account_number,account_name,account_type,balance,opening_date)
VALUES
    ('1','1001','John Richard','Savings','100000.00','2020-01-01'),
    ('2','1002','Jane Smith','Current','10000.00','2019-05-15'),
    ('3','1003','Michael Jackson','Savings','7500.00','2021-03-10'),
    ('4','1004','Emily Brown','Current','15000.00','2018-11-20'),
    ('5','1005','David Wilson','Savings','3000.00','2022-07-05'),
    ('6','1006','Sarah Cheng','Savings','20000.00','2020-09-15'),
    ('7','1007','Robert Miller','Savings','6000.00','2019-02-28'),
    ('8','1008','Jessica Taylor','Current','18000.00','2023-01-10'),
    ('9','1009','Christopher Bradford','Savings','8500.00','2020-06-20'),
    ('10','1010','Amanda Mendes','Current','12000.00','2021-09-30'),
    ('11','1011','James Cranes','Savings','4000.00','2019-11-15'),
    ('12','1012','Jennifer Lopez','Current','22000.00','2022-04-25'),
    ('13','1013','William King','Savings','6800.00','2020-03-03'),
    ('14','1014','Stephanie Lewis','Current','14000.00','2023-07-12'),
    ('15','1015','Daniel Adams', 'Savings','2000.00','2021-01-20'),
    ('16','1016','Elizabeth Hall','Current','25000.00','2019-08-08'),
    ('17','1017','Joseph Wright','Savings','9000.00','2022-05-10'),
    ('18','1018','Mary Clark','Current','16000.00','2020-10-18'),
    ('19','1019','Andrew Mccall','Savings','5500.00','2019-04-22'),
    ('20','1020','Margaret Scott','Savings','19000.00','2023-03-28');
 
 	SELECT *
	FROM accounts;


-- Populate Transactions Table
INSERT INTO transactions (transaction_id, account_id, transaction_type, amount, transaction_date,transanction_time)
VALUES
(1,1, 'Deposit', 5000.00, '2024-03-01', '08:00:00'),
(2,2, 'Withdrawal', 2000.00, '2024-03-02', '10:30:00'),
(3,3, 'Deposit', 7000.00, '2024-03-03', '13:45:00'),
(4,4, 'Withdrawal', 1500.00, '2024-03-04', '11:20:00'),
(5,5, 'Deposit', 3000.00, '2024-03-05', '09:15:00'),
(6,6, 'Withdrawal', 2500.00, '2024-03-06', '14:00:00'),
(7,7, 'Deposit', 4000.00, '2024-03-07', '12:30:00'),
(8,8, 'Withdrawal', 3500.00, '2024-03-08', '10:45:00'),
(9,9, 'Deposit', 6000.00, '2024-03-09', '08:20:00'),
(10,1, 'Withdrawal', 18000.00, '2024-03-10', '15:10:00'),
(11,11, 'Deposit', 8000.00, '2024-03-11', '11:00:00'),
(12,1, 'Withdrawal', 5000.00, '2024-03-12', '09:40:00'),
(13,13, 'Deposit', 9000.00, '2024-03-13', '13:20:00'),
(14,14, 'Withdrawal', 1300.00, '2024-03-14', '10:55:00'),
(15,1, 'Deposit', 12000.00, '2024-03-15', '14:25:00'),
(16,15, 'Withdrawal', 3200.00, '2024-03-16', '09:05:00'),
(17,1, 'Deposit', 11000.00, '2024-03-17', '12:15:00'),
(18,16, 'Withdrawal', 2800.00, '2024-03-18', '13:35:00'),
(19,17, 'Deposit', 10000.00, '2024-03-19', '08:50:00'),
(20,20, 'Withdrawal', 2400.00, '2024-03-20', '10:00:00');

SELECT *
FROM transactions;



-- Populate loans table
INSERT INTO loans (loan_id, account_id, loan_type, amount, interest_rate, Payment_schedule, installment_amount, due_date, remaining_balance,loan_status)
VALUES
(1,1,'Personal Loan', 5000.00, 5.25, 'Monthly', 250.00, '2024-04-01', 5000.00, 'Completed'),
(2,2, 'Auto Loan',10000.00, 4.75, 'weekly', 350.00, '2024-04-15', 10000.00, 'Active'),
(3, 3, 'Home Loan',150000.00, 3.50, 'Monthly', 1200.00, '2024-05-01', 150000.00, 'Active'),
(4, 4, 'Education Loan',20000.00, 6.00,'Monthly', 400.00, '2024-04-10', 20000.00, 'Active'),
(5, 5, 'Business Loan',75000.00, 5.75, 'Monthly', 800.00, '2024-04-05', 75000.00, 'Active'),
(6, 6, 'Personal Loan', 8000.00, 4.25, 'weekly', 300.00, '2024-04-20', 8000.00, 'Active'),
(7, 7, 'Auto Loan', 12000.00, 3.75, 'Monthly', 450.00, '2024-04-25', 12000.00, 'Active'),
(8, 8, 'Home Loan', 180000.00, 4.00, 'weekly', 1300.00, '2024-05-05', 180000.00, 'Active'),
(9, 9, 'Education Loan', 25000.00, 5.50, 'Monthly', 500.00, '2024-04-30', 25000.00, 'Completed'),
(10,10, 'Business Loan', 100000.00, 6.25, 'Monthly', 1200.00, '2024-04-15', 100000.00, 'Active'),
(11,11, 'Personal Loan', 6000.00, 4.00, 'Monthly', 200.00, '2024-04-12', 6000.00, 'Completed'),
(12,12, 'Auto Loan', 15000.00, 5.00, 'weekly', 400.00, '2024-04-18', 15000.00, 'Active'),
(13,13, 'Home Loan', 200000.00, 4.50, 'Monthly', 1500.00, '2024-04-22', 200000.00, 'Active'),
(14,14, 'Education Loan', 30000.00, 6.50, 'Monthly', 600.00, '2024-04-08', 30000.00, 'Active'),
(15,15, 'Business Loan', 125000.00, 5.00, 'weekly', 1000.00, '2024-05-01', 125000.00, 'Active'),
(16,16, 'Personal Loan', 7000.00, 4.75, 'Monthly', 300.00, '2024-04-28', 7000.00, 'Active'),
(17,17, 'Auto Loan', 18000.00, 3.50, 'Monthly', 500.00, '2024-04-14', 18000.00, 'Active'),
(18,18, 'Home Loan', 220000.00, 4.25, 'weekly', 1600.00, '2024-04-30', 220000.00, 'Active'),
(19,19, 'Education Loan', 35000.00, 5.75, 'Monthly', 700.00, '2024-04-05', 35000.00, 'Active'),
(20,20, 'Business Loan', 150000.00, 6.00, 'Monthly', 1500.00, '2024-04-10', 150000.00, 'Active');

SELECT *
FROM loans;


 --Populate Employees Table
INSERT INTO employees (employee_id, employee_name, years_of_service, department)
VALUES
    ('1','Alice Johnson','12','Management'),
    ('2','Bob Smith','8','Operations'), 
	('3','Meredith Grey','6','Customer Care'),
	('4','Chika Chukwu','3','Marketing'),
	('5','Chidera Mbakwe','10','Credit Risk'),
	('6','Adeyemi Oyindamola','7','Relationship Management'),
	('7','Deborah Salawu','9','Compliance');


SELECT *
FROM employees;





--4. Generate financial reports such as balance sheets, income statements, and cash flow statements.
-- BALANCE SHEET

-- Total Assets(to check the total amount for all accounts)
SELECT SUM(balance) AS total_assets
FROM accounts;

-- Total Liabilities(to check the total liabilities, which is the total amount of active loans)
SELECT SUM(amount) AS total_liabilities
FROM loans
WHERE loan_status = 'active';

-- Total Equity () (We have more debt than assets) 
SELECT (SELECT SUM(balance) FROM accounts) - (SELECT SUM(amount) FROM loans) AS total_equity;


-- Balance Sheet (Shows a summary of our balance sheet report)
SELECT 
    (SELECT SUM(balance) FROM accounts) AS total_assets,
    (SELECT SUM(amount) FROM loans WHERE loan_status = 'active') AS total_liabilities,
	(SELECT SUM(balance) FROM accounts) - (SELECT SUM(amount) FROM loans) AS total_equity;



--INCOME STATEMENT

-- Total Revenue (Total deposit by customers)
SELECT SUM(amount) AS total_revenue
FROM transactions
WHERE transaction_type = 'Deposit';

-- Total Withdrawal (Total withdrawals by customers)
SELECT SUM(amount) AS total_withdrawal
FROM transactions
WHERE transaction_type = 'Withdrawal';

-- Income Statement (Summary of the income statement report)
SELECT 
    (SELECT SUM(amount) FROM transactions WHERE transaction_type = 'Deposit') AS total_revenue,
    (SELECT SUM(amount) FROM transactions WHERE transaction_type = 'Withdrawal') AS total_withdrawal;


--CASH FLOW STATEMENT

-- Cash Inflows (Deposit made into the bank)
SELECT SUM(amount) AS cash_inflows
FROM transactions
WHERE transaction_type = 'Deposit';

-- Cash Outflows (Withdrawal made out of the bank)
SELECT SUM(amount) AS cash_outflows
FROM transactions
WHERE transaction_type = 'Withdrawal';


-- Cash Flow Statement(Summary of Cashflow report)
SELECT 
    (SELECT SUM(amount) FROM transactions WHERE transaction_type = 'Deposit') AS cash_inflows,
    (SELECT SUM(amount) FROM transactions WHERE transaction_type = 'Withdrawal') AS cash_outflows;




--SELECTING DATA

--1.	Retrieve the account numbers and names of all account holders.
SELECT account_number, account_name FROM accounts;

--2.	Get the transaction IDs and amounts for all transactions.
SELECT transaction_id, amount FROM transactions;

--3.	Fetch the loan IDs and amounts for all active loans.
SELECT loan_id, amount FROM loans WHERE loan_status = 'active';

--4.	Retrieve the employee IDs and names of all bank staff.
SELECT employee_id, employee_name FROM employees;

--5.	Get the balance amounts for all accounts
SELECT account_number, balance FROM accounts;



--FILTERING

--Retrieve the account numbers and names of account holders with a balance greater than $10,000 and more than 5 transactions.
--According to this question our database does not have a customer with a balance greater than 10,000 for more than 5 transactions, but we have a customer with 5 transactions and a balance greater than $10000.
SELECT a.account_number, a.account_name
FROM accounts AS a
INNER JOIN (
    SELECT account_id, COUNT(*) AS num_transactions
    FROM transactions
    GROUP BY account_id
    HAVING COUNT(*) = 5
) AS transaction_counts ON a.account_id = transaction_counts.account_id
WHERE a.balance > 10000;



--Retrieve the employee IDs and names of bank staff with more than 10 years of service and working in the 'Management' department.
SELECT employee_id, employee_name
FROM employees
WHERE years_of_service > 10 AND department = 'Management';


--Get the balance amounts for accounts opened before January 1, 2010, and with a balance above $50,000.
SELECT account_number, balance
FROM accounts
WHERE opening_date < '2010-01-01' AND balance > 50000;



--SORTING

--1. Retrieve the account numbers and names of all account holders, sorted alphabetically by account names.

SELECT account_number, account_name
FROM accounts
ORDER BY account_name ASC;

--2.	Get the transaction IDs and amounts for all transactions, sorted in descending order of transaction amounts.
SELECT transaction_id, amount
FROM transactions
ORDER BY amount DESC;


--3.	Fetch the loan IDs and amounts for all active loans, sorted in ascending order of loan amounts.
SELECT loan_id,amount
FROM loans
WHERE loan_status = 'Active'
ORDER BY amount ASC;


--4.	Retrieve the employee IDs and names of all bank staff, sorted alphabetically by employee names.
SELECT employee_id, employee_name
FROM employees
ORDER BY employee_name ASC;


--5.	Get the balance amounts for all accounts, sorted in descending order of balance amounts.
SELECT balance AS balance_amounts
FROM accounts
ORDER BY balance ASC;



--DISTINCT

--1.	Retrieve distinct account types available in the bank.
SELECT DISTINCT account_type
FROM accounts;

--2.	Get distinct transaction types for all transactions.
SELECT DISTINCT transaction_type 
FROM transactions;

--3.	Fetch distinct loan types for all active loans.
SELECT DISTINCT loan_type
FROM loans
WHERE loan_status = 'Active';


--4.	Retrieve distinct department names for all bank staff.
SELECT DISTINCT department AS department_names
FROM employees;

--5.	Get distinct employee roles for all bank staff.
--Add new column employee role
ALTER TABLE employees
ADD employee_role Varchar(50);

-- Populate employee_role column
UPDATE employees
SET employee_role = 
    CASE 
        WHEN employee_id = 1 THEN 'Bank Manager'
        WHEN employee_id = 2 THEN 'Operayion Manager'
        WHEN employee_id = 3 THEN 'Customercare representative'
        WHEN employee_id = 4 THEN 'Retail Marketer'
        WHEN employee_id = 5 THEN 'Credit Review Officer'
        WHEN employee_id = 6 THEN 'Customer Relationship Manager'
        WHEN employee_id = 7 THEN 'Compliance officer'
        ELSE employee_role  -- Optionally, handle other cases if needed
    END
WHERE employee_id IN (1, 2, 3, 4, 5, 6, 7);

SELECT *
FROM employees;


--Distint Employee role 
SELECT DISTINCT employee_role
FROM employees;



