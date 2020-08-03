--Iteration 7:
--Query Number: 1
--Query Description: Show all movies,  Show NULLs if there is no corresponding movie_data or media or songs or people
--Author: Cougars
SELECT movies.movie_id,
    native_name,
    english_name,
    year_made,
    tag_line,
    language,
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



--Query Number: 2
--Query Description: Give me the list of all movies containing a substring in the Song lyrics
--Author: Kongmeng Lor
SELECT * 
FROM movies
	LEFT OUTER JOIN movie_song ON (movies.movie_id = movie_song.movie_id)
	LEFT OUTER JOIN songs ON (movie_song.song_id = songs.song_id)
WHERE movies.english_name = 'Frozen' AND lyrics LIKE '% snow glows %';



--Query Number: 3
--Query Description: Give me the list all movies in which a person acted as “Leading Actor”
--Author: Misky Abshir
SELECT *
FROM movies
	INNER JOIN movie_people ON (movies.movie_id = movie_people.movie_id)
WHERE role = 'Lead Actor' AND people_id = 2;



--Query Number: 4
--Query Description: Give me a summary of the song count by the “theme”
--Author: Quoc Bui
SELECT COALESCE(NULLIF(songs.theme, ''), '(This is an empty string)') AS theme_name, COUNT(song_id)
FROM songs
GROUP BY theme;



--Query Number: 5
--Query Description: Give me the list of all the movies based on a genre (“genre” is the input)
--Author: Kathy Thao
SELECT * 
FROM movies
	INNER JOIN movie_data ON (movies.movie_id = movie_data.movie_id)
WHERE movie_data.genre = "Animation";



--Iteration 8:
--Query Number: 6
--Query Description: Implement a VIEW called “song_view.” It should capture all the columns that are relevant for a “song”
--Author: Kathy Thao 
CREATE VIEW song_view AS
  SELECT songs.song_id, 
         songs.title, 
         song_media.song_media_id, 
         song_people.people_id,  
         movies.movie_id, 
         movies.english_name, 
         Group_concat(keyword) AS keyword 
  FROM   songs 
         LEFT OUTER JOIN song_media 
                      ON songs.song_id = song_media.song_media_id 
         LEFT OUTER JOIN song_people 
                      ON songs.song_id = song_people.people_id 
         LEFT OUTER JOIN people 
                      ON songs.song_id = people.people_id 
         LEFT OUTER JOIN movies 
                      ON songs.song_id = movies.movie_id 
         LEFT OUTER JOIN song_keywords 
                      ON songs.song_id = song_keywords.song_id 
  GROUP  BY songs.song_id; 

  
  
--Query Number: 7
--Query Description: Implement a VIEW called “movie_view”. It should capture all the columns as shown in the Query 7.33.
--Author: Kongmeng Lor and Quoc Bui
CREATE VIEW movie_view AS
  SELECT 
      movies.movie_id,
      movies.native_name,
      movies.english_name,
      movies.year_made,
      movie_data.tag_line,
      movie_data.language,
      movie_data.country,
      movie_data.genre,
      movie_data.plot,
      GROUP_CONCAT(distinct movie_trivia_name) AS movie_trivia_names,
      GROUP_CONCAT(distinct keyword) AS keywords,
      GROUP_CONCAT(distinct m_link) AS media_link,
      GROUP_CONCAT(distinct m_link_type) AS media_link_type,
      GROUP_CONCAT(distinct title) AS titles,
      GROUP_CONCAT(distinct stage_name),
      movie_numbers.running_time,
      movie_numbers.length,
      movie_numbers.strength,
      movie_numbers.weight,
      movie_numbers.budget,
      movie_numbers.box_office,
      movie_anagrams.anagram
  FROM movies
     LEFT JOIN movie_data ON (movies.movie_id = movie_data.movie_id)
     LEFT JOIN movie_trivia ON (movies.movie_id = movie_trivia.movie_id)
     LEFT JOIN movie_keywords ON (movies.movie_id = movie_keywords.movie_id)
     LEFT JOIN movie_media ON (movies.movie_id = movie_media.movie_id)
     LEFT JOIN movie_song ON (movies.movie_id = movie_song.song_id)
     LEFT JOIN songs ON (movie_song.song_id = songs.song_id)
     LEFT JOIN movie_people ON (movies.movie_id = movie_people.movie_id)
     LEFT JOIN people ON (movie_people.people_id = people.people_id)
     LEFT JOIN movie_numbers ON (movies.movie_id = movie_numbers.movie_id)
     LEFT JOIN movie_anagrams ON (movies.movie_id = movie_anagrams.movie_id)
  GROUP BY movies.movie_id;
  
  

--Query Number: 8
--Query Description: Implement a VIEW called “people_view”. It should capture all the columns that are relevant for a “people”
--Author: Misky Abshir
CREATE VIEW people_view AS
  SELECT people.people_id,
         people.stage_name,
         people_trivia.people_trivia_id,
         movie_people.movie_id,
         movie_people.screen_name,
         movie_people.role,
         movies.native_name,
         movies.english_name,
         movies.year_made,
         song_people.song_id,
         songs.title,
         songs.lyrics,
         Group_concat(keyword) AS keyword
 FROM people
         LEFT OUTER JOIN people_trivia
                      ON people.people_id = people_trivia.people_trivia_id
         LEFT OUTER JOIN movie_people
                      ON people.people_id = movie_people.people_id
         LEFT OUTER JOIN movies
                      ON people.people_id = movies.movie_id
         LEFT OUTER JOIN song_people
                      ON people.people_id = song_people.song_id
         LEFT OUTER JOIN songs
                      ON people.people_id = songs.song_id
         LEFT OUTER JOIN movie_keywords
         			  ON people.people_id=movie_keywords.movie_id
  GROUP BY people.people_id;
  
  
  
--Iteration 9:
--Query Number: 9
--Query Description: Implement the cascade delete feature for the movie and all its week entities.
--Author: Quoc Bui
ALTER TABLE `movie_data` ADD CONSTRAINT `del_mov_casc_data` FOREIGN KEY (`movie_id`) REFERENCES `movies`(`movie_id`) ON DELETE CASCADE;
ALTER TABLE `movie_anagrams` ADD CONSTRAINT `del_mov_casc_anagrams` FOREIGN KEY (`movie_id`) REFERENCES `movies`(`movie_id`) ON DELETE CASCADE;
ALTER TABLE `movie_keywords` ADD CONSTRAINT `del_mov_casc_keywords` FOREIGN KEY (`movie_id`) REFERENCES `movies`(`movie_id`) ON DELETE CASCADE;
ALTER TABLE `movie_media` ADD CONSTRAINT `del_mov_casc_media` FOREIGN KEY (`movie_id`) REFERENCES `movies`(`movie_id`) ON DELETE CASCADE;
ALTER TABLE `movie_numbers` ADD CONSTRAINT `del_mov_casc_numbers` FOREIGN KEY (`movie_id`) REFERENCES `movies`(`movie_id`) ON DELETE CASCADE;
ALTER TABLE `movie_quotes` ADD CONSTRAINT `del_mov_casc_quote` FOREIGN KEY (`movie_id`) REFERENCES `movies`(`movie_id`) ON DELETE CASCADE;



--Query Number: 10
--Query Description: Implement the cascade delete feature for the song and all its week entities.
--Author: Kathy Thao
ALTER TABLE `song_keywords` ADD CONSTRAINT `delete_cascade_to_song_keywords` FOREIGN KEY (`song_id`) REFERENCES `songs`(`song_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `song_media` ADD CONSTRAINT `delete_cascade_to_song_media` FOREIGN KEY (`song_id`) REFERENCES `songs`(`song_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `song_trivia` ADD CONSTRAINT `delete_cascade_to_song_trivia` FOREIGN KEY (`song_id`) REFERENCES `songs`(`song_id`) ON DELETE CASCADE ON UPDATE CASCADE;



--Query Number: 11
--Query Description: Implement the cascade delete feature for the people and all its week entities.
--Author: Kongmeng Lor and Misky Abshir
ALTER TABLE `people_trivia` DROP FOREIGN KEY IF EXISTS `fk_delete_cascade_people`;
ALTER TABLE people_trivia
  ADD CONSTRAINT fk_delete_cascade_people
  FOREIGN KEY (people_id) REFERENCES people(people_id) 
  ON DELETE CASCADE;