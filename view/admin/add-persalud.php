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
                            <h4 class="page-title">Registrar Personal de Salud</h4>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <div class="card-box">
                                <form>
                                    <!-- Box Datos Personal de Salud -->
                                    <h4 class="card-title">Datos del Personal</h4>
                                    <div class="row">
                                        <!-- Nombres y Apellidos -->
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <!-- Nombres -->
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>Nombres <span class="text-danger">*</span></label>
                                                        <input class="form-control" type="text" name="txt_nomPsalud" id="txt_nomPsalud">
                                                    </div>
                                                </div>

                                                <!-- Apellidos -->
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>Apellidos<span class="text-danger">*</span></label>
                                                        <input class="form-control" type="text" name="txt_apePsalud" id="txt_apePsalud">
                                                    </div>
                                                </div>

                                                <!-- Dni -->
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label>Dni <span class="text-danger">*</span></label>
                                                        <input class="form-control" type="text" name="txt_dniPsalud">
                                                    </div>
                                                </div>

                                                <!-- Fecha de NAcimiento -->
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>Fecha Nacimiento<span class="text-danger"> *</span></label>
                                                        <div class="cal-icon">
                                                            <input type="text" class="form-control datetimepicker" name="dtp_fnaPsalud">
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Genero -->
                                                <div class="col-sm-3">
                                                    <div class="form-group gender-select">
                                                        <label class="gen-label">Genero<span class="text-danger"> *</span></label>
                                                        <div class="form-check-inline">
                                                            <label class="form-check-label">
                                                                <input type="radio" name="rdb_genPaciente" id="rdb_genPsalud"  class="form-check-input" value="MASCULINO">Masculino
                                                            </label>
                                                        </div>
                                                        <div class="form-check-inline">
                                                            <label class="form-check-label">
                                                                <input type="radio" name="rdb_genPaciente" id="rdb_genPsalud" class="form-check-input" value="FEMENINO">Femenino
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Profesion -->
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <!-- Nombres -->
                                                <div class="col-sm-9">
                                                    <div class="form-group">
                                                        <label>Profesion <span class="text-danger">*</span></label>
                                                        <input class="form-control" type="text">
                                                    </div>
                                                </div>
                                                <!-- Colegiatura -->
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label>Nª Colegiatura <span class="text-danger">*</span></label>
                                                        <input class="form-control" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- UBIGEO -->
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <label>Direccion</label>
                                                        <input type="text" class="form-control ">
                                                    </div>
                                                </div>

                                                <!-- Departamento -->
                                                <div class="col-sm-6 col-md-6 col-lg-4">
                                                    <div class="form-group">
                                                        <label>Departamento</label>
                                                        <input type="text" class="form-control" name="txt_depPsa" id="txt_depPsa">
                                                    </div>
                                                </div>

                                                <!-- Provincia -->
                                                <div class="col-sm-6 col-md-6 col-lg-4">
                                                    <div class="form-group">
                                                        <label>Provincia</label>
                                                        <input type="text" class="form-control" name="txt_proPsa" id="txt_proPsa">
                                                    </div>
                                                </div>

                                                <!-- Distrito -->
                                                <div class="col-sm-6 col-md-6 col-lg-4">
                                                    <div class="form-group">
                                                        <label>Distrito</label>
                                                        <input type="text" class="form-control" name="txt_disPsa" id="txt_disPsa">
                                                    </div>
                                                </div>

                                                <!-- Telefono -->
                                                <div class="col-sm-6 col-md-6 col-lg-2">
                                                    <div class="form-group">
                                                        <label>Telefono</label>
                                                        <input type="text" class="form-control" name="txt_telPsa" id="txt_emaPsa">
                                                    </div>
                                                </div>

                                                <!-- Email -->
                                                <div class="col-sm-6 col-md-6 col-lg-4">
                                                    <div class="form-group">
                                                        <label>Email</label>
                                                        <input type="text" class="form-control" name="txt_emaPsa" id="txt_emaPsa">
                                                    </div>
                                                </div>

                                                <!-- Avatar -->
                                                <div class="col-sm-6 col-md-6 col-lg-6">
                                                    <div class="form-group">
                                                        <label>Avatar</label>
                                                        <div class="profile-upload">
                                                            <div class="upload-img">
                                                                <img alt="" src="../assets/img/user.jpg" >
                                                            </div>
                                                            <div class="upload-input">
                                                                <input type="file" class="form-control" name="upi_avaPsalud" id="upi_avaPsalud">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <!-- ESTADO -->
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label class="display-block">Estado <span class="text-danger"> *</span></label>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="rdb_estPsalud" id="rdb_estPsalud_active" value="1" checked>
                                                    <label class="form-check-label" for="rdb_estPsalud_active">Activo</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="rdb_estPsalud" id="rdb_estPsalud_inactive" value="2">
                                                    <label class="form-check-label" for="rdb_estPsalud_inactive">Inactivo</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Box Datos de Acceso -->
                                    <h4 class="card-title">Datos de Acceso</h4>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>Usuario <span class="text-danger"> *</span></label>
                                                        <input class="form-control" type="text">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>Clave</label>
                                                        <input class="form-control" type="password">
                                                    </div>
                                                </div>

                                                <!-- ESTADO -->
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label class="display-block">Estado</label>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="rdb_estAcceso" id="rdb_estAcceso_active" value="1" checked>
                                                            <label class="form-check-label" for="rdb_estAcceso_active">Activo</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="rdb_estAcceso" id="rdb_estAcceso_inactive" value="2">
                                                            <label class="form-check-label" for="rdb_estAcceso_inactive">Inactivo</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>




                                    <!-- Botn Registrar Personal de Salud -->
                                    <div class="m-t-20 text-center">
                                        <button class="btn btn-primary submit-btn">Create Doctor</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="notification-box">
                    <div class="msg-sidebar notifications msg-noti">
                        <div class="topnav-dropdown-header">
                            <span>Messages</span>
                        </div>
                        <div class="drop-scroll msg-list-scroll" id="msg_list">
                            <ul class="list-box">
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">R</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">Richard Miles </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item new-message">
                                            <div class="list-left">
                                                <span class="avatar">J</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">John Doe</span>
                                                <span class="message-time">1 Aug</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">T</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author"> Tarah Shropshire </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">M</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">Mike Litorus</span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">C</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author"> Catherine Manseau </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">D</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author"> Domenic Houston </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">B</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author"> Buster Wigton </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">R</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author"> Rolland Webber </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">C</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author"> Claire Mapes </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">M</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">Melita Faucher</span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">J</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">Jeffery Lalor</span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">L</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">Loren Gatlin</span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">T</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">Tarah Shropshire</span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="topnav-dropdown-footer">
                            <a href="chat.html">See all messages</a>
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
