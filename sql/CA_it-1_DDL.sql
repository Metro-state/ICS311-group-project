CREATE TABLE movies
    (`name_native` VARCHAR(45), `name_english` VARCHAR(45), `year_made` SMALLINT(4),
    PRIMARY KEY (name_native, year_made))
;
    
INSERT INTO movies
    (`name_native`, `name_english`, `year_made`)
VALUES
    ('Joker', 'Joker', 2019),
    ('Gisaengchung', 'Parasite', 2019),
    ('Knives Out', 'Knives Out', 2019),
    ('1917', '1917', 2019),
    ('The Shawshank Redemption', 'The Shawshank Redemption', 1994),
    ('The Godfather', 'The Godfather', 1972),
    ('The Dark Knight', 'The Dark Knight', 2008),
    ('12 Angry Men', '12 Angry Men', 1957),
    ('Schindler''s List', 'Schindler''s List', 1993),
    ('The Lord of the Rings: The Return of the King', 'The Lord of the Rings: The Return of the King', 2003),
    ('Pulp Fiction', 'Pulp Fiction', 1994),
    ('Forrest Gump', 'Forrest Gump', 1994),
    ('The Matrix', 'The Matrix', 1999),
    ('Star Wars: Episode IV - A New Hope', 'Star Wars: Episode IV - A New Hope', 1977),
    ('Interstellar', 'Interstellar', 2014)
;

--why is this file grey