SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `movies` (
  `movie_id`INT(6) NOT NULL AUTO_INCREMENT,
  `native_name` VARCHAR(45) NOT NULL,
  `year_made` year(4) NOT NULL,
  `english_name` VARCHAR(45) NOT NULL,
   PRIMARY KEY (movie_id)
); 

CREATE TABLE songs ( 
  `songID` INT(10) NOT NULL AUTO_INCREMENT, 
  `song_name` VARCHAR(25) NOT NULL, 
  `lyrics` VARCHAR(40) DEFAULT NULL,
   PRIMARY KEY (songID)
);

CREATE TABLE meta_data ( 
  `language` VARCHAR(25) DEFAULT NULL, 
  `country` VARCHAR(25) DEFAULT NULL, 
  `plot` VARCHAR(25) DEFAULT NULL,
  `genre` VARCHAR(25) DEFAULT NULL, 
  `trivia` VARCHAR(25) DEFAULT NULL, 
  `keywords` VARCHAR(25) DEFAULT NULL
);

CREATE TABLE `people` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `Actor`varchar(64), 
  `Actress` varchar(64), 
  `Lyricist` varchar(64), 
  `Producer` varchar(64), 
  `Director`  varchar(64),
  PRIMARY KEY(id)
);

CREATE TABLE `movie_media` (
  `id` INT(10) NOT NULL AUTO_INCREMENT, 
  `posters` varchar(516) NOT NULL, 
  `photo_stills` varchar(516) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE `releases` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(89) DEFAULT NULL,
  `type` varchar(6) DEFAULT NULL,
  `status` varchar(9) DEFAULT NULL,
  `open_date` varchar(10) DEFAULT NULL,
  `dependency_date` varchar(10) DEFAULT NULL,
  `freeze_date` date DEFAULT NULL,
  `content_date` varchar(10) DEFAULT NULL,
  `rtm_date` varchar(10) DEFAULT NULL,
  `manager` varchar(14) DEFAULT NULL,
  `author` varchar(15) DEFAULT NULL,
  `app_id` varchar(7) DEFAULT NULL,
  `tag` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
