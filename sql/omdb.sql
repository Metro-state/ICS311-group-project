SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `movies` (
  `movie_id`INT(6) NOT NULL AUTO_INCREMENT,
  `native_name` VARCHAR(45) NOT NULL,
  `english_name` VARCHAR(45) NOT NULL,
  `year_made` year(4) NOT NULL,
   PRIMARY KEY (movie_id)
); 

CREATE TABLE songs ( 
  `songID` INT(10) NOT NULL AUTO_INCREMENT, 
  `song_name` VARCHAR(25) NOT NULL, 
  `lyrics` VARCHAR(40) DEFAULT NULL,
   PRIMARY KEY (songID)
);

-- M:M Relationship
CREATE TABLE movie_songs (
  `movie_id`INT(6) NOT NULL,
  `songID` INT(10) NOT NULL,
  PRIMARY KEY(movie_id, songID),
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
  FOREIGN KEY (songID) REFERENCES songs(songID)
);


CREATE TABLE meta_data (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `language` VARCHAR(25) DEFAULT NULL, 
  `country` VARCHAR(25) DEFAULT NULL, 
  `plot` VARCHAR(25) DEFAULT NULL,
  `genre` VARCHAR(25) DEFAULT NULL, 
  `trivia` VARCHAR(25) DEFAULT NULL, 
  `keywords` VARCHAR(25) DEFAULT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY (id) REFERENCES movies(movie_id)
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

CREATE TABLE `people_song` (
  `id` INT(10) NOT NULL,
  `songID` INT(10) NOT NULL,
  `role` ENUM ('Lyricist', 'playback singer', 'musician'),
  PRIMARY KEY(id, songID),
  FOREIGN KEY(id) REFERENCES people(id),
  FOREIGN KEY(songID) REFERENCES songs(songID)

);

-- M:M RELATIONSHIP
CREATE TABLE `movie_people` (
  `movie_id`INT(6) NOT NULL,
  `id` INT(10) NOT NULL,
  `role` ENUM ('director', 'producer', 'music directory', 'lead_actor', 'lead_actress', 'supporting_actor', 'supporting_actress'),
  PRIMARY KEY (movie_id, id),
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
  FOREIGN KEY (id) REFERENCES people(id)
);

CREATE TABLE `movie_media` (
  `id` INT(10) NOT NULL AUTO_INCREMENT, 
  `posters` varchar(516) NOT NULL, 
  PRIMARY KEY(id),
  FOREIGN KEY (id) REFERENCES movies(movie_id)
);

CREATE TABLE `movie_stills` (
  `id` INT(6) NOT NUll AUTO_INCREMENT,
  `image` varchar(516) NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(id) REFERENCES movies(movie_id)
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

insert into movies values (1, 'The Lion King', 'The Lion King', 1995);
insert into movies values (2, 'Beauty and the Beast', 'Beauty and the Beast', 1991);
insert into movies values (3, 'Tangled', 'Tangled', 2010);
insert into movies values (4, 'Cinderella', 'Cinderella', 1950);
insert into movies values (5, 'Brave', 'Brave', 2012);
insert into movies values (6, 'Frozen', 'Frozen', 2013);
insert into movies values (7, 'Sleeping Beauty', 'Sleeping Beauty', 1959);
insert into movies values (8, 'Snow White', 'Snow White', 1937);
insert into movies values (9, 'Peter Pan', 'Peter Pan', 1953);
insert into movies values (10, 'The Little Mermaid', 'The Little Mermaid', 1989);
insert into movies values (11, 'Finding Nemo', 'Finding Nemo', 2003);
insert into movies values (12, 'Aladdin', 'Aladdin', 1992);
insert into movies values (13, 'Bambi', 'Bambi', 1942);
insert into movies values (14, 'The Jungle Book', 'The Jungle Book', 1966);
insert into movies values (15, 'Jumbo', 'Jumbo', 1941);
insert into movies values (16, 'Moana', 'Moana', 2016);