-- How many directors are actors?
WITH directorNames as (SELECT name FROM people
INNER JOIN directors 
ON directors.person_id = people.id),
actorNames as (SELECT name FROM people
INNER JOIN stars
ON stars.person_id = people.id),
directorActorList(directorName, actorName) as (SELECT directorNames.name, actorNames.name FROM directorNames
INNER JOIN actorNames
ON directorNames.name = actorNames.name)
SELECT COUNT(DISTINCT directorName) from directorActorList

