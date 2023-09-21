SQL Problems to Solve
Problems by Staff (Solutions)
-- How many movie titles start with the word “Miss”? 

SELECT count(*)
  FROM movies
 WHERE title LIKE "Miss %" OR title = "Miss"

-- How many movies feature the late Robin Williams?

--Find Robin Williams
SELECT name, birth FROM people WHERE name = "Robin Williams";

--Oops! There are two! Find the right Robin Williams
SELECT id FROM people WHERE name = "Robin Williams"
        AND birth=1951;

--Find movies with Robin Williams as cast member
SELECT movie_id FROM stars WHERE person_id=
        (SELECT id FROM people WHERE name = "Robin Williams"
         AND birth=1951);

--Find the count of movies
SELECT COUNT(movie_id) FROM stars WHERE person_id=
        (SELECT id FROM people WHERE name = "Robin Williams"
         AND birth=1951);

-- What are the 25 highest-rated movies with at least 100k votes?

SELECT title
  FROM movies
  JOIN ratings ON ratings.movie_id=movies.id
 WHERE ratings.votes >= 100000
 ORDER BY ratings.rating
  DESC LIMIT 25;

-- Which movies has Ron Howard directed, in alphabetical order?
