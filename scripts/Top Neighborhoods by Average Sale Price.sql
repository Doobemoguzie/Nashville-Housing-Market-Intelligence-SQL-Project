-- Top Neighborhoods by Average Sale Price

SELECT 
    neighborhood,
    COUNT(*) AS total_sales,
    ROUND(AVG(sale_price), 0) AS avg_sale_price,
    ROUND(SUM(sale_price), 0) AS total_revenue
FROM nashville_housing
WHERE sale_price IS NOT NULL AND neighborhood IS NOT NULL
GROUP BY neighborhood
ORDER BY avg_sale_price DESC
LIMIT 10;
