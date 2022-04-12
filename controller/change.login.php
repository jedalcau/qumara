<?php
require "../model/doctor.model.php";

$iddoc        = $_POST['iddoctor'];
$username     = trim(strtolower($_POST['txtusuario']));
$passwd       = trim(strtolower($_POST['txtpasswd1']));


$doctores = new Doctores();
$response = $doctores->ChangeLogin($iddoc,$username,$passwd);

if($response == true){
	header("Location: ../view/personal_salud.php?msg=4");
}else{
	header("Location: ../view/personal_salud.php?msg=2");
}