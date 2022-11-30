-- 1. Design a relational database structure to keep track of train trips.
--    
--    We need the following information stored in the tables:
--    	- Origin and destination train station's Name, City, IATA Code (example LAX), Latitude, and Longitude  
--      - Servicer Name (e.g. Amtrak) and Headquarters Address
--      - Scheduled departure time, scheduled arrival time, actual departure time, actual arrival time


CREATE TABLE trip
  id -> Primary Key
	origin -> location(id)
  dest -> location(id)
  departure -> Date
  arrival -> Date
  departure_actual -> Date
  arrival_actual -> Date
  servicer -> servicer(id)
  
CREATE TABLE location
	id -> Primary Key
  name -> Text
  city -> Text
  IATA -> Text
  Lat -> Decimal
  Long -> Decimal

CREATE TABLE servicer
  id -> Primary key
  name -> Text
  address -> Text


SELECT *
	trip.origin,
  trip.dest,
	, COUNT(trip.id) AS number_of_trips 
FROM trip JOIN servicer ON trip.servicer = servicer.id   
WHERE trip.arrival_actual = DATE.today()
GROUP BY servicer, trip.origin, trip.dest
ORDER BY servicer, number_of_trips DESC





-- 2. Write a query to return the number of train trips completed on July 13, 2022
-- , per servicer and route (origin dest combo), 
--    sorted by the servicer and route combination 
-- with the most trips in descending order.


