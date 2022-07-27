SELECT * FROM aircrafts
WHERE description = 'A310-300F';
--------------------------------------------
SELECT icao FROM airlines
WHERE name = 'Aigle Azur';
--------------------------------------------
SELECT count(*) FROM airlines;
SELECT count(*) FROM aircrafts;
SELECT count(*) FROM airports;
--------------------------------------------
SELECT count(*) FROM airlines
WHERE name ILIKE '%Aero%';
--------------------------------------------
SELECT count(*) FROM airlines
WHERE country_id = 208;
--------------------------------------------
SELECT count(*) FROM airports
WHERE country_id = 42;
--------------------------------------------
SELECT timezone_name FROM airports
WHERE timezone_name LIKE 'Europe/Paris'
--------------------------------------------
SELECT min(elevation) FROM airports
SELECT max(elevation) FROM airports
SELECT avg(elevation) FROM airports
--------------------------------------------
SELECT min(elevation) FROM airports
JOIN countries on airports.country_id = countries.id
WHERE countries.name ILIKe '%spain%'

SELECT max(elevation) FROM airports
JOIN countries on airports.country_id = countries.id
WHERE countries.name ILIKe '%spain%'

SELECT avg(elevation) FROM airports
JOIN countries on airports.country_id = countries.id
WHERE countries.name ILIKe '%spain%'
--------------------------------------------
SELECT min(elevation) FROM airports
JOIN countries on airports.country_id = countries.id
WHERE airports.timezone_name ILIKe '%Europe/Paris%'

SELECT max(elevation) FROM airports
JOIN countries on airports.country_id = countries.id
WHERE airports.timezone_name ILIKe '%Europe/Paris%'

SELECT avg(elevation) FROM airports
JOIN countries on airports.country_id = countries.id
WHERE airports.timezone_name ILIKe '%Europe/Paris%'
--------------------------------------------
SELECT count(*) from routes
WHERE destination_airport_id IS null
--------------------------------------------
SELECT count(*) FROM airlines
JOIN countries on airlines.country_id = countries.id
WHERE airlines.active = 'Y' AND
countries.name LIKE 'France'
--------------------------------------------
SELECT count(distinct(name))
FROM aircrafts
JOIN route_aircrafts ON aircrafts.id = route_aircrafts.aircraft_id
Join routes ON route_aircrafts.route_id = routes.id
Where routes.id = 170
--------------------------------------------

--------------------------------------------
---Question 18
SELECT COUNT(distinct airlines.id)
FROM airlines
JOIN routes on routes.airline_id = airlines.id
JOIN route_aircrafts on route_aircrafts.route_id = routes.id
JOIN aircrafts on aircrafts.id = route_aircrafts.aircraft_id
WHERE airlines.active = 'Y'
and aircrafts.name ILIKE 'Airbus'
--------------------------------------------
---Question 19
SELECT COUNT(distinct airports.id)
FROM airports
JOIN routes on airports.id = routes.source_airport_id
JOIN route_aircrafts on route_aircrafts.route_id = routes.id
JOIN aircrafts on aircrafts.id = route_aircrafts.aircraft_id
WHERE airports.timezone_name ILIKE 'Europe%'
	AND (aircrafts.wake_size = 'M' or aircrafts.wake_size = 'L')
--------------------------------------------
---For fun?
SELECT distinct count(*)
from airports
join countries on countries.id = airports.country_id
where countries.name ilike 'Vietnam' or
	  countries.name ilike 'Cambodia' or
	  countries.name ilike 'Laos'