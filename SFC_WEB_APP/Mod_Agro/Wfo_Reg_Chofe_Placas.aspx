<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_Reg_Chofe_Placas.aspx.cs" Inherits="SFC_WEB_APP.Mod_Agro.Wfo_Reg_Chofe_Placas" %>

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
            background-color:#ABE911;
            color:black;
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
                    <h4>REGISTRO DE CHOFERES Y PLACAS</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                              <div class=" p-2">
                                  <!-- tap conrol ....  -->
                                  <nav>
                                      <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                        <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Registro de Choferes</a>
                                        <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Rregistro de Placas</a>
                                      </div>
                                  </nav>
                                  <div class="tab-content" id="nav-tabContent">
                                      <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                          <div class="  border-bottom border-right border-left border-1 p-2">
                                              <div class="row">
                                                  <div class="col-md-4 pt-3">
                                                        <label for="" class="form-label"><b>Proveedores(*)</b></label>
                                                        <div id="nIdPorveedores_chofer" class="form-control"></div> 
                                                  </div>
                                                  <div class="col-md-4 pt-3">
                                                        <label for="" class="form-label"><b>Brevete(*)</b></label>
                                                        <div class="input-group">
                                                             <div class="input-group mb-3">
                                                              <div class="input-group-prepend">
                                                                <span class="input-group-text" id=""><i class="fa fa-car"></i></span>
                                                              </div>
                                                              <input type="text" class="form-control" name="reg_chofe_brevete_reg" id="reg_chofe_brevete"  aria-label="Username" aria-describedby="basic-addon1"/>
                                                            </div>
                                                        </div>
                                                  </div>
                                                  <div class="col-md-4 pt-3">
                                                        <label for="" class="form-label"><b>DNI(*)</b></label>
                                                        <div class="input-group">
                                                             <div class="input-group mb-3">
                                                              <div class="input-group-prepend">
                                                                <span class="input-group-text" id=""><i class="fa fa-file"></i></span>
                                                              </div>
                                                              <input type="text" class="form-control" name="reg_chofe_dni_reg" id="reg_chofe_dni"  aria-label="Username" aria-describedby="basic-addon1"/>
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
                                                              <input type="text" class="form-control" name="reg_chofe_nombres_reg" id="reg_chofe_nombres"  aria-label="Username" aria-describedby="basic-addon1"/>
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
                                                              <input type="text" class="form-control" name="reg_chofe_ape_paterno_reg" id="reg_chofe_ape_paterno"  aria-label="Username" aria-describedby="basic-addon1"/>
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
                                                              <input type="text" class="form-control" name="reg_chofe_ape_materno_reg" id="reg_chofe_ape_materno"  aria-label="Username" aria-describedby="basic-addon1"/>
                                                            </div>
                                                        </div>
                                                  </div>  
                                              </div>
                                              <div class="modal-footer">
                                                <button type="reset" class="btn btn-danger" data-dismiss="modal" onclick="limpiar_tap_1();">CANCELAR</button>
                                                <button type="button" class="btn btn-primary" onclick="verificar_unico_registro_chofer();">GUARDAR</button>
                                              </div>
                                          </div>
                                      </div>
                                      <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                          <div class="border-bottom border-right border-left  border-1 p-2">
                                              <div class="row">
                                                  <div class="col-md-4 pt-3">
                                                     <label for="" class="form-label"><b>Proveedores(*)</b></label>
                                                        <div id="nIdPorveedores_placa" class="form-control"></div> 
                                                  </div>
                                                  <div class="col-md-4 pt-3">
                                                        <label for="" class="form-label"><b>Placa(*)</b></label>
                                                        <div class="input-group">
                                                             <div class="input-group mb-3">
                                                              <div class="input-group-prepend">
                                                                <span class="input-group-text" id=""><i class="fa fa-car"></i></span>
                                                              </div>
                                                              <input type="text" class="form-control" name="reg_placa_placa_reg" id="reg_placa_placa"  aria-label="Username" aria-describedby="basic-addon1"/>
                                                            </div>
                                                        </div>
                                                  </div>
                                                  <div class="col-md-4 pt-3">
                                                        <label for="" class="form-label"><b>Marca(*)</b></label>
                                                        <div class="input-group">
                                                             <div class="input-group mb-3">
                                                              <div class="input-group-prepend">
                                                                <span class="input-group-text" id=""><i class="fa fa-car"></i></span>
                                                              </div>
                                                              <input type="text" class="form-control" name="reg_placa_marca_reg" id="reg_placa_marca"  aria-label="Username" aria-describedby="basic-addon1"/>
                                                            </div>
                                                        </div>
                                                  </div>
                                              </div>
                                              <div class="modal-footer">
                                                <button type="reset" class="btn btn-danger" data-dismiss="modal" onclick="limpiar_tap_2();">CANCELAR</button>
                                                <button type="button" class="btn btn-primary" onclick="verificar_unico_registro_placa();">GUARDAR</button>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                                  <!-- fin del tap control -->
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
        // funcion listaR PROVEEDORES EN CHOFERES
        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SER_Reg_Chofe_Placas.asmx/SER_listar_proveedores",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);

                var searchBox = $("#nIdPorveedores_chofer").dxSelectBox({
                    dataSource: lst,
                    displayExpr: 'RAZON_SOCIAL',
                    valueExpr: 'IDCLIEPROV',
                    placeholder: "Seleccione",
                    noDataText: "Sin Datos",
                    searchEnabled: true,
                }).dxSelectBox("instance");
                
            },
            error: function (data) {
                alert(JSON.stringify(data));
            }
        });

        // funcion listar PORFEEDORES EN PALCA
        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SER_Reg_Chofe_Placas.asmx/SER_listar_proveedores",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);

                var searchBox = $("#nIdPorveedores_placa").dxSelectBox({
                    dataSource: lst,
                    displayExpr: 'RAZON_SOCIAL',
                    valueExpr: 'IDCLIEPROV',
                    placeholder: "Seleccione",
                    noDataText: "Sin Datos",
                    searchEnabled: true,
                }).dxSelectBox("instance");
            },
            error: function (data) {
                alert(JSON.stringify(data));
            }
        });
    });

    // funcione spara valida ue no registren dso vece los mismos regisotros
    function verificar_unico_registro_chofer() {
        var brevete = document.getElementById("reg_chofe_brevete").value;
        var dni = document.getElementById("reg_chofe_dni").value;

        if (brevete != "") {
            const dni_cant_val = /^\d{8}$/;
            if (dni_cant_val.test(dni)) {
                const dni_parametro_val = /^[0-9]+$/;
                if (dni_parametro_val.test(dni)) {
                    var obj = new Object();
                    obj.CHOFER_BREVETE = brevete;
                    obj.COHER_DNI = dni;
                    $.ajax({
                        type: 'POST',
                        url: "../SER_Reg_Chofe_Placas.asmx/SER_verificar_chofer",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            if (lst[0].Column1 == 0) {
                                registrar_chofer();
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Ocurrió un problema ...',
                                    text: 'Ya existe registro con el numero de BREVETE o DNI . !',
                                }).then((result) => {
                                    limpiar_tap_1();
                                })
                            }
                        },
                        error: function (data) {
                            alert(JSON.stringify(data));
                        }
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un problema ...',
                        text: 'El campo DNI, solo acepta números . !',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'El campo DNI, solo acepta 8 dígitos . !',
                })
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'El campo BREVETE esta vacío . !',
            })
        }
    }

    // funcion para tegistrar chofer.......
    function registrar_chofer() {
        var brevete = document.getElementById("reg_chofe_brevete").value;
        var dni = document.getElementById("reg_chofe_dni").value;
        var nombres = document.getElementById("reg_chofe_nombres").value;
        var apellido_apterno = document.getElementById("reg_chofe_ape_paterno").value;
        var apellido_materno = document.getElementById("reg_chofe_ape_materno").value;

        
        // validmaos  
        if ($("#nIdPorveedores_chofer").dxSelectBox('instance').option('selectedItem') != null) {
            var proveedor = $("#nIdPorveedores_chofer").dxSelectBox('instance').option('selectedItem').IDCLIEPROV;
            if (brevete != "") {
                const dni_cant_val = /^\d{8}$/;
                if (dni_cant_val.test(dni)) {
                    const dni_parametro_val = /^[0-9]+$/;
                    if (dni_parametro_val.test(dni)) {
                        const trabajador_nombres = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/;
                        if (trabajador_nombres.test(nombres)) {
                            const trabajador_ap_paterno = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/;
                            if (trabajador_ap_paterno.test(apellido_apterno)) {
                                const trabajador_ap_materno = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/;
                                if (trabajador_ap_materno.test(apellido_materno)) {
                                    var trababajdor = nombres + " " + apellido_apterno + " " + apellido_materno;

                                    var obj = new Object();
                                    obj.COHER_PROVEEDOR = proveedor;
                                    obj.CHOFER_BREVETE = brevete;
                                    obj.COHER_DNI = dni;
                                    obj.CHOFER_DATOS = trababajdor;
                                    $.ajax({
                                        type: 'POST',
                                        url: "../SER_Reg_Chofe_Placas.asmx/SER_registro_chofer",
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
                                                    text: 'No se registró ningún dato . !',
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
                                                            limpiar_tap_1();
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
                                        text: 'El APELLIDO MATERNO no cumple con los parámetros . !',
                                    })
                                }
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Ocurrió un problema ...',
                                    text: 'El APELLIDO PATERNO no cumple con los parámetros . !',
                                })
                            }
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un problema ...',
                                text: 'El NOMBRE no cumple con los parámetros . !',
                            })
                        }
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un problema ...',
                            text: 'Solo se aceptan números . !',
                        })
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un problema ...',
                        text: 'Solo se acepta 8 dígitos . !',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'Esta vacío el campo BREVETE . !',
                })
            }
        }else {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'Seleccione un PROVEEDOR . !',
            })
        }
    }

    function verificar_unico_registro_placa() {
        var placa = document.getElementById("reg_placa_placa").value;
        const placa_letra_val = /^([A-Z0-9]{3}-\d{3,4})$/;
            if (placa_letra_val.test(placa)) {
                var obj = new Object();
                obj.PLACA_PLACA = placa;
                $.ajax({
                    type: 'POST',
                    url: "../SER_Reg_Chofe_Placas.asmx/SER_verificar_placa",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst[0].Column1 == 0) {
                            registrar_placa();
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un problema ...',
                                text: 'Ya existe registro con el numero de placa . !',
                            }).then((result) => {
                                limpiar_tap_2();
                            })
                        }
                    },
                    error: function (data) {
                        alert(JSON.stringify(data));
                    }
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'El PLACA no cumple con los parámetros especifico . !',
                })
            }
    }

    function registrar_placa() {
        var placa = document.getElementById("reg_placa_placa").value;
        var marca = document.getElementById("reg_placa_marca").value;

        
        if ($("#nIdPorveedores_placa").dxSelectBox('instance').option('selectedItem') != null) {
            var proveedor = $("#nIdPorveedores_placa").dxSelectBox('instance').option('selectedItem').IDCLIEPROV;
            const marca_val = /^([A-Z0-9]{3}-\d{3,4})$/;
            if (marca_val.test(placa)) {
                const marca_nombres = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/;
                if (marca_nombres.test(marca)) {
                    var obj = new Object();
                    obj.PLACA_PROVEEDOR = proveedor;
                    obj.PLACA_PLACA = placa;
                    obj.PLACA_MARCA = marca;
                    $.ajax({
                        type: 'POST',
                        url: "../SER_Reg_Chofe_Placas.asmx/SER_registro_placa",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un problema ...',
                                text: 'No se registro . !',
                            })
                        },
                        error: function (data) {
                            var lst = JSON.stringify(data.d);
                            if (lst == "") {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Ocurrió un problema ...',
                                    text: 'No se registró ningún dato . !',
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
                                            limpiar_tap_2();
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
                        text: 'El campo MARCA, no cumple con los parámetros específicos . !',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'El campo PLACA, no cumple con los parámetros específicos . !',
                })
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'Seleccione un PROVEEDOR . !',
            })
        }
    }

    function limpiar_tap_1() {
        $("#nIdPorveedores_chofer").dxSelectBox('instance').option('value', null);
        document.getElementById("reg_chofe_brevete").value = "";
        document.getElementById("reg_chofe_dni").value = "";
        document.getElementById("reg_chofe_nombres").value = "";
        document.getElementById("reg_chofe_ape_paterno").value = "";
        document.getElementById("reg_chofe_ape_materno").value = "";
    }

    function limpiar_tap_2() {
        $("#nIdPorveedores_placa").dxSelectBox('instance').option('value', null);
        document.getElementById("reg_placa_placa").value = "";
        document.getElementById("reg_placa_marca").value = "";
    }
</script>



</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">

</asp:Content>
