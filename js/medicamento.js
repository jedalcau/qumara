var tablemedicamento;
function listar_medicamento(){
    tablemedicamento = $("#tabla_medicamento").DataTable({
       "ordering":false,   
       "bLengthChange":false,
       "searching": { "regex": false },
       "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
       "pageLength": 10,
       "destroy":true,
       "async": false ,
       "processing": true,
       "ajax":{
           "url":"../controlador/medicamento/controlador_medicamento_listar.php",
           type:'POST'
       },
       "order":[[1,'asc']],
       "columns":[
           {"defaultContent":""},
           {"data":"medicamento_nombre"},
           {"data":"medicamento_alias"},
           {"data":"medicamento_stock"},
           {"data":"medicamento_fregistro"},
           {"data":"medicamento_estatus",
           render: function (data, type, row ) {
                if(data=='ACTIVO'){
                    return "<span class='label label-success'>"+data+"</span>";                   
                }
                if(data=='INACTIVO'){
                    return "<span class='label label-danger'>"+data+"</span>";                   
                }
                if(data=='AGOTADO'){
                    return "<span class='label label-black' style='background:black'>"+data+"</span>";                   
                }
            }
           },       
           {"defaultContent":"<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i></button>"}
       ],

       "language":idioma_espanol,
       select: true
   });
   document.getElementById("tabla_medicamento_filter").style.display="none";
   $('input.global_filter').on( 'keyup click', function () {
        filterGlobal();
    } );
    $('input.column_filter').on( 'keyup click', function () {
        filterColumn( $(this).parents('tr').attr('data-column') );
    });

    tablemedicamento.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_medicamento').DataTable().page.info();
        tablemedicamento.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );

}

$('#tabla_medicamento').on('click','.editar',function(){
    var data = tablemedicamento.row($(this).parents('tr')).data();
    if(tablemedicamento.row(this).child.isShown()){
        var data = tablemedicamento.row(this).data();
    }
    $("#modal_editar").modal({backdrop:'static',keyboard:false})
    $("#modal_editar").modal('show');
    $("#txtidmedicamento").val(data.medicamento_id);
    $("#txt_medicamento_actual_editar").val(data.medicamento_nombre);
    $("#txt_medicamento_nuevo_editar").val(data.medicamento_nombre);
    $("#txt_alias_editar").val(data.medicamento_alias);
    $("#txt_stock_editar").val(data.medicamento_stock);
    $("#cbm_estatus_editar").val(data.medicamento_estatus).trigger("change");
})

function filterGlobal() {
    $('#tabla_medicamento').DataTable().search(
        $('#global_filter').val(),
    ).draw();
}

function AbrirModalRegistro(){
    $("#modal_registro").modal({backdrop:'static',keyboard:false})
    $("#modal_registro").modal('show');
}

function Registrar_Medicamento(){
    var medicamento  =$("#txt_medicamento").val();
    var alias  =$("#txt_alias").val();
    var stock   =$("#txt_stock").val();
    var estatus =$("#cbm_estatus").val();
    if(stock<0){
        return Swal.fire("Mensaje De Advertencia","El stock no puede ser negativo","warning");
    }

    if(medicamento.length==0 || stock.length==0 || estatus.length==0 || alias.length==0){
        return Swal.fire("Mensaje De Advertencia","Llene los campos vacios","warning");
    }

    $.ajax({
        "url":"../controlador/medicamento/controlador_medicamento_registro.php",
        type:'POST',
        data:{
            me:medicamento,
            ali:alias,
            st:stock,
            es:estatus
        }
    }).done(function(resp){
        if(resp>0){
                if(resp==1){
                    $("#modal_registro").modal('hide');
                    listar_medicamento();
                    LimpiarCampos();
                    Swal.fire("Mensaje De Confirmacion","Datos guardados correctamente, medicamento registrado","success");
                    
                }else{
                    LimpiarCampos();
                    Swal.fire("Mensaje De Advertencia","El medicamento ya existe en nuestra data","warning");  
                }
        }else{
            Swal.fire("Mensaje De Error","Lo sentimos el registro no se pudo completar","error");
        }
    })
}

function LimpiarCampos(){
    $("#txt_medicamento").val("");
    $("#txt_alias").val("");
    $("#txt_stock").val("");
}

function Modificar_Medicamento(){
    var id  = $("#txtidmedicamento").val();
    var medicamentoactual  =$("#txt_medicamento_actual_editar").val();
    var medicamentonuevo =$("#txt_medicamento_nuevo_editar").val();
    var alias  =$("#txt_alias_editar").val();
    var stock   =$("#txt_stock_editar").val();
    var estatus =$("#cbm_estatus_editar").val();
    if(stock<0){
        return Swal.fire("Mensaje De Advertencia","El stock no puede ser negativo","warning");
    }

    if(medicamentonuevo.length==0 || medicamentoactual.length==0 || stock.length==0 || estatus.length==0 || alias.length==0){
        return Swal.fire("Mensaje De Advertencia","Llene los campos vacios","warning");
    }

    $.ajax({
        "url":"../controlador/medicamento/controlador_medicamento_modificar.php",
        type:'POST',
        data:{
            id:id,
            meac:medicamentoactual,
            menu:medicamentonuevo,
            ali:alias,
            st:stock,
            es:estatus
        }
    }).done(function(resp){
        if(resp>0){
                if(resp==1){
                    $("#modal_editar").modal('hide');
                    listar_medicamento();
                    Swal.fire("Mensaje De Confirmacion","Datos Actualizados correctamente, medicamento registrado","success");
                    
                }else{
                    Swal.fire("Mensaje De Advertencia","El medicamento ya existe en nuestra data","warning");  
                }
        }else{
            Swal.fire("Mensaje De Error","Lo sentimos el registro no se pudo completar","error");
        }
    })
}