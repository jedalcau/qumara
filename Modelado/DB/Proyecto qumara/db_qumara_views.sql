

/* VISTAS TABLA PACIENTE */
CREATE OR REPLACE VIEW listaPacientes
AS SELECT IN_ID_PAC AS idPac, VC_DNI_PAC AS dniPac, CONCAT(VC_NOMBRE_PAC, ", ",VC_APELLIDOS_PAC) AS nomPac,(YEAR(CURRENT_DATE))- (YEAR(DA_FNACIMIENTO_PAC)) AS edaPac ,VC_LOCALIDAD_PAC AS locPac, VC_TELEFONO_PAC AS telPac, TI_ESTADO_PAC AS estPac FROM T_PACIENTE;


/* SP TABLA PACIENTE */
INSERT INTO T_PACIENTE (IN_ID_PAC, VC_DNI_PAC, VC_NOMBRE_PAC, VC_APELLIDOS_PAC, VC_FNACIMIENTO_PAC, VC_GENERO_PAC, VC_EMAIL_PAC, VC_TELEFONO_PAC, VC_DIRECCION_PAC, VC_PROVINCIA_PAC, VC_DISTRITO_PAC, VC_LOCALIDAD_PAC, VC_AVATAR_PAC, DT_FREGISTRO_PAC, TI_ESTADO_PAC) VALUES ();


SELECT * FROM listaPacientes;

SELECT IN_ID_PAC AS idPaciente, CONCAT(VC_NOMBRE_PAC, ", ",VC_APELLIDOS_PAC) AS nomPaciente, VC_LOCALIDAD_PAC AS locPaciente, VC_TELEFONO_PAC AS telPaciente,  TI_ESTADO_PAC AS estPaciente FROM T_PACIENTE

SELECT IN_ID_PAC AS idPaciente, VC_DNI_PAC as dniPaciente, VC_NOMBRE_PAC AS nomPaciente, VC_APELLIDOS_PAC AS apePaciente, VC_FNACIMIENTO_PAC AS fnaPaciente, VC_GENERO_PAC AS genPaciente, VC_EMAIL_PAC AS emaPaciente, VC_TELEFONO_PAC AS telPaciente, VC_DIRECCION_PAC AS dirPaciente, VC_PROVINCIA_PAC AS proPaciente, VC_DISTRITO_PAC AS disPaciente, VC_LOCALIDAD_PAC AS locPaciente, VC_AVATAR_PAC AS avaPaciente, TI_ESTADO_PAC AS estPaciente FROM T_PACIENTE;