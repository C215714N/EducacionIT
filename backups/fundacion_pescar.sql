-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-09-2021 a las 20:17:10
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fundacion_pescar`
--
CREATE DATABASE IF NOT EXISTS `fundacion_pescar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fundacion_pescar`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounting`
--

DROP TABLE IF EXISTS `accounting`;
CREATE TABLE IF NOT EXISTS `accounting` (
  `account_id` int(11) NOT NULL,
  `sale` int(11) NOT NULL,
  `pay_m` int(11) NOT NULL,
  `type` enum('debe','haber') NOT NULL DEFAULT 'debe'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `accounting`
--

INSERT INTO `accounting` (`account_id`, `sale`, `pay_m`, `type`) VALUES
(1, 1, 2, 'debe'),
(2, 3, 4, 'debe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `billing`
--

DROP TABLE IF EXISTS `billing`;
CREATE TABLE IF NOT EXISTS `billing` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_m` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `pay_title` varchar(20) NOT NULL,
  `pay_data` varchar(50) NOT NULL,
  `load_date` date DEFAULT current_timestamp(),
  PRIMARY KEY (`bill_id`),
  UNIQUE KEY `pay_m` (`pay_m`,`user`,`pay_data`),
  KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `billing`
--

INSERT INTO `billing` (`bill_id`, `pay_m`, `user`, `pay_title`, `pay_data`, `load_date`) VALUES
(1, 2, 1, '', '2094-2349-2348-1234', '2021-09-01'),
(2, 2, 2, '', '7822-1234-7438-1283', '2021-09-01'),
(3, 3, 1, '', '7438-1283-1238-1238', '2021-09-01'),
(4, 4, 1, '', '2374091823740123823', '2021-09-01'),
(5, 5, 2, '', '2983741293048172034', '2021-09-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`cat_id`, `description`) VALUES
(12, 'arte'),
(2, 'articulos de limpieza'),
(1, 'autopartes'),
(3, 'deportes'),
(4, 'electrodomesticos'),
(10, 'entretenimiento'),
(5, 'herramientas'),
(6, 'hogar'),
(7, 'indumentaria'),
(8, 'jardineria'),
(9, 'tecnologia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pay_methods`
--

DROP TABLE IF EXISTS `pay_methods`;
CREATE TABLE IF NOT EXISTS `pay_methods` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pay_id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pay_methods`
--

INSERT INTO `pay_methods` (`pay_id`, `description`) VALUES
(4, 'cbu'),
(3, 'credito'),
(5, 'cvu'),
(2, 'debito'),
(1, 'efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `post_title` varchar(50) DEFAULT NULL,
  `post_description` varchar(200) DEFAULT NULL,
  `price` decimal(11,2) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT 0,
  `delivery` tinyint(1) DEFAULT 0,
  `post_date` date DEFAULT NULL,
  `post_update` date DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `product` (`product`),
  KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`post_id`, `product`, `user`, `post_title`, `post_description`, `price`, `quantity`, `is_used`, `delivery`, `post_date`, `post_update`) VALUES
(1, 7, 5, 'Art. Deportivo -  (Long Gino)', NULL, '1200.00', 341, 0, 0, '2021-08-27', '2021-08-27'),
(2, 20, 5, 'Indumentaria para  (Long Gino)', NULL, '700.00', 341, 0, 0, '2021-08-27', '2021-08-27'),
(3, 22, 5, 'Indumentaria para  (Long Gino)', NULL, '400.00', 342, 0, 0, '2021-08-27', '2021-08-27'),
(4, 4, 6, 'Art. Limpieza -  (Macaya Sebastian)', NULL, '400.00', 342, 0, 0, '2021-08-27', '2021-08-27'),
(5, 5, 6, 'Art. Limpieza -  (Macaya Sebastian)', NULL, '1200.00', 348, 0, 0, '2021-08-27', '2021-08-27'),
(6, 2, 6, 'Autoparte -  (Macaya Sebastian)', NULL, '50000.00', 348, 0, 0, '2021-08-27', '2021-08-27'),
(7, 10, 3, 'Electrodomestico -  (Martinez Marcelo)', NULL, '700.00', 344, 0, 0, '2021-08-27', '2021-08-27'),
(8, 15, 3, 'Herramienta -  (Martinez Marcelo)', NULL, '400.00', 332, 0, 0, '2021-08-27', '2021-08-27'),
(9, 18, 3, 'Art. del Hogar -  (Martinez Marcelo)', NULL, '700.00', 348, 0, 0, '2021-08-27', '2021-08-27'),
(10, 3, 4, 'Autoparte -  (Molina Pablo)', NULL, '50000.00', 341, 0, 0, '2021-08-27', '2021-08-27'),
(11, 6, 4, 'Art. Limpieza -  (Molina Pablo)', NULL, '1200.00', 331, 0, 0, '2021-08-27', '2021-08-27'),
(12, 4, 4, 'Art. Limpieza -  (Molina Pablo)', NULL, '400.00', 348, 0, 0, '2021-08-27', '2021-08-27'),
(13, 10, 2, 'Electrodomestico - Racedo Cristian', 'Ultimos lavarropas en muy buen estado, se vende por liquidacion de stock', '700.00', 348, 0, 0, '2021-08-27', '2021-08-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product` varchar(50) NOT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product` (`product`),
  KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`product_id`, `product`, `category`) VALUES
(1, 'neumatico', 1),
(2, 'optica', 1),
(3, 'radio', 1),
(4, 'alcohol en gel', 2),
(5, 'suavizante', 2),
(6, 'detergente', 2),
(7, 'calzado', 3),
(8, 'camiseta', 3),
(9, 'guantes de box', 3),
(10, 'lavarropas', 4),
(11, 'microondas', 4),
(12, 'secarropas', 4),
(13, 'serrucho', 5),
(14, 'martillo', 5),
(15, 'destornillador', 5),
(16, 'pala', 5),
(17, 'sommier', 6),
(18, 'modular', 6),
(19, 'pintura', 6),
(20, 'camisa', 7),
(21, 'saco', 7),
(22, 'corbata', 7),
(23, 'abono', 8),
(24, 'manguera', 8),
(25, 'rastrillo', 8),
(26, 'notebook', 9),
(27, 'pc escritorio', 9),
(28, 'teclado', 9),
(29, 'monitor', 9),
(30, 'pullover', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `post` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `sell_date` datetime DEFAULT current_timestamp(),
  `state` enum('reintegro','cancelado','en proceso','entregado') DEFAULT 'en proceso',
  PRIMARY KEY (`sale_id`),
  KEY `user` (`user`),
  KEY `post` (`post`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`sale_id`, `user`, `post`, `quantity`, `price`, `sell_date`, `state`) VALUES
(1, 1, 1, 5, '1200.00', '2021-08-30 00:00:00', 'reintegro'),
(2, 1, 7, 2, '700.00', '2021-08-30 00:00:00', 'entregado'),
(3, 2, 11, 3, '1200.00', '2021-08-30 00:00:00', 'cancelado'),
(4, 4, 8, 4, '400.00', '2021-08-30 00:00:00', 'en proceso'),
(5, 5, 4, 4, '400.00', '2021-08-30 00:00:00', 'cancelado'),
(6, 6, 10, 5, '50000.00', '2021-08-30 00:00:00', 'entregado'),
(7, 6, 11, 12, '1200.00', '2021-08-30 00:00:00', 'en proceso'),
(8, 4, 8, 10, '400.00', '2021-08-30 00:00:00', 'en proceso'),
(9, 3, 3, 4, '400.00', '2021-08-30 00:00:00', 'entregado'),
(10, 3, 2, 5, '700.00', '2021-08-30 00:00:00', 'cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_password` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
(1, 'Cristian Racedo', 'cristiandracedo@gmail.com', ''),
(2, 'c215714n', 'cristiandracedo@hotmail.com', 'admin'),
(3, 'Marcelo Martinez', 'mjmserviciostecnicos@gmail.com', ''),
(4, 'Pablo Molina', 'palitomolina22@gmail.com', ''),
(5, 'Gino Long', 'ginolong@hotmail.com', ''),
(6, 'Sebastian Macaya', 'contacto@sebastianmacaya.com', ''),
(10, 'Tux', 'lt@linux.com', ''),
(12, 'test', 'test@f_pescar', 'root');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_data`
--

DROP TABLE IF EXISTS `users_data`;
CREATE TABLE IF NOT EXISTS `users_data` (
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `cuit` char(13) NOT NULL,
  PRIMARY KEY (`data_id`),
  UNIQUE KEY `cuit` (`cuit`),
  KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users_data`
--

INSERT INTO `users_data` (`data_id`, `user`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `cuit`) VALUES
(1, 1, 'Cristian', 'Racedo', '1991-04-18', 'male', '111098506', '20-35336446-5'),
(3, 6, 'Sebastian', 'Macaya', NULL, 'male', '1171135331', '20-03034567-3'),
(4, 5, 'Gino', 'Long', NULL, 'male', '1182281142', '20-29386382-2'),
(5, 4, 'Pablo', 'Molina', NULL, 'male', '1117899720', '20-10234882-6'),
(10, 3, 'Marcelo', 'Martinez', NULL, 'male', '1122555174', '25-08291283-2'),
(13, 2, 'Cristian', 'Racedo', '1991-04-18', 'male', '1158976713', '20-64463353-5'),
(14, 10, 'Linus', 'Torvald', NULL, 'male', '1147118050', '30-03020130-2');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`pay_m`) REFERENCES `pay_methods` (`pay_id`),
  ADD CONSTRAINT `billing_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`product`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);

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
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`post`) REFERENCES `posts` (`post_id`);

--
-- Filtros para la tabla `users_data`
--
ALTER TABLE `users_data`
  ADD CONSTRAINT `users_data_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
