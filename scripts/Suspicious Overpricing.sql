-- Find properties with a sale price much higher than their assessed value
WITH pricediff AS (
    SELECT *,
           ROUND((sale_price - total_value)::NUMERIC, 0) AS value_gap,
           ROUND((sale_price - total_value)::NUMERIC / NULLIF(total_value, 0), 2) AS percent_diff
    FROM nashville_housing
    WHERE sale_price IS NOT NULL AND total_value IS NOT NULL
)

SELECT *
FROM pricediff
WHERE percent_diff > 1.0  -- over 100% markup
ORDER BY percent_diff DESC;
