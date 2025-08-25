WITH monthly AS (
  SELECT
    DATE_FORMAT(ord.orderDate, '%Y-%m-01') AS month_start,
    SUM(od.quantityOrdered * od.priceEach) AS revenue
  FROM orders ord
  JOIN orderdetails od ON ord.orderNumber = od.orderNumber
  GROUP BY DATE_FORMAT(ord.orderDate, '%Y-%m-01')
)
SELECT
  month_start,
  revenue,
  LAG(revenue) OVER (ORDER BY month_start) AS prev_month_revenue,
  ROUND(
    (revenue - LAG(revenue) OVER (ORDER BY month_start))
    / NULLIF(LAG(revenue) OVER (ORDER BY month_start), 0) * 100, 2
  ) AS mom_growth_pct
FROM monthly
ORDER BY month_start;
