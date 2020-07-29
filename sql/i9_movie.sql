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

INSERT INTO `movie_people` (`movie_id`, `people_id`, `role`, `screen_name`) VALUES
(1001, 10011, 'Director', ''),
(1001, 10012, 'Producer', ''),
(1001, 10013, 'Lead Actor', ''),
(1001, 10014, 'Lead Actress', ''),
(1001, 10015, 'Lead Actress', ''),
(1001, 10016, 'Lead Actor', ''),
(1001, 10017, 'Lead Actor', ''),
(1001, 10018, 'Lead Actress', ''),
(1001, 10019, 'Lead Actress', ''),
(1001, 100110, 'Music Composer', '');

INSERT INTO `movie_anagrams` (`movie_id`, `anagram`) VALUES
(1001, "Charlotte\'s Web");

INSERT INTO `movie_keywords` (`movie_id`, `keyword`) VALUES
(1001, "pig"),
(1001, "spider"),
(1001, "Charlotte\'s"),

INSERT INTO `movie_numbers` (`movie_id`, `running_time`, `length`, `strength`, `weight`, `budget`, `box_office`) VALUES
(1001, 113, 15, NULL, NULL, 85000000, 150000000);

INSERT INTO `movie_quotes` (`movie_id`, `movie_quote_id`, `movie_quote_name`) VALUES
(1001, 10011, "Charlotte\'s Web");