-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2021 a las 16:17:13
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
-- Base de datos: `pepe_y_los_globos_store`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(20) DEFAULT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_pass`) VALUES
(1, 'c215714n', 'cristiandracedo@hotmail.com', 'root'),
(2, 'oracle', 'mysql@oracle.com', 'sql_pass'),
(3, NULL, 'cristiandracedo@gmail.com', 'root'),
(4, 'pepito', 'pepe_1234@hotmail.com', ''),
(5, 'juan_perez', 'juan_perez@gmail.com', ''),
(6, 'Jose', 'jo_ar@live.com', ''),
(7, 'chayanne', 'chayanne_123@gmail.com', ''),
(8, 'diego_coleman', 'coleman_diego@outlook.com', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers_data`
--

CREATE TABLE `customers_data` (
  `data_id` int(11) NOT NULL,
  `customer` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `cuit` char(13) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `customers_data`
--

INSERT INTO `customers_data` (`data_id`, `customer`, `first_name`, `last_name`, `birth`, `cuit`, `address`, `phone`) VALUES
(1, 1, 'Cristian Damian', 'Racedo', '1991-04-18', '20-35336446-5', NULL, '(5411)0000-0000'),
(2, 3, 'Cristian', 'Racedo', '1991-04-18', '27-35336666-6', NULL, '(5411)0000-0000'),
(3, 4, 'Pepito', 'Lopez', '1972-02-29', '20-12374753-8', NULL, '(5411)0000-0000'),
(4, 5, 'Juan', 'Perez', '1999-10-31', '32-19283593-6', NULL, '(5411)0000-0000'),
(5, 6, 'Jose', 'Carreras', '1980-05-15', '27-17923819-5', NULL, '(5411)0000-0000'),
(6, 7, 'Elmer', 'Figueroa Arce', '1968-06-28', '33-01237382-3', NULL, '(5411)0000-0000'),
(7, 8, 'Diego', 'Coleman', '2001-03-20', '29-54238492-2', NULL, '(5411)0000-0000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `price` decimal(11,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`product_id`, `description`, `stock`, `price`) VALUES
(1, 'Notebook Elitebook 8470p', 100, '82278.79'),
(2, 'Netbook NP150', 240, '44285.99'),
(3, 'Notebook Vivobook x512', 290, '84699.99'),
(4, 'Multifuncion XP1150', 150, '24841.30'),
(5, 'Pack 6u. Gaseosa 3L', 500, '2400.00'),
(6, 'iPhone 4s A1387', 130, '7865.00'),
(7, 'Galaxy Core I8260', 60, '6534.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `providers`
--

CREATE TABLE `providers` (
  `provider_id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `cuit` char(13) NOT NULL,
  `address` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `providers`
--

INSERT INTO `providers` (`provider_id`, `description`, `cuit`, `address`) VALUES
(1, 'hp', '30-71480937-3', NULL),
(2, 'samsung', '30-68412579-2', NULL),
(3, 'cannon', '30-61697108-1', NULL),
(4, 'coca cola', '30-52539008-6', NULL),
(5, 'asus', '20-21918948-7', NULL),
(6, 'apple', '30-70722404-1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `customer` int(11) DEFAULT NULL,
  `pay_method` enum('credito','debito','efectivo','transferencia','virtual','cheque','desposito') DEFAULT 'efectivo',
  `sale_date` datetime DEFAULT current_timestamp(),
  `total` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`sale_id`, `customer`, `pay_method`, `sale_date`, `total`) VALUES
(1, 7, 'debito', '2021-10-27 09:24:18', '4023540.00'),
(2, 4, 'virtual', '2021-10-27 09:24:18', '146482.60'),
(3, 8, 'efectivo', '2021-10-27 09:24:18', '25068.00'),
(4, 5, 'transferencia', '2021-10-27 09:24:18', '959100.40'),
(5, 7, 'debito', '2021-10-27 09:24:18', '24841.30'),
(6, 7, 'credito', '2021-10-27 09:24:18', '24000.00'),
(7, 7, 'efectivo', '2021-10-27 09:24:18', '378243.55'),
(8, 5, 'virtual', '2021-10-27 09:24:18', '469842.95'),
(9, 6, 'credito', '2021-10-27 09:24:18', '1139573.05'),
(10, 6, 'transferencia', '2021-10-27 09:24:18', '82278.79'),
(11, 6, 'efectivo', '2021-10-27 09:24:18', '24000.00'),
(12, 5, 'efectivo', '2021-10-27 09:24:18', '71995.00'),
(13, 5, 'virtual', '2021-10-27 09:24:18', '100744.60'),
(14, 7, 'transferencia', '2021-10-27 09:24:18', '69127.29'),
(15, 6, 'credito', '2021-10-27 09:24:18', '834893.90'),
(16, 5, 'efectivo', '2021-10-27 09:24:18', '178825.88');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales_detail`
--

CREATE TABLE `sales_detail` (
  `detail_id` int(11) NOT NULL,
  `sale` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sales_detail`
--

INSERT INTO `sales_detail` (`detail_id`, `sale`, `product`, `quantity`, `price`) VALUES
(1, 1, 3, 20, '84699.99'),
(2, 1, 2, 20, '44285.99'),
(3, 1, 1, 10, '82278.79'),
(4, 1, 4, 25, '24841.30'),
(5, 2, 4, 2, '24841.30'),
(6, 2, 6, 4, '7865.00'),
(7, 2, 7, 10, '6534.00'),
(8, 3, 5, 5, '2400.00'),
(9, 3, 7, 2, '6534.00'),
(10, 4, 3, 5, '84699.99'),
(11, 4, 1, 5, '82278.79'),
(12, 4, 4, 5, '24841.30'),
(13, 5, 4, 1, '24841.30'),
(14, 6, 5, 10, '2400.00'),
(15, 7, 1, 2, '82278.79'),
(16, 7, 2, 1, '44285.99'),
(17, 7, 3, 2, '84699.99'),
(18, 8, 2, 5, '44285.99'),
(19, 8, 4, 10, '24841.30'),
(20, 9, 3, 8, '84699.99'),
(21, 9, 1, 4, '82278.79'),
(22, 9, 2, 3, '44285.99'),
(23, 10, 1, 1, '82278.79'),
(24, 11, 5, 10, '2400.00'),
(25, 12, 6, 5, '7865.00'),
(26, 12, 7, 5, '6534.00'),
(27, 13, 4, 2, '24841.30'),
(28, 13, 6, 4, '7865.00'),
(29, 13, 7, 3, '6534.00'),
(30, 14, 4, 1, '24841.30'),
(31, 14, 2, 1, '44285.99'),
(32, 15, 1, 5, '82278.79'),
(33, 15, 3, 5, '84699.99'),
(34, 16, 2, 2, '44285.99'),
(35, 16, 6, 2, '7865.00'),
(36, 16, 4, 3, '24841.30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `provider` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `transaction_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `provider`, `product`, `quantity`, `price`, `transaction_date`) VALUES
(1, 1, 1, 50, '55999.99', '2021-10-27 09:24:18'),
(2, 1, 4, 100, '15300.00', '2021-10-27 09:24:18'),
(3, 1, 2, 30, '36599.99', '2021-10-27 09:24:18'),
(4, 1, 3, 90, '69999.99', '2021-10-27 09:24:18'),
(5, 5, 3, 200, '59600.30', '2021-10-27 09:24:18'),
(6, 5, 2, 60, '36299.99', '2021-10-27 09:24:18'),
(7, 3, 1, 50, '67999.00', '2021-10-27 09:24:18'),
(8, 3, 4, 40, '20530.00', '2021-10-27 09:24:18'),
(9, 3, 7, 30, '5400.00', '2021-10-27 09:24:18'),
(10, 2, 7, 30, '5000.00', '2021-10-27 09:24:18'),
(11, 2, 6, 30, '6500.00', '2021-10-27 09:24:18'),
(12, 2, 2, 150, '32459.99', '2021-10-27 09:24:18'),
(13, 6, 6, 100, '6000.00', '2021-10-27 09:24:18'),
(14, 6, 4, 10, '16000.00', '2021-10-27 09:24:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wallets`
--

CREATE TABLE `wallets` (
  `wallet_id` int(11) NOT NULL,
  `customer` int(11) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `notes` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_email` (`customer_email`),
  ADD UNIQUE KEY `customer_name` (`customer_name`);

--
-- Indices de la tabla `customers_data`
--
ALTER TABLE `customers_data`
  ADD PRIMARY KEY (`data_id`),
  ADD UNIQUE KEY `cuit` (`cuit`),
  ADD UNIQUE KEY `first_name` (`first_name`,`last_name`,`birth`,`address`),
  ADD KEY `customer` (`customer`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indices de la tabla `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`provider_id`),
  ADD UNIQUE KEY `cuit` (`cuit`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `customer` (`customer`);

--
-- Indices de la tabla `sales_detail`
--
ALTER TABLE `sales_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD UNIQUE KEY `sale` (`sale`,`product`),
  ADD KEY `product` (`product`);

--
-- Indices de la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `provider` (`provider`),
  ADD KEY `product` (`product`);

--
-- Indices de la tabla `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`wallet_id`),
  ADD UNIQUE KEY `customer` (`customer`,`description`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `customers_data`
--
ALTER TABLE `customers_data`
  MODIFY `data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `providers`
--
ALTER TABLE `providers`
  MODIFY `provider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `sales_detail`
--
ALTER TABLE `sales_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `wallets`
--
ALTER TABLE `wallets`
  MODIFY `wallet_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `customers_data`
--
ALTER TABLE `customers_data`
  ADD CONSTRAINT `customers_data_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `customers` (`customer_id`);

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `customers` (`customer_id`);

--
-- Filtros para la tabla `sales_detail`
--
ALTER TABLE `sales_detail`
  ADD CONSTRAINT `sales_detail_ibfk_1` FOREIGN KEY (`sale`) REFERENCES `sales` (`sale_id`),
  ADD CONSTRAINT `sales_detail_ibfk_2` FOREIGN KEY (`product`) REFERENCES `products` (`product_id`);

--
-- Filtros para la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`provider`) REFERENCES `providers` (`provider_id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`product`) REFERENCES `products` (`product_id`);

--
-- Filtros para la tabla `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `customers` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
