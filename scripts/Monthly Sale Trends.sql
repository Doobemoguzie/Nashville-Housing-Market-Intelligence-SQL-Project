SELECT 
	DATE_TRUNC('month', sale_date)::date AS month, 
	COUNT(*) AS total_sales
FROM nashville_housing
GROUP BY month
ORDER BY month;
