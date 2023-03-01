/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
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

     bts_films AS (
        SELECT
            *
        FROM
            film_feature
        WHERE
            feature = 'Behind the Scenes'
     )

SELECT 
    title
FROM 
    trailer_films
    JOIN bts_films USING (title)
ORDER BY
    title;
