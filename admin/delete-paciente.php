<?php
session_start();
if(isset($_SESSION['administrator']))
{
    include "header.php";
    require "../model/paciente.model.php";

    $idpac = $_REQUEST['idpac'];
    
    $pacientes = new Pacientes();    
    @$mensaje = $_REQUEST['msg'];
    $datos = $pacientes->SoloPaciente($idpac);
    # idpac,dni,nombre,apellidos,email,fecnac,sexo,ciudad
    #$res = 
?>

<div class="page-wrapper">
    <div class="content">
        <div class="row">
            <div class="col-sm-4 col-3">
                <h4 class="page-title">Eliminar Paciente</h4>
            </div>
            
        </div>

        <div class="row">
            <div class="col-sm-4 col-3">
                
                <?php
                if($mensaje == ""){
                    $mensaje="";
                }
                if($mensaje == 1){
                    echo "<div class='alert alert-success alert-dismissible fade show' role='alert'>
                                                        <strong>Registro Exitoso!</strong>
                                                        <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                                                        <span aria-hidden='true'>&times;</span>
                                                        </button>
                                                </div>";
                }
                if($mensaje == 2){
                    echo "<div class='alert alert-danger alert-dismissible fade show' role='alert'>
                                                    <strong>Error!</strong> Datos DUPLICADOS!.
                                                    <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                                                    <span aria-hidden='true'>&times;</span>
                                                    </button>
                                            </div>";
                }
                ?>
            </div>
            
        </div>

        <div class="row">
            <div class="col-sm-4 col-12">
            <form>
              <div class="form-group row">
                <label for="nombre" class="col-sm-4 col-form-label">Nombre:  </label>
                <div class="col-sm-8">
                  <input type="text" readonly class="form-control-plaintext" id="nombre" value="<?php echo $datos['nombre']."  ".$datos['apellidos'];?>">
                </div>
              </div>
              <div class="form-group row">
                <label for="dni" class="col-sm-4 col-form-label">DNI</label>
                <div class="col-sm-6">
                  <input type="text" readonly class="form-control-plaintext" id="" placeholder="" value="<?php echo $datos['dni']; ?>">
                </div>
              </div>
              <div class="form-group row">
                <label for="dni" class="col-sm-2 col-form-label">Otros</label>
                <div class="col-sm-10">
                  <input type="text" readonly class="form-control-plaintext" id="" placeholder="" value="<?php echo $datos['email']." - ".$datos['sexo']; ?>">
                </div>
              </div>
              <div class="form-group row">
                <label for="dni" class="col-sm-8">Desea Eliminar el registro?</label>
                <div class="col-sm-6">
                  <a class="btn btn-success" href="controller1/delete-patient.php?idpac=<?php echo $idpac;?>">SI</a>
                  <a class="btn btn-danger" href="paciente.php">NO</a>
                </div>
              </div>
            </form>
            </div>
        </div>
    </div>
    
    
</div>


<?php
include "footer.html";
}else{
header("Location: ../index.html");
}
?>

