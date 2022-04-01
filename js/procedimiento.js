var tableprocedimiento;
function listar_procedimiento(){
       tableprocedimiento = $("#tabla_procedimiento").DataTable({
       "ordering":false,   
       "bLengthChange":false,
       "searching": { "regex": false },
       "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
       "pageLength": 10,
       "destroy":true,
       "async": false ,
       "processing": true,
       "ajax":{
           "url":"../controlador/procedimiento/controlador_procedimiento_listar.php",
           type:'POST'
       },
       "order":[[1,'asc']],
       "columns":[
           {"defaultContent":""},
           {"data":"procedimiento_nombre"},
           {"data":"procedimiento_fecregistro"},
           {"data":"procedimiento_estatus",
           render: function (data, type, row ) {
                if(data=='ACTIVO'){
                    return "<span class='label label-success'>"+data+"</span>";                   
                }else{
                return "<span class='label label-danger'>"+data+"</span>";                 
                }
            }
           },       
           {"defaultContent":"<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i></button>"}
       ],

       "language":idioma_espanol,
       select: true
   });
   document.getElementById("tabla_procedimiento_filter").style.display="none";
   $('input.global_filter').on( 'keyup click', function () {
        filterGlobal();
    } );
    $('input.column_filter').on( 'keyup click', function () {
        filterColumn( $(this).parents('tr').attr('data-column') );
    });

    tableprocedimiento.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_procedimiento').DataTable().page.info();
        tableprocedimiento.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );

}

function filterGlobal() {
    $('#tabla_procedimiento').DataTable().search(
        $('#global_filter').val(),
    ).draw();
}

function AbrirModalRegistro(){
    $("#modal_registro").modal({backdrop:'static',keyboard:false})
    $("#modal_registro").modal('show');
}


function Registro_Procedimiento(){
    var procedimiento = $("#txt_procedimiento").val();
    var estatus = $("#cbm_estatus").val();
    if(procedimiento.length==0){
        return Swal.fire("Mensaje De Advertencia","El campo procedimiento debe tener datos","warning");
    }

    $.ajax({
        url:'../controlador/procedimiento/controlador_procedimiento_registro.php',
        type:'post',
        data:{
            p:procedimiento,
            e:estatus
        }
    }).done(function(resp){
        if(resp>0){
            if(resp==1){
                $("#modal_registro").modal('hide');
                listar_procedimiento();
                LimpiarDatos();
                Swal.fire("Mensaje De Confirmacion","Datos guardados correctamente, procedimiento registrado","success");
            }else{
                LimpiarDatos();
                Swal.fire("Mensaje De Advertencia","El procedimiento ya existe en nuestra data","warning");  
            }
        }
    })
}

function LimpiarDatos(){
    $("#txt_procedimiento").val("");
}
$('#tabla_procedimiento').on('click','.editar',function(){
    var data = tableprocedimiento.row($(this).parents('tr')).data();//Detecta a que fila hago click y me captura los datos en la variable data.
    if(tableprocedimiento.row(this).child.isShown()){//Cuando esta en tamaño responsivo
        var data = tableprocedimiento.row(this).data();
    }
    $("#modal_editar").modal({backdrop:'static',keyboard:false})
    $("#modal_editar").modal('show');
    $("#txt_idprocedimiento").val(data.procedimiento_id);
    $("#txt_procedimiento_actual_editar").val(data.procedimiento_nombre);
    $("#txt_procedimiento_nuevo_editar").val(data.procedimiento_nombre);
    $("#cbm_estatus_editar").val(data.procedimiento_estatus).trigger("change");
})

function Modificar_Procedimiento(){
    //Vamos a llevar el actual y el nuevo, para luego en nuestro procedure hacer una condicional
    // Si el procedimiento actual == nuevo, entonces que me actualize el estatus, si es diferente 
    // que me busque en la bd si existe o no, para votar un msj que esta repitdo si existo y si no me pasa a registrar.

    var id =  $("#txt_idprocedimiento").val();
    var procedimientoactual = $("#txt_procedimiento_actual_editar").val();
    var procedimientonuevo = $("#txt_procedimiento_nuevo_editar").val();
    var estatus = $("#cbm_estatus_editar").val();
    if(id.length==0){
        return  Swal.fire("Mensaje De Advertencia","El id del campo esta vacio","warning");
    }

    if(procedimientonuevo.length==0){
        return Swal.fire("Mensaje De Advertencia","Debe ingresar un procedimiento","warning");
    }

    $.ajax({
        url:'../controlador/procedimiento/controlador_procedimiento_modificar.php',
        type:'POST',
        data:{
            id:id,
            procedimientoactual:procedimientoactual,
            procedimientonuevo:procedimientonuevo,
            estatus:estatus
        }
    }).done(function(resp){
        if(resp>0){
            $("#modal_editar").modal('hide');
            if(resp==1){
                listar_procedimiento();
                Swal.fire("Mensaje De Confirmacion","Datos actualizados correctamente","success");
            }else{
                Swal.fire("Mensaje De Advertencia","El procedimiento ya se encuentra en nuestra base de datos","warning");
            }
        }else{
            Swal.fire("Mensaje De ERROR","Lo sentimos no se pudo completar su actualizacion","error");
        }
    })
}