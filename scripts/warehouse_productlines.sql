-- productline distribution across warehouses 
SELECT 
    p.warehouseCode,
    p.productLine,
    COUNT(*) AS product_count
FROM 
    products p
GROUP BY 
    p.warehouseCode, p.productLine
ORDER BY 
    p.warehouseCode, product_count DESC;