-- Inventory Turnover Analysis by Warehouse  
SELECT 
    w.warehousecode,
    w.warehousename,
    SUM(p.quantityInStock) AS total_stock,
    SUM(od.quantityordered) AS total_orders,
    CASE 
        WHEN SUM(od.quantityordered) = 0 THEN NULL  -- Avoid division by zero
        ELSE ROUND(SUM(p.quantityinstock) / SUM(od.quantityordered), 2) 
    END AS inventory_turnover
FROM warehouses w
JOIN products p ON w.warehousecode = p.warehousecode
JOIN orderdetails od ON p.productcode = od.productcode
GROUP BY w.warehousecode, w.warehousename
ORDER BY inventory_turnover DESC;
