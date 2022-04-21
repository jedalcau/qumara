<?php
    require "model_Conexion.php";
class Paciente
{
    private $conn;

    function __construct()
    {
        $this->conn = new modelConexionDB();
        return $this->conn;
    }

    /* FUNCION MOSTRAR PACIENTES*/
    function listarPacientes(){
        $mostrar_Pacientes = "SELECT * FROM listaPacientes";
        $respuesta_Pacientes = $this->conn->ConsultaCon($mostrar_Pacientes);
        return $respuesta_Pacientes;
        mysqli_close($this->conn);
    }

    /* FUNCION REGISTRAR PACIENTES*/
    function registrarPacientes($dniPac, $nomPac, $apePac, $fnaPac, $genPac, $emaPac, $telPac, $dirPac, $proPac, $disPac, $locPac, $avaPac, $estPac){
        $frePac = date('Y-m-d H:i:s');;
        $registro_Pacientes = "INSERT INTO T_PACIENTE (IN_ID_PAC, VC_DNI_PAC, VC_NOMBRE_PAC, VC_APELLIDOS_PAC, DA_FNACIMIENTO_PAC, VC_GENERO_PAC, VC_EMAIL_PAC, VC_TELEFONO_PAC, VC_DIRECCION_PAC, VC_PROVINCIA_PAC, VC_DISTRITO_PAC, VC_LOCALIDAD_PAC, VC_AVATAR_PAC, DT_FREGISTRO_PAC, TI_ESTADO_PAC) VALUES (NULL, '$dniPac', '$nomPac', '$apePac', '$fnaPac', '$genPac', '$emaPac', '$telPac', '$dirPac', '$proPac', '$disPac', '$locPac', '$avaPac', '$frePac', '$estPac');";
        $this->conn->ConsultaSin($registro_Pacientes);
        return true;
        mysqli_close($this->conn);
    }

    /* FUNCION BUSCAR PACIENTE */
    function buscarPacientes($idPac){
        $buscar_Pacientes = "SELECT IN_ID_PAC AS idPac, VC_DNI_PAC as dniPac, VC_NOMBRE_PAC AS nomPac, VC_APELLIDOS_PAC AS apePac, DA_FNACIMIENTO_PAC AS fnaPac, VC_GENERO_PAC AS genPac, VC_EMAIL_PAC AS emaPac, VC_TELEFONO_PAC AS telPac, VC_DIRECCION_PAC AS dirPac, VC_PROVINCIA_PAC AS proPac, VC_DISTRITO_PAC AS disPac, VC_LOCALIDAD_PAC AS locPac, VC_AVATAR_PAC AS avaPac, TI_ESTADO_PAC AS estPac FROM T_PACIENTE WHERE IN_ID_PAC =".$idPac;
        $respuesta_Pacientes = $this->conn->ConsultaArray($buscar_Pacientes);
        return $respuesta_Pacientes;
        mysqli_close($this->conn);
    }

    /* FUNCION MODIFICAR PACIENTE */
    function modificarPacientes($idPac, $dniPac, $nomPac, $apePac, $fnaPac, $genPac, $emaPac, $telPac, $dirPac, $proPac, $disPac, $locPac, $avaPac, $estPac){
        $fupPac = date('Y-m-d H:i:s');
        $modificar_Pacientes = "UPDATE T_PACIENTE SET IN_ID_PAC = '$idPac', VC_DNI_PAC = '$dniPac', VC_NOMBRE_PAC = '$nomPac', VC_APELLIDOS_PAC = '$apePac', DA_FNACIMIENTO_PAC = '$fnaPac', VC_GENERO_PAC = '$genPac', VC_EMAIL_PAC = '$emaPac', VC_TELEFONO_PAC = '$telPac', VC_DIRECCION_PAC = '$dirPac', VC_PROVINCIA_PAC = '$proPac', VC_DISTRITO_PAC = '$disPac', VC_LOCALIDAD_PAC = '$locPac', VC_AVATAR_PAC = '$avaPac', DT_FREGISTRO_PAC = '$fupPac', TI_ESTADO_PAC = '$estPac' WHERE IN_ID_PAC = ".$idPac;
        $respuesta_Pacientes = $this->conn->ConsultaSin($modificar_Pacientes);
        return $respuesta_Pacientes;
        mysqli_close($this->conn);
    }
}
?>