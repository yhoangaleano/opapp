-- phpMyAdmin SQL Dump
-- version 3.4.4
-- http://www.phpmyadmin.net
--
-- Servidor: mysql.webcindario.com
-- Tiempo de generación: 28-04-2016 a las 14:40:24
-- Versión del servidor: 5.5.46
-- Versión de PHP: 5.6.15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `opapp`
--
CREATE DATABASE `opapp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `opapp`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Buson_Mensajes_Usuario`
--

CREATE TABLE IF NOT EXISTS `TBL_Buson_Mensajes_Usuario` (
  `PK_ID_Buson_Mensajes` int(45) NOT NULL AUTO_INCREMENT,
  `Mensaje` varchar(50) NOT NULL,
  `Fecha_Envio` date NOT NULL,
  `FK_ID_Usuario` int(45) NOT NULL,
  `FK_ID_Pedido` int(45) NOT NULL,
  PRIMARY KEY (`PK_ID_Buson_Mensajes`),
  KEY `FK_ID_Pedido` (`FK_ID_Pedido`),
  KEY `FK_ID_Usuario` (`FK_ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Buson_Notificacion_Usuario`
--

CREATE TABLE IF NOT EXISTS `TBL_Buson_Notificacion_Usuario` (
  `PK_ID_Buson_Notificacion` int(45) NOT NULL AUTO_INCREMENT,
  `FK_ID_Cotizacion` int(45) NOT NULL,
  `Estado_Pedido` varchar(50) NOT NULL DEFAULT 'En proceso',
  `Fecha_Envio` datetime NOT NULL,
  PRIMARY KEY (`PK_ID_Buson_Notificacion`),
  KEY `FK_ID_Cotizacion` (`FK_ID_Cotizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Categoria_Producto`
--

CREATE TABLE IF NOT EXISTS `TBL_Categoria_Producto` (
  `PK_ID_Categoria` int(45) NOT NULL AUTO_INCREMENT,
  `Nombre_Categoria` varchar(45) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`PK_ID_Categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `TBL_Categoria_Producto`
--

INSERT INTO `TBL_Categoria_Producto` (`PK_ID_Categoria`, `Nombre_Categoria`, `Descripcion`) VALUES
(1, 'No Posee', 'No Posee'),
(2, 'Alimentos congelados', 'Estos productos se encuentran en estado de congelacion, se estima una duracion de 2 a 3 semanas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Chat`
--

CREATE TABLE IF NOT EXISTS `TBL_Chat` (
  `PK_ID_Chat` int(40) NOT NULL,
  `Estado_Chat` varchar(45) NOT NULL,
  `FK_ID_Usuario` int(40) NOT NULL,
  `Nombre_Usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PK_ID_Chat`),
  KEY `FK_ID_Usuario` (`FK_ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Cliente`
--

CREATE TABLE IF NOT EXISTS `TBL_Cliente` (
  `PK_ID_Usuario_Persona` int(45) NOT NULL AUTO_INCREMENT,
  `FK_ID_Cuenta` int(45) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Segundo_Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Segundo_Apellido` varchar(45) NOT NULL,
  `Municipio` varchar(45) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Telefono_Celular` int(30) NOT NULL,
  `Sexo` varchar(10) NOT NULL,
  `Tipo_Cliente` varchar(20) NOT NULL,
  `Posee_Empresa` varchar(10) NOT NULL,
  PRIMARY KEY (`PK_ID_Usuario_Persona`),
  KEY `FK_ID_Cuenta` (`FK_ID_Cuenta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `TBL_Cliente`
--

INSERT INTO `TBL_Cliente` (`PK_ID_Usuario_Persona`, `FK_ID_Cuenta`, `Nombre`, `Segundo_Nombre`, `Apellido`, `Segundo_Apellido`, `Municipio`, `Fecha_Nacimiento`, `Telefono_Celular`, `Sexo`, `Tipo_Cliente`, `Posee_Empresa`) VALUES
(1, 1, 'Michael', 'Steven', 'Restrepo', 'Alvarez', 'Bello', '1996-05-05', 320741145, 'Hombre', 'Esporadico', 'NO'),
(2, 2, 'Leider', 'Enrique', 'Valdes', '', 'Bello', '1996-05-15', 320741145, 'Hombre', 'Esporadico', 'NO'),
(3, 3, 'Andres', 'Mateo', 'Londono', 'Rivera', 'Antioquia', '0000-00-00', 320741145, 'Hombre', 'Esporadico', 'NO'),
(4, 4, 'Jhon', 'Jairo', 'Duque', 'Zuleta', 'Antioquia', '2016-03-26', 320741145, 'Hombre', 'Esporadico', 'NO'),
(5, 5, 'Jorman', '', 'atehortua', '', 'Antioquia', '2016-03-19', 2147483647, 'Indefinido', 'Esporadico', 'NO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Comentario`
--

CREATE TABLE IF NOT EXISTS `TBL_Comentario` (
  `PK_ID_Comentario` int(45) NOT NULL AUTO_INCREMENT,
  `FK_ID_Usuario` int(40) NOT NULL,
  `Fecha_Comentario` datetime NOT NULL,
  `Descripcion` varchar(600) NOT NULL,
  `FK_ID_Producto` int(45) NOT NULL,
  `Valoracion_Comentario` int(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PK_ID_Comentario`),
  KEY `FK_ID_Producto` (`FK_ID_Producto`),
  KEY `FK_ID_Usuario` (`FK_ID_Usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `TBL_Comentario`
--

INSERT INTO `TBL_Comentario` (`PK_ID_Comentario`, `FK_ID_Usuario`, `Fecha_Comentario`, `Descripcion`, `FK_ID_Producto`, `Valoracion_Comentario`) VALUES
(1, 3, '2015-03-04 00:00:00', 'Esta bueno el producto', 1, 1),
(2, 3, '2015-03-04 00:00:00', 'Pero esta muy caro', 1, 0),
(3, 2, '2015-05-04 00:00:00', 'No esta bueno el producto', 2, 0),
(4, 2, '2015-05-04 00:00:00', 'Creo que deberia de mejorar', 2, 0),
(5, 5, '2015-05-04 00:00:00', 'Me callo mal el producto', 3, 0),
(6, 5, '2015-05-04 00:00:00', 'Era alergico a la salsa', 3, 0),
(7, 4, '2015-03-04 00:00:00', 'Muy caro', 4, 0),
(8, 1, '2016-03-09 21:27:45', 'Buenisimo el producto :D', 5, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Cotizacion_Usuario`
--

CREATE TABLE IF NOT EXISTS `TBL_Cotizacion_Usuario` (
  `PK_ID_Cotizacion_Usuario` int(45) NOT NULL AUTO_INCREMENT,
  `FK_ID_Usuario` int(45) NOT NULL,
  `Fecha_Cotizacion` datetime NOT NULL,
  `Estado_Cotizacion` varchar(40) NOT NULL DEFAULT 'En proceso',
  `Direccion_entrega` varchar(45) NOT NULL,
  `Telefono_Entrega` varchar(45) NOT NULL,
  PRIMARY KEY (`PK_ID_Cotizacion_Usuario`),
  KEY `FK_ID_Usuario` (`FK_ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Cuenta`
--

CREATE TABLE IF NOT EXISTS `TBL_Cuenta` (
  `PK_ID_Usuario` int(45) NOT NULL AUTO_INCREMENT,
  `Nombre_Usuario` varchar(45) NOT NULL,
  `Correo_Electronico` varchar(45) NOT NULL,
  `Contrasenia` varchar(45) NOT NULL,
  `Contrasenia_Recuperacion` varchar(45) NOT NULL,
  `Contrasenia_Encriptada` varchar(45) NOT NULL,
  `Imagen_Usuario` varchar(250) NOT NULL,
  `Fondo_Perfil_Usuario` varchar(250) NOT NULL,
  `Disponibilidad` varchar(45) NOT NULL DEFAULT 'Activo',
  `Estado_Cuenta` varchar(45) NOT NULL DEFAULT 'En uso',
  `FK_ID_Rol` int(45) NOT NULL,
  PRIMARY KEY (`PK_ID_Usuario`),
  KEY `FK_ID_Rol` (`FK_ID_Rol`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `TBL_Cuenta`
--

INSERT INTO `TBL_Cuenta` (`PK_ID_Usuario`, `Nombre_Usuario`, `Correo_Electronico`, `Contrasenia`, `Contrasenia_Recuperacion`, `Contrasenia_Encriptada`, `Imagen_Usuario`, `Fondo_Perfil_Usuario`, `Disponibilidad`, `Estado_Cuenta`, `FK_ID_Rol`) VALUES
(1, 'Mike', 'stiven3345@hotmail.com', '3345sra', 'p0nL5ZNS', '$2a$07$FC11BG6DAIB2JDE1E5B.EuS/LM1TnDDnD0anKG', 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/avatars/lol.jpg', 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/Ghoul_1.jpg', 'Activo', 'En uso', 3),
(2, 'Thelasofus', 'leidervm16@gmail.com', '3345SRA', 'kyd0J3MK', '$2a$07$43H80D/62H66602CE6E6C.mGByAml./9VvQP3T', 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/avatars/avatar2_big.png', 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mo66-old-car-forest-vintage-flare-nature-carl-kadysz-2880x1800.jpg', 'Activo', 'En uso', 3),
(3, 'Derkiller', 'amlondono@gmail.com', '3345sra', 'Nflz1h6k', '$2a$07$FH4B3337J12F0C./H.0KCuZCjdHIVtDnJMEubR', 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/avatars/avatar2_big.png', 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mo66-old-car-forest-vintage-flare-nature-carl-kadysz-2880x1800.jpg', 'Activo', 'En uso', 3),
(4, 'Jairo880', 'jairo880@gmail.com', '3345sra', 'mJMmiGBu', '$2a$07$85.63C38FI91EK7../6DBux2v7OvVX0.EYI3La', 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/avatars/avatar2_big.png', 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mo66-old-car-forest-vintage-flare-nature-carl-kadysz-2880x1800.jpg', 'Activo', 'En uso', 3),
(5, 'Amy', 'Mowglik@gmail.com', '3345sra', 'NJh6kY21', '$2a$07$9...39F41045C08DG2/53.P1IafAEUi6N5a5Kz', 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/avatars/avatar8_big.png', 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/CEA8B1696.jpg', 'Activo', 'En uso', 3),
(6, 'Empleado', 'Empleado@hotmail.com', '3345sra', 'uWoUyI36', '$2a$07$AI37AD5D3C7D8.8/8GA6C.bN9lq881DPPd4Oie', 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/avatars/avatar2_big.png', 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/CF9.jpg', 'Activo', 'En uso', 2),
(7, 'Administrador', 'Administrador@hotmail.com', '3345sra', 'ilQX4kTG', '$2a$07$AC00.335HCF1FA0DHA0DE./Yq8SsyPBA26OEuu', 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/avatars/avatar2_big.png', 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mo40-mac-apple-desk-jeff-sheldon-dark-office-3840x2400-4k-wallpaper.jpg', 'Activo', 'En uso', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_DLL_Buson_Mensajes_Usuario`
--

CREATE TABLE IF NOT EXISTS `TBL_DLL_Buson_Mensajes_Usuario` (
  `PK_ID_Mensaje_Usuario` int(45) NOT NULL AUTO_INCREMENT,
  `FK_Buson_Mensajes` int(45) NOT NULL,
  `FK_ID_Usuario` int(45) NOT NULL,
  PRIMARY KEY (`PK_ID_Mensaje_Usuario`),
  KEY `FK_Buson_Mensajes` (`FK_Buson_Mensajes`),
  KEY `FK_ID_Usuario` (`FK_ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_DLL_Buson_Notificacion_Usuario`
--

CREATE TABLE IF NOT EXISTS `TBL_DLL_Buson_Notificacion_Usuario` (
  `PK_ID_Notificacion_Usuario` int(45) NOT NULL AUTO_INCREMENT,
  `FK_ID_Buson_Notificacion` int(45) NOT NULL,
  `FK_ID_Usuario` int(45) NOT NULL,
  PRIMARY KEY (`PK_ID_Notificacion_Usuario`),
  KEY `FK_ID_Buson_Notificacion` (`FK_ID_Buson_Notificacion`),
  KEY `FK_ID_Usuario` (`FK_ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_DLL_Comentario_Cuenta`
--

CREATE TABLE IF NOT EXISTS `TBL_DLL_Comentario_Cuenta` (
  `PK_ID_Comentario_Cuenta` int(45) NOT NULL AUTO_INCREMENT,
  `FK_ID_Usuario` int(40) NOT NULL,
  `FK_ID_Comentario` int(45) NOT NULL,
  PRIMARY KEY (`PK_ID_Comentario_Cuenta`),
  KEY `FK_ID_Comentario` (`FK_ID_Comentario`),
  KEY `FK_ID_Usuario` (`FK_ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_DLL_Producto_Cotizacion`
--

CREATE TABLE IF NOT EXISTS `TBL_DLL_Producto_Cotizacion` (
  `PK_ID_Producto_Cotizacion` int(45) NOT NULL AUTO_INCREMENT,
  `FK_ID_Producto` int(45) NOT NULL,
  `FK_ID_Cotizacion_Usuario` int(40) NOT NULL,
  `Cantidad_Productos` int(45) NOT NULL,
  `Sub_Total` int(100) NOT NULL,
  PRIMARY KEY (`PK_ID_Producto_Cotizacion`),
  KEY `FK_ID_Producto` (`FK_ID_Producto`),
  KEY `FK_ID_Cotizacion_Usuario` (`FK_ID_Cotizacion_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_DLL_Promocion_Producto`
--

CREATE TABLE IF NOT EXISTS `TBL_DLL_Promocion_Producto` (
  `PK_ID_Promocion_Producto` int(45) NOT NULL AUTO_INCREMENT,
  `FK_ID_Producto` int(45) NOT NULL,
  `FK_ID_Promocion` int(45) NOT NULL,
  PRIMARY KEY (`PK_ID_Promocion_Producto`),
  KEY `FK_ID_Producto` (`FK_ID_Producto`),
  KEY `FK_ID_Promocion` (`FK_ID_Promocion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `TBL_DLL_Promocion_Producto`
--

INSERT INTO `TBL_DLL_Promocion_Producto` (`PK_ID_Promocion_Producto`, `FK_ID_Producto`, `FK_ID_Promocion`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_DLL_Rol_Cuenta`
--

CREATE TABLE IF NOT EXISTS `TBL_DLL_Rol_Cuenta` (
  `PK_ID_DLL_Rol_Cuenta` int(45) NOT NULL AUTO_INCREMENT,
  `FK_ID_Rol` int(45) NOT NULL,
  `FK_ID_Usuario` int(45) NOT NULL,
  PRIMARY KEY (`PK_ID_DLL_Rol_Cuenta`),
  KEY `FK_ID_Rol` (`FK_ID_Rol`),
  KEY `FK_ID_Usuario` (`FK_ID_Usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `TBL_DLL_Rol_Cuenta`
--

INSERT INTO `TBL_DLL_Rol_Cuenta` (`PK_ID_DLL_Rol_Cuenta`, `FK_ID_Rol`, `FK_ID_Usuario`) VALUES
(1, 3, 1),
(2, 3, 2),
(3, 3, 3),
(4, 3, 4),
(5, 3, 5),
(6, 2, 6),
(7, 2, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_DLL_Ruta_Pedido`
--

CREATE TABLE IF NOT EXISTS `TBL_DLL_Ruta_Pedido` (
  `PK_ID_Ruta_Pedido` int(45) NOT NULL AUTO_INCREMENT,
  `FK_ID_Ruta` int(40) NOT NULL,
  `FK_ID_Pedido` int(40) NOT NULL,
  PRIMARY KEY (`PK_ID_Ruta_Pedido`),
  KEY `FK_ID_Ruta` (`FK_ID_Ruta`),
  KEY `FK_ID_Pedido` (`FK_ID_Pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Datos_Establecimientos`
--

CREATE TABLE IF NOT EXISTS `TBL_Datos_Establecimientos` (
  `PK_ID_Establecimiento` int(45) NOT NULL AUTO_INCREMENT,
  `Nombre_Establecimiento` varchar(45) NOT NULL,
  `Nombre_Encargado` varchar(45) NOT NULL,
  `Nit` varchar(45) NOT NULL,
  `Telefono_Establecimiento` varchar(45) NOT NULL,
  `Direccion_Establecimiento` varchar(45) NOT NULL,
  `Municipio_Establecimiento` varchar(45) NOT NULL,
  `FK_ID_Usuario` int(45) NOT NULL,
  PRIMARY KEY (`PK_ID_Establecimiento`),
  KEY `FK_ID_Usuario` (`FK_ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Ejemplo_Crud`
--

CREATE TABLE IF NOT EXISTS `TBL_Ejemplo_Crud` (
  `PK_ID_Usuario_Ejemplo` int(45) NOT NULL AUTO_INCREMENT,
  `Nombre_Usuario_Ejemplo` varchar(45) NOT NULL,
  `Contrasenia_Ejemplo` varchar(45) NOT NULL,
  PRIMARY KEY (`PK_ID_Usuario_Ejemplo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Empleado`
--

CREATE TABLE IF NOT EXISTS `TBL_Empleado` (
  `PK_ID_Usuario_Persona` int(45) NOT NULL AUTO_INCREMENT,
  `FK_ID_Cuenta` int(45) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Segundo_Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Segundo_Apellido` varchar(45) NOT NULL,
  `Municipio` varchar(45) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Telefono_Celular` int(30) NOT NULL,
  `Sexo` varchar(10) NOT NULL,
  PRIMARY KEY (`PK_ID_Usuario_Persona`),
  KEY `FK_ID_Cuenta` (`FK_ID_Cuenta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `TBL_Empleado`
--

INSERT INTO `TBL_Empleado` (`PK_ID_Usuario_Persona`, `FK_ID_Cuenta`, `Nombre`, `Segundo_Nombre`, `Apellido`, `Segundo_Apellido`, `Municipio`, `Fecha_Nacimiento`, `Telefono_Celular`, `Sexo`) VALUES
(1, 6, 'Empleado', 'null', 'Empleado', 'null', 'Medellín', '1997-06-10', 320741145, 'Hombre'),
(2, 7, 'Administrador', 'null', 'Administrador', 'null', 'Medellín', '1997-06-10', 320741145, 'Hombre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Imagenes_Portada`
--

CREATE TABLE IF NOT EXISTS `TBL_Imagenes_Portada` (
  `PK_ID_Imagen_Portada` int(40) NOT NULL AUTO_INCREMENT,
  `URL_Imagen_Portada` varchar(250) NOT NULL,
  PRIMARY KEY (`PK_ID_Imagen_Portada`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

--
-- Volcado de datos para la tabla `TBL_Imagenes_Portada`
--

INSERT INTO `TBL_Imagenes_Portada` (`PK_ID_Imagen_Portada`, `URL_Imagen_Portada`) VALUES
(4, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/CEA8B1696.jpg'),
(5, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/CF9.jpg'),
(9, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-ak95-oriental-art-flower-dark-black-painting-illust-3840x2400-4k-wallpaper.jpg'),
(17, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mb75-wallpaper-water-winter-tree-flower-3840x2400-4k-wallpaper.jpg'),
(18, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mf91-rain-drop-on-sunny-afternoon-nature-3840x2400-4k-wallpaper.jpg'),
(19, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mh34-aalborg-night-scene-from-sea-dark-cityscape-3840x2400-4k-wallpaper.jpg'),
(21, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mi53-breakfast-dish-dark-todd-quackenbush-photo-nature-3840x2400-4k-wallpaper.jpg'),
(22, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mi90-life-begins-leaf-waterdrop-nature-3840x2400-4k-wallpaper.jpg'),
(23, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mj05-fire-camp-light-thomas-lefebvre-nature-3840x2400-4k-wallpaper.jpg'),
(29, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-ml98-backyard-wood-day-bw-flare-bokeh-nature-1920x1080.jpg'),
(30, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mm05-flight-sunny-day-sky-dark-bokeh-high-mountains-nature-35-3840x2160-4k-wallpaper.jpg'),
(32, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mm67-jungle-gym-city-dark-bw-school-art-3840x2400-4k-wallpaper.jpg'),
(35, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mn04-city-bokeh-night-street-nature-israel-sundseth-3840x2400-4k-wallpaper.jpg'),
(37, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mn66-new-york-street-night-city-dark-bw-vignette-3840x2400-4k-wallpaper.jpg'),
(38, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mo40-mac-apple-desk-jeff-sheldon-dark-office-3840x2400-4k-wallpaper.jpg'),
(39, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mo50-forest-green-nature-tree-jonas-nilsson-lee-2880x1800%20%281%29.jpg'),
(40, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mo66-old-car-forest-vintage-flare-nature-carl-kadysz-2880x1800.jpg'),
(44, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mp77-city-of-angels-skyview-dark-art-3840x2400-4k-wallpaper.jpg'),
(45, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mq71-bokeh-night-city-view-lights-1920x1080.jpg'),
(46, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mr04-drive-way-sunset-city-highway-car-flare-2560x1440.jpg'),
(47, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mr34-lake-calm-nature-beautiful-sea-water-1920x1080.jpg'),
(48, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-ms01-city-bridge-green-nature-1920x1080.jpg'),
(49, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-ms07-the-runner-mountain-jogging-sun-morning-nature-dark-bw-2880x1800.jpg'),
(51, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-ms74-stars-light-dark-interior-city-3840x2400-4k-wallpaper.jpg'),
(55, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mv08-wood-nature-forest-road-mountain-dark-summer-2560x1440.jpg'),
(57, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mv34-night-beach-sea-vacation-nature-star-sky-2880x1800.jpg'),
(58, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mv37-dawn-sunset-blue-mountain-sky-nature-3840x2400-4k-wallpaper.jpg'),
(59, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mv63-night-nature-flower-sunset-dark-shadow-2560x1600.jpg'),
(60, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mv70-sky-night-star-dark-mountain-cloud-shadow-3840x2400-4k-wallpaper.jpg'),
(62, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mv89-garden-moss-stone-nature-road-city-flare-dark-bw-2880x1800.jpg'),
(65, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-mv94-light-night-lamp-city-silent-dark-2880x1800.jpg'),
(67, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-ve56-bokeh-light-dark-water-city-nature-3840x2400-4k-wallpaper.jpg'),
(68, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/papers.co-vf86-square-party-oranage-pattern-1440x900.jpg'),
(70, 'https://dl.dropboxusercontent.com/u/232442887/Allop/img/wallpapers/Ghoul_1.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Imagenes_Usuarios`
--

CREATE TABLE IF NOT EXISTS `TBL_Imagenes_Usuarios` (
  `PK_ID_Imagen_Usuario` int(40) NOT NULL AUTO_INCREMENT,
  `URL_Imagen_Usuario` varchar(250) NOT NULL,
  PRIMARY KEY (`PK_ID_Imagen_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Pedido_Usuario`
--

CREATE TABLE IF NOT EXISTS `TBL_Pedido_Usuario` (
  `PK_ID_Pedido` int(45) NOT NULL AUTO_INCREMENT,
  `Fecha_Pedido` date NOT NULL,
  `FK_ID_Cotizacion_Usuario` int(45) NOT NULL,
  `Direccion_entrega` varchar(200) NOT NULL,
  `Fecha_Cotizacion` date NOT NULL,
  `Estado_pedido` varchar(40) NOT NULL,
  PRIMARY KEY (`PK_ID_Pedido`),
  KEY `FK_ID_Cotizacion_Usuario` (`FK_ID_Cotizacion_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Permisos_Usuario`
--

CREATE TABLE IF NOT EXISTS `TBL_Permisos_Usuario` (
  `PK_ID_Permisos_Usuario` int(40) NOT NULL AUTO_INCREMENT,
  `FK_ID_Rol` int(40) NOT NULL,
  `FK_ID_Vista` int(40) NOT NULL,
  PRIMARY KEY (`PK_ID_Permisos_Usuario`),
  KEY `FK_ID_Rol` (`FK_ID_Rol`),
  KEY `FK_ID_Vista` (`FK_ID_Vista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Producto`
--

CREATE TABLE IF NOT EXISTS `TBL_Producto` (
  `PK_ID_Producto` int(40) NOT NULL AUTO_INCREMENT,
  `Nombre_Producto` varchar(45) NOT NULL,
  `Valor_Unitario` int(30) NOT NULL,
  `Descripcion_Producto` varchar(250) NOT NULL,
  `Cant_Unid_Max` int(100) NOT NULL,
  `Cant_Unid_Min` int(100) NOT NULL,
  `FK_ID_Categoria` int(40) NOT NULL,
  `Ruta_Imagen_Producto` varchar(250) NOT NULL,
  `Estado_Producto` varchar(45) NOT NULL DEFAULT 'Habilitado',
  PRIMARY KEY (`PK_ID_Producto`),
  KEY `FK_ID_Categoria` (`FK_ID_Categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `TBL_Producto`
--

INSERT INTO `TBL_Producto` (`PK_ID_Producto`, `Nombre_Producto`, `Valor_Unitario`, `Descripcion_Producto`, `Cant_Unid_Max`, `Cant_Unid_Min`, `FK_ID_Categoria`, `Ruta_Imagen_Producto`, `Estado_Producto`) VALUES
(1, 'Tequeno', 1500, 'Productos congelado', 60, 15, 1, 'http://lorempixel.com/image_output/food-q-c-640-480-6.jpg', 'Habilitado'),
(2, 'Empanada con pollo', 3000, 'Productos congelado', 60, 15, 1, 'http://lorempixel.com/image_output/food-q-c-640-480-4.jpg', 'Habilitado'),
(3, 'Pancerotis(Ranchero)', 1000, 'Productos congelado', 60, 15, 1, 'http://lorempixel.com/image_output/food-q-c-640-480-9.jpg', 'Habilitado'),
(4, 'Pancerotis(Pollo)', 500, 'Productos congelado', 60, 15, 1, 'http://lorempixel.com/image_output/food-q-c-640-480-3.jpg', 'Habilitado'),
(5, 'Pancerotis(Hawaiano)', 2000, 'Productos congelado', 60, 15, 1, 'http://lorempixel.com/image_output/food-q-c-640-480-5.jpg', 'Habilitado'),
(6, 'Palitos', 3500, 'Productos congelado', 60, 15, 1, 'http://lorempixel.com/image_output/food-q-c-640-480-8.jpg', 'Habilitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Promocion`
--

CREATE TABLE IF NOT EXISTS `TBL_Promocion` (
  `PK_ID_Promocion` int(45) NOT NULL AUTO_INCREMENT,
  `Nombre_Promocion` varchar(45) NOT NULL,
  `Descripcion` varchar(300) NOT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Fecha_Fin` date NOT NULL,
  PRIMARY KEY (`PK_ID_Promocion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `TBL_Promocion`
--

INSERT INTO `TBL_Promocion` (`PK_ID_Promocion`, `Nombre_Promocion`, `Descripcion`, `Fecha_Inicio`, `Fecha_Fin`) VALUES
(1, 'Promocion 1', '20 unidades de tequenos', '2015-03-03', '2015-03-04'),
(2, 'Promocion 2', '15 unidades de pancerotis', '2015-03-03', '2015-05-04'),
(3, 'Promocion 3', '30 unidades de pancerotis', '2015-05-03', '2015-06-04'),
(4, 'Promocion 4', '10 unidades de palitos', '2015-03-03', '2015-03-04'),
(5, 'Promocion 5', '20 unidades de empanadas ', '2015-03-06', '2015-03-08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Rol_Usuario`
--

CREATE TABLE IF NOT EXISTS `TBL_Rol_Usuario` (
  `PK_ID_Rol` int(45) NOT NULL AUTO_INCREMENT,
  `Nombre_Rol` varchar(45) NOT NULL,
  PRIMARY KEY (`PK_ID_Rol`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `TBL_Rol_Usuario`
--

INSERT INTO `TBL_Rol_Usuario` (`PK_ID_Rol`, `Nombre_Rol`) VALUES
(1, 'Administrador'),
(2, 'Empleado'),
(3, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Ruta`
--

CREATE TABLE IF NOT EXISTS `TBL_Ruta` (
  `PK_ID_Ruta` int(40) NOT NULL AUTO_INCREMENT,
  `FK_ID_Ubicacion` int(45) NOT NULL,
  PRIMARY KEY (`PK_ID_Ruta`),
  KEY `FK_ID_Ubicacion` (`FK_ID_Ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Ubicacion`
--

CREATE TABLE IF NOT EXISTS `TBL_Ubicacion` (
  `PK_ID_Ubicacion` int(40) NOT NULL AUTO_INCREMENT,
  `FK_ID_Usuario` int(30) NOT NULL,
  `Longitut` decimal(10,0) NOT NULL,
  `Latitud` decimal(10,0) NOT NULL,
  PRIMARY KEY (`PK_ID_Ubicacion`),
  KEY `FK_ID_Usuario` (`FK_ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_Vista_Usuario`
--

CREATE TABLE IF NOT EXISTS `TBL_Vista_Usuario` (
  `PK_ID_Vista` int(40) NOT NULL AUTO_INCREMENT,
  `Nombre_Vista` varchar(40) NOT NULL,
  `Url_Vista` varchar(150) NOT NULL,
  PRIMARY KEY (`PK_ID_Vista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `TBL_Buson_Mensajes_Usuario`
--
ALTER TABLE `TBL_Buson_Mensajes_Usuario`
  ADD CONSTRAINT `TBL_Buson_Mensajes_Usuario_ibfk_1` FOREIGN KEY (`FK_ID_Pedido`) REFERENCES `TBL_Pedido_Usuario` (`PK_ID_Pedido`),
  ADD CONSTRAINT `TBL_Buson_Mensajes_Usuario_ibfk_2` FOREIGN KEY (`FK_ID_Usuario`) REFERENCES `TBL_Cuenta` (`PK_ID_Usuario`);

--
-- Filtros para la tabla `TBL_Buson_Notificacion_Usuario`
--
ALTER TABLE `TBL_Buson_Notificacion_Usuario`
  ADD CONSTRAINT `TBL_Buson_Notificacion_Usuario_ibfk_1` FOREIGN KEY (`FK_ID_Cotizacion`) REFERENCES `TBL_Cotizacion_Usuario` (`PK_ID_Cotizacion_Usuario`);

--
-- Filtros para la tabla `TBL_Chat`
--
ALTER TABLE `TBL_Chat`
  ADD CONSTRAINT `TBL_Chat_ibfk_1` FOREIGN KEY (`FK_ID_Usuario`) REFERENCES `TBL_Cuenta` (`PK_ID_Usuario`);

--
-- Filtros para la tabla `TBL_Cliente`
--
ALTER TABLE `TBL_Cliente`
  ADD CONSTRAINT `TBL_Cliente_ibfk_1` FOREIGN KEY (`FK_ID_Cuenta`) REFERENCES `TBL_Cuenta` (`PK_ID_Usuario`);

--
-- Filtros para la tabla `TBL_Comentario`
--
ALTER TABLE `TBL_Comentario`
  ADD CONSTRAINT `TBL_Comentario_ibfk_1` FOREIGN KEY (`FK_ID_Producto`) REFERENCES `TBL_Producto` (`PK_ID_Producto`),
  ADD CONSTRAINT `TBL_Comentario_ibfk_2` FOREIGN KEY (`FK_ID_Usuario`) REFERENCES `TBL_Cuenta` (`PK_ID_Usuario`);

--
-- Filtros para la tabla `TBL_Cotizacion_Usuario`
--
ALTER TABLE `TBL_Cotizacion_Usuario`
  ADD CONSTRAINT `TBL_Cotizacion_Usuario_ibfk_1` FOREIGN KEY (`FK_ID_Usuario`) REFERENCES `TBL_Cuenta` (`PK_ID_Usuario`);

--
-- Filtros para la tabla `TBL_Cuenta`
--
ALTER TABLE `TBL_Cuenta`
  ADD CONSTRAINT `TBL_Cuenta_ibfk_1` FOREIGN KEY (`FK_ID_Rol`) REFERENCES `TBL_Rol_Usuario` (`PK_ID_Rol`);

--
-- Filtros para la tabla `TBL_DLL_Buson_Mensajes_Usuario`
--
ALTER TABLE `TBL_DLL_Buson_Mensajes_Usuario`
  ADD CONSTRAINT `TBL_DLL_Buson_Mensajes_Usuario_ibfk_1` FOREIGN KEY (`FK_Buson_Mensajes`) REFERENCES `TBL_Buson_Mensajes_Usuario` (`PK_ID_Buson_Mensajes`),
  ADD CONSTRAINT `TBL_DLL_Buson_Mensajes_Usuario_ibfk_2` FOREIGN KEY (`FK_ID_Usuario`) REFERENCES `TBL_Cuenta` (`PK_ID_Usuario`);

--
-- Filtros para la tabla `TBL_DLL_Buson_Notificacion_Usuario`
--
ALTER TABLE `TBL_DLL_Buson_Notificacion_Usuario`
  ADD CONSTRAINT `TBL_DLL_Buson_Notificacion_Usuario_ibfk_1` FOREIGN KEY (`FK_ID_Buson_Notificacion`) REFERENCES `TBL_Buson_Notificacion_Usuario` (`PK_ID_Buson_Notificacion`),
  ADD CONSTRAINT `TBL_DLL_Buson_Notificacion_Usuario_ibfk_2` FOREIGN KEY (`FK_ID_Usuario`) REFERENCES `TBL_Cuenta` (`PK_ID_Usuario`);

--
-- Filtros para la tabla `TBL_DLL_Comentario_Cuenta`
--
ALTER TABLE `TBL_DLL_Comentario_Cuenta`
  ADD CONSTRAINT `TBL_DLL_Comentario_Cuenta_ibfk_1` FOREIGN KEY (`FK_ID_Comentario`) REFERENCES `TBL_Comentario` (`PK_ID_Comentario`),
  ADD CONSTRAINT `TBL_DLL_Comentario_Cuenta_ibfk_2` FOREIGN KEY (`FK_ID_Usuario`) REFERENCES `TBL_Cuenta` (`PK_ID_Usuario`);

--
-- Filtros para la tabla `TBL_DLL_Producto_Cotizacion`
--
ALTER TABLE `TBL_DLL_Producto_Cotizacion`
  ADD CONSTRAINT `TBL_DLL_Producto_Cotizacion_ibfk_1` FOREIGN KEY (`FK_ID_Producto`) REFERENCES `TBL_Producto` (`PK_ID_Producto`),
  ADD CONSTRAINT `TBL_DLL_Producto_Cotizacion_ibfk_2` FOREIGN KEY (`FK_ID_Cotizacion_Usuario`) REFERENCES `TBL_Cotizacion_Usuario` (`PK_ID_Cotizacion_Usuario`);

--
-- Filtros para la tabla `TBL_DLL_Promocion_Producto`
--
ALTER TABLE `TBL_DLL_Promocion_Producto`
  ADD CONSTRAINT `TBL_DLL_Promocion_Producto_ibfk_1` FOREIGN KEY (`FK_ID_Producto`) REFERENCES `TBL_Producto` (`PK_ID_Producto`),
  ADD CONSTRAINT `TBL_DLL_Promocion_Producto_ibfk_2` FOREIGN KEY (`FK_ID_Promocion`) REFERENCES `TBL_Promocion` (`PK_ID_Promocion`);

--
-- Filtros para la tabla `TBL_DLL_Rol_Cuenta`
--
ALTER TABLE `TBL_DLL_Rol_Cuenta`
  ADD CONSTRAINT `TBL_DLL_Rol_Cuenta_ibfk_1` FOREIGN KEY (`FK_ID_Rol`) REFERENCES `TBL_Rol_Usuario` (`PK_ID_Rol`),
  ADD CONSTRAINT `TBL_DLL_Rol_Cuenta_ibfk_2` FOREIGN KEY (`FK_ID_Usuario`) REFERENCES `TBL_Cuenta` (`PK_ID_Usuario`);

--
-- Filtros para la tabla `TBL_DLL_Ruta_Pedido`
--
ALTER TABLE `TBL_DLL_Ruta_Pedido`
  ADD CONSTRAINT `TBL_DLL_Ruta_Pedido_ibfk_1` FOREIGN KEY (`FK_ID_Ruta`) REFERENCES `TBL_Ruta` (`PK_ID_Ruta`),
  ADD CONSTRAINT `TBL_DLL_Ruta_Pedido_ibfk_2` FOREIGN KEY (`FK_ID_Pedido`) REFERENCES `TBL_Pedido_Usuario` (`PK_ID_Pedido`);

--
-- Filtros para la tabla `TBL_Datos_Establecimientos`
--
ALTER TABLE `TBL_Datos_Establecimientos`
  ADD CONSTRAINT `TBL_Datos_Establecimientos_ibfk_1` FOREIGN KEY (`FK_ID_Usuario`) REFERENCES `TBL_Cuenta` (`PK_ID_Usuario`);

--
-- Filtros para la tabla `TBL_Empleado`
--
ALTER TABLE `TBL_Empleado`
  ADD CONSTRAINT `TBL_Empleado_ibfk_1` FOREIGN KEY (`FK_ID_Cuenta`) REFERENCES `TBL_Cuenta` (`PK_ID_Usuario`);

--
-- Filtros para la tabla `TBL_Pedido_Usuario`
--
ALTER TABLE `TBL_Pedido_Usuario`
  ADD CONSTRAINT `TBL_Pedido_Usuario_ibfk_1` FOREIGN KEY (`FK_ID_Cotizacion_Usuario`) REFERENCES `TBL_Cotizacion_Usuario` (`PK_ID_Cotizacion_Usuario`);

--
-- Filtros para la tabla `TBL_Permisos_Usuario`
--
ALTER TABLE `TBL_Permisos_Usuario`
  ADD CONSTRAINT `TBL_Permisos_Usuario_ibfk_1` FOREIGN KEY (`FK_ID_Rol`) REFERENCES `TBL_Rol_Usuario` (`PK_ID_Rol`),
  ADD CONSTRAINT `TBL_Permisos_Usuario_ibfk_2` FOREIGN KEY (`FK_ID_Vista`) REFERENCES `TBL_Vista_Usuario` (`PK_ID_Vista`);

--
-- Filtros para la tabla `TBL_Producto`
--
ALTER TABLE `TBL_Producto`
  ADD CONSTRAINT `TBL_Producto_ibfk_1` FOREIGN KEY (`FK_ID_Categoria`) REFERENCES `TBL_Categoria_Producto` (`PK_ID_Categoria`);

--
-- Filtros para la tabla `TBL_Ruta`
--
ALTER TABLE `TBL_Ruta`
  ADD CONSTRAINT `TBL_Ruta_ibfk_1` FOREIGN KEY (`FK_ID_Ubicacion`) REFERENCES `TBL_Ubicacion` (`PK_ID_Ubicacion`);

--
-- Filtros para la tabla `TBL_Ubicacion`
--
ALTER TABLE `TBL_Ubicacion`
  ADD CONSTRAINT `TBL_Ubicacion_ibfk_1` FOREIGN KEY (`FK_ID_Usuario`) REFERENCES `TBL_Cuenta` (`PK_ID_Usuario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
