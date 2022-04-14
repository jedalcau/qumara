<?php
    require "Conexion.php";

    class Login extends Conexion
    {
        private $conn;

        function __construct()
        {
            $this->conn = new Conexion();
            return $this->conn;
        }

        function validarAcceso($usuAcceso, $claAcceso)
        {
            $sql ="SELECT IN_ID_PSA AS idPSalud, IN_ID_PAD as idPAdministrativo,IN_NIVEL_ACC AS nivAcceso, TI_ESTADO_ACC as estAcceso FROM T_ACCESO WHERE VC_USUARIO_ACC ='$usuAcceso' AND VC_CLAVE_ACC = MD5('$claAcceso')";
            $respuesta_Acceso = $this->conn->ConsultaArray($sql);
            return $respuesta_Acceso;
            mysqli_close($this->conn);
        }

        function listarPersonalSalud($idPSalud){
            $sql = "SELECT CONCAT(VC_NOMBRE_PSA,' ',VC_APELLIDO_PSA) as nomPSalud, VC_AVATAR_PSA avaPSalud FROM doctor WHERE IN_ID_PSA = ".$idPSalud;
            $lista_PSalud = $this->conn->ConsultaArray($sql);
            return $lista_PSalud;
        }

    }
