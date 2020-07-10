-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2020 at 02:59 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- What changes need to be done to upgrade to V.2?
-- 1. Change "screen_name" to "stage_name" in people  
-- 2. Add "screen_name" to "movie_people"
-- 3. Create a new table for "movie_quotes"
-- 4. Create a new table for "people_trivia"
-- 5. Create a new table for "song_trivia"
-- 6. Add new column called 'tag_line' to movie_data
-- 7. Add new column called "theme" to songs
--
-- Database: `omdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movie_id` int(6) NOT NULL,
  `native_name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `english_name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_made` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `native_name`, `english_name`, `year_made`) VALUES
(1, 'Citizen Kane', 'Citizen Kane', 1941),
(2, 'Vertigo', 'Vertigo', 1958),
(3, '2001: A Space Odyssey', '2001: A Space Odyssey', 1968),
(4, 'Rules of the Game, The', 'Rules of the Game, The', 1939),
(5, 'Tokyo Story', 'Tokyo Story', 1953),
(6, '8?', '8?', 1963),
(7, 'Godfather, The', 'Godfather, The', 1972),
(8, 'Sunrise', 'Sunrise', 1927),
(9, 'Searchers, The', 'Searchers, The', 1956),
(10, 'Seven Samurai', 'Seven Samurai', 1954),
(11, 'Apocalypse Now', 'Apocalypse Now', 1979),
(12, 'Singin\' in the Rain', 'Singin\' in the Rain', 1952),
(13, 'Bicycle Thieves', 'Bicycle Thieves', 1948),
(14, 'Taxi Driver', 'Taxi Driver', 1976),
(15, 'Battleship Potemkin', 'Battleship Potemkin', 1925),
(16, 'Breathless', 'Breathless', 1960),
(17, 'Passion of Joan of Arc, The', 'Passion of Joan of Arc, The', 1928),
(18, 'Atalante, L\'', 'Atalante, L\'', 1934),
(19, 'Persona', 'Persona', 1966),
(20, 'Man with a Movie Camera, The', 'Man with a Movie Camera, The', 1929),
(21, 'Rashomon', 'Rashomon', 1950),
(22, '400 Blows, The', '400 Blows, The', 1959),
(23, 'Psycho', 'Psycho', 1960),
(24, 'Godfather Part II, The', 'Godfather Part II, The', 1974),
(25, 'Raging Bull', 'Raging Bull', 1980),
(26, 'Some Like it Hot', 'Some Like it Hot', 1959),
(27, 'Andrei Rublev', 'Andrei Rublev', 1966),
(28, 'City Lights', 'City Lights', 1931),
(29, 'Dolce vita, La', 'Dolce vita, La', 1960),
(30, 'Mirror, The', 'Mirror, The', 1975),
(31, 'Touch of Evil', 'Touch of Evil', 1958),
(32, 'Ordet', 'Ordet', 1955),
(33, 'Lawrence of Arabia', 'Lawrence of Arabia', 1962),
(34, 'Au hasard Balthazar', 'Au hasard Balthazar', 1966),
(35, 'Sunset Blvd.', 'Sunset Blvd.', 1950),
(36, 'Casablanca', 'Casablanca', 1942),
(37, 'Blade Runner', 'Blade Runner', 1982),
(38, 'Avventura, L\'', 'Avventura, L\'', 1960),
(39, 'Contempt', 'Contempt', 1963),
(40, 'General, The', 'General, The', 1926),
(41, 'Rear Window', 'Rear Window', 1954),
(42, 'In the Mood for Love', 'In the Mood for Love', 2000),
(43, 'Night of the Hunter, The', 'Night of the Hunter, The', 1955),
(44, 'Grande illusion, La', 'Grande illusion, La', 1937),
(45, 'Third Man, The', 'Third Man, The', 1949),
(46, 'Ugetsu monogatari', 'Ugetsu monogatari', 1953),
(47, 'Playtime', 'Playtime', 1967),
(48, 'Modern Times', 'Modern Times', 1936),
(49, 'Dr. Strangelove or: How I Learned to Sto', 'Dr. Strangelove or: How I Learned to Sto', 1964),
(50, 'Fanny and Alexander', 'Fanny and Alexander', 1982),
(51, 'Stalker', 'Stalker', 1979),
(52, 'Chinatown', 'Chinatown', 1974),
(53, 'Barry Lyndon', 'Barry Lyndon', 1975),
(54, 'Mulholland Dr.', 'Mulholland Dr.', 2001),
(55, 'Pather Panchali', 'Pather Panchali', 1955),
(56, 'Apartment, The', 'Apartment, The', 1960),
(57, 'Rio Bravo', 'Rio Bravo', 1959),
(58, 'M', 'M', 1931),
(59, 'North by Northwest', 'North by Northwest', 1959),
(60, 'Metropolis', 'Metropolis', 1927),
(61, 'Wild Strawberries', 'Wild Strawberries', 1957),
(62, 'Enfants du paradis, Les', 'Enfants du paradis, Les', 1945),
(63, 'Viridiana', 'Viridiana', 1961),
(64, 'Pierrot le fou', 'Pierrot le fou', 1965),
(65, 'Strada, La', 'Strada, La', 1954),
(66, 'Shoah', 'Shoah', 1985),
(67, 'Wild Bunch, The', 'Wild Bunch, The', 1969),
(68, 'Once Upon a Time in the West', 'Once Upon a Time in the West', 1968),
(69, 'Seventh Seal, The', 'Seventh Seal, The', 1957),
(70, 'GoodFellas', 'GoodFellas', 1990),
(71, 'Amarcord', 'Amarcord', 1973),
(72, 'Pulp Fiction', 'Pulp Fiction', 1994),
(73, 'Battle of Algiers, The', 'Battle of Algiers, The', 1966),
(74, 'Leopard, The', 'Leopard, The', 1963),
(75, 'Voyage in Italy', 'Voyage in Italy', 1953),
(76, 'Gold Rush, The', 'Gold Rush, The', 1925),
(77, 'Magnificent Ambersons, The', 'Magnificent Ambersons, The', 1942),
(78, 'Late Spring', 'Late Spring', 1949),
(79, 'Pickpocket', 'Pickpocket', 1959),
(80, 'Clockwork Orange, A', 'Clockwork Orange, A', 1971),
(81, 'It\'s a Wonderful Life', 'It\'s a Wonderful Life', 1946),
(82, 'Close-Up', 'Close-Up', 1990),
(83, 'Jules et Jim', 'Jules et Jim', 1962),
(84, 'Jeanne Dielman, 23 Quai du Commerce, 108', 'Jeanne Dielman, 23 Quai du Commerce, 108', 1975),
(85, 'Blue Velvet', 'Blue Velvet', 1986),
(86, 'Conformist, The', 'Conformist, The', 1970),
(87, 'Nashville', 'Nashville', 1975),
(88, 'Annie Hall', 'Annie Hall', 1977),
(89, 'Gertrud', 'Gertrud', 1964),
(90, 'Man Escaped, A', 'Man Escaped, A', 1956),
(91, 'Shining, The', 'Shining, The', 1980),
(92, 'Jaws', 'Jaws', 1975),
(93, 'Sansho the Bailiff', 'Sansho the Bailiff', 1954),
(94, 'Woman Under the Influence, A', 'Woman Under the Influence, A', 1974),
(95, 'Man Who Shot Liberty Valance, The', 'Man Who Shot Liberty Valance, The', 1962),
(96, 'Greed', 'Greed', 1924),
(97, 'Sans soleil', 'Sans soleil', 1983),
(98, 'Last Year at Marienbad', 'Last Year at Marienbad', 1961),
(99, 'Blow-Up', 'Blow-Up', 1966),
(100, 'Once Upon a Time in America', 'Once Upon a Time in America', 1984),
(101, 'Aguirre: The Wrath of God', 'Aguirre: The Wrath of God', 1972),
(102, 'To Be or Not to Be', 'To Be or Not to Be', 1942),
(103, 'Mother and the Whore, The', 'Mother and the Whore, The', 1973),
(104, 'Spirit of the Beehive, The', 'Spirit of the Beehive, The', 1973),
(105, 'Wizard of Oz, The', 'Wizard of Oz, The', 1939),
(106, 'Intolerance', 'Intolerance', 1916),
(107, 'Gone with the Wind', 'Gone with the Wind', 1939),
(108, 'S?t?ntang?', 'S?t?ntang?', 1994),
(109, 'Eclisse, L\'', 'Eclisse, L\'', 1962),
(110, 'Hiroshima mon amour', 'Hiroshima mon amour', 1959),
(111, 'Alien', 'Alien', 1979),
(112, 'Ikiru', 'Ikiru', 1952),
(113, 'Sherlock Jr.', 'Sherlock Jr.', 1924),
(114, 'Jet?e, La', 'Jet?e, La', 1962),
(115, 'Manhattan', 'Manhattan', 1979),
(116, 'Star Wars', 'Star Wars', 1977),
(117, 'E.T. The Extra-Terrestrial', 'E.T. The Extra-Terrestrial', 1982),
(118, 'Beau travail', 'Beau travail', 1999),
(119, 'Nosferatu', 'Nosferatu', 1922),
(120, 'One Flew Over the Cuckoo\'s Nest', 'One Flew Over the Cuckoo\'s Nest', 1975),
(121, 'Brighter Summer Day, A', 'Brighter Summer Day, A', 1991),
(122, 'Madame de...', 'Madame de...', 1953),
(123, 'Yi yi', 'Yi yi', 2000),
(124, 'All About Eve', 'All About Eve', 1950),
(125, 'Bringing Up Baby', 'Bringing Up Baby', 1938),
(126, 'Letter from an Unknown Woman', 'Letter from an Unknown Woman', 1948),
(127, 'Don\'t Look Now', 'Don\'t Look Now', 1973),
(128, 'My Darling Clementine', 'My Darling Clementine', 1946),
(129, 'Rome, Open City', 'Rome, Open City', 1945),
(130, 'Olvidados, Los', 'Olvidados, Los', 1950),
(131, 'Partie de campagne', 'Partie de campagne', 1936),
(132, 'Badlands', 'Badlands', 1973),
(133, 'Vivre sa vie', 'Vivre sa vie', 1962),
(134, 'Rosemary\'s Baby', 'Rosemary\'s Baby', 1968),
(135, 'Notorious', 'Notorious', 1946),
(136, 'Stagecoach', 'Stagecoach', 1939),
(137, 'Do the Right Thing', 'Do the Right Thing', 1989),
(138, 'Chien andalou, Un', 'Chien andalou, Un', 1928),
(139, 'Good, the Bad and the Ugly, The', 'Good, the Bad and the Ugly, The', 1966),
(140, '?ge d\'or, L\'', '?ge d\'or, L\'', 1930),
(141, 'Ali: Fear Eats the Soul', 'Ali: Fear Eats the Soul', 1974),
(142, 'His Girl Friday', 'His Girl Friday', 1940),
(143, 'Lady Eve, The', 'Lady Eve, The', 1941),
(144, 'Passenger, The', 'Passenger, The', 1975),
(145, 'Duck Soup', 'Duck Soup', 1933),
(146, 'Gospel According to St. Matthew, The', 'Gospel According to St. Matthew, The', 1964),
(147, 'Matter of Life and Death, A', 'Matter of Life and Death, A', 1946),
(148, 'Double Indemnity', 'Double Indemnity', 1944),
(149, 'Trouble in Paradise', 'Trouble in Paradise', 1932),
(150, 'Come and See', 'Come and See', 1985),
(151, 'Spring in a Small Town', 'Spring in a Small Town', 1948),
(152, 'Brief Encounter', 'Brief Encounter', 1945),
(153, 'On the Waterfront', 'On the Waterfront', 1954),
(154, 'Conversation, The', 'Conversation, The', 1974),
(155, 'Days of Heaven', 'Days of Heaven', 1978),
(156, 'Histoire(s) du cin?ma', 'Histoire(s) du cin?ma', 1998),
(157, 'Exterminating Angel, The', 'Exterminating Angel, The', 1962),
(158, 'Cries and Whispers', 'Cries and Whispers', 1972),
(159, 'Red Shoes, The', 'Red Shoes, The', 1948),
(160, 'Chimes at Midnight', 'Chimes at Midnight', 1965),
(161, 'Discreet Charm of the Bourgeoisie, The', 'Discreet Charm of the Bourgeoisie, The', 1972),
(162, 'Piano, The', 'Piano, The', 1993),
(163, 'King Kong', 'King Kong', 1933),
(164, 'Argent, L\'', 'Argent, L\'', 1983),
(165, 'Black Narcissus', 'Black Narcissus', 1947),
(166, 'There Will Be Blood', 'There Will Be Blood', 2007),
(167, 'River, The', 'River, The', 1951),
(168, 'Deer Hunter, The', 'Deer Hunter, The', 1978),
(169, 'Earth', 'Earth', 1930),
(170, 'Umbrellas of Cherbourg, The', 'Umbrellas of Cherbourg, The', 1964),
(171, 'Rocco and His Brothers', 'Rocco and His Brothers', 1960),
(172, 'Spirited Away', 'Spirited Away', 2001),
(173, 'Great Dictator, The', 'Great Dictator, The', 1940),
(174, 'Texas Chainsaw Massacre, The', 'Texas Chainsaw Massacre, The', 1974),
(175, 'Mouchette', 'Mouchette', 1967),
(176, 'Napol?on', 'Napol?on', 1927),
(177, 'Imitation of Life', 'Imitation of Life', 1959),
(178, 'Grapes of Wrath, The', 'Grapes of Wrath, The', 1940),
(179, 'Last Laugh, The', 'Last Laugh, The', 1924),
(180, 'Night and Fog', 'Night and Fog', 1955),
(181, 'Dekalog', 'Dekalog', 1988),
(182, 'Birds, The', 'Birds, The', 1963),
(183, 'City of Sadness, A', 'City of Sadness, A', 1989),
(184, 'Brazil', 'Brazil', 1985),
(185, 'Out of the Past', 'Out of the Past', 1947),
(186, 'Life and Death of Colonel Blimp, The', 'Life and Death of Colonel Blimp, The', 1943),
(187, 'Kes', 'Kes', 1969),
(188, 'Raiders of the Lost Ark', 'Raiders of the Lost Ark', 1981),
(189, 'Umberto D.', 'Umberto D.', 1952),
(190, 'Fargo', 'Fargo', 1996),
(191, 'Sal?, or the 120 Days of Sodom', 'Sal?, or the 120 Days of Sodom', 1975),
(192, 'Chungking Express', 'Chungking Express', 1994),
(193, 'Close Encounters of the Third Kind', 'Close Encounters of the Third Kind', 1977),
(194, 'Solaris', 'Solaris', 1972),
(195, 'Travelling Players, The', 'Travelling Players, The', 1975),
(196, 'Belle de jour', 'Belle de jour', 1967),
(197, 'Death in Venice', 'Death in Venice', 1971),
(198, 'Performance', 'Performance', 1970),
(199, 'Celine and Julie Go Boating', 'Celine and Julie Go Boating', 1974),
(200, 'Red River', 'Red River', 1948),
(201, 'Sweet Smell of Success', 'Sweet Smell of Success', 1957),
(202, 'Paisan', 'Paisan', 1946),
(203, 'Breaking the Waves', 'Breaking the Waves', 1996),
(204, 'Cabinet of Dr. Caligari, The', 'Cabinet of Dr. Caligari, The', 1920),
(205, 'Samoura?, Le', 'Samoura?, Le', 1967),
(206, 'Quiet Man, The', 'Quiet Man, The', 1952),
(207, 'Vampyr', 'Vampyr', 1932),
(208, 'Unforgiven', 'Unforgiven', 1992),
(209, 'Best Years of Our Lives, The', 'Best Years of Our Lives, The', 1946),
(210, 'Nights of Cabiria', 'Nights of Cabiria', 1957),
(211, 'Black God, White Devil', 'Black God, White Devil', 1964),
(212, 'McCabe & Mrs. Miller', 'McCabe & Mrs. Miller', 1971),
(213, 'Ran', 'Ran', 1985),
(214, 'Cach?', 'Cach?', 2005),
(215, 'Ashes and Diamonds', 'Ashes and Diamonds', 1958),
(216, 'Graduate, The', 'Graduate, The', 1967),
(217, 'Exorcist, The', 'Exorcist, The', 1973),
(218, 'Tree of Life, The', 'Tree of Life, The', 2011),
(219, 'Thin Red Line, The', 'Thin Red Line, The', 1998),
(220, 'Nanook of the North', 'Nanook of the North', 1922),
(221, 'Wings of Desire', 'Wings of Desire', 1987),
(222, 'Wavelength', 'Wavelength', 1967),
(223, 'My Neighbour Totoro', 'My Neighbour Totoro', 1988),
(224, 'Kind Hearts and Coronets', 'Kind Hearts and Coronets', 1949),
(225, 'Schindler\'s List', 'Schindler\'s List', 1993),
(226, 'Big Lebowski, The', 'Big Lebowski, The', 1998),
(227, 'Eternal Sunshine of the Spotless Mind', 'Eternal Sunshine of the Spotless Mind', 2004),
(228, 'Ivan the Terrible, Part 2', 'Ivan the Terrible, Part 2', 1946),
(229, 'Tropical Malady', 'Tropical Malady', 2004),
(230, 'Paris, Texas', 'Paris, Texas', 1984),
(231, 'Paths of Glory', 'Paths of Glory', 1957),
(232, 'Germany, Year Zero', 'Germany, Year Zero', 1948),
(233, 'Only Angels Have Wings', 'Only Angels Have Wings', 1939),
(234, 'Diary of a Country Priest', 'Diary of a Country Priest', 1951),
(235, 'Treasure of the Sierra Madre, The', 'Treasure of the Sierra Madre, The', 1948),
(236, 'Zero for Conduct', 'Zero for Conduct', 1933),
(237, 'Sullivan\'s Travels', 'Sullivan\'s Travels', 1941),
(238, 'Groundhog Day', 'Groundhog Day', 1993),
(239, 'Two or Three Things I Know About Her', 'Two or Three Things I Know About Her', 1966),
(240, 'F for Fake', 'F for Fake', 1973),
(241, 'Night of the Living Dead', 'Night of the Living Dead', 1968),
(242, 'Meet Me in St. Louis', 'Meet Me in St. Louis', 1944),
(243, 'Crowd, The', 'Crowd, The', 1928),
(244, 'Notte, La', 'Notte, La', 1961),
(245, 'Bonnie and Clyde', 'Bonnie and Clyde', 1967),
(246, 'Johnny Guitar', 'Johnny Guitar', 1954),
(247, 'Band Wagon, The', 'Band Wagon, The', 1953),
(248, 'Cl?o from 5 to 7', 'Cl?o from 5 to 7', 1962),
(249, 'Colour of Pomegranate, The', 'Colour of Pomegranate, The', 1969),
(250, 'Tabu', 'Tabu', 1931),
(251, 'Freaks', 'Freaks', 1932),
(252, 'Verdugo, El', 'Verdugo, El', 1963),
(253, 'Shop Around the Corner, The', 'Shop Around the Corner, The', 1940),
(254, 'Thing, The', 'Thing, The', 1982),
(255, 'Life of Oharu, The', 'Life of Oharu, The', 1952),
(256, 'Magnolia', 'Magnolia', 1999),
(257, 'Memories of Underdevelopment', 'Memories of Underdevelopment', 1968),
(258, 'Floating Clouds', 'Floating Clouds', 1955),
(259, 'Thin Blue Line, The', 'Thin Blue Line, The', 1988),
(260, 'Story of the Last Chrysanthemums, The', 'Story of the Last Chrysanthemums, The', 1939),
(261, 'Ivan the Terrible, Part 1', 'Ivan the Terrible, Part 1', 1944),
(262, 'Faces', 'Faces', 1968),
(263, 'Mean Streets', 'Mean Streets', 1973),
(264, 'Meshes of the Afternoon', 'Meshes of the Afternoon', 1943),
(265, 'In a Lonely Place', 'In a Lonely Place', 1950),
(266, 'Distant Voices, Still Lives', 'Distant Voices, Still Lives', 1988),
(267, 'Broken Blossoms', 'Broken Blossoms', 1919),
(268, 'Kings of the Road', 'Kings of the Road', 1976),
(269, 'Eraserhead', 'Eraserhead', 1977),
(270, 'Belle et la b?te, La', 'Belle et la b?te, La', 1946),
(271, 'Maltese Falcon, The', 'Maltese Falcon, The', 1941),
(272, 'Three Colours: Red', 'Three Colours: Red', 1994),
(273, 'Throne of Blood', 'Throne of Blood', 1957),
(274, 'My Night at Maud\'s', 'My Night at Maud\'s', 1969),
(275, 'Love Streams', 'Love Streams', 1984),
(276, 'Wages of Fear, The', 'Wages of Fear, The', 1953),
(277, 'Day of Wrath', 'Day of Wrath', 1943),
(278, 'Monsieur Verdoux', 'Monsieur Verdoux', 1947),
(279, 'Peeping Tom', 'Peeping Tom', 1960),
(280, 'Cinema Paradiso', 'Cinema Paradiso', 1988),
(281, 'Husbands', 'Husbands', 1970),
(282, 'Empire Strikes Back, The', 'Empire Strikes Back, The', 1980),
(283, 'Mr. Hulot\'s Holiday', 'Mr. Hulot\'s Holiday', 1953),
(284, 'Three Colours: Blue', 'Three Colours: Blue', 1993),
(285, 'Matrix, The', 'Matrix, The', 1999),
(286, 'This is Spinal Tap', 'This is Spinal Tap', 1984),
(287, 'Pandora\'s Box', 'Pandora\'s Box', 1929),
(288, 'Crimes and Misdemeanors', 'Crimes and Misdemeanors', 1989),
(289, 'Birth of a Nation, The', 'Birth of a Nation, The', 1915),
(290, 'Big Sleep, The', 'Big Sleep, The', 1946),
(291, 'Daisies', 'Daisies', 1966),
(292, 'Kid, The', 'Kid, The', 1921),
(293, 'Videodrome', 'Videodrome', 1983),
(294, 'Where is the Friend\'s Home?', 'Where is the Friend\'s Home?', 1987),
(295, 'Autumn Afternoon, An', 'Autumn Afternoon, An', 1962),
(296, 'Dawn of the Dead', 'Dawn of the Dead', 1978),
(297, 'Make Way for Tomorrow', 'Make Way for Tomorrow', 1937),
(298, 'Underground', 'Underground', 1995),
(299, 'Week-End', 'Week-End', 1967),
(300, 'Touki Bouki', 'Touki Bouki', 1973),
(301, 'Killer of Sheep', 'Killer of Sheep', 1977),
(302, 'Snow White and the Seven Dwarfs', 'Snow White and the Seven Dwarfs', 1937),
(303, 'City of God', 'City of God', 2002),
(304, 'Red Desert', 'Red Desert', 1964),
(305, 'Music Room, The', 'Music Room, The', 1958),
(306, 'Back to the Future', 'Back to the Future', 1985),
(307, 'Puppetmaster, The', 'Puppetmaster, The', 1993),
(308, 'Last Picture Show, The', 'Last Picture Show, The', 1971),
(309, 'All About My Mother', 'All About My Mother', 1999),
(310, 'In the Realm of the Senses', 'In the Realm of the Senses', 1976),
(311, 'Stranger Than Paradise', 'Stranger Than Paradise', 1984),
(312, 'World of Apu, The', 'World of Apu, The', 1959),
(313, 'Bride of Frankenstein', 'Bride of Frankenstein', 1935),
(314, 'Cabaret', 'Cabaret', 1972),
(315, 'Reservoir Dogs', 'Reservoir Dogs', 1992),
(316, 'Midnight Cowboy', 'Midnight Cowboy', 1969),
(317, 'Sacrifice, The', 'Sacrifice, The', 1986),
(318, 'Dog Day Afternoon', 'Dog Day Afternoon', 1975),
(319, 'Time to Live and the Time to Die, The', 'Time to Live and the Time to Die, The', 1985),
(320, 'Terra em Transe', 'Terra em Transe', 1967),
(321, 'Eyes Without a Face', 'Eyes Without a Face', 1960),
(322, 'It Happened One Night', 'It Happened One Night', 1934),
(323, 'Canterbury Tale, A', 'Canterbury Tale, A', 1944),
(324, 'Kiss Me Deadly', 'Kiss Me Deadly', 1955),
(325, 'Harold and Maude', 'Harold and Maude', 1971),
(326, 'Touch of Zen, A', 'Touch of Zen, A', 1971),
(327, 'Quince Tree of the Sun', 'Quince Tree of the Sun', 1992),
(328, 'Days of Being Wild', 'Days of Being Wild', 1990),
(329, 'Philadelphia Story, The', 'Philadelphia Story, The', 1940),
(330, 'West Side Story', 'West Side Story', 1961),
(331, 'Berlin Alexanderplatz', 'Berlin Alexanderplatz', 1980),
(332, 'House is Black, The', 'House is Black, The', 1963),
(333, 'Wanda', 'Wanda', 1970),
(334, 'Aliens', 'Aliens', 1986),
(335, 'Heat', 'Heat', 1995),
(336, 'Eyes Wide Shut', 'Eyes Wide Shut', 1999),
(337, 'To Kill a Mockingbird', 'To Kill a Mockingbird', 1962),
(338, 'Tenant, The', 'Tenant, The', 1976),
(339, 'Orpheus', 'Orpheus', 1950),
(340, 'I Was Born, But...', 'I Was Born, But...', 1932),
(341, 'Amadeus', 'Amadeus', 1984),
(342, 'Tie Xi Qu: West of the Tracks', 'Tie Xi Qu: West of the Tracks', 2003),
(343, 'Happy Together', 'Happy Together', 1997),
(344, 'Innocents, The', 'Innocents, The', 1961),
(345, 'Listen to Britain', 'Listen to Britain', 1942),
(346, 'I Am Cuba', 'I Am Cuba', 1964),
(347, 'How Green Was My Valley', 'How Green Was My Valley', 1941),
(348, 'Green Ray, The', 'Green Ray, The', 1986),
(349, 'Killing of a Chinese Bookie, The', 'Killing of a Chinese Bookie, The', 1976),
(350, 'Silence of the Lambs, The', 'Silence of the Lambs, The', 1991),
(351, 'Uncle Boonmee Who Can Recall His Past Li', 'Uncle Boonmee Who Can Recall His Past Li', 2010),
(352, 'Teorema', 'Teorema', 1968),
(353, 'Yellow Earth', 'Yellow Earth', 1984),
(354, 'Suspiria', 'Suspiria', 1977),
(355, 'Dogville', 'Dogville', 2003),
(356, 'Stromboli', 'Stromboli', 1950),
(357, 'Marnie', 'Marnie', 1964),
(358, 'Written on the Wind', 'Written on the Wind', 1956),
(359, 'Brokeback Mountain', 'Brokeback Mountain', 2005),
(360, 'Carrie', 'Carrie', 1976),
(361, 'High Noon', 'High Noon', 1952),
(362, 'Lola Mont?s', 'Lola Mont?s', 1955),
(363, 'Salvatore Giuliano', 'Salvatore Giuliano', 1962),
(364, 'Platform', 'Platform', 2000),
(365, 'Elephant Man, The', 'Elephant Man, The', 1980),
(366, 'Land Without Bread', 'Land Without Bread', 1932),
(367, 'Werckmeister Harmonies', 'Werckmeister Harmonies', 2000),
(368, 'High and Low', 'High and Low', 1963),
(369, 'Through the Olive Trees', 'Through the Olive Trees', 1994),
(370, 'If?.', 'If?.', 1968),
(371, 'Last Tango in Paris', 'Last Tango in Paris', 1972),
(372, 'Young Girls of Rochefort, The', 'Young Girls of Rochefort, The', 1967),
(373, 'Lost Highway', 'Lost Highway', 1997),
(374, 'I Know Where I\'m Going!', 'I Know Where I\'m Going!', 1945),
(375, 'Separation, A', 'Separation, A', 2011),
(376, 'Palm Beach Story, The', 'Palm Beach Story, The', 1942),
(377, 'Lost in Translation', 'Lost in Translation', 2003),
(378, 'Turin Horse, The', 'Turin Horse, The', 2011),
(379, 'Russian Ark', 'Russian Ark', 2002),
(380, 'El', 'El', 1953),
(381, 'WALL-E', 'WALL-E', 2008),
(382, 'Talk to Her', 'Talk to Her', 2002),
(383, 'Woman in the Dunes', 'Woman in the Dunes', 1964),
(384, 'Crouching Tiger, Hidden Dragon', 'Crouching Tiger, Hidden Dragon', 2000),
(385, 'Crime of Monsieur Lange, The', 'Crime of Monsieur Lange, The', 1936),
(386, 'Bridge on the River Kwai, The', 'Bridge on the River Kwai, The', 1957),
(387, 'October', 'October', 1928),
(388, 'Gleaners & I, The', 'Gleaners & I, The', 2000),
(389, 'Network', 'Network', 1976),
(390, 'Mon oncle', 'Mon oncle', 1958),
(391, 'Nostalghia', 'Nostalghia', 1983),
(392, 'Don\'t Look Back', 'Don\'t Look Back', 1967),
(393, 'King of Comedy, The', 'King of Comedy, The', 1983),
(394, 'Army of Shadows', 'Army of Shadows', 1969),
(395, 'Voyage dans la lune, Le', 'Voyage dans la lune, Le', 1902),
(396, 'Festen', 'Festen', 1998),
(397, '? nos amours', '? nos amours', 1983),
(398, 'White Ribbon, The', 'White Ribbon, The', 2009),
(399, 'Tristana', 'Tristana', 1970),
(400, 'Heaven\'s Gate', 'Heaven\'s Gate', 1980),
(401, 'All That Heaven Allows', 'All That Heaven Allows', 1955),
(402, 'Butch Cassidy and the Sundance Kid', 'Butch Cassidy and the Sundance Kid', 1969),
(403, 'Ivan\'s Childhood', 'Ivan\'s Childhood', 1962),
(404, 'Yojimbo', 'Yojimbo', 1961),
(405, 'Double Life of Veronique, The', 'Double Life of Veronique, The', 1991),
(406, 'Pinocchio', 'Pinocchio', 1940),
(407, '1900', '1900', 1976),
(408, 'Barren Lives', 'Barren Lives', 1963),
(409, 'Landscape in the Mist', 'Landscape in the Mist', 1988),
(410, 'Affair to Remember, An', 'Affair to Remember, An', 1957),
(411, 'Raise the Red Lantern', 'Raise the Red Lantern', 1991),
(412, 'Shoot the Piano Player', 'Shoot the Piano Player', 1960),
(413, 'Fitzcarraldo', 'Fitzcarraldo', 1982),
(414, 'Awful Truth, The', 'Awful Truth, The', 1937),
(415, 'In a Year with 13 Moons', 'In a Year with 13 Moons', 1978),
(416, 'Taste of Cherry', 'Taste of Cherry', 1997),
(417, 'Scarlet Empress, The', 'Scarlet Empress, The', 1934),
(418, 'Charulata', 'Charulata', 1964),
(419, 'Monty Python\'s Life of Brian', 'Monty Python\'s Life of Brian', 1979),
(420, 'Death of Mr. Lazarescu, The', 'Death of Mr. Lazarescu, The', 2005),
(421, 'Punch-Drunk Love', 'Punch-Drunk Love', 2002),
(422, 'Man of Aran', 'Man of Aran', 1934),
(423, 'Opening Night', 'Opening Night', 1977),
(424, 'Day for Night', 'Day for Night', 1973),
(425, 'Cloud-Capped Star, The', 'Cloud-Capped Star, The', 1960),
(426, 'Sorrow and the Pity, The', 'Sorrow and the Pity, The', 1969),
(427, 'Star is Born, A', 'Star is Born, A', 1954),
(428, 'Long Goodbye, The', 'Long Goodbye, The', 1973),
(429, 'Repulsion', 'Repulsion', 1965),
(430, 'Halloween', 'Halloween', 1978),
(431, 'Two-Lane Blacktop', 'Two-Lane Blacktop', 1971),
(432, 'Five Easy Pieces', 'Five Easy Pieces', 1970),
(433, 'Dead Ringers', 'Dead Ringers', 1988),
(434, 'Scenes from a Marriage', 'Scenes from a Marriage', 1973),
(435, 'Dead Man', 'Dead Man', 1995),
(436, 'Hustler, The', 'Hustler, The', 1961),
(437, 'Shadows', 'Shadows', 1959),
(438, 'Terminator, The', 'Terminator, The', 1984),
(439, 'Flowers of Shanghai', 'Flowers of Shanghai', 1998),
(440, 'Shawshank Redemption, The', 'Shawshank Redemption, The', 1994),
(441, 'Flowers of St. Francis, The', 'Flowers of St. Francis, The', 1950),
(442, 'Moment of Innocence, A', 'Moment of Innocence, A', 1996),
(443, 'Elephant', 'Elephant', 2003),
(444, 'Dead, The', 'Dead, The', 1987),
(445, 'Easy Rider', 'Easy Rider', 1969),
(446, 'Accattone', 'Accattone', 1961),
(447, 'Cameraman, The', 'Cameraman, The', 1928),
(448, 'Cat People', 'Cat People', 1942),
(449, 'Senso', 'Senso', 1954),
(450, 'Naked', 'Naked', 1993),
(451, 'Out 1, noli me tangere', 'Out 1, noli me tangere', 1971),
(452, 'Hoop Dreams', 'Hoop Dreams', 1994),
(453, 'Withnail & I', 'Withnail & I', 1987),
(454, 'Hour of the Furnaces, The', 'Hour of the Furnaces, The', 1968),
(455, 'Plaisir, Le', 'Plaisir, Le', 1952),
(456, 'Some Came Running', 'Some Came Running', 1958),
(457, 'All the President\'s Men', 'All the President\'s Men', 1976),
(458, 'Fight Club', 'Fight Club', 1999),
(459, 'Lady from Shanghai, The', 'Lady from Shanghai, The', 1948),
(460, 'All That Jazz', 'All That Jazz', 1979),
(461, 'Closely Watched Trains', 'Closely Watched Trains', 1966),
(462, 'Cranes Are Flying, The', 'Cranes Are Flying, The', 1957),
(463, 'Fantasia', 'Fantasia', 1940),
(464, 'Frankenstein', 'Frankenstein', 1931),
(465, 'Melancholia', 'Melancholia', 2011),
(466, 'Shane', 'Shane', 1953),
(467, 'Shadows of Our Forgotten Ancestors', 'Shadows of Our Forgotten Ancestors', 1964),
(468, 'Pyaasa', 'Pyaasa', 1957),
(469, 'Dersu Uzala', 'Dersu Uzala', 1975),
(470, 'Chelsea Girls', 'Chelsea Girls', 1966),
(471, 'Mad Max 2', 'Mad Max 2', 1981),
(472, 'Safe', 'Safe', 1995),
(473, 'French Cancan', 'French Cancan', 1955),
(474, 'Tree of Wooden Clogs, The', 'Tree of Wooden Clogs, The', 1978),
(475, 'Oldboy', 'Oldboy', 2003),
(476, 'Point Blank', 'Point Blank', 1967),
(477, 'Limite', 'Limite', 1931),
(478, 'Vagabond', 'Vagabond', 1985),
(479, 'Grey Gardens', 'Grey Gardens', 1975),
(480, 'A.I. Artificial Intelligence', 'A.I. Artificial Intelligence', 2001),
(481, 'Wind, The', 'Wind, The', 1928),
(482, 'Laura', 'Laura', 1944),
(483, 'Triumph of the Will', 'Triumph of the Will', 1935),
(484, 'Tootsie', 'Tootsie', 1982),
(485, 'Hour of the Wolf', 'Hour of the Wolf', 1968),
(486, 'Inland Empire', 'Inland Empire', 2006),
(487, 'Chronicle of a Summer', 'Chronicle of a Summer', 1961),
(488, 'To Have and Have Not', 'To Have and Have Not', 1944),
(489, 'Sound of Music, The', 'Sound of Music, The', 1965),
(490, 'India Song', 'India Song', 1975),
(491, 'Toy Story', 'Toy Story', 1995),
(492, 'Alexander Nevsky', 'Alexander Nevsky', 1938),
(493, 'Boogie Nights', 'Boogie Nights', 1997),
(494, 'Lives of Others, The', 'Lives of Others, The', 2006),
(495, 'Shadow of a Doubt', 'Shadow of a Doubt', 1943),
(496, 'Short Cuts', 'Short Cuts', 1993),
(497, 'Koyaanisqatsi', 'Koyaanisqatsi', 1982),
(498, 'Strangers on a Train', 'Strangers on a Train', 1951),
(499, 'Wind Will Carry Us, The', 'Wind Will Carry Us, The', 1999),
(500, 'Orlando', 'Orlando', 1992),
(501, '12 Angry Men', '12 Angry Men', 1957),
(502, 'Alphaville', 'Alphaville', 1965),
(503, 'Muriel', 'Muriel', 1963),
(504, 'Grizzly Man', 'Grizzly Man', 2005),
(505, 'Kagemusha', 'Kagemusha', 1980),
(506, 'Die Hard', 'Die Hard', 1988),
(507, 'Winter Light', 'Winter Light', 1962),
(508, 'No Country for Old Men', 'No Country for Old Men', 2007),
(509, 'Night at the Opera, A', 'Night at the Opera, A', 1935),
(510, 'Songs from the Second Floor', 'Songs from the Second Floor', 2000),
(511, 'Masculin Feminin', 'Masculin Feminin', 1966),
(512, 'Steamboat Bill, Jr.', 'Steamboat Bill, Jr.', 1928),
(513, 'Terra trema, La', 'Terra trema, La', 1948),
(514, 'Gimme Shelter', 'Gimme Shelter', 1970),
(515, 'Early Summer', 'Early Summer', 1951),
(516, 'Devil, Probably, The', 'Devil, Probably, The', 1977),
(517, 'Pan\'s Labyrinth', 'Pan\'s Labyrinth', 2006),
(518, 'Top Hat', 'Top Hat', 1935),
(519, 'Forrest Gump', 'Forrest Gump', 1994),
(520, 'Damned, The', 'Damned, The', 1969),
(521, 'Big Heat, The', 'Big Heat, The', 1953),
(522, 'Farewell, My Concubine', 'Farewell, My Concubine', 1993),
(523, 'Limelight', 'Limelight', 1952),
(524, 'Bitter Tears of Petra von Kant, The', 'Bitter Tears of Petra von Kant, The', 1972),
(525, 'Barton Fink', 'Barton Fink', 1991),
(526, 'Royal Tenenbaums, The', 'Royal Tenenbaums, The', 2001),
(527, 'Vampires, Les', 'Vampires, Les', 1915),
(528, 'R?gion centrale, La', 'R?gion centrale, La', 1971),
(529, 'Am?lie', 'Am?lie', 2001),
(530, 'Splendor in the Grass', 'Splendor in the Grass', 1961),
(531, 'Terminator 2: Judgment Day', 'Terminator 2: Judgment Day', 1991),
(532, 'East of Eden', 'East of Eden', 1955),
(533, 'Hannah and Her Sisters', 'Hannah and Her Sisters', 1986),
(534, 'Vitelloni, I', 'Vitelloni, I', 1953),
(535, 'Marketa Lazarov?', 'Marketa Lazarov?', 1967),
(536, 'Colossal Youth', 'Colossal Youth', 2006),
(537, 'Enigma of Kaspar Hauser, The', 'Enigma of Kaspar Hauser, The', 1974),
(538, 'Faust', 'Faust', 1926),
(539, 'Doctor Zhivago', 'Doctor Zhivago', 1965),
(540, 'Servant, The', 'Servant, The', 1963),
(541, 'Se7en', 'Se7en', 1995),
(542, 'Pat Garrett and Billy the Kid', 'Pat Garrett and Billy the Kid', 1973),
(543, 'Fellini Satyricon', 'Fellini Satyricon', 1969),
(544, 'Miracle in Milan', 'Miracle in Milan', 1951),
(545, 'Lola', 'Lola', 1961),
(546, 'Deliverance', 'Deliverance', 1972),
(547, 'Phantom of Liberty, The', 'Phantom of Liberty, The', 1974),
(548, 'Ninotchka', 'Ninotchka', 1939),
(549, 'Wagon Master', 'Wagon Master', 1950),
(550, 'Rise to Power of Louis XIV, The', 'Rise to Power of Louis XIV, The', 1966),
(551, 'Alice in the Cities', 'Alice in the Cities', 1974),
(552, 'Shock Corridor', 'Shock Corridor', 1963),
(553, 'Amants du Pont-Neuf, Les', 'Amants du Pont-Neuf, Les', 1991),
(554, 'Bigger Than Life', 'Bigger Than Life', 1956),
(555, 'Evil Dead II', 'Evil Dead II', 1987),
(556, 'Being There', 'Being There', 1979),
(557, 'Secrets & Lies', 'Secrets & Lies', 1996),
(558, 'In Vanda\'s Room', 'In Vanda\'s Room', 2000),
(559, 'Rebel Without a Cause', 'Rebel Without a Cause', 1955),
(560, 'Hard Day\'s Night, A', 'Hard Day\'s Night, A', 1964),
(561, 'Silent Light', 'Silent Light', 2007),
(562, 'Casino', 'Casino', 1995),
(563, 'Belle noiseuse, La', 'Belle noiseuse, La', 1991),
(564, 'My Own Private Idaho', 'My Own Private Idaho', 1991),
(565, 'Raising Arizona', 'Raising Arizona', 1987),
(566, 'Killing, The', 'Killing, The', 1956),
(567, 'Trainspotting', 'Trainspotting', 1996),
(568, 'Scarface', 'Scarface', 1932),
(569, 'Local Hero', 'Local Hero', 1983),
(570, 'Boudu Saved from Drowning', 'Boudu Saved from Drowning', 1932),
(571, 'Tale of Tales', 'Tale of Tales', 1979),
(572, 'Detour', 'Detour', 1945),
(573, '4 Months, 3 Weeks and 2 Days', '4 Months, 3 Weeks and 2 Days', 2007),
(574, 'That Obscure Object of Desire', 'That Obscure Object of Desire', 1977),
(575, 'Manchurian Candidate, The', 'Manchurian Candidate, The', 1962),
(576, 'Hana-Bi', 'Hana-Bi', 1997),
(577, 'Ci?naga, La', 'Ci?naga, La', 2001),
(578, 'Providence', 'Providence', 1977),
(579, 'Harlan County, U.S.A.', 'Harlan County, U.S.A.', 1976),
(580, 'And Life Goes On...', 'And Life Goes On...', 1992),
(581, 'Aparajito', 'Aparajito', 1956),
(582, 'Down by Law', 'Down by Law', 1986),
(583, 'Asphalt Jungle, The', 'Asphalt Jungle, The', 1950),
(584, 'Rocky', 'Rocky', 1976),
(585, 'Scorpio Rising', 'Scorpio Rising', 1964),
(586, 'Hatari!', 'Hatari!', 1962),
(587, 'Picnic at Hanging Rock', 'Picnic at Hanging Rock', 1975),
(588, 'Full Metal Jacket', 'Full Metal Jacket', 1987),
(589, 'Rushmore', 'Rushmore', 1998),
(590, 'Children of Men', 'Children of Men', 2006),
(591, 'Fly, The', 'Fly, The', 1986),
(592, 'French Connection, The', 'French Connection, The', 1971),
(593, 'Zodiac', 'Zodiac', 2007),
(594, 'I Walked with a Zombie', 'I Walked with a Zombie', 1943),
(595, 'Devils, The', 'Devils, The', 1971),
(596, 'Bande ? part', 'Bande ? part', 1964),
(597, '39 Steps, The', '39 Steps, The', 1935),
(598, 'Before Sunset', 'Before Sunset', 2004),
(599, 'Still Life', 'Still Life', 2006),
(600, 'Wedding March, The', 'Wedding March, The', 1928),
(601, 'Silence, The', 'Silence, The', 1963),
(602, 'Pl?cido', 'Pl?cido', 1961),
(603, 'Love Me Tonight', 'Love Me Tonight', 1932),
(604, 'Dark Knight, The', 'Dark Knight, The', 2008),
(605, 'Young Frankenstein', 'Young Frankenstein', 1974),
(606, 'Invasion of the Body Snatchers', 'Invasion of the Body Snatchers', 1956),
(607, 'Age of Innocence, The', 'Age of Innocence, The', 1993),
(608, 'Lady Vanishes, The', 'Lady Vanishes, The', 1938),
(609, 'Salesman', 'Salesman', 1969),
(610, 'Red Circle, The', 'Red Circle, The', 1970),
(611, 'Possession', 'Possession', 1981),
(612, 'Ascent, The', 'Ascent, The', 1976),
(613, 'Son, The', 'Son, The', 2002),
(614, 'Bambi', 'Bambi', 1942),
(615, 'Arrebato', 'Arrebato', 1979),
(616, 'Goodbye, Dragon Inn', 'Goodbye, Dragon Inn', 2003),
(617, 'Rosetta', 'Rosetta', 1999),
(618, 'Distant', 'Distant', 2002),
(619, 'Holy Motors', 'Holy Motors', 2012),
(620, 'Amour', 'Amour', 2012),
(621, 'Bring Me the Head of Alfredo Garcia', 'Bring Me the Head of Alfredo Garcia', 1974),
(622, 'Seven Chances', 'Seven Chances', 1925),
(623, 'Wicker Man, The', 'Wicker Man, The', 1973),
(624, 'Chant d\'amour, Un', 'Chant d\'amour, Un', 1950),
(625, 'Loves of a Blonde', 'Loves of a Blonde', 1965),
(626, 'Testament of Dr. Mabuse, The', 'Testament of Dr. Mabuse, The', 1933),
(627, 'Diaboliques, Les', 'Diaboliques, Les', 1955),
(628, 'Scarface', 'Scarface', 1983),
(629, 'Mad Max: Fury Road', 'Mad Max: Fury Road', 2015),
(630, 'White Heat', 'White Heat', 1949),
(631, 'Sur, El', 'Sur, El', 1983),
(632, 'Dr. Mabuse, The Gambler', 'Dr. Mabuse, The Gambler', 1922),
(633, 'Nazar?n', 'Nazar?n', 1958),
(634, 'Our Hospitality', 'Our Hospitality', 1923),
(635, 'Twenty Years Later', 'Twenty Years Later', 1984),
(636, 'Blissfully Yours', 'Blissfully Yours', 2002),
(637, 'Marriage of Maria Braun, The', 'Marriage of Maria Braun, The', 1979),
(638, 'Mother and Son', 'Mother and Son', 1997),
(639, 'Ben-Hur', 'Ben-Hur', 1959),
(640, 'Angel at My Table, An', 'Angel at My Table, An', 1990),
(641, 'Streetcar Named Desire, A', 'Streetcar Named Desire, A', 1951),
(642, 'Memento', 'Memento', 2000),
(643, 'Europa \'51', 'Europa \'51', 1952),
(644, 'Haine, La', 'Haine, La', 1995),
(645, 'Antonio das Mortes', 'Antonio das Mortes', 1969),
(646, 'Great Expectations', 'Great Expectations', 1946),
(647, 'Fat City', 'Fat City', 1972),
(648, 'After Life', 'After Life', 1998),
(649, 'Syndromes and a Century', 'Syndromes and a Century', 2006),
(650, 'Headless Woman, The', 'Headless Woman, The', 2008),
(651, 'Big Deal on Madonna Street', 'Big Deal on Madonna Street', 1958),
(652, 'Nostalgia for the Light', 'Nostalgia for the Light', 2010),
(653, 'Round-Up, The', 'Round-Up, The', 1966),
(654, 'Great Escape, The', 'Great Escape, The', 1963),
(655, 'Y tu mam? tambi?n', 'Y tu mam? tambi?n', 2001),
(656, 'Monty Python and the Holy Grail', 'Monty Python and the Holy Grail', 1975),
(657, 'Synecdoche, New York', 'Synecdoche, New York', 2008),
(658, 'Place in the Sun, A', 'Place in the Sun, A', 1951),
(659, 'JFK', 'JFK', 1991),
(660, 'Xala', 'Xala', 1975),
(661, 'Gummo', 'Gummo', 1997),
(662, 'Yeelen', 'Yeelen', 1987),
(663, 'Titicut Follies', 'Titicut Follies', 1967),
(664, 'Young Mr. Lincoln', 'Young Mr. Lincoln', 1939),
(665, 'Blue Angel, The', 'Blue Angel, The', 1930),
(666, 'Purple Rose of Cairo, The', 'Purple Rose of Cairo, The', 1985),
(667, 'Passion', 'Passion', 1982),
(668, 'Gun Crazy', 'Gun Crazy', 1950),
(669, 'They Live by Night', 'They Live by Night', 1948),
(670, 'Nouvelle vague', 'Nouvelle vague', 1990),
(671, 'Party, The', 'Party, The', 1968),
(672, 'Dancer in the Dark', 'Dancer in the Dark', 2000),
(673, 'Rebecca', 'Rebecca', 1940),
(674, 'Ghostbusters', 'Ghostbusters', 1984),
(675, 'Titanic', 'Titanic', 1997),
(676, 'Zelig', 'Zelig', 1983),
(677, 'Dazed and Confused', 'Dazed and Confused', 1993),
(678, 'Edward Scissorhands', 'Edward Scissorhands', 1990),
(679, 'History of Violence, A', 'History of Violence, A', 2005),
(680, 'Let the Right One In', 'Let the Right One In', 2008),
(681, 'Walkabout', 'Walkabout', 1971),
(682, 'Virgin Spring, The', 'Virgin Spring, The', 1959),
(683, 'Airplane!', 'Airplane!', 1980),
(684, 'Harakiri', 'Harakiri', 1962),
(685, 'My Life as a Dog', 'My Life as a Dog', 1985),
(686, 'Robocop', 'Robocop', 1987),
(687, 'African Queen, The', 'African Queen, The', 1951),
(688, 'Mr. Smith Goes to Washington', 'Mr. Smith Goes to Washington', 1939),
(689, 'Audition', 'Audition', 1999),
(690, 'My Friend Ivan Lapshin', 'My Friend Ivan Lapshin', 1985),
(691, 'Crash', 'Crash', 1996),
(692, 'Golden Coach, The', 'Golden Coach, The', 1952),
(693, 'Saving Private Ryan', 'Saving Private Ryan', 1998),
(694, 'W.R.: Mysteries of the Organism', 'W.R.: Mysteries of the Organism', 1971),
(695, 'Dumbo', 'Dumbo', 1941),
(696, 'Strike', 'Strike', 1925),
(697, 'Foolish Wives', 'Foolish Wives', 1922),
(698, 'L.A. Confidential', 'L.A. Confidential', 1997),
(699, 'Piano Teacher, The', 'Piano Teacher, The', 2001),
(700, 'Circus, The', 'Circus, The', 1928),
(701, 'Casque d\'or', 'Casque d\'or', 1952),
(702, 'Spartacus', 'Spartacus', 1960),
(703, 'Funny Games', 'Funny Games', 1997),
(704, 'When Harry Met Sally...', 'When Harry Met Sally...', 1989),
(705, 'Irr?versible', 'Irr?versible', 2002),
(706, 'Once Upon a Time in Anatolia', 'Once Upon a Time in Anatolia', 2011),
(707, 'Vive L\'Amour', 'Vive L\'Amour', 1994),
(708, 'Edvard Munch', 'Edvard Munch', 1974),
(709, 'Rififi', 'Rififi', 1955),
(710, 'Requiem for a Dream', 'Requiem for a Dream', 2000),
(711, 'Breakfast at Tiffany\'s', 'Breakfast at Tiffany\'s', 1961),
(712, 'Host, The', 'Host, The', 2006),
(713, 'Man Who Would Be King, The', 'Man Who Would Be King, The', 1975),
(714, 'Fort Apache', 'Fort Apache', 1948),
(715, 'Bad and the Beautiful, The', 'Bad and the Beautiful, The', 1952),
(716, 'By the Bluest of Seas', 'By the Bluest of Seas', 1936),
(717, 'Avatar', 'Avatar', 2009),
(718, 'Miller\'s Crossing', 'Miller\'s Crossing', 1990),
(719, 'Tin Drum, The', 'Tin Drum, The', 1979),
(720, 'Red Sorghum', 'Red Sorghum', 1987),
(721, 'Emperor\'s Naked Army Marches On, The', 'Emperor\'s Naked Army Marches On, The', 1987),
(722, 'Killer, The', 'Killer, The', 1989),
(723, 'Short Film About Killing, A', 'Short Film About Killing, A', 1987),
(724, 'Claire\'s Knee', 'Claire\'s Knee', 1970),
(725, 'Lancelot du Lac', 'Lancelot du Lac', 1974),
(726, 'Woman Next Door, The', 'Woman Next Door, The', 1981),
(727, 'Wild Child, The', 'Wild Child, The', 1970),
(728, 'Van Gogh', 'Van Gogh', 1991),
(729, 'Lord of the Rings: The Fellowship of the', 'Lord of the Rings: The Fellowship of the', 2001),
(730, 'Near Dark', 'Near Dark', 1987),
(731, 'Tiger of Eschnapur, The', 'Tiger of Eschnapur, The', 1958),
(732, 'All Quiet on the Western Front', 'All Quiet on the Western Front', 1930),
(733, 'Ace in the Hole', 'Ace in the Hole', 1951),
(734, 'Seasons, The', 'Seasons, The', 1975),
(735, 'Thief of Bagdad, The', 'Thief of Bagdad, The', 1940),
(736, 'D\'Est', 'D\'Est', 1993),
(737, 'Akira', 'Akira', 1988),
(738, 'Dames du Bois de Boulogne, Les', 'Dames du Bois de Boulogne, Les', 1945),
(739, 'American in Paris, An', 'American in Paris, An', 1951),
(740, 'Pickup on South Street', 'Pickup on South Street', 1953),
(741, 'Blow Out', 'Blow Out', 1981),
(742, 'Saturday Night and Sunday Morning', 'Saturday Night and Sunday Morning', 1960),
(743, 'New World, The', 'New World, The', 2005),
(744, 'Grido, Il', 'Grido, Il', 1957),
(745, 'We All Loved Each Other So Much', 'We All Loved Each Other So Much', 1974),
(746, 'Superman', 'Superman', 1978),
(747, 'Fellini\'s Roma', 'Fellini\'s Roma', 1972),
(748, 'Dirty Harry', 'Dirty Harry', 1971),
(749, 'Ladies Man, The', 'Ladies Man, The', 1961),
(750, 'Z', 'Z', 1969),
(751, 'Moulin Rouge!', 'Moulin Rouge!', 2001),
(752, 'Dodes\'ka-den', 'Dodes\'ka-den', 1970),
(753, 'Night of the Demon', 'Night of the Demon', 1957),
(754, 'Long Day Closes, The', 'Long Day Closes, The', 1992),
(755, 'Chronicle of Anna Magdalena Bach, The', 'Chronicle of Anna Magdalena Bach, The', 1968),
(756, 'Lolita', 'Lolita', 1962),
(757, 'Ferris Bueller\'s Day Off', 'Ferris Bueller\'s Day Off', 1986),
(758, 'Red Balloon, The', 'Red Balloon, The', 1956),
(759, 'Thelma & Louise', 'Thelma & Louise', 1991),
(760, 'Crumb', 'Crumb', 1994),
(761, 'Firemen\'s Ball, The', 'Firemen\'s Ball, The', 1967),
(762, 'Last Detail, The', 'Last Detail, The', 1973),
(763, 'Adventures of Robin Hood, The', 'Adventures of Robin Hood, The', 1938),
(764, 'Street Angel', 'Street Angel', 1937),
(765, 'Smiles of a Summer Night', 'Smiles of a Summer Night', 1955),
(766, 'Iracema - Uma Transa Amaz?nica', 'Iracema - Uma Transa Amaz?nica', 1975),
(767, 'Sideways', 'Sideways', 2004),
(768, 'Portrait of Jason', 'Portrait of Jason', 1967),
(769, 'Sauve qui peut (la vie)', 'Sauve qui peut (la vie)', 1980),
(770, 'Wild at Heart', 'Wild at Heart', 1990),
(771, 'Cool Hand Luke', 'Cool Hand Luke', 1967),
(772, 'Hunger', 'Hunger', 2008),
(773, 'Navigator, The', 'Navigator, The', 1924),
(774, 'River, The', 'River, The', 1997),
(775, 'Starship Troopers', 'Starship Troopers', 1997),
(776, 'Flaming Creatures', 'Flaming Creatures', 1963),
(777, 'Sang des b?tes, Le', 'Sang des b?tes, Le', 1949),
(778, 'Code Unknown', 'Code Unknown', 2000),
(779, 'Blues Brothers, The', 'Blues Brothers, The', 1980),
(780, 'Deep End', 'Deep End', 1970),
(781, 'Hawks and the Sparrows, The', 'Hawks and the Sparrows, The', 1966),
(782, 'Abraham\'s Valley', 'Abraham\'s Valley', 1993),
(783, 'Goddess, The', 'Goddess, The', 1934),
(784, 'Kaagaz Ke Phool', 'Kaagaz Ke Phool', 1959),
(785, 'American Beauty', 'American Beauty', 1999),
(786, 'Olympia', 'Olympia', 1938),
(787, 'Ossessione', 'Ossessione', 1943),
(788, 'Blood Simple', 'Blood Simple', 1984),
(789, 'Vengeance is Mine', 'Vengeance is Mine', 1979),
(790, 'Trial, The', 'Trial, The', 1962),
(791, 'Princess Bride, The', 'Princess Bride, The', 1987),
(792, 'Spione', 'Spione', 1928),
(793, 'Two English Girls', 'Two English Girls', 1971),
(794, 'Million Dollar Baby', 'Million Dollar Baby', 2004),
(795, 'Ma?tres fous, Les', 'Ma?tres fous, Les', 1955),
(796, 'Bandido da Luz Vermelha, O', 'Bandido da Luz Vermelha, O', 1968),
(797, 'Blue', 'Blue', 1993),
(798, 'Jurassic Park', 'Jurassic Park', 1993),
(799, 'Memories of Murder', 'Memories of Murder', 2003),
(800, 'Moonfleet', 'Moonfleet', 1955),
(801, 'Bonheur, Le', 'Bonheur, Le', 1965),
(802, 'Sweet Hereafter, The', 'Sweet Hereafter, The', 1997),
(803, 'Holy Mountain, The', 'Holy Mountain, The', 1973),
(804, 'News from Home', 'News from Home', 1976),
(805, 'Amores perros', 'Amores perros', 2000),
(806, 'Mary Poppins', 'Mary Poppins', 1964),
(807, 'Miracle of Morgan\'s Creek, The', 'Miracle of Morgan\'s Creek, The', 1944),
(808, 'Ladykillers, The', 'Ladykillers, The', 1955),
(809, 'Grave of the Fireflies', 'Grave of the Fireflies', 1988),
(810, 'Commune (Paris, 1871), La', 'Commune (Paris, 1871), La', 2000),
(811, 'Posto, Il', 'Posto, Il', 1961),
(812, 'Faster, Pussycat! Kill! Kill!', 'Faster, Pussycat! Kill! Kill!', 1965),
(813, 'Roman Holiday', 'Roman Holiday', 1953),
(814, 'Diaries, Notes and Sketches', 'Diaries, Notes and Sketches', 1969),
(815, 'Port of Shadows', 'Port of Shadows', 1938),
(816, 'Idiots, The', 'Idiots, The', 1998),
(817, 'Burnt by the Sun', 'Burnt by the Sun', 1994),
(818, 'Assault on Precinct 13', 'Assault on Precinct 13', 1976),
(819, 'Right Stuff, The', 'Right Stuff, The', 1983),
(820, 'Lusty Men, The', 'Lusty Men, The', 1952),
(821, 'Hitler: A Film from Germany', 'Hitler: A Film from Germany', 1977),
(822, 'Who\'s Afraid of Virginia Woolf?', 'Who\'s Afraid of Virginia Woolf?', 1966),
(823, 'Forbidden Games', 'Forbidden Games', 1952),
(824, 'Street of Shame', 'Street of Shame', 1956),
(825, 'Veronika Voss', 'Veronika Voss', 1982),
(826, 'Ghost and Mrs. Muir, The', 'Ghost and Mrs. Muir, The', 1947),
(827, 'Seven Women', 'Seven Women', 1966),
(828, 'Producers, The', 'Producers, The', 1968),
(829, 'Taipei Story', 'Taipei Story', 1985),
(830, 'New York, New York', 'New York, New York', 1977),
(831, 'Morocco', 'Morocco', 1930),
(832, 'It\'s a Gift', 'It\'s a Gift', 1934),
(833, 'Black Girl', 'Black Girl', 1966),
(834, 'Lessons of Darkness', 'Lessons of Darkness', 1992),
(835, 'Diary', 'Diary', 1983),
(836, 'Central Station', 'Central Station', 1998),
(837, 'Intruder, The', 'Intruder, The', 2004),
(838, 'Age of the Earth, The', 'Age of the Earth, The', 1980),
(839, 'Dust in the Wind', 'Dust in the Wind', 1987),
(840, 'Day the Earth Stood Still, The', 'Day the Earth Stood Still, The', 1951),
(841, 'Num?ro deux', 'Num?ro deux', 1975),
(842, 'Breakfast Club, The', 'Breakfast Club, The', 1985),
(843, 'Women on the Verge of a Nervous Breakdow', 'Women on the Verge of a Nervous Breakdow', 1988),
(844, 'Blazing Saddles', 'Blazing Saddles', 1974),
(845, 'Kwaidan', 'Kwaidan', 1964),
(846, 'Point Break', 'Point Break', 1991),
(847, 'Sawdust and Tinsel', 'Sawdust and Tinsel', 1953),
(848, 'She Wore a Yellow Ribbon', 'She Wore a Yellow Ribbon', 1949),
(849, 'Naked Island, The', 'Naked Island, The', 1960),
(850, 'Match Factory Girl, The', 'Match Factory Girl, The', 1990),
(851, 'Mother India', 'Mother India', 1957),
(852, 'My Little Loves', 'My Little Loves', 1974),
(853, 'Fires Were Started', 'Fires Were Started', 1943),
(854, 'Woman of Paris, A', 'Woman of Paris, A', 1923),
(855, 'Million, Le', 'Million, Le', 1931),
(856, 'Last Temptation of Christ, The', 'Last Temptation of Christ, The', 1988),
(857, 'Inglourious Basterds', 'Inglourious Basterds', 2009),
(858, 'Princess Mononoke', 'Princess Mononoke', 1997),
(859, 'As I Was Moving Ahead Occasionally I Saw', 'As I Was Moving Ahead Occasionally I Saw', 2000),
(860, 'Sicilia!', 'Sicilia!', 1999),
(861, 'Branded to Kill', 'Branded to Kill', 1967),
(862, 'Fata Morgana', 'Fata Morgana', 1971),
(863, 'Last Emperor, The', 'Last Emperor, The', 1987),
(864, '2046', '2046', 2004),
(865, 'American Graffiti', 'American Graffiti', 1973),
(866, 'Anatomy of a Murder', 'Anatomy of a Murder', 1959),
(867, 'Seventh Heaven', 'Seventh Heaven', 1927),
(868, 'Usual Suspects, The', 'Usual Suspects, The', 1995),
(869, 'Pink Flamingos', 'Pink Flamingos', 1972),
(870, 'Man of the West', 'Man of the West', 1958),
(871, 'Last Bolshevik, The', 'Last Bolshevik, The', 1993),
(872, 'Time of the Gypsies', 'Time of the Gypsies', 1989),
(873, 'Berlin: Symphony of a Great City', 'Berlin: Symphony of a Great City', 1927),
(874, 'Othello', 'Othello', 1952),
(875, 'Outskirts', 'Outskirts', 1933),
(876, 'Gregory\'s Girl', 'Gregory\'s Girl', 1980),
(877, 'Dog Star Man', 'Dog Star Man', 1964),
(878, 'B?te humaine, La', 'B?te humaine, La', 1938),
(879, 'Cook, the Thief, His Wife & Her Lover, T', 'Cook, the Thief, His Wife & Her Lover, T', 1989),
(880, 'Enter the Dragon', 'Enter the Dragon', 1973),
(881, 'Misfits, The', 'Misfits, The', 1961),
(882, 'Boot, Das', 'Boot, Das', 1981),
(883, 'L?on', 'L?on', 1994),
(884, 'Forbidden Planet', 'Forbidden Planet', 1956),
(885, 'Outlaw Josey Wales, The', 'Outlaw Josey Wales, The', 1976),
(886, 'Arabian Nights', 'Arabian Nights', 1974),
(887, 'M*A*S*H', 'M*A*S*H', 1970),
(888, 'Au revoir les enfants', 'Au revoir les enfants', 1987),
(889, 'Dracula', 'Dracula', 1958),
(890, 'Phantom Carriage, The', 'Phantom Carriage, The', 1921),
(891, 'They Were Expendable', 'They Were Expendable', 1945),
(892, 'Elevator to the Gallows', 'Elevator to the Gallows', 1958),
(893, 'Nuit du carrefour, La', 'Nuit du carrefour, La', 1932),
(894, 'Fellini\'s Casanova', 'Fellini\'s Casanova', 1976),
(895, 'Moi, un Noir', 'Moi, un Noir', 1958),
(896, 'Criminal Life of Archibaldo de la Cruz, ', 'Criminal Life of Archibaldo de la Cruz, ', 1955),
(897, 'Trou, Le', 'Trou, Le', 1960),
(898, 'Incredible Shrinking Man, The', 'Incredible Shrinking Man, The', 1957),
(899, 'Mon oncle d\'Am?rique', 'Mon oncle d\'Am?rique', 1980),
(900, '42nd Street', '42nd Street', 1933),
(901, 'Ed Wood', 'Ed Wood', 1994),
(902, 'Caro diario', 'Caro diario', 1994),
(903, 'Enfance nue, L\'', 'Enfance nue, L\'', 1968),
(904, 'They Live', 'They Live', 1988),
(905, 'Diving Bell and the Butterfly, The', 'Diving Bell and the Butterfly, The', 2007),
(906, 'Sholay', 'Sholay', 1975),
(907, 'Cr?a cuervos', 'Cr?a cuervos', 1976),
(908, 'Rope', 'Rope', 1948),
(909, 'Floating Weeds', 'Floating Weeds', 1959),
(910, 'Saturday Night Fever', 'Saturday Night Fever', 1977),
(911, 'Ride the High Country', 'Ride the High Country', 1962),
(912, 'Juliet of the Spirits', 'Juliet of the Spirits', 1965),
(913, 'Sherman\'s March', 'Sherman\'s March', 1985),
(914, 'To Live', 'To Live', 1994),
(915, 'Knife in the Water', 'Knife in the Water', 1962),
(916, 'H?tel Terminus', 'H?tel Terminus', 1987),
(917, 'Mildred Pierce', 'Mildred Pierce', 1945),
(918, 'Hart of London, The', 'Hart of London, The', 1970),
(919, 'Jour se l?ve, Le', 'Jour se l?ve, Le', 1939),
(920, 'Get Carter', 'Get Carter', 1971),
(921, 'Black Orpheus', 'Black Orpheus', 1959),
(922, 'Gentlemen Prefer Blondes', 'Gentlemen Prefer Blondes', 1953),
(923, 'Topsy-Turvy', 'Topsy-Turvy', 1999),
(924, 'Reds', 'Reds', 1981),
(925, 'Ludwig', 'Ludwig', 1973),
(926, 'Ten', 'Ten', 2002),
(927, 'Saraband', 'Saraband', 2003),
(928, 'Better Tomorrow, A', 'Better Tomorrow, A', 1986),
(929, 'Mamma Roma', 'Mamma Roma', 1962),
(930, 'Odd Man Out', 'Odd Man Out', 1947),
(931, 'Touchez pas au Grisbi', 'Touchez pas au Grisbi', 1954),
(932, 'Broadcast News', 'Broadcast News', 1987),
(933, 'Bad Timing', 'Bad Timing', 1980),
(934, 'Deep Red', 'Deep Red', 1975),
(935, 'End of Summer, The', 'End of Summer, The', 1961),
(936, 'Chienne, La', 'Chienne, La', 1931),
(937, 'Gilda', 'Gilda', 1946),
(938, 'Spring, Summer, Autumn, Winter? and Spri', 'Spring, Summer, Autumn, Winter? and Spri', 2003),
(939, 'Before Sunrise', 'Before Sunrise', 1995),
(940, 'Second Breath', 'Second Breath', 1966),
(941, 'Aguaespejo granadino', 'Aguaespejo granadino', 1955),
(942, 'Anatahan', 'Anatahan', 1953),
(943, 'O Lucky Man!', 'O Lucky Man!', 1973),
(944, 'Kill Bill Vol. 1', 'Kill Bill Vol. 1', 2003),
(945, 'Twin Peaks: Fire Walk with Me', 'Twin Peaks: Fire Walk with Me', 1992),
(946, 'Sun Shines Bright, The', 'Sun Shines Bright, The', 1953),
(947, 'Good Morning', 'Good Morning', 1959),
(948, 'Humanity and Paper Balloons', 'Humanity and Paper Balloons', 1937),
(949, 'On the Town', 'On the Town', 1949),
(950, 'Paper Moon', 'Paper Moon', 1973),
(951, '3 Women', '3 Women', 1977),
(952, 'Lord of the Rings: The Return of the Kin', 'Lord of the Rings: The Return of the Kin', 2003),
(953, 'Ballad of Narayama, The', 'Ballad of Narayama, The', 1983),
(954, 'Carnival of Souls', 'Carnival of Souls', 1962),
(955, 'Duel in the Sun', 'Duel in the Sun', 1946),
(956, 'In Praise of Love', 'In Praise of Love', 2001),
(957, 'Strangers When We Meet', 'Strangers When We Meet', 1960),
(958, 'Adventures of Prince Achmed, The', 'Adventures of Prince Achmed, The', 1926),
(959, 'Female Trouble', 'Female Trouble', 1974),
(960, 'Love and Death', 'Love and Death', 1975),
(961, 'Nutty Professor, The', 'Nutty Professor, The', 1963),
(962, 'Thing from Another World, The', 'Thing from Another World, The', 1951),
(963, 'P?p? le Moko', 'P?p? le Moko', 1937),
(964, 'Grin Without a Cat, A', 'Grin Without a Cat, A', 1977),
(965, 'Zabriskie Point', 'Zabriskie Point', 1970),
(966, 'Red Beard', 'Red Beard', 1965),
(967, 'Scarecrow', 'Scarecrow', 1973),
(968, 'Reckless Moment, The', 'Reckless Moment, The', 1949),
(969, 'National Lampoon\'s Animal House', 'National Lampoon\'s Animal House', 1978),
(970, 'Cul-de-sac', 'Cul-de-sac', 1966),
(971, 'Tale of the Wind, A', 'Tale of the Wind, A', 1988),
(972, 'Bad Lieutenant', 'Bad Lieutenant', 1992),
(973, 'Excalibur', 'Excalibur', 1981),
(974, 'Shanghai Express', 'Shanghai Express', 1932),
(975, 'Stroszek', 'Stroszek', 1977),
(976, '47 Ronin, The', '47 Ronin, The', 1941),
(977, 'Simon of the Desert', 'Simon of the Desert', 1965),
(978, 'Henry V', 'Henry V', 1944),
(979, 'Saragossa Manuscript, The', 'Saragossa Manuscript, The', 1965),
(980, 'Stand by Me', 'Stand by Me', 1986),
(981, 'Not Reconciled', 'Not Reconciled', 1965),
(982, 'Yol', 'Yol', 1982),
(983, 'El Dorado', 'El Dorado', 1967),
(984, 'Phantom of the Paradise', 'Phantom of the Paradise', 1974),
(985, 'Bridges of Madison County, The', 'Bridges of Madison County, The', 1995),
(986, 'Humanit?, L\'', 'Humanit?, L\'', 1999),
(987, 'Hellzapoppin\'', 'Hellzapoppin\'', 1941),
(988, 'Cairo Station', 'Cairo Station', 1958),
(989, 'Chikamatsu monogatari', 'Chikamatsu monogatari', 1954),
(990, 'Subarnarekha', 'Subarnarekha', 1965),
(991, 'H?xan', 'H?xan', 1922),
(992, 'Holiday', 'Holiday', 1938);
INSERT INTO `movies` (`movie_id`, `native_name`, `english_name`, `year_made`) VALUES
(993, 'Diary for Timothy, A', 'Diary for Timothy, A', 1945),
(994, 'Man Who Fell to Earth, The', 'Man Who Fell to Earth, The', 1976),
(995, 'Loneliness of the Long Distance Runner, ', 'Loneliness of the Long Distance Runner, ', 1962),
(996, 'Outer Space', 'Outer Space', 1999),
(997, 'Boucher, Le', 'Boucher, Le', 1970),
(998, 'Too Early, Too Late', 'Too Early, Too Late', 1981),
(999, 'Design for Living', 'Design for Living', 1933),
(1000, 'Fat Girl', 'Fat Girl', 2001),
(2000, '2000_native', '2000_english', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `movie_data`
--

CREATE TABLE `movie_data` (
  `tag_line` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `movie_id` int(6) NOT NULL COMMENT 'This is both PK and FK; movie_data is a WEAK entity',
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plot` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movie_data`
--

INSERT INTO `movie_data` (`tag_line`, `movie_id`, `language`, `country`, `genre`, `plot`) VALUES
('', 2, 'English', 'United States', 'mystery', 'A former police detective juggles wrestling with his personal demons and becoming obsessed with a hauntingly beautiful woman.');

-- --------------------------------------------------------

--
-- Table structure for table `movie_keywords`
--

CREATE TABLE `movie_keywords` (
  `movie_id` int(6) NOT NULL,
  `keyword` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movie_keywords`
--

INSERT INTO `movie_keywords` (`movie_id`, `keyword`) VALUES
(2, '1950s'),
(2, 'acrophobia'),
(2, 'Hitchcock'),
(2, 'romantic obsess');

-- --------------------------------------------------------

--
-- Table structure for table `movie_media`
--

CREATE TABLE `movie_media` (
  `movie_media_id` int(6) NOT NULL,
  `m_link` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_link_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'video, poster, image are three possible values.',
  `movie_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movie_media`
--

INSERT INTO `movie_media` (`movie_media_id`, `m_link`, `m_link_type`, `movie_id`) VALUES
(10021, 'Vertigomovie_restoration.jpg', 'poster', 2),
(10022, 'vertigo_poster2.jpg', 'poster', 2),
(10023, 'vertigo_poster3.jpg', 'poster', 2),
(10024, 'https://www.youtube.com/watch?v=O888bu0QrMg', 'video', 2);

-- --------------------------------------------------------

--
-- Table structure for table `movie_people`
--

CREATE TABLE `movie_people` (
  `movie_id` int(6) NOT NULL,
  `people_id` int(6) NOT NULL,
  `role` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'director, producer, music director, lead actor, lead actress, supporting actor, supporting actress are possible values',
  `screen_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movie_people`
--

INSERT INTO `movie_people` (`movie_id`, `people_id`, `role`, `screen_name`) VALUES
(2, 1, 'Director', ''),
(2, 1, 'Producer', ''),
(2, 2, 'Lead Actor', ''),
(2, 3, 'Lead Actress', ''),
(2, 4, 'Lead Actress', ''),
(2, 5, 'Lead Actor', ''),
(2, 6, 'Lead Actor', ''),
(2, 7, 'Lead Actress', ''),
(2, 8, 'Lead Actress', ''),
(2, 9, 'Music Composer', '');

-- --------------------------------------------------------

--
-- Table structure for table `movie_quotes`
--

CREATE TABLE `movie_quotes` (
  `movie_id` int(6) NOT NULL,
  `movie_quote_id` int(6) NOT NULL,
  `movie_quote_name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movie_song`
--

CREATE TABLE `movie_song` (
  `movie_id` int(6) NOT NULL,
  `song_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This tables reflects an associative entity (movie,song)';

--
-- Dumping data for table `movie_song`
--

INSERT INTO `movie_song` (`movie_id`, `song_id`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `movie_trivia`
--

CREATE TABLE `movie_trivia` (
  `movie_id` int(6) NOT NULL,
  `movie_trivia_id` int(6) NOT NULL,
  `movie_trivia_name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `people_id` int(6) NOT NULL,
  `stage_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Many people in the movie industry are known by short names',
  `first_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'We will store the images locally on the server; This field refers to the image file name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`people_id`, `stage_name`, `first_name`, `middle_name`, `last_name`, `gender`, `image_name`) VALUES
(1, 'Alfred Hitchcock', 'Alfred', 'A', 'Hitchcock', 'male', 'image file name'),
(2, 'James Stewart', 'James', 'A', 'Stewart', 'male', 'image file name'),
(3, 'Kim Novak', 'Kim', 'A', 'Novak', 'female', 'image file name'),
(4, 'Barbara Bel Geddes', 'Barbara', 'Bel', 'Geddes', 'female', 'image file name'),
(5, 'Tom Helmore', 'Tom', 'A', 'Helmore', 'male', 'image file name'),
(6, 'Henry Jone', 'Henry', 'A', 'Jone', 'male', 'image file name'),
(7, 'Raymond Bailey', 'Raymond', 'A', 'Bailey', 'male', 'image file name'),
(8, 'Ellen Corby', 'Ellen', 'A', 'Corby', 'female', 'image file name'),
(9, 'Bernard Hermann', 'Bernard', 'A', 'Hermann', 'male', 'image file name');

-- --------------------------------------------------------

--
-- Table structure for table `people_trivia`
--

CREATE TABLE `people_trivia` (
  `people_id` int(6) NOT NULL,
  `people_trivia_id` int(6) NOT NULL,
  `people_trivia_name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `song_id` int(5) NOT NULL,
  `title` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lyrics` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`song_id`, `title`, `lyrics`, `theme`) VALUES
(1, 'Soundtrack Suite', 'none', '');

-- --------------------------------------------------------

--
-- Table structure for table `song_keywords`
--

CREATE TABLE `song_keywords` (
  `song_id` int(5) NOT NULL,
  `keyword` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `song_keywords`
--

INSERT INTO `song_keywords` (`song_id`, `keyword`) VALUES
(1, 'orchestra');

-- --------------------------------------------------------

--
-- Table structure for table `song_media`
--

CREATE TABLE `song_media` (
  `song_media_id` int(6) NOT NULL,
  `s_link` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `s_link_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'audio and video are two possible values',
  `song_id` int(6) NOT NULL COMMENT 'is the FK'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `song_media`
--

INSERT INTO `song_media` (`song_media_id`, `s_link`, `s_link_type`, `song_id`) VALUES
(1, 'https://www.youtube.com/watch?v=Txvgd60hLPk', 'youtube vi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `song_people`
--

CREATE TABLE `song_people` (
  `song_id` int(6) NOT NULL,
  `people_id` int(6) NOT NULL,
  `role` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `song_people`
--

INSERT INTO `song_people` (`song_id`, `people_id`, `role`) VALUES
(1, 9, 'Composer');

-- --------------------------------------------------------

--
-- Table structure for table `song_trivia`
--

CREATE TABLE `song_trivia` (
  `song_id` int(6) NOT NULL,
  `song_trivia_id` int(6) NOT NULL,
  `song_trivia_name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `movie_data`
--
ALTER TABLE `movie_data`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `movie_keywords`
--
ALTER TABLE `movie_keywords`
  ADD PRIMARY KEY (`movie_id`,`keyword`);

--
-- Indexes for table `movie_media`
--
ALTER TABLE `movie_media`
  ADD PRIMARY KEY (`movie_media_id`);

--
-- Indexes for table `movie_people`
--
ALTER TABLE `movie_people`
  ADD PRIMARY KEY (`movie_id`,`people_id`,`role`,`screen_name`);

--
-- Indexes for table `movie_quotes`
--
ALTER TABLE `movie_quotes`
  ADD PRIMARY KEY (`movie_quote_id`);

--
-- Indexes for table `movie_song`
--
ALTER TABLE `movie_song`
  ADD PRIMARY KEY (`movie_id`,`song_id`);

--
-- Indexes for table `movie_trivia`
--
ALTER TABLE `movie_trivia`
  ADD PRIMARY KEY (`movie_trivia_id`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`people_id`);

--
-- Indexes for table `people_trivia`
--
ALTER TABLE `people_trivia`
  ADD PRIMARY KEY (`people_trivia_id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`song_id`);

--
-- Indexes for table `song_keywords`
--
ALTER TABLE `song_keywords`
  ADD PRIMARY KEY (`song_id`,`keyword`);

--
-- Indexes for table `song_media`
--
ALTER TABLE `song_media`
  ADD PRIMARY KEY (`song_media_id`);

--
-- Indexes for table `song_people`
--
ALTER TABLE `song_people`
  ADD PRIMARY KEY (`song_id`,`people_id`,`role`);

--
-- Indexes for table `song_trivia`
--
ALTER TABLE `song_trivia`
  ADD PRIMARY KEY (`song_trivia_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2001;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
