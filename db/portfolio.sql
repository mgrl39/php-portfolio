-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 23-02-2025 a las 02:59:09
-- Versión del servidor: 8.0.39-0ubuntu0.22.04.1
-- Versión de PHP: 8.1.2-1ubuntu2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `portfolio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Developer`
--

CREATE TABLE `Developer` (
  `id` int NOT NULL,
  `github_user` text NOT NULL,
  `description` text NOT NULL,
  `city` text NOT NULL,
  `emoji` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Developer`
--

INSERT INTO `Developer` (`id`, `github_user`, `description`, `city`, `emoji`) VALUES
(1, 'mgrl39', 'Portfolio using Twig, Bootstrap and MySQL🌳🍂🐿️', 'barcelona', '👾');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Education`
--

CREATE TABLE `Education` (
  `id` int NOT NULL,
  `developer_id` int NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text,
  `link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Education`
--

INSERT INTO `Education` (`id`, `developer_id`, `course_name`, `start_date`, `end_date`, `description`, `link`) VALUES
(1, 1, 'ASIX', '2022-09-12', '2024-06-05', 'Technical studies focused on systems administration, networking, database management, and security, offering a solid understanding of essential IT concepts.', 'https://github.com/DonComProject'),
(2, 1, '42', '2024-06-05', '2026-06-05', ' A world-class computer programming school accessible to all, offering a peer-to-peer learning experience in coding.', 'https://42.fr'),
(3, 1, 'DAW', '2024-09-09', '2025-06-05', 'Technical studies focused on web application development, covering both front-end and back-end technologies to create dynamic, user-friendly web solutions.', 'https://github.com/mgrl39/DAW_M08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Image`
--

CREATE TABLE `Image` (
  `id` int UNSIGNED NOT NULL,
  `path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Image`
--

INSERT INTO `Image` (`id`, `path`) VALUES
(1, 'assets/img/gnl.png'),
(2, 'assets/img/icon.png'),
(3, 'assets/img/libft.png'),
(4, 'assets/img/printf.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Project`
--

CREATE TABLE `Project` (
  `id` int NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Project`
--

INSERT INTO `Project` (`id`, `name`, `description`) VALUES
(1, 'Libft', 'The Libft project involved creating a personal C library by implementing essential functions from the C standard library. This project enhanced my understanding of memory management and low-level programming concepts, allowing me to develop custom versions of key functions while focusing on code efficiency and best practices.'),
(2, 'Get Next Line', 'The Get Next Line project focuses on creating a function that reads a line from a file descriptor, handling various input sources such as standard input and files. This project challenged me to implement efficient memory management and string manipulation techniques in C, while ensuring that my function correctly handles edge cases like empty lines and incomplete reads. Through this experience, I enhanced my problem-solving skills and gained a deeper understanding of file handling in C.'),
(3, 'Printf', 'The Printf project involves creating a custom implementation of the standard printf function in C. This project challenged me to handle various data types and formatting options while ensuring accurate output. By developing features such as precision and width specifications, I gained valuable experience in string formatting, memory management, and handling variable arguments. This project strengthened my understanding of C\'s input/output capabilities and enhanced my coding skills.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ProjectImage`
--

CREATE TABLE `ProjectImage` (
  `projectId` int NOT NULL,
  `imageId` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ProjectImage`
--

INSERT INTO `ProjectImage` (`projectId`, `imageId`) VALUES
(2, 1),
(1, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ProjectTechnology`
--

CREATE TABLE `ProjectTechnology` (
  `projectId` int NOT NULL,
  `technologyId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ProjectTechnology`
--

INSERT INTO `ProjectTechnology` (`projectId`, `technologyId`) VALUES
(1, 3),
(2, 3),
(3, 3),
(1, 4),
(2, 4),
(3, 4),
(1, 5),
(2, 5),
(3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Technology`
--

CREATE TABLE `Technology` (
  `id` int NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Technology`
--

INSERT INTO `Technology` (`id`, `name`, `description`) VALUES
(1, 'HTML', 'HTML es un lenguaje de marcado que posibilita definir la estructura de nuestro documento mediante etiquetas. Este lenguaje ofrece una gran adaptabilidad, una ...'),
(2, 'CSS', 'CSS (siglas en inglés de Cascading Style Sheets; en español: «hojas de estilo en cascada») es un lenguaje informático especializado en definir y cohesionar ...'),
(3, 'C', 'C es un lenguaje de programación de propósito general que se utiliza ampliamente para desarrollar software de sistema y aplicaciones.'),
(4, 'Makefile', 'Un Makefile es un archivo que define un conjunto de tareas a ser ejecutadas en el directorio de un programa.'),
(5, 'Git', 'Git es un sistema de control de versiones distribuido que permite a múltiples desarrolladores trabajar en un mismo proyecto de manera colaborativa.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Developer`
--
ALTER TABLE `Developer`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Education`
--
ALTER TABLE `Education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `developer_id` (`developer_id`);

--
-- Indices de la tabla `Image`
--
ALTER TABLE `Image`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Project`
--
ALTER TABLE `Project`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ProjectImage`
--
ALTER TABLE `ProjectImage`
  ADD PRIMARY KEY (`projectId`,`imageId`),
  ADD KEY `fk_image` (`imageId`);

--
-- Indices de la tabla `ProjectTechnology`
--
ALTER TABLE `ProjectTechnology`
  ADD PRIMARY KEY (`projectId`,`technologyId`),
  ADD KEY `technologyId_FK` (`technologyId`);

--
-- Indices de la tabla `Technology`
--
ALTER TABLE `Technology`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Developer`
--
ALTER TABLE `Developer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Education`
--
ALTER TABLE `Education`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Image`
--
ALTER TABLE `Image`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `Project`
--
ALTER TABLE `Project`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Technology`
--
ALTER TABLE `Technology`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Education`
--
ALTER TABLE `Education`
  ADD CONSTRAINT `Education_ibfk_1` FOREIGN KEY (`developer_id`) REFERENCES `Developer` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ProjectImage`
--
ALTER TABLE `ProjectImage`
  ADD CONSTRAINT `fk_image` FOREIGN KEY (`imageId`) REFERENCES `Image` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_project` FOREIGN KEY (`projectId`) REFERENCES `Project` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ProjectTechnology`
--
ALTER TABLE `ProjectTechnology`
  ADD CONSTRAINT `projectId_FK` FOREIGN KEY (`projectId`) REFERENCES `Project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `technologyId_FK` FOREIGN KEY (`technologyId`) REFERENCES `Technology` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
