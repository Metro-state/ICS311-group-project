INSERT INTO movies VALUES (1002, 'Frozen', 'Frozen', 1995);
INSERT INTO songs VALUES (2, 'Let it go', 'Let it Go', 'The snow glows white on the mountain tonight. Not a footprint to be seen');
INSERT INTO movie_song VALUES (1002, 2);
INSERT INTO movie_trivia VALUES (1002, 1, 'Blob');
INSERT INTO movie_trivia VALUES (1002, 2, 'Blob 2');
INSERT INTO movie_trivia VALUES (1001, 3, 'Blob 2');
INSERT INTO movie_keywords VALUES (1002, 'let it go');
INSERT INTO movie_keywords VALUES (1002, 'disney');
INSERT INTO movie_keywords VALUES (1002, 'anna');
INSERT INTO movie_media VALUES (1, 'something1.jpeg', 'poster', 1002);
INSERT INTO movie_media VALUES (2, 'something2.jpeg', 'poster', 1002);
INSERT INTO movie_media VALUES (3, 'something3.jpeg', 'poster', 1002);
INSERT INTO movie_media VALUES (4, 'something4.jpeg', 'poster', 1002);
INSERT INTO movie_people VALUES (1002, 1, 'Directory', '');
INSERT INTO movie_people VALUES (1002, 2, 'Lead Actor', '');

-- Query 7.33
SELECT movies.movie_id,
    native_name,
    english_name,
    year_made,
    tag_line,
    LANGUAGE,
    country,
    genre,
    plot,
    (SELECT  COUNT(*)
    FROM movie_trivia
    WHERE movie_id = movies.movie_id
    ) AS movie_trivia_count,
    (SELECT  COUNT(*)
    FROM movie_keywords
    WHERE movie_id = movies.movie_id
    ) AS movie_keyword_count,
    (SELECT COUNT(*)
    FROM movie_media
    WHERE movie_id = movies.movie_id
    ) AS movie_media_count,
    (SELECT COUNT(*)
    FROM songs
        LEFT OUTER JOIN movie_song ON (songs.song_id = movie_song.song_id)
    WHERE movie_song.movie_id = movies.movie_id
    ) AS movie_song_count,
    (SELECT COUNT(*)
    FROM people
        LEFT OUTER JOIN movie_people ON (people.people_id = movie_people.people_id)
    WHERE movies.movie_id = movie_people.movie_id
    ) AS movie_people_count
FROM movies
    LEFT OUTER JOIN movie_data ON (movies.movie_id = movie_data.movie_id)
WHERE movies.movie_id = 1002;
-- Query 7.37
SELECT * 
FROM movies
	LEFT OUTER JOIN movie_song ON (movies.movie_id = movie_song.movie_id)
	LEFT OUTER JOIN songs ON (movie_song.song_id = songs.song_id)
WHERE movies.english_name = 'Frozen' AND lyrics LIKE '% snow glows %';
-- Query 7.55 
SELECT * 
FROM movies
	INNER JOIN movie_data ON (movies.movie_id = movie_data.movie_id)
WHERE movie_data.genre = "Animation";
