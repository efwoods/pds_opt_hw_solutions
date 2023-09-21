-- What is Steve Carrel’s highest rated movie?
-- SELECT * FROM people
-- WHERE name LIKE "%Carrel%"
-- ORDER BY name
-- Steve Carrel does not exist in this database

--- Find all the stars; reduce to weird al
-- SELECT * FROM people
-- WHERE name in 
-- (SELECT name FROM stars
-- INNER JOIN people
-- ON people.id = stars.person_id
-- ORDER BY name )
-- AND name like "'Weird Al' Yankovic"

-- What is Weird Al' Yankovic's highest rated movie?
SELECT movies.title FROM movies
WHERE movies.id IN
(SELECT movie_id FROM ratings
WHERE ratings.movie_id IN
(SELECT movie_id FROM stars 
WHERE person_id in
(SELECT id FROM people
WHERE name LIKE "'Weird Al' Yankovic"))
ORDER BY rating DESC)
LIMIT 1