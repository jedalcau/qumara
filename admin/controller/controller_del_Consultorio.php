<?php
    include "../../model/model_Consultorio.php";

    $idConsultorio = $_REQUEST['idConsultorio'];
    echo $idConsultorio;
  /*  $model_Consultorio = new Consultorio();
    $resultado_eliminarConsultorio = $model_Consultorio->eliminarConsultorio($idConsultorio);
    echo $resultado_eliminarConsultorio;
    if($resultado_eliminarConsultorio == true){
        header("Location: ../consultorio.php");
    }else{
        header("Location: ../consultorio.php");
    }*/
?>