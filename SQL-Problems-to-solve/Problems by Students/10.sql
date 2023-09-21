-- How many movies with ratings over 9.0?
WITH ratingsOverNine as 
	(SELECT movie_id, rating from ratings
	WHERE ratings.rating > 9.0),
	movieList as (SELECT title, rating from movies
	INNER JOIN ratingsOverNine 
	ON ratingsOverNine.movie_id = movies.id)
	SELECT COUNT(DISTINCT title) from movieList