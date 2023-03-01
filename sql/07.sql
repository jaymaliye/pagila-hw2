/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */

WITH 
    us_customers AS (
        SELECT 
            customer_id
        FROM 
            customer
            JOIN 
                address USING(address_id)
            JOIN 
                city USING(city_id)
            JOIN 
                country USING(country_id)    
        WHERE 
            country_id = 103
    ),

    rented_films AS (
        SELECT
            b.title AS title,
            customer_id
        FROM
            inventory AS a
            JOIN
                film AS b USING(film_id)
            JOIN 
                rental AS c USING(inventory_id)
    ),

    us_rented_films AS (
        SELECT
            *
        FROM 
            rented_films
        WHERE
            customer_id::INT IN (SELECT * FROM us_customers)
    )

SELECT 
    DISTINCT title
FROM 
    rented_films
WHERE
    title NOT IN (SELECT title FROM us_rented_films)
ORDER BY
    1;

