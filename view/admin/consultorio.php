<?php 
    session_start();
    if(isset($_SESSION['administrator']))
    {
    include "header.php";
    require "../../model/model_Consultorio.php";

    $model_Consultorio = new Consultorio();
    $mostrar_Consultorio = $model_Consultorio->mostrarConsultorio();
 ?>
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-sm-5 col-5">
                            <h4 class="page-title">Consultorios</h4>
                        </div>
                        <div class="col-sm-7 col-7 text-right m-b-30">
                            <a href="add-consultorio.php" class="btn btn-primary btn-rounded"><i class="fa fa-plus"></i> Agregar Consultorio</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped custom-table mb-0 datatable">
                                    <!-- Cabecera Tabla -->
                                    <thead>
                                        <tr>
                                            <th>Nombre Consultorio</th>
                                            <th>Estado</th>
                                            <th class="text-right">Accion</th>
                                        </tr>
                                    </thead>
                                    <!-- Cuerpo Tabla -->
                                    <tbody>
                                    <?php $i =1; while($fila = $mostrar_Consultorio->fetch_array(MYSQLI_ASSOC)){ ?>
                                        <tr>
                                            <!-- NOMBRE -->
                                            <td><?php $fila['idConsultorio']; echo $fila['nomConsultorio']?></td>

                                            <!-- ESTADO -->
                                            <td>
                                                <?php if($fila['estConsultorio'] ==1){ ?>
                                                    <span class="custom-badge status-green">Activo</span>
                                                <?php }else{ ?>
                                                    <span class="custom-badge status-red">Inactivo</span>
                                                <?php } ?>
                                            </td>

                                            <!-- Menu Acciones -->
                                            <td class="text-right">
                                                <div class="dropdown dropdown-action">
                                                    <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="edit-consultorio.php?idCon=<?php echo $fila['idConsultorio'];?>"><i class="fa fa-pencil m-r-5"></i>Editar</a>
<!--                                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_patient"><i class="fa fa-trash-o m-r-5"></i> Delete</a>-->
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    <?php } ?>
                                    </tbody>
                                    <!-- Fin Cuerpo Tabla -->
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Dialog Delete Consultorio -->

                <div id="modal_delete_consultorio" class="modal fade delete-modal" role="dialog">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body text-center">
                                <img src="../assets/img/sent.png" alt="" width="50" height="46">
                                <h3>Estas de acuerdo con eliminar el Consultorio?</h3>
                                <h2><?php echo $fila['nomConsultorio']; ?></h2>
                                <div class="m-t-20"> <a href="#" class="btn btn-white" data-dismiss="modal">No</a>
                                    <button type="submit" class="btn btn-danger">Si</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

<?php 
    include "footer.php";
    }else{
        header("Location: ../../index.php");
    }
?>