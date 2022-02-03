use sakila;
# 1) How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT 
    COUNT(inventory_id) AS copies
FROM
    inventory
WHERE
    film_id IN (SELECT 
            film_id
        FROM
            film AS f
        WHERE
            title = 'Hunchback Impossible');

# 2) List all films whose length is longer than the average of all the films.
SELECT 
    film_id, title, length
FROM
    film
HAVING length > (SELECT 
        AVG(length) AS avg_length
    FROM
        film);

# 3) Use subqueries to display all actors who appear in the film Alone Trip.
SELECT f.title, concat(first_name,' ',last_name) as Name FROM actor
JOIN film_actor
USING(actor_id)
JOIN film as f
USING (film_id)
WHERE title = (SELECT title FROM film WHERE title ='Alone Trip');

# 4) Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
SELECT title, c.name as category_type FROM film
JOIN film_category
USING(film_id)
JOIN category as c
USING(category_id)
WHERE c.category_id = (SELECT category_id FROM category WHERE name = 'Family');

# 5) Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
SELECT concat(first_name, ' ', last_name) as name, email, ct.country FROM customer
JOIN address USING(address_id)
JOIN city USING(city_id)
JOIN country as ct USING(country_id)
WHERE ct.country = (SELECT country FROM country WHERE country = 'Canada');

# 6) Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
SELECT concat(first_name,' ', last_name) as name, film.title FROM actor
JOIN film_actor USING(actor_id)
JOIN film USING(film_id)
WHERE actor_id = (SELECT actor_id FROM film_actor GROUP BY actor_id ORDER BY count(film_id) DESC LIMIT 1); 


# 7) Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments
SELECT concat(first_name, ' ', last_name), film.title FROM customer
JOIN payment USING(customer_id)
JOIN rental USING(rental_id)
JOIN inventory USING(inventory_id)
JOIN film USING(film_id)
WHERE customer.customer_id =
(SELECT customer_id FROM payment GROUP BY customer_id ORDER BY sum(amount) DESC LIMIT 1);


# 8) Get the client_id and the total_amount_spent of those clients who spent more than the average of the total_amount spent by each client.
SELECT customer_id, sum(amount) as total_amount_spent
FROM payment 
GROUP BY customer_id
HAVING avg(amount)>
(SELECT avg(amount) FROM payment) 
ORDER BY sum(amount) DESC;