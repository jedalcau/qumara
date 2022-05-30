<?php
    session_start();
    if(isset($_SESSION['administrator']))
    {
    include "header.php";
?>
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <h4 class="page-title">Agregar Paciente</h4>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <div class="card-box">
                                <h4 class="card-title">Datos del Paciente</h4>
                                <form action="../../controller/controller_add_Paciente.php" method="post">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <!-- DNI -->
                                                <div class="col-sm-2">
                                                    <div class="form-group">
                                                        <label>DNI <span class="text-danger">*</span></label>
                                                        <input class="form-control" type="text" name="txt_dniPaciente" id="txt_dniPaciente">
                                                    </div>
                                                </div>
                                                <!-- NOMBRES -->
                                                <div class="col-sm-5">
                                                    <div class="form-group">
                                                        <label>Nombres <span class="text-danger">*</span></label>
                                                        <input class="form-control" type="text" name="txt_nomPaciente" id="txt_nomPaciente">
                                                    </div>
                                                </div>
                                                <!-- APELLIDOS -->
                                                <div class="col-sm-5">
                                                    <div class="form-group">
                                                        <label>Apellidos</label><span class="text-danger">*</span>
                                                        <input class="form-control" type="text" name="txt_apePaciente" id="txt_apePaciente">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- FECHA NACIMIENTO -->
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Fecha de Nacimiento</label><span class="text-danger">*</span>
                                                <div class="cal-icon">
                                                    <input type="text" class="form-control datetimepicker" name="dtp_fnaPaciente" id="dtp_fnacPaciente">
                                                </div>
                                            </div>
                                        </div>

                                        <!-- GENERO -->
                                        <div class="col-sm-4">
                                            <div class="form-group gender-select">
                                                <label class="gen-label">Genero<span class="text-danger">*</span></label>
                                                <div class="form-check-inline">
                                                    <label class="form-check-label">
                                                        <input type="radio" name="rdb_genPaciente" id="rdb_genPaciente"  class="form-check-input" value="MASCULINO">Masculino
                                                    </label>
                                                </div>
                                                <div class="form-check-inline">
                                                    <label class="form-check-label">
                                                        <input type="radio" name="rdb_genPaciente" id="rdb_genPaciente" class="form-check-input" value="FEMENINO">Femenino
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- CELULAR -->
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Telefono</label>
                                                <input class="form-control" type="text" name="txt_telPaciente" id="txt_telPaciente">
                                            </div>
                                        </div>

                                        <div class="col-sm-12">
                                            <div class="row">
                                                <!-- EMAIL   -->
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>Email <span class="text-danger">*</span></label>
                                                        <input class="form-control" type="email" name="txt_emaPaciente" id="txt_emaPaciente">
                                                    </div>
                                                </div>

                                                <!-- DIRECCION -->
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>Direccion</label>
                                                        <input type="text" class="form-control" name="txt_dirPaciente" id="txt_Paciente">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- UBIGEO -->
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <!-- PROVINCIA -->
                                                <div class="col-sm-6 col-md-6 col-lg-4">
                                                    <div class="form-group">
                                                        <label>Provincia</label>
                                                        <input type="text" class="form-control" name="txt_proPaciente" id="txt_proPaciente">
                                                    </div>
                                                </div>
                                                <!-- DISTRITO -->
                                                <div class="col-sm-6 col-md-6 col-lg-4">
                                                    <div class="form-group">
                                                        <label>Distrito</label>
                                                        <input type="text" class="form-control" name="txt_disPaciente" id="txt_disPaciente">
                                                    </div>
                                                </div>
                                                <!-- LOCALIDAD -->
                                                <div class="col-sm-6 col-md-6 col-lg-4">
                                                    <div class="form-group">
                                                        <label>Localidad</label><span class="text-danger">*</span>
                                                        <input type="text" class="form-control" name="txt_locPaciente" id="txt_locPaciente">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- ESTADO -->
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label class="display-block">Estado</label>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="rdb_estPaciente" id="product_active" value="1" checked>
                                                    <label class="form-check-label" for="product_active">Activo</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="rdb_estPaciente" id="product_inactive" value="2">
                                                    <label class="form-check-label" for="product_inactive">Inactivo</label>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- AVATAR -->
                                        <div class="col-sm-9">
                                            <div class="form-group">
                                                <label>Avatar</label>
                                                <div class="profile-upload">
                                                    <div class="upload-img">
                                                        <img alt="" src="../assets/img/user.jpg">
                                                    </div>
                                                    <div class="upload-input">
                                                        <input type="file" class="form-control" name="upi_avaPaciente" id="upi_avaPaciente" value="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- BOTON REGISTRAR -->
                                    <div class="m-t-20 text-center">
                                        <button class="btn btn-primary submit-btn">Registrar Paciente</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

<?php
    include "footer.php";
    }else{
        header("Location: ../index.php");
    }
?>