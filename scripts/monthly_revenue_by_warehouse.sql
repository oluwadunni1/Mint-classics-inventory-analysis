-- monthly revenue per warehouse 
WITH months AS (
    SELECT DISTINCT DATE_FORMAT(orderDate, '%Y-%m') AS order_month
    FROM orders
),
warehouses AS (
    SELECT DISTINCT warehouseCode FROM products
),
all_combinations AS (
    SELECT m.order_month, w.warehouseCode
    FROM months m CROSS JOIN warehouses w
),
monthly_revenue AS (
    SELECT
        DATE_FORMAT(o.orderDate, '%Y-%m') AS order_month,
        p.warehouseCode,
        SUM(od.quantityOrdered * od.priceEach) AS revenue
    FROM
        orders o
    JOIN
        orderdetails od ON o.orderNumber = od.orderNumber
    JOIN
        products p ON od.productCode = p.productCode
    WHERE
        o.status NOT IN ('Cancelled', 'Disputed')
    GROUP BY
        order_month, p.warehouseCode
)
SELECT
    a.order_month,
    a.warehouseCode,
    COALESCE(mr.revenue, 0) AS monthly_revenue
FROM
    all_combinations a
LEFT JOIN
    monthly_revenue mr
ON
    a.order_month = mr.order_month AND a.warehouseCode = mr.warehouseCode
ORDER BY
    a.order_month, a.warehouseCode;
