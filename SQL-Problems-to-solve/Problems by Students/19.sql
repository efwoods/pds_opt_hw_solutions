-- How many movies were released in the year 2019?
WITH movieList as (SELECT title, COUNT(title) as "numberOfMovies" FROM movies
WHERE year = "2019"
GROUP BY title)
SELECT COUNT(*) FROM movieList