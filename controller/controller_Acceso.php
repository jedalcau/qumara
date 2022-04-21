<?php
    session_start();
    require "../model/model_Acceso.php";
    $usuAcceso = trim(strtolower($_POST['txt_usuario']));
    $claAcceso = trim(strtolower($_POST['txt_clave']));

    $model_Acceso = new Acceso();
    $resultado_validarAcceso = $model_Acceso->validarAcceso($usuAcceso,$claAcceso);


    if($resultado_validarAcceso['idPSalud'] > 0){

        if($resultado_validarAcceso['estAcceso'] == true){

            $datPSalud = $model_Acceso->listarPersonalSalud($resultado_validarAcceso['idPSalud']);

            $_SESSION['idPSalud']  = $resultado_validarAcceso['idPSalud'];
            $_SESSION['nomPSalud'] = $datPSalud['nomPSalud'];
            $_SESSION['avaPSalud']    = $datPSalud['avaPSalud'];

            header("Location:../view/personal/index.php");
        }else{
            header("Location:../index.php");
        }
    }else{
        if($resultado_validarAcceso['idPAdministrativo'] > 0){

            if($resultado_validarAcceso['estAcceso'] == true){
                switch($resultado_validarAcceso['nivAcceso']) {
                    case 1: # Administrador
                        echo $_SESSION['administrator'] = $resultado_validarAcceso['idPAdministrativo'];
                        header('Location: ../view/admin/index.php');
                        break;
                    case 3: # Empleado
                        echo $_SESSION['personal'] = $resultado_validarAcceso['idPSalud'];
                            header('Location: ../view/personal/index.php');
                        break;
                }
            }else{
                header("Location: ../idndex.php");
            }
        }else{
            header("Location: ../inddex.php");
        }
    }
