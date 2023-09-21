-- Which director has the highest rating? 
WITH table_1 (name, rating) as 
	(SELECT people.name as Director, rating FROM directors, people, ratings
	WHERE directors.person_id = people.id 
	AND directors.movie_id = ratings.movie_id
	ORDER BY rating DESC),
	table_2 (max_rating) as
	(SELECT MAX(rating) FROM directors, people, ratings
	WHERE directors.person_id = people.id 
	AND directors.movie_id = ratings.movie_id
	ORDER BY rating DESC)
SELECT table_1.name as Director, table_1.rating as Rating FROM table_1, table_2
WHERE table_1.rating = table_2.max_rating


-- SELECT people.name as Director, movies.title as Movie, ratings.rating as Rating FROM movies
-- LEFT JOIN directors, 
-- ON movies.id = directors.movie_id
-- LEFT JOIN ratings
-- ON ratings.movie_id = movies.id
-- LEFT JOIN people
-- ON people.id = directors.person_id

