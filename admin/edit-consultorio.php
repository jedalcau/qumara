<?php
    session_start();
    if(isset($_SESSION['administrator']))
    {
    include "header.php";
    include "../model/model_Consultorio.php";

    //
    $idConsultorio = $_REQUEST['idConsultorio'];

    // Instanciamos la Clase Model Consultorio
    $model_Consultorio = new Consultorio();
    $data_Consultorio = $model_Consultorio->buscarConsultorio($idConsultorio);
?>
            <!-- Agregar Consultorio -->
            <div class="page-wrapper">
                <div class="content">
                    <!-- HEADER -->
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <h4 class="page-title">Modificar Consultorio</h4>
                        </div>
                    </div>
                    <!-- CONTENT -->
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <form action="../controller/consultorio.controller.php" method="post">
                                <!-- ID Consultorio -->
                                <div class="form-group">
                                    <label>ID Consultorio</label>
                                    <input class="form-control" type="text" name="txt_idConsultorio" id="txt_idConsultorio" readonly="" value="<?php echo $idConsultorio; ?>">
                                </div>

                                <!-- Nombre Consultorio -->
                                <div class="form-group">
                                    <label>Nombre Consultorio</label>
                                    <input class="form-control" type="text" name="txt_nomConsultorio" id="txt_nomConsultorio" value="<?php echo $data_Consultorio['nomConsultorio']; ?>">
                                </div>

                                <!-- Descripcion Consultorio -->
                                <div class="form-group">
                                    <label>Descripcion</label>
                                    <textarea cols="30" rows="4" class="form-control" name="txt_desConsultorio" id="txt_desConsultorio"><?php echo $data_Consultorio['desConsultorio']; ?></textarea>
                                </div>

                                <!-- Estado Consultorio -->
                                <div class="form-group">
                                    <label class="display-block">Estado</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="status" id="product_active" value="1" checked>
                                        <label class="form-check-label" for="product_active">Activo</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="status" id="product_inactive" value="0">
                                        <label class="form-check-label" for="product_inactive">Inactivo</label>
                                    </div>
                                </div>

                                <!-- Boton Crear -->
                                <div class="m-t-20 text-center">
                                    <button class="btn btn-primary submit-btn">Guardar Consultorio</button>
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
