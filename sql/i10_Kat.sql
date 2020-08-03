1. SELECT * 
FROM movies
	INNER JOIN movie_data ON (movies.movie_id = movie_data.movie_id)
WHERE movie_data.genre = "Animation";
2. Before the optimization the movie_data table had to run through the whole table (2 rows) to find the movie genre I was looking for.
3. To optimize my query I indexed the movies.movie_id and movie_data.genre. 
4. After the optimization it only returned 1 row. 