-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-05-2023 a las 20:22:25
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuelait`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `author_name` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT '0001-01-01',
  `death_date` date DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `authors`
--

INSERT INTO `authors` (`id`, `author_name`, `nationality`, `birth_date`, `death_date`, `description`) VALUES
(1, 'Pedro Sifontes', NULL, '0000-00-00', NULL, NULL),
(2, 'Carlos Sabino', NULL, '0000-00-00', NULL, NULL),
(3, 'Thomas L. Friedman', NULL, '0000-00-00', NULL, NULL),
(4, 'Robert Lawrence Stine', NULL, '0000-00-00', NULL, NULL),
(5, 'Mary Shelley', NULL, '0000-00-00', NULL, NULL),
(6, 'Oscar Wilde', NULL, '0000-00-00', NULL, NULL),
(7, 'Karl Marx', NULL, '0000-00-00', NULL, NULL),
(8, 'Bram Stoker', NULL, '0000-00-00', NULL, NULL),
(9, 'Friedrich Engels', NULL, '0000-00-00', NULL, NULL),
(10, 'Jose Hernandez', NULL, '0000-00-00', NULL, NULL),
(11, 'Gabriel Garcia Marquez', NULL, '0000-00-00', NULL, NULL),
(12, 'Miguel de Cervantes', NULL, '0000-00-00', NULL, NULL),
(13, 'Joanne K. Rowling​', NULL, '0000-00-00', NULL, NULL),
(14, 'Julio Cortazar', NULL, '0000-00-00', NULL, NULL),
(15, 'John Ronald Reuel Tolkien', NULL, '0000-00-00', NULL, NULL),
(16, 'Philip K. Dick', NULL, '0001-01-01', NULL, NULL),
(17, 'Michael Crichton', NULL, '1942-10-23', '2008-11-04', NULL),
(18, 'Ray Bradbury', NULL, '0001-01-01', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `stock` int(10) UNSIGNED NOT NULL,
  `price` decimal(11,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `books`
--

INSERT INTO `books` (`id`, `description`, `stock`, `price`) VALUES
(1, 'El Fantasma de Canterville', 150, '3999.99'),
(2, '100 años de soledad', 200, '5400.00'),
(3, 'El ultimo de los mohicanos', 320, '1999.99'),
(4, 'El principito', 230, '6300.00'),
(5, 'Dracula', 3000, '1288.00'),
(6, 'El 100% de la felicidad', 320, '4899.99'),
(7, 'El 50% de la felicidad', 2400, '2499.99'),
(8, 'El 10% de la felicidad', 4290, '489.99'),
(9, 'El 1% para la libertad', 1030, '5999.99'),
(10, 'El 1% de la solución', 200, '3200.00'),
(11, 'Don Quijote', 100, '2355.36'),
(12, 'Historia de dos ciudades', 183, '2365.85'),
(13, 'El Señor de los Anillos', 614, '2763.16'),
(14, 'Harry Potter y la piedra filosofal', 522, '4718.27'),
(16, 'El hobbit', 769, '5301.85'),
(17, 'Sueño en el pabellón rojo', 280, '2354.46'),
(18, 'Triple representatividad', 90, '5866.75'),
(19, 'Diez negritos', 611, '4270.34'),
(20, 'Las aventuras de Alicia en el país de las maravill', 784, '5751.49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books_by_authors`
--

CREATE TABLE `books_by_authors` (
  `id` int(11) NOT NULL,
  `book` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `books_by_authors`
--

INSERT INTO `books_by_authors` (`id`, `book`, `author`) VALUES
(4, 5, 8),
(2, 6, 1),
(3, 7, 1),
(1, 8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books_by_editions`
--

CREATE TABLE `books_by_editions` (
  `id` int(11) NOT NULL,
  `book` int(11) DEFAULT NULL,
  `edition` decimal(6,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books_by_genres`
--

CREATE TABLE `books_by_genres` (
  `id` int(11) NOT NULL,
  `book` int(11) DEFAULT NULL,
  `genre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books_by_publishers`
--

CREATE TABLE `books_by_publishers` (
  `id` int(11) NOT NULL,
  `book` int(11) DEFAULT NULL,
  `publisher` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books_by_years`
--

CREATE TABLE `books_by_years` (
  `id` int(11) NOT NULL,
  `book` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `books_by_years`
--

INSERT INTO `books_by_years` (`id`, `book`, `year`) VALUES
(16, 1, 1887),
(1, 11, 1605),
(2, 12, 1859),
(3, 13, 1954),
(4, 14, 1997),
(5, 16, 1937),
(6, 17, 1759),
(7, 18, 2001),
(8, 19, 1937),
(9, 20, 1865);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books_rent`
--

CREATE TABLE `books_rent` (
  `id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `rent_date` datetime DEFAULT current_timestamp(),
  `return_date` datetime DEFAULT current_timestamp(),
  `total` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `books_rent`
--

INSERT INTO `books_rent` (`id`, `user`, `rent_date`, `return_date`, `total`) VALUES
(1, 4, '2023-04-25 15:03:55', '2023-04-28 15:30:00', '2021.70'),
(2, 1, '2023-04-25 15:03:55', '2023-05-03 10:15:22', '5400.00'),
(3, 6, '2023-04-25 15:03:55', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books_rent_detail`
--

CREATE TABLE `books_rent_detail` (
  `id` int(11) NOT NULL,
  `ticket` int(11) DEFAULT NULL,
  `book` int(11) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `quantity` int(10) UNSIGNED DEFAULT 1,
  `returned` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `books_rent_detail`
--

INSERT INTO `books_rent_detail` (`id`, `ticket`, `book`, `price`, `quantity`, `returned`) VALUES
(1, 1, 4, '6300.00', 1, 1),
(2, 1, 2, '5400.00', 1, 1),
(3, 1, 8, '489.99', 1, 1),
(4, 1, 5, '1288.00', 1, 1),
(5, 2, 4, '6300.00', 1, 1),
(6, 2, 10, '3200.00', 1, 1),
(7, 2, 1, '3999.99', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `literary_genres`
--

CREATE TABLE `literary_genres` (
  `id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publishers`
--

CREATE TABLE `publishers` (
  `id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `userpass` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `userpass`) VALUES
(1, 'c215714n', 'admin'),
(3, 'cristian', '1234'),
(4, 'alejandra', '4lph4'),
(5, 'brian', 'b3t4'),
(6, 'carlos', 'g4mm4'),
(7, 'p3p3', 'jañsdlk'),
(8, 'ju4n', '2134c'),
(9, 'l4ur4', 'dsfa2'),
(10, 'c4m1l4', 'asld');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_data`
--

CREATE TABLE `users_data` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `uid` char(13) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users_data`
--

INSERT INTO `users_data` (`id`, `userId`, `first_name`, `last_name`, `uid`, `birth_date`, `email`, `phone`, `country`) VALUES
(1, 1, 'Cristian', 'Racedo', '20-35336446-5', '1991-04-18', 'cristiandracedo@hotmail.com', '1165642187', 'Argentina'),
(3, 3, 'Cristian Damian', 'Racedo', '27-35336446-5', '1991-04-18', 'cristiandracedo@gmail.com', '1185955905', 'Argentina'),
(7, 5, 'Brian', 'Gutierrez', '20-31898346-3', '1986-06-25', 'brian.g_elmascapo@gmail.com', '1142852965', 'Argentina'),
(8, 6, 'Carlos', 'Gutierrez', '20-40323846-2', '1995-02-15', 'guti.carlos.95@gmail.com', '1136397115', 'Argentina'),
(9, 4, 'Alejandra', 'Gomez', '27-48219286-1', '2000-12-30', 'ale_gomez@gmail.com', '1143426680', 'Argentina');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `description` (`author_name`);

--
-- Indices de la tabla `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indices de la tabla `books_by_authors`
--
ALTER TABLE `books_by_authors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `book` (`book`,`author`),
  ADD KEY `author` (`author`);

--
-- Indices de la tabla `books_by_editions`
--
ALTER TABLE `books_by_editions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `book` (`book`,`edition`);

--
-- Indices de la tabla `books_by_genres`
--
ALTER TABLE `books_by_genres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `book` (`book`,`genre`),
  ADD KEY `genre` (`genre`);

--
-- Indices de la tabla `books_by_publishers`
--
ALTER TABLE `books_by_publishers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `book` (`book`,`publisher`),
  ADD KEY `publisher` (`publisher`);

--
-- Indices de la tabla `books_by_years`
--
ALTER TABLE `books_by_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `book` (`book`,`year`);

--
-- Indices de la tabla `books_rent`
--
ALTER TABLE `books_rent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Indices de la tabla `books_rent_detail`
--
ALTER TABLE `books_rent_detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket` (`ticket`,`book`),
  ADD KEY `book` (`book`);

--
-- Indices de la tabla `literary_genres`
--
ALTER TABLE `literary_genres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indices de la tabla `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `users_data`
--
ALTER TABLE `users_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `last_name` (`last_name`,`first_name`,`birth_date`,`phone`,`country`),
  ADD KEY `userId` (`userId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `books_by_authors`
--
ALTER TABLE `books_by_authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `books_by_editions`
--
ALTER TABLE `books_by_editions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `books_by_genres`
--
ALTER TABLE `books_by_genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `books_by_publishers`
--
ALTER TABLE `books_by_publishers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `books_by_years`
--
ALTER TABLE `books_by_years`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `books_rent`
--
ALTER TABLE `books_rent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `books_rent_detail`
--
ALTER TABLE `books_rent_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `literary_genres`
--
ALTER TABLE `literary_genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `users_data`
--
ALTER TABLE `users_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `books_by_authors`
--
ALTER TABLE `books_by_authors`
  ADD CONSTRAINT `books_by_authors_ibfk_1` FOREIGN KEY (`book`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `books_by_authors_ibfk_2` FOREIGN KEY (`author`) REFERENCES `authors` (`id`);

--
-- Filtros para la tabla `books_by_editions`
--
ALTER TABLE `books_by_editions`
  ADD CONSTRAINT `books_by_editions_ibfk_1` FOREIGN KEY (`book`) REFERENCES `books` (`id`);

--
-- Filtros para la tabla `books_by_genres`
--
ALTER TABLE `books_by_genres`
  ADD CONSTRAINT `books_by_genres_ibfk_1` FOREIGN KEY (`book`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `books_by_genres_ibfk_2` FOREIGN KEY (`genre`) REFERENCES `literary_genres` (`id`);

--
-- Filtros para la tabla `books_by_publishers`
--
ALTER TABLE `books_by_publishers`
  ADD CONSTRAINT `books_by_publishers_ibfk_1` FOREIGN KEY (`book`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `books_by_publishers_ibfk_2` FOREIGN KEY (`publisher`) REFERENCES `publishers` (`id`);

--
-- Filtros para la tabla `books_by_years`
--
ALTER TABLE `books_by_years`
  ADD CONSTRAINT `books_by_years_ibfk_1` FOREIGN KEY (`book`) REFERENCES `books` (`id`);

--
-- Filtros para la tabla `books_rent`
--
ALTER TABLE `books_rent`
  ADD CONSTRAINT `books_rent_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `books_rent_detail`
--
ALTER TABLE `books_rent_detail`
  ADD CONSTRAINT `books_rent_detail_ibfk_1` FOREIGN KEY (`ticket`) REFERENCES `books_rent` (`id`),
  ADD CONSTRAINT `books_rent_detail_ibfk_2` FOREIGN KEY (`book`) REFERENCES `books` (`id`);

--
-- Filtros para la tabla `users_data`
--
ALTER TABLE `users_data`
  ADD CONSTRAINT `users_data_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
