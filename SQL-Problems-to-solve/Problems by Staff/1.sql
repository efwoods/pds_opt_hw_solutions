-- How-many-movie-titles-start-with-the-word-miss
-- SELECT COUNT(*) FROM movies where title like "Miss %"
SELECT COUNT(*) 
FROM movies 
WHERE title LIKE "Miss %" OR title = "Miss"