-- What were the three longest trips on days that it rains? 

SELECT
	trips.zip_code,
	trips.duration,
	trips.trip_id,
	weather.events
FROM
	trips
JOIN
	weather
ON
	trips.zip_code = weather.zip and
	date(trips.start_date) = date(weather.date)
WHERE
	weather.events = 'Rain'
ORDER by duration DESC
LIMIT 3;

-- Which station is full most often? 

SELECT
	COUNT(*),
	status.station_id,
	stations.name	
FROM
	status
JOIN
	stations
ON
	status.station_id = stations.station_id
WHERE
	docks_available = 0
GROUP by status.station_id, stations.name;

--  Return a list of stations with a count of number of trips starting at that station but ordered by dock count.

SELECT
	trips.start_station,
	COUNT(*),
	stations.dockcount
FROM
	trips
JOIN
	stations
ON
	trips.start_station = stations.name
GROUP by trips.start_station, stations.dockcount
ORDER by stations.dockcount;

-- What's the length of the longest trip for each day it rains anywhere?

SELECT
	MAX(trips.duration),
	weather.date
FROM
	trips
JOIN
	weather
ON
	trips.zip_code = weather.zip and
	date(trips.start_date) = date(weather.date)
WHERE
	weather.events = 'Rain'
GROUP by weather.date
ORDER by weather.date;