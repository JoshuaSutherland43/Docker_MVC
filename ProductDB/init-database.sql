USE master;
GO

-- Create Conference database if it doesn't exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Product')
BEGIN
	CREATE DATABASE Conference;
END
GO

-- Switch to Conference database
USE Product;
GO

-- Drop the Products table if it already exists (optional)
IF OBJECT_ID('Products', 'U') IS NOT NULL
    DROP TABLE Products;
GO

-- Create Products table
CREATE TABLE Products (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Price Int NOT NULL
);
GO

-- (Optional) Insert sample product data
INSERT INTO Products (Name, Price)
VALUES 
    ('Laptop', 999),
    ('Headphones', 199),
    ('Keyboard', 499);
GO

-- Query to test data
SELECT TOP (1000) [Id], [Name], [Price]
FROM Products;
GO
