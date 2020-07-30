--SQL codes for adding sample data and implementing cascade delete for the movie:
INSERT INTO `movies` (`movie_id`, `native_name`, `english_name`, `year_made`) VALUES
(1001, 'Charlotte\'s Web', 'Charlotte\'s Web', 2006);

INSERT INTO `movie_data` (`tag_line`, `movie_id`, `language`, `country`, `genre`, `plot`) VALUES
('', 1001, 'English', 'United States', 'animation', 'After learning that a young pig\'s days are numbered, a literate spider (Julia Roberts) weaves an elaborate plan to save her friend from the butcher\'s block.');

INSERT INTO `movie_media` (`movie_media_id`, `m_link`, `m_link_type`, `movie_id`) VALUES
(10011, 'charlotteWeb_poster1.jpg', 'poster', 1001),
(10012, 'charlotteWeb_poster2.jpg', 'poster', 1001),
(10013, 'charlotteWeb_poster3.jpg', 'poster', 1001),
(10014, 'https://www.youtube.com/watch?v=zS3qOr0zAJg', 'video', 1001);

INSERT INTO `movie_trivia` (`movie_id`, `movie_trivia_id`, `movie_trivia_name`) VALUES
(1001, 10011, "There were 47 Wilburs on set because the piglets grew up so fast. Also, each one was taught only one \"trick\", like to stare up or to walk a certain distance."),
(1001, 10012, "For security reasons, early prints of the film were shipped under the title \"Bacon\".");

INSERT INTO `movie_anagrams` (`movie_id`, `anagram`) VALUES
(1001, "Charlotte\'s Web");

INSERT INTO `movie_keywords` (`movie_id`, `keyword`) VALUES
(1001, "pig"),
(1001, "spider"),
(1001, "Charlotte\'s");

INSERT INTO `movie_numbers` (`movie_id`, `running_time`, `length`, `strength`, `weight`, `budget`, `box_office`) VALUES
(1001, 113, 15, NULL, NULL, 85000000, 150000000);

INSERT INTO `movie_quotes` (`movie_id`, `movie_quote_id`, `movie_quote_name`) VALUES
(1001, 10011, "Charlotte\'s Web");

ALTER TABLE `movie_data` ADD CONSTRAINT `del_mov_casc_data` FOREIGN KEY (`movie_id`) REFERENCES `movies`(`movie_id`) ON DELETE CASCADE;
ALTER TABLE `movie_anagrams` ADD CONSTRAINT `del_mov_casc_anagrams` FOREIGN KEY (`movie_id`) REFERENCES `movies`(`movie_id`) ON DELETE CASCADE;
ALTER TABLE `movie_keywords` ADD CONSTRAINT `del_mov_casc_keywords` FOREIGN KEY (`movie_id`) REFERENCES `movies`(`movie_id`) ON DELETE CASCADE;
ALTER TABLE `movie_media` ADD CONSTRAINT `del_mov_casc_media` FOREIGN KEY (`movie_id`) REFERENCES `movies`(`movie_id`) ON DELETE CASCADE;
ALTER TABLE `movie_numbers` ADD CONSTRAINT `del_mov_casc_numbers` FOREIGN KEY (`movie_id`) REFERENCES `movies`(`movie_id`) ON DELETE CASCADE;
ALTER TABLE `movie_quotes` ADD CONSTRAINT `del_mov_casc_quote` FOREIGN KEY (`movie_id`) REFERENCES `movies`(`movie_id`) ON DELETE CASCADE;


--SQL codes for adding sample data and implementing cascade delete for the song:
ALTER TABLE `song_keywords` ADD CONSTRAINT `delete_cascade_to_song_keywords` FOREIGN KEY (`song_id`) REFERENCES `songs`(`song_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `song_media` ADD CONSTRAINT `delete_cascade_to_song_media` FOREIGN KEY (`song_id`) REFERENCES `songs`(`song_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `song_trivia` ADD CONSTRAINT `delete_cascade_to_song_trivia` FOREIGN KEY (`song_id`) REFERENCES `songs`(`song_id`) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO `songs` (`song_id`, `title`, `lyrics`, `theme`) VALUES 
(1001, 'Soundtrack Suite', 'none', ''),
(1002, 'Soundtrack Suite', 'none', ''),
(1003, 'Soundtrack Suite', 'none', ''),
(1004, 'Soundtrack Suite', 'none', '');

INSERT INTO `song_media` (`song_media_id`, `s_link`, `s_link_type`, `song_id`) VALUES
(101, 'https://www.youtube.com/watch?v=Txvgd60hLPk', 'youtube vi', 1001),
(102, 'https://www.youtube.com/watch?v=Txvgd60hLPk', 'youtube vi', 1001),
(103, 'https://www.youtube.com/watch?v=Txvgd60hLPk', 'youtube vi', 1001),
(104, 'https://www.youtube.com/watch?v=Txvgd60hLPk', 'youtube vi', 1001);

INSERT INTO `song_keywords` (`song_id`, `keyword`) VALUES
(1001, 'orchestra'),
(1002, 'orchestra'),
(1003, 'orchestra'),
(1004, 'orchestra');

INSERT INTO `song_trivia` (`song_id`, `song_trivia_id`, `song_trivia_name`) VALUES
(1001, 1, 'Who sings \"Let it Go\"? '),
(1002, 2, 'Where was \"Shut up and drive\" played in the movie?'),
(1003, 3, 'Who sings \"Let it Go\"? '),
(1004, 4, 'Where was \"Shut up and drive\" played in the movie?');

--SQL codes for adding sample data and implementing cascade delete for the people:

-- Iteration 9
-- Part 3
--
-- Implement a SQL script to create “people” table as 
-- well as all the related “weak” entities 
-- (for now, ignore the relations – movie_people and song_people)

-- people
INSERT INTO people VALUES
  (10, "Joker", "Kongmeng", "", "Lor", "male", "image file name");
INSERT INTO people VALUES
  (11, "Batman", "Quoc", "Ngoc", "Bui", "male", "image file name");
INSERT INTO people VALUES
  (12, "Wonder woman", "Kat", "", "Thao", "female", "image file name");
INSERT INTO people VALUES
  (13, "Cat woman", "Misky", "", "Abshir", "female", "image file name");

-- people_trivia (weak)
INSERT INTO people_trivia VALUES
  (10, 1, "HAHAHA");
INSERT INTO people_trivia VALUES
  (10, 2, "WAHAHAHAHA");
INSERT INTO people_trivia VALUES
  (11, 3, "BAT");
INSERT INTO people_trivia VALUES
  (11, 4, "Dark");
INSERT INTO people_trivia VALUES
  (12, 5, "Whip");
INSERT INTO people_trivia VALUES
  (12, 6, "Amazonian");
INSERT INTO people_trivia VALUES
  (13, 7, "meow");
INSERT INTO people_trivia VALUES
  (13, 8, "thief");

-- movie_people (ignored)
-- song_people (ignored)

-- drop any existing FK
ALTER TABLE `people_trivia` DROP FOREIGN KEY IF EXISTS `fk_delete_cascade_people`;

-- add FK cascade
ALTER TABLE people_trivia
  ADD CONSTRAINT fk_delete_cascade_people
  FOREIGN KEY (people_id) REFERENCES people(people_id) 
  ON DELETE CASCADE;
  
-- iteration 9
-- part 4
-- Implement a SQL scripts to create the relationship between 
-- movie, song, and people (to the entiries you created in 1,2, and 3)

-- movie and people relationship (DONE in i9_movie.sql)

-- movie and song relationship
INSERT INTO movie_song (`movie_id`, `song_id`) VALUES
(1001, 1001);

-- song and people relationship
INSERT INTO song_people (`song_id`, `people_id`, `role`) VALUES
(1001, 10, 'Composer'), 
(1002, 11, 'Composer'),
(1003, 12, 'Composer'),
(1004, 13, 'Composer'); 

-- movie and people relationship
INSERT INTO movie_people (`movie_id`, `people_id`, `role`, `screen_name`) VALUES
(1001, 10, "Director", ""),
(1001, 11, "Producer", ""),
(1001, 12, "Lead Actor", ""),
(1001, 13, "Music Composer", "");
