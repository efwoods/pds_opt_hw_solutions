-- What is the average movie rating for a each star
SELECT *, AVG(rating) FROM stars
INNER JOIN movies
ON movies.id = stars.movie_id
INNER JOIN ratings
ON movies.id = ratings.movie_id
INNER JOIN people
ON people.id = stars.person_id
GROUP BY people.name