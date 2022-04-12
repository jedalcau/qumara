<?php 
include "../model/consultorio.model.php";

$consultorio = trim(strtoupper($_POST['txtconsultorio']));
$descripcion = trim(strtoupper($_POST['txtdescripcion']));
$status      = 1;

$consult = new Consultorio();
$response = $consult->Guardar($consultorio,$descripcion,$status);

if($response == true){
	header("Location: ../admin/consultorio.php?msg=1");
}else{
	header("Location: ../admin/consultorio.php?msg=2");
}