USE salesdb;
-- Question 1: Transform ProductDetail into 1NF

-- Create ProductDetail_1NF table
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    PRIMARY KEY (OrderID, Product)
);

-- Insert data in 1NF format (atomic values)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Question 2: Transform OrderDetails into 2NF

-- Create Orders table (removes partial dependency)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Create OrderDetails table (depends fully on OrderID + Product)
CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert into Orders
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Insert into OrderDetails
INSERT INTO OrderDetails (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

