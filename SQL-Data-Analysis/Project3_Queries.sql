-- 1. View all records
SELECT * FROM orders;

-- 2. View first 10 records
SELECT * FROM orders
LIMIT 10;

-- 3. Selected columns
SELECT OrderID, Date, Product, Quantity, UnitPrice, TotalPrice
FROM orders;

-- 4. Total orders
SELECT COUNT(*) AS TotalOrders
FROM orders;

-- 5. Total sales
SELECT SUM(TotalPrice) AS TotalSales
FROM orders;

-- 6. Average order value
SELECT AVG(TotalPrice) AS AverageOrderValue
FROM orders;

-- 7. Highest price orders
SELECT OrderID, Product, Quantity, TotalPrice
FROM orders
ORDER BY TotalPrice DESC;

-- 8. Orders greater than 2000
SELECT *
FROM orders
WHERE TotalPrice > 2000;

-- 9. Shipped orders
SELECT *
FROM orders
WHERE OrderStatus = 'Shipped';

-- 10. Cancelled orders
SELECT *
FROM orders
WHERE OrderStatus = 'Cancelled';

-- 11. Sales by product
SELECT Product, SUM(TotalPrice) AS TotalSales
FROM orders
GROUP BY Product
ORDER BY TotalSales DESC;

-- 12. Quantity sold by product
SELECT Product, SUM(Quantity) AS TotalQuantity
FROM orders
GROUP BY Product
ORDER BY TotalQuantity DESC;

-- 13. Orders by payment method
SELECT PaymentMethod, COUNT(*) AS TotalOrders
FROM orders
GROUP BY PaymentMethod
ORDER BY TotalOrders DESC;

-- 14. Sales by payment method
SELECT PaymentMethod, SUM(TotalPrice) AS TotalSales
FROM orders
GROUP BY PaymentMethod
ORDER BY TotalSales DESC;

-- 15. Orders by status
SELECT OrderStatus, COUNT(*) AS TotalOrders
FROM orders
GROUP BY OrderStatus;

-- 16. Top 10 products by sales
SELECT Product, SUM(TotalPrice) AS TotalSales
FROM orders
GROUP BY Product
ORDER BY TotalSales DESC
LIMIT 10;

-- 17. Referral source orders
SELECT ReferralSource, COUNT(*) AS TotalOrders
FROM orders
GROUP BY ReferralSource
ORDER BY TotalOrders DESC;

-- 18. Referral source sales
SELECT ReferralSource, SUM(TotalPrice) AS TotalSales
FROM orders
GROUP BY ReferralSource
ORDER BY TotalSales DESC;

-- 19. Coupon code analysis
SELECT CouponCode, COUNT(*) AS TotalOrders
FROM orders
GROUP BY CouponCode
ORDER BY TotalOrders DESC;

-- 20. Yearly sales
SELECT
SUBSTR(Date, LENGTH(Date)-3, 4) AS Year,
SUM(TotalPrice) AS TotalSales
FROM orders
GROUP BY Year
ORDER BY Year;
-- 21- Monthly sales
SELECT
Date,
TotalPrice
FROM orders
LIMIT 10;