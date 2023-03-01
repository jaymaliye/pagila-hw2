/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

WITH
    film_feature AS (
        SELECT
            film_id,
            unnest(special_features) AS feature
        FROM
            film
     ),

    bts_films AS (
        SELECT
            *
        FROM
            film_feature
        WHERE
            feature = 'Behind the Scenes'
     ),

    bts_actors AS (
        SELECT 
            actor_id
        FROM 
            film_actor AS a
        WHERE
            a.film_id IN (
                SELECT 
                    b.film_id
                FROM 
                    bts_films AS b
            )
      )

SELECT 
    DISTINCT CONCAT(first_name || ' ' || last_name) AS "Actor Name"
FROM
    actor AS a
WHERE
    a.actor_id IN (
        SELECT 
            b.actor_id
        FROM 
            bts_actors AS b
    )
ORDER BY
    "Actor Name";

        
