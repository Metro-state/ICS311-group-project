# iteration 9
# part 4
# Implement a SQL scripts to create the relationship between 
# movie, song, and people (to the entiries you created in 1,2, and 3)

# movie and people relationship (DONE in i9_movie.sql)

# movie and song relationship
INSERT INTO movie_song VALUES
(1001, 1001);

# song and people relationship
INSERT INTO song_people VALUES
(1001, 10, 'Composer'), 
(1002, 11, 'Composer'),
(1003, 12, 'Composer'),
(1004, 13, 'Composer');

