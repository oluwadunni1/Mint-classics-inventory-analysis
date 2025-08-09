-- total revenue by each warehouse 
SELECT 
    p.warehouseCode,
    SUM(od.quantityOrdered * od.priceEach) AS total_revenue
FROM 
    orderdetails od
JOIN 
    products p ON od.productCode = p.productCode
GROUP BY 
    p.warehouseCode
ORDER BY 
    total_revenue DESC;