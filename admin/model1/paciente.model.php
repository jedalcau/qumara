<?php 
require_once "Conexion.php";

class Pacientes
{
	private $conn;

	function __construct()
	{
		$this->conn = new Conexion();
		return $this->conn;
	}
	
	function DeletePaciente($idpaciente)
	{
		$sql = "DELETE FROM paciente WHERE idpac = ".$idpaciente;
		$data = $this->conn->ConsultaSin($sql);
		return $data;
	}

}

