<?php 
require_once "Conexion.php";

class Consultorio
{
	private $conn;

	function __construct()
	{
		$this->conn = new Conexion();
		return $this->conn;
	}

    /* FUNCION GUARDAR CONSULTORIO */
    function guardarConsultorio($nomConsultorio, $desConsultorio, $estConsultorio){
        $fecRegistro = date('Y-m-d H_i_s');

        // Consultamos existencia antes del registro
        $consulta_Duplicado = "SELECT IN_ID_CON AS idConsultorio, VC_NOMBRE_CON AS nomConsultorio, VC_DESCRIPCION_CON AS desConsultorio FROM T_CONSULTORIO WHERE VC_NOMBRE_CON ='$nomConsultorio' AND VC_DESCRIPCION_CON = '$desConsultorio'";
        $respuestas_Duplicado = $this->conn->ConsultaCon($consulta_Duplicado);
        $cantidad_Duplicado = $respuestas_Duplicado->num_rows;

        // Evaluamos la cantidad de valores de la tabla
        if ($cantidad_Duplicado > 0){
            return false;
            // echo "Dato duplicado"
        }else{
            $registroConsultorio = "INSERT INTO T_CONSULTORIO (IN_ID_CON, VC_NOMBRE_CON, VC_DESCRIPCION_CON, TI_ESTADO_CON) VALUES (NULL, '$nomConsultorio', '$desConsultorio', '$estConsultorio');";
            $this->conn->ConsultaSin($registroConsultorio);
            return true;
        }
        mysqli_close($this->conn);
    }



    /* FUNCION MOSTRAR DATA CONSULTORIO */
    function mostrarConsultorio(){
        $mostrar_Consultorio = "SELECT IN_ID_CON AS idConsultorio, VC_NOMBRE_CON AS nomConsultorio, VC_DESCRIPCION_CON AS desConsultorio, TI_ESTADO_CON AS estConsultorio FROM T_CONSULTORIO";
        $respuesta_Consultorio = $this->conn->ConsultaCon($mostrar_Consultorio);
        return $respuesta_Consultorio;
        mysqli_close($this->conn);
    }

    /* FUNCION BUSCAR CONSULTORIO */
    function buscarConsultorio($idConsultorio){
        $buscar_Consultorio = "SELECT IN_ID_CON AS idConsultorio, VC_NOMBRE_CON AS nomConsultorio, VC_DESCRIPCION_CON AS desConsultorio, TI_ESTADO_CON AS estConsultorio FROM T_CONSULTORIO WHERE IN_ID_CON =".$idConsultorio;
        $respuesta_Consultorio = $this->conn->ConsultaArray($buscar_Consultorio);
        return $respuesta_Consultorio;
        mysqli_close($this->conn);
    }

    /* FUNCION MODIFICAR CONSULTORIO */
    function modificarConsultorio($idConsultorio, $nomConsultorio, $desConsultorio, $estConsultorio){
        $modificar_Consultorio = "UPDATE T_CONSULTORIO SET VC_NOMBRE_CON ='$nomConsultorio', VC_DESCRIPCION_CON = '$desConsultorio', TY_ESTADO_CON = '$estConsultorio' WHERE IN_ID_CON = ".$idConsultorio;
        $respuesta_Consultorio = $this->conn->ConsultaSin($modificar_Consultorio);
        return $respuesta_Consultorio;
        mysqli_close($this->conn);
    }

	/*function Guardar($consultorio,$descripcion,$status)
	{
		$fecCreate = date('Y-m-d H:i:s');

		$sqlduplicado = "SELECT idconsultorio FROM consultorio WHERE consultorio = '$consultorio' AND descripcion = '$descripcion'";
		
		$res1 = $this->conn->ConsultaCon($sqlduplicado);
		$num = $res1->num_rows;
        	
        	if($num > 0){
        		#echo "Dato duplicado";
        		return false;
        	}else{
	        		//Insertar
        		$sqlinsert ="INSERT INTO consultorio (idconsultorio,consultorio,descripcion,status) VALUES (null,'$consultorio','$descripcion','$status');";
		
        		
        		$this->conn->ConsultaSin($sqlinsert);
				return true;
        	}
        

		mysqli_close($this->con*/

	function Editar($idconsultorio,$consultorio,$descripcion,$status)
	{
		$sql = "UPDATE consultorio SET consultorio = '$consultorio',descripcion = '$descripcion',status = '$status' WHERE idconsultorio = " .$idconsultorio;
		
		$data = $this->conn->ConsultaSin($sql);
		return $data;
		mysqli_close($this->conn);
	}

    function MostrarConsultorios($idconsultorio)
    {
        $sql = "SELECT idconsultorio, consultorio, descripcion,status as est FROM consultorio WHERE idconsultorio=".$idconsultorio;

        $data = $this->conn->ConsultaArray($sql);
        return $data;
        mysqli_close($this->conn);
    }



	function Buscartodos()
	{
		$sql = "SELECT * FROM consultorio;";
		
		$data = $this->conn->ConsultaCon($sql);
		return $data;
		mysqli_close($this->conn);
	}

}
