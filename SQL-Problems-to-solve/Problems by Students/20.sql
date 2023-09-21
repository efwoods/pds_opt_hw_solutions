-- Which movies have the most starts?
SELECT *, COUNT(title) FROM movies
INNER JOIN stars
ON stars.movie_id = movies.id
INNER JOIN people
on stars.person_id = people.id
GROUP BY title
ORDER BY COUNT(title) DESC