-- What actor/director team has the most ratings over 9.0?
WITH actorsTable(movieID, year, movieTitle, actorName) as (
				SELECT stars.movie_id, year, title, name as "Actor" from stars 
				LEFT JOIN movies 
				ON stars.movie_id = movies.id
				LEFT JOIN people
				ON people.id = stars.person_id),
			directorsTable (movieID, movieTitle, directorName, year) as (
				SELECT movie_id, title, name, year from directors 
				LEFT JOIN movies
				ON directors.movie_id = movies.id
				LEFT JOIN people 
				ON people.id = directors.person_id),
			ratingsTable as (
				SELECT movie_id, rating FROM ratings)
SELECT actorsTable.actorName, directorsTable.directorName, ratingsTable.rating, COUNT(directorsTable.directorName) FROM actorsTable
INNER JOIN directorsTable
ON directorsTable.movieID = actorsTable.movieID
INNER JOIN ratingsTable
ON ratingsTable.movie_id = actorsTable.movieID
AND ratingsTable.rating > 9
AND actorsTable.actorName NOT NULL
GROUP BY actorsTable.actorName, directorsTable.directorName
ORDER BY COUNT(directorsTable.directorName) DESC