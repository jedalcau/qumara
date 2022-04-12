<?php
require "../model1/doctor.model.php";

$iddoc        = $_POST['iddoctor'];
$username     = trim(strtolower($_POST['txtusuario']));
$passwd       = trim(strtolower($_POST['txtpasswd1']));


$doctores = new Doctores();
$response = $doctores->ChangeLogin($iddoc,$username,$passwd);

if($response == true){
	header("Location: ../admin/personal_salud.php?msg=4");
}else{
	header("Location: ../admin/personal_salud.php?msg=2");
}