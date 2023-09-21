-- How many stars have all their shows with ratings over 7.5?

SELECT COUNT(people.name) FROM people
WHERE people.id IN
(SELECT person_id FROM stars
WHERE stars.movie_id in 
(SELECT movie_id FROM ratings 
WHERE ratings.rating > 7.5))
