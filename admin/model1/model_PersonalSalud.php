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
        $mostrar_PersonalSalud = "SELECT IN_ID_CON AS idConsultorio, VC_NOMBRE_CON AS nomConsultorio, VC_DESCRIPCION_CON AS desConsultorio, TI_ESTADO_CON AS estConsultorio FROM T_CONSULTORIO";
        $respuesta_PersonalSalud = $this->conn->ConsultaCon($mostrar_PersonalSalud);
        return $respuesta_PersonalSalud;
        mysqli_close($this->conn);
    }

    /* FUNCION GUARDAR PERSONAL DE SALUD */
    function guardarPersonalSalud(){

    }
}
?>