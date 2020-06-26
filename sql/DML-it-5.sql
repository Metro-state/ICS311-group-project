INSERT INTO movie
    (`name_native`, `name_english`, `year_made`)
VALUES
    ('Joker', 'Joker', 2019);

INSERT INTO actor
	(`actorID`, `full_name`)
VALUES
	(0001, 'Joaquin Phoenix'),
	(0002, 'Robert De Niro'),
	(0003, 'Brett Cullen'),
	(0004, 'Glenn Fleshler'),
	(0005, 'Bill Camp'),
	(0006, 'Shea Whigham'),
	(0007, 'Marc Maron')
;

INSERT INTO actress
	(`actressID`, `full_name`)
VALUES
	(0001, 'Zazie Beetz'),
	(0002, 'Frances Conroy')
;

INSERT INTO acts
	(`actorID`, `actressID`, `leads`, `year_made`, `name_native`)
VALUES
	(0001, 0001, TRUE, 2019, 'Joker'),
	(0002, 0002, FALSE, 2019, 'Joker'),
	(0003, NULL, FALSE, 2019, 'Joker'),
	(0004, NULL, FALSE, 2019, 'Joker'),
	(0005, NULL, FALSE, 2019, 'Joker'),
	(0006, NULL, FALSE, 2019, 'Joker'),
	(0007, NULL, FALSE, 2019, 'Joker')
;