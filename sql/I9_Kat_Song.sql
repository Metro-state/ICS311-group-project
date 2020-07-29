ALTER TABLE `song_keywords` DROP FOREIGN KEY `delete_cascade_to_song_keywords`; ALTER TABLE `song_keywords` ADD CONSTRAINT `delete_cascade_to_song_keywords` FOREIGN KEY (`song_id`) REFERENCES `songs`(`song_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `song_media` DROP FOREIGN KEY `delete_cascade_to_song_media`; ALTER TABLE `song_media` ADD CONSTRAINT `delete_cascade_to_song_media` FOREIGN KEY (`song_id`) REFERENCES `songs`(`song_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `song_trivia` ADD CONSTRAINT `delete_cascade_to_song_trivia` FOREIGN KEY (`song_id`) REFERENCES `songs`(`song_id`) ON DELETE CASCADE ON UPDATE CASCADE;




INSERT INTO `song_media` (`song_media_id`, `s_link`, `s_link_type`, `song_id`) VALUES
(101, 'https://www.youtube.com/watch?v=Txvgd60hLPk', 'youtube vi', 1001);
(101, 'https://www.youtube.com/watch?v=Txvgd60hLPk', 'youtube vi', 1001);
(101, 'https://www.youtube.com/watch?v=Txvgd60hLPk', 'youtube vi', 1001);
(101, 'https://www.youtube.com/watch?v=Txvgd60hLPk', 'youtube vi', 1001);

INSERT INTO `song_keywords` (`song_id`, `keyword`) VALUES
(1001, 'orchestra');
(1001, 'orchestra');
(1001, 'orchestra');
(1001, 'orchestra');

INSERT INTO `songs` (`song_id`, `title`, `lyrics`, `theme`) VALUES
(1001, 'Soundtrack Suite', 'none', '');
(1001, 'Soundtrack Suite', 'none', '');
(1001, 'Soundtrack Suite', 'none', '');
(1001, 'Soundtrack Suite', 'none', '');

INSERT INTO `song_trivia` (`song_id`, `song_trivia_id`, `song_trivia_name`) VALUES
(1001, 1, 'Who sings \"Let it Go\"? '),
(1001, 2, 'Where was \"Shut up and drive\" played in the movie?');
(1001, 1, 'Who sings \"Let it Go\"? '),
(1001, 2, 'Where was \"Shut up and drive\" played in the movie?');






