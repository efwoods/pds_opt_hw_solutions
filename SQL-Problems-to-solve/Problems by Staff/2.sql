-- how-many-movies-feature-the-late-robin-williams
SELECT title from movies where id in 
(SELECT movie_id from stars where person_id in 
(SELECT id from people where name = "Robin Williams"))