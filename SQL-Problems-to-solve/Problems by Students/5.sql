-- What year did a certain actor/director work on a certain movie?

-- Display the list of movies, directors, and year
-- SELECT title as Movie, name as "Directed By", year as "Year" from directors 
-- LEFT JOIN movies
-- ON directors.movie_id = movies.id
-- LEFT JOIN people 
-- ON people.id = directors.person_id

-- Display the year an actor and director worked on a specific movie
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
				ON people.id = directors.person_id)
SELECT actorsTable.year as Year FROM actorsTable
INNER JOIN directorsTable
ON directorsTable.movieID = actorsTable.movieID
AND actorsTable.actorName = "Meg Ryan"
AND directorsTable.directorName = "James Mangold"
AND actorsTable.movieTitle = "Kate & Leopold"

-- , actorsTable.actorName as "Actor Name", directorsTable.directorName, actorsTable.movieTitle as "Movie Title" 

-- Display the year a director worked on a movie
-- SELECT year as "Year" from directors 
-- LEFT JOIN movies
-- ON directors.movie_id = movies.id
-- LEFT JOIN people 
-- ON people.id = directors.person_id
-- WHERE name = "Germaine Dulac" AND title = "Spanish Fiesta" 

