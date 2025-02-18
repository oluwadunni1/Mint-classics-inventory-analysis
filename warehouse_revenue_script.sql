-- Revenue Performance Analysis by Warehouse  
SELECT 
    p.warehouseCode, 
    w.warehouseName,
    SUM(od.quantityOrdered) AS total_quantity_sold, 
    SUM(od.quantityOrdered * od.priceEach) AS total_revenue
FROM orderdetails od
JOIN products p ON od.productCode = p.productCode
JOIN warehouses w ON p.warehouseCode = w.warehouseCode
GROUP BY p.warehouseCode, w.warehouseName
ORDER BY total_revenue DESC;
