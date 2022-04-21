<?php 
    include "../../model/model_Consultorio.php";

    $idConsultorio = trim(strtoupper($_POST['txt_idConsultorio']));
    $nomConsultorio = trim(strtoupper($_POST['txt_nomConsultorio']));
    $desConsultorio = trim(strtoupper($_POST['txt_desConsultorio']));
    $estConsultorio = trim(strtoupper($_POST['rdb_estConsultorio']));;

    $model_Consultorio = new Consultorio();
    $resultado_ModificarConsultorio = $model_Consultorio->modificarConsultorio($idConsultorio, $nomConsultorio, $desConsultorio, $estConsultorio);

    if($resultado_ModificarConsultorio == true){
        header("Location: ../consultorio.php");
    }else{
        header("Location: ../consultorio.php");
    }
?>