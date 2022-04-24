<?php
    session_start();
    if(isset($_SESSION['administrator']))
    {
    include "header.php";
    include "../../model/model_Paciente.php";
    //
    $idPac = $_REQUEST['idPac'];
    // Instaciamos clase
    $model_Paciente = new Paciente();
    $data_Paciente = $model_Paciente->buscarPacientes($idPac);
?>
            <!-- Modificar Paciente -->
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <h4 class="page-title">Modificar Paciente</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <div class="card-box">
                                <h4 class="card-title">Datos del Paciente</h4>
                                <form action="../../controller/controller_edit_Paciente.php" method="post">
                                    <div class="row">
                                        <!-- ID PAciente -->
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label>ID Paciente</label>
                                                <input class="form-control" type="text" name="txt_idPaciente" id="txt_idPaciente" readonly="" value="<?php echo $idPac; ?>">
                                            </div>
                                        </div>
                                        <!-- DNI -->
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label>DNI <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="txt_dniPaciente" id="txt_dniPaciente" readonly value="<?php echo $data_Paciente['dniPac']; ?>">
                                            </div>
                                        </div>
                                        <!-- NOMBRES -->
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Nombres <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="txt_nomPaciente" id="txt_nomPaciente" value="<?php echo $data_Paciente['nomPac']; ?>">
                                            </div>
                                        </div>
                                        <!-- APELLIDOS -->
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Apellidos</label><span class="text-danger">*</span>
                                                <input class="form-control" type="text" name="txt_apePaciente" id="txt_apePaciente" value="<?php echo $data_Paciente['apePac']; ?>">
                                            </div>
                                        </div>
                                        <!-- FECHA NACIMIENTO -->
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label>Fecha de Nacimiento</label><span class="text-danger">*</span>
                                                <div class="cal-icon">
                                                    <input type="text" class="form-control datetimepicker" name="dtp_fnaPaciente" id="dtp_fnacPaciente" value="<?php echo $data_Paciente['fnaPac']; ?>">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- GENERO -->
                                        <div class="col-sm-3">
                                            <div class="form-group gender-select">
                                                <label class="gen-label">Genero<span class="text-danger">*</span></label>
                                                <?php if($data_Paciente['genPac'] == 'MASCULINO'){?>
                                                <div class="form-check-inline">
                                                    <label class="form-check-label">
                                                        <input type="radio" name="rdb_genPaciente" id="rdb_genPaciente"  class="form-check-input" value="<?php echo $data_Paciente['genPac']; ?>>" checked>Masculino
                                                    </label>
                                                </div>
                                                <div class="form-check-inline">
                                                    <label class="form-check-label">
                                                        <input type="radio" name="rdb_genPaciente" id="rdb_genPaciente" class="form-check-input" value="FEMENINO">Femenino
                                                    </label>
                                                </div>
                                                <?php }else{ ?>
                                                <div class="form-check-inline">
                                                    <label class="form-check-label">
                                                        <input type="radio" name="rdb_genPaciente" id="rdb_genPaciente"  class="form-check-input" value="MASCULINO">Masculino
                                                    </label>
                                                </div>
                                                <div class="form-check-inline">
                                                    <label class="form-check-label">
                                                        <input type="radio" name="rdb_genPaciente" id="rdb_genPaciente" class="form-check-input" value="<?php echo $data_Paciente['genPac']; ?>" checked>Femenino
                                                    </label>
                                                </div>
                                                <?php }?>
                                            </div>
                                        </div>

                                        <!-- EMAIL   -->
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Email <span class="text-danger">*</span></label>
                                                <input class="form-control" type="email" name="txt_emaPaciente" id="txt_emaPaciente" value="<?php echo $data_Paciente['emaPac']; ?>">
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <!-- CELULAR -->
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label>Celular</label>
                                                        <input class="form-control" type="text" name="txt_telPaciente" id="txt_telPaciente" value="<?php echo $data_Paciente['telPac']; ?>">
                                                    </div>
                                                </div>
                                                <!-- DIRECCION -->
                                                <div class="col-sm-9">
                                                    <div class="form-group">
                                                        <label>Direccion</label>
                                                        <input type="text" class="form-control" name="txt_dirPaciente" id="txt_Paciente" value="<?php echo $data_Paciente['dirPac']; ?>">
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
                                                        <input type="text" class="form-control" name="txt_proPaciente" id="txt_proPaciente" value="<?php echo $data_Paciente['proPac']; ?>">
                                                    </div>
                                                </div>
                                                <!-- DISTRITO -->
                                                <div class="col-sm-6 col-md-6 col-lg-4">
                                                    <div class="form-group">
                                                        <label>Distrito</label>
                                                        <input type="text" class="form-control" name="txt_disPaciente" id="txt_disPaciente" value="<?php echo $data_Paciente['disPac']; ?>">
                                                    </div>
                                                </div>
                                                <!-- LOCALIDAD -->
                                                <div class="col-sm-6 col-md-6 col-lg-4">
                                                    <div class="form-group">
                                                        <label>Localidad</label><span class="text-danger">*</span>
                                                        <input type="text" class="form-control" name="txt_locPaciente" id="txt_locPaciente" value="<?php echo $data_Paciente['locPac']; ?>">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- ESTADO -->
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label class="display-block">Estado</label>

                                                <!-- Activo -->
                                                <?php if ($data_Paciente['estPac'] == '1'){ ?>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="rdb_estPaciente" id="product_active" value="<?php echo $data_Paciente['estPac']; ?>" checked>
                                                    <label class="form-check-label" for="product_active">Activo</label>
                                                </div>

                                                <!-- Inactivo -->
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="rdb_estPaciente" id="product_inactive" value="2">
                                                    <label class="form-check-label text-danger" for="product_inactive">Inactivo</label>
                                                </div>
                                                <?php }else{ ?>
                                                <!-- Activo -->
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="rdb_estPaciente" id="product_active" value="1">
                                                    <label class="form-check-label" for="product_active">Activo</label>
                                                </div>
                                                <!-- Inactivo -->
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="rdb_estPaciente" id="product_inactive" value="<?php echo $data_Paciente['estPac']; ?>" checked>
                                                    <label class="form-check-label text-danger" for="product_inactive">Inactivo</label>
                                                </div>
                                                <?php } ?>
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
                                        <button class="btn btn-primary submit-btn">Guardar Paciente</button>
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