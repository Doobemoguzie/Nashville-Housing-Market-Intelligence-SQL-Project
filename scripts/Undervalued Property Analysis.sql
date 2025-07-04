-- Flag properties sold significantly below their neighborhood average.
WITH neighborhood_avg AS(
    SELECT 
        neighborhood,
        ROUND(AVG(sale_price)) AS avg_price
    FROM nashville_housing
    WHERE sale_price IS NOT NULL
    GROUP BY neighborhood
)

SELECT 
    nh.parcel_id,
    nh.neighborhood,
    nh.sale_price,
    na.avg_price,
    ROUND(nh.sale_price / na.avg_price, 2) AS price_ratio,
    CASE 
        WHEN nh.sale_price < na.avg_price * 0.75 THEN 'Underpriced'
        ELSE 'Normal'
    END AS investment_flag
FROM nashville_housing nh
JOIN neighborhood_avg na
  ON nh.neighborhood = na.neighborhood
ORDER BY price_ratio;

