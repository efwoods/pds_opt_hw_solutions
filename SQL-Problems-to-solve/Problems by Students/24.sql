-- Which movies have the same director and actor?
WITH directorList as (SELECT * FROM movies
INNER JOIN directors
ON directors.movie_id = movies.id
INNER JOIN people 
ON people.id = directors.person_id ),
actorList as (SELECT * FROM movies
INNER JOIN stars
ON stars.movie_id = movies.id
INNER JOIN people 
ON stars.person_id = people.id),
masterList as (SELECT * FROM actorList
INNER JOIN directorList
ON directorList.movie_id = actorList.movie_id),
table_1 as (SELECT * from directorList
GROUP BY title
ORDER BY name),
table_2 as (SELECT * from directorList
GROUP BY title
ORDER BY name),
moviesWithTheSameDirector as (SELECT title from table_1
WHERE 1< (SELECT COUNT(*) FROM table_2 WHERE table_2.name = table_1.name)),
table_3 as (SELECT * FROM actorList
GROUP BY title
ORDER BY name),
table_4 as (SELECT * FROM actorList
GROUP BY title
ORDER BY name),
moviesWithTheSameActor as (SELECT title from table_3
WHERE 1< (SELECT COUNT(*) FROM table_4 WHERE table_3.name = table_4.name))
SELECT moviesWithTheSameActor.title from moviesWithTheSameActor
INNER JOIN moviesWithTheSameDirector
ON moviesWithTheSameActor.title = moviesWithTheSameDirector.title