SELECT 
   min(length) as min_duration, 
   max(length) as max_duration
FROM sakila.film;

SELECT
   FLOOR(AVG(length) / 60) AS hours,
   FLOOR(MOD(AVG(length), 60)) AS minutes
FROM sakila.film;

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS DateDifference
FROM sakila.rental;

SELECT rental_date, MONTH(rental_date) AS rental_month, DAYNAME(rental_date) AS rental_weekday
FROM sakila.rental
LIMIT 20;

ALTER TABLE rental
ADD COLUMN day_type VARCHAR(10);
UPDATE rental
SET day_type = CASE
    WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend'
    ELSE 'workday'
    END;
    
SELECT title, COALESCE(rental_duration, 'Not Available') AS rental_duration
FROM sakila.film
ORDER BY title ASC;

SELECT CONCAT(first_name, ' ', last_name) AS full_name, LEFT(email, 3) AS email_prefix
FROM sakila.customer
ORDER BY last_name ASC;

SELECT count(release_year) FROM sakila.film;

SELECT rating, COUNT(*) AS film_count
FROM sakila.film
GROUP BY rating
ORDER BY film_count DESC;

SELECT staff_id, COUNT(*) AS rental_number
FROM sakila.rental
GROUP BY staff_id;

SELECT rating, ROUND(AVG(rental_duration), 2) AS mean_duration
FROM sakila.film
GROUP BY rating
ORDER BY mean_duration DESC;

SELECT rating,rental_duration
FROM sakila.film
GROUP BY rating
HAVING AVG(rental_duration) > 2;

SELECT last_name
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) = 1;
