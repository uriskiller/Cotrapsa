-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-07-2020 a las 04:38:35
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cotrapsaadmin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cl_empresa`
--

CREATE TABLE `cl_empresa` (
  `idEmpresa` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `ubicacion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cl_estatus`
--

CREATE TABLE `cl_estatus` (
  `idEstatus` int(11) NOT NULL,
  `descripcion_estatus` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cl_frenostipo`
--

CREATE TABLE `cl_frenostipo` (
  `idFrenosTipo` int(11) NOT NULL,
  `descripcion_frenos_tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cl_frenostipo`
--

INSERT INTO `cl_frenostipo` (`idFrenosTipo`, `descripcion_frenos_tipo`) VALUES
(1, 'Tambor'),
(2, 'Disco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cl_materiales`
--

CREATE TABLE `cl_materiales` (
  `idMateriales` int(11) NOT NULL,
  `no_parte` varchar(45) DEFAULT NULL,
  `cantidad_stock` double DEFAULT NULL,
  `descripcion_material` varchar(255) DEFAULT NULL,
  `unidad_medida` varchar(50) DEFAULT NULL,
  `idServicios` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cl_roles`
--

CREATE TABLE `cl_roles` (
  `idRoles` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cl_roles`
--

INSERT INTO `cl_roles` (`idRoles`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'Tecnico'),
(3, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cl_servicios`
--

CREATE TABLE `cl_servicios` (
  `idServicios` int(11) NOT NULL,
  `descripcion_servicio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cl_servicios`
--

INSERT INTO `cl_servicios` (`idServicios`, `descripcion_servicio`) VALUES
(1, 'ABS'),
(2, 'AUTOINFLADO'),
(3, 'ELÉCTRICO'),
(4, 'RRS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cl_tiposervicio`
--

CREATE TABLE `cl_tiposervicio` (
  `idTipoServicios` int(11) NOT NULL,
  `descripcion_tipo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cl_tiposervicio`
--

INSERT INTO `cl_tiposervicio` (`idTipoServicios`, `descripcion_tipo`) VALUES
(1, 'Instalacion'),
(2, 'Mantenimiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cl_unidadtipo`
--

CREATE TABLE `cl_unidadtipo` (
  `idUnidadTipo` int(11) NOT NULL,
  `descripcion_unidad_tipo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cl_usuarios`
--

CREATE TABLE `cl_usuarios` (
  `idUsuarios` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `idRoles` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulario`
--

CREATE TABLE `formulario` (
  `idFormulario` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `no_economico` varchar(100) DEFAULT NULL,
  `placas` varchar(100) DEFAULT NULL,
  `vin` varchar(100) DEFAULT NULL,
  `maca` varchar(100) DEFAULT NULL,
  `id_UnidadTipo` int(11) DEFAULT NULL,
  `id_FrenosTipo` int(11) DEFAULT NULL,
  `observaciones` longtext DEFAULT NULL,
  `idUsuarios` int(11) NOT NULL,
  `idServicios` int(11) DEFAULT NULL,
  `idTipoServicios` int(11) DEFAULT NULL,
  `idEstatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulario_materiales`
--

CREATE TABLE `formulario_materiales` (
  `idFormulario_Materiales` int(11) NOT NULL,
  `cantidad` double DEFAULT NULL,
  `idMateriales` int(11) DEFAULT NULL,
  `idFormulario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_empresa`
--

CREATE TABLE `usuario_empresa` (
  `idUsuario_Empresa` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `idUsuarios` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cl_empresa`
--
ALTER TABLE `cl_empresa`
  ADD PRIMARY KEY (`idEmpresa`);

--
-- Indices de la tabla `cl_estatus`
--
ALTER TABLE `cl_estatus`
  ADD PRIMARY KEY (`idEstatus`);

--
-- Indices de la tabla `cl_frenostipo`
--
ALTER TABLE `cl_frenostipo`
  ADD PRIMARY KEY (`idFrenosTipo`);

--
-- Indices de la tabla `cl_materiales`
--
ALTER TABLE `cl_materiales`
  ADD PRIMARY KEY (`idMateriales`),
  ADD KEY `idServicios` (`idServicios`);

--
-- Indices de la tabla `cl_roles`
--
ALTER TABLE `cl_roles`
  ADD PRIMARY KEY (`idRoles`);

--
-- Indices de la tabla `cl_servicios`
--
ALTER TABLE `cl_servicios`
  ADD PRIMARY KEY (`idServicios`);

--
-- Indices de la tabla `cl_tiposervicio`
--
ALTER TABLE `cl_tiposervicio`
  ADD PRIMARY KEY (`idTipoServicios`);

--
-- Indices de la tabla `cl_unidadtipo`
--
ALTER TABLE `cl_unidadtipo`
  ADD PRIMARY KEY (`idUnidadTipo`);

--
-- Indices de la tabla `cl_usuarios`
--
ALTER TABLE `cl_usuarios`
  ADD PRIMARY KEY (`idUsuarios`),
  ADD KEY `idRoles` (`idRoles`);

--
-- Indices de la tabla `formulario`
--
ALTER TABLE `formulario`
  ADD PRIMARY KEY (`idFormulario`,`idUsuarios`),
  ADD KEY `idUsuarios` (`idUsuarios`),
  ADD KEY `idServicios` (`idServicios`),
  ADD KEY `idTipoServicios` (`idTipoServicios`),
  ADD KEY `id_UnidadTipo` (`id_UnidadTipo`),
  ADD KEY `id_FrenosTipo` (`id_FrenosTipo`),
  ADD KEY `idEstatus` (`idEstatus`);

--
-- Indices de la tabla `formulario_materiales`
--
ALTER TABLE `formulario_materiales`
  ADD PRIMARY KEY (`idFormulario_Materiales`),
  ADD KEY `idMateriales` (`idMateriales`),
  ADD KEY `idFormulario` (`idFormulario`);

--
-- Indices de la tabla `usuario_empresa`
--
ALTER TABLE `usuario_empresa`
  ADD PRIMARY KEY (`idUsuario_Empresa`),
  ADD KEY `idUsuarios` (`idUsuarios`),
  ADD KEY `idEmpresa` (`idEmpresa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cl_empresa`
--
ALTER TABLE `cl_empresa`
  MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cl_estatus`
--
ALTER TABLE `cl_estatus`
  MODIFY `idEstatus` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cl_frenostipo`
--
ALTER TABLE `cl_frenostipo`
  MODIFY `idFrenosTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cl_materiales`
--
ALTER TABLE `cl_materiales`
  MODIFY `idMateriales` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cl_roles`
--
ALTER TABLE `cl_roles`
  MODIFY `idRoles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cl_servicios`
--
ALTER TABLE `cl_servicios`
  MODIFY `idServicios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cl_tiposervicio`
--
ALTER TABLE `cl_tiposervicio`
  MODIFY `idTipoServicios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cl_unidadtipo`
--
ALTER TABLE `cl_unidadtipo`
  MODIFY `idUnidadTipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cl_usuarios`
--
ALTER TABLE `cl_usuarios`
  MODIFY `idUsuarios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formulario`
--
ALTER TABLE `formulario`
  MODIFY `idFormulario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formulario_materiales`
--
ALTER TABLE `formulario_materiales`
  MODIFY `idFormulario_Materiales` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cl_materiales`
--
ALTER TABLE `cl_materiales`
  ADD CONSTRAINT `cl_materiales_ibfk_1` FOREIGN KEY (`idServicios`) REFERENCES `cl_servicios` (`idServicios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cl_usuarios`
--
ALTER TABLE `cl_usuarios`
  ADD CONSTRAINT `cl_usuarios_ibfk_1` FOREIGN KEY (`idRoles`) REFERENCES `cl_roles` (`idRoles`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `formulario`
--
ALTER TABLE `formulario`
  ADD CONSTRAINT `formulario_ibfk_1` FOREIGN KEY (`idUsuarios`) REFERENCES `cl_usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `formulario_ibfk_2` FOREIGN KEY (`idServicios`) REFERENCES `cl_servicios` (`idServicios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `formulario_ibfk_3` FOREIGN KEY (`idTipoServicios`) REFERENCES `cl_tiposervicio` (`idTipoServicios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `formulario_ibfk_4` FOREIGN KEY (`id_UnidadTipo`) REFERENCES `cl_unidadtipo` (`idUnidadTipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `formulario_ibfk_5` FOREIGN KEY (`id_FrenosTipo`) REFERENCES `cl_frenostipo` (`idFrenosTipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `formulario_ibfk_6` FOREIGN KEY (`idEstatus`) REFERENCES `cl_estatus` (`idEstatus`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `formulario_materiales`
--
ALTER TABLE `formulario_materiales`
  ADD CONSTRAINT `formulario_materiales_ibfk_1` FOREIGN KEY (`idMateriales`) REFERENCES `cl_materiales` (`idMateriales`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `formulario_materiales_ibfk_2` FOREIGN KEY (`idFormulario`) REFERENCES `formulario` (`idFormulario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_empresa`
--
ALTER TABLE `usuario_empresa`
  ADD CONSTRAINT `usuario_empresa_ibfk_1` FOREIGN KEY (`idUsuarios`) REFERENCES `cl_usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuario_empresa_ibfk_2` FOREIGN KEY (`idEmpresa`) REFERENCES `cl_empresa` (`idEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
