<?php 
    include "../../model/model_Consultorio.php";

    echo $idConsultorio = trim(strtoupper($_POST['idconsultorio']));
    echo $nomConsultorio = trim(strtoupper($_POST['txt_nomConsultorio']));
    echo $desConsultorio = trim(strtoupper($_POST['txt_desConsultorio']));
    echo $estConsultorio = trim(strtoupper($_POST['rbt_estConsultorio']));

    $consult  = new Consultorio();
    $response = $consult->Editar($idconsultorio,$consultorio,$descripcion,$status);

    if($response == true){

        header("Location: ../consultorio.php?msg=1");
    }else{
        header("Location: ../consultorio.php?msg=2");
    }
?>