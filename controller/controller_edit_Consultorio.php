<?php 
    include "../model/model_Consultorio.php";

    $idCon = trim(strtoupper($_POST['txt_idConsultorio']));
    $nomCon = trim(strtoupper($_POST['txt_nomConsultorio']));
    $desCon = trim(strtoupper($_POST['txt_desConsultorio']));
    $estCon = trim(strtoupper($_POST['rdb_estConsultorio']));;

    $model_Consultorio = new Consultorio();
    $resultado_ModificarConsultorio = $model_Consultorio->modificarConsultorio($idCon, $nomCon, $desCon, $estCon);

    if($resultado_ModificarConsultorio == true){
        header("Location:../view/admin/consultorio.php");
    }else{
        header("Location:../view/admin/consultorio.php");
    }
?>