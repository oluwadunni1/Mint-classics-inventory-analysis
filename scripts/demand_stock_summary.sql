-- Product Demand and Stock Levels by Warehouse (Jun 2004 – May 2005)
SELECT 
    p.productCode, 
    p.productName,
    p.quantityInStock,
    COALESCE(SUM(od_filtered.quantityOrdered), 0) AS quantity_ordered,
    p.warehousecode,
    p.buyPrice
FROM products p
LEFT JOIN (
    SELECT o.productCode, o.quantityOrdered
    FROM orderdetails o
    JOIN orders ord ON o.orderNumber = ord.orderNumber
    WHERE ord.orderDate BETWEEN '2004-06-01' AND '2005-05-31'
) od_filtered ON p.productCode = od_filtered.productCode
GROUP BY 
    p.productCode, 
    p.productName, 
    p.quantityInStock, 
    p.warehousecode,
    p.buyPrice
ORDER BY quantity_ordered DESC;
