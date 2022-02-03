# Lab | SQL Joins on multiple tables (v2)
USE sakila;

# 1. Write a query to display for each store its store ID, city and country.
SELECT s.store_id, ci.city, country FROM store s
JOIN address a
USING(address_id)
JOIN city ci
USING(city_id)
JOIN country co
USING(country_id);

# 2. Write a query to display how much benefit amount, in dollars, each store brought in.
SELECT s.store_id, sum(p.amount) as benefit_amount FROM store s
JOIN staff sta
USING(store_id)
JOIN payment p
USING(staff_id)
GROUP BY s.store_id;

# 3. What is the average running time of films by category?
SELECT c.name as category, avg(f.length) as avg_length FROM film f
JOIN film_category fc
USING(film_id)
JOIN category c
USING (category_id)
GROUP BY c.name;

# 4. Which film categories are longest on average? Sports, Games, Foreign and Drama (more than 2 hours)
SELECT c.name as category, avg(f.length) as avg_length FROM film f
JOIN film_category fc
USING(film_id)
JOIN category c
USING (category_id)
GROUP BY c.name
ORDER BY avg_length DESC;

# 5. Display the most frequently rented movies in descending order.
SELECT count(r.rental_id) as No_of_Rentals, f.title FROM rental r
JOIN inventory i
USING (inventory_id)
JOIN film f
USING(film_id)
GROUP BY (film_id)
ORDER BY no_of_rentals DESC;