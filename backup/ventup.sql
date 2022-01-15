-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-01-2022 a las 01:50:48
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ventup`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `billing`
--

CREATE TABLE `billing` (
  `bill_id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  `bill_title` varchar(20) DEFAULT NULL,
  `bill_data` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `billing`
--

INSERT INTO `billing` (`bill_id`, `user`, `method`, `bill_title`, `bill_data`) VALUES
(1, 1, 2, 'BBVA Debito', '4293-2879-5483-1298'),
(2, 1, 3, 'Galicia Credito', '3298-1235-2983-2348'),
(3, 1, 4, 'BBVA CBU', 'tango.foxtrot.delta'),
(4, 7, 1, 'Pesos', '20-73249328-9'),
(5, 7, 5, 'MP', 'kernel.open.source'),
(6, 7, 6, 'Chequera', '4324-12394293-233'),
(7, 7, 4, 'Santander Rio', '10293478012298200012'),
(8, 12, 3, 'Black America', '1927-8410-2934-8273'),
(9, 12, 3, 'Platinum America', '1092-2039-1927-1239'),
(10, 5, 2, 'Gold Amex', '2398-4293-8472-9289'),
(11, 5, 3, 'Silver Amex', '2345-2349-3894-2928'),
(12, 6, 5, 'UALA', 'juan.perez.uala'),
(13, 6, 5, 'BIMO', '283710923847019238470'),
(14, 6, 3, 'ICBC', '1092-1238-2348-2309'),
(15, 3, 3, 'Nacion', 'cuenta.para.pagar'),
(16, 4, 2, 'BRUBANK', '1209-3948-1029-3847'),
(17, 4, 3, 'Provincia', '1230-7948-1720-3941'),
(18, 4, 5, 'MP', 'user.payment');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`cat_id`, `description`) VALUES
(3, 'alimentos'),
(9, 'autopartes'),
(4, 'botanica'),
(8, 'coleccionables'),
(5, 'electrodomesticos'),
(10, 'entretenimiento'),
(7, 'hogar'),
(2, 'limpieza'),
(6, 'muebles'),
(1, 'tecnologia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pay_methods`
--

CREATE TABLE `pay_methods` (
  `method_id` int(11) NOT NULL,
  `description` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pay_methods`
--

INSERT INTO `pay_methods` (`method_id`, `description`) VALUES
(4, 'cbu'),
(6, 'cheque'),
(3, 'credito'),
(5, 'cvu'),
(2, 'debito'),
(1, 'efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `post_title` varchar(50) DEFAULT NULL,
  `post_description` varchar(250) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT 0,
  `delivery` tinyint(1) DEFAULT 1,
  `post_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`post_id`, `user`, `product`, `post_title`, `post_description`, `price`, `stock`, `is_used`, `delivery`, `post_date`) VALUES
(1, 6, 7, 'Teclado Redragon K552-BB', 'Producto nuevo en caja con garantia de 12 meses', '6670.00', 100, 0, 1, '2021-12-10 20:46:19'),
(2, 1, 1, 'polenta publicado por c215714n', NULL, '220.00', 5000, 0, 1, '2021-12-10 21:17:02'),
(3, 1, 3, 'tomate publicado por c215714n', NULL, '330.00', 1000, 0, 1, '2021-12-10 21:17:02'),
(4, 1, 2, 'tapa de asado publicado por c215714n', NULL, '1210.00', 2994, 0, 1, '2021-12-10 21:17:02'),
(5, 1, 10, 'abono para plantas publicado por c215714n', NULL, '220.00', 4492, 0, 1, '2021-12-10 21:17:02'),
(6, 5, 13, 'microondas publicado por windows', NULL, '17250.00', 2992, 0, 1, '2021-12-10 21:17:02'),
(7, 5, 14, 'aire acondicionado publicado por windows', NULL, '74750.00', 2000, 0, 1, '2021-12-10 21:17:02'),
(8, 5, 12, 'lavarropas publicado por windows', NULL, '41399.99', 2475, 0, 1, '2021-12-10 21:17:02'),
(9, 7, 5, 'pc escritorio publicado por Tux', NULL, '27599.99', 3992, 0, 1, '2021-12-10 21:17:02'),
(10, 7, 8, 'tablet publicado por Tux', NULL, '18399.99', 1999, 0, 1, '2021-12-10 21:17:02'),
(11, 7, 6, 'notebook publicado por Tux', NULL, '138000.00', 4988, 0, 1, '2021-12-10 21:17:02'),
(12, 7, 7, 'teclado publicado por Tux', NULL, '1380.00', 30000, 0, 1, '2021-12-10 21:17:02'),
(13, 12, 9, 'celular publicado por macOS', NULL, '297500.00', 1989, 0, 1, '2021-12-10 21:17:02'),
(14, 12, 17, 'suavizante publicado por macOS', NULL, '425.00', 9989, 0, 1, '2021-12-10 21:17:02'),
(15, 12, 18, 'lavandina publicado por macOS', NULL, '340.00', 14998, 0, 1, '2021-12-10 21:17:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`product_id`, `description`, `category`) VALUES
(1, 'polenta', 3),
(2, 'tapa de asado', 3),
(3, 'tomate', 3),
(4, 'arroz', 3),
(5, 'pc escritorio', 1),
(6, 'notebook', 1),
(7, 'teclado', 1),
(8, 'tablet', 1),
(9, 'celular', 1),
(10, 'abono para plantas', 4),
(11, 'potus', 4),
(12, 'lavarropas', 5),
(13, 'microondas', 5),
(14, 'aire acondicionado', 5),
(15, 'ropero', 6),
(16, 'modular', 6),
(17, 'suavizante', 2),
(18, 'lavandina', 2),
(19, 'quitamanchas', 2),
(20, 'jabon', 2),
(21, 'detergente', 2),
(22, 'lavavajilla', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `post` int(11) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sale_date` datetime DEFAULT current_timestamp(),
  `bill` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`sale_id`, `user`, `post`, `price`, `quantity`, `sale_date`, `bill`) VALUES
(1, 4, 13, '350000.00', 2, '2021-12-17 20:17:59', 17),
(2, 4, 8, '35999.99', 5, '2021-12-17 20:17:59', 18),
(3, 4, 10, '15999.99', 1, '2021-12-17 20:17:59', 18),
(4, 4, 8, '35999.99', 10, '2021-12-17 20:17:59', 17),
(5, 1, 14, '425.00', 9, '2021-12-17 21:42:21', 2),
(6, 3, 11, '138000.00', 9, '2021-12-17 21:42:21', 15),
(7, 12, 4, '1210.00', 6, '2021-12-17 21:42:21', 8),
(8, 5, 5, '220.00', 8, '2021-12-17 21:42:21', 11),
(9, 7, 14, '425.00', 1, '2021-12-17 21:42:21', 4),
(10, 3, 14, '425.00', 1, '2021-12-17 21:42:21', 15),
(11, 5, 11, '138000.00', 3, '2021-12-17 21:42:21', 11),
(12, 1, 9, '27599.99', 8, '2021-12-17 21:42:21', 2),
(13, 7, 8, '41399.99', 10, '2021-12-17 21:42:21', 4),
(14, 6, 6, '17250.00', 8, '2021-12-17 21:42:21', 14),
(15, 12, 13, '297500.00', 9, '2021-12-17 21:42:21', 8),
(16, 12, 15, '340.00', 2, '2021-12-17 21:42:21', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shopping_chart`
--

CREATE TABLE `shopping_chart` (
  `chart_id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `post` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_pass`) VALUES
(1, 'c215714n', 'cristiandracedo@hotmail.com', 'root'),
(3, 'cristian', 'cristiandracedo@gmail.com', '1234'),
(4, 'user', 'user@domain', 'pass'),
(5, 'windows', 'bill_gates@microsoft', 'ms-dos!7.0'),
(6, 'juan_perez', 'juanp@gmail.com', 'juanit0!'),
(7, 'Tux', 'linus_torvalds@linux.com', 'kernel!5.3'),
(12, 'macOS', 'steve_jobs@apple.com', 'isaac_newton'),
(13, 'john_doe', 'johndoe@unknown.com', 'mrNobody');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_data`
--

CREATE TABLE `users_data` (
  `data_id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `cuit` char(13) DEFAULT NULL,
  `phone` varchar(18) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users_data`
--

INSERT INTO `users_data` (`data_id`, `user`, `first_name`, `last_name`, `birth_date`, `cuit`, `phone`, `address`, `zip_code`, `nationality`) VALUES
(10, 1, 'Cristian Damian', 'Racedo', '1991-04-18', '20-35336446-5', NULL, NULL, NULL, NULL),
(11, 6, 'Juan', 'Perez', '1965-07-09', '30-03034560-7', NULL, NULL, NULL, NULL),
(12, 4, 'John', 'Doe', '1980-07-04', '25-12342732-8', NULL, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`bill_id`),
  ADD UNIQUE KEY `user` (`user`,`bill_data`),
  ADD KEY `method` (`method`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indices de la tabla `pay_methods`
--
ALTER TABLE `pay_methods`
  ADD PRIMARY KEY (`method_id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD UNIQUE KEY `user` (`user`,`product`,`post_title`,`post_description`,`price`,`stock`,`is_used`,`delivery`),
  ADD KEY `product` (`product`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `description` (`description`),
  ADD KEY `category` (`category`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `user` (`user`),
  ADD KEY `post` (`post`),
  ADD KEY `bill` (`bill`);

--
-- Indices de la tabla `shopping_chart`
--
ALTER TABLE `shopping_chart`
  ADD PRIMARY KEY (`chart_id`),
  ADD UNIQUE KEY `user` (`user`,`post`),
  ADD KEY `post` (`post`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- Indices de la tabla `users_data`
--
ALTER TABLE `users_data`
  ADD PRIMARY KEY (`data_id`),
  ADD UNIQUE KEY `cuit` (`cuit`),
  ADD UNIQUE KEY `first_name` (`first_name`,`last_name`,`birth_date`,`address`),
  ADD KEY `user` (`user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `billing`
--
ALTER TABLE `billing`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pay_methods`
--
ALTER TABLE `pay_methods`
  MODIFY `method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `shopping_chart`
--
ALTER TABLE `shopping_chart`
  MODIFY `chart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `users_data`
--
ALTER TABLE `users_data`
  MODIFY `data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `billing_ibfk_2` FOREIGN KEY (`method`) REFERENCES `pay_methods` (`method_id`);

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`product`) REFERENCES `products` (`product_id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`cat_id`);

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`post`) REFERENCES `posts` (`post_id`),
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`bill`) REFERENCES `billing` (`bill_id`);

--
-- Filtros para la tabla `shopping_chart`
--
ALTER TABLE `shopping_chart`
  ADD CONSTRAINT `shopping_chart_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `shopping_chart_ibfk_2` FOREIGN KEY (`post`) REFERENCES `posts` (`post_id`);

--
-- Filtros para la tabla `users_data`
--
ALTER TABLE `users_data`
  ADD CONSTRAINT `users_data_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
