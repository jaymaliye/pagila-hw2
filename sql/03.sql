/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */

SELECT 
   DISTINCT customer_id      
FROM 
    film
JOIN 
    inventory USING(film_id)
JOIN 
    rental USING(inventory_id)
JOIN 
    customer USING(customer_id)
WHERE film_id IN ( 
    SELECT a.film_id
    FROM film AS a
    LEFT JOIN inventory AS b
    ON a.film_id = b.film_id
    LEFT JOIN rental as c
    ON b.inventory_id = c.inventory_id
    LEFT JOIN payment as d
    ON c.rental_id = d.rental_id
    GROUP BY a.film_id
    HAVING SUM(d.amount) > 0
    ORDER BY sum(d.amount) DESC
    LIMIT 5)
ORDER BY customer_id;
