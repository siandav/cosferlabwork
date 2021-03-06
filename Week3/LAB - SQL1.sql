# 1
use sakila;
# 2
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM actor;

# 3
SELECT title FROM film;

# 4
SELECT distinct name FROM language;

# 5
# 5.1
SELECT COUNT(store_id) FROM store;

# 5.2
SELECT COUNT(staff_id) FROM staff;

# 5.3
SELECT first_name FROM staff;

## LAB PREPROCESSING

# 1. Select all the actors with the first name "Scarlett".
SELECT first_name FROM actor WHERE first_name='SCARLETT';

# 2. How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(distinct i.inventory_id) AS qty_movies, COUNT(distinct r.rental_id) AS rent_movies FROM inventory AS i, rental AS r;

# 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) AS max_duration, MIN(length) AS min_duration FROM film;

# 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT FLOOR(AVG(length)/60) AS hours, round(AVG(length)%60) AS minutes FROM film;

# 5. How many distinct (different) actors' last names are there?
SELECT COUNT(distinct last_name) FROM actor;

# 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) FROM rental;

# 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT * FROM rental;
SELECT *, extract(MONTH FROM rental_date) AS month, CASE WEEKDAY(rental_date) 
    WHEN 6 THEN 'SUNDAY' 
    WHEN 0 THEN 'MONDAY' 
    WHEN 1 THEN 'TUESDAY' 
    WHEN 2 THEN 'WEDNESDAY' 
    WHEN 3 THEN 'THURSDAY' 
    WHEN 4 THEN 'FRIDAY' 
    WHEN 5 THEN 'SATURDAY' 
    END
AS weekday FROM rental;

SELECT *, date_format(rental_date, '%M') as month, date_format(rental_date, '%W') as weekday from rental;

# 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.	
SELECT *, extract(MONTH FROM rental_date) AS month, CASE WEEKDAY(rental_date) 
    WHEN 6 THEN 'SUNDAY' 
    WHEN 0 THEN 'MONDAY' 
    WHEN 1 THEN 'TUESDAY' 
    WHEN 2 THEN 'WEDNESDAY' 
    WHEN 3 THEN 'THURSDAY' 
    WHEN 4 THEN 'FRIDAY' 
    WHEN 5 THEN 'SATURDAY' 
    END AS weekday,
    CASE 
    WHEN WEEKDAY(rental_date)=5 or WEEKDAY(rental_date)=6 THEN 'weekend'
    else 'workday'
    END AS day_type
 FROM rental;
 
# 9. How many rentals were in the last month of activity?
SELECT COUNT(rental_id) FROM rental WHERE rental_date>'2006-01-14 15:16:03';

select date(MAX(rental_date)) - INTERVAL 30 DAY, date(max(rental_date)) FROM rental;