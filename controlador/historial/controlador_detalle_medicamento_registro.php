<?php
    require '../../modelo/modelo_historial.php';
    $MH = new Modelo_Historial();//Instanciamos
    $id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
    $idmedicamento = htmlspecialchars($_POST['idmedicamento'],ENT_QUOTES,'UTF-8');
    $cantidad = htmlspecialchars($_POST['cantidad'],ENT_QUOTES,'UTF-8');
    $arreglo_medicamento = explode(",",$idmedicamento);//Separo mis datos 
    $arreglo_cantidad = explode(",",$cantidad);//Separo mis datos 
    for($i=0;$i<count($arreglo_medicamento);$i++){
        $consulta = $MH->Registrar_Detalle_Medicamento($id,$arreglo_medicamento[$i],$arreglo_cantidad[$i]);
    }
  
    echo $consulta;

?>