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

-- CREACION DE USUARIO
CREATE USER 'usr_qumara'@'localhost' IDENTIFIED BY 'pass_qumara';

-- CREACION DE PERMISOS A USUARIO
GRANT ALL PRIVILEGES ON db_qumara.* TO 'usr_qumara'@'localhost';

-- ACTUALIZACION DE PERMISOS
FLUSH PRIVILEGES;

-- SELECCION DE BASE DE DATOS
USE db_qumara;

SELECT * FROM mysql.user;