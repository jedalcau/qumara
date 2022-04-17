<?php
require "Conexion.php";
class PersonalSalud
{
    private $conn;

    function __construct()
    {
        $this->conn = new Conexion();
        return $this->conn;
    }

    /* FUNCION MOSTRAT DATA PERSONAL DE SALUD */
    function mostrarPersonalSalud(){
        $mostrar_PersonalSalud = "SELECT IN_ID_PSA AS idPSalud, VC_DNI_PSA AS dniPSalud, VC_NOMBRE_PSA AS nomPSalud, VC_APELLIDO_PSA AS apePSalud, VC_EMAIL_PSA AS emaPSalud, VA_FNACIMIENTO_PSA AS fnaPSalud, VC_GENERO_PSA AS genPSalud, VC_DIRECCION_PSA AS dirPSalud, VC_DEPARTAMENTO_PSA AS depPSalud, VC_PROVINCIA_PSA AS proPSalud, VC_DISTRITO_PSA AS disPSalud, VC_PROFESION_PSA AS profPSalud, VC_COLEGIATURA_PSA AS colPSalud, VC_TELEFONO_PSA AS telPSalud, VC_AVATAR_PSA as avaPSalud, VC_BIOGRAFIA_PSA AS bioPSalud, DT_FREGISTRO_PSA AS frePSalud, TI_ESTADO_PSA AS estPSalud, IN_OCULTO_PSA, VC_FIRMA_PSA AS firPSalud FROM T_PERSONAL_SALUD;";
        $respuesta_PersonalSalud = $this->conn->ConsultaCon($mostrar_PersonalSalud);
        return $respuesta_PersonalSalud;
        mysqli_close($this->conn);
    }

    /* FUNCION GUARDAR PERSONAL DE SALUD */
    function guardarPersonalSalud(){

    }
}
?>