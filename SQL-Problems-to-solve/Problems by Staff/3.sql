-- which-movies-has-ron-howard-directed-in
SELECT title FROM movies where id in 
(SELECT movie_id from directors where person_id in 
(SELECT id FROM people where name = "Ron Howard"))
ORDER BY title 