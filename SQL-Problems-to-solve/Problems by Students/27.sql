-- Which directors did Steve Carell work with? (Steve Carrel is not found in the db)
-- Which directors did George Clooney work with? (Steve Carrel is not found in the db)
WITH clooneyMovies as (SELECT movie_id FROM stars
	WHERE stars.person_id IN
	(SELECT id FROM people
	WHERE name = "George Clooney")),
	directorCount as (SELECT name FROM clooneyMovies
	INNER JOIN directors
	ON directors.movie_id = clooneyMovies.movie_id
	INNER JOIN movies
	ON movies.id = clooneyMovies.movie_id
	INNER JOIN people
	ON people.id = directors.person_id)
SELECT DISTINCT name FROM directorCount