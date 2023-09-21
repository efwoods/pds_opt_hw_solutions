-- How many stars with over 5 shows are born after 2000?
WITH actors as (SELECT movie_id, person_id, name, birth FROM stars
	INNER JOIN people
	ON stars.person_id = people.id
	AND birth > "2000"),
numberOfMoviesPerActor as (SELECT title, name, birth, COUNT(actors.name) as "movieCount" FROM movies 
	INNER JOIN actors 
	ON actors.movie_id = movies.id
	GROUP BY (actors.name)
	ORDER BY COUNT(actors.name) DESC),
greaterThanFive as (SELECT * FROM numberOFMoviesPerActor
	WHERE numberOFMoviesPerActor.movieCount > 5)
SELECT COUNT(*) as "Number of Stars with over 5 shows born after 2000" FROM greaterThanFive