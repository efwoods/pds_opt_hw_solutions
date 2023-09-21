-- How far does Sean Connery’s movie list go back where his movie rating was above 5.0 
WITH moviePersonMap as (SELECT * FROM movies
INNER JOIN stars
ON stars.movie_id = movies.id
INNER JOIN people
ON stars.person_id = people.id),
moviesWithSeanConnery as (SELECT * FROM moviePersonMap 
WHERE name = "Sean Connery"),
ratedMovies as (SELECT * from ratings
INNER JOIN moviesWithSeanConnery 
ON moviesWithSeanConnery.movie_id = ratings.movie_id)
SELECT year FROM ratedMovies
WHERE rating > 5.0
ORDER BY year 
LIMIT 1
