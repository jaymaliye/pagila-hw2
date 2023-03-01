/*
 * This problem is the same as 06.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

SELECT 
    a.title
FROM 
    film AS a
LEFT JOIN 
    inventory AS b USING (film_id)
WHERE   
    b.film_id IS NULL
ORDER BY 
    title;
