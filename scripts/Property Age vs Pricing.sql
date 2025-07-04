SELECT 
	year_built, 
	ROUND(AVG(sale_price), 0) AS avg_price
FROM nashville_housing
WHERE year_built IS NOT NULL
GROUP BY year_built
ORDER BY year_built;
