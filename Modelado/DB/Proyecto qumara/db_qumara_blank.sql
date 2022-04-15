--
-- ESTRUCTURA BASE DE DATOS: db_qumara
--
CREATE DATABASE db_qumara CHARACTER SET utf8 COLLATE utf8_general_ci;

USE db_qumara;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

--
-- TABLAS SIN RELACIONES
--

--
-- ESTRUCTURA TABLA: Login
--
CREATE TABLE T_ACCESO (
  IN_ID_ACC INT (11) NOT NULL AUTO_INCREMENT COMMENT 'ID Tabla Acceso',
  VC_USUARIO_ACC VARCHAR (20) NOT NULL,
  VC_CLAVE_ACC VARCHAR (32) NOT NULL,
  IN_ID_PSA INT (11) NOT NULL COMMENT 'ID Tabla Personal de Salud',
  IN_ID_PAD INT (11) NOT NULL COMMENT 'ID Tabla Personal Administrativo',
  IN_NIVEL_ACC INT (11) NOT NULL DEFAULT 2 COMMENT '1 Admin, 2 Personal Salud, 3 Personal Administrativo',
  TI_ESTADO_ACC TINYINT (1) NOT NULL DEFAULT 1,
  IN_ADM_ACC INT (11) DEFAULT 0,
  PRIMARY KEY (IN_ID_ACC)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT 'Tabla Login';

-- ----------------------------
-- Records of login
-- ----------------------------
BEGIN;
INSERT INTO T_ACCESO (IN_ID_ACC, VC_USUARIO_ACC, VC_CLAVE_ACC, IN_ID_PSA, IN_ID_PAD, IN_NIVEL_ACC, TI_ESTADO_ACC, IN_ADM_ACC)
VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 0, 1, 1, 1, 1);
COMMIT;

--
-- ESTRUCTURA TABLA: Consultorio
--
CREATE TABLE T_CONSULTORIO (
  IN_ID_CON INT (11) NOT NULL AUTO_INCREMENT COMMENT 'ID Tabla Consultorio',
  VC_NOMBRE_CON VARCHAR (200) NOT NULL,
  VC_DESCRIPCION_CON VARCHAR (255) NOT NULL,
  TI_ESTADO_CON TINYINT (1) DEFAULT NULL,
  PRIMARY KEY (IN_ID_CON)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'Tabla Consultorio';


--
-- ESTRUCTURA TABLA: Personal de Salud
--
CREATE TABLE T_PERSONAL_SALUD (
  IN_ID_PSA INT (11) NOT NULL AUTO_INCREMENT COMMENT 'ID Tabla Personal de Salud',
  VC_DNI_PSA VARCHAR (11) NOT NULL,
  VC_NOMBRE_PSA VARCHAR (80) NOT NULL,
  VC_APELLIDO_PSA VARCHAR (150) NOT NULL,
  VC_EMAIL_PSA VARCHAR (150) NOT NULL,
  VA_FNACIMIENTO_PSA VARCHAR (20) NOT NULL COMMENT 'Fecha de Nacimiento Personal de Salud',
  VC_GENERO_PSA VARCHAR (12) NOT NULL,
  VC_DIRECCION_PSA VARCHAR (200) DEFAULT NULL,
  VC_DEPARTAMENTO_PSA VARCHAR (20) DEFAULT NULL,
  VC_PROVINCIA_PSA VARCHAR (30) DEFAULT NULL,
  VC_DISTRITO_PSA VARCHAR (30) DEFAULT NULL,
  VC_PROFESION_PSA VARCHAR (100) NOT NULL COMMENT 'Profesion Personal de Salud',
  VC_COLEGIATURA_PSA VARCHAR (20) DEFAULT NULL COMMENT 'Numero Colegiatura Personal de Salud',
  VC_TELEFONO_PSA VARCHAR (40) NOT NULL,
  VC_AVATAR_PSA VARCHAR (200) NOT NULL COMMENT 'Foto Persil Personal de Salud',
  VC_BIOGRAFIA_PSA TEXT NOT NULL,
  DT_FREGISTRO_PSA DATETIME DEFAULT NULL COMMENT 'Fecha de Registro Personal de Salud',
  TI_ESTADO_PSA TINYINT (1) DEFAULT NULL COMMENT '1 Activo, 0 Inactivo',
  IN_OCULTO_PSA INT (11) DEFAULT 0,
  VC_FIRMA_PSA VARCHAR (200) DEFAULT NULL,
  PRIMARY KEY (IN_ID_PSA)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'Tabla Personal de Salud';

--
-- ESTRUCTURA TABLA: Paciente
--
CREATE TABLE T_PACIENTE (
  IN_ID_PAC INT (11) NOT NULL AUTO_INCREMENT COMMENT 'ID Tabla Paciente',
  VC_DNI_PAC VARCHAR (11) NOT NULL,
  VC_NOMBRE_PAC VARCHAR (80) NOT NULL,
  VC_APELLIDOS_PAC VARCHAR (150) NOT NULL,
  VC_EMAIL_PAC VARCHAR (150) NOT NULL,
  VC_FNACIMIENTO_PAC VARCHAR (10) NOT NULL COMMENT 'Fecha Nacimiento Paciente',
  VC_GENERO_PAC VARCHAR (12) NOT NULL COMMENT 'Genero Paciente',
  VC_DIRECCION_PAC VARCHAR (200) DEFAULT NULL COMMENT 'Direccion Domiclio Paciente',
  VC_DISTRITO_PAC VARCHAR (40) DEFAULT NULL,
  VC_PROVINCIA_PAC VARCHAR (30) DEFAULT NULL,
  VC_LOCALIDAD_PAC VARCHAR (30) DEFAULT NULL,
  VC_TELEFONO_PAC VARCHAR (40) DEFAULT NULL,
  VC_AVATAR_PAC VARCHAR (200) DEFAULT NULL COMMENT 'Foto Perfil Paciente',
  DT_FREGISTRO_PAC DATETIME DEFAULT NULL COMMENT 'Fecha de Registro Paciente',
  TI_ESTADO_PAC TINYINT (1) DEFAULT NULL,
  PRIMARY KEY (IN_ID_PAC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'Tabla Paciente';

--
-- ESTRUCTURA TABLA: Empleado
--
CREATE TABLE T_EMPLEADO (
  IN_ID_EMP INT (11) NOT NULL AUTO_INCREMENT COMMENT 'ID Tabla Empleado',
  VC_NOMBRE_EMP VARCHAR (60) NOT NULL,
  VC_APELLIDOS_EMP VARCHAR (120) NOT NULL,
  VC_EMAIL_EMP VARCHAR (150) DEFAULT NULL,
  DA_FINGRESO_EMP DATE DEFAULT NULL COMMENT 'Fecha Ingreso Empleado',
  VC_TELEFONO_EMP VARCHAR (20) DEFAULT NULL,
  IN_ID_PAP INT (11) NOT NULL COMMENT 'ID Tabla Papel Empleado',
  VC_ESTADO_EMP TINYINT (1) NOT NULL DEFAULT 1,
  DT_FREGISTRO_EMP DATETIME DEFAULT NULL COMMENT 'Fecha Registro Empleado',
  PRIMARY KEY (IN_ID_EMP)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'Tabla Empleado';


--
-- TABLAS CON RELACIONES
--

--
-- ESTRUCTURA TABLA: Atencion
--
CREATE TABLE T_ATENCION (
  IN_ID_ATE INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Tabla Atencion',
  VC_NHISTORIA_ATE VARCHAR(20) DEFAULT NULL COMMENT 'Numero de Historia Clinica',
  VC_CODIGOSIS_ATE VARCHAR (45) DEFAULT NULL COMMENT 'Codigo de SIS',
  VC_NOMBRES_ATE VARCHAR (200) DEFAULT NULL COMMENT 'Nombres Paciente',
  IN_EDAD_ATE INT (11) DEFAULT NULL COMMENT 'Edad Paciente',
  VC_TIPUSAURIO_ATE VARCHAR (50) DEFAULT NULL COMMENT 'Tipo de Usuario',
  VC_TIPATENCION_ATE VARCHAR (45) DEFAULT NULL COMMENT 'Tipo de Atencion',
  VC_ESPECIALIDAD_ATE VARCHAR (100) DEFAULT NULL COMMENT 'Especilidad de Atencion',
  VC_OTROS_ATE VARCHAR (100) DEFAULT NULL COMMENT 'Otros valores',
  DT_FREGISTRO_ATE DATETIME DEFAULT NULL COMMENT 'Fecha de Registro',
  INT_ID_HIC INT (11) DEFAULT NULL COMMENT 'ID Tabla Historia Clinica',
  IN_ID_PSA INT (11) DEFAULT NULL COMMENT 'ID Tabla Personal de Salud',
  IN_ID_PAC INT (11) DEFAULT NULL COMMENT 'ID Tabla Paciente',
  PRIMARY KEY (IN_ID_ATE),
  KEY FK_ATENCION_PERSALUD_1 (IN_ID_PSA),
  KEY FK_ATENCION_PACIENTE_2 (IN_ID_PAC),
  CONSTRAINT FK_ATENCION_PERSALUD FOREIGN KEY (IN_ID_PSA) REFERENCES T_PERSONAL_SALUD (IN_ID_PSA) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_ATENCION_PACIENTE FOREIGN KEY (IN_ID_PAC) REFERENCES T_PACIENTE (IN_ID_PAC) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'Tabla Atencion Paciente';

--
-- ESTRUCTURA TABLA: Historia Clinica
--
CREATE TABLE T_HISTORIA_CLINICA (
  IN_ID_HIC INT (11) NOT NULL AUTO_INCREMENT COMMENT 'ID Tabla Historia Clinica',
  VC_NHISTORI_HIC VARCHAR (45) DEFAULT NULL COMMENT 'Numero de Historia Clinica',
  IN_ID_PAC INT (11) DEFAULT NULL COMMENT 'ID Tabla Paciente',
  VA_FCONSULTA_HIC VARCHAR (30) DEFAULT NULL COMMENT 'Fecha de Consulta',
  VC_HCONSULTA_HIC VARCHAR (30) DEFAULT NULL COMMENT 'Hora de Consulta',
  IN_EDAD_HIC INT (11) DEFAULT NULL COMMENT 'Edad de Paciente',
  VC_MOTIVO_HIC VARCHAR (255) DEFAULT NULL COMMENT 'Motivo de Atencion Paciente',
  VC_SIGNOS_HIC VARCHAR (255) DEFAULT NULL COMMENT 'Signos Paciente',
  VC_RELATO_HIC VARCHAR (255) DEFAULT NULL COMMENT 'Relato Paciente',
  VC_VACUNAS_HIC VARCHAR (45) DEFAULT NULL COMMENT 'Vacunas Paciente',
  VC_APETITO_HIC VARCHAR (45) DEFAULT NULL COMMENT 'Apetito Paciente',
  VC_SED_HIC VARCHAR (45) DEFAULT NULL COMMENT 'Sed Paciente',
  VC_SUENIO_HIC VARCHAR (45) DEFAULT NULL COMMENT 'Sueño Paciente',
  VC_ORINA_HIC VARCHAR (45) DEFAULT NULL COMMENT 'Orina Paciente',
  VC_DEPOSICION_HIC VARCHAR (45) DEFAULT NULL COMMENT 'Deposicion Paciente',
  CH_FIEBRE_HIC CHAR (2) DEFAULT NULL COMMENT 'Fiebre Paciente',
  CH_VIAJE_HIC CHAR (2) DEFAULT NULL COMMENT 'Viaje Paciente',
  VC_LUGAR_HIC VARCHAR (150) DEFAULT NULL COMMENT 'Lugar Viaje Paciente',
  CH_TOS_HIC CHAR (2) DEFAULT NULL COMMENT 'Tos Paciente',
  CH_SECRESION_HIC CHAR (2) DEFAULT NULL COMMENT 'Secresion Paciente',
  VC_FUR_HIC VARCHAR (45) DEFAULT NULL COMMENT 'Fur Paciente',
  VC_EXAFISICO_HIC VARCHAR (255) DEFAULT NULL COMMENT 'Examen Fisico Paciente',
  VC_TEMP_HIC VARCHAR (20) DEFAULT NULL COMMENT 'Temperatura Paciente',
  VC_PA_HIC VARCHAR (20) DEFAULT NULL COMMENT 'PA Paciente',
  VC_FC_HIC VARCHAR (20) DEFAULT NULL COMMENT 'FC Paciente',
  VC_FR_HIC VARCHAR (20) DEFAULT NULL COMMENT 'FR Paciente',
  VC_PESO_HIC VARCHAR (20) DEFAULT NULL COMMENT 'Peso Paciente',
  VC_TALLA_HIC VARCHAR (20) DEFAULT NULL COMMENT 'Talla Paciente',
  VC_PABD_HIC VARCHAR (20) DEFAULT NULL COMMENT 'PABD Paciente',
  VC_SATURACION_HIC VARCHAR (30) DEFAULT NULL COMMENT 'Saturacion Paciente',
  VC_DIAGNOSTICO_HIC VARCHAR (255) DEFAULT NULL COMMENT 'Diagnostico Paciente',
  VC_TIPEXAMEN_HIC VARCHAR (45) DEFAULT NULL COMMENT 'Tipo Examen Paciente',
  VC_CIEX_HIC VARCHAR (50) DEFAULT NULL COMMENT 'CIEX Paciente',
  VC_TRATAMIENTO_HIC VARCHAR (255) DEFAULT NULL COMMENT 'Tratamiento Paciente',
  VC_VIA_HIC VARCHAR (50) DEFAULT NULL COMMENT 'VIA Paciente',
  VC_DOSIS_HIC VARCHAR (50) DEFAULT NULL COMMENT 'Dosis Paciente',
  VC_FRECUENCIA_HIC VARCHAR (50) DEFAULT NULL COMMENT 'Frecuencia Paciente',
  VC_MEDHIG_HIC VARCHAR (255) DEFAULT NULL COMMENT 'Medidas Higienicas Paciente',
  VC_EXAUX_HIC VARCHAR (255) DEFAULT NULL COMMENT 'Examenes Auxiliares Paciente',
  VC_MEDPREV_HIC VARCHAR (255) DEFAULT NULL COMMENT 'Medidas Preventivas Paciente',
  VC_PROCONSULTA_HIC VARCHAR (30) DEFAULT NULL COMMENT 'Proxima Consulta Paciente',
  VC_OBSERVACIONES_HIC VARCHAR (255) DEFAULT NULL COMMENT 'Observaciones Paciente',
  DT_FREGISTRO_HIC DATETIME DEFAULT NULL COMMENT 'Fecha de Registro Historia Clinica',
  IN_ID_CON INT (11) DEFAULT NULL COMMENT 'ID Tabla Consultorio',
  DT_FCAMBIO_HIC DATETIME DEFAULT NULL COMMENT 'Fecha de Cambio Historia Clinica',
  IN_ID_PSA INT (11) DEFAULT NULL COMMENT 'ID Tabla Personal de Salud',
  IN_ID_ATE INT (11) DEFAULT NULL COMMENT 'ID Tabla Atencion',
  PRIMARY KEY (IN_ID_HIC),
  KEY FK_HCLINICA_PACIENTE_1 (IN_ID_PAC),
  KEY FK_HCLINICA_CONSULTORIO_2 (IN_ID_CON),
  KEY FK_HCLINICA_PSALUD_3 (IN_ID_PSA),
  KEY FK_HCLINICA_ATENCION_4 (IN_ID_ATE),
  CONSTRAINT FK_HCLINICA_PACIENTE_1 FOREIGN KEY (IN_ID_PAC) REFERENCES T_PACIENTE (IN_ID_PAC) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_HCLINICA_CONSULTORIO_2 FOREIGN KEY (IN_ID_CON) REFERENCES T_CONSULTORIO (IN_ID_CON) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_HCLINICA_PSALUD_3 FOREIGN KEY (IN_ID_PSA) REFERENCES T_PERSONAL_SALUD (IN_ID_PSA) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_HCLINICA_ATENCION_4 FOREIGN KEY (IN_ID_ATE) REFERENCES T_ATENCION (IN_ID_ATE) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'Tabla Historia Clinica';

-- TABLA EDUCACION PERSONAL DE SALUD
CREATE TABLE T_EDUCACION_PSA (
  IN_ID_EDU INT (11) NOT NULL AUTO_INCREMENT COMMENT 'ID Tabla Educacion Personal de Salud',
  VC_CENTRO_EDU VARCHAR (255) NOT NULL COMMENT 'Centro de Estudio',
  VC_ESPECIALIDAD_EDU VARCHAR (255) NOT NULL COMMENT 'Especialidad de Estudio',
  VC_PERIODO_EDU VARCHAR (45) NOT NULL COMMENT 'Periodo de Estudios',
  IN_ID_PSA INT (11) NOT NULL COMMENT 'ID Tabla Personal de Salud',
  PRIMARY KEY (IN_ID_EDU),
  KEY FK_EDUCACION_PSALUD_1 (IN_ID_PSA),
  CONSTRAINT FK_EDUCACION_PSALUD FOREIGN KEY (IN_ID_PSA) REFERENCES T_PERSONAL_SALUD (IN_ID_PSA) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'Tabla Educacion Personal de Salud';

-- TABLA EXPERIENCIA PERSONAL DE SALUD
CREATE TABLE T_EXPERIENCIA_PSA (
  IN_ID_EXP INT (11) NOT NULL AUTO_INCREMENT COMMENT 'ID Tabla Experiencia Personal de Salud',
  VC_EMPRESA_EXP VARCHAR (200) NOT NULL COMMENT 'Empresa de Trabajo',
  VC_CARGO_EXP VARCHAR (255) NOT NULL COMMENT 'Cargo de Trabajo',
  VC_FINICIO_EXP VARCHAR (100) DEFAULT NULL COMMENT 'Fecha Inicio Trabajo',
  VC_FFIN_EXP VARCHAR (100) DEFAULT NULL COMMENT  'Fecha Fin Trabajo',
  IN_TANIO_EXP INT (11) DEFAULT NULL COMMENT 'Cantidad de Años',
  IN_TMES_EXP INT (11) DEFAULT NULL COMMENT 'Cantidad de Meses',
  IN_ID_PSA INT (11) NOT NULL COMMENT 'ID Tabla Personal de Salud',
  PRIMARY KEY (IN_ID_EXP),
  KEY FK_EXPERIENCIA_PSALUD_1 (IN_ID_PSA),
  CONSTRAINT FK_EXPERIENCIA_PSALUD_1 FOREIGN KEY (IN_ID_PSA) REFERENCES T_PERSONAL_SALUD (IN_ID_PSA) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'Tabla Experiencia Personal de Salud';

CREATE TABLE T_CITA (
  IN_ID_CIT INT (11) NOT NULL AUTO_INCREMENT COMMENT 'ID Tabla Cita',
  VC_CODIGO_CIT VARCHAR (20) NOT NULL COMMENT 'CODIGO Alfanumerico Cita',
  IN_ID_PAC INT (11) NOT NULL COMMENT 'ID Tabla Paciente',
  IN_ID_CON INT (11) NOT NULL COMMENT 'ID Tabla Consultorio',
  IN_ID_PSA INT (11) NOT NULL COMMENT 'ID Tabla Personal de Salud',
  VC_FCITA_CIT VARCHAR (12) NOT NULL COMMENT 'Fecha Cita Paciente',
  VC_HCITA_CIT VARCHAR (15) NOT NULL COMMENT 'Hora Cita Paciente',
  VC_EPACIENTE_CIT VARCHAR (150) DEFAULT NULL COMMENT 'Email Paciente',
  VC_TELEFONO_CIT VARCHAR (50) DEFAULT NULL COMMENT 'Telefono Paciente',
  VC_MENSAJE_CIT VARCHAR (255) DEFAULT NULL COMMENT 'Mensaje Cita',
  DT_FREGISTRO_CIT DATETIME DEFAULT NULL COMMENT 'Fecha Registro Cita',
  TI_ESTADO_CIT TINYINT (1) DEFAULT NULL,
  IN_ID_REF INT (11) DEFAULT NULL COMMENT 'ID Tabla Referencia',
  PRIMARY KEY (IN_ID_CIT),
  KEY FK_CITA_PACIENTE_1 (IN_ID_PAC),
  KEY FK_CITA_CONSULTORIO_2 (IN_ID_CON),
  KEY FK_CITA_PSALUD_3 (IN_ID_PSA),
  CONSTRAINT FK_CITA_PACIENTE_1 FOREIGN KEY (IN_ID_PAC) REFERENCES T_PACIENTE (IN_ID_PAC) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_CITA_CONSULTORIO_2 FOREIGN KEY (IN_ID_CON) REFERENCES T_CONSULTORIO (IN_ID_CON) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_CITA_PSALUD_3 FOREIGN KEY (IN_ID_PSA) REFERENCES T_PERSONAL_SALUD (IN_ID_PSA) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'Tabla Cita';

SET FOREIGN_KEY_CHECKS = 1;
