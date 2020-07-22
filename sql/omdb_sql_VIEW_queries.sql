INSERT INTO `song_media` (`song_media_id`, `s_link`, `s_link_type`, `song_id`) VALUES
(1, 'https://www.youtube.com/watch?v=moSFlvxnbgk', 'video', 1);
INSERT INTO `song_people` (`song_id`, `people_id`, `role`) VALUES
(1, 1, 'Supporting Acto');

CREATE VIEW song_view 
AS 
  SELECT songs.song_id, 
         songs.title, 
         song_media.song_media_id, 
         song_people.people_id, 
         people.id, 
         movies.movie_id, 
         movies.english_name, 
         Group_concat(keyword) AS keyword 
  FROM   songs 
         LEFT OUTER JOIN song_media 
                      ON songs.song_id = song_media.song_media_id 
         LEFT OUTER JOIN song_people 
                      ON songs.song_id = song_people.people_id 
         LEFT OUTER JOIN people 
                      ON songs.song_id = people.id 
         LEFT OUTER JOIN movies 
                      ON songs.song_id = movies.movie_id 
         LEFT OUTER JOIN song_keywords 
                      ON songs.song_id = song_keywords.song_id 
  GROUP  BY songs.song_id; 

CREATE VIEW movie_view 
AS 
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
      movie_numbers.*,
      movie_anagrams.*
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