/*
 Navicat Premium Data Transfer

 Source Server         : modelConexionDB
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : db_qumara

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 29/03/2022 10:38:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cita
-- ----------------------------
DROP TABLE IF EXISTS `cita`;
CREATE TABLE `cita`  (
  `cita_id` int NOT NULL AUTO_INCREMENT,
  `cita_nroatencion` int NULL DEFAULT NULL,
  `cita_feregistro` date NULL DEFAULT NULL,
  `medico_id` int NULL DEFAULT NULL,
  `especialidad_id` int NOT NULL,
  `paciente_id` int NULL DEFAULT NULL,
  `cita_estatus` enum('ATENDIDO','PENDIENTE','CANCELADA') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cita_descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `usu_id` int NOT NULL,
  `cita_p` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cita_id`) USING BTREE,
  INDEX `paciente_id`(`paciente_id`) USING BTREE,
  INDEX `medico_id`(`medico_id`) USING BTREE,
  INDEX `especialidad_id`(`especialidad_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for consulta
-- ----------------------------
DROP TABLE IF EXISTS `consulta`;
CREATE TABLE `consulta`  (
  `consulta_id` int NOT NULL AUTO_INCREMENT,
  `consulta_descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `consulta_diagnostico` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `consulta_feregistro` date NULL DEFAULT NULL,
  `consulta_estatus` enum('ATENDIDA','PENDIENTE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cita_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`consulta_id`) USING BTREE,
  INDEX `cita_id`(`cita_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for detalle_insumo
-- ----------------------------
DROP TABLE IF EXISTS `detalle_insumo`;
CREATE TABLE `detalle_insumo`  (
  `detain_id` int NOT NULL AUTO_INCREMENT,
  `detain_cantidad` int NULL DEFAULT NULL,
  `insumo_id` int NULL DEFAULT NULL,
  `fua_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`detain_id`) USING BTREE,
  INDEX `fua_id`(`fua_id`) USING BTREE,
  INDEX `insumo_id`(`insumo_id`) USING BTREE,
  CONSTRAINT `detalle_insumo_ibfk_1` FOREIGN KEY (`fua_id`) REFERENCES `fua` (`fua_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detalle_insumo_ibfk_2` FOREIGN KEY (`insumo_id`) REFERENCES `insumo` (`insumo_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of detalle_insumo
-- ----------------------------
INSERT INTO `detalle_insumo` VALUES (1, 2, 1, 2);

-- ----------------------------
-- Table structure for detalle_medicamento
-- ----------------------------
DROP TABLE IF EXISTS `detalle_medicamento`;
CREATE TABLE `detalle_medicamento`  (
  `detame_id` int NOT NULL AUTO_INCREMENT,
  `datame_cantidad` int NULL DEFAULT NULL,
  `medicamento_id` int NULL DEFAULT NULL,
  `fua_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`detame_id`) USING BTREE,
  INDEX `medicamento_id`(`medicamento_id`) USING BTREE,
  INDEX `fua_id`(`fua_id`) USING BTREE,
  CONSTRAINT `detalle_medicamento_ibfk_1` FOREIGN KEY (`fua_id`) REFERENCES `fua` (`fua_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detalle_medicamento_ibfk_2` FOREIGN KEY (`medicamento_id`) REFERENCES `medicamento` (`medicamento_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of detalle_medicamento
-- ----------------------------
INSERT INTO `detalle_medicamento` VALUES (1, 3, 1, 2);

-- ----------------------------
-- Table structure for detalle_procedimiento
-- ----------------------------
DROP TABLE IF EXISTS `detalle_procedimiento`;
CREATE TABLE `detalle_procedimiento`  (
  `detaproce_id` int NOT NULL AUTO_INCREMENT,
  `procedimiento_id` int NULL DEFAULT NULL,
  `fua_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`detaproce_id`) USING BTREE,
  INDEX `fua_id`(`fua_id`) USING BTREE,
  INDEX `procedimiento_id`(`procedimiento_id`) USING BTREE,
  CONSTRAINT `detalle_procedimiento_ibfk_1` FOREIGN KEY (`fua_id`) REFERENCES `fua` (`fua_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detalle_procedimiento_ibfk_2` FOREIGN KEY (`procedimiento_id`) REFERENCES `procedimiento` (`procedimiento_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of detalle_procedimiento
-- ----------------------------
INSERT INTO `detalle_procedimiento` VALUES (1, 1, 2);

-- ----------------------------
-- Table structure for especialidad
-- ----------------------------
DROP TABLE IF EXISTS `especialidad`;
CREATE TABLE `especialidad`  (
  `especialidad_id` int NOT NULL AUTO_INCREMENT,
  `especialidad_nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `especialidad_fregistro` date NULL DEFAULT NULL,
  `especialidad_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`especialidad_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of especialidad
-- ----------------------------
INSERT INTO `especialidad` VALUES (1, 'OFTARMOLOGIA', '2020-07-04', 'ACTIVO');
INSERT INTO `especialidad` VALUES (2, 'PSICOLOGIA', '2020-07-04', 'ACTIVO');
INSERT INTO `especialidad` VALUES (3, 'PEDIATRIA', '2020-07-04', 'ACTIVO');
INSERT INTO `especialidad` VALUES (4, 'ODONTOLOGIA', '2020-07-04', 'ACTIVO');
INSERT INTO `especialidad` VALUES (5, 'MEDICINA GENERAL', '2020-07-04', 'ACTIVO');
INSERT INTO `especialidad` VALUES (6, 'ENFERMERIA', '2020-07-04', 'INACTIVO');
INSERT INTO `especialidad` VALUES (7, 'LABORATORIO CLINICO', '2020-07-04', 'ACTIVO');
INSERT INTO `especialidad` VALUES (8, 'GINECOLOGIA', '2020-07-04', 'ACTIVO');
INSERT INTO `especialidad` VALUES (9, 'TRAUMATOLOGIA', '2020-07-06', 'ACTIVO');
INSERT INTO `especialidad` VALUES (10, 'ODONTOPEDIATRIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (11, 'NEUROCIRIGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (12, 'ANGIOLOGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (13, 'CARDIOLOGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (14, 'CIRUGIA MAXILOFACIAL', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (15, 'CIRUGIA ONCOLOGICA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (16, 'CIRUGIA PEDIATRICA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (17, 'DIABETOLOGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (18, 'ENDOCRINOLOGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (19, 'FONOAUDIOLOGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (20, 'GASTROETEROLOGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (21, 'HEMATOLOGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (22, 'INFECTOLOGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (23, 'MEDICINA FISICA Y REHABILITACION', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (24, 'MEDICINA LABORAL', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (25, 'NEFROLOGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (26, 'NEUROLOGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (27, 'NEUROCIRUGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (28, 'ONCOLOGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (29, 'OTORRINOLARINGOLOGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (30, 'PROCTOLOGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (31, 'REUMATOLOGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (32, 'TERAPIA DEL DOLOR', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (33, 'UROLOGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (34, 'CIRUGIA GENERAL', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (35, 'CIRUGIA PLASTICA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (36, 'DERMATOLOGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (37, 'GERIATRIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (38, 'MEDICINA INTERNA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (39, 'NEUMOLOGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (40, 'NUTRICION', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (41, 'OFTALMOLOGIA', '2020-07-26', 'ACTIVO');
INSERT INTO `especialidad` VALUES (42, 'PSIQUIATRIA', '2020-07-26', 'ACTIVO');

-- ----------------------------
-- Table structure for fua
-- ----------------------------
DROP TABLE IF EXISTS `fua`;
CREATE TABLE `fua`  (
  `fua_id` int NOT NULL AUTO_INCREMENT,
  `fua_fegistro` date NULL DEFAULT NULL,
  `historia_id` int NULL DEFAULT NULL,
  `consulta_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`fua_id`) USING BTREE,
  INDEX `fua_id`(`fua_id`) USING BTREE,
  INDEX `historia_id`(`historia_id`) USING BTREE,
  INDEX `consulta_id`(`consulta_id`) USING BTREE,
  CONSTRAINT `fua_ibfk_1` FOREIGN KEY (`historia_id`) REFERENCES `historia` (`historia_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fua_ibfk_2` FOREIGN KEY (`consulta_id`) REFERENCES `consulta` (`consulta_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fua
-- ----------------------------
INSERT INTO `fua` VALUES (2, '2022-03-29', 3, 1);

-- ----------------------------
-- Table structure for historia
-- ----------------------------
DROP TABLE IF EXISTS `historia`;
CREATE TABLE `historia`  (
  `historia_id` int NOT NULL AUTO_INCREMENT,
  `paciente_id` int NULL DEFAULT NULL,
  `historia_feregistro` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`historia_id`) USING BTREE,
  INDEX `historia_ibfk_1`(`paciente_id`) USING BTREE,
  CONSTRAINT `historia_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`paciente_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of historia
-- ----------------------------
INSERT INTO `historia` VALUES (1, 3, '2021-02-23 00:00:00.000000');
INSERT INTO `historia` VALUES (2, 4, '2021-02-25 00:00:00.000000');
INSERT INTO `historia` VALUES (3, 5, '2021-03-06 00:00:00.000000');

-- ----------------------------
-- Table structure for insumo
-- ----------------------------
DROP TABLE IF EXISTS `insumo`;
CREATE TABLE `insumo`  (
  `insumo_id` int NOT NULL AUTO_INCREMENT,
  `insumo_nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insumo_stock` int NULL DEFAULT NULL,
  `insumo_fregistro` date NULL DEFAULT NULL,
  `insumo_estatus` enum('ACTIVO','INACTIVO','AGOTADO') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`insumo_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of insumo
-- ----------------------------
INSERT INTO `insumo` VALUES (1, 'GUANTES', 4, '2020-07-02', 'ACTIVO');
INSERT INTO `insumo` VALUES (2, 'JERINGAS', 10, '2020-07-02', 'ACTIVO');
INSERT INTO `insumo` VALUES (3, 'ALGODON', 1, '2020-07-03', 'ACTIVO');
INSERT INTO `insumo` VALUES (4, 'VENDAS', 1, '2020-07-03', 'ACTIVO');
INSERT INTO `insumo` VALUES (5, 'AGUA OXIGENADA', 1, '2020-07-03', 'ACTIVO');
INSERT INTO `insumo` VALUES (6, 'GASAS', 12, '2020-07-03', 'ACTIVO');
INSERT INTO `insumo` VALUES (7, 'TOALLAS', 30, '2020-07-03', 'ACTIVO');
INSERT INTO `insumo` VALUES (8, 'VARIOS', 10, '2020-07-03', 'ACTIVO');
INSERT INTO `insumo` VALUES (9, 'TUBOS', 20, '2020-07-03', 'ACTIVO');
INSERT INTO `insumo` VALUES (10, 'REACTIVOS PCR', 120, '2020-07-03', 'ACTIVO');
INSERT INTO `insumo` VALUES (11, 'ADA', 12, '2020-07-03', 'ACTIVO');
INSERT INTO `insumo` VALUES (12, 'SUTURAS DE ACERO', 10, '2020-07-03', 'ACTIVO');
INSERT INTO `insumo` VALUES (13, 'PIRONALFORTE ', 1, '2020-07-16', 'ACTIVO');
INSERT INTO `insumo` VALUES (14, 'ASITROMISINA', 12, '2020-07-16', 'ACTIVO');

-- ----------------------------
-- Table structure for medicamento
-- ----------------------------
DROP TABLE IF EXISTS `medicamento`;
CREATE TABLE `medicamento`  (
  `medicamento_id` int NOT NULL AUTO_INCREMENT,
  `medicamento_nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `medicamento_alias` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `medicamento_stock` int NULL DEFAULT NULL,
  `medicamento_fregistro` date NULL DEFAULT NULL,
  `medicamento_estatus` enum('ACTIVO','INACTIVO','AGOTADO') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`medicamento_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medicamento
-- ----------------------------
INSERT INTO `medicamento` VALUES (1, 'PARACETAMOL', 'PARACETA', 1, '2020-07-04', 'AGOTADO');
INSERT INTO `medicamento` VALUES (2, 'PROPOL', 'PROPO', 10, '2020-07-04', 'ACTIVO');
INSERT INTO `medicamento` VALUES (3, 'HIBUPROFENO', 'HIBUPROFENO', 20, '2020-07-16', 'ACTIVO');
INSERT INTO `medicamento` VALUES (4, 'PIRONALFORTE ', 'PIRONALFORTE ', 20, '2020-07-16', 'ACTIVO');
INSERT INTO `medicamento` VALUES (5, 'ASITROMISINA', 'ASITROMISINA', 10, '2020-07-16', 'ACTIVO');

-- ----------------------------
-- Table structure for medico
-- ----------------------------
DROP TABLE IF EXISTS `medico`;
CREATE TABLE `medico`  (
  `medico_id` int NOT NULL AUTO_INCREMENT,
  `medico_nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `medico_apepat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `medico_apemat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `medico_direccion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `medico_movil` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `medico_sexo` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `medico_fenac` date NULL DEFAULT NULL,
  `medico_nrodocumento` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `medico_colegiatura` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `especialidad_id` int NULL DEFAULT NULL,
  `usu_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`medico_id`) USING BTREE,
  INDEX `especialidad_id`(`especialidad_id`) USING BTREE,
  CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidad` (`especialidad_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medico
-- ----------------------------
INSERT INTO `medico` VALUES (1, 'CHRISTIAN', 'PEREZ', 'GARCIA', 'av. escuela militar s/n', '946546542', 'M', '1990-06-15', '42365236', '151651', 2, 2);
INSERT INTO `medico` VALUES (2, 'medico', 'gerrard ', 'benitez', 'asdsadas', '32324324', 'M', '1980-03-17', '333232', '3232322', 1, 4);
INSERT INTO `medico` VALUES (3, 'CRISTHIAN JOSE', 'LOAYZA', 'LUPACA', 'AV. SIEMPRE VIVA 564', '930275707', 'M', '1985-09-25', '43176198', '150545', 3, 5);

-- ----------------------------
-- Table structure for paciente
-- ----------------------------
DROP TABLE IF EXISTS `paciente`;
CREATE TABLE `paciente`  (
  `paciente_id` int NOT NULL AUTO_INCREMENT,
  `paciente_nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `paciente_apepat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `paciente_apemat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `paciente_direccion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `paciente_movil` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `paciente_sexo` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `paciente_nrodocumento` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `paciente_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`paciente_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of paciente
-- ----------------------------
INSERT INTO `paciente` VALUES (1, 'softnet', 'solutions', 'pe', 'mi casa', '8888', 'M', '9999999', 'ACTIVO');
INSERT INTO `paciente` VALUES (2, 'code', 'pe', 'pe', 'su casA', '888888888', 'M', '8888', 'ACTIVO');
INSERT INTO `paciente` VALUES (3, 'Jose', 'Perez', 'Huaman', 'av. Siempre viva 345', '952945111', 'M', '10101010', 'ACTIVO');
INSERT INTO `paciente` VALUES (4, 'juan', 'perez', 'martinez', 'calle siempre viva 123', '124', 'M', '12345', 'ACTIVO');
INSERT INTO `paciente` VALUES (5, 'YUREMA GRECIA', 'GUTIERREZ', 'ALVARADO', 'AV. PERU 3938', '98354548', 'F', '06087678', 'ACTIVO');

-- ----------------------------
-- Table structure for procedimiento
-- ----------------------------
DROP TABLE IF EXISTS `procedimiento`;
CREATE TABLE `procedimiento`  (
  `procedimiento_id` int NOT NULL AUTO_INCREMENT,
  `procedimiento_nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `procedimiento_fecregistro` date NULL DEFAULT NULL,
  `procedimiento_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`procedimiento_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of procedimiento
-- ----------------------------
INSERT INTO `procedimiento` VALUES (1, 'Auscultación', '2020-05-06', 'ACTIVO');
INSERT INTO `procedimiento` VALUES (2, 'Inspección médica ', '2020-05-06', 'ACTIVO');
INSERT INTO `procedimiento` VALUES (3, 'Palpación', '2020-05-06', 'ACTIVO');
INSERT INTO `procedimiento` VALUES (4, 'Percusión (medicina)', '2020-05-06', 'ACTIVO');
INSERT INTO `procedimiento` VALUES (5, 'Medición de signos vitales', '2020-05-06', 'ACTIVO');
INSERT INTO `procedimiento` VALUES (6, 'Electromiografía', '2020-05-07', 'ACTIVO');
INSERT INTO `procedimiento` VALUES (7, 'Electrocardiografia', '2020-05-07', 'ACTIVO');
INSERT INTO `procedimiento` VALUES (8, 'Inspeccion Oral', '2020-07-01', 'ACTIVO');
INSERT INTO `procedimiento` VALUES (9, 'Reanimacion cardiaca', '2020-07-01', 'ACTIVO');
INSERT INTO `procedimiento` VALUES (10, 'Renal', '2020-07-02', 'ACTIVO');
INSERT INTO `procedimiento` VALUES (18, 'Renal Vacio', '2020-07-02', 'ACTIVO');
INSERT INTO `procedimiento` VALUES (19, 'prueba de ', '2020-07-02', 'ACTIVO');
INSERT INTO `procedimiento` VALUES (20, 'INTERNACION', '2020-07-02', 'ACTIVO');
INSERT INTO `procedimiento` VALUES (21, 'CHRISTIAN', '2021-02-08', 'ACTIVO');
INSERT INTO `procedimiento` VALUES (22, 'CONSULTA MEDICA', '2021-03-06', 'ACTIVO');

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol`  (
  `rol_id` int NOT NULL AUTO_INCREMENT,
  `rol_nombre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rol_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES (1, 'ADMINISTRADOR');
INSERT INTO `rol` VALUES (2, 'RECEPCIONISTA');
INSERT INTO `rol` VALUES (3, 'MEDICO');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario`  (
  `usu_id` int NOT NULL AUTO_INCREMENT,
  `usu_nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `usu_contrasena` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `usu_sexo` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rol_id` int NULL DEFAULT NULL,
  `usu_status` enum('ACTIVO','INACTIVO') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `usu_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `usu_intento` int NULL DEFAULT NULL,
  PRIMARY KEY (`usu_id`) USING BTREE,
  INDEX `rol_id`(`rol_id`) USING BTREE,
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`rol_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES (1, 'admin', '$2y$10$RWNK5OBmX1iXpCpvYODHVeaAQHU/KHkL4TCl5n9s9mkNmEr2SlHWK', 'M', 1, 'ACTIVO', 'ruyer56@gmail.com', 0);
INSERT INTO `usuario` VALUES (2, 'TINO', '$2y$10$dPbbQ4NRjDhjHT3pUiEOF.ibBIVp9j2XPs.CB.yPJwlacqeHhdRnK', 'M', 3, 'ACTIVO', 'tino@gmail.com', 2);
INSERT INTO `usuario` VALUES (3, 'Usu', '$2y$10$AkNnaGhAElFCI6Y.ZNRt4.dAQBfMa7QDggWwuT1ymshd3.OX7Yt0.', 'M', 3, 'ACTIVO', 'Usu@mail.com', 2);
INSERT INTO `usuario` VALUES (4, 'me', '$2y$10$aP/RtrQKrCbpMgJ6CvdzlOmnjZewvce0769eftwGWN2G6hzwuORX6', 'M', 3, 'INACTIVO', 'me@gmail.com', 1);
INSERT INTO `usuario` VALUES (5, 'cloayza', '$2y$10$NX8WdtrG6VN193JQnH55qu/8Y1LGbKYudrmqd1extmiD/mjYjK9Xi', 'M', 3, 'ACTIVO', 'cloayza@gmail.com', 1);
INSERT INTO `usuario` VALUES (6, 'ygutierrez', '$2y$10$BJ9OVuxC0jyoQAxfJAdF2OWGxL1n21NO8nIcUMIS6hrFgpmwOL.Ri', 'F', 2, 'ACTIVO', 'ygutierrez@gmail.com', 0);
INSERT INTO `usuario` VALUES (7, 'otto', '$2y$10$rYzG/0Mz3GZlt2rtc5ppOur2rbrYj7WA7NlXi2u6RFNihKI2O0eR6', 'M', 1, 'ACTIVO', 'otto@gmail.com', 0);
INSERT INTO `usuario` VALUES (8, 'Medico', '$2y$10$pOUeqNorekALuj0wibycbOn7HeVy9uFgywUbDDAT1/JCTOpgsLxLG', 'M', 3, 'ACTIVO', 'Medico@gmail.com', 2);
INSERT INTO `usuario` VALUES (9, 'medi', '$2y$10$luTTGCscPv.gFqVUieStnOA473LY2zwGuQHyLWzYGCFVBE8y1nCJi', 'M', 3, 'ACTIVO', 'medi@gmail.com', 1);
INSERT INTO `usuario` VALUES (10, 'jefeprueba', '$2y$10$axRGYVIa01QJHvTSLiYXOe.5wHJpVQyYYloRNc0nfemi7uHkPKlWq', 'M', 3, 'ACTIVO', 'asdas@gmail.com', 0);

-- ----------------------------
-- Procedure structure for SP_INTENTO_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INTENTO_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_INTENTO_USUARIO`(IN `USUARIO` VARCHAR(50))
BEGIN
DECLARE INTENTO INT;
SET @INTENTO:=(select usu_intento from usuario where usu_nombre=USUARIO);
IF @INTENTO = 2 THEN
	SELECT @INTENTO;
ELSE
	UPDATE usuario set
	usu_intento=@INTENTO+1
	where usu_nombre=USUARIO;
		SELECT @INTENTO;
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_CITA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_CITA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_CITA`()
SELECT c.cita_id, c.cita_nroatencion, c.cita_feregistro, c.cita_estatus,p.paciente_id, concat_ws(' ',p.paciente_nombre, p.paciente_apepat, p.paciente_apemat) as paciente, c.medico_id
, concat_ws(' ', m.medico_nombre, m.medico_apepat, m.medico_apemat) as medico,
e.especialidad_id, e.especialidad_nombre,c.cita_descripcion
 FROM cita  as c 
INNER JOIN paciente as p ON c.paciente_id=p.paciente_id
INNER JOIN medico as m on c.medico_id=m.medico_id
INNER JOIN especialidad as e on e.especialidad_id=m.especialidad_id
ORDER BY cita_id DESC;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_CITA_PAGO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_CITA_PAGO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_CITA_PAGO`()
SELECT
	cita.cita_id, 
	CONCAT_WS(' ' ,paciente.paciente_apepat,paciente.paciente_apemat,paciente.paciente_nombre) as paciente, 
	paciente.paciente_nrodocumento,
	cita_feregistro
FROM
	cita
	INNER JOIN
	paciente
	ON 
		cita.paciente_id = paciente.paciente_id
		where cita.cita_p is null
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_ESPECIALIDAD
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_ESPECIALIDAD`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_ESPECIALIDAD`()
SELECT * FROM especialidad where especialidad_estatus='ACTIVO';
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_INSUMO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_INSUMO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_INSUMO`()
SELECT
	insumo.insumo_id, 
	insumo.insumo_nombre
FROM
	insumo;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_MEDICAMENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_MEDICAMENTO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_MEDICAMENTO`()
SELECT
	medicamento.medicamento_id, 
	medicamento.medicamento_nombre
FROM
	medicamento;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_PROCEDIMIENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_PROCEDIMIENTO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_PROCEDIMIENTO`()
SELECT
	procedimiento.procedimiento_id, 
	procedimiento.procedimiento_nombre
FROM
	procedimiento;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_ROL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_ROL`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_ROL`()
SELECT
rol.rol_id,
rol.rol_nombre
FROM
rol;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_CONSULTA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_CONSULTA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_CONSULTA`(IN `FECHAINICIO` DATE, IN `FECHAFIN` DATE)
SELECT
	consulta.consulta_id, 
	consulta.consulta_descripcion, 
	consulta.consulta_diagnostico, 
	consulta.consulta_feregistro, 
	consulta.consulta_estatus, 
	cita.cita_nroatencion, 
	cita.cita_feregistro, 
	cita.medico_id, 
	cita.especialidad_id, 
	cita.paciente_id, 
	cita.cita_estatus, 
	cita.cita_descripcion, 
	cita.usu_id, 
	CONCAT_WS(' ',paciente.paciente_nombre,paciente.paciente_apepat,paciente.paciente_apemat) as paciente, 
	paciente.paciente_nrodocumento, 
	CONCAT_WS(' ',medico.medico_nombre,medico.medico_apepat, medico.medico_apemat) as medico,
		especialidad.especialidad_nombre
FROM
	consulta
	LEFT JOIN
	cita
	ON 
		consulta.cita_id = cita.cita_id
	LEFT JOIN
	paciente
	ON 
		cita.paciente_id = paciente.paciente_id
	LEFT JOIN
	medico
	ON 
		cita.medico_id = medico.medico_id
	LEFT JOIN
	especialidad
	ON 
		cita.especialidad_id = especialidad.especialidad_id 
		WHERE (consulta.consulta_feregistro BETWEEN FECHAINICIO AND FECHAFIN)
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_CONSULTA_HISTORIAL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_CONSULTA_HISTORIAL`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_CONSULTA_HISTORIAL`()
SELECT
	consulta.consulta_id, 
	consulta.consulta_descripcion, 
	consulta.consulta_diagnostico, 
	paciente.paciente_nrodocumento,
	CONCAT_WS(' ',paciente.paciente_nombre,paciente.paciente_apepat,paciente.paciente_apemat) as paciente, 
	historia.historia_id, 
	consulta.consulta_feregistro
FROM
	consulta
INNER JOIN cita ON consulta.cita_id = cita.cita_id
INNER JOIN paciente ON cita.paciente_id = paciente.paciente_id
INNER JOIN historia ON paciente.paciente_id = historia.paciente_id
INNER JOIN medico ON cita.medico_id = medico.medico_id
	WHERE 	
consulta.consulta_feregistro=CURDATE() 
AND consulta.consulta_id not in(SELECT fua.consulta_id FROM fua)
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_DOCTOR_COMBO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_DOCTOR_COMBO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_DOCTOR_COMBO`(IN `ID` INT)
SELECT medico_id, concat_ws(' ',medico_nombre,medico_apepat, medico_apemat) FROM medico  WHERE especialidad_id=ID;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_ESPECIALIDAD
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_ESPECIALIDAD`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_ESPECIALIDAD`()
SELECT * FROM especialidad ORDER BY especialidad_id DESC;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_ESPECIALIDAD_COMBO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_ESPECIALIDAD_COMBO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_ESPECIALIDAD_COMBO`()
SELECT especialidad_id, especialidad_nombre FROM especialidad WHERE especialidad_estatus='ACTIVO';
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_HISTORIAL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_HISTORIAL`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_HISTORIAL`(IN `FECHAINICIO` DATE, IN `FECHAFIN` DATE)
SELECT
	fua.fua_id, 
	fua.fua_fegistro, 
	fua.historia_id, 
	fua.consulta_id, 
	consulta.consulta_diagnostico, 
	CONCAT_WS(' ',paciente.paciente_nombre,paciente.paciente_apepat,paciente.paciente_apemat) AS paciente, 
	paciente.paciente_nrodocumento, 
	CONCAT_WS(' ',medico.medico_nombre,medico.medico_apepat,medico.medico_apemat) as medico
FROM
	fua
	INNER JOIN
	consulta
	ON 
		fua.consulta_id = consulta.consulta_id
	INNER JOIN
	cita
	ON 
		consulta.cita_id = cita.cita_id
	INNER JOIN
	paciente
	ON 
		cita.paciente_id = paciente.paciente_id
	INNER JOIN
	medico
	ON 
		cita.medico_id = medico.medico_id
	where fua.fua_fegistro BETWEEN FECHAINICIO AND FECHAFIN
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_INSUMO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_INSUMO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_INSUMO`()
SELECT * FROM insumo;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_INSUMO_DETALLE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_INSUMO_DETALLE`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_INSUMO_DETALLE`(IN `IDFUA` INT)
SELECT
	insumo.insumo_nombre, 
	detalle_insumo.detain_cantidad
FROM
	detalle_insumo
	INNER JOIN
	insumo
	ON 
		detalle_insumo.insumo_id = insumo.insumo_id
	WHERE detalle_insumo.fua_id=IDFUA;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_MEDICAMENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_MEDICAMENTO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_MEDICAMENTO`()
SELECT * FROM medicamento ORDER BY medicamento_id DESC;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_MEDICAMENTO_DETALLE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_MEDICAMENTO_DETALLE`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_MEDICAMENTO_DETALLE`(IN `IDFUA` INT)
SELECT
	detalle_medicamento.datame_cantidad, 
	medicamento.medicamento_nombre
FROM
	detalle_medicamento
	INNER JOIN
	medicamento
	ON 
		detalle_medicamento.medicamento_id = medicamento.medicamento_id
	WHERE detalle_medicamento.fua_id=IDFUA;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_MEDICO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_MEDICO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_MEDICO`()
SELECT
medico.medico_id,
medico.medico_nombre,
medico.medico_apepat,
medico.medico_apemat,
CONCAT_WS(' ',medico_nombre,medico_apepat,medico_apemat) AS medico,
medico.medico_direccion,
medico.medico_movil,
medico.medico_sexo,
medico.medico_fenac,
medico.medico_nrodocumento,
medico.medico_colegiatura,
medico.especialidad_id,
medico.usu_id,
especialidad.especialidad_nombre,
usuario.usu_nombre,
usuario.rol_id,
usuario.usu_email
FROM
medico
INNER JOIN especialidad ON medico.especialidad_id = especialidad.especialidad_id
INNER JOIN usuario ON medico.usu_id = usuario.usu_id
ORDER BY medico_id DESC;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_PACIENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_PACIENTE`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_PACIENTE`()
SELECT
paciente.paciente_id,
paciente.paciente_nombre,
paciente.paciente_apepat,
paciente.paciente_apemat,
CONCAT_WS(' ',paciente_nombre,paciente_apepat,paciente_apemat) AS paciente,
paciente.paciente_direccion,
paciente.paciente_movil,
paciente.paciente_sexo,
paciente.paciente_nrodocumento,
paciente.paciente_estatus
FROM
paciente
ORDER BY paciente_id DESC;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_PACIENTE_CITA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_PACIENTE_CITA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_PACIENTE_CITA`()
SELECT
	cita.cita_id, 
	cita.cita_nroatencion, 
	CONCAT_WS(' ',paciente.paciente_nombre, paciente.paciente_apepat,paciente.paciente_apemat)
FROM
	cita
	INNER JOIN paciente ON cita.paciente_id = paciente.paciente_id
INNER JOIN medico ON cita.medico_id = medico.medico_id
	where cita_feregistro=CURDATE() and cita_estatus='PENDIENTE'
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_PACIENTE_COMBO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_PACIENTE_COMBO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_PACIENTE_COMBO`()
SELECT paciente_id, concat_ws(' ',paciente_apepat, paciente_apemat, paciente_nombre)
FROM
paciente
WHERE  paciente.paciente_id not in (SELECT cita.paciente_id FROM cita WHERE cita.cita_estatus = 'PENDIENTE');
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_PAGO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_PAGO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_PAGO`(IN `FECHAINICIO` DATE, IN `FECHAFIN` DATE)
SELECT
	pago.pago_id, 
	usuario.usu_nombre, 
	pago.pago_fregistro, 
	CONCAT_WS(' ',paciente.paciente_apepat,paciente.paciente_apemat,paciente.paciente_nombre) as paciente, 
	paciente.paciente_nrodocumento, 
	pago.pago_monto, 
	pago.pago_estatus
FROM
	pago
	INNER JOIN
	usuario
	ON 
		pago.usuario_id = usuario.usu_id
	INNER JOIN
	cita
	ON 
		pago.cita_id = cita.cita_id
	INNER JOIN
	paciente
	ON 
		cita.paciente_id = paciente.paciente_id
		where (pago.pago_fregistro BETWEEN FECHAINICIO AND FECHAFIN)
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_PROCEDIMIENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_PROCEDIMIENTO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_PROCEDIMIENTO`()
SELECT * FROM procedimiento;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_PROCEDIMIENTO_DETALLE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_PROCEDIMIENTO_DETALLE`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_PROCEDIMIENTO_DETALLE`(IN `IDFUA` INT)
SELECT
	procedimiento.procedimiento_nombre
FROM
	detalle_procedimiento
	INNER JOIN
	procedimiento
	ON 
		detalle_procedimiento.procedimiento_id = procedimiento.procedimiento_id
	WHERE detalle_procedimiento.fua_id=IDFUA;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_USUARIO`()
BEGIN
DECLARE CANTIDAD int;
SET @CANTIDAD:=0;
SELECT
@CANTIDAD:=@CANTIDAD+1 AS posicion,
usuario.usu_id,
usuario.usu_nombre,
usuario.usu_sexo,
usuario.rol_id,
usuario.usu_status,
rol.rol_nombre,
usuario.usu_email
FROM
usuario
INNER JOIN rol ON usuario.rol_id = rol.rol_id
ORDER BY usuario.usu_id DESC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_CITA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_CITA`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_CITA`(IN `IDCITA` INT, IN `IDPACIENTE` INT, IN `IDDOCTOR` INT, IN `IDESPECIALIDAD` INT, IN `DESCRIPCION` TEXT, IN `ESTATUS` VARCHAR(10))
UPDATE cita set
paciente_id=IDPACIENTE,
medico_id=IDDOCTOR,
especialidad_id=IDESPECIALIDAD,
cita_descripcion=DESCRIPCION,
cita_estatus=ESTATUS
where cita_id=IDCITA;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_CONSULTA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_CONSULTA`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_CONSULTA`(IN `IDCONSULTA` INT, IN `DESCRIPCION` VARCHAR(255), IN `DIAGNOSTICO` VARCHAR(255))
UPDATE consulta set
consulta_descripcion=DESCRIPCION,
consulta_diagnostico=DIAGNOSTICO
where consulta_id=IDCONSULTA;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_CONTRA_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_CONTRA_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_CONTRA_USUARIO`(IN `IDUSUARIO` INT, IN `CONTRA` VARCHAR(250))
UPDATE usuario SET
usu_contrasena=CONTRA
where usu_id=IDUSUARIO;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_DATOS_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_DATOS_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_DATOS_USUARIO`(IN `IDUSUARIO` INT, IN `SEXO` CHAR(1), IN `IDROL` INT, IN `EMAIL` VARCHAR(250))
UPDATE usuario SET
usu_sexo=SEXO,
rol_id=IDROL,
usu_email=EMAIL
WHERE usu_id=IDUSUARIO;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_ESPECIALIDAD
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_ESPECIALIDAD`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_ESPECIALIDAD`(IN `ID` INT, IN `ESPECIALIDADACTUAL` VARCHAR(50), IN `ESPECIALIDADNUEVA` VARCHAR(50), IN `ESTATUS` VARCHAR(10))
BEGIN
DECLARE CANTIDAD INT;
IF ESPECIALIDADACTUAL=ESPECIALIDADNUEVA THEN
	UPDATE especialidad set
	especialidad_estatus=ESTATUS
	where especialidad_id=ID;
	SELECT 1;
ELSE
 SET @CANTIDAD:=(SELECT COUNT(*) FROM especialidad where especialidad_nombre=ESPECIALIDADNUEVA);
 IF @CANTIDAD=0 THEN
 	UPDATE especialidad set
	especialidad_nombre=ESPECIALIDADNUEVA,
	especialidad_estatus=ESTATUS
	where especialidad_id=ID;
	SELECT 1;
 ELSE
  SELECT 2;
 END IF;
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_ESTATUS_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_ESTATUS_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_ESTATUS_USUARIO`(IN `IDUSUARIO` INT, IN `ESTATUS` VARCHAR(20))
UPDATE usuario SET
usu_status=ESTATUS
where usu_id=IDUSUARIO;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_INSUMO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_INSUMO`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_INSUMO`(IN `ID` INT, IN `INSUMOACTUAL` VARCHAR(50), IN `INSUMONUEVO` VARCHAR(50), IN `STOCK` INT, IN `ESTATUS` VARCHAR(10))
BEGIN
DECLARE CANTIDAD INT;

IF INSUMOACTUAL = INSUMONUEVO THEN 
	update insumo set
	insumo_stock=STOCK,
	insumo_estatus=ESTATUS
	where insumo_id=ID;
	SELECT 1;
ELSE
SET @CANTIDAD:=(SELECT COUNT(*) FROM insumo where insumo_nombre=INSUMONUEVO);
IF @CANTIDAD = 0 THEN
	update insumo set
	insumo_nombre=INSUMONUEVO,
	insumo_stock=STOCK,
	insumo_estatus=ESTATUS
	where insumo_id=ID;
	SELECT 1;
ELSE
  SELECT 2;
END IF;

END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_MEDICAMENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_MEDICAMENTO`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_MEDICAMENTO`(IN `ID` INT, IN `MEDICAMENTOACTUAL` VARCHAR(50), IN `MEDICAMENTONUEVO` VARCHAR(50), IN `ALIAS` VARCHAR(50), IN `STOCK` INT, IN `ESTATUS` VARCHAR(10))
BEGIN
DECLARE CANTIDAD INT;
IF  MEDICAMENTOACTUAL = MEDICAMENTONUEVO THEN
	UPDATE medicamento set
	medicamento_alias=ALIAS,
	medicamento_stock=STOCK,
	medicamento_estatus=ESTATUS
	where medicamento_id=ID;
	SELECT 1;
ELSE
SET @CANTIDAD:=(SELECT COUNT(*) FROM medicamento where medicamento_nombre=MEDICAMENTONUEVO);

	IF @CANTIDAD= 0 THEN
		UPDATE medicamento set
		medicamento_nombre=MEDICAMENTONUEVO,
		medicamento_alias=ALIAS,
		medicamento_stock=STOCK,
		medicamento_estatus=ESTATUS
		where medicamento_id=ID;
		SELECT 1;
	ELSE
		SELECT 2;
	END IF;

END IF;



END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_MEDICO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_MEDICO`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_MEDICO`(IN `IDMEDICO` INT, IN `NOMBRES` VARCHAR(50), IN `APEPAT` VARCHAR(50), IN `APEMAT` VARCHAR(50), IN `DIRECCION` VARCHAR(200), IN `MOVIL` CHAR(12), IN `SEXO` CHAR(2), IN `FECHANACIMIENTO` DATE, IN `NRODOCUMENTOACTUAL` CHAR(12), IN `NRODOCUMENTONUEVO` CHAR(12), IN `COLEGIATURAACTUAL` CHAR(12), IN `COLEGIATURANUEVO` CHAR(12), IN `ESPECIALIDAD` INT, IN `IDUSUARIO` INT, IN `EMAIL` VARCHAR(255))
BEGIN
DECLARE CANTIDAD INT;
IF NRODOCUMENTOACTUAL= NRODOCUMENTONUEVO AND COLEGIATURAACTUAL= COLEGIATURANUEVO THEN
	UPDATE usuario SET
	usu_email=EMAIL,
	usu_sexo=SEXO
	where usu_id=IDUSUARIO;
	update medico set
	medico_nombre=NOMBRES,
	medico_apepat=APEPAT,
	medico_apemat=APEMAT,
	medico_direccion=DIRECCION,
	medico_movil=MOVIL,
	medico_sexo=medico_sexo,
	medico_fenac=FECHANACIMIENTO,
	medico_nrodocumento=NRODOCUMENTONUEVO,
	medico_colegiatura=COLEGIATURANUEVO,
	especialidad_id=ESPECIALIDAD
	where medico_id=IDMEDICO;
	SELECT 1;
ELSE
	SET @CANTIDAD:=(SELECT COUNT(*) FROM medico where medico_nrodocumento=NRODOCUMENTONUEVO OR medico_colegiatura=COLEGIATURANUEVO);
	IF @CANTIDAD=0 THEN
		UPDATE usuario SET
		usu_email=EMAIL,
		usu_sexo=SEXO
		where usu_id=IDUSUARIO;
		update medico set
		medico_nombre=NOMBRES,
		medico_apepat=APEPAT,
		medico_apemat=APEMAT,
		medico_direccion=DIRECCION,
		medico_movil=MOVIL,
		medico_sexo=medico_sexo,
		medico_fenac=FECHANACIMIENTO,
		medico_nrodocumento=NRODOCUMENTONUEVO,
		medico_colegiatura=COLEGIATURANUEVO,
		especialidad_id=ESPECIALIDAD
		where medico_id=IDMEDICO;
		SELECT 1;
	ELSE
		SELECT 2;
	END IF;

END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_PACIENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_PACIENTE`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_PACIENTE`(IN `ID` INT, IN `NOMBRES` VARCHAR(50), IN `APEPAT` VARCHAR(50), IN `APEMAT` VARCHAR(50), IN `DIRECCION` VARCHAR(200), IN `MOVIL` CHAR(12), IN `SEXO` CHAR(2), IN `NRODOCUMENTOACTUAL` CHAR(12), IN `NRODOCUMENTONUEVO` CHAR(12), IN `ESTATUS` VARCHAR(10))
BEGIN
DECLARE CANTIDAD INT;
IF NRODOCUMENTOACTUAL=NRODOCUMENTONUEVO THEN
	UPDATE paciente SET
	paciente_nombre=NOMBRES,
        paciente_apepat=APEPAT,
	paciente_apemat=APEMAT,
	paciente_direccion=DIRECCION,
	paciente_movil=MOVIL,
	paciente_sexo=SEXO,
	paciente_estatus=ESTATUS
	WHERE paciente_id=ID;
    SELECT 1;
ELSE     
	
SET @CANTIDAD:=(SELECT COUNT(*) FROM paciente where paciente_nrodocumento=NRODOCUMENTONUEVO );
    IF @CANTIDAD = 0 THEN
    UPDATE paciente SET
        paciente_nombre=NOMBRES,
        paciente_apepat=APEPAT,
        paciente_apemat=APEMAT,
        paciente_direccion=DIRECCION,
        paciente_movil=MOVIL,
        paciente_sexo=SEXO,
        paciente_nrodocumento=NRODOCUMENTONUEVO,
        paciente_estatus=ESTATUS
        WHERE paciente_id=ID;
        SELECT 1;
    ELSE
	    SELECT 2;
    END IF;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_PROCEDIMIENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_PROCEDIMIENTO`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_PROCEDIMIENTO`(IN `ID` INT, IN `PROCEDEMIENTOACTUAL` VARCHAR(50), IN `PROCEDIMIENTONUEVO` VARCHAR(50), IN `ESTATUS` VARCHAR(10))
BEGIN
DECLARE CANTIDAD INT;
IF PROCEDEMIENTOACTUAL= PROCEDIMIENTONUEVO THEN
	 UPDATE procedimiento SET
	 procedimiento_estatus=ESTATUS
	 where procedimiento_id=ID;
	 SELECT 1;
ELSE
	SET @CANTIDAD:=(select COUNT(*) from procedimiento where procedimiento_nombre=PROCEDIMIENTONUEVO);
	IF @CANTIDAD = 0 THEN
	 UPDATE procedimiento SET
	 procedimiento_estatus=ESTATUS,
	 procedimiento_nombre=PROCEDIMIENTONUEVO
	 where procedimiento_id=ID;
	 SELECT 1;
	ELSE
	 SELECT 2;
	END IF;
END IF;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_CITA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_CITA`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_CITA`(IN `IDPACIENTE` INT, IN `IDESPECIALIDAD` INT, IN `IDDOCTOR` INT, IN `DESCRIPCION` TEXT, IN `IDUSUARIO` INT)
BEGIN 
DECLARE NUMCITA INT;
SET @NUMCITA:=(SELECT COUNT(*) +1 FROM cita WHERE cita_feregistro=CURDATE() AND especialidad_id=IDESPECIALIDAD);
INSERT INTO cita(cita_nroatencion, cita_feregistro,medico_id,especialidad_id,paciente_id,cita_estatus,cita_descripcion,usu_id) 
VALUES (@NUMCITA,CURDATE(),IDDOCTOR,IDESPECIALIDAD,IDPACIENTE,'PENDIENTE',DESCRIPCION,IDUSUARIO);
SELECT LAST_INSERT_ID();

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_CONSULTA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_CONSULTA`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_CONSULTA`(IN `ID` INT, IN `DESCRIPCION` VARCHAR(255), IN `DIAGNOSTICO` VARCHAR(255))
BEGIN
INSERT INTO consulta(consulta_descripcion,consulta_diagnostico,consulta_feregistro,consulta_estatus,cita_id) VALUES(DESCRIPCION,DIAGNOSTICO,CURDATE(),'ATENDIDA',ID);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_DETALLE_INSUMO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_DETALLE_INSUMO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_DETALLE_INSUMO`(IN `IDFUA` INT, IN `IDINSUMO` INT, IN `CANTIDAD` INT)
insert into detalle_insumo(fua_id,insumo_id,detain_cantidad)values(IDFUA,IDINSUMO,CANTIDAD);
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_DETALLE_MEDICAMENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_DETALLE_MEDICAMENTO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_DETALLE_MEDICAMENTO`(IN `IDFUA` INT, IN `IDMEDICAMENTO` INT, IN `CANTIDAD` INT)
insert into detalle_medicamento(fua_id,medicamento_id,datame_cantidad)values(IDFUA,IDMEDICAMENTO,CANTIDAD);
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_DETALLE_PROCEDIMIENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_DETALLE_PROCEDIMIENTO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_DETALLE_PROCEDIMIENTO`(IN `ID` INT, IN `IDPROCEDIMIENTO` INT)
insert into detalle_procedimiento(fua_id,procedimiento_id)values(ID,IDPROCEDIMIENTO);
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_ESPECIALIDAD
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_ESPECIALIDAD`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_ESPECIALIDAD`(IN `ESPECIALIDAD` VARCHAR(50), IN `ESTATUS` VARCHAR(10))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(select count(*) from especialidad where especialidad_nombre=ESPECIALIDAD);
IF @CANTIDAD= 0 THEN
	INSERT INTO especialidad(especialidad_nombre,especialidad_fregistro,especialidad_estatus) VALUES
	(ESPECIALIDAD,CURDATE(),ESTATUS);
	SELECT 1;

ELSE
  SELECT 2;
END IF;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_FUA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_FUA`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_FUA`(IN `IDHISTORIAL` INT, IN `IDCONSULTA` INT)
BEGIN
	INSERT INTO fua(fua_fegistro,historia_id,consulta_id)VALUES(CURDATE(),IDHISTORIAL,IDCONSULTA);
	SELECT LAST_INSERT_ID();
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_INSUMO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_INSUMO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_INSUMO`(IN `INSUMO` VARCHAR(100), IN `STOCK` INT, IN `ESTATUS` VARCHAR(10))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM insumo where insumo_nombre=INSUMO);

IF @CANTIDAD = 0 THEN
INSERT INTO insumo(insumo_nombre,insumo_stock,insumo_fregistro,insumo_estatus)
VALUES(INSUMO,STOCK,CURDATE(),ESTATUS);
SELECT 1;
ELSE
SELECT 2;
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_MEDICAMENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_MEDICAMENTO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_MEDICAMENTO`(IN `MEDICAMENTO` VARCHAR(50), IN `ALIAS` VARCHAR(50), IN `STOCK` INT, IN `ESTATUS` VARCHAR(10))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM medicamento WHERE medicamento_nombre=MEDICAMENTO);
IF @CANTIDAD=0 THEN
	INSERT INTO medicamento(medicamento_nombre,medicamento_alias,medicamento_stock,medicamento_fregistro,medicamento_estatus) VALUES(MEDICAMENTO,ALIAS,STOCK,CURDATE(),ESTATUS);
	SELECT 1;
ELSE
	SELECT 2;
END IF;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_MEDICO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_MEDICO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_MEDICO`(IN `NOMBRES` VARCHAR(50), IN `APEPAT` VARCHAR(50), IN `APEMAT` VARCHAR(50), IN `DIRECCION` VARCHAR(200), IN `MOVIL` CHAR(12), IN `SEXO` CHAR(2), IN `FECHANACIMIENTO` DATE, IN `NRODOCUMENTO` CHAR(12), IN `COLEGIATURA` CHAR(12), IN `ESPECIALIDAD` INT, IN `USUARIO` VARCHAR(20), IN `CONTRA` TEXT, IN `ROL` INT, IN `EMAIL` VARCHAR(255))
BEGIN
DECLARE CANTIDADU INT;
DECLARE CANTIDADME INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM usuario where usu_nombre=USUARIO);
IF @CANTIDAD = 0 THEN
	SET @CANTIDADME:=(SELECT COUNT(*) FROM medico where medico_nrodocumento=NRODOCUMENTO OR medico_colegiatura=COLEGIATURA);
	IF @CANTIDADME = 0 THEN
		INSERT INTO usuario(usu_nombre,usu_contrasena,usu_sexo,rol_id,usu_status,usu_email,usu_intento)
			values (USUARIO,CONTRA,SEXO,ROL,'ACTIVO',EMAIL,0);
			INSERT INTO medico(medico_nombre,medico_apepat,medico_apemat,medico_direccion,medico_movil,medico_sexo,medico_fenac,medico_nrodocumento,medico_colegiatura,especialidad_id,usu_id)
			values(NOMBRES,APEPAT,APEMAT,DIRECCION,MOVIL,SEXO,FECHANACIMIENTO,NRODOCUMENTO,COLEGIATURA,ESPECIALIDAD,(select max(usu_id) from usuario));
			SELECT 1;
	ELSE
		SELECT 2;
	END IF;
ELSE
 SELECT 3;
END IF;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_PACIENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PACIENTE`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_PACIENTE`(IN `NOMBRES` VARCHAR(50), IN `APEPAT` VARCHAR(50), IN `APEMAT` VARCHAR(50), IN `DIRECCION` VARCHAR(200), IN `MOVIL` CHAR(12), IN `SEXO` CHAR(2), IN `NRODOCUMENTO` CHAR(12))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM paciente where paciente_nrodocumento=NRODOCUMENTO);
IF @CANTIDAD = 0 THEN
	INSERT INTO paciente(paciente_nombre,paciente_apepat,paciente_apemat,paciente_direccion,paciente_movil,paciente_sexo,paciente_nrodocumento,paciente_estatus)
	values(NOMBRES,APEPAT,APEMAT,DIRECCION,MOVIL,SEXO,NRODOCUMENTO,'ACTIVO');
	SELECT 1;
ELSE
	SELECT 2;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_PAGO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PAGO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_PAGO`(IN IDCITA INT,IN IDUSUARIO INT,IN FECHA DATE,IN MONTO DECIMAL(10,2))
BEGIN
INSERT INTO pago(usuario_id,pago_fregistro,cita_id,pago_monto,pago_estatus) VALUES(IDUSUARIO,FECHA,IDCITA,MONTO,'PAGADO');
UPDATE cita set
cita_p='P'
where cita_id=IDCITA;
SELECT LAST_INSERT_ID();
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_PROCEDIMIENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PROCEDIMIENTO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_PROCEDIMIENTO`(IN `PROCEDIMIENTO` VARCHAR(50), IN `ESTATUS` VARCHAR(10))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(select count(*) from procedimiento where procedimiento_nombre=PROCEDIMIENTO);
IF @CANTIDAD = 0 THEN
	INSERT INTO procedimiento(procedimiento_nombre,procedimiento_fecregistro,procedimiento_estatus)
	VALUES(PROCEDIMIENTO,CURDATE(),ESTATUS);
	SELECT 1;
ELSE
	SELECT 2;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_USUARIO`(IN `USU` VARCHAR(20), IN `CONTRA` VARCHAR(250), IN `SEXO` CHAR(1), IN `ROL` INT, IN `EMAIL` VARCHAR(250))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(select count(*) from usuario where usu_nombre= BINARY USU);
IF @CANTIDAD=0 THEN
	INSERT INTO usuario(usu_nombre,usu_contrasena,usu_sexo,rol_id,usu_status,usu_email,usu_intento) VALUES (USU,CONTRA,SEXO,ROL,'ACTIVO',EMAIL,0);
	SELECT 1;
ELSE
	SELECT 2;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_RESTABLECER_CONTRA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_RESTABLECER_CONTRA`;
delimiter ;;
CREATE PROCEDURE `SP_RESTABLECER_CONTRA`(IN `EMAIL` VARCHAR(255), IN `CONTRA` VARCHAR(255))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(select COUNT(*) from usuario where usu_email=EMAIL);
IF @CANTIDAD>0 THEN
	update usuario set
	usu_contrasena=CONTRA,
	usu_intento=0
	where usu_email=EMAIL;
	select 1;
ELSE
	select 2;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_TRAER_STOCK_INSUMO_H
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_TRAER_STOCK_INSUMO_H`;
delimiter ;;
CREATE PROCEDURE `SP_TRAER_STOCK_INSUMO_H`(IN `ID` INT)
SELECT
	insumo.insumo_id, 
	insumo.insumo_stock
FROM
	insumo
	where insumo.insumo_id=ID;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_TRAER_STOCK_MEDICAMENTO_H
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_TRAER_STOCK_MEDICAMENTO_H`;
delimiter ;;
CREATE PROCEDURE `SP_TRAER_STOCK_MEDICAMENTO_H`(IN `ID` INT)
SELECT
	medicamento.medicamento_nombre, 
	medicamento.medicamento_stock
FROM
	medicamento
	where medicamento.medicamento_id=ID;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_VERIFICAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_VERIFICAR_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_VERIFICAR_USUARIO`(IN `USUARIO` VARCHAR(20))
SELECT
usuario.usu_id,
usuario.usu_nombre,
usuario.usu_contrasena,
usuario.usu_sexo,
usuario.rol_id,
usuario.usu_status,
rol.rol_nombre,
usuario.usu_intento
FROM
usuario
INNER JOIN rol ON usuario.rol_id = rol.rol_id
WHERE usu_nombre= BINARY USUARIO;
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table consulta
-- ----------------------------
DROP TRIGGER IF EXISTS `TR_STATUS_CITA_CONSULTA`;
delimiter ;;
CREATE TRIGGER `TR_STATUS_CITA_CONSULTA` BEFORE INSERT ON `consulta` FOR EACH ROW UPDATE cita SET
cita_estatus='ATENDIDO'
where cita_id=new.cita_id
;
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table detalle_insumo
-- ----------------------------
DROP TRIGGER IF EXISTS `TR_STOCK_INSUMO`;
delimiter ;;
CREATE TRIGGER `TR_STOCK_INSUMO` BEFORE INSERT ON `detalle_insumo` FOR EACH ROW BEGIN
DECLARE STOCKACTUAL DECIMAL(10,2);
SET @STOCKACTUAL:=(SELECT insumo_stock from insumo where insumo_id=new.insumo_id);
UPDATE insumo set
insumo_stock=@STOCKACTUAL-new.detain_cantidad
WHERE insumo_id=new.insumo_id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table detalle_medicamento
-- ----------------------------
DROP TRIGGER IF EXISTS `TR_STOCK_MEDICAMENTO`;
delimiter ;;
CREATE TRIGGER `TR_STOCK_MEDICAMENTO` BEFORE INSERT ON `detalle_medicamento` FOR EACH ROW BEGIN
DECLARE STOCKACTUAL DECIMAL(10,2);
SET @STOCKACTUAL:=(SELECT medicamento_stock from medicamento where medicamento_id = new.medicamento_id);
UPDATE medicamento set
medicamento_stock=@STOCKACTUAL-new.datame_cantidad
WHERE medicamento_id = new.medicamento_id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table paciente
-- ----------------------------
DROP TRIGGER IF EXISTS `TR_CREAR_HISTORIA`;
delimiter ;;
CREATE TRIGGER `TR_CREAR_HISTORIA` AFTER INSERT ON `paciente` FOR EACH ROW INSERT INTO historia(paciente_id, historia_feregistro) VALUES(new.paciente_id,curdate())
;
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
