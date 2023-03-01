/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

WITH 
    film_feature AS (
        SELECT
            title,
            unnest(special_features) AS feature
        FROM 
            film
     ),

    trailer_films AS (
        SELECT
            *
        FROM
            film_feature
        WHERE
            feature = 'Trailers' 
     ),

    g_rating_films AS (
        SELECT 
            title
        FROM 
            film
        WHERE
            rating = 'G' 
     )

SELECT 
    title
FROM 
    g_rating_films
WHERE
    title IN ( 
         SELECT title
         FROM trailer_films
    );           
            
