-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-08-2022 a las 02:55:56
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecommerce_it`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`) VALUES
(4, 'Adadis'),
(11, 'Chebrolet'),
(14, 'de Luna'),
(3, 'Fürd'),
(1, 'H3.14'),
(13, 'jigabit'),
(10, 'LJ'),
(5, 'Naik'),
(8, 'Panoramico'),
(12, 'puerto de patos'),
(6, 'Pumba'),
(7, 'Sorny'),
(9, 'Tapper'),
(15, 'tong'),
(2, 'zamzung');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(12, 'alimentos'),
(10, 'Automotor'),
(7, 'Bazar'),
(8, 'Biblioteca'),
(3, 'Botanica'),
(6, 'Calzado'),
(4, 'Electronica'),
(2, 'Hogar'),
(5, 'Indumentaria'),
(9, 'Jugueteria'),
(11, 'NFT'),
(1, 'Tecnologia');

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
(3, 'credito'),
(2, 'debito'),
(1, 'efectivo'),
(4, 'transferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `post_title` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` decimal(18,4) DEFAULT NULL,
  `post_date` datetime DEFAULT current_timestamp(),
  `post_update` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`post_id`, `user`, `product`, `post_title`, `description`, `stock`, `price`, `post_date`, `post_update`) VALUES
(1, 1, 6, 'Memoria HyperX 16gb ddr4', NULL, 13, '31850.0000', '2022-08-17 20:31:48', '2022-08-17 20:31:48'),
(2, 4, 9, 'Zapatillas Talles del 21 al 50', NULL, 4950, '31999.0000', '2022-08-17 20:31:48', '2022-08-17 20:31:48'),
(3, 1, 10, 'Tarjeta RX3070 Gddr6 10Gb', NULL, 49, '370500.0000', '2022-08-17 20:31:48', '2022-08-17 20:31:48'),
(4, 1, 2, 'Tab A13\"', NULL, 196, '84890.0000', '2022-08-17 20:31:48', '2022-08-17 20:31:48'),
(5, 3, 7, 'Calzado Air MAX Talles del 39 al 70', NULL, 2475, '45800.0000', '2022-08-17 20:31:48', '2022-08-17 20:31:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `model` varchar(20) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `model`, `brand`, `category`) VALUES
(2, 'Tablet', NULL, 2, 1),
(3, 'Tablet', NULL, 10, 1),
(4, 'Procesador Intel', NULL, 2, 4),
(6, 'Memoria RAM', NULL, 13, 4),
(7, 'air max', NULL, 5, 6),
(8, 'predeitor', NULL, 4, 6),
(9, 'adadis max', NULL, 4, 6),
(10, 'Placa de video', 'rx3070', 13, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `post` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(18,4) DEFAULT NULL,
  `sale_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`sale_id`, `post`, `user`, `quantity`, `price`, `sale_date`) VALUES
(1, 4, 7, 1, '65300.0000', '2022-08-17 20:36:24'),
(2, 1, 5, 2, '24500.0000', '2022-08-17 20:36:24'),
(3, 4, 6, 1, '65300.0000', '2022-08-17 20:36:24'),
(4, 1, 3, 1, '24500.0000', '2022-08-17 20:48:05'),
(5, 2, 4, 50, '31999.0000', '2022-08-17 20:48:05'),
(6, 3, 7, 1, '285000.0000', '2022-08-17 20:48:05'),
(7, 4, 7, 2, '65300.0000', '2022-08-17 20:48:05'),
(8, 5, 4, 25, '45800.0000', '2022-08-17 20:48:05'),
(9, 1, 4, 4, '31850.0000', '2022-08-24 20:13:18'),
(11, 3, 6, 2, '370500.0000', '2022-08-29 20:46:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) DEFAULT 'abcd1234'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`) VALUES
(1, 'c215714n', 'cristiandracedo@hotmail.com', 'root'),
(3, 'Cristian', 'cristiandracedo@gmail.com', 'abcd1234'),
(4, 'Batman', 'bruce@waynetech.com', 'I4mB4tm4n'),
(5, 'Wolvie', 'loga@x-men.com', 'berserker'),
(6, 'wonder', 'prince.diana@amazons.com', 'athenea'),
(7, 'storn', 'ororo.monro@x-men.com', 'thunders');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_data`
--

CREATE TABLE `users_data` (
  `data_id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `cuil` char(13) DEFAULT NULL,
  `city` char(2) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users_data`
--

INSERT INTO `users_data` (`data_id`, `user`, `first_name`, `last_name`, `birth`, `cuil`, `city`, `address`, `phone`) VALUES
(1, 1, 'Cristian', 'Racedo', '1991-04-18', '20-35336446-5', NULL, NULL, NULL),
(2, 3, 'juan', 'Perez', NULL, '20-47289328-1', NULL, NULL, NULL),
(3, 4, 'Bruce', 'Wayne', '1970-08-18', '20-27649128-4', NULL, NULL, NULL),
(4, 5, 'James', 'Howlett', '1810-05-25', '20-02817239-1', NULL, NULL, NULL),
(5, 6, 'Diana', 'Prince', '1990-06-12', '27-37644126-4', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wallets`
--

CREATE TABLE `wallets` (
  `wallet_id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  `wallet_name` varchar(50) DEFAULT NULL,
  `wallet_data` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `wallets`
--

INSERT INTO `wallets` (`wallet_id`, `user`, `method`, `wallet_name`, `wallet_data`) VALUES
(1, 1, 2, 'VISA BBVA', '1235-1238-1283-2980'),
(2, 4, 3, 'AMEX Platinum', '0335-1938-8332-1580'),
(3, 4, 2, 'ICBC Black', '1235-1548-1233-5280'),
(4, 6, 4, 'MP', '6413412035123812832980'),
(5, 5, 4, 'Provicia', '1235123812832980893201'),
(6, 6, 3, 'VISA HSBC', '4215-1282-9483-2980');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`),
  ADD UNIQUE KEY `brand_name` (`brand_name`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

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
  ADD UNIQUE KEY `product_name` (`product_name`,`model`,`brand`),
  ADD KEY `brand` (`brand`),
  ADD KEY `category` (`category`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `post` (`post`),
  ADD KEY `user` (`user`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `users_data`
--
ALTER TABLE `users_data`
  ADD PRIMARY KEY (`data_id`),
  ADD UNIQUE KEY `cuil` (`cuil`),
  ADD UNIQUE KEY `first_name` (`first_name`,`last_name`,`birth`,`address`,`phone`),
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
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pay_methods`
--
ALTER TABLE `pay_methods`
  MODIFY `method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users_data`
--
ALTER TABLE `users_data`
  MODIFY `data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `wallets`
--
ALTER TABLE `wallets`
  MODIFY `wallet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category`) REFERENCES `categories` (`category_id`);

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`post`) REFERENCES `posts` (`post_id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);

--
-- Filtros para la tabla `users_data`
--
ALTER TABLE `users_data`
  ADD CONSTRAINT `users_data_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);

--
-- Filtros para la tabla `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_ibfk_1` FOREIGN KEY (`method`) REFERENCES `pay_methods` (`method_id`),
  ADD CONSTRAINT `wallets_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
