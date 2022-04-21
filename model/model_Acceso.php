<?php
    require 'model_Conexion.php';
class Acceso extends Conexion
{
    private $conn;

    function __construct()
    {
        $this->conn = new Conexion();
        return $this->conn;
    }

    /* FUNCION VALIDAR ACCESO */
    function validarAcceso($usuAcceso, $claAcceso)
    {
        $consultar_Acceso = "SELECT IN_ID_PSA AS idPSalud, IN_ID_PAD as idPAdministrativo,IN_NIVEL_ACC AS nivAcceso, TI_ESTADO_ACC as estAcceso FROM T_ACCESO WHERE VC_USUARIO_ACC ='$usuAcceso' AND VC_CLAVE_ACC = MD5('$claAcceso')";
        $respuesta_Acceso = $this->conn->ConsultaArray($consultar_Acceso);
        return $respuesta_Acceso;
        mysqli_close($this->conn);
    }

     /* FUNCION LISTAR PERSONAL DE SALUD */
    function listarPersonalSalud($idPSalud){
        $sql = "SELECT CONCAT(VC_NOMBRE_PSA,' ',VC_APELLIDO_PSA) as nomPSalud, VC_AVATAR_PSA avaPSalud FROM doctor WHERE IN_ID_PSA = ".$idPSalud;
        $lista_PSalud = $this->conn->ConsultaArray($sql);
        return $lista_PSalud;
    }
}