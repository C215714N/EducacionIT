-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-02-2023 a las 15:43:50
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
-- Base de datos: `hospital_business`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attentions`
--

CREATE TABLE `attentions` (
  `id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `attentions`
--

INSERT INTO `attentions` (`id`, `description`) VALUES
(5, 'cirugia'),
(4, 'consulta'),
(3, 'emergencia'),
(2, 'guardia'),
(1, 'turno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `description`) VALUES
(2, 'descartable'),
(3, 'instrumental'),
(1, 'medicamento'),
(4, 'otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `charges`
--

CREATE TABLE `charges` (
  `id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `charges`
--

INSERT INTO `charges` (`id`, `description`) VALUES
(1, 'administrativo'),
(2, 'auditor'),
(9, 'director'),
(3, 'enfermero'),
(7, 'mantenimiento'),
(4, 'medico'),
(5, 'seguridad'),
(8, 'supervisor'),
(6, 'tecnico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctypes`
--

CREATE TABLE `doctypes` (
  `id` int(11) NOT NULL,
  `doctype` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `doctypes`
--

INSERT INTO `doctypes` (`id`, `doctype`) VALUES
(4, 'cedula'),
(1, 'cuil'),
(3, 'du'),
(6, 'lc'),
(7, 'le'),
(2, 'pasaporte'),
(5, 'rut');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `employeeId` char(9) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `chargeId` int(11) DEFAULT NULL,
  `professionId` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `payId` int(11) DEFAULT NULL,
  `salary` decimal(22,4) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`id`, `employeeId`, `userId`, `chargeId`, `professionId`, `start_date`, `payId`, `salary`, `active`) VALUES
(1, NULL, 2, 4, 14, '2023-01-28', NULL, NULL, 1),
(2, NULL, 3, 4, 2, '2023-01-28', NULL, NULL, 1),
(3, NULL, 6, 4, 14, '2023-01-28', NULL, NULL, 1),
(4, NULL, 7, 4, 8, '2023-01-28', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nationalities`
--

CREATE TABLE `nationalities` (
  `id` int(11) NOT NULL,
  `nationality` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nationalities`
--

INSERT INTO `nationalities` (`id`, `nationality`) VALUES
(1, 'argentina'),
(2, 'boliviana'),
(3, 'brasileña'),
(9, 'chilena'),
(8, 'colombiana'),
(15, 'cubana'),
(10, 'ecuatoriana'),
(16, 'española'),
(11, 'guyanesa'),
(12, 'hondureña'),
(18, 'italiana'),
(13, 'mexicana'),
(14, 'panameña'),
(4, 'paraguaya'),
(6, 'peruana'),
(17, 'portuguesa'),
(5, 'uruguaya'),
(7, 'venezolana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pathologies`
--

CREATE TABLE `pathologies` (
  `id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pathologies`
--

INSERT INTO `pathologies` (`id`, `description`) VALUES
(5, 'anemia'),
(19, 'apendicitis'),
(17, 'bradicardia'),
(1, 'cefalea'),
(23, 'contusion'),
(13, 'desgarro'),
(2, 'dolor estomacal'),
(14, 'dolor lumbar'),
(6, 'faringitis'),
(3, 'fiebre'),
(11, 'fisura'),
(10, 'fractura expuesta'),
(4, 'gastroenteritis'),
(22, 'hematoma'),
(9, 'hemorragia'),
(24, 'indeterminado'),
(12, 'luxacion'),
(20, 'pancreatitis'),
(18, 'peritonitis'),
(7, 'presion alta'),
(8, 'presion baja'),
(15, 'problemas respiratorios'),
(16, 'taquicardia'),
(21, 'traumatismo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `bloodtype` enum('O','A','B','AB') DEFAULT NULL,
  `bloodrh` enum('+','-') DEFAULT NULL,
  `disability` tinyint(1) DEFAULT 0,
  `alergies` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `patients`
--

INSERT INTO `patients` (`id`, `userId`, `weight`, `height`, `bloodtype`, `bloodrh`, `disability`, `alergies`) VALUES
(1, 1, '85.30', '173.57', 'AB', '+', 0, NULL),
(2, 4, '65.49', '152.19', 'B', '-', 0, NULL),
(3, 5, '116.66', '179.53', 'O', '+', 0, NULL),
(4, 8, '67.18', '191.34', 'AB', '+', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patient_history`
--

CREATE TABLE `patient_history` (
  `id` int(11) NOT NULL,
  `patientId` int(11) DEFAULT NULL,
  `pathologyId` int(11) DEFAULT NULL,
  `attention` int(11) DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `patient_history`
--

INSERT INTO `patient_history` (`id`, `patientId`, `pathologyId`, `attention`, `date`) VALUES
(2, 2, 18, 2, '2023-01-28 12:53:17'),
(3, 4, 13, 3, '2023-01-28 12:53:18'),
(4, 2, 14, 2, '2023-01-28 12:53:19'),
(5, 2, 4, 5, '2023-01-28 12:53:20'),
(6, 1, 1, 4, '2023-01-28 12:53:21'),
(7, 3, 10, 3, '2023-01-28 12:53:22'),
(8, 4, 17, 2, '2023-01-28 12:53:23'),
(9, 4, 12, 3, '2023-01-28 12:53:24'),
(10, 2, 6, 1, '2023-01-28 12:53:25'),
(11, 2, 22, 2, '2023-01-28 12:53:26'),
(12, 4, 11, 3, '2023-01-28 12:53:27'),
(13, 1, 7, 5, '2023-01-28 12:53:28'),
(14, 3, 7, 4, '2023-01-28 12:53:29'),
(16, 4, 3, 1, '2023-01-28 12:53:33'),
(17, 2, 23, 5, '2023-01-28 12:53:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paytypes`
--

CREATE TABLE `paytypes` (
  `id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paytypes`
--

INSERT INTO `paytypes` (`id`, `description`) VALUES
(6, 'consulta'),
(4, 'diario'),
(5, 'hora'),
(1, 'mensual'),
(7, 'procedimiento'),
(2, 'quincenal'),
(3, 'semanal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `provider` int(11) DEFAULT NULL,
  `price` float(11,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `unit` enum('u','g','ml','cm3','mm','cm','m') DEFAULT 'u',
  `packaging` enum('frasco','caja','blister','bolsa','botella','jeringa') DEFAULT 'caja'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `description`, `category`, `provider`, `price`, `stock`, `unit`, `packaging`) VALUES
(1, 'aspirina', NULL, NULL, 834.90, 4488, 'u', 'caja'),
(2, 'te descongestivo', NULL, NULL, 278.30, 8584, 'u', 'caja'),
(3, 'morfina', NULL, NULL, 1669.80, 2726, 'u', 'caja'),
(4, 'diazepan', NULL, NULL, 833.51, 1728, 'u', 'caja'),
(5, 'tegretol', NULL, NULL, 1303.84, 5277, 'u', 'caja'),
(6, 'metoclopramida', NULL, NULL, 3478.74, 5271, 'u', 'caja'),
(7, 'cloroformo', NULL, NULL, 7235.80, 12928, 'u', 'caja'),
(8, 'sildenafilo', NULL, NULL, 4585.68, 19278, 'u', 'caja'),
(9, 'paracetamol', NULL, NULL, 1196.68, 2341, 'u', 'caja'),
(10, 'acetaminofen', NULL, NULL, 8349.00, 5480, 'u', 'caja'),
(11, 'agua oxigenada', NULL, NULL, 417.45, 28297, 'u', 'caja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `professions`
--

CREATE TABLE `professions` (
  `id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `professions`
--

INSERT INTO `professions` (`id`, `description`) VALUES
(6, 'cardiologia'),
(1, 'clinico'),
(4, 'contabilidad'),
(11, 'endocrinologia'),
(15, 'enfermeria'),
(14, 'fonoaudiologia'),
(8, 'ginecologia'),
(10, 'nutricion'),
(9, 'odontologia'),
(13, 'oncologia'),
(2, 'pediatria'),
(12, 'psicologia'),
(3, 'radiologia'),
(7, 'urologia'),
(5, 'ventas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `providers`
--

CREATE TABLE `providers` (
  `id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `providers`
--

INSERT INTO `providers` (`id`, `description`) VALUES
(1, 'Bago'),
(2, 'Bayer'),
(7, 'Biontech'),
(4, 'Elea'),
(9, 'J&J'),
(8, 'Merryl Linch'),
(5, 'Moderna'),
(3, 'Pfiser'),
(6, 'Sandoz'),
(10, 'Sanofi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `paymentId` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT 0,
  `cuotes` int(11) DEFAULT 1,
  `total` float(20,2) DEFAULT NULL,
  `sale_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`id`, `userId`, `paymentId`, `discount`, `cuotes`, `total`, `sale_date`) VALUES
(1, 1, NULL, 0, 1, 23490.95, '2023-02-04 13:05:13'),
(2, 4, NULL, 0, 1, 25095.86, '2023-02-04 14:10:00'),
(3, 8, NULL, 0, 1, 5542.97, '2023-02-04 14:30:00'),
(4, 9, NULL, 0, 1, 5520.00, '2023-02-05 10:00:00'),
(5, 9, NULL, 0, 1, 8349.00, '2023-02-07 12:15:00'),
(6, 1, NULL, 0, 1, 3478.74, '2023-02-10 14:50:00'),
(7, 4, NULL, 0, 1, 1669.80, '2023-02-11 10:11:34'),
(8, 1, NULL, 0, 1, 25464.45, '2023-02-11 10:11:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales_detail`
--

CREATE TABLE `sales_detail` (
  `id` int(11) NOT NULL,
  `sale` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` float(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sales_detail`
--

INSERT INTO `sales_detail` (`id`, `sale`, `product`, `quantity`, `price`) VALUES
(1, 1, 9, 5, 859.99),
(2, 1, 1, 8, 600.00),
(3, 1, 8, 2, 3295.50),
(4, 1, 11, 2, 300.00),
(5, 1, 3, 6, 1200.00),
(6, 2, 7, 2, 5980.00),
(7, 2, 4, 1, 688.85),
(8, 2, 8, 3, 3789.82),
(9, 2, 5, 1, 1077.55),
(10, 3, 2, 3, 230.00),
(11, 3, 9, 2, 988.99),
(12, 3, 9, 0, 988.99),
(13, 3, 4, 0, 688.85),
(14, 3, 6, 1, 2874.99),
(15, 4, 1, 1, 690.00),
(16, 4, 2, 3, 230.00),
(17, 4, 1, 1, 690.00),
(18, 4, 3, 2, 1380.00),
(19, 4, 11, 2, 345.00),
(20, 5, 10, 0, 8349.00),
(21, 5, 10, 1, 8349.00),
(22, 5, 7, 0, 7235.80),
(23, 6, 6, 1, 3478.74),
(24, 7, 3, 0, 1669.80),
(25, 7, 1, 2, 834.90),
(26, 8, 11, 1, 417.45),
(27, 8, 10, 3, 8349.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `userpass` varchar(20) DEFAULT NULL,
  `employee` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `userpass`, `employee`, `created`) VALUES
(1, 'cristian', 'root', 0, '2023-01-28 14:06:28'),
(2, 'c215714n', 'r00t', 1, '2023-01-28 14:06:28'),
(3, 'Maria', 'pass', 1, '2023-01-28 14:06:28'),
(4, 'R4m1r0', 'user', 0, '2023-01-28 14:06:28'),
(5, 'Damian', 'access', 0, '2023-01-28 14:06:28'),
(6, 'c215714n!#', 'vtodyosm', 1, '2023-01-28 14:06:28'),
(7, 'admin', 'd48w58qj', 1, '2023-01-28 14:06:28'),
(8, 'nek', 'lauranonce', 0, '2023-01-28 11:34:26'),
(9, 'Pepe', 'pipo', 0, '2023-02-04 11:28:03'),
(10, 'd4c', 'acdc', 1, '2023-02-04 11:28:03'),
(11, 'rem', 'l0s1n6', 1, '2023-02-04 11:28:03'),
(12, 'opm', 'h3r0', 0, '2023-02-04 11:28:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_data`
--

CREATE TABLE `users_data` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `second_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `second_last_name` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` enum('M','F','O') DEFAULT NULL,
  `uid` varchar(30) NOT NULL,
  `doctype` int(11) DEFAULT NULL,
  `nationality` int(11) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users_data`
--

INSERT INTO `users_data` (`id`, `userId`, `first_name`, `second_name`, `last_name`, `second_last_name`, `birthdate`, `gender`, `uid`, `doctype`, `nationality`, `address`, `phone`, `email`) VALUES
(1, 1, 'Cristian', 'Damian', 'Racedo', '', '1991-04-18', 'M', '20-35336446-5', 1, 14, NULL, '(54911)0303-4567', 'cristiandracedo@hotmail.com'),
(2, 3, 'Maria de los Angeles', 'Candelaria Trinidad', 'Calzadilla', 'Urruchaga', '2000-02-29', 'F', 'MACTCU 1293-8412-3843-1234', 2, 6, NULL, NULL, 'mda_candelaria.calzadilla_u@gmail.com'),
(3, 8, 'Laura', '', 'Pausini', '', '0000-00-00', 'F', '30-71036844-5', 5, 3, NULL, NULL, 'l.pausini@gmail.com'),
(4, 5, 'Damian', '', 'Dam', '', '0000-00-00', 'M', '24-31336213-9', 5, 17, NULL, NULL, 'd.dam@gmail.com'),
(5, 4, 'ALFREDO', '', 'RAMIRO', '', '0000-00-00', 'M', '11096095', 3, 5, NULL, NULL, 'a.ramiro@gmail.com'),
(6, 7, 'Juana', '', 'D\'Arc', '', '0000-00-00', 'F', '27-01038972-6', 5, 7, NULL, NULL, 'j.d\'arc@gmail.com'),
(7, 6, 'Cristian Jesus', '', 'Espindola', '', '0000-00-00', 'O', '29833801', 3, 4, NULL, NULL, 'c.espindola@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `attentions`
--
ALTER TABLE `attentions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indices de la tabla `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indices de la tabla `doctypes`
--
ALTER TABLE `doctypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doctype` (`doctype`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employeeId` (`employeeId`),
  ADD UNIQUE KEY `userId` (`userId`),
  ADD KEY `chargeId` (`chargeId`),
  ADD KEY `professionId` (`professionId`),
  ADD KEY `payId` (`payId`);

--
-- Indices de la tabla `nationalities`
--
ALTER TABLE `nationalities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nationality` (`nationality`);

--
-- Indices de la tabla `pathologies`
--
ALTER TABLE `pathologies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indices de la tabla `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userId` (`userId`);

--
-- Indices de la tabla `patient_history`
--
ALTER TABLE `patient_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patientId` (`patientId`,`pathologyId`),
  ADD KEY `pathologyId` (`pathologyId`),
  ADD KEY `attention` (`attention`);

--
-- Indices de la tabla `paytypes`
--
ALTER TABLE `paytypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `description` (`description`,`provider`,`packaging`),
  ADD KEY `provider` (`provider`);

--
-- Indices de la tabla `professions`
--
ALTER TABLE `professions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indices de la tabla `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indices de la tabla `sales_detail`
--
ALTER TABLE `sales_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product` (`product`),
  ADD KEY `sale` (`sale`);

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
  ADD UNIQUE KEY `first_name` (`first_name`,`second_name`,`last_name`,`second_last_name`,`birthdate`,`nationality`,`phone`,`email`),
  ADD KEY `userId` (`userId`),
  ADD KEY `doctype` (`doctype`),
  ADD KEY `nationality` (`nationality`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `attentions`
--
ALTER TABLE `attentions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `charges`
--
ALTER TABLE `charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `doctypes`
--
ALTER TABLE `doctypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `nationalities`
--
ALTER TABLE `nationalities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `pathologies`
--
ALTER TABLE `pathologies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `patient_history`
--
ALTER TABLE `patient_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `paytypes`
--
ALTER TABLE `paytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `professions`
--
ALTER TABLE `professions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `sales_detail`
--
ALTER TABLE `sales_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `users_data`
--
ALTER TABLE `users_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`chargeId`) REFERENCES `charges` (`id`),
  ADD CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`professionId`) REFERENCES `professions` (`id`),
  ADD CONSTRAINT `employees_ibfk_4` FOREIGN KEY (`payId`) REFERENCES `paytypes` (`id`);

--
-- Filtros para la tabla `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `patient_history`
--
ALTER TABLE `patient_history`
  ADD CONSTRAINT `patient_history_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `patient_history_ibfk_2` FOREIGN KEY (`pathologyId`) REFERENCES `pathologies` (`id`),
  ADD CONSTRAINT `patient_history_ibfk_3` FOREIGN KEY (`attention`) REFERENCES `attentions` (`id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`provider`) REFERENCES `providers` (`id`);

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `sales_detail`
--
ALTER TABLE `sales_detail`
  ADD CONSTRAINT `sales_detail_ibfk_1` FOREIGN KEY (`product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `sales_detail_ibfk_2` FOREIGN KEY (`sale`) REFERENCES `sales` (`id`);

--
-- Filtros para la tabla `users_data`
--
ALTER TABLE `users_data`
  ADD CONSTRAINT `users_data_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_data_ibfk_2` FOREIGN KEY (`doctype`) REFERENCES `doctypes` (`id`),
  ADD CONSTRAINT `users_data_ibfk_3` FOREIGN KEY (`nationality`) REFERENCES `nationalities` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
