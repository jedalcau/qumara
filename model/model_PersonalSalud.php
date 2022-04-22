<?php
    require 'model_Conexion.php';
class PersonalSalud
{
    private $conn;

    function __construct()
    {
        $this->conn = new Conexion();
        return $this->conn;
    }

    /* FUNCION MOSTRAR PACIENTES*/
    function listarPersonalSalud(){
        $mostrar_PSalud = "SELECT * FROM listaPersonalSalud";
        $respuesta_PSalud = $this->conn->ConsultaCon($mostrar_PSalud);
        return $respuesta_PSalud;
        mysqli_close($this->conn);
    }
}