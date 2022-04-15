<?php 
    include "../model/consultorio.model.php";

    // Variables
    $nomConsultorio = trim(strtoupper($_POST['txt_nomConsultorio']));
    $desConsultorio = trim(strtoupper($_POST['txt_desConsultorio']));
    $estConsultorio = 1;

    // Instanciacion
    $model_Consultorio = new Consultorio();

    // Enviamos los Valores del Formulario
    $resultado_guardarConsultorio = $model_Consultorio->guardarConsultorio($nomConsultorio, $desConsultorio, $estConsultorio);

    // Evaluamos el resultado
    if($resultado_guardarConsultorio == true){
        header("Location: ../admin/consultorio.php?msg=1");
    }else{
        header("Location: ../admin/consultorio.php?msg=2");
    }
 ?>;