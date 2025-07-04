-- Group homes into "Old", "Mid", "New" and analyze pricing impact
WITH age_grouped AS (
    SELECT *,
        CASE
            WHEN "year_built" <= 1950 THEN 'Old'
            WHEN "year_built" BETWEEN 1951 AND 2000 THEN 'Mid-Age'
            WHEN "year_built" > 2000 THEN 'Modern'
            ELSE 'Unknown'
        END AS age_category
    FROM nashville_housing
    WHERE "year_built" IS NOT NULL
)

SELECT age_category,
       COUNT(*) AS total_homes,
       ROUND(AVG(sale_price), 0) AS avg_price
FROM age_grouped
GROUP BY age_category
ORDER BY avg_price DESC;
