-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2023 a las 16:50:22
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
-- Base de datos: `smsapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(7, 'alimentos'),
(17, 'autopartes'),
(10, 'bebidas'),
(6, 'botanica'),
(15, 'construccion'),
(11, 'herramientas'),
(13, 'higiene'),
(9, 'hogar'),
(1, 'indumentaria'),
(5, 'informatica'),
(3, 'inmuebles'),
(14, 'jardineria'),
(12, 'limpieza'),
(18, 'mecanica'),
(4, 'moda'),
(8, 'muebles'),
(16, 'plomeria'),
(2, 'tecnologia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `user` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `post_date` datetime DEFAULT current_timestamp(),
  `price` decimal(16,4) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `user`, `product`, `post_date`, `price`, `stock`) VALUES
(1, 'Mesa Ratona de Coleccion', '', 4, 22, '2023-09-12 12:30:54', 60000.0000, 1),
(2, 'Sommier Queen Size', '', 4, 24, '2023-10-01 12:30:54', 151199.9880, 5),
(3, 'Tablet Galaxy Tab10', '', 5, 21, '2023-09-22 12:30:54', 186384.0000, 7),
(4, 'Zapatillas Pimpi Edicion Limitada', '', 4, 4, '2023-07-15 12:30:54', 42936.0000, 12),
(5, 'Aire Split Inverter 3000 Frigorias', '', 6, 27, '2023-10-12 12:30:54', 431999.9880, 6),
(6, 'Smart Tv 59 Pulgadas', '', 6, 26, '2023-08-17 12:30:54', 284160.0000, 12),
(7, 'Acondicionador Pega la Vuelta', '', 5, 45, '2023-09-10 12:30:54', 4680.0000, 35),
(8, 'aire acondicionado publicado por joaquin', '', 5, 27, '2023-10-19 10:29:35', 281021.0952, 2),
(9, 'mesa publicado por lucia', '', 4, 20, '2023-10-19 10:29:44', 66043.4335, 11),
(10, 'sommier publicado por joaquin', '', 5, 24, '2023-10-19 10:29:45', 359062.7244, 5),
(11, 'corbata publicada por lucia', '', 4, 7, '2023-10-19 10:29:45', 578.2830, 2000),
(12, 'flores publicada por lucia', '', 4, 8, '2023-10-19 10:29:46', 4358.1193, 5400),
(13, 'notebook publicado por joaquin', '', 5, 1, '2023-10-19 10:29:46', 435880.2648, 9),
(14, 'netbook publicado por joaquin', '', 5, 2, '2023-10-19 10:29:47', 159417.8700, 8),
(15, 'mesa de luz publicado por joaquin', '', 5, 19, '2023-10-19 10:29:47', 36601.7353, 9),
(17, 'sommier publicado por lucia', '', 4, 24, '2023-10-19 10:29:48', 53956.9099, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`) VALUES
(9, 'abono'),
(45, 'acondicionador'),
(27, 'aire acondicionado'),
(18, 'aparador'),
(43, 'aspiradora'),
(28, 'auriculares'),
(30, 'cesped artificial'),
(25, 'colchon'),
(15, 'comoda'),
(7, 'corbata'),
(10, 'destornillador'),
(44, 'escoba'),
(17, 'esquinero'),
(38, 'estereo'),
(8, 'flores'),
(35, 'lampara'),
(31, 'lavarropas'),
(39, 'limpiaparabrisas'),
(13, 'llave francesa'),
(12, 'llave inglesa'),
(11, 'martillo'),
(20, 'mesa'),
(19, 'mesa de luz'),
(22, 'mesa ratona'),
(36, 'motor'),
(2, 'netbook'),
(34, 'neumaticos'),
(1, 'notebook'),
(6, 'pantalon'),
(29, 'parlantes'),
(37, 'pintura'),
(16, 'placard'),
(33, 'plancha'),
(5, 'remera'),
(32, 'secarropas'),
(14, 'serrucho'),
(23, 'sillas'),
(24, 'sommier'),
(21, 'tablet'),
(26, 'televisor'),
(3, 'ultrabook'),
(4, 'zapatillas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `product` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `product_categories`
--

INSERT INTO `product_categories` (`id`, `product`, `category`) VALUES
(29, 1, 2),
(27, 2, 2),
(42, 3, 2),
(43, 4, 2),
(35, 5, 4),
(30, 6, 4),
(11, 7, 4),
(16, 8, 2),
(2, 9, 4),
(12, 10, 11),
(22, 11, 11),
(21, 12, 11),
(20, 13, 11),
(37, 14, 11),
(10, 15, 8),
(33, 16, 8),
(14, 17, 8),
(5, 18, 8),
(24, 19, 8),
(23, 20, 8),
(1, 21, 2),
(40, 21, 4),
(25, 22, 8),
(38, 23, 8),
(39, 24, 4),
(9, 25, 4),
(41, 26, 4),
(4, 27, 4),
(7, 28, 2),
(31, 29, 2),
(8, 30, 4),
(18, 31, 9),
(36, 32, 9),
(34, 33, 4),
(28, 34, 2),
(17, 35, 4),
(26, 36, 4),
(32, 37, 4),
(15, 38, 4),
(19, 39, 2),
(6, 43, 4),
(13, 44, 4),
(3, 45, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `post` int(11) DEFAULT NULL,
  `price` decimal(16,4) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `sale_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`id`, `post`, `price`, `quantity`, `user`, `sale_date`) VALUES
(1, 4, 35780.0000, 2, 1, '2023-10-12 12:44:49'),
(2, 6, 236800.0000, 3, 1, '2023-10-12 12:44:49'),
(3, 7, 3900.0000, 2, 1, '2023-10-12 12:44:49'),
(4, 1, 50000.0000, 1, 1, '2023-10-12 12:44:49'),
(5, 3, 155320.0000, 5, 6, '2023-10-12 12:44:49'),
(6, 2, 125999.9900, 1, 6, '2023-10-12 12:44:49'),
(7, 4, 35780.0000, 10, 6, '2023-10-12 12:44:49'),
(8, 7, 3900.0000, 10, 17, '2023-10-19 10:52:46'),
(9, 7, 3900.0000, 13, 11, '2023-10-19 10:52:47'),
(10, 6, 236800.0000, 2, 16, '2023-10-19 10:52:48'),
(11, 15, 30501.4461, 3, 17, '2023-10-19 10:52:49'),
(12, 6, 236800.0000, 2, 15, '2023-10-19 10:52:50'),
(13, 14, 132848.2250, 2, 15, '2023-10-19 10:52:51'),
(14, 2, 125999.9900, 2, 12, '2023-10-19 10:52:52'),
(15, 8, 234184.2460, 1, 10, '2023-10-19 10:52:52'),
(16, 13, 363233.5540, 2, 17, '2023-10-19 10:52:53'),
(17, 8, 234184.2460, 1, 13, '2023-10-19 10:52:54'),
(18, 2, 125999.9900, 2, 9, '2023-10-19 10:52:55'),
(19, 17, 44964.0916, 8, 15, '2023-10-19 10:52:55'),
(20, 13, 363233.5540, 2, 14, '2023-10-19 10:52:56'),
(21, 10, 299218.9370, 2, 9, '2023-10-19 10:52:56'),
(22, 9, 55036.1946, 6, 12, '2023-10-19 10:52:57'),
(23, 7, 3900.0000, 10, 15, '2023-10-19 10:52:58'),
(24, 6, 236800.0000, 1, 14, '2023-10-19 10:52:58'),
(25, 3, 155320.0000, 2, 15, '2023-10-19 10:52:59'),
(26, 6, 236800.0000, 2, 12, '2023-10-19 10:52:59'),
(27, 14, 132848.2250, 2, 16, '2023-10-19 10:52:59'),
(28, 15, 30501.4461, 6, 16, '2023-10-19 10:53:00'),
(29, 13, 363233.5540, 2, 10, '2023-10-19 10:53:00'),
(30, 10, 299218.9370, 1, 10, '2023-10-19 10:53:01'),
(31, 5, 431999.9880, 3, 16, '2023-10-19 10:53:02'),
(32, 10, 359062.7244, 2, 10, '2023-10-19 10:53:02'),
(33, 6, 284160.0000, 2, 17, '2023-10-19 10:53:03'),
(34, 14, 159417.8700, 2, 10, '2023-10-19 10:53:03'),
(35, 9, 66043.4335, 5, 16, '2023-10-19 10:53:03'),
(36, 13, 435880.2648, 3, 10, '2023-10-19 10:53:04'),
(37, 14, 159417.8700, 2, 11, '2023-10-19 10:53:07'),
(38, 5, 431999.9880, 3, 12, '2023-10-19 10:53:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `active`) VALUES
(1, 'c215714n', NULL, 'r00t', 1),
(2, 'Cristian', NULL, '1234', 1),
(4, 'lucia', NULL, 'p1mp1', 1),
(5, 'joaquin', NULL, 'n3l4', NULL),
(6, 'leandro', NULL, 'alber38', NULL),
(7, 'joaquin1', NULL, 'g4l4n', NULL),
(8, 'Bret', 'Sincere@april.biz', NULL, 1),
(9, 'Antonette', 'Shanna@melissa.tv', NULL, 1),
(10, 'Samantha', 'Nathan@yesenia.net', NULL, 1),
(11, 'Karianne', 'Julianne.OConner@kory.org', NULL, 1),
(12, 'Kamren', 'Lucio_Hettinger@annie.ca', NULL, 1),
(13, 'Leopoldo_Corkery', 'Karley_Dach@jasper.info', NULL, 1),
(14, 'Elwyn.Skiles', 'Telly.Hoeger@billy.biz', NULL, 1),
(15, 'Maxime_Nienow', 'Sherwood@rosamond.me', NULL, 1),
(16, 'Delphine', 'Chaim_McDermott@dana.io', NULL, 1),
(17, 'Moriah.Stanton', 'Rey.Padberg@karina.biz', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_data`
--

CREATE TABLE `users_data` (
  `id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` enum('M','F','X','PND') DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `id_type` enum('DNI','DNIE','CUIL','PA','CI','LC','LE','RUC','ROOT') DEFAULT NULL,
  `id_number` varchar(25) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users_data`
--

INSERT INTO `users_data` (`id`, `user`, `lastname`, `firstname`, `birthdate`, `gender`, `nationality`, `id_type`, `id_number`, `address`, `phone`) VALUES
(1, 1, 'Racedo', 'Cristian', '1991-04-18', 'M', NULL, 'DNI', '35336446', NULL, NULL),
(2, 6, 'Fernandez', 'Leandro', '2008-10-05', 'M', NULL, 'CUIL', '20-12983294-2', NULL, NULL),
(3, 4, 'Galan', 'Lucia', '1961-05-23', 'F', NULL, 'CUIL', '27-08369065-3', NULL, NULL),
(4, 5, 'Galan', 'Joaquin', '1953-07-21', 'M', NULL, 'CUIL', '20-10809452-5', NULL, NULL),
(5, 8, 'Leanne Graham', 'Bret', NULL, NULL, NULL, NULL, '92998-3874', 'Kulas Light', '1-770-736-8031 x5644'),
(6, 9, 'Ervin Howell', 'Antonette', NULL, NULL, NULL, NULL, '90566-7771', 'Victor Plains', '010-692-6593 x09125'),
(7, 10, 'Clementine Bauch', 'Samantha', NULL, NULL, NULL, NULL, '59590-4157', 'Douglas Extension', '1-463-123-4447'),
(8, 11, 'Patricia Lebsack', 'Karianne', NULL, NULL, NULL, NULL, '53919-4257', 'Hoeger Mall', '493-170-9623 x156'),
(9, 12, 'Chelsey Dietrich', 'Kamren', NULL, NULL, NULL, NULL, '33263', 'Skiles Walks', '(254)954-1289'),
(10, 13, 'Mrs. Dennis Schulist', 'Leopoldo_Corkery', NULL, NULL, NULL, NULL, '23505-1337', 'Norberto Crossing', '1-477-935-8478 x6430'),
(11, 14, 'Kurtis Weissnat', 'Elwyn.Skiles', NULL, NULL, NULL, NULL, '58804-1099', 'Rex Trail', '2.100.676.132'),
(12, 15, 'Nicholas Runolfsdottir V', 'Maxime_Nienow', NULL, NULL, NULL, NULL, '45169', 'Ellsworth Summit', '586.493.6943 x140'),
(13, 16, 'Glenna Reichert', 'Delphine', NULL, NULL, NULL, NULL, '76495-3109', 'Dayna Park', '(775)976-6794 x41206'),
(14, 17, 'Clementina DuBuque', 'Moriah.Stanton', NULL, NULL, NULL, NULL, '31428-2261', 'Kattie Turnpike', '024-648-3804');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `product` (`product`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product` (`product`,`category`),
  ADD KEY `category` (`category`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post` (`post`),
  ADD KEY `user` (`user`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `users_data`
--
ALTER TABLE `users_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user` (`user`),
  ADD UNIQUE KEY `gender` (`gender`,`id_type`,`id_number`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `users_data`
--
ALTER TABLE `users_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`product`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_ibfk_1` FOREIGN KEY (`product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_categories_ibfk_2` FOREIGN KEY (`category`) REFERENCES `categories` (`id`);

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`post`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `users_data`
--
ALTER TABLE `users_data`
  ADD CONSTRAINT `users_data_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
