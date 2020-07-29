ALTER TABLE `song_keywords` DROP FOREIGN KEY `delete_cascade_to_song_keywords`; ALTER TABLE `song_keywords` ADD CONSTRAINT `delete_cascade_to_song_keywords` FOREIGN KEY (`song_id`) REFERENCES `songs`(`song_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `song_media` DROP FOREIGN KEY `delete_cascade_to_song_media`; ALTER TABLE `song_media` ADD CONSTRAINT `delete_cascade_to_song_media` FOREIGN KEY (`song_id`) REFERENCES `songs`(`song_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `song_trivia` ADD CONSTRAINT `delete_cascade_to_song_trivia` FOREIGN KEY (`song_id`) REFERENCES `songs`(`song_id`) ON DELETE CASCADE ON UPDATE CASCADE;
















