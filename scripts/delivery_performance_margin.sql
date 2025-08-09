-- Delivery Performance Analysis Shipped vs Required Dates"
SELECT 
    o.orderNumber,
    p.warehouseCode,
    o.shippedDate,
    o.requiredDate,
    o.orderDate,
    DATEDIFF(o.requiredDate, o.shippedDate) AS delivery_margin_days
FROM 
    orders o
JOIN 
    orderdetails od ON o.orderNumber = od.orderNumber
JOIN 
    products p ON od.productCode = p.productCode
WHERE 
    o.shippedDate IS NOT NULL 
    AND o.requiredDate IS NOT NULL;