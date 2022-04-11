-- MariaDB dump 10.19  Distrib 10.7.3-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: hospital
-- ------------------------------------------------------
-- Server version	10.7.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `atencion`
--

DROP TABLE IF EXISTS `atencion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consultorio`
--

DROP TABLE IF EXISTS `consultorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultorio` (
  `idconsultorio` int(11) NOT NULL AUTO_INCREMENT,
  `consultorio` varchar(200) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idconsultorio`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultorio`
--

LOCK TABLES `consultorio` WRITE;
/*!40000 ALTER TABLE `consultorio` DISABLE KEYS */;
INSERT INTO `consultorio` VALUES
(1,'DENTAL','CONSULTORIO DENTAL',1),
(2,'MEDICINA GENERAL','MEDICINA GENERAL',1),
(7,'GINECOLOGIA','PARA MUJERES',1),
/*!40000 ALTER TABLE `consultorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `educacion`
--

DROP TABLE IF EXISTS `educacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educacion` (
  `ideducacion` int(11) NOT NULL AUTO_INCREMENT,
  `iddoc` int(11) NOT NULL,
  `trabajo` varchar(255) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `tiempo` varchar(45) NOT NULL,
  PRIMARY KEY (`ideducacion`),
  KEY `fk_educacion_doctor_idx` (`iddoc`),
  CONSTRAINT `fk_educacion_doctor` FOREIGN KEY (`iddoc`) REFERENCES `doctor` (`iddoc`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `experiencia`
--

DROP TABLE IF EXISTS `experiencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historiaclinica`
--

DROP TABLE IF EXISTS `historiaclinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES
(1,'admin','21232f297a57a5a743894a0e4a801fc3',0,1,1,1,1);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;