/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
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
     )

SELECT 
   feature AS special_features, 
   COUNT(*)
FROM 
    film_feature
GROUP BY
    feature
ORDER BY
    feature;
