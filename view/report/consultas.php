<?php
require_once '../../model/model_Conexion.php';

class Consultas
{

    function __construct()
	{
		$this->conn = new modelConexionDB();
		return $this->conn;
	}
    

	function Atenciones1($fechainicio)
	{
		$sql = "SELECT p.apellidos,p.nombre,p.dni,p.ciudad,p.fecnac,h.edad,p.sexo,h.diagnostico,h.fecconsulta, h.horaconsulta,h.ciex
		FROM paciente as p, historiaclinica as h 
		WHERE p.idpac = h.idpaciente and h.fecCreate LIKE '$fechainicio%';";

		$data = $this->conn->ConsultaCon($sql);
        
		return $data;
	}

	function Atenciones2($fechainicio,$fechafin)
	{
		$sql = "SELECT p.apellidos,p.nombre,p.dni,p.ciudad,p.fecnac,h.edad,p.sexo,h.diagnostico,h.fecconsulta, h.horaconsulta,h.ciex
        FROM paciente as p, historiaclinica as h 
        WHERE p.idpac = h.idpaciente and h.fecCreate between '$fechainicio%' and '$fechafin%'";

		$data = $this->conn->ConsultaCon($sql);
        
		return $data;
	}
}