-- Rank from highest to lowest the number of movies that came out by year?
SELECT year, COUNT(year) FROM movies
GROUP BY year
ORDER BY COUNT(year) DESC