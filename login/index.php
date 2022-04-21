<?php
?>
<!DOCTYPE html>
<html lang="es">
<!-- HEAD -->
<head>
    <!-- Metas -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="robots" content="noindex">
    <title>Qumara | Sistema de Gestion de Formatos de Registro Clinico de Usuarios | PIAS</title>
    <!-- Bootstrap -->
    <link rel="shortcut icon" type="image/x-icon" href="../view/assets/img/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../view/assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../view/assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../view/assets/css/style.css">

    <!--[if lt IE 9]>
    <script src="../view/assets/js/html5shiv.min.js"></script>
    <script src="../view/assets/js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        function Acepto(){
            var combo = document.getElementById("chkacepto");
            var boton = document.getElementById("btnIngresar");

            if(combo.checked == true){
                /*Activado*/
                document.getElementById("btnIngresar").disabled = false;
            }else{
                /*Desactivado*/
                document.getElementById("btnIngresar").disabled = true;
                boton.className += " inactivo";
            }
        }
    </script>
    <style type="text/css">
        body {
            height: 100vh;
            background: url("../view/assets/img/fondo.jpg") 50% fixed;
            background-size: cover;
        }
    </style>
</head>
<!-- BODY -->
<body>
<div class="main-wrapper account-wrapper">
    <div class="account-page">
        <div class="account-center">
            <div class="account-box">
                <!-- Formulario  Login -->
                <form action="controller/login.controller.php" class="form-signin" method="post">
                    <div class="account-logo">
                        <img src="view/assets/img/logo-dark.png" id="logo">
                        <!--                                <h5 style="color: #009efb">proyecto</h5>-->
                        <H2 style="color: #009efb">Qumara</H2>
                    </div>
                    <div class="form-group">
                        <label>Usuario</label>
                        <input type="text" autofocus="" class="form-control" name="txtusuario">
                    </div>
                    <div class="form-group">
                        <label>Clave</label>
                        <input type="password" class="form-control" name="txtclave">
                    </div>
                    <div class="form-group text-right">
                        Acepto el <a href="acuerdo1.pdf" target="_blank">Acuerdo de Confidencialidad</a>
                        <input type="checkbox" name="chkacepto" id="chkacepto" onclick="Acepto()">
                    </div>
                    <div class="form-group text-right">
                        <a href="forgot-password.html">Olvidaste tu contraseña?</a>
                    </div>
                    <div class="form-group text-center">
                        <button type="submit" name="btnIngresar" id="btnIngresar" class="btn btn-primary account-btn inactivo" disabled="disabled">Acceder</button>
                    </div>
                </form>
            </div>
            <!-- DEVELOPER -->
            <div class="account-box">
                <div class="form-group">
                    <label>Desarrollado Por:</label>
                    <p class="text-center">Jose Luis Angeles Aliaga | Jesus David Alanoca Cauna</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- JS -->
<script src="view/assets/js/jquery-3.2.1.min.js"></script>
<script src="view/assets/js/popper.min.js"></script>
<script src="view/assets/js/bootstrap.min.js"></script>
<script src="view/assets/js/app.js"></script>
</body>
</html>
