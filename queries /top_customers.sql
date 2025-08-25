SELECT 
    cu.customerName,
    cu.country,
    SUM(orddet.quantityOrdered * orddet.priceEach) AS total_sales
FROM orders ord
INNER JOIN orderdetails orddet 
    ON ord.orderNumber = orddet.orderNumber
INNER JOIN customers cu 
    ON ord.customerNumber = cu.customerNumber
GROUP BY cu.customerName, cu.country
ORDER BY total_sales DESC
LIMIT 10;
