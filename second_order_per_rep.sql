  with cte_main as
  (
 select orderDate, t1.orderNumber, salesRepEmployeeNumber,
 row_number () over (partition by salesRepEmployeeNumber order by orderdate) as repordernumber
 
 from orders t1
 inner join customers t2
 on t1.customerNumber = t2.customerNumber
 join employees t3
 on t2.salesRepEmployeeNumber = t3.employeeNumber)
 
 select *
 from cte_main
 where repordernumber = 2