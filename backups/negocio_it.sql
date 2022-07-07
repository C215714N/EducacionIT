-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2022 a las 03:17:11
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
-- Base de datos: `negocio_it`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`) VALUES
(15, 'adadis'),
(1, 'alicante'),
(10, 'bangho'),
(11, 'bgh'),
(3, 'dunlop'),
(12, 'fiat'),
(9, 'hp'),
(5, 'liliana'),
(2, 'marolio'),
(14, 'nescafe'),
(17, 'nike'),
(16, 'pumba'),
(7, 'samsung'),
(8, 'tcl'),
(6, 'tophouse'),
(13, 'volkswagen'),
(4, 'wilson');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(15, 'Alimentos'),
(8, 'automotor'),
(14, 'bazar'),
(4, 'botanica'),
(3, 'deportes'),
(11, 'electrodomesticos'),
(12, 'ferreteria'),
(6, 'hogar'),
(2, 'indumentaria'),
(9, 'inmuebles'),
(7, 'jugueteria'),
(5, 'libreria'),
(10, 'muebles'),
(13, 'pintureria'),
(1, 'tecnologia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `cuit` char(13) DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`customer_id`, `last_name`, `first_name`, `cuit`, `notes`, `birth_date`, `address`, `email`) VALUES
(1, 'Racedo', 'Cristian', '20-35336446-5', NULL, '1991-04-18', '', 'CristianRacedo@gmail.com'),
(2, 'Prince', 'Diana', '27-34983422-3', NULL, '1953-05-27', '', 'Diana_Prince@dc.net'),
(4, 'Kent', 'Clark', '23-28327389-4', NULL, '1930-03-03', '', 'Clark_Kent@dc.net'),
(5, 'Howlett', 'James', '21-12938472-5', NULL, '1985-04-10', '', 'James_Howlett@marvel.com'),
(6, 'Parker', 'Peter', '20-46912848-5', NULL, '2006-06-01', '', 'Peter_Parker@marvel.com'),
(7, 'Kyle', 'Selina', '26-47382913-8', NULL, '1999-09-23', '', 'Selina_Kyle@dc.net'),
(8, 'wayne', 'bruce', '20-41289343-2', NULL, '1970-03-03', '', 'bruce@waynetech.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `product_description` varchar(200) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_description`, `brand`, `category`, `stock`, `price`) VALUES
(1, 'Notebook 8470p', NULL, 9, 1, 1498, 69999.99),
(2, 'Tablet Tab-10', NULL, 7, 1, 4991, 45500),
(3, 'Aire split 3300w bgh-400', NULL, 11, 11, 5000, 85999.99),
(4, 'Aire split 2500w shc-2350', NULL, 7, 11, 3500, 120500),
(5, 'Cafetera Dolce gusto f50', NULL, 14, 11, 25386, 32499.99),
(6, 'Modular TV th-5400', NULL, 6, 10, 8495, 35600),
(7, 'Modular Microondas d-300', NULL, 3, 10, 1299, 15300),
(8, 'Combo Mesa y sillas 6u', NULL, 4, 10, 1198, 35300),
(9, 'Sobre Provenzal 500g', NULL, 1, 15, 28900, 250),
(10, 'Aceite 1l', NULL, 2, 15, 36803, 560),
(11, 'Campera talle L', NULL, 17, 2, 23000, 5600),
(12, 'Camiseta talle XL', NULL, 15, 2, 12500, 2000),
(13, 'Camiseta talle XXL', NULL, 16, 2, 1000, 1300),
(14, 'Camiseta talle M', NULL, 17, 2, 44000, 9000),
(15, 'Abono 500g', NULL, 14, 4, 8397, 600),
(16, 'Ramo Jazmin 12u', NULL, 8, 4, 23996, 500),
(17, 'Notebook x360', NULL, 9, 1, 11459, 120599.99),
(18, 'Pista Hotwheels AT580', NULL, NULL, 7, 3000, 9999);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `providers`
--

CREATE TABLE `providers` (
  `provider_id` int(11) NOT NULL,
  `provider_name` varchar(50) NOT NULL,
  `provider_email` varchar(150) NOT NULL,
  `provider_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `customer` int(11) DEFAULT NULL,
  `sale_number` varchar(11) DEFAULT NULL,
  `sale_type` enum('debe','haber') DEFAULT 'haber',
  `pay_method` enum('debito','credito','efectivo','cbu','cvu','cheque','criptomoneda','virtual') DEFAULT NULL,
  `sale_total` double DEFAULT NULL,
  `sale_date` datetime DEFAULT current_timestamp(),
  `state` enum('aprobado','en proceso','cancelado','rechazado') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`sale_id`, `customer`, `sale_number`, `sale_type`, `pay_method`, `sale_total`, `sale_date`, `state`) VALUES
(4, 1, 'A1386', 'haber', 'efectivo', 106300, '2022-06-15 21:50:20', NULL),
(5, 4, 'B612', 'haber', 'credito', 456499.98, '2022-06-15 21:50:20', NULL),
(6, 6, 'A1387', 'haber', 'debito', 254400, '2022-06-15 21:50:20', NULL),
(7, 8, 'C320', 'haber', NULL, NULL, '2022-06-29 21:56:43', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales_detail`
--

CREATE TABLE `sales_detail` (
  `detail_id` int(11) NOT NULL,
  `sale` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sales_detail`
--

INSERT INTO `sales_detail` (`detail_id`, `sale`, `product`, `quantity`, `price`) VALUES
(1, 4, 2, 2, 45500),
(2, 4, 7, 1, 15300),
(3, 5, 16, 4, 500),
(4, 5, 2, 3, 45500),
(5, 5, 6, 5, 35600),
(6, 5, 1, 2, 69999.99),
(7, 6, 2, 4, 45500),
(8, 6, 8, 2, 35300),
(10, 6, 15, 3, 600);

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
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `cuit` (`cuit`),
  ADD UNIQUE KEY `last_name` (`last_name`,`first_name`,`birth_date`,`address`,`email`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product_name` (`product_name`,`brand`,`category`),
  ADD KEY `brand` (`brand`),
  ADD KEY `category` (`category`);

--
-- Indices de la tabla `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`provider_id`),
  ADD UNIQUE KEY `provider_name` (`provider_name`);

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `providers`
--
ALTER TABLE `providers`
  MODIFY `provider_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `sales_detail`
--
ALTER TABLE `sales_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

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
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `customers` (`customer_id`);

--
-- Filtros para la tabla `sales_detail`
--
ALTER TABLE `sales_detail`
  ADD CONSTRAINT `sales_detail_ibfk_1` FOREIGN KEY (`sale`) REFERENCES `sales` (`sale_id`),
  ADD CONSTRAINT `sales_detail_ibfk_2` FOREIGN KEY (`product`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
