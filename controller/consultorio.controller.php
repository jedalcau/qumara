<?php 
    include "../model/model_Consultorio.php";

    // Variables
    $nomConsultorio = trim(strtoupper($_POST['txt_nomConsultorio']));
    $desConsultorio = trim(strtoupper($_POST['txt_desConsultorio']));
    $estConsultorio = trim(strtoupper($_POST['rdb_estConsultorio']));;

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