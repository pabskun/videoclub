-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 08-08-2017 a las 16:42:47
-- Versión del servidor: 5.6.35
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `bd_video`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_iniciar_sesion` (IN `pcorreo` VARCHAR(50), IN `pcontrasenna` VARCHAR(50))  NO SQL
SELECT tu.correo, tu.tipo_usuario
FROM tusuario as tu
WHERE tu.correo = pcorreo AND AES_DECRYPT(tu.contrasenna,'1AbZQr9') = pcontrasenna$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_listar_actores` ()  NO SQL
SELECT *
FROM tactor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_listar_actores_por_aproximacion_nombre` (IN `pnombre` VARCHAR(25))  NO SQL
SELECT *
FROM tactor
WHERE nombre1 like CONCAT('%',pnombre,'%') or nombre2 like CONCAT('%',pnombre,'%') or apellido1 like CONCAT('%',pnombre,'%') or apellido2 like CONCAT('%',pnombre,'%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_listar_actores_por_estado` (IN `pestado` INT)  NO SQL
SELECT *
FROM tactor
WHERE estado = pestado$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_listar_actores_por_pelicula` (IN `pid_pelicula` INT)  NO SQL
SELECT tp.titulo, CONCAT(ta.nombre1, ' ',ta.apellido1, ' ', ta.apellido2 )as nombre,tap.tipo_actor
FROM tpelicula as tp
	INNER JOIN tactores_x_pelicula as tap
    	ON tp.id_pelicula = tap.id_pelicula
    INNER JOIN tactor as ta
    	ON tap.id_actor = ta.id_actor
WHERE tp.id_pelicula = pid_pelicula$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_listar_actores_por_rango_fecha` (IN `pfechainicio` DATE, IN `pfechafinal` DATE)  NO SQL
SELECT *
FROM tactor
WHERE fecha_nacimiento BETWEEN pfechainicio AND pfechafinal$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_listar_claves` ()  NO SQL
SELECT AES_DECRYPT(clave,'1234abcd')
FROM tprueba$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_modificar_actor` (IN `pnombre1` VARCHAR(25) CHARSET utf8, IN `pnombre2` VARCHAR(25) CHARSET utf8, IN `papellido1` VARCHAR(25) CHARSET utf8, IN `papellido2` VARCHAR(25) CHARSET utf8, IN `pfecha` DATE, IN `pgenero` VARCHAR(10) CHARSET utf8, IN `pid` INT)  NO SQL
UPDATE tactor
SET nombre1 = pnombre1,
	nombre2 = pnombre2,
    apellido1 = papellido1,
    apellido2 = papellido2,
    fecha_nacimiento = pfecha,
    genero = pgenero
WHERE id_actor = pid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_registrar_actor` (IN `pnombre1` VARCHAR(25) CHARSET utf8, IN `pnombre2` VARCHAR(25) CHARSET utf8, IN `papellido1` VARCHAR(25) CHARSET utf8, IN `papellido2` VARCHAR(25) CHARSET utf8, IN `pfecha_nacimiento` DATE, IN `pgenero` VARCHAR(10) CHARSET utf8, IN `pestado` INT)  NO SQL
INSERT INTO tactor(
  nombre1,
  nombre2,
  apellido1,
  apellido2,
  fecha_nacimiento,
  genero,
  estado
)
VALUES(
  pnombre1,
  pnombre2,
  papellido1,
  papellido2,
  pfecha_nacimiento,
  pgenero,
  pestado
)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_registrar_contrasenna` (IN `pclave` VARCHAR(15))  NO SQL
INSERT INTO tprueba(clave) VALUES  (AES_ENCRYPT(pclave, '1234abcd'))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_registrar_usuario` (IN `pcorreo` VARCHAR(50) CHARSET utf8, IN `pcontrasenna` VARCHAR(50) CHARSET utf8, IN `ptipo_usuario` INT)  NO SQL
INSERT INTO tusuario (correo,contrasenna,tipo_usuario)
VALUES(pcorreo,AES_ENCRYPT(pcontrasenna,'1AbZQr9'), ptipo_usuario)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tactor`
--

CREATE TABLE `tactor` (
  `id_actor` int(11) NOT NULL,
  `nombre1` varchar(25) NOT NULL,
  `nombre2` varchar(25) DEFAULT '''''',
  `apellido1` varchar(25) NOT NULL,
  `apellido2` varchar(25) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `genero` varchar(10) NOT NULL,
  `estado` int(11) NOT NULL COMMENT '1: activo, 0: inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tactor`
--

INSERT INTO `tactor` (`id_actor`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `fecha_nacimiento`, `genero`, `estado`) VALUES
(1, 'Mariam', NULL, 'Domínguez', 'Morales', '1993-02-10', 'Femenino', 1),
(2, 'Ángel', 'José', 'Marín', 'Trejos', '1999-09-20', 'Masculino', 1),
(3, 'Valeria', 'Ángeles', 'Rodríguez', 'Garita', '1992-07-15', 'Femenino', 0),
(4, 'Diego', NULL, 'Herrera', 'Jara', '1992-07-08', 'Masculino', 0),
(5, 'Álvaro', 'Franklin', 'Arce', 'Delgado', '1996-06-03', 'Masculino', 1),
(6, 'Denis', 'David', 'Salmerón', 'Ocón', '1998-06-28', 'Masculino', 1),
(7, 'Jose', 'David', 'Solano', 'Montoya', '1998-03-17', 'Masculino', 0),
(10, 'Hayleen', 'Vanessa', 'Bonilla', 'Bermúdez', '1996-12-31', 'Femenino', 1),
(11, 'José', 'Antonio', 'Umaña', 'Acost', '1987-06-27', 'Masculino', 1),
(13, 'Kevin', '', 'Aguilar', 'Alvarado', '1996-10-23', 'Masculino', 0),
(14, 'Adriana', '', 'Monestel', 'Gamboa', '1993-01-12', 'Femenino', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tactores_x_pelicula`
--

CREATE TABLE `tactores_x_pelicula` (
  `id_actor_pelicula` int(11) NOT NULL,
  `id_pelicula` int(11) NOT NULL,
  `id_actor` int(11) NOT NULL,
  `tipo_actor` char(1) NOT NULL COMMENT 'P: actor primario, S: actor secundario , D: director, R: actor de relleno, O: otros'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tactores_x_pelicula`
--

INSERT INTO `tactores_x_pelicula` (`id_actor_pelicula`, `id_pelicula`, `id_actor`, `tipo_actor`) VALUES
(1, 1, 1, 'P'),
(2, 1, 2, 'S'),
(3, 2, 1, 'R'),
(4, 2, 3, 'P'),
(5, 2, 9, 'O'),
(6, 3, 6, 'P'),
(7, 4, 5, 'P'),
(8, 4, 9, 'P');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tdetalle_prestamo`
--

CREATE TABLE `tdetalle_prestamo` (
  `id_detalle_prestamo` int(11) NOT NULL,
  `id_prestamo` int(11) NOT NULL,
  `id_pelicula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tdetalle_prestamo`
--

INSERT INTO `tdetalle_prestamo` (`id_detalle_prestamo`, `id_prestamo`, `id_pelicula`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 1, 1),
(4, 2, 1),
(5, 3, 4),
(6, 3, 4),
(7, 4, 1),
(8, 4, 4),
(9, 5, 3),
(10, 5, 4),
(11, 6, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpelicula`
--

CREATE TABLE `tpelicula` (
  `id_pelicula` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `anno` year(4) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `disponible` int(11) NOT NULL,
  `estado` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tpelicula`
--

INSERT INTO `tpelicula` (`id_pelicula`, `id_categoria`, `titulo`, `anno`, `cantidad`, `disponible`, `estado`) VALUES
(1, 1, 'La Comunidad del Anillo', 2000, 4, 2, b'1'),
(2, 1, 'Las Dos Torres', 2002, 6, 4, b'1'),
(3, 2, 'R.E.C.', 2007, 3, 3, b'1'),
(4, 2, 'El Orfanato', 2010, 2, 1, b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tprestamo`
--

CREATE TABLE `tprestamo` (
  `id_prestamo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `cantidad_dias` int(11) NOT NULL,
  `estado` char(1) NOT NULL COMMENT 'P: pendiente, C: cancelado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tprestamo`
--

INSERT INTO `tprestamo` (`id_prestamo`, `id_usuario`, `fecha_prestamo`, `cantidad_dias`, `estado`) VALUES
(1, 14, '2017-08-01', 4, 'P'),
(2, 1, '2017-07-30', 5, 'P'),
(3, 7, '2017-08-03', 2, 'P'),
(4, 2, '2017-08-04', 2, 'P'),
(5, 6, '2017-08-02', 2, 'P'),
(6, 4, '2017-08-01', 2, 'C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tusuario`
--

CREATE TABLE `tusuario` (
  `id_usuario` int(11) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contrasenna` longblob NOT NULL,
  `tipo_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tusuario`
--

INSERT INTO `tusuario` (`id_usuario`, `correo`, `contrasenna`, `tipo_usuario`) VALUES
(7, 'pmonestel@ucenfotec.ac.cr', 0xd102c05c1a78a383f3ef9f5d8f9dc31f, 1),
(8, 'hbonillab@ucenfotec.ac.cr', 0x4daf3a619cb25f876dfd8831040e075d, 2),
(9, 'mdominguezm@ucenfotec.ac.cr', 0x9444089503521c3fbf99ee6d7825e6a9, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tactor`
--
ALTER TABLE `tactor`
  ADD PRIMARY KEY (`id_actor`);

--
-- Indices de la tabla `tactores_x_pelicula`
--
ALTER TABLE `tactores_x_pelicula`
  ADD PRIMARY KEY (`id_actor_pelicula`);

--
-- Indices de la tabla `tdetalle_prestamo`
--
ALTER TABLE `tdetalle_prestamo`
  ADD PRIMARY KEY (`id_detalle_prestamo`);

--
-- Indices de la tabla `tpelicula`
--
ALTER TABLE `tpelicula`
  ADD PRIMARY KEY (`id_pelicula`);

--
-- Indices de la tabla `tprestamo`
--
ALTER TABLE `tprestamo`
  ADD PRIMARY KEY (`id_prestamo`);

--
-- Indices de la tabla `tusuario`
--
ALTER TABLE `tusuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tactor`
--
ALTER TABLE `tactor`
  MODIFY `id_actor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `tactores_x_pelicula`
--
ALTER TABLE `tactores_x_pelicula`
  MODIFY `id_actor_pelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `tdetalle_prestamo`
--
ALTER TABLE `tdetalle_prestamo`
  MODIFY `id_detalle_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `tpelicula`
--
ALTER TABLE `tpelicula`
  MODIFY `id_pelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tprestamo`
--
ALTER TABLE `tprestamo`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tusuario`
--
ALTER TABLE `tusuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
