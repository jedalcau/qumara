/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MariaDB
 Source Server Version : 100513
 Source Host           : 127.0.0.1:3306
 Source Schema         : db_qumara

 Target Server Type    : MariaDB
 Target Server Version : 100513
 File Encoding         : 65001

 Date: 11/04/2022 20:44:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for atencion
-- ----------------------------
DROP TABLE IF EXISTS `atencion`;
CREATE TABLE `atencion` (
  `idatencion` int(11) NOT NULL AUTO_INCREMENT,
  `numhistoria` varchar(20) DEFAULT NULL,
  `codsis` varchar(45) DEFAULT NULL,
  `nombres` varchar(200) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `tipusuario` varchar(50) DEFAULT NULL,
  `tipatencion` varchar(45) DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `otros` varchar(100) DEFAULT NULL,
  `idhc` int(11) DEFAULT NULL,
  `fecCreate` datetime DEFAULT NULL,
  `iddoc` int(11) DEFAULT NULL,
  `idpaciente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idatencion`),
  KEY `fk_atencion_doctor_idx` (`iddoc`),
  KEY `fk_atencion_paciente_idx` (`idpaciente`),
  CONSTRAINT `fk_atencion_doctor` FOREIGN KEY (`iddoc`) REFERENCES `doctor` (`iddoc`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_atencion_paciente` FOREIGN KEY (`idpaciente`) REFERENCES `paciente` (`idpac`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of atencion
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for citas
-- ----------------------------
DROP TABLE IF EXISTS `citas`;
CREATE TABLE `citas` (
  `idcitas` int(11) NOT NULL AUTO_INCREMENT,
  `codcita` varchar(20) NOT NULL,
  `idpaciente` int(11) NOT NULL,
  `idconsultorio` int(11) NOT NULL,
  `iddoctor` int(11) NOT NULL,
  `fecha` varchar(12) NOT NULL,
  `hora` varchar(15) NOT NULL,
  `emailpac` varchar(150) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `mensaje` varchar(255) DEFAULT NULL,
  `feccreate` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `idreferencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcitas`),
  KEY `fk_citas_consultorio_idx` (`idconsultorio`),
  KEY `fk_citas_doctor_idx` (`iddoctor`),
  KEY `fk_citas_paciente_idx` (`idpaciente`),
  CONSTRAINT `fk_citas_consultorio` FOREIGN KEY (`idconsultorio`) REFERENCES `consultorio` (`idconsultorio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_citas_doctor` FOREIGN KEY (`iddoctor`) REFERENCES `doctor` (`iddoc`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_citas_paciente` FOREIGN KEY (`idpaciente`) REFERENCES `paciente` (`idpac`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of citas
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for consultorio
-- ----------------------------
DROP TABLE IF EXISTS `consultorio`;
CREATE TABLE `consultorio` (
  `idconsultorio` int(11) NOT NULL AUTO_INCREMENT,
  `consultorio` varchar(200) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idconsultorio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consultorio
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `iddoc` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `fecnac` varchar(20) NOT NULL,
  `sexo` varchar(12) NOT NULL,
  `numcolegiatura` varchar(20) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `departamento` varchar(20) DEFAULT NULL,
  `provincia` varchar(30) DEFAULT NULL,
  `distrito` varchar(30) DEFAULT NULL,
  `profesion` varchar(100) NOT NULL,
  `telefono` varchar(40) NOT NULL,
  `avatar` varchar(200) NOT NULL,
  `biografica` text NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `fecCreate` datetime DEFAULT NULL,
  `oculto` int(11) DEFAULT 0,
  `firma` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`iddoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doctor
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for educacion
-- ----------------------------
DROP TABLE IF EXISTS `educacion`;
CREATE TABLE `educacion` (
  `ideducacion` int(11) NOT NULL AUTO_INCREMENT,
  `iddoc` int(11) NOT NULL,
  `trabajo` varchar(255) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `tiempo` varchar(45) NOT NULL,
  PRIMARY KEY (`ideducacion`),
  KEY `fk_educacion_doctor_idx` (`iddoc`),
  CONSTRAINT `fk_educacion_doctor` FOREIGN KEY (`iddoc`) REFERENCES `doctor` (`iddoc`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of educacion
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for empleado
-- ----------------------------
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `idempleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `apellidos` varchar(120) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `fecIngreso` date DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `idpapel` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `feccreate` datetime DEFAULT NULL,
  PRIMARY KEY (`idempleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of empleado
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for experiencia
-- ----------------------------
DROP TABLE IF EXISTS `experiencia`;
CREATE TABLE `experiencia` (
  `idexperiencia` int(11) NOT NULL AUTO_INCREMENT,
  `iddoc` int(11) NOT NULL,
  `centrabajo` varchar(200) NOT NULL,
  `fechainicio` varchar(100) DEFAULT NULL,
  `fechafin` varchar(100) DEFAULT NULL,
  `totalanios` int(11) DEFAULT NULL,
  `totalmeses` int(11) DEFAULT NULL,
  PRIMARY KEY (`idexperiencia`),
  KEY `fk_experiencia_doctor_idx` (`iddoc`),
  CONSTRAINT `fk_experiencia_doctor` FOREIGN KEY (`iddoc`) REFERENCES `doctor` (`iddoc`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of experiencia
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for historiaclinica
-- ----------------------------
DROP TABLE IF EXISTS `historiaclinica`;
CREATE TABLE `historiaclinica` (
  `idhc` int(11) NOT NULL AUTO_INCREMENT,
  `numhistclinica` varchar(45) DEFAULT NULL,
  `idpaciente` int(11) DEFAULT NULL,
  `fecconsulta` varchar(30) DEFAULT NULL,
  `horaconsulta` varchar(30) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `signos` varchar(255) DEFAULT NULL,
  `relato` varchar(255) DEFAULT NULL,
  `vacunas` varchar(45) DEFAULT NULL,
  `apetito` varchar(45) DEFAULT NULL,
  `sed` varchar(45) DEFAULT NULL,
  `sueno` varchar(45) DEFAULT NULL,
  `orina` varchar(45) DEFAULT NULL,
  `deposicion` varchar(45) DEFAULT NULL,
  `fiebre15` char(2) DEFAULT NULL,
  `viaje` char(2) DEFAULT NULL,
  `lugar` varchar(150) DEFAULT NULL,
  `tos15` char(2) DEFAULT NULL,
  `secresion` char(2) DEFAULT NULL,
  `fur` varchar(45) DEFAULT NULL,
  `examenfisico` varchar(255) DEFAULT NULL,
  `temp` varchar(20) DEFAULT NULL,
  `pa` varchar(20) DEFAULT NULL,
  `fc` varchar(20) DEFAULT NULL,
  `fr` varchar(20) DEFAULT NULL,
  `peso` varchar(20) DEFAULT NULL,
  `talla` varchar(20) DEFAULT NULL,
  `pabd` varchar(20) DEFAULT NULL,
  `saturacion` varchar(30) DEFAULT NULL,
  `diagnostico` varchar(255) DEFAULT NULL,
  `tipoexamen` varchar(45) DEFAULT NULL,
  `ciex` varchar(50) DEFAULT NULL,
  `tratamiento` varchar(255) DEFAULT NULL,
  `via` varchar(50) DEFAULT NULL,
  `dosis` varchar(50) DEFAULT NULL,
  `frecuencia` varchar(50) DEFAULT NULL,
  `medidashigienicas` varchar(255) DEFAULT NULL,
  `examenesauxiliares` varchar(255) DEFAULT NULL,
  `medidaspreventivas` varchar(255) DEFAULT NULL,
  `proximaconsulta` varchar(30) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `fecCreate` datetime DEFAULT NULL,
  `idconsultorio` int(11) DEFAULT NULL,
  `fecChange` datetime DEFAULT NULL,
  `iddoctor` int(11) DEFAULT NULL,
  `idatencion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idhc`),
  KEY `fk_historiaclinica_paciente_idx` (`idpaciente`),
  KEY `fk_historiaclinica_consultorio_idx` (`idconsultorio`),
  KEY `fk_historiaclinica_doctor_idx` (`iddoctor`),
  KEY `fk_historiaclinica_atencion_idx` (`idatencion`),
  CONSTRAINT `fk_historiaclinica_atencion` FOREIGN KEY (`idatencion`) REFERENCES `atencion` (`idatencion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_historiaclinica_consultorio` FOREIGN KEY (`idconsultorio`) REFERENCES `consultorio` (`idconsultorio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_historiaclinica_doctor` FOREIGN KEY (`iddoctor`) REFERENCES `doctor` (`iddoc`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_historiaclinica_paciente` FOREIGN KEY (`idpaciente`) REFERENCES `paciente` (`idpac`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of historiaclinica
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `idlogin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `iddoctor` int(11) NOT NULL COMMENT 'tipo empleado: 1 Doctor, 2 empleado',
  `idpersonal` int(11) NOT NULL,
  `nivel` int(11) NOT NULL DEFAULT 2 COMMENT '1 administrador, 2 doctor, 3 empleado',
  `activo` tinyint(4) NOT NULL DEFAULT 1,
  `idadmin` int(11) DEFAULT 0,
  PRIMARY KEY (`idlogin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
BEGIN;
INSERT INTO `login` (`idlogin`, `username`, `passwd`, `iddoctor`, `idpersonal`, `nivel`, `activo`, `idadmin`) VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 0, 1, 1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for paciente
-- ----------------------------
DROP TABLE IF EXISTS `paciente`;
CREATE TABLE `paciente` (
  `idpac` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `fecnac` varchar(10) NOT NULL,
  `sexo` varchar(12) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `distrito` varchar(40) DEFAULT NULL,
  `provincia` varchar(30) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `codpostal` varchar(20) DEFAULT NULL,
  `telefono` varchar(40) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `fecCreate` datetime DEFAULT NULL,
  PRIMARY KEY (`idpac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paciente
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
