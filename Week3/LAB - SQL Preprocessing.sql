# 1. Select all the actors with the first name "Scarlett".
SELECT first_name FROM actor WHERE first_name='SCARLETT';

# 2. How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(inventory_id) FROM inventory;
SELECT COUNT(rental_id) FROM rental;

# 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) AS max_duration, MIN(length) AS min_duration FROM film;

# 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT (AVG(length)) FROM film;
# 5. How many distinct (different) actors' last names are there?

# 6. Since how many days has the company been operating (check DATEDIFF() function)?

# 7. Show rental info with additional columns month and weekday. Get 20 results.

# 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.	

# 9. How many rentals were in the last month of activity?