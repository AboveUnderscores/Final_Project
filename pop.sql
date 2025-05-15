-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2025 at 10:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pop`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `text`, `is_correct`) VALUES
(1, 1, 'Naruto Uzumaki', 1),
(2, 1, 'Sasuke Uchiha', 0),
(3, 1, 'Sakura Haruno', 0),
(4, 1, 'Kakashi Hatake', 0),
(5, 2, 'Attack on Titan', 1),
(6, 2, 'My Hero Academia', 0),
(7, 2, 'Demon Slayer', 0),
(8, 2, 'Jujutsu Kaisen', 0),
(9, 3, 'Eiichiro Oda', 1),
(10, 3, 'Masashi Kishimoto', 0),
(11, 3, 'Tite Kubo', 0),
(12, 3, 'Hajime Isayama', 0),
(13, 4, 'Straw Hat Pirates', 1),
(14, 4, 'Red Hair Pirates', 0),
(15, 4, 'Heart Pirates', 0),
(16, 4, 'Whitebeard Pirates', 0),
(17, 5, 'Death Note', 1),
(18, 5, 'Code Geass', 0),
(19, 5, 'Future Diary', 0),
(20, 5, 'Terror in Resonance', 0),
(21, 6, 'Tanjiro Kamado', 1),
(22, 6, 'Zenitsu Agatsuma', 0),
(23, 6, 'Inosuke Hashibira', 0),
(24, 6, 'Nezuko Kamado', 0),
(25, 7, 'Bones', 1),
(26, 7, 'Madhouse', 0),
(27, 7, 'Ufotable', 0),
(28, 7, 'MAPPA', 0),
(29, 8, 'Attack on Titan', 1),
(30, 8, 'Naruto', 0),
(31, 8, 'One Piece', 0),
(32, 8, 'Bleach', 0),
(33, 9, 'Nen', 1),
(34, 9, 'Chakra', 0),
(35, 9, 'Quirks', 0),
(36, 9, 'Haki', 0),
(37, 10, 'Edward Elric', 1),
(38, 10, 'Alphonse Elric', 0),
(39, 10, 'Roy Mustang', 0),
(40, 10, 'Winry Rockbell', 0),
(41, 11, '7', 1),
(42, 11, '5', 0),
(43, 11, '9', 0),
(44, 11, '3', 0),
(45, 12, 'Cowboy Bebop', 1),
(46, 12, 'Samurai Champloo', 0),
(47, 12, 'Space Dandy', 0),
(48, 12, 'Trigun', 0),
(49, 13, 'Gohan', 1),
(50, 13, 'Goten', 0),
(51, 13, 'Trunks', 0),
(52, 13, 'Vegeta', 0),
(53, 14, 'The Melancholy of Haruhi Suzumiya', 1),
(54, 14, 'K-On!', 0),
(55, 14, 'Hyouka', 0),
(56, 14, 'Lucky Star', 0),
(57, 15, 'Konoha', 1),
(58, 15, 'Suna', 0),
(59, 15, 'Kiri', 0),
(60, 15, 'Iwa', 0),
(61, 16, 'Soccer/Football', 1),
(62, 16, 'Basketball', 0),
(63, 16, 'Volleyball', 0),
(64, 16, 'Tennis', 0),
(65, 17, 'Basketball', 1),
(66, 17, 'Volleyball', 0),
(67, 17, 'Soccer', 0),
(68, 17, 'Tennis', 0),
(69, 18, '11', 1),
(70, 18, '9', 0),
(71, 18, '10', 0),
(72, 18, '12', 0),
(73, 19, 'New York Yankees', 1),
(74, 19, 'Boston Red Sox', 0),
(75, 19, 'Los Angeles Dodgers', 0),
(76, 19, 'Chicago Cubs', 0),
(77, 20, 'Deuce', 1),
(78, 20, 'Draw', 0),
(79, 20, 'Tie', 0),
(80, 20, 'Advantage', 0),
(81, 21, 'Argentina', 1),
(82, 21, 'France', 0),
(83, 21, 'Brazil', 0),
(84, 21, 'Germany', 0),
(85, 22, '6', 1),
(86, 22, '7', 0),
(87, 22, '5', 0),
(88, 22, '3', 0),
(89, 23, 'Wilt Chamberlain', 1),
(90, 23, 'Kobe Bryant', 0),
(91, 23, 'Michael Jordan', 0),
(92, 23, 'LeBron James', 0),
(93, 24, '18', 1),
(94, 24, '16', 0),
(95, 24, '20', 0),
(96, 24, '22', 0),
(97, 25, 'Golf', 1),
(98, 25, 'Baseball', 0),
(99, 25, 'Cricket', 0),
(100, 25, 'Hockey', 0),
(101, 26, '9', 1),
(102, 26, '7', 0),
(103, 26, '10', 0),
(104, 26, '5', 0),
(105, 27, 'High Jump', 1),
(106, 27, 'Pole Vault', 0),
(107, 27, 'Long Jump', 0),
(108, 27, 'Triple Jump', 0),
(109, 28, 'Wicket', 1),
(110, 28, 'Stump', 0),
(111, 28, 'Bail', 0),
(112, 28, 'Crease', 0),
(113, 29, 'England', 1),
(114, 29, 'New Zealand', 0),
(115, 29, 'Australia', 0),
(116, 29, 'South Africa', 0),
(117, 30, '336', 1),
(118, 30, '250', 0),
(119, 30, '400', 0),
(120, 30, '108', 0);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `quiz_id`, `text`) VALUES
(1, 1, 'Who is the main character in \"Naruto\"?'),
(2, 1, 'Which anime features a boy who can transform into a \"Titan\"?'),
(3, 1, 'Who is the creator of \"One Piece\"?'),
(4, 1, 'What is the name of the pirate crew in \"One Piece\"?'),
(5, 1, 'Which anime features a notebook that can kill people?'),
(6, 1, 'Who is the main protagonist in \"Demon Slayer\"?'),
(7, 1, 'Which studio animated \"My Hero Academia\"?'),
(8, 1, 'Which of these is NOT one of the \"Big Three\" anime?'),
(9, 1, 'What power system is used in \"Hunter x Hunter\"?'),
(10, 1, 'Who is the main character in \"Fullmetal Alchemist\"?'),
(11, 1, 'How many Dragon Balls are needed to summon Shenron?'),
(12, 1, 'Which anime features a character named \"Spike Spiegel\"?'),
(13, 1, 'What is the name of Goku\'s first son in \"Dragon Ball\"?'),
(14, 1, 'Which anime features a high school club called the \"SOS Brigade\"?'),
(15, 1, 'What is the name of the hidden village where Naruto lives?'),
(16, 2, 'Which sport uses a ball with 32 panels?'),
(17, 2, 'In which sport would you perform a \"slam dunk\"?'),
(18, 2, 'How many players are on a standard soccer team?'),
(19, 2, 'Which baseball team is known as the \"Bronx Bombers\"?'),
(20, 2, 'In tennis, what is it called when the score is tied at 40-40?'),
(21, 2, 'Which country won the most recent FIFA World Cup?'),
(22, 2, 'In American football, how many points is a touchdown worth?'),
(23, 2, 'Which basketball player holds the record for most points in a single NBA game?'),
(24, 2, 'What is the diameter of a standard basketball hoop in inches?'),
(25, 2, 'In which sport would you use a driver, wedge, and putter?'),
(26, 2, 'How many innings are in a standard baseball game?'),
(27, 2, 'Which sport features the \"Fosbury Flop\" technique?'),
(28, 2, 'In cricket, what is the term for the defensive wooden structure?'),
(29, 2, 'Which country is known for inventing the sport of rugby?'),
(30, 2, 'How many dimples are on a standard golf ball?');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int(11) NOT NULL,
  `quiz_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `quiz_name`) VALUES
(1, 'Anime'),
(2, 'SportsBall');

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`);

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
