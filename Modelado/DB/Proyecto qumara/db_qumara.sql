/*
 Source Server         : Conexion
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : db_qumara

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 29/03/2022 10:38:50
*/
-- MUESTRA DE BASE DE DATOS
SHOW DATABASES;

-- CREACION DE BASE DE DATOS
CREATE DATABASE db_qumara;

-- ELIMINAR BASE DE DATOS
DROP DATABASE db_qumara;

-- CREACION DE USUARIO
CREATE USER 'usr_qumara'@'localhost' IDENTIFIED BY 'pass_qumara';

-- CREACION DE PERMISOS A USUARIO
GRANT ALL PRIVILEGES ON db_qumara.* TO 'usr_qumara'@'localhost';

-- ACTUALIZACION DE PERMISOS
FLUSH PRIVILEGES;

-- SELECCION DE BASE DE DATOS
USE db_qumara;

SHOW TABLES;

TRUNCATE db_qumara.citas;

SELECT * FROM atencion;
SELECT * FROM citas;
SELECT * FROM consultorio;
SELECT * FROM doctor;
SELECT * FROM educacion;
SELECT * FROM empleado;
SELECT * FROM experiencia;
SELECT * FROM historiaclinica;
SELECT * FROM login;
SELECT * FROM paciente;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE atencion;
TRUNCATE paciente;
TRUNCATE educacion;
TRUNCATE empleado;
TRUNCATE experiencia;
TRUNCATE db_qumara.historiaclinica;
TRUNCATE db_qumara.doctor;
TRUNCATE consultorio;
TRUNCATE login;

SET FOREIGN_KEY_CHECKS =1;

INSERT INTO `login` VALUES
(1,'admin','21232f297a57a5a743894a0e4a801fc3',0,1,1,1,1);

