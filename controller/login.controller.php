<?php
    session_start();
    require "../model/login.model.php";

    $usuAcceso = trim(strtolower($_POST['txtusuario']));
    $claAcceso = trim(strtolower($_POST['txtclave']));

    $model_login = new Login();
    $resultado_ValidarAcceso = $model_login->validarAcceso($usuAcceso,$claAcceso);

    /*if($resultado_ValidarAcceso['idPSalud'] == 1)
    {

    }*/

    if($resultado_ValidarAcceso['idPSalud'] > 0){

        if($resultado_ValidarAcceso['estAcceso'] == true){

            $datPSalud = $model_login->listarPersonalSalud($resultado_ValidarAcceso['idPSalud']);

            $_SESSION['idPSalud']  = $resultado_ValidarAcceso['idPSalud'];
            $_SESSION['nomPSalud'] = $datPSalud['nomPSalud'];
            $_SESSION['avaPSalud']    = $datPSalud['avaPSalud'];

            header("Location: ../view/index.php");
        }else{

            header("Location: ../index.php?msg=1");
        }
    }else{
        if($resultado_ValidarAcceso['idPAdministrativo'] > 0)
        {

            if($resultado_ValidarAcceso['estAcceso'] == true){

                switch($resultado_ValidarAcceso['nivAcceso']) {
                    case 1: # Administrador
                        echo $_SESSION['administrator'] = $resultado_ValidarAcceso['idPAdministrativo'];
                        header("Location: ../admin/index.php");
                        break;
                    case 3: # Empleado
                        echo "Como Trabajador";
                        break;
                }

            }else{
                header("Location: ../index.html?msg=1");
            }

        }else{
            header("Location: ../index.html?msg=2");
        }

}
