# Kongmeng Lor
# ICS 311 Database Management System
# Iteration 10

# --------------------------------------------
# Part 1
# A query is selected for optimization (and it is not a duplicate of what others in your team selected)
#
# query # 7.40, Hassan ahmed
# --------------------------------------------

# Original Query:
SELECT *
FROM people
natural JOIN song_people
WHERE ( people.people_id = song_people.people_id )


# --------------------------------------------
# Add bulk data for test
# --------------------------------------------

# 1) Remove associating FKS if exist
IF EXISTS (
  SELECT * 
  FROM sys.foreign_keys 
  WHERE object_id = OBJECT_ID(N'dbo.fk_delete_cascade_people')
    AND parent_object_id = OBJECT_ID(N'dbo.people_trivia')
)
  ALTER TABLE people_trivia
    DROP FOREIGN KEY fk_delete_cascade_people;

# 2) alter people table to allow auto incrementation of primary keys
ALTER TABLE people 
  MODIFY people_id INT NOT NULL AUTO_INCREMENT;

# 3) insert existing data
INSERT INTO people (stage_name, first_name, middle_name, last_name, gender, image_name) 
  SELECT stage_name, first_name, middle_name, last_name, gender, image_name 
  FROM people;

INSERT INTO song_people (song_id, people_id, role) 
  SELECT '1001', p.people_id, 'Composer'
  FROM people p LEFT JOIN song_people s ON s.people_id = p.people_id
  WHERE s.people_id IS NULL;

# 4) check data count
SELECT COUNT(*)
FROM people;

# RESULTS: 196,608 Record

# --------------------------------------------
# Part 2
# EXPLAIN numbers are captured before the query optimization
# --------------------------------------------
EXPLAIN
SELECT *
FROM people
natural JOIN song_people
WHERE ( people.people_id = song_people.people_id )

# 1 SIMPLE song_people index NULL PRIMARY 70 NULL 196188 Using index
# 196188 rows were evaluated

# (196608 total, Query took 0.0131 seconds.)

# --------------------------------------------
# Part 3
# Steps to optimize the query are described and these steps are implemented
# --------------------------------------------

SELECT 
  p.people_id,
  p.stage_name,
  p.first_name,
  p.middle_name,
  p.last_name,
  p.gender,
  p.image_name,
  s.song_id,
  s.role
FROM people p 
  INNER JOIN song_people s USING (people_id);

ALTER TABLE people DROP INDEX idx1;
CREATE INDEX idx1 ON people(people_id);

ALTER TABLE song_people DROP INDEX idx1;
CREATE INDEX idx1 ON song_people(people_id);

# (196608 total, Query took 0.0117 seconds.)

# --------------------------------------------
# Part 4
# --------------------------------------------

# 1) Avoided Cartesian Product by switching the comparison from WHERE clause to use INNER JOIN
# 2) REMOVE * from SELECT clause and specify needed fields
# 3) Indexes on attributes that are used