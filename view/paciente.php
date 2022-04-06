<?php
session_start();
if(isset($_SESSION['iddoctor']))
{
	include "header.php";
	require "../model/paciente.model.php";

	@$dni      = $_REQUEST['txtdni'];
	@$apellido = $_REQUEST['txtapellido'];

	$pacientes = new Pacientes();
	
	
	@$mensaje = $_REQUEST['msg'];

	$record_per_page = 10;
	$pagina = '';
	if(isset($_GET["pagina"]))
	{
		$pagina = $_GET["pagina"];
	}
	else{
	 $pagina = 1;
	}

	$start_from = ($pagina-1)*$record_per_page;

	$res = $pacientes->Buscartodos($dni, $apellido,$start_from,$record_per_page);

	$total_paci = $pacientes->CantidadPacientes();


	#$query = "SELECT * FROM paciente order by idpac DESC LIMIT $start_from, $record_per_page";
	#$result = mysqli_query($conexion, $query);

?>

<div class="page-wrapper">
	<div class="content">
		<div class="row">
			<div class="col-sm-4 col-3">
				<h4 class="page-title">Pacientes </h4>
			</div>
			<div class="col-sm-8 col-9 text-right m-b-20">
				<a href="add-patient.php" class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Nuevo Paciente</a>
			</div>
		</div>

		<div class="row">
			
			<form class="form-inline">
				<div class="form-group mb-4">
					<div class="form-group">
                        <label>Buscar por DNI: </label>
                        <input class="form-control" type="text" name="txtdni" id="txtdni">
                    </div>
                    <div class="form-group">
                        <label>Buscar por Apellido: </label>
                        <input class="form-control" type="text" name="txtapellido" id="txtapellido">
                    </div>
				</div>
				<div class="form-group mb-4">
					<div class="form-group">
						<button class="btn btn-primary submit-btn" type="submit">Buscar</button>
					</div>
				</div>
			</form>
			
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
			<div class="col-md-12">
				<div class="table-responsive">
					<table class="table table-border table-striped custom-table mb-0">
						<thead>
							<tr>
								<th>Nombre</th>
								<th>Apellidos</th>
								<th>Distrito</th>
								<th>Direccion</th>
								<th>Telefono</th>
								<th>Email</th>
								<th class="text-right">Accion</th>
							</tr>
						</thead>
						<tbody>
							<?php
							$number=0;
							while ($fila = $res->fetch_array(MYSQLI_ASSOC)):
								$number++;
							?>
							<tr>
								<td><img width="28" height="28" src="assets/img/user.jpg" class="rounded-circle m-r-5" alt=""> <?php $fila['idpac']; echo $fila['nombre'];?></td>
								<td><?php echo $fila['apellidos']; ?></td>
								<td><?php echo $fila['distrito']; ?></td>
								<td><?php echo $fila['direccion']; ?></td>
								<td><?php echo $fila['telefono']; ?></td>
								<td><?php echo $fila['email']; ?></td>
								<td class="text-right">
									<div class="dropdown dropdown-action">
										<a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
										<div class="dropdown-menu dropdown-menu-right">
											<a class="dropdown-item" href="edit-patient.php?idpac=<?php echo $fila['idpac'];?>"><i class="fa fa-pencil m-r-5"></i> Editar</a>
										</div>
									</div>
								</td>
							</tr>
							<?php endwhile; ?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<?php

					    $page_result = $pacientes->Buscartodos2();
					    $total_records = $page_result->num_rows;
					    #echo "Total: ".$total_records;
					    $total_pages = ceil($total_records/$record_per_page);
					    $start_loop = $pagina;
					    $diferencia = $total_pages - $pagina;
					    if($diferencia <= 10)
					    {
					     $start_loop = $total_pages - 1;
					    }

					    $end_loop = $start_loop + 1;
					    if($pagina > 1)
					    {
					     	echo "<li class='page-item'><a class='page-link' href='paciente.php?pagina=1'>Primera</a></li>";
					     	echo "<li class='page-item'><a class='page-link' href='paciente.php?pagina=".($pagina - 1)."'><<</a></li>";
					     	
					    }
					    for($i=$start_loop; $i<=$end_loop; $i++)
					    {     
					     echo "<li class='page-item'><a class='page-link' href='paciente.php?pagina=".$i."'>".$i."</a>";
					    }

					    if($pagina <= $end_loop)
					    {
					    	
					    	echo "<li class='page-item'><a class='page-link' href='paciente.php?pagina=".($pagina + 1)."'>>></a></li>";
					    	echo "<li class='page-item'><a class='page-link' href='paciente.php?pagina=".$total_pages."'>Última</a></li>";
					    	
					    }
					?>
				</ul>
			
		</div>
		
	</div>
	
</div>
<div id="delete_patient" class="modal fade delete-modal" role="dialog">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-body text-center">
				<img src="assets/img/sent.png" alt="" width="50" height="46">
				<h3>¿Esta seguro de eliminar al paciente?</h3>
				<div class="m-t-20"> <a href="#" class="btn btn-white" data-dismiss="modal">No</a>
				<button type="submit" class="btn btn-danger">Borrar</button>
			</div>
		</div>
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

