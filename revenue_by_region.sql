SELECT 
    o.country AS office_country,
    SUM(orddet.quantityOrdered * orddet.priceEach) AS total_revenue
FROM orders ord
INNER JOIN orderdetails orddet 
    ON ord.orderNumber = orddet.orderNumber
INNER JOIN customers cu 
    ON ord.customerNumber = cu.customerNumber
INNER JOIN employees emp 
    ON cu.salesRepEmployeeNumber = emp.employeeNumber
INNER JOIN offices o 
    ON emp.officeCode = o.officeCode
GROUP BY o.country
ORDER BY total_revenue DESC;