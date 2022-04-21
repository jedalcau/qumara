            <!-- Dialog Delete Consultorio -->
            <div id="modal_delete_consultorio<?php echo $fila['idConsultorio']; ?>" class="modal fade delete-modal" role="dialog">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body text-center">
                            <img src="assets/img/sent.png" alt="" width="50" height="46">
                            <h3>Estas seguro de Eliminar el consultorio?</h3>

                            <div class="m-t-20">
                                <a href="#" class="btn btn-success" data-dismiss="modal">No</a>
                                <a class="btn btn-danger" href="controller/controller_del_Consultorio.php?idCon=<?php echo $fila['idConsultorio']; ?>">SI</a>
<!--                                <button type="submit" class="btn btn-danger">Si</button>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
