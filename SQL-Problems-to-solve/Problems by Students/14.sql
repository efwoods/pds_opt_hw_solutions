-- Who (star) worked in most of the movies?
SELECT name, COUNT(name) FROM movies
INNER JOIN stars 
ON movies.id = stars.movie_id
INNER JOIN people 
ON stars.person_id = people.id
GROUP BY people.name
ORDER BY COUNT(name) DESC
LIMIT 1