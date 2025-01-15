-- Create the Salesman table if it does not exist
CREATE TABLE IF NOT EXISTS Salesman1 (
Salesman_id TEXT PRIMARY KEY,
name TEXT,
city TEXT,
Comission REAL
);
-- Insert sample data into the Salesman table
INSERT INTO Salesman1 (Salesman_id, name, city, Comission) VALUES
('5001', 'James Hoog', 'New York', 0.15),
('5002', 'Nail Knite', 'Paris', 0.13),
('5005', 'Pit Alex', 'London', 0.11),
('5006', 'Mc Lyon', 'Paris', 0.14),
('5007', 'Paul Adam', 'Rome', 0.13),
('5003', 'Lauson Hen', 'San Jose', 0.12);
SELECT * from Salesman1

-- Create the Customer table if it does not exist
CREATE TABLE IF NOT EXISTS Customer1(
customer_id TEXT,
cust_name TEXT PRIMARY KEY,
city TEXT,
grade INTEGER,
Salesman_id TEXT,
FOREIGN KEY (Salesman_id) REFERENCES Salesman1(Salesman_id)
);

-- Insert sample data into the Customer table
INSERT INTO Customer1 (customer_id, cust_name, city, grade, Salesman_id) VALUES
('3002', 'nick rimando', 'new york', 100, '5001'),
('3007', 'brad davis', 'new york', 200, '5001'),
('3005', 'graham zusi', 'california', 200, '5002'),
('3008', 'julian green', 'london', 300, '5002'),
('3004', 'fabian johnson', 'paris', 300, '5006'),
('3009', 'geoff cameron', 'berlin', 100, '5003'),
('3003', 'jozy altidor', 'moscow', 200, '5007'),
('3001', 'brad guzan', 'london', NULL, '5005');
SELECT * FROM Customer1


-- Create the Orders table if it does not exist
CREATE TABLE IF NOT EXISTS Orders1 (
ord_no TEXT PRIMARY KEY,
purch_amt REAL,
ord_date TEXT,
customer_id TEXT,
Salesman_id TEXT,
FOREIGN KEY (customer_id) REFERENCES Customer1(customer_id),
FOREIGN KEY (Salesman_id) REFERENCES Salesman1(Salesman_id)
);

-- Insert sample data into the Orders table
INSERT INTO Orders1 (ord_no, purch_amt, ord_date, customer_id, Salesman_id) VALUES
('70001', 150.5, '2012-10-05', '3005', '5002'),
('70009', 270.65, '2012-09-10', '3001', '5001'),
('70002', 65.26, '2012-10-05', '3002', '5003'),
('70004', 110.5, '2012-08-17', '3009', '5007'),
('70007', 948.5, '2012-09-10', '3005', '5005'),
('70005', 2400.6, '2012-07-27', '3007', '5006');
SELECT * FROM  Orders1
SELECT * FROM Customer1
SELECT * from Salesman1
-- Matching Customers and salesmen by city
SELECT Customer1.cust_name, Salesman1.name,Customer1.city FROM Customer1 JOIN Salesman1 ON 
Customer1.Salesman_id = Salesman1.Salesman_id;

-- Fetching Orders1 where Customer1's city does not match Salesman1's city
SELECT Orders1.ord_no, Customer1.city , Orders1.customer_id, Orders1.Salesman_id FROM 
Orders1 JOIN Customer1 ON Orders1.customer_id = Customer1.customer_id
JOIN Salesman1 ON Orders1.Salesman_id = Salesman1.Salesman_id
WHERE Customer1.city <> Salesman1.city

-- Fetching all Orders1 with Customer1 names
SELECT Orders1.ord_no, Customer1.cust_name FROM Orders1
JOIN Customer1 ON Orders1.customer_id= Customer1.customer_id;

SELECT Customer1.cust_name AS 'CUSTOMER', 
Customer1.grade AS 'GRADE' FROM Orders1
JOIN Salesman1 ON Orders1.Salesman_id = Salesman1.Salesman_id
JOIN Customer1 ON Orders1.customer_id = Customer1.customer_id
WHERE Customer1.grade IS NOT NULL;









