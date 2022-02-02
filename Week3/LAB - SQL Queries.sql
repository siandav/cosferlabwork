# LAB SQL QUERIES - sakila
use sakila;
# 1. Using the rental table, find out how many rentals were processed by each employee.
SELECT count(rental_id), staff_id
FROM rental
GROUP BY staff_id;

# 2. Using the film table, find out how many films were released.
SELECT COUNT(film_id)
FROM film;

# 3. Using the film table, find out how many films there are of each rating. Sort the results in descending order of the number of films.
SELECT count(film_id), rating
FROM film
GROUP BY rating;

# 4. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT * FROM film;
SELECT avg(length), rating
FROM FILM
GROUP BY rating HAVING avg(length)>120;

SELECT status_description,
 COUNT(distinct loan_id) AS noofloans,
 COUNT(distinct account_id) AS noofaccounts
 FROM loan_statuses
 GROUP BY status_description;