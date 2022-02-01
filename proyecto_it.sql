-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-02-2022 a las 19:47:00
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
-- Base de datos: `proyecto_it`
--
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `description` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`cat_id`, `description`) VALUES
(8, 'entretenimiento'),
(6, 'ferreteria'),
(2, 'hogar'),
(4, 'indumentaria'),
(3, 'maquillaje'),
(5, 'mecanica'),
(7, 'nft'),
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
(3, 'cbu'),
(1, 'credito'),
(4, 'cvu'),
(2, 'debito'),
(5, 'efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `post_title` varchar(50) DEFAULT NULL,
  `post_description` varchar(200) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `post_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`post_id`, `user`, `product`, `post_title`, `post_description`, `stock`, `price`, `post_date`) VALUES
(1, 1, 3, 'pantalon vendido por c215714n', NULL, 53, '600.00', '2022-01-14 15:47:48'),
(2, 4, 1, 'remera vendido por Tux', NULL, 85, '1440.00', '2022-01-14 15:47:48'),
(3, 4, 2, 'camisa vendido por Tux', NULL, 195, '2160.00', '2022-01-14 15:47:48'),
(4, 4, 3, 'pantalon vendido por Tux', NULL, 299, '1800.00', '2022-01-14 15:47:48'),
(5, 6, 10, 'monitor vendido por macOS', NULL, 487, '46799.98', '2022-01-14 15:47:48'),
(6, 6, 9, 'celular vendido por macOS', NULL, 2000, '323999.98', '2022-01-14 15:47:48'),
(7, 5, 8, 'laptop vendido por Windows', NULL, 196, '117900.00', '2022-01-14 15:47:48'),
(8, 5, 8, 'laptop vendido por Windows', NULL, 200, '161639.98', '2022-01-14 15:47:48'),
(9, 5, 7, 'teclado vendido por Windows', NULL, 750, '10440.00', '2022-01-14 15:47:48'),
(10, 5, 10, 'monitor vendido por Windows', NULL, 998, '36000.00', '2022-01-14 15:47:48'),
(11, 4, 12, 'neumaticos vendido por Tux', NULL, 100, '33000.00', '2022-01-14 15:47:48'),
(12, 4, 12, 'neumaticos vendido por Tux', NULL, 297, '59400.00', '2022-01-14 15:47:48'),
(13, 6, 4, 'aire acondicionado vendido por macOS', NULL, 9997, '120399.99', '2022-01-14 15:47:48'),
(14, 6, 5, 'televisor vendido por macOS', NULL, 5000, '49000.00', '2022-01-14 15:47:48'),
(15, 6, 6, 'parlante vendido por macOS', NULL, 500, '21000.00', '2022-01-14 15:47:48'),
(16, 3, 4, 'Split 5000 frigorias Samsung', 'Ultimas unidades de aire acondicionado split inverter, 5000 frigorias, dimensiones 100cmx50cmx30cm', 98, '63000.00', '2022-01-14 15:47:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category` int(11) DEFAULT NULL,
  `product` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`product_id`, `category`, `product`) VALUES
(1, 4, 'remera'),
(2, 4, 'camisa'),
(3, 4, 'pantalon'),
(4, 2, 'aire acondicionado'),
(5, 2, 'televisor'),
(6, 2, 'parlante'),
(7, 1, 'teclado'),
(8, 1, 'laptop'),
(9, 1, 'celular'),
(10, 1, 'monitor'),
(12, 5, 'neumaticos'),
(13, 6, 'martillo'),
(14, 6, 'destornillador'),
(15, 6, 'serrucho'),
(16, 6, 'tenaza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `post` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `wallet` int(11) DEFAULT NULL,
  `sale_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`sale_id`, `user`, `post`, `quantity`, `price`, `wallet`, `sale_date`) VALUES
(1, 4, 1, 10, '500.00', 10, '2022-01-18 15:08:33'),
(2, 6, 2, 6, '1200.00', 8, '2022-01-18 15:08:33'),
(3, 5, 5, 3, '25999.99', 13, '2022-01-18 15:08:33'),
(4, 3, 10, 2, '20000.00', 4, '2022-01-18 15:08:33'),
(5, 3, 2, 1, '1200.00', 4, '2022-01-18 15:08:33'),
(6, 5, 12, 3, '36000.00', 13, '2022-01-18 15:08:33'),
(7, 4, 7, 4, '65500.00', 10, '2022-01-18 15:08:33'),
(8, 5, 3, 5, '1800.00', 13, '2022-01-18 15:08:33'),
(9, 4, 5, 10, '25999.99', 10, '2022-01-18 15:08:33'),
(10, 3, 4, 1, '1500.00', 4, '2022-01-18 15:08:33'),
(11, 6, 1, 2, '500.00', 8, '2022-01-18 15:08:33'),
(12, 6, 2, 8, '1200.00', 8, '2022-01-18 15:08:33'),
(13, 5, 16, 5, '45000.00', 13, '2022-01-21 15:02:19'),
(15, 1, 13, 3, '120399.99', 1, '2022-01-25 15:15:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_pass` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_pass`) VALUES
(1, 'c215714n', 'cristiandracedo@hotmail.com', 'root'),
(3, 'racedo_cristian', 'cristiandracedo@gmail.com', 'pass'),
(4, 'Tux', 'l.torvalds@linux.com', 'gnu_kernel'),
(5, 'Windows', 'b.gates@microsoft.com', 'system_32'),
(6, 'macOS', 's.jobs@apple.com', 'macinstosh'),
(7, 'newuser', 'user@mymail.com', 'simple_pass');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_data`
--

CREATE TABLE `users_data` (
  `data_id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `cuit` char(13) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` enum('M','F','O') DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `profession` varchar(50) DEFAULT NULL,
  `education` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users_data`
--

INSERT INTO `users_data` (`data_id`, `user`, `first_name`, `last_name`, `cuit`, `birth_date`, `gender`, `address`, `phone`, `profession`, `education`) VALUES
(1, 1, 'Cristian Damian', 'Racedo', '20-35336446-5', '1991-04-18', 'M', NULL, NULL, 'instructor', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wallets`
--

CREATE TABLE `wallets` (
  `wallet_id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `wallet_title` varchar(20) DEFAULT NULL,
  `wallet_data` varchar(25) DEFAULT NULL,
  `method` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `wallets`
--

INSERT INTO `wallets` (`wallet_id`, `user`, `wallet_title`, `wallet_data`, `method`) VALUES
(1, 1, 'BBVA Credito', '1289-3410-2318-1234', 1),
(2, 1, 'ICBC Credito', '1720-9384-7102-3984', 1),
(3, 1, 'BBVA Debito', '1029-7834-0123-1284', 2),
(4, 3, 'MP', 'alpha.tango.foxtrot', 3),
(5, 3, 'Uala', 'delta.epsilon.pi', 4),
(6, 6, 'American', '1982310293847102938470', 3),
(7, 6, 'Caiman', '1230941293841492873470', 3),
(8, 6, 'Credit American', '4293-2834-2347-9128', 1),
(9, 6, 'Credit Caiman', '2934-7891-2831-1238', 1),
(10, 4, 'PayPal', 'kernel.gnu.opensource', 4),
(11, 4, 'BlueWallet', 'asd8709823ha89sdf1h2lkasd', 4),
(12, 5, 'Continental', 'betamax.video.cassette', 3),
(13, 5, 'Santander Credit', '0192-8370-4182-3247', 1),
(14, 5, 'HSBC Credit', '2903-4710-2938-1209-1384', 1);

--
-- Índices para tablas volcadas
--

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
  ADD KEY `user` (`user`),
  ADD KEY `product` (`product`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product` (`product`),
  ADD KEY `category` (`category`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `user` (`user`),
  ADD KEY `post` (`post`),
  ADD KEY `wallet` (`wallet`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
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
-- Indices de la tabla `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`wallet_id`),
  ADD UNIQUE KEY `user` (`user`,`wallet_data`),
  ADD KEY `method` (`method`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pay_methods`
--
ALTER TABLE `pay_methods`
  MODIFY `method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `users_data`
--
ALTER TABLE `users_data`
  MODIFY `data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `wallets`
--
ALTER TABLE `wallets`
  MODIFY `wallet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

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
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`wallet`) REFERENCES `wallets` (`wallet_id`);

--
-- Filtros para la tabla `users_data`
--
ALTER TABLE `users_data`
  ADD CONSTRAINT `users_data_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);

--
-- Filtros para la tabla `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `wallets_ibfk_2` FOREIGN KEY (`method`) REFERENCES `pay_methods` (`method_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
