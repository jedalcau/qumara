<?php
    session_start();
    if(isset($_SESSION['usuario'])){
        include "header.php";
//        require "../model/consultas.model.php";
//        $model_consulta = new Consultas();
        //$citas = $consulta->Citas5();

        // TOTALES
//        $total_atenciones = $model_consulta->Contar_atenciones();
//        $total_pacientes = $model_consulta->Contar_Pacientes();
//        $total_personal_salud = $model_consulta->Contar_PersonalSalud();
//        $total_consultorios = $model_consulta->Contar_Consultorios();

        //DATA LISTAS
        //$lista_pacientes = $model_consulta->Listar_Pacientes();
//        $lista_personal_salud = $model_consulta->Listar_PersonalSalud();
        //$lista_atencion_paciente = $model_consulta->Listar_AtencionPaciente();

?>
            <div class="page-wrapper">
                <div class="content">
                    <!-- TOTAL RECURSOS -->
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                            <div class="dash-widget">
                                <span class="dash-widget-bg1"><i class="fa fa-stethoscope" aria-hidden="true"></i></span>
                                <div class="dash-widget-info text-right">
                                    <h3><?php echo $total_atenciones['total'];?></h3>
                                    <span class="widget-title1">Atenciones<i class="fa fa-check" aria-hidden="true"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                            <div class="dash-widget">
                                <span class="dash-widget-bg2"><i class="fa fa-user-o"></i></span>
                                <div class="dash-widget-info text-right">
                                    <h3><?php echo $total_pacientes['total'];?></h3>
                                    <span class="widget-title2">Pacientes <i class="fa fa-check" aria-hidden="true"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                            <div class="dash-widget">
                                <span class="dash-widget-bg3"><i class="fa fa-user-md" aria-hidden="true"></i></span>
                                <div class="dash-widget-info text-right">
                                    <h3><?php echo $total_personal_salud['total'];?></h3>
                                    <span class="widget-title3">Pers. de Salud <i class="fa fa-check" aria-hidden="true"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                            <div class="dash-widget">
                                <span class="dash-widget-bg4"><i class="fa fa-heartbeat" aria-hidden="true"></i></span>
                                <div class="dash-widget-info text-right">
                                    <h3><?php echo $total_consultorios['total'];?></h3>
                                    <span class="widget-title4">Consultorios <i class="fa fa-check" aria-hidden="true"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- CUADROS -->
                    <!--<div class="row">
                        <div class="col-12 col-md-6 col-lg-6 col-xl-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="chart-title">
                                        <h4>Patient Total</h4>
                                        <span class="float-right"><i class="fa fa-caret-up" aria-hidden="true"></i> 15% Higher than Last Month</span>
                                    </div>
                                    <canvas id="linegraph"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6 col-lg-6 col-xl-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="chart-title">
                                        <h4>Patients In</h4>
                                        <div class="float-right">
                                            <ul class="chat-user-total">
                                                <li><i class="fa fa-circle current-users" aria-hidden="true"></i>ICU</li>
                                                <li><i class="fa fa-circle old-users" aria-hidden="true"></i> OPD</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <canvas id="bargraph"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>-->

                    <!-- BOX APPOINTMENT AND CONSULTANT LIST -->
                    <div class="row">
                        <!-- APPOINTMENT LIST -->
                        <div class="col-12 col-md-6 col-lg-8 col-xl-8">
                            <div class="card">
                                <!-- HEADER TITLE -->
                                <div class="card-header">
                                    <h4 class="card-title d-inline-block">LISTA DE ATENCIONES</h4> <a href="" class="btn btn-primary float-right">Ver Lista</a>
                                </div>
                                <div class="card-body p-0">
                                    <div class="table-responsive">

                                            <table class="table mb-0">
                                                <!--<thead class="d-none">
                                                <tr>
                                                    <th>Nombre Paciente</th>
                                                    <th>Ciudad</th>
                                                    <th>Telefono</th>
                                                    <th class="text-right">Estado</th>
                                                </tr>
                                                </thead>-->
                                                <tbody>
                                                <tr>
                                                    <td style="min-width: 200px;">
                                                        <a class="avatar" href="profile.html">B</a>
                                                        <h2><a href="#">a<span>5555</span></a></h2>
                                                    </td>
                                                    <td>
                                                        <h5 class="time-title p-0">Ciudad</h5>
                                                        <p><a/p>
                                                    </td>
                                                    <td>
                                                        <h5 class="time-title p-0">Celular</h5>
                                                        <p>ss</p>
                                                    </td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-outline-primary take-btn">Ver Paciente</a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- BOX PATIENT AND DOCTORS -->
                    <div class="row">
                        <!-- PATIENTS LIST -->
                        <div class="col-12 col-md-6 col-lg-8 col-xl-8">
                            <div class="card">
                                <!-- HEADER TITLE -->
                                <div class="card-header">
                                    <h4 class="card-title d-inline-block">PACIENTES REGISTRADOS</h4> <a href="../../admin/paciente.php" class="btn btn-primary float-right">Ver Lista</a>
                                </div>
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                            <table class="table mb-0">
                                                <!--<thead class="d-none">
                                                <tr>
                                                    <th>Nombre Paciente</th>
                                                    <th>Ciudad</th>
                                                    <th>Telefono</th>
                                                    <th class="text-right">Estado</th>
                                                </tr>
                                                </thead>-->
                                                <tbody>
                                                    <tr>
                                                        <td style="min-width: 200px;">
                                                            <a class="avatar" href="profile.html">B</a>
                                                            <h2><a href="profile.html">paciente<span></span></a></h2>
                                                        </td>
                                                        <td>
                                                            <h5 class="time-title p-0">Ciudad</h5>
                                                            <p></p>
                                                        </td>
                                                        <td>
                                                            <h5 class="time-title p-0">Celular</h5>
                                                            <p></p>
                                                        </td>
                                                        <td class="text-right">
                                                            <a href="#" class="btn btn-outline-primary take-btn">Ver Paciente</a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- PERSONAL DE SALUD LIST -->
                        <div class="col-12 col-md-6 col-lg-4 col-xl-4">
                            <div class="card member-panel">
                                <div class="card-header bg-white">
                                    <h4 class="card-title mb-0">PERSONAL DE SALUD</h4>
                                </div>
                                <div class="card-body">
                                    <ul class="contact-list">
                                        <?php $i=1; while($fila=$lista_personal_salud->fetch_array(MYSQLI_ASSOC)){?>
                                        <li>
                                            <div class="contact-cont">
                                                <div class="float-left user-img m-r-10">
                                                    <a href="#"><img src="../../admin/assets/img/user.jpg" alt="" class="w-40 rounded-circle"><span class="status offline"></span></a>
                                                </div>
                                                <div class="contact-info">
                                                    <a href="profile.html" title="John Doe"><span class="contact-name text-ellipsis"><?php echo $fila['doctor'];?></span></a>
                                                    <span class="contact-date"><?php echo $fila['profesion'];?></span>
                                                </div>
                                            </div>
                                        </li>
                                        <?php $i++;}?>
                                    </ul>
                                </div>
                                <div class="card-footer text-center bg-white">
                                    <a href="personal_salud.php" class="text-muted">Ver Lista de Personal de Salud</a>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!--<div class="row">
                        <!-ATENCIONES LIST
                        <div class="col-12 col-md-6 col-lg-8 col-xl-8">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title d-inline-block">Upcoming Appointments</h4> <a href="appointments.html" class="btn btn-primary float-right">View all</a>
                                </div>
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                        <table class="table mb-0">
                                            <thead class="d-none">
                                            <tr>
                                                <th>Patient Name</th>
                                                <th>Doctor Name</th>
                                                <th>Timing</th>
                                                <th class="text-right">Status</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td style="min-width: 200px;">
                                                    <a class="avatar" href="profile.html">B</a>
                                                    <h2><a href="profile.html">Bernardo Galaviz <span>New York, USA</span></a></h2>
                                                </td>
                                                <td>
                                                    <h5 class="time-title p-0">Appointment With</h5>
                                                    <p>Dr. Cristina Groves</p>
                                                </td>
                                                <td>
                                                    <h5 class="time-title p-0">Timing</h5>
                                                    <p>7.00 PM</p>
                                                </td>
                                                <td class="text-right">
                                                    <a href="appointments.html" class="btn btn-outline-primary take-btn">Take up</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="min-width: 200px;">
                                                    <a class="avatar" href="profile.html">B</a>
                                                    <h2><a href="profile.html">Bernardo Galaviz <span>New York, USA</span></a></h2>
                                                </td>
                                                <td>
                                                    <h5 class="time-title p-0">Appointment With</h5>
                                                    <p>Dr. Cristina Groves</p>
                                                </td>
                                                <td>
                                                    <h5 class="time-title p-0">Timing</h5>
                                                    <p>7.00 PM</p>
                                                </td>
                                                <td class="text-right">
                                                    <a href="appointments.html" class="btn btn-outline-primary take-btn">Take up</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="min-width: 200px;">
                                                    <a class="avatar" href="profile.html">B</a>
                                                    <h2><a href="profile.html">Bernardo Galaviz <span>New York, USA</span></a></h2>
                                                </td>
                                                <td>
                                                    <h5 class="time-title p-0">Appointment With</h5>
                                                    <p>Dr. Cristina Groves</p>
                                                </td>
                                                <td>
                                                    <h5 class="time-title p-0">Timing</h5>
                                                    <p>7.00 PM</p>
                                                </td>
                                                <td class="text-right">
                                                    <a href="appointments.html" class="btn btn-outline-primary take-btn">Take up</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="min-width: 200px;">
                                                    <a class="avatar" href="profile.html">B</a>
                                                    <h2><a href="profile.html">Bernardo Galaviz <span>New York, USA</span></a></h2>
                                                </td>
                                                <td>
                                                    <h5 class="time-title p-0">Appointment With</h5>
                                                    <p>Dr. Cristina Groves</p>
                                                </td>
                                                <td>
                                                    <h5 class="time-title p-0">Timing</h5>
                                                    <p>7.00 PM</p>
                                                </td>
                                                <td class="text-right">
                                                    <a href="appointments.html" class="btn btn-outline-primary take-btn">Take up</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="min-width: 200px;">
                                                    <a class="avatar" href="profile.html">B</a>
                                                    <h2><a href="profile.html">Bernardo Galaviz <span>New York, USA</span></a></h2>
                                                </td>
                                                <td>
                                                    <h5 class="time-title p-0">Appointment With</h5>
                                                    <p>Dr. Cristina Groves</p>
                                                </td>
                                                <td>
                                                    <h5 class="time-title p-0">Timing</h5>
                                                    <p>7.00 PM</p>
                                                </td>
                                                <td class="text-right">
                                                    <a href="appointments.html" class="btn btn-outline-primary take-btn">Take up</a>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>-->

                    <div class="row">
                        <!-- HOSPITAL MANAGEMENT -->
                        <!--<div class="col-12 col-md-6 col-lg-4 col-xl-4">
                            <div class="hospital-barchart">
                                <h4 class="card-title d-inline-block">Hospital Management</h4>
                            </div>
                            <div class="bar-chart">
                                <div class="legend">
                                    <div class="item">
                                        <h4>Level1</h4>
                                    </div>

                                    <div class="item">
                                        <h4>Level2</h4>
                                    </div>
                                    <div class="item text-right">
                                        <h4>Level3</h4>
                                    </div>
                                    <div class="item text-right">
                                        <h4>Level4</h4>
                                    </div>
                                </div>
                                <div class="chart clearfix">
                                    <div class="item">
                                        <div class="bar">
                                            <span class="percent">16%</span>
                                            <div class="item-progress" data-percent="16">
                                                <span class="title">OPD Patient</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="bar">
                                            <span class="percent">71%</span>
                                            <div class="item-progress" data-percent="71">
                                                <span class="title">New Patient</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="bar">
                                            <span class="percent">82%</span>
                                            <div class="item-progress" data-percent="82">
                                                <span class="title">Laboratory Test</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="bar">
                                            <span class="percent">67%</span>
                                            <div class="item-progress" data-percent="67">
                                                <span class="title">Treatment</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="bar">
                                            <span class="percent">30%</span>
                                            <div class="item-progress" data-percent="30">
                                                <span class="title">Discharge</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>-->
                    </div>
                </div>

                <!-- INICIO VENTANA CHAT-->
                <!-- <div class="notification-box">
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
                </div> -->
                <!-- FIN -->
            </div>
<?php
    include "footer.php";
    }else{
	    header("Location: ../index.html");
    }
?>