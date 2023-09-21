-- What were Robin Williams five most highly rated movies?

SELECT movies.title FROM movies
WHERE movies.id IN
(SELECT movie_id FROM ratings
WHERE ratings.movie_id IN
(SELECT movie_id FROM stars 
WHERE person_id in
(SELECT id FROM people
WHERE name = "Robin Williams"))
ORDER BY rating DESC)
LIMIT 5