-- Who directed the most number of movies?
SELECT name as "Director", COUNT(name) as "Number of Directed Movies in this DB" FROM directors
INNER JOIN movies
ON movies.id = directors.movie_id
INNER JOIN people
ON people.id = directors.person_id
GROUP BY name
ORDER BY COUNT(name) DESC
LIMIT 1