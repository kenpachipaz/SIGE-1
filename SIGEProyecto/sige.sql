-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 16-01-2015 a las 02:14:59
-- Versión del servidor: 5.5.40-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sige`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingresaUsuario`(in user varchar(15), in pass varchar(15))
BEGIN   select tipo FROM usuarios WHERE STRCMP(usuario,user)=0 and STRCMP(pass,password)=0;  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarDatos`(

    in Idcveelectoral varchar(18),

    in App varchar(30),

    in Apm varchar(30),

    in Nombre varchar(45),

    in Telefono numeric,   

    in Email varchar(60),

    in Idseccion numeric,

    in Cargo varchar(25),

    in Observaciones text,

    in Cp numeric,

    in Calle varchar(25),

    in Colonia varchar(30),

    in Municipio varchar(10) 

   )
BEGIN

 insert into datosperson(idcveelectoral,app,apm,nombre,telefono,email) values(Idcveelectoral,App,Apm,Nombre,Telefono,Email);

 insert into datoselector(idseccion,cargo,observaciones) values(Idseccion,Cargo,Observaciones);

 insert into domicilio(cp,calle,colonia,municipio,idcveelectoral,idseccion) values(Cp,Calle,Colonia,Municipio,Idcveelectoral,Idseccion);

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datoselector`
--

CREATE TABLE IF NOT EXISTS `datoselector` (
  `idseccion` decimal(10,0) NOT NULL,
  `cargo` varchar(25) NOT NULL,
  `observaciones` text,
  PRIMARY KEY (`idseccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `datoselector`
--

INSERT INTO `datoselector` (`idseccion`, `cargo`, `observaciones`) VALUES
(232, 'Seguridad', 'Todo bien'),
(737, 'Coordinador General', 'Le gusta inspector equisde'),
(747, 'La de la limpieza', 'Linda y responsable'),
(3388, 'Secretaria', 'Muy buena :)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosperson`
--

CREATE TABLE IF NOT EXISTS `datosperson` (
  `idcveelectoral` varchar(18) NOT NULL,
  `app` varchar(30) NOT NULL,
  `apm` varchar(30) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` decimal(10,0) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idcveelectoral`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `datosperson`
--

INSERT INTO `datosperson` (`idcveelectoral`, `app`, `apm`, `nombre`, `telefono`, `email`) VALUES
('GMVLMR80070501M100', 'Gomez', 'Velazquez', 'Margarita', 0, 'margarita.12@gmail.com'),
('GZFAJL75120909H400', 'Guzman', 'Frausto', 'Jose Luis', 735991123, 'frausto12@gmail.com'),
('LYCSMB79091709M200', 'Leyva', 'CastaÃ±ares', 'Maribel Ivonne', 2147483647, 'ivonne7@gmail.com'),
('PZFLMN92041317H600', 'Paz', 'Flores', 'Manuel', 7341258367, 'pazisc13@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE IF NOT EXISTS `domicilio` (
  `cp` decimal(10,0) NOT NULL,
  `calle` varchar(25) NOT NULL,
  `colonia` varchar(30) NOT NULL,
  `municipio` varchar(10) NOT NULL,
  `idcveelectoral` varchar(18) NOT NULL,
  `idseccion` decimal(10,0) NOT NULL,
  PRIMARY KEY (`cp`),
  KEY `idcveelectoral` (`idcveelectoral`),
  KEY `idseccion` (`idseccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `domicilio`
--

INSERT INTO `domicilio` (`cp`, `calle`, `colonia`, `municipio`, `idcveelectoral`, `idseccion`) VALUES
(1550, 'San marcos', 'Tepeaca', 'Alvaro Obr', 'LYCSMB79091709M200', 3388),
(4800, 'Pitagoras 1253', 'Morelos', 'Cuajimalpa', 'GMVLMR80070501M100', 747),
(37000, 'Miguel de Cervantes 79', 'San Marcos', 'Leon', 'GZFAJL75120909H400', 232),
(62980, 'Emiliano Zapata #7', 'Emiliano Zapata', 'Cuernavaca', 'PZFLMN92041317H600', 737);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `tipo` char(1) DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`iduser`, `usuario`, `password`, `tipo`) VALUES
(1, 'SigeAlta', 'Sige123@', '1'),
(2, 'SigeAdmin', 'Admin123@', '0');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `domicilio_ibfk_1` FOREIGN KEY (`idcveelectoral`) REFERENCES `datosperson` (`idcveelectoral`),
  ADD CONSTRAINT `domicilio_ibfk_2` FOREIGN KEY (`idseccion`) REFERENCES `datoselector` (`idseccion`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
