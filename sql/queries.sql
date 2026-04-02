-- Total Revenue.
SELECT ROUND(SUM(CAST(Quantity AS REAL) * CAST(UmitPrice AS REAL)), 2) AS total_revenue
 FROM retail;


-- Top 10 Countries by Revenue.
SELECT
   Country,
   ROUND(SUM(CAST(Quantity AS REAL) * CAST(UnitPrice AS REAL)), 2) AS revenue
FROM retail
GROUP BY Country
ORDER BY revenue DESC
LIMIT 10;


-- Top 10 Products by Units Sold.
SELECT
   Description,
   SUM(CAST(Quantity AS REAL)) AS units_sold
FROM retail
GROUP BY Description
ORDER BY units_sold DESC
LIMIT 10;


-- Top 10 Customer by Revenue.
SELECT
   CustomerID,
   ROUND(SUM(CAST(Quantity AS REAL) * CAST(UnitPrice AS REAL)), 2) AS customer_revenue
FROM retail
WHERE TRIM(CustomerID) != ''
GROUP BY CustomerID
ORDER BY customer_revenue DESC
LIMIT 10;


-- Sales Trend by Date.
SELECT
   SUBSTR(REPLACE(TRIM(InvoiceDate), '"', ''), 1, INSTR(REPLACE(TRIM(InvoiceDate), '"', ''), ' ') - 1) AS date_only,
   ROUND(SUM(CAST(Quantity AS REAL) * CAST(UNitPrice AS REAL)), 2) AS revenue
FROM retail
GROUP BY date_only
ORDER BY revenue DESC
LIMIT 10;


