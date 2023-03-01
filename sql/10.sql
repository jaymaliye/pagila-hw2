/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */

WITH film2 AS (
    SELECT 
        a.title,
        a.film_id,
        amount,
        unnest(special_features) AS feature
    FROM 
        film AS a
        LEFT JOIN 
            inventory AS b
                ON a.film_id = b.film_id
        LEFT JOIN 
            rental as c
                ON b.inventory_id = c.inventory_id
        LEFT JOIN 
            payment as d
                ON c.rental_id = d.rental_id
    )

SELECT
    feature AS special_feature,
    SUM(amount) AS profit
FROM 
    film2
GROUP BY 
    special_feature
ORDER BY
    special_feature;

