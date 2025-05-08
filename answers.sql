-- QUESTION ONE

-- Table 1: Orders
CREATE TABLE ProductDetail (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);
CREATE TABLE ProductDetailItems (
    ItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES ProductDetail(OrderID)
);
-- QUESTION TWO
-- QUESTION TWO
-- OrderID + Product together form the composite primary key (uniquely identifies each row).
-- CustomerName depends only on OrderID, not on Product → this is a partial dependency, which violates 2NF.
-- To normalize the OrderDetails table ,split the OrderDetails table into two separate tables:
-- 	1)Orders table: Contains OrderID and CustomerName.
-- 	2)OrderItems table: Contains OrderID, Product, and Quantity.
-- Table 1: Orders (OrderID → CustomerName)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

-- Table 2: OrderItems (OrderID + Product → Quantity)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);