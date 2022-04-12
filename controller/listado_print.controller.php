<?php

$fechainicio = $_GET['txtfecinicio'];
$fechafin    = $_GET['txtfecfinal'];


if(!empty($fechainicio) && !empty($fechafin))
{
    #echo "ambas fechas: ".$fechainicio." / ".$fechafin;

    echo "../view/report/report2.php?fechainicio=".$fechainicio."&fechafin=".$fechafin;
}else{

    if(!empty($fechainicio))
    {
        #echo "Solo fecha inicial";
        echo "../view/report/reportes.php?fechainicio=".$fechainicio;
    }else{
        
        if(!empty($fechafin))
        {
            echo "../view/report/reportes.php?fechainicio=".$fechafin;
        }else{
            echo "#";
        }
    }

    
}
