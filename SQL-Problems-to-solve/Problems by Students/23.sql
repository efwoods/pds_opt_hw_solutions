-- Which movies have both, dwayne johnson and kevin hart?
WITH movieActorList as (SELECT * from people
INNER JOIN stars
ON stars.person_id = people.id
INNER JOIN movies
ON stars.movie_id = movies.id),
kevinHartMovieList as (SELECT * FROM movieActorList 
WHERE name = "Kevin Hart"),
dwayneJohnsonMovieList as (SELECT * FROM movieActorList
WHERE name = "Dwayne Johnson")
SELECT kevinHartMovieList .title FROM kevinHartMovieList 
INNER JOIN dwayneJohnsonMovieList
ON kevinHartMovieList.title = dwayneJohnsonMovieList.title
