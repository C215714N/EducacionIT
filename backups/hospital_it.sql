-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-04-2022 a las 20:34:23
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
-- Base de datos: `hospital_it`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coverage_plans`
--

CREATE TABLE `coverage_plans` (
  `plan_id` int(11) NOT NULL,
  `plan_name` varchar(50) DEFAULT NULL,
  `coverage` int(11) DEFAULT NULL,
  `medicament` enum('si','no','parcial') DEFAULT 'no',
  `translate` enum('si','no','parcial') DEFAULT 'no',
  `traetment` enum('si','no','parcial') DEFAULT 'no',
  `urgency` enum('si','no','parcial') DEFAULT 'no',
  `guard` enum('si','no','parcial') DEFAULT 'no',
  `home_attention` enum('si','no','parcial') DEFAULT 'no',
  `surgical_procedure` enum('si','no','parcial') DEFAULT 'no',
  `hospitalizations` enum('si','no','parcial') DEFAULT 'no',
  `patient_id` int(11) NOT NULL DEFAULT 0,
  `surname` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `blood_group` enum('O','A','B','AB') DEFAULT NULL,
  `blood_type` enum('+','-') DEFAULT '+',
  `cuit` char(13) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `coverage_plans`
--

INSERT INTO `coverage_plans` (`plan_id`, `plan_name`, `coverage`, `medicament`, `translate`, `traetment`, `urgency`, `guard`, `home_attention`, `surgical_procedure`, `hospitalizations`, `patient_id`, `surname`, `name`, `birth_date`, `blood_group`, `blood_type`, `cuit`, `address`, `country`) VALUES
(1, 'Plan etario', 3, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 1, 'Racedo', 'Cristian', '1991-04-18', 'O', '+', '20-35335446-5', 'Esmeralda 477', 'Argentina'),
(2, 'Plan etario', 1, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 2, 'Perez', 'Juan', '1950-07-04', NULL, '+', '25-08912342-4', 'Canelones 2233', 'Uruguay'),
(3, 'Plan 360', 3, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 3, 'Alonso', 'Diego', '1978-01-12', NULL, '+', '25-07812345-7', 'Sarandí 878', 'Uruguay'),
(4, 'Plan etario', 4, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 4, 'Novo', 'Eva', '1990-12-06', NULL, '+', '21-04512346-4', 'Sarmiento 500', 'Argentina'),
(5, 'Plan 360', 5, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 5, 'Perez', 'Nicolas', '1988-05-21', NULL, '+', '23-08812343-1', 'Montevideo 1000', 'Argentina'),
(7, 'ANDAR', 2, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 0, NULL, NULL, NULL, NULL, '+', NULL, NULL, NULL),
(8, 'plan informal', 6, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 0, NULL, NULL, NULL, NULL, '+', NULL, NULL, NULL),
(9, 'plan TA', 3, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 0, NULL, NULL, NULL, NULL, '+', NULL, NULL, NULL),
(10, 'plan hombe ofice', 4, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 0, NULL, NULL, NULL, NULL, '+', NULL, NULL, NULL);

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departments`
--

INSERT INTO `departments` (`department_id`, `department`) VALUES
(8, 'CARDIOLOGIA'),
(5, 'CLINICAS'),
(9, 'FONOAUDIOLOGIA'),
(11, 'NEUROLOGIA'),
(6, 'NUTRICION'),
(10, 'ONCOLOGIA'),
(4, 'ORTODONCIA'),
(12, 'PEDIATRIA'),
(7, 'PSICOLOGIA'),
(2, 'RADIOLOGIA'),
(3, 'REUMATOLOGIA'),
(1, 'TRAUMATOLOGIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medical_coverages`
--

CREATE TABLE `medical_coverages` (
  `coverage_id` int(11) NOT NULL,
  `coverage_name` varchar(150) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `medical_coverages`
--

INSERT INTO `medical_coverages` (`coverage_id`, `coverage_name`, `description`, `phone`, `address`, `email`) VALUES
(1, 'ACA SALUD', NULL, NULL, NULL, NULL),
(2, 'ANDAR', NULL, NULL, NULL, NULL),
(3, 'MEDIN', NULL, NULL, NULL, NULL),
(4, 'MITA', NULL, NULL, NULL, NULL),
(5, 'UAI SALUD', NULL, NULL, NULL, NULL),
(6, 'OMINT', NULL, NULL, NULL, NULL),
(7, 'ACA SALUD | AVALIAN', NULL, NULL, NULL, NULL),
(8, 'AMEBPBA', NULL, NULL, NULL, NULL),
(9, 'APSOT | FSST', NULL, NULL, NULL, NULL),
(10, 'C.A.S.A.', NULL, NULL, NULL, NULL),
(11, 'CENTRO MÉDICO PUEYRREDÓN', NULL, NULL, NULL, NULL),
(12, 'CÍRCULO MÉDICO LOMAS DE ZAMORA', NULL, NULL, NULL, NULL),
(13, 'COLEGIO DE ESCRIBANOS DE LA CABA', NULL, NULL, NULL, NULL),
(14, 'F.A.B.A. | I.O.M.A.', NULL, NULL, NULL, NULL),
(15, 'GALENO', NULL, NULL, NULL, NULL),
(16, 'HOPE', NULL, NULL, NULL, NULL),
(17, 'LUIS PASTEUR', NULL, NULL, NULL, NULL),
(18, 'MEDIFÉ', NULL, NULL, NULL, NULL),
(19, 'O.P.D.E.A.', NULL, NULL, NULL, NULL),
(20, 'OSDE', NULL, NULL, NULL, NULL),
(21, 'O.S.D.I.P.P.', NULL, NULL, NULL, NULL),
(22, 'O.S.P.E.', NULL, NULL, NULL, NULL),
(23, 'PODER JUDICIAL DE LA NACIÓN', NULL, NULL, NULL, NULL),
(24, 'PREMEDIC', NULL, NULL, NULL, NULL),
(25, 'PROGRAMAS DE SALUD', NULL, NULL, NULL, NULL),
(26, 'PROGRAMAS MÉDICOS', NULL, NULL, NULL, NULL),
(27, 'S.A.D.A.I.C.', NULL, NULL, NULL, NULL),
(28, 'SANCOR SALUD', NULL, NULL, NULL, NULL),
(29, 'SWISS MEDICAL', NULL, NULL, NULL, NULL),
(30, 'TV SALUD', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `blood_group` enum('O','A','B','AB') DEFAULT NULL,
  `blood_type` enum('+','-') DEFAULT '+',
  `cuit` char(13) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `patients`
--

INSERT INTO `patients` (`patient_id`, `surname`, `name`, `birth_date`, `blood_group`, `blood_type`, `cuit`, `address`, `country`) VALUES
(1, 'Racedo', 'Cristian', '1991-04-18', 'O', '+', '20-35335446-5', 'Esmeralda 477', 'Argentina'),
(2, 'Perez', 'Juan', '1950-07-04', 'B', '+', '25-08912342-4', 'Canelones 2233', 'Uruguay'),
(3, 'Alonso', 'Diego', '1978-01-12', 'B', '-', '25-07812345-7', 'Sarandí 878', 'Uruguay'),
(4, 'Novo', 'Eva', '1990-12-06', 'B', '-', '21-04512346-4', 'Sarmiento 500', 'Argentina'),
(5, 'Perez', 'Nicolas', '1988-05-21', 'B', '+', '23-08812343-1', 'Montevideo 1000', 'Argentina'),
(21, 'Gomez', 'Gonzalo', NULL, 'O', '+', '', NULL, NULL),
(22, 'Lopez', 'Leandro', NULL, 'O', '-', NULL, NULL, NULL),
(23, 'Perez', 'Matias', NULL, 'AB', '-', NULL, NULL, NULL),
(24, 'Diaz', 'Nicolas', NULL, 'B', '+', NULL, NULL, NULL),
(25, 'Ramirez', 'Juan', NULL, 'B', '-', NULL, NULL, NULL),
(26, 'Storm', 'Susan', NULL, 'B', '+', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patients_coverage`
--

CREATE TABLE `patients_coverage` (
  `id` int(11) NOT NULL,
  `patient` int(11) DEFAULT NULL,
  `plan` int(11) DEFAULT NULL,
  `type` enum('PREPAGA','OBRA SOCIAL') DEFAULT 'PREPAGA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `patients_coverage`
--

INSERT INTO `patients_coverage` (`id`, `patient`, `plan`, `type`) VALUES
(2, 2, 9, 'PREPAGA'),
(3, 1, 9, 'OBRA SOCIAL'),
(4, 1, 3, 'PREPAGA'),
(8, 5, 4, 'OBRA SOCIAL'),
(9, 5, 5, 'PREPAGA'),
(10, 4, 10, 'OBRA SOCIAL'),
(11, 5, 1, 'OBRA SOCIAL'),
(12, 1, 8, 'PREPAGA'),
(13, 5, 10, 'OBRA SOCIAL'),
(14, 2, 5, 'OBRA SOCIAL'),
(15, 3, 8, 'PREPAGA'),
(18, 2, 4, 'OBRA SOCIAL'),
(19, 5, 8, 'PREPAGA'),
(21, 2, 1, 'OBRA SOCIAL'),
(22, 3, 10, 'PREPAGA'),
(23, 3, 5, 'PREPAGA'),
(25, 2, 8, 'OBRA SOCIAL'),
(27, 1, 2, 'PREPAGA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `personal_id` int(11) NOT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `cuit` char(13) NOT NULL,
  `brith_date` date DEFAULT NULL,
  `role` enum('ADM','MED','ENF','LIM','SEG') DEFAULT 'MED',
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`personal_id`, `surname`, `name`, `cuit`, `brith_date`, `role`, `address`, `phone`, `email`) VALUES
(1, 'Gomez', 'Gonzalo', '20-183236728-', NULL, 'MED', NULL, NULL, 'gomez@mail.com'),
(2, 'Lopez', 'Leandro', '25-918923527-', NULL, 'MED', NULL, NULL, 'lopez@mail.com'),
(3, 'Perez', 'Matias', '28-189234791-', NULL, 'MED', NULL, NULL, 'perez@mail.com'),
(4, 'Diaz', 'Nicolas', '21-189234080-', NULL, 'MED', NULL, NULL, 'diaz@mail.com'),
(5, 'Ramirez', 'Juan', '21-189311018-', NULL, 'MED', NULL, NULL, 'ramirez@mail.com'),
(6, 'Storm', 'Susan', '27-12893470-3', NULL, 'MED', NULL, NULL, 's.storm@fantastic_four.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `professions`
--

CREATE TABLE `professions` (
  `profession_id` int(11) NOT NULL,
  `personal` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `professions`
--

INSERT INTO `professions` (`profession_id`, `personal`, `department`) VALUES
(43, 1, 1),
(42, 1, 7),
(41, 1, 10),
(40, 6, 6),
(39, 6, 8),
(38, 6, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turns`
--

CREATE TABLE `turns` (
  `turn_id` int(11) NOT NULL,
  `patient` int(11) DEFAULT NULL,
  `turn` datetime DEFAULT NULL,
  `area` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `turns`
--

INSERT INTO `turns` (`turn_id`, `patient`, `turn`, `area`) VALUES
(1, 23, '2022-04-04 15:00:00', 40),
(2, 26, NULL, 43),
(3, 24, NULL, 40),
(4, 23, NULL, 43),
(5, 25, NULL, 38),
(6, 22, NULL, 38),
(7, 23, NULL, 43),
(8, 21, NULL, 43),
(9, 25, NULL, 40),
(10, 22, NULL, 39),
(11, 22, NULL, 42),
(12, 26, NULL, 40),
(13, 25, NULL, 43);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `coverage_plans`
--
ALTER TABLE `coverage_plans`
  ADD PRIMARY KEY (`plan_id`),
  ADD UNIQUE KEY `plan_name` (`plan_name`,`coverage`),
  ADD KEY `coverage` (`coverage`);

--
-- Indices de la tabla `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD UNIQUE KEY `department` (`department`);

--
-- Indices de la tabla `medical_coverages`
--
ALTER TABLE `medical_coverages`
  ADD PRIMARY KEY (`coverage_id`),
  ADD UNIQUE KEY `coverage_name` (`coverage_name`);

--
-- Indices de la tabla `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`),
  ADD UNIQUE KEY `cuit` (`cuit`),
  ADD UNIQUE KEY `surname` (`surname`,`name`,`birth_date`,`address`,`country`);

--
-- Indices de la tabla `patients_coverage`
--
ALTER TABLE `patients_coverage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patient` (`patient`,`plan`),
  ADD KEY `plan` (`plan`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`personal_id`),
  ADD UNIQUE KEY `cuit` (`cuit`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `professions`
--
ALTER TABLE `professions`
  ADD PRIMARY KEY (`profession_id`),
  ADD UNIQUE KEY `personal` (`personal`,`department`),
  ADD KEY `department` (`department`);

--
-- Indices de la tabla `turns`
--
ALTER TABLE `turns`
  ADD PRIMARY KEY (`turn_id`),
  ADD UNIQUE KEY `turn` (`turn`,`area`),
  ADD UNIQUE KEY `patient` (`patient`,`turn`),
  ADD KEY `area` (`area`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `coverage_plans`
--
ALTER TABLE `coverage_plans`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `medical_coverages`
--
ALTER TABLE `medical_coverages`
  MODIFY `coverage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT de la tabla `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `patients_coverage`
--
ALTER TABLE `patients_coverage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `personal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `professions`
--
ALTER TABLE `professions`
  MODIFY `profession_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `turns`
--
ALTER TABLE `turns`
  MODIFY `turn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `coverage_plans`
--
ALTER TABLE `coverage_plans`
  ADD CONSTRAINT `coverage_plans_ibfk_1` FOREIGN KEY (`coverage`) REFERENCES `medical_coverages` (`coverage_id`);

--
-- Filtros para la tabla `patients_coverage`
--
ALTER TABLE `patients_coverage`
  ADD CONSTRAINT `patients_coverage_ibfk_1` FOREIGN KEY (`patient`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `patients_coverage_ibfk_2` FOREIGN KEY (`plan`) REFERENCES `coverage_plans` (`plan_id`);

--
-- Filtros para la tabla `professions`
--
ALTER TABLE `professions`
  ADD CONSTRAINT `professions_ibfk_1` FOREIGN KEY (`personal`) REFERENCES `personal` (`personal_id`),
  ADD CONSTRAINT `professions_ibfk_2` FOREIGN KEY (`department`) REFERENCES `departments` (`department_id`);

--
-- Filtros para la tabla `turns`
--
ALTER TABLE `turns`
  ADD CONSTRAINT `turns_ibfk_1` FOREIGN KEY (`patient`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `turns_ibfk_2` FOREIGN KEY (`area`) REFERENCES `professions` (`profession_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
