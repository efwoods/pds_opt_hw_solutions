
-- Which director has directed the most number of highest/lowest rating movies?

--Which director has directed the most number of highest rated movies?
-- WITH table_1 (name, rating) as 
-- 	(SELECT people.name as Director, rating FROM directors, people, ratings
-- 	WHERE directors.person_id = people.id 
-- 	AND directors.movie_id = ratings.movie_id
-- 	ORDER BY rating DESC),
-- 	table_2 (max_rating) as
-- 	(SELECT MAX(rating) FROM directors, people, ratings
-- 	WHERE directors.person_id = people.id 
-- 	AND directors.movie_id = ratings.movie_id
-- 	ORDER BY rating DESC),
-- listOfMovies as (SELECT table_1.name as Director, table_1.rating as Rating FROM table_1, table_2
-- WHERE table_1.rating = table_2.max_rating),
-- listOfDirectors as (SELECT * FROM listOfMovies)
-- SELECT *, COUNT(Director) FROM  listOfDirectors
-- GROUP BY Director
-- ORDER BY COUNT(Director) DESC
-- LIMIT 1

--Which director has directed the most number of lowest rated movies?
WITH table_1 (name, rating) as 
	(SELECT people.name as Director, rating FROM directors, people, ratings
	WHERE directors.person_id = people.id 
	AND directors.movie_id = ratings.movie_id
	ORDER BY rating DESC),
	table_2 (max_rating) as
	(SELECT MIN(rating) FROM directors, people, ratings
	WHERE directors.person_id = people.id 
	AND directors.movie_id = ratings.movie_id
	ORDER BY rating DESC),
listOfMovies as (SELECT table_1.name as Director, table_1.rating as Rating FROM table_1, table_2
WHERE table_1.rating = table_2.max_rating),
listOfDirectors as (SELECT * FROM listOfMovies)
SELECT *, COUNT(Director) FROM  listOfDirectors
GROUP BY Director
ORDER BY COUNT(Director) DESC
LIMIT 1