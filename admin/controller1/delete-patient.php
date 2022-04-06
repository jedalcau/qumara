<?php
require_once "../model1/paciente.model.php";

$pacientes = new Pacientes();


$idpaciente = $_REQUEST['idpac'];

$response = $pacientes->DeletePaciente($idpaciente);
echo $response;

if($response == true){
	header("Location: ../paciente.php?msg=3");
}else{
	header("Location: ../paciente.php?msg=2");
}
