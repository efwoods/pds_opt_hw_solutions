WITH table_1 (name, rating) as 
	(SELECT movies.title as MovieTitle, rating FROM movies, people, ratings
	WHERE movies.id = ratings.movie_id
	ORDER BY rating DESC),
	table_2 (max_rating) as
	(SELECT MIN(rating) FROM directors, people, ratings
	WHERE directors.person_id = people.id 
	AND directors.movie_id = ratings.movie_id
	ORDER BY rating DESC),
listOfMovies as (SELECT table_1.name as MovieTitles, table_1.rating as Rating FROM table_1, table_2
WHERE table_1.rating = table_2.max_rating)
SELECT * FROM listOfMovies
ORDER BY rating
LIMIT 1