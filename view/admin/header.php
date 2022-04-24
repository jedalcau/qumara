<?php 
    session_start();
    if(isset($_SESSION['administrator'])){
?>
<!DOCTYPE html>
<html lang="es">
    <head>
        <!-- METAS -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <!-- TITLE -->
        <title>Qumara | Sistema de Gestion de Formatos de Registro Clinico de Usuarios | PIAS</title>

        <!-- BOOTSTRAP -->
        <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.ico">
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">

    </head>

    <body>
        <div class="main-wrapper">
            <!-- HEADER -->
            <div class="header">

                <!-- Logo Qumara -->
                <div class="header-left">
                    <a href="index.php" class="logo">
                        <img src="../assets/img/logo.png" width="35" height="35" alt="">
                        <span>Qumara</span>
                    </a>
                </div>
                <a id="toggle_btn" href="javascript:void(0);"><i class="fa fa-bars"></i></a>
                <a id="mobile_btn" class="mobile_btn float-left" href="#sidebar"><i class="fa fa-bars"></i></a>
                <!-- Fin Logo Qumara -->

                <!-- SECCION MENU USUARIO -->
                <ul class="nav user-menu float-right">

                    <!-- USER MENU -->
                    <li class="nav-item dropdown has-arrow">
                        <a href="#" class="dropdown-toggle nav-link user-link" data-toggle="dropdown">
                            <span class="user-img">
                                <img class="rounded-circle" src="../avatar/admin.jpg" width="24">
                                <span class="status online"></span>
                            </span>
                            <span>Administrador</span>
                        </a>
                        <div class="dropdown-menu">
                            <!--<a class="dropdown-item" href="profile.html">Perfil</a>
                            <a class="dropdown-item" href="edit-profile.html">Editar Perfil</a>
                            <a class="dropdown-item" href="settings.html">Configuraciones</a>-->
                            <a class="dropdown-item" href="../../controller/session_close.php">Cerrar Sesion</a>
                        </div>
                    </li>
                </ul>

                <!-- USER MOBILE MENU -->
                <div class="dropdown mobile-user-menu float-right">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <!--<a class="dropdown-item" href="profile.html">Perfil</a>
                            <a class="dropdown-item" href="edit-profile.html">Editar Perfil</a>
                            <a class="dropdown-item" href="settings.html">Configuraciones</a>-->
                        <a class="dropdown-item" href="../../controller/session_close.php">Cerrar Sesion</a>
                    </div>
                </div>
            </div>
            <!-- FIN HEADER -->

            <!-- INICIO MENU PRINCIPAL -->
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <!-- #region MENU PERFIL ADMINISTRADOR -->
                        <ul>
                            <li class="menu-title">Principal</li>

                            <!-- DASHBOARD -->
                            <li>
                                <a href="index.php"><i class="fa fa-home"></i> <span>Inicio</span></a>
                            </li>


                            <!-- PERSONAL LIST -->
                            <li>
                                <a href="persalud.php"><i class="fa fa-user-md"></i> <span>Personal</span></a>
                            </li>

                            <!-- PATIENT LIST -->
                            <li>
                                <a href="paciente.php"><i class="fa fa-wheelchair"></i> <span>Pacientes</span></a>
                            </li>

                            <!-- HISTORY LIST -->
                            <li>
                                <a href="historias.php"><i class="fa fa-edit"></i> <span>Historias</span></a>
                            </li>

                            <!-- CONSULTANT LIST -->
                            <li>
                                <a href="consultorio.php"><i class="fa fa-hospital-o"></i> <span>Consultorios</span></a>
                            </li>

                            <!-- JOB LIST -->
                            <li>
                                <a href="employees.php"><i class="fa fa-user"></i> <span>Trabajadores</span></a>
                            </li>

                            <!-- REPOST LIST -->
                            <li>
                                <a href="reportes.php"><i class="fa fa-book"></i> <span> Reportes </span></a>
                            </li>
                        </ul>
                        <!-- #endregion MENU PERFIL ADMINISTRADOR -->

                        <!-- #region MENU PERFIL PERSONAL DE SALUD -->
                        <ul>
                            <!-- MENU PERSONALA DE SALUD -->
                            <li class="menu-title">Personal de Salud</li>

                            <!-- CITAS -->
                            <li>
                                <a href="../../admin/citas.php"><i class="fa fa-calendar"></i> <span>Citas</span></a>
                            </li>

                            <!-- PATIENT LIST -->
                            <li>
                                <a href="paciente.php"><i class="fa fa-wheelchair"></i> <span>Pacientes</span></a>
                            </li>

                            <!-- HISTORY LIST -->
                            <li>
                                <a href="../historias.php"><i class="fa fa-edit"></i> <span>Historias</span></a>
                            </li>

                            <!-- REPOST LIST -->
                            <li>
                                <a href="../reportes.php"><i class="fa fa-book"></i> <span> Reportes </span></a>
                            </li>
                        </ul>
                        <!-- #endregion MENU PERSONAL DE SALUD -->

                        <!-- #region MENU RECEPCIONISTA -->
                        <ul>
                            <li class="menu-title">Recepcionista</li>
                            <!-- APPOINTMENT LIST -->
                            <li>
                                <a href="../citas.php"><i class="fa fa-calendar"></i> <span>Citas</span></a>
                            </li>

                            <!-- PATIENT LIST -->
                            <li class="submenu">
                                <a href="paciente.php"><i class="fa fa-wheelchair"></i> <span>Pacientes</span></a>
                            </li>

                            <!-- REPORTS LIST -->
                            <li>
                                <a href="../../admin/reportes.php"><i class="fa fa-book"></i> <span> Reportes </span></a>
                            </li>

                        </ul>
                        <!-- #endregion MENU PERSONAL DE SALUD -->

                        <!-- #region DEV -->
                        <ul>
                            <!-- DEVELOPER -->
                            <li class="menu-title text-center">Desarrollado por:</li>
                            <li>
                                <a href="#"><i class="fa fa-asterisk"></i> <span>Jose Angeles Aliaga</span></a>
                                <a href="https://pe.linkedin.com/in/jedalcau" target="_blank"><i class="fa fa-asterisk"></i> <span>Jesus D. Alanoca</span></a>
                            </li>

                        </ul>
                        <!-- #endregion DEV -->

                    </div>
                </div>
            </div>
            <!-- FIN MENU PRINCIPAL -->

        <!-- JS -->
        <!--<script type="text/javascript">
            $(document).ready(function(){
                $('#sidebar-menu li').on('click', function(){
                    //alert("Activado");
                    $('li.active').removeClass('active');
                    $(this).addClass('active');
                });
            });
        </script>-->
<?php
    }else{
    header("Location: ../../index.php");
    }
?>