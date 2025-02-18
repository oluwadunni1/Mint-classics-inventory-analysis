-- Product Line Investigation for Warehouse C (West)  
SELECT 
    p.productcode, 
    p.productName, 
    p.productline, 
    p.quantityinstock, 
    w.warehousename
FROM products p
JOIN warehouses w ON p.warehousecode = w.warehousecode
WHERE w.warehousename = 'West';
