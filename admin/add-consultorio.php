<?php 
    session_start();
    if(isset($_SESSION['administrator']))
    {
        include "header.php";
    ?>
            <!-- Agregar Consultorio -->
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <h4 class="page-title">Agregar Consultorio</h4>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <form action="../controller/consultorio.controller.php" method="post">
                                <!-- Nombre Consultorio -->
                                <div class="form-group">
                                    <label>Nombre del Consultorio</label>
                                    <input class="form-control" type="text" name="txt_nomConsultorio" id="txt_nomConsultorio">
                                </div>

                                <!-- Descripcion Consultorio -->
                                <div class="form-group">
                                    <label>Descripcion</label>
                                    <textarea cols="30" rows="4" class="form-control" name="txt_desConsultorio" id="txt_desConsultorio"></textarea>
                                </div>

                                <!-- Estado Consultorio -->
                                <!--<div class="form-group">
                                    <label class="display-block">Estado Consultorio</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="status" id="product_active" value="option1" checked>
                                        <label class="form-check-label" for="product_active">Activo</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="status" id="product_inactive" value="option2">
                                        <label class="form-check-label" for="product_inactive">Inactivo</label>
                                    </div>
                                </div>-->

                                <!-- Boton Crear -->
                                <div class="m-t-20 text-center">
                                    <button class="btn btn-primary submit-btn">Registrar Consultorio</button>
                                </div>
                            </form>
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