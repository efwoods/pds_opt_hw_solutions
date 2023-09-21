-- How many co-stars does Steve Carrell have on average for his movies? 

-- How many co-stars does George Clooney have on average for his movies? 
WITH clooneyMovies as (SELECT movie_id FROM stars
	WHERE stars.person_id IN
	(SELECT id FROM people
	WHERE name = "George Clooney")),
starsCount as (SELECT title, name, COUNT(title) FROM clooneyMovies
	LEFT JOIN stars
	ON stars.movie_id = clooneyMovies.movie_id
	INNER JOIN movies
	ON movies.id = clooneyMovies.movie_id
	INNER JOIN people
	ON people.id = stars.person_id
	AND NOT stars.person_id IN
	(SELECT id FROM people
	WHERE name = "George Clooney")
	GROUP BY movies.title)
SELECT AVG(3) as "Average Number of Co-Stars for Movies Staring George Clooney" FROM starsCount