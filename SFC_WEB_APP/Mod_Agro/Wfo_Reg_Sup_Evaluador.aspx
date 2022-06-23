<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_Reg_Sup_Evaluador.aspx.cs" Inherits="SFC_WEB_APP.Mod_Agro.Wfo_Reg_Sup_Evaluador" %>

<%@ MasterType VirtualPath="~/Site.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    

    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <!--LIBRERIA DE BOOSTRAP 5 -->
    <%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    <!-- js databales -->
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.light.css" />

    <script src="../Content/DevExtreme/cldr.min.js"></script>
    <script src="../Content/DevExtreme/event.min.js"></script>
    <script src="../Content/DevExtreme/supplemental.min.js"></script>
    <script src="../Content/DevExtreme/unresolved.min.js"></script>
    <script src="../Content/DevExtreme/globalize.min.js"></script>
    
    <script src="../Content/DevExtreme/message.min.js"></script>
  
    <script src="../Content/DevExtreme/jszip.min.js"></script>
    <script src="../Content/DevExtreme/dx.all.js"></script>
    <script src="../Content/DevExtreme/dx.messages.es.js"></script>
    <script src="../Content/DevExtreme/supplemental.js"></script>
    <script src="../Content/DevExtreme/es.js"></script>

    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/print.min.css" />
    <script src="../Content/DevExtreme/print.min.js"></script>

     <script src="../Scripts/sweetalert2.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- fin js databales -->

   
    <style>
        .dx-freespace-row {
            height: 0px !important;
        }

        .long-title h3 {
            font-family: 'Segoe UI Light', 'Helvetica Neue Light', 'Segoe UI', 'Helvetica Neue', 'Trebuchet MS', Verdana;
            font-weight: 200;
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
        }

        @media print {
            body, .printjsa, .dx-scrollable-content {
                display: block !important;
                position: relative !important;
                width: auto !important;
                height: auto !important;
                overflow: visible !important;
                margin-left: 0 !important;
                display: block !important; /* Not really needed in all cases */
                position: relative !important;
                width: auto !important;
                height: auto !important;
                overflow: visible !important;
            }
        }

        #gridContainer {
            height: 60vh;
        }

        #DataGrid {
            height: auto;
            width: 100%;
            color: black;
            font-weight: bold;
            font-size: 10px;
            height: 60vh;
        }

        .options {
            padding: 0px;
            margin-top: 0px;
        }

        .caption {
            font-size: 18px;
            font-weight: 500;
        }

        .option {
            margin-top: 0px;
        }

        .dx-datagrid-rowsview .dx-row > .dx-master-detail-cell {
            padding: 15px;
        }

        #header_titulo{
            background-color:#8C3AD6;
            color:white;
        }
        
    </style>  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">

<div class="container animate__animated  animate__fadeInLeft" id="form_principal">
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header text-center" id="header_titulo">
                    <h4>REGISTRO DE SUPERVISORES Y EVALUADORES</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                              <div class="row border border-1 p-2">
                                  <div class="col-md-4">
                                     <label for="" class="form-label"><b>Cosecha(*)</b></label>
                                        <select class="form-control" name="regi_cosecha_reg" id="regi_cosecha" aria-label="Default select example">     
                                        </select>
                                  </div>
                                  <div class="col-md-4">
                                        <label for="" class="form-label"><b>Fundo(*)</b></label>
                                        <div class="input-group">
                                             <select class="form-control" name="regi_fundo_reg" id="regi_fundo" aria-label="Default select example"  placeholder="Seleccione"> 
                                             </select>
                                        </div>
                                  </div>
                                  <div class="col-md-4">
                                        <label for="" class="form-label"><b>Cargo(*)</b></label>
                                        <div class="input-group">
                                            <div class="form-check pt-1">
                                              <input class="form-check-input" type="radio" name="regi_rango_supervisor_reg" id="regi_rango_supervisor" value="Supervisor">
                                              <label class="form-check-label" for="exampleRadios1">
                                                Supervisor
                                              </label>
                                            </div>
                                            <div class="form-check pt-1 ml-3">
                                              <input class="form-check-input" type="radio" name="regi_rango_evaluador_reg" id="regi_rango_evaluador" value="Evaluador">
                                              <label class="form-check-label" for="exampleRadios2">
                                                Evaluador
                                              </label>
                                            </div>
                                        </div>
                                  </div>
                                  <div class="col-md-4 pt-3">
                                        <label for="" class="form-label"><b>Nombres(*)</b></label>
                                        <div class="input-group">
                                             <div class="input-group mb-3">
                                              <div class="input-group-prepend">
                                                <span class="input-group-text" id=""><i class="fa fa-user"></i></span>
                                              </div>
                                              <input type="text" class="form-control" name="regi_trabajador_nom_reg" id="regi_trabajador_nom"  aria-label="Username" aria-describedby="basic-addon1"/>
                                            </div>
                                        </div>
                                  </div>
                                  <div class="col-md-4 pt-3">
                                        <label for="" class="form-label"><b>Apellido Paterno(*)</b></label>
                                        <div class="input-group">
                                             <div class="input-group mb-3">
                                              <div class="input-group-prepend">
                                                <span class="input-group-text" id=""><i class="fa fa-user"></i></span>
                                              </div>
                                              <input type="text" class="form-control" name="regi_trabajador_ape_pate_reg" id="regi_trabajador_ape_pate"  aria-label="Username" aria-describedby="basic-addon1"/>
                                            </div>
                                        </div>
                                  </div>
                                  <div class="col-md-4 pt-3">
                                        <label for="" class="form-label"><b>Apellido Materno(*)</b></label>
                                        <div class="input-group">
                                             <div class="input-group mb-3">
                                              <div class="input-group-prepend">
                                                <span class="input-group-text" id=""><i class="fa fa-user"></i></span>
                                              </div>
                                              <input type="text" class="form-control" name="regi_trabajador_ap_mate" id="regi_trabajador_ap_mate"  aria-label="Username" aria-describedby="basic-addon1"/>
                                            </div>
                                        </div>
                                  </div>
                              </div>
                            <div class="modal-footer">
                                <button type="reset" class="btn btn-danger" data-dismiss="modal">CANCELAR</button>
                                <button type="button" class="btn btn-primary" onclick="registrar();">GUARDAR</button>
                              </div>
                          </div>
                    </div>
                </div>
            </div>
        </div> 
   </div>  
</div>

    
<script>
    window.addEventListener('load', function () {
        // funcion listar TIPO DE COASECHA
        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SER_Reg_Sup_Evaluador.asmx/SER_listar_tipo_cosecha",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);

                $('#regi_cosecha').html('<option value="0">Seleccione Cosecha</option>');
                for (var i = 0; i < lst.length; i++) {
                    var x = document.getElementById("regi_cosecha");
                    var option = document.createElement("option");
                    option.value = lst[i].idvariable;
                    option.text = lst[i].descripcion;
                    x.add(option);
                }
            },
            error: function (data) {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'No se ha podido listar los tipos de cosecha .  !',
                })
            }
        });
    });

    $('#regi_rango_supervisor').on('click', function () {
        document.getElementById('regi_rango_supervisor').checked;
        document.getElementById('regi_rango_evaluador').checked = "";
    });

    $('#regi_rango_evaluador').on('click', function () {
        document.getElementById('regi_rango_supervisor').checked = "";
        document.getElementById('regi_rango_evaluador').checked;
    });


    /// funcion para llenar fundo
    document.getElementById('regi_cosecha').onchange = function () {
        var id_cosecha = this.value;
        /*alert(id_cosecha);*/
        if (id_cosecha == 0) {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'No se puede seleccionar dicha Opción - Cosecha .  !',
            })
        } else {
            var obj = new Object();
            obj.COD_COSECHA = id_cosecha;
            $.ajax({
                type: 'POST',
                url: "../SER_Reg_Sup_Evaluador.asmx/SER_listar_fundo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    $('#regi_fundo').html('<option value="0">Seleccione Fundo</option>');
                    for (var i = 0; i < lst.length; i++) {
                        var x = document.getElementById("regi_fundo");
                        var option = document.createElement("option");
                        option.value = lst[i].descripcion;
                        option.text = lst[i].descripcion;
                        x.add(option);
                    }
                },
                error: function (data) {
                    alert(JSON.stringify(data.d));
                }
            });
        }
    }

    // FUNCION PARA LIMPAIR 
    function limpiar() {
        document.getElementById("regi_cosecha").value = "";
        document.getElementById("regi_fundo").value = "";
        document.getElementById('regi_rango_supervisor').checked = "";
        document.getElementById('regi_rango_evaluador').checked = "";
        document.getElementById("regi_trabajador_nom").value = "";
        document.getElementById("regi_trabajador_ape_pate").value = "";
        document.getElementById("regi_trabajador_ap_mate").value = "";
    }

    // FUNCION PARA GUARDAR DATOS.
    function registrar() {
        var cosecha_reg = document.getElementById("regi_cosecha").value;
        var fundo_reg = document.getElementById("regi_fundo").value;
        

        var rango_super_reg = document.getElementById("regi_rango_supervisor").value;
        var rango_eva_treg = document.getElementById("regi_rango_evaluador").value;

        var supervisdor_check = document.getElementById('regi_rango_supervisor').checked;
        var evaluador_check = document.getElementById('regi_rango_evaluador').checked;

        // validmaos nombre le trabajador.
        var traba_nonbre = document.getElementById("regi_trabajador_nom").value;
        var traba_apellido_paterno = document.getElementById("regi_trabajador_ape_pate").value;
        var traba_apellido_materno = document.getElementById("regi_trabajador_ap_mate").value;


        var trabajador_reg;
        var cargo;
        // validamos
        if (cosecha_reg == 0) {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'No se puede seleccionar dicha Opción - Cosecha . !',
            })
        } else {
            if (fundo_reg == 0) {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'No se puede seleccionar dicha Opción - Fundo. !',
                })
            } else {
                if (supervisdor_check || evaluador_check) {
                    if (supervisdor_check != evaluador_check) {
                        if (supervisdor_check) {
                            cargo = rango_super_reg;
                            const trabajador_nombres = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/;
                            if (trabajador_nombres.test(traba_nonbre)) {
                                const trabajador_ape_paterno = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/;
                                if (trabajador_ape_paterno.test(traba_apellido_paterno)) {
                                    const trabajador_ape_materno = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/;
                                    if (trabajador_ape_materno.test(traba_apellido_materno)) {
                                        trabajador_reg = traba_nonbre + " " + traba_apellido_paterno + " " + traba_apellido_materno;
                                        
                                        var obj = new Object();
                                        obj.REG_COSECHA = cosecha_reg;
                                        obj.REG_FUNDO = fundo_reg;
                                        obj.REG_CARGO = cargo;
                                        obj.REG_TRABAJADOR = trabajador_reg;
                                        $.ajax({
                                            type: 'POST',
                                            url: "../SER_Reg_Sup_Evaluador.asmx/SER_registrar",
                                            data: JSON.stringify({ obj: obj }),
                                            dataType: 'json',
                                            contentType: 'application/json; charset=utf-8',
                                            success: function (data) {
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Ocurrió un problema ...',
                                                    text: 'No se registró . !',
                                                })
                                            },
                                            error: function (data) {
                                                var lst = JSON.stringify(data.d);
                                                if (lst == "") {
                                                    Swal.fire({
                                                        icon: 'error',
                                                        title: 'Ocurrió un problema ...',
                                                        text: 'No se registró ningún dato	 . !',
                                                    })
                                                } else {
                                                    Swal.fire({
                                                        title: '¿Está seguro de realizar los cambios?',
                                                        text: "¡Los datos quedaran guardados en el sistema!",
                                                        icon: 'warning',
                                                        showCancelButton: true,
                                                        confirmButtonColor: '#3085d6',
                                                        cancelButtonColor: '#d33',
                                                        confirmButtonText: 'Si, Aceptar ...!'
                                                    }).then((result) => {
                                                        if (result.isConfirmed) {
                                                            Swal.fire(
                                                                'Registrado !',
                                                                'Datos guardados con éxito.',
                                                                'success'
                                                            ).then((result) => {
                                                                limpiar()
                                                            })
                                                        }
                                                    })
                                                }
                                            }
                                        });
                                    } else {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Ocurrió un problema ...',
                                            text: 'El campo APELLIDO MATERNO no cumple, con los parámetros establecidos. !',
                                        })
                                    }
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Ocurrió un problema ...',
                                        text: 'El campo APELLIDO PATERNO no cumple, con los parámetros establecidos. !',
                                    })
                                }
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Ocurrió un problema ...',
                                    text: 'El campo NOMBRES no cumple, con los parámetros establecidos. !',
                                })
                            }
                        } else if (evaluador_check) {
                            cargo = rango_eva_treg;
                            const trabajador_nombres = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/;
                            if (trabajador_nombres.test(traba_nonbre)) {
                                const trabajador_ape_paterno = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/;
                                if (trabajador_ape_paterno.test(traba_apellido_paterno)) {
                                    const trabajador_ape_materno = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/;
                                    if (trabajador_ape_materno.test(traba_apellido_materno)) {
                                        trabajador_reg = traba_nonbre + " " + traba_apellido_paterno + " " + traba_apellido_materno;

                                        var obj = new Object();
                                        obj.REG_COSECHA = cosecha_reg;
                                        obj.REG_FUNDO = fundo_reg;
                                        obj.REG_CARGO = cargo;
                                        obj.REG_TRABAJADOR = trabajador_reg;
                                        $.ajax({
                                            type: 'POST',
                                            url: "../SER_Reg_Sup_Evaluador.asmx/SER_registrar",
                                            data: JSON.stringify({ obj: obj }),
                                            dataType: 'json',
                                            contentType: 'application/json; charset=utf-8',
                                            success: function (data) {
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Ocurrió un problema ...',
                                                    text: 'No se registro. !',
                                                })
                                            },
                                            error: function (data) {
                                                var lst = JSON.stringify(data.d);
                                                if (lst == "") {
                                                    Swal.fire({
                                                        icon: 'error',
                                                        title: 'Ocurrió un problema ...',
                                                        text: 'No se registró ningún dato. !',
                                                    })
                                                } else {
                                                    Swal.fire({
                                                        title: '¿Está seguro de realizar los cambios?',
                                                        text: "¡Los datos quedaran guardados en el sistema!",
                                                        icon: 'warning',
                                                        showCancelButton: true,
                                                        confirmButtonColor: '#3085d6',
                                                        cancelButtonColor: '#d33',
                                                        confirmButtonText: 'Si, Aceptar ...!'
                                                    }).then((result) => {
                                                        if (result.isConfirmed) {
                                                            Swal.fire(
                                                                'Registrado !',
                                                                'Datos guardados con éxito.',
                                                                'success'
                                                            ).then((result) => {
                                                                limpiar()
                                                            })
                                                        }
                                                    })
                                                }     
                                           }  
                                        });
                                    } else {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Ocurrió un problema ...',
                                            text: 'El campo APELLIDO MATERNO no cumple, con los parámetros establecidos. !',
                                        })
                                    }
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Ocurrió un problema ...',
                                        text: 'El campo APELLIDO PATERNO no cumple, con los parámetros establecidos. !',
                                    })
                                }
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Ocurrió un problema ...',
                                    text: 'El campo NOMBRES no cumple, con los parámetros establecidos. !',
                                })
                            }
                        }
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un problema ...',
                            text: 'No puede seleccionar los dos cargos. !',
                        }).then((result) => {
                            document.getElementById('regi_rango_supervisor').checked = "";
                            document.getElementById('regi_rango_evaluador').checked = "";
                        })
                    }

                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un problema ...',
                        text: 'Debe de seleccionar uno de los cargos. !',
                    })
                }
            }
        }
    }
</script>



</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">

</asp:Content>
