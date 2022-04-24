<?php
    session_start();
    if (isset($_SESSION['administrator'])){
    include "header.php";
?>
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-sm-4 col-3">
                            <h4 class="page-title">Trabajadores</h4>
                        </div>
                        <div class="col-sm-8 col-9 text-right m-b-20">
                            <a href="add-employee.html" class="btn btn-primary float-right btn-rounded"><i class="fa fa-plus"></i> Agregar Trabajador</a>
                        </div>
                    </div>

                    <!-- SEARCH EMPLOYE -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card-box">
                                <h4 class="card-title">Busqueda</h4>
                                <form class="row filter-row">
                                    <div class="col-sm-6 col-md-3">
                                        <div class="form-group form-focus">
                                            <label class="focus-label">Dni Paciente</label>
                                            <input type="text" class="form-control floating" name="txtdni" id="txtdni">
                                        </div>
                                    </div>

                                    <div class="col-sm-6 col-md-16">
                                        <div class="form-group form-focus">
                                            <label class="focus-label">Nombre Paciente</label>
                                            <input type="text" class="form-control floating" name="txtapellido" id="txtapellido">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <button class="btn btn-primary btn-block" type="submit"> Buscar </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- DATA EMPLOYEES -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card-box">
                                <div class="table-responsive">
                                    <table class="table table-striped custom-table">
                                        <thead>
                                        <tr>
                                            <th style="min-width:200px;">Nombre</th>
                                            <th>ID</th>
                                            <th>Email</th>
                                            <th>Telefono</th>
                                            <th style="min-width: 110px;">Fecha de Ingreso</th>
                                            <th>Rol</th>
                                            <th class="text-right">Acciones</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>
                                                <img width="28" height="28" src="../assets/img/user.jpg" class="rounded-circle" alt=""> <h2>Albina Simonis</h2>
                                            </td>
                                            <td>NS-0001</td>
                                            <td>albinasimonis@example.com</td>
                                            <td>828-634-2744</td>
                                            <td>7 May 2015</td>
                                            <td>
                                                <span class="custom-badge status-green">Nurse</span>
                                            </td>
                                            <td class="text-right">
                                                <div class="dropdown dropdown-action">
                                                    <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="edit-employee.html"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_employee"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img width="28" height="28" src="assets/img/user.jpg" class="rounded-circle" alt=""> <h2>Cristina Groves</h2>
                                            </td>
                                            <td>DR-0001</td>
                                            <td>cristinagroves@example.com</td>
                                            <td>928-344-5176</td>
                                            <td>1 Jan 2013</td>
                                            <td>
                                                <span class="custom-badge status-blue">Doctor</span>
                                            </td>
                                            <td class="text-right">
                                                <div class="dropdown dropdown-action">
                                                    <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="edit-employee.html"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_employee"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img width="28" height="28" src="assets/img/user.jpg" class="rounded-circle" alt=""> <h2>Mary Mericle</h2>
                                            </td>
                                            <td>SF-0003</td>
                                            <td>marymericle@example.com</td>
                                            <td>603-831-4983</td>
                                            <td>27 Dec 2017</td>
                                            <td>
                                                <span class="custom-badge status-grey">Accountant</span>
                                            </td>
                                            <td class="text-right">
                                                <div class="dropdown dropdown-action">
                                                    <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="edit-employee.html"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_employee"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img width="28" height="28" src="assets/img/user.jpg" class="rounded-circle" alt=""> <h2>Haylie Feeney</h2>
                                            </td>
                                            <td>SF-0002</td>
                                            <td>hayliefeeney@example.com</td>
                                            <td>616-774-4962</td>
                                            <td>21 Apr 2017</td>
                                            <td>
                                                <span class="custom-badge status-grey">Laboratorist</span>
                                            </td>
                                            <td class="text-right">
                                                <div class="dropdown dropdown-action">
                                                    <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="edit-employee.html"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_employee"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img width="28" height="28" src="assets/img/user.jpg" class="rounded-circle" alt=""> <h2>Zoe Butler</h2>
                                            </td>
                                            <td>SF-0001</td>
                                            <td>zoebutler@example.com</td>
                                            <td>444-555-9999</td>
                                            <td>19 May 2012</td>
                                            <td>
                                                <span class="custom-badge status-grey">Pharmacist</span>
                                            </td>
                                            <td class="text-right">
                                                <div class="dropdown dropdown-action">
                                                    <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="edit-employee.html"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_employee"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- DELETE MODAL-->
            <!--<div id="delete_employee" class="modal fade delete-modal" role="dialog">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body text-center">
                            <img src="assets/img/sent.png" alt="" width="50" height="46">
                            <h3>Are you sure want to delete this Employee?</h3>
                            <div class="m-t-20"> <a href="#" class="btn btn-white" data-dismiss="modal">Close</a>
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>-->
<?php
    include "footer.php";
    }else{

    }
?>