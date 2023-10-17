-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2023 a las 15:38:50
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
(1, 'Mesa Ratona de Coleccion', '', 4, 22, '2023-10-17 10:28:53', 50000.0000, 6),
(2, 'Sommier Queen Size', '', 4, 24, '2023-10-17 10:28:53', 125999.9900, 2),
(3, 'Tablet Galaxy Tab10', '', 5, 21, '2023-10-17 10:28:53', 155320.0000, 10),
(4, 'Zapatillas Pimpi Edicion Limitada', '', 4, 4, '2023-10-17 10:28:53', 35780.0000, 2000),
(5, 'Aire Split Inverter 3000 Frigorias', '', 6, 27, '2023-10-17 10:28:53', 359999.9900, 10),
(6, 'Smart Tv 59 Pulgadas', '', 6, 26, '2023-10-17 10:28:53', 236800.0000, 50),
(7, 'Acondicionador Pega la Vuelta', '', 5, 45, '2023-10-17 10:28:53', 3900.0000, 5400);

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
(38, 23, 2),
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
(1, 4, 35780.0000, 2, 1, '2023-10-17 10:28:53'),
(2, 6, 236800.0000, 3, 1, '2023-10-17 10:28:53'),
(3, 7, 3900.0000, 2, 1, '2023-10-17 10:28:53'),
(4, 1, 50000.0000, 1, 1, '2023-10-17 10:28:53'),
(5, 3, 155320.0000, 5, 6, '2023-10-17 10:28:53'),
(6, 2, 125999.9900, 1, 6, '2023-10-17 10:28:53'),
(7, 4, 35780.0000, 10, 6, '2023-10-17 10:28:53');

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
(5, 'joaquin', NULL, 'n3l4', 1),
(6, 'leandro', NULL, 'alber38', 1),
(7, 'joaquin1', NULL, 'g4l4n', 1);

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
(4, 5, 'Galan', 'Joaquin', '1953-07-21', 'M', NULL, 'CUIL', '20-10809452-5', NULL, NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users_data`
--
ALTER TABLE `users_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
