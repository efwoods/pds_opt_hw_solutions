-- How many movies  had people that both directed and had a role in a move?

WITH directorNames as (SELECT name FROM people
INNER JOIN directors 
ON directors.person_id = people.id),
actorNames as (SELECT name FROM people
INNER JOIN stars
ON stars.person_id = people.id),
directorActorList(directorName, actorName) as (SELECT directorNames.name, actorNames.name FROM directorNames
INNER JOIN actorNames
ON directorNames.name = actorNames.name),
individualActors as (SELECT DISTINCT directorName from directorActorList),
individualActorID as (SELECT id, name, birth FROM people
WHERE people.name in individualActors),
numberOfMovies as (SELECT *, COUNT(title) as titleCount FROM directors
INNER JOIN individualActorID
ON individualActorID.id = directors.person_id
INNER JOIN movies
ON movies.id = directors.movie_id
GROUP BY title
ORDER BY COUNT(title) DESC ) 
SELECT SUM(numberOfMovies.titleCount) FROM numberOfMovies