-- SELECT
-- 	*
-- FROM
-- 	seattle_calendar
-- WHERE
-- 	cast(TRANSLATE(price,'$,','') AS FLOAT) = (SELECT max(cast(TRANSLATE(price,'$,','') AS FLOAT)) from seattle_calendar)
-- ORDER BY price DESC;
														  
														  

-- Not same answer
SELECT
 	*
FROM
	sea_list
ORDER BY price DESC;

SELECT
	Neighbourhood_group,
	sum(calculated_host_listings_count)
FROM
	sea_list
GROUP BY neighbourhood_group
ORDER BY sum DESC;

SELECT 
	EXTRACT(month FROM date) "Month",
	cast(TRANSLATE(price,'$,','') AS FLOAT) = (SELECT min(cast(TRANSLATE(price,'$,','') AS FLOAT)) from seattle_calendar) "cheapest month"
FROM  
	seattle_calendar
WHERE
	cast(TRANSLATE(price,'$,','') AS FLOAT) = (SELECT min(cast(TRANSLATE(price,'$,','') AS FLOAT)) from seattle_calendar)
GROUP BY EXTRACT(month FROM date), price;





