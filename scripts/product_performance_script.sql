-- Inventory Turnover Analysis by Product 
SELECT 
    p.productCode, 
    p.productName,
    p.quantityInStock,
    COALESCE(SUM(o.quantityOrdered), 0) AS quantity_ordered,
    CASE 
        WHEN COALESCE(SUM(o.quantityOrdered), 0) = 0 THEN 0 
        ELSE p.quantityInStock / COALESCE(SUM(o.quantityOrdered), 1) 
    END AS inventory_turnover,
    p.warehousecode
FROM products p
LEFT JOIN orderdetails o ON p.productCode = o.productCode
GROUP BY p.productCode, p.productName, p.quantityInStock, p.warehousecode
ORDER BY inventory_turnover DESC;
