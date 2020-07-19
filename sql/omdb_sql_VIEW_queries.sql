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