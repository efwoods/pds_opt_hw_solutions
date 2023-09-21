-- Who’s the oldest star in a specific movie?
SELECT * FROM movies
INNER JOIN stars
ON stars.movie_id = movies.id
INNER JOIN people
ON stars.person_id = people.id
AND birth NOT NULL
AND title = "Gravity"
ORDER BY title, birth
LIMIT 1