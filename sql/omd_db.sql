 CREATE TABLE year (
    `year_made` SMALLINT(4),
    PRIMARY KEY (year_made)
);

 --Probably split trivia into a seperate entitie
CREATE TABLE movie (
    `year_made` SMALLINT(4) NOT NULL,
    `name_native` VARCHAR(45) NOT NULL, 
    `name_english` VARCHAR(45), 
    `plot` text,
    `trivia` text,
    PRIMARY KEY (name_native),
    FOREIGN KEY (year_made) REFERENCES year(year_made)
);

CREATE TABLE actor (
    actorID INT(10) PRIMARY KEY,
    full_name VARCHAR(25)
);

CREATE TABLE actress (
    actressID INT(10) PRIMARY KEY,
    full_name VARCHAR(25)
);

CREATE TABLE photo (
    photoID INT(10) PRIMARY KEY,
    photo BLOB
);

CREATE TABLE song (
    songID INT(10),
    song_name VARCHAR(25),
    lyrics text
);

--Will contain null on either actress or actor when # of each is not semetrical
CREATE TABLE acts (
    actorID INT(10),
    actressID INT(10),
    leads BOOLEAN,
    year_made SMALLINT(4) NOT NULL,
    name_native VARCHAR(45) NOT NULL,
    FOREIGN KEY (actorID) REFERENCES actor(actorID),
    FOREIGN KEY (actressID) REFERENCES actress(actressID),
    FOREIGN KEY (year_made) REFERENCES movie(year_made),
    FOREIGN KEY (name_native) REFERENCES movie(name_native),
    CONSTRAINT lead_acts_chk CHECK (leads IN (1,0,TRUE,FALSE))
);

--Probable alternitive to split relationship table acts
CREATE TABLE male_acts (
    actorID INT(10) NOT NULL,
    actressID INT(10) NOT NULL,
    year_made SMALLINT(4) NOT NULL,
    name_native VARCHAR(45) NOT NULL,
    FOREIGN KEY (actorID) REFERENCES actor(actorID),
    FOREIGN KEY (year_made) REFERENCES movie(year_made),
    FOREIGN KEY (name_native) REFERENCES movie(name_native)
);

CREATE TABLE female_acts (
    actorID INT(10) NOT NULL,
    actressID INT(10) NOT NULL,
    year_made SMALLINT(4) NOT NULL,
    name_native VARCHAR(45) NOT NULL,
    FOREIGN KEY (actressID) REFERENCES actress(actressID),
    FOREIGN KEY (year_made) REFERENCES movie(year_made),
    FOREIGN KEY (name_native) REFERENCES movie(name_native)
);