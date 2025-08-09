-- Delivery Performance Outliers: Late Shipments Beyond Required Date
SELECT orderNumber, orderDate, requiredDate, shippedDate, status, comments
FROM orders
WHERE DATEDIFF(requiredDate, shippedDate) < 0
ORDER BY orderDate;
