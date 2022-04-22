<?php
    session_start();
    if(isset($_SESSION['administrator']))
    {
    include "header.php";
    require "../../model/model_Paciente.php";
    $model_Paciente = new Paciente();
    $mostrar_Paciente = $model_Paciente->listarPacientes();
?>
            <div class="page-wrapper">
                <div class="content">
                    <!-- HEADER -->
                    <div class="row">
                        <div class="col-sm-4 col-3">
                            <h4 class="page-title">Pacientes</h4>
                        </div>
                        <div class="col-sm-8 col-9 text-right m-b-20">
                            <a href="add-paciente.php" class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Agregar Paciente</a>
                        </div>
                    </div>
                    <!-- CONTENT -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-border table-striped custom-table datatable mb-0">
                                    <!-- Title -->
                                    <thead>
                                        <tr>
                                            <th>Dni</th>
                                            <th>Nombre</th>
                                            <th>Edad</th>
                                            <th>Localidad</th>
                                            <th>Telefono</th>
                                            <th>Estado</th>
                                            <th class="text-right">Accion</th>
                                        </tr>
                                    </thead>
                                    <!-- Data -->
                                    <tbody>
                                    <?php $i =1; while($fila = $mostrar_Paciente->fetch_array(MYSQLI_ASSOC)){ ?>
                                        <tr>
                                            <!-- DNI -->
                                            <td><?php echo $fila['dniPac']; ?></td>
                                            <!-- Nombre -->
                                            <td><img width="28" height="28" src="../assets/img/user.jpg" class="rounded-circle m-r-5" alt=""><?php echo $fila['nomPac']; ?></td>
                                            <!-- Edad -->
                                            <td><?php echo $fila['edaPac']; ?></td>
                                            <!-- Localidad -->
                                            <td><?php echo $fila['locPac']; ?></td>
                                            <!-- Telefono -->
                                            <td><?php echo $fila['telPac']; ?></td>

                                            <!-- Estado -->
                                            <td>
                                                <?php if($fila['estPac'] ==1){ ?>
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
                                                        <a class="dropdown-item" href="edit-paciente.php?idPac=<?php echo $fila['idPac'];?>"><i class="fa fa-pencil m-r-5"></i>Editar</a>
                                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_patient"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- DELETE MODAL PATIENTS-->
            <div id="delete_patient" class="modal fade delete-modal" role="dialog">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body text-center">
                            <img src="../assets/img/sent.png" alt="" width="50" height="46">
                            <h3>Are you sure want to delete this Patient?</h3>
                            <div class="m-t-20"> <a href="#" class="btn btn-white" data-dismiss="modal">Close</a>
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
<?php
    include "footer.php";
    }else{
        header("Location: ../index.html");
    }
?>