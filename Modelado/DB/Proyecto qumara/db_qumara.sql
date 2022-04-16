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
TRUNCATE T_CONSULTORIO;
TRUNCATE login;

SET FOREIGN_KEY_CHECKS =1;

INSERT INTO `login` VALUES
(1,'admin','21232f297a57a5a743894a0e4a801fc3',0,1,1,1,1);

SELECT * FROM paciente;

SELECT dni, concat(nombre,' ',apellidos) as paciente, sexo FROM paciente ORDER BY idpac DESC LIMIT 5;

-- LISTA DE ATENCIONES, PACIENTE Y MEDICO
SELECT ate.numhistoria , ate.nombres, ate.especialidad, CONCAT(doc.nombre,doc.apellidos) as medico, ate.fecCreate FROM atencion ate
INNER JOIN doctor doc ON ate.iddoc=doc.iddoc
ORDER BY ate.fecCreate DESC
LIMIT 10;

-- LISTA DE ULTIMOS PACIENTES REGISTRADOS
SELECT pac.idpac, CONCAT(pac.)  FROM paciente pac
ORDER BY pac.fecCreate DESC
LIMIT 10;


-- FUNCION VALIDAR USUARIO Y CLAVE CONDICIONAL
SELECT IN_ID_PSA, IN_NIVEL_LOG, TI_ESTADO_LOG FROM T_LOGIN
WHERE VC_USUARIO_LOG = $usuario AND VC_CLAVE_LOG = MD5($clave);

USE db_qumara;

-- FUNCION LISTAR PERSONAL DE SALUD | LOGIN
SELECT CONCAT(VC_NOMBRE_PSA, VC_APELLIDO_PSA) AS nomPSalud, VC_AVATAR_PSA AS avaPSalud FROM T_PERSONAL_SALUD
WHERE IN_ID_PSA = 1;

SELECT * FROM T_PERSONAL_SALUD;

/*
TABLA CONSULTORIO
*/
SELECT * FROM db_qumara.T_CONSULTORIO;
INSERT INTO db_qumara.T_CONSULTORIO (IN_ID_CON, VC_NOMBRE_CON, VC_DESCRIPCION_CON, TI_ESTADO_CON) VALUES
(1,'ODONTOLOGIA','Consultorio Odontologico',1),
(2,'MEDICINA GENERAL','Consultorio Medicina General',1),
(3,'GINECOLOGIA','Consultorio Ginecologico',1);

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE T_CONSULTORIO;

SET FOREIGN_KEY_CHECKS = 1;


