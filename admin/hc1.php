<?php 
session_start();
if(isset($_SESSION['administrator']))
{
    include "header.php";
    require "../model/consultas.model.php";

    @$dni      = $_REQUEST['txtdni'];
    @$apellido = $_REQUEST['txtapellido'];

    $consulta = new Consultas();

    @$mensaje = $_REQUEST['msg'];

    $record_per_page = 10;
    $pagina = '';
    if(isset($_GET["pagina"]))
    {
        $pagina = $_GET["pagina"];
    }
    else{
     $pagina = 1;
    }

    $start_from = ($pagina-1)*$record_per_page;

    $data = $consulta->ListadoPacientes1($dni,$apellido,$start_from,$record_per_page);

?>

        <div class="page-wrapper">
            <div class="content">
                <div class="row">
                    <div class="col-sm-12 col-3">
                        <h4 class="page-title">Historia Clinica</h4>
                    </div>
                </div>
                <div class="row">
                    <form class="form-inline">
                        <div class="form-group mb-4">
                            <div class="form-group">
                                <label>Buscar por DNI: </label>
                                <input class="form-control" type="text" name="txtdni" id="txtdni">
                            </div>
                            <div class="form-group">
                                <label>Buscar por Apellido: </label>
                                <input class="form-control" type="text" name="txtapellido" id="txtapellido">
                            </div>
                        </div>
                        <div class="form-group mb-4">
                            <div class="form-group">
                                <button class="btn btn-primary submit-btn" type="submit">Buscar</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <div class="table-responsive">
                            <table class="table table-border table-striped custom-table mb-0">
                                <thead>
                                    <tr>
                                        <th>Num</th>
                                        <th>Nombre</th>
                                        <th>DNI</th>
                                        <th>Ciudad</th>
                                        <th colspan="3">Opciones</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <?php 
                                    $i=1;
                                        while($fila = $data->fetch_array(MYSQLI_ASSOC)){
                                    
                                    ?>
                                    <tr>
                                        <td><?php echo $i;?></td>
                                        <td><?php echo $fila['nombres'];?></td>
                                        <td><?php echo $fila['dni'];?></td>
                                        <td><?php echo $fila['ciudad'];?></td>
                                        <td>
                                            <a href="listahc.php?id=<?php echo $fila['idpac'];?>">Ver Detalles</a> |
                                            <a class="btn btn-success" href="form-atencion.php?dni=<?php echo $fila['dni'];?>&nombre=<?php echo $fila['nombres'];?>&id=<?php echo $fila['idpac']; ?>&fecnac=<?php echo $fila['fecnac']; ?>">Crear Consulta</a>
                                        </td>
                                    </tr>
                                    <?php $i++; }?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                

                <div class="row">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <?php

                                $page_result = $consulta->ListadoPacientes2();
                                $total_records = $page_result->num_rows;
                                #echo "Total: ".$total_records;
                                $total_pages = ceil($total_records/$record_per_page);
                                $start_loop = $pagina;
                                $diferencia = $total_pages - $pagina;
                                if($diferencia <= 10)
                                {
                                 $start_loop = $total_pages - 1;
                                }

                                $end_loop = $start_loop + 1;
                                if($pagina > 1)
                                {
                                    echo "<li class='page-item'><a class='page-link' href='hc1.php?pagina=1'>Primera</a></li>";
                                    echo "<li class='page-item'><a class='page-link' href='hc1.php?pagina=".($pagina - 1)."'><<</a></li>";
                                    
                                }
                                for($i=$start_loop; $i<=$end_loop; $i++)
                                {     
                                 echo "<li class='page-item'><a class='page-link' href='hc1.php?pagina=".$i."'>".$i."</a>";
                                }

                                if($pagina <= $end_loop)
                                {
                                    
                                    echo "<li class='page-item'><a class='page-link' href='hc1.php?pagina=".($pagina + 1)."'>>></a></li>";
                                    echo "<li class='page-item'><a class='page-link' href='hc1.php?pagina=".$total_pages."'>Última</a></li>";
                                    
                                }
                            ?>
                        </ul>
                    
                </div>
            </div>
            
        </div>
    </div>

<?php 
include "footer.html"; 
}else{
    header("Location: ../index.html");
}
?>