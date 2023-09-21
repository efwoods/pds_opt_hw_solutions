-- Which movie has the most star actors?
SELECT people.name, movies.title, COUNT(movies.title) FROM stars
INNER JOIN people 
ON people.id = stars.person_id
INNER JOIN movies
ON movies.id = stars.movie_id
GROUP BY (movies.title)
ORDER BY COUNT(movies.title) DESC
-- ANSWER IS APPEARING AS "BROKEN" WITH 136 STARS; THIS IS THE MAPPING OF THE DATA IN THE DATABASE
