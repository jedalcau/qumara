<?php
    include "../model/model_Paciente.php";

    // Variable
    $dniPac = trim(strtoupper($_POST['txt_dniPaciente']));
    $nomPac = trim(strtoupper($_POST['txt_nomPaciente']));
    $apePac = trim(strtoupper($_POST['txt_apePaciente']));
    $fnaPac = trim(strtoupper($_POST['dtp_fnaPaciente']));
    $genPac = trim(strtoupper($_POST['rdb_genPaciente']));
    $emaPac = trim(strtoupper($_POST['txt_emaPaciente']));
    $telPac = trim(strtoupper($_POST['txt_telPaciente']));
    $dirPac = trim(strtoupper($_POST['txt_dirPaciente']));
    $proPac = trim(strtoupper($_POST['txt_proPaciente']));
    $disPac = trim(strtoupper($_POST['txt_disPaciente']));
    $locPac = trim(strtoupper($_POST['txt_locPaciente']));
    $avaPac = trim(strtoupper($_POST['upi_avaPaciente']));
    $estPac = trim(strtoupper($_POST['rdb_estPaciente']));

    /*$nom_avaPac = $HTTP_POST_FILES['upi_avaPaciente']['name'];
    $tip_avaPac = $HTTP_POST_FILES['upi_avaPaciente']['type'];
    $tam_avaPac = $HTTP_POST_FILES['upi_avaPaciente']['size'];*/

    // Instanciamos Clace Paciente
    $model_Paciente = new Paciente();
    // enviamos valores de formulario
    $resultado_guardarPaciente = $model_Paciente->registrarPacientes($dniPac, $nomPac, $apePac, $fnaPac, $genPac, $emaPac, $telPac, $dirPac, $proPac, $disPac, $locPac, $avaPac, $estPac);
    // evaluamos los resultados
    if ($resultado_guardarPaciente == true){
        header("Location: ../admin/paciente.php");
    }else{
        header("Location: ../admin/paciente.php");
    }
?>