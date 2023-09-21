-- Which stars were in movies with the highest ratings?
WITH movieActorMapping as (SELECT * FROM movies
INNER JOIN stars
ON stars.movie_id = movies.id
INNER JOIN people 
ON stars.person_id = people.id)
SELECT * FROM ratings
INNER JOIN movieActorMapping
ON movieActorMapping.movie_id = ratings.movie_id
ORDER BY votes DESC, rating DESC
