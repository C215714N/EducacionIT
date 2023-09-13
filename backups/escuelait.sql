-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-09-2023 a las 03:25:49
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

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
-- Estructura de tabla para la tabla `accounting`
--

CREATE TABLE `accounting` (
  `id` int(11) NOT NULL,
  `Ticket` int(11) DEFAULT NULL,
  `debit` tinyint(1) DEFAULT 0,
  `credit` tinyint(1) DEFAULT 1,
  `payment_type` int(11) DEFAULT NULL,
  `payment_number` int(11) DEFAULT 1,
  `user` int(11) DEFAULT NULL,
  `total` float(11,2) DEFAULT NULL,
  `detail` longtext DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `accounting`
--

INSERT INTO `accounting` (`id`, `Ticket`, `debit`, `credit`, `payment_type`, `payment_number`, `user`, `total`, `detail`, `date`) VALUES
(1, 1, 0, 1, 5, 1, 14, 51755.97, NULL, '2023-09-12 21:49:21'),
(2, 2, 0, 1, 6, 1, 10, 6715.19, NULL, '2023-09-12 21:49:21'),
(3, 3, 0, 1, 2, 1, 14, NULL, NULL, '2023-09-12 21:49:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounting_details`
--

CREATE TABLE `accounting_details` (
  `id` int(11) NOT NULL,
  `ticket` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` float(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `accounting_details`
--

INSERT INTO `accounting_details` (`id`, `ticket`, `product`, `quantity`, `price`) VALUES
(1, 1, 2, 3, 2999.99),
(2, 1, 4, 9, 2392.00),
(3, 1, 3, 8, 2216.00),
(4, 1, 1, 1, 3500.00),
(5, 2, 5, 2, 1557.60),
(6, 2, 3, 0, 2659.20),
(7, 2, 2, 1, 3599.99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `authors`
--

INSERT INTO `authors` (`id`, `name`, `birthdate`) VALUES
(1, 'MIGUEL DE CERVANTES', '1547-01-01'),
(2, 'MARQUÉS DE SADE', '1740-01-01'),
(3, 'GOETHE', '1749-01-01'),
(4, 'JANE AUSTEN', '1775-01-01'),
(5, 'MARY SHELLEY', '1797-01-01'),
(6, 'VICTOR HUGO', '1802-01-01'),
(7, 'CHARLES DICKENS', '1812-01-01'),
(8, 'HERMAN MELVILLE', '1819-01-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` float(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `books`
--

INSERT INTO `books` (`id`, `name`, `description`, `author`, `stock`, `price`) VALUES
(1, 'Frankenstein', 'La novela narra la historia de Víctor Frankenstein, un joven suizo, estudiante de medicina en Ingolstadt, obsesionado por conocer \"los secretos del cielo y la tierra\". En su afán por desentrañar \"la misteriosa alma del hombre\", Víctor crea un cuerpo a partir de la unión de distintas partes de cadáveres diseccionados.', 5, 275, 4200.00),
(2, 'Moby Dick', 'La historia de la obsesiva persecución de una ballena por el Capitán Ahab se ha convertido en ítem imprescindible de la cultura universal. El lector no encontrará obra más filosófica, tratado sobre el mar más erudito y, algo no menos importante, novela de aventuras más épica que la presente.', 8, 428, 3599.99),
(3, 'Los miserables', 'Jean Valjean, un ex convicto al que encerraron durante veinte años por robar un pedazo de pan, se convierte en un hombre ejemplar que lucha contra la miseria y la injusticia y que empeña su vida en cuidar a la hija de una mujer que ha debido prostituirse para salvar a la niña. Así, Jean Valjean se ve obligado a cambiar varias veces de nombre, es apresado, se fuga y reaparece. Al mismo tiempo, debe eludir al comisario Javert, un policía inflexible que lo persigue convencido de que tiene cuentas pendientes con la justicia.', 6, 382, 2659.20),
(4, 'Oliver Twist', '', 7, 283, 2870.40),
(5, 'La tienda de antigüedades', '', 7, 492, 1557.60),
(6, 'La pequeña Dorrit', '', 7, 527, 3372.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books_by_genres`
--

CREATE TABLE `books_by_genres` (
  `id` int(11) NOT NULL,
  `book` int(11) DEFAULT NULL,
  `genre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `books_by_genres`
--

INSERT INTO `books_by_genres` (`id`, `book`, `genre`) VALUES
(2, 1, 5),
(1, 1, 13),
(7, 2, 9),
(8, 2, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `contact_name` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`) VALUES
(1, 'MySQL', 'Introduccion a Bases de Datos Relaciones'),
(2, 'MATEMATICAS', 'Operaciones artimeticologicas'),
(3, 'NTICs', 'Nuevas Tecnologias de la Informatica y la Comunicacion'),
(4, 'FISICA', 'velocidad, aceleracion, gravedad, mru y mruv'),
(5, 'QUIMICA', 'formulas soluciones, acidos, anion, cation'),
(6, 'BIOLOGIA', ''),
(7, 'HTML5', 'Fundamentos Web con HTML y CSS'),
(8, 'SOCIALES', 'Presidencias, Revoluciones y Movimientos sociales'),
(9, 'GEOGRAFIA', 'Paises y capitales del Mundo, fallas geograficas y Climas'),
(10, 'CCNA1', 'Fundamentos de Redes'),
(11, 'CCNA2', 'Enrutamiento y Conmutacion'),
(12, 'CCNA3', 'Redes Empresariales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses_assignment`
--

CREATE TABLE `courses_assignment` (
  `id` int(11) NOT NULL,
  `course` int(11) DEFAULT NULL,
  `teacher` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `day` set('L','M','X','J','V','S') DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `courses_assignment`
--

INSERT INTO `courses_assignment` (`id`, `course`, `teacher`, `start_date`, `end_date`, `day`, `start_time`, `end_time`) VALUES
(1, 1, 1, '2023-07-18', '2023-09-01', 'M,V', '10:00:00', '12:00:00'),
(2, 7, 1, '2023-07-18', '2023-08-22', 'M,J', '20:00:00', '22:00:00'),
(3, 4, 2, '2023-07-12', '2023-08-09', 'X,V', '10:00:00', '12:00:00'),
(4, 6, 2, '2023-07-27', '2023-08-24', 'L,J', '14:00:00', '16:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses_detail`
--

CREATE TABLE `courses_detail` (
  `id` int(11) NOT NULL,
  `student` int(11) DEFAULT NULL,
  `course` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `courses_detail`
--

INSERT INTO `courses_detail` (`id`, `student`, `course`) VALUES
(12, 1, 2),
(17, 1, 3),
(5, 1, 4),
(8, 2, 1),
(19, 2, 3),
(4, 2, 4),
(9, 3, 1),
(20, 4, 3),
(6, 5, 1),
(13, 6, 2),
(3, 6, 4),
(7, 7, 1),
(15, 7, 2),
(10, 8, 1),
(11, 8, 2),
(2, 8, 4),
(16, 9, 3),
(14, 10, 2),
(18, 10, 3),
(1, 10, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `student` int(11) DEFAULT NULL,
  `course` int(11) DEFAULT NULL,
  `note` decimal(4,2) DEFAULT NULL,
  `module` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `exams`
--

INSERT INTO `exams` (`id`, `student`, `course`, `note`, `module`) VALUES
(1, 2, 2, 7.52, 5),
(2, 1, 1, 9.98, 2),
(3, 6, 4, 6.13, 4),
(4, 6, 2, 6.50, 1),
(5, 6, 1, 6.58, 3),
(6, 10, 2, 9.73, 3),
(7, 5, 2, 4.02, 4),
(8, 6, 3, 3.19, 2),
(9, 2, 2, 5.64, 4),
(10, 10, 1, 4.37, 2),
(11, 4, 4, 7.89, 1),
(12, 8, 1, 7.87, 5),
(13, 6, 1, 9.70, 2),
(14, 9, 2, 8.82, 2),
(15, 1, 1, 8.56, 2),
(16, 5, 2, 8.78, 2),
(17, 3, 1, 8.29, 3),
(18, 4, 2, 7.05, 4),
(19, 6, 4, 5.73, 1),
(20, 9, 1, 7.74, 3),
(21, 3, 1, 9.58, 2),
(22, 10, 3, 7.02, 4),
(23, 4, 2, 9.83, 3),
(24, 2, 4, 3.67, 4),
(25, 5, 1, 9.51, 2),
(26, 6, 1, 5.78, 2),
(27, 10, 2, 3.59, 1),
(28, 3, 2, 9.23, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `literary_genres`
--

CREATE TABLE `literary_genres` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `literary_genres`
--

INSERT INTO `literary_genres` (`id`, `name`) VALUES
(1, 'Accion'),
(2, 'Aventura'),
(3, 'Biografico'),
(4, 'Catastrofe'),
(5, 'Ciencia Ficcion'),
(7, 'Comedia'),
(6, 'Cosmos'),
(8, 'Documental'),
(9, 'Drama'),
(10, 'Fantasia'),
(12, 'Psicologia'),
(11, 'Suspenso'),
(13, 'Terror');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `payments`
--

INSERT INTO `payments` (`id`, `name`) VALUES
(8, 'cheque'),
(4, 'credito personal'),
(7, 'deposito'),
(1, 'efectivo'),
(5, 'pago virtual'),
(2, 'tarjeta credito'),
(3, 'tarjeta debito'),
(6, 'transferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `students`
--

INSERT INTO `students` (`id`, `userId`, `active`) VALUES
(1, 13, 1),
(2, 8, 1),
(3, 15, 1),
(4, 12, 1),
(5, 9, 1),
(6, 11, 1),
(7, 10, 1),
(8, 17, 1),
(9, 14, 1),
(10, 16, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `signed` datetime DEFAULT current_timestamp(),
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `teachers`
--

INSERT INTO `teachers` (`id`, `user`, `signed`, `active`) VALUES
(1, 2, '2018-11-08 07:35:59', 1),
(2, 4, '2023-08-22 22:07:10', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `userpass` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `username`, `userpass`) VALUES
(1, 'c215714n', 'root'),
(2, 'cristian', 'pass'),
(4, 'Messi', 'e7745'),
(5, 'Waldo', 'Wa7974'),
(6, 'Roman', 'm7845'),
(7, 'Bob', 'o9354'),
(8, 'Bret', 'B7547'),
(9, 'Antonette', 't2217'),
(10, 'Samantha', 'a2588'),
(11, 'Karianne', 'ri5216'),
(12, 'Kamren', 'a7407'),
(13, 'Leopoldo_Corkery', 'po3753'),
(14, 'Elwyn.Skiles', 'w3255'),
(15, 'Maxime_Nienow', 'axi8077'),
(16, 'Delphine', 'l2372'),
(17, 'Moriah.Stanton', '.S9669'),
(19, 'd477714n', 'root4ccess');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_data`
--

CREATE TABLE `users_data` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` enum('M','F','O','PnD') DEFAULT NULL,
  `id_type` enum('CI','CUIT','CUIL','DNI','DNIE','LC','LE','PA','RUC') DEFAULT NULL,
  `uid` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users_data`
--

INSERT INTO `users_data` (`id`, `firstname`, `lastname`, `birthdate`, `gender`, `id_type`, `uid`, `address`, `email`, `userId`) VALUES
(1, 'Lionel', 'Messi', '1987-06-24', 'M', 'DNI', '33016244', NULL, 'lionel@messi.com', 4),
(2, 'Roberto', 'Pantalones Cuadrados', '1986-07-14', 'O', 'PA', 'A1356021', NULL, 'sponge_sqrpnts@gmail.com', 7),
(3, 'Juan Roman', 'Riquelme', '1978-06-24', 'M', 'CUIT', '20-26752869-2', NULL, 'Riquelme_feliz10@gmail.com', 6),
(4, 'Cristian Damian', 'Racedo', '1991-04-18', 'PnD', 'CUIT', '20-35336446-5', NULL, 'cristiandracedo@hotmail.com', 1),
(5, 'Bret', 'Leanne Graham', NULL, NULL, 'PA', '1-770-736-8031', 'Kulas LightApt. 556,Gwenborough', 'Sincere@april.biz', 8),
(6, 'Antonette', 'Ervin Howell', NULL, NULL, 'PA', '010-692-6593 x09125', 'Victor Plains Suite 879, Wisokyburgh', 'Shanna@melissa.tv', 9),
(7, 'Samantha', 'Clementine Bauch', NULL, NULL, 'PA', '1-463-123-4447', 'Douglas Extension Suite 847', 'Nathan@yesenia.net', 10),
(8, 'Karianne', 'Patricia Lebsack', NULL, NULL, 'PA', '493-170-9623 x156', 'Hoeger Mall Apt. 692, South Elvis', 'Julianne.OConner@kory.org', 11),
(9, 'Kamren', 'Chelsey Dietrich', NULL, NULL, 'PA', '(254)954-1289', 'Skiles Walks Suite 351, Roscoeview', 'Lucio_Hettinger@annie.ca', 12),
(10, 'Leopoldo_Corkery', 'Mrs. Dennis Schulist', NULL, NULL, 'PA', '1-477-935-8478 x6430', 'Norberto Crossing Apt. 950m, South Christy', 'Karley_Dach@jasper.info', 13);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accounting`
--
ALTER TABLE `accounting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Ticket` (`Ticket`,`payment_type`),
  ADD KEY `payment_type` (`payment_type`),
  ADD KEY `user` (`user`);

--
-- Indices de la tabla `accounting_details`
--
ALTER TABLE `accounting_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket` (`ticket`,`product`),
  ADD KEY `product` (`product`);

--
-- Indices de la tabla `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author` (`author`);

--
-- Indices de la tabla `books_by_genres`
--
ALTER TABLE `books_by_genres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `book` (`book`,`genre`),
  ADD KEY `genre` (`genre`);

--
-- Indices de la tabla `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Indices de la tabla `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `courses_assignment`
--
ALTER TABLE `courses_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course` (`course`),
  ADD KEY `teacher` (`teacher`);

--
-- Indices de la tabla `courses_detail`
--
ALTER TABLE `courses_detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student` (`student`,`course`),
  ADD KEY `course` (`course`);

--
-- Indices de la tabla `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student` (`student`),
  ADD KEY `course` (`course`);

--
-- Indices de la tabla `literary_genres`
--
ALTER TABLE `literary_genres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indices de la tabla `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user` (`user`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `users_data`
--
ALTER TABLE `users_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gender` (`gender`,`id_type`,`uid`),
  ADD UNIQUE KEY `userId` (`userId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accounting`
--
ALTER TABLE `accounting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `accounting_details`
--
ALTER TABLE `accounting_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `books_by_genres`
--
ALTER TABLE `books_by_genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `courses_assignment`
--
ALTER TABLE `courses_assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `courses_detail`
--
ALTER TABLE `courses_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `literary_genres`
--
ALTER TABLE `literary_genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `users_data`
--
ALTER TABLE `users_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accounting`
--
ALTER TABLE `accounting`
  ADD CONSTRAINT `accounting_ibfk_1` FOREIGN KEY (`payment_type`) REFERENCES `payments` (`id`),
  ADD CONSTRAINT `accounting_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);

--
-- Filtros para la tabla `accounting_details`
--
ALTER TABLE `accounting_details`
  ADD CONSTRAINT `accounting_details_ibfk_1` FOREIGN KEY (`ticket`) REFERENCES `accounting` (`Ticket`),
  ADD CONSTRAINT `accounting_details_ibfk_2` FOREIGN KEY (`product`) REFERENCES `books` (`id`);

--
-- Filtros para la tabla `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author`) REFERENCES `authors` (`id`);

--
-- Filtros para la tabla `books_by_genres`
--
ALTER TABLE `books_by_genres`
  ADD CONSTRAINT `books_by_genres_ibfk_1` FOREIGN KEY (`book`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `books_by_genres_ibfk_2` FOREIGN KEY (`genre`) REFERENCES `literary_genres` (`id`);

--
-- Filtros para la tabla `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);

--
-- Filtros para la tabla `courses_assignment`
--
ALTER TABLE `courses_assignment`
  ADD CONSTRAINT `courses_assignment_ibfk_1` FOREIGN KEY (`course`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `courses_assignment_ibfk_2` FOREIGN KEY (`teacher`) REFERENCES `teachers` (`id`);

--
-- Filtros para la tabla `courses_detail`
--
ALTER TABLE `courses_detail`
  ADD CONSTRAINT `courses_detail_ibfk_1` FOREIGN KEY (`course`) REFERENCES `courses_assignment` (`id`);

--
-- Filtros para la tabla `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`student`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `exams_ibfk_2` FOREIGN KEY (`course`) REFERENCES `courses` (`id`);

--
-- Filtros para la tabla `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`user_id`);

--
-- Filtros para la tabla `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);

--
-- Filtros para la tabla `users_data`
--
ALTER TABLE `users_data`
  ADD CONSTRAINT `users_data_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
