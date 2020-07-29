# Iteration 9
# Part 3
#
# Implement a SQL script to create “people” table as 
# well as all the related “weak” entities 
# (for now, ignore the relations – movie_people and song_people)

# people
INSERT INTO people VALUES
  (10, "Joker", "Kongmeng", "", "Lor", "male", "image file name");
INSERT INTO people VALUES
  (11, "Batman", "Quoc", "Ngoc", "Bui", "male", "image file name");
INSERT INTO people VALUES
  (12, "Wonder woman", "Kat", "", "Thao", "female", "image file name");
INSERT INTO people VALUES
  (13, "Cat woman", "Misky", "", "Abshir", "female", "image file name");

# people_trivia (weak)
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

# movie_people (ignored)
# song_people (ignored)

# drop any existing FK
ALTER TABLE `people_trivia` DROP FOREIGN KEY IF EXISTS `fk_delete_cascade_people`;

# add FK cascade
ALTER TABLE people_trivia
  ADD CONSTRAINT fk_delete_cascade_people
  FOREIGN KEY (people_id) REFERENCES people(people_id) 
  ON DELETE CASCADE;
















