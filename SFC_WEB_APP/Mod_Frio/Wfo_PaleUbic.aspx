<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_PaleUbic.aspx.cs" Inherits="SFC_WEB_APP.Mod_Frio.Wfo_PaleUbic" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.css" rel="stylesheet"/>

    <!--LIBRERIA DE ANIMACION AGC-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.light.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.2.4/css/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.2.4/css/dx.light.css" />
    
    <link href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/buttons/2.1.0/css/buttons.dataTables.min.css" rel="stylesheet" />

    <script src="https://cdn.amcharts.com/lib/4/core.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

  <style>
      .table th, .table td {
    padding: 8px !important;
}

      
        /*QR*/

        .qr-code-generator {
            width: 100%;
            margin: 0 auto;
        }

        .qr-code-generator * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        #qrcode {
            width: 200px;
            height: 200px;
            margin: 0 auto;
        }

            #qrcode a {
                font-size: 0.8em;
            }

        .qr-url, .qr-size {
            padding: 0.5em;
            border: 1px solid #ddd;
            border-radius: 2px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .qr-url {
            width: 79%;
        }

        .qr-size {
            width: 20%;
        }

        .generate-qr-code {
            /*display: block;*/
            width: 100%;
            margin: 0.5em 0 0;
            padding: 0.25em;
            font-size: 1.2em;
            border: none;
            cursor: pointer;
            background-color: #e5554e;
            color: #fff;
        }

        /* STYLE */
  </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">


    <div class="container mt-2 animate__bounceIn">
        <div class="row">
            <div class="col-sm-12">
                <div class="card text-center">
                    <div class="card-header">
                        <h4>ZONIFICACI&Oacute;N POR C&Aacute;MARA</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-3">
                                <label>C&aacute;mara</label>
                                <select style="cursor:pointer" class="form-control" id="cmbcamara" name="cmbcamara">
                                    
                                </select>
                            </div>
                            <div class="col-sm-3" style="visibility:hidden">
                                <label>Rack</label>
                                <select style="cursor:pointer" class="form-control" id="cmbrack" name="cmbrack">
                                    
                                </select>
                            </div>
                            <div class="col-sm-3" style="visibility:hidden">
                                <label>Piso</label>
                                <select style="cursor:pointer" class="form-control" id="cmbpiso" name="cmbpiso">
                                  
                                </select>
                            </div>
                            <div class="col-sm-3">
                                <label>&nbsp;</label>
                                <button type="button" id="btn-buscar" name="btn-buscar" class="btn btn-md btn-block btn-success">BUSCAR</button>
                            </div>
                        </div>

                        
                    </div>
                </div>    
            </div>
        </div>
    </div>

    <div class="container animate__bounceIn">
        <div class="row">
            <div class="col-sm-3">
                <!--PRIMER CARD-->
                    <div class="card mt-3">
                        <div class="card-header">
                            <h5>Total posiciones Libres</h5>
                            <hr />
                            <label id="tplibres"></label>
                        </div>
                        
                    </div>
            </div>
            <div class="col-sm-3">
                <!--Segundo CARD-->
                    <div class="card mt-3">
                        <div class="card-header">
                            <h5>Total posiciones Ocupadas</h5>
                            <hr />
                            <label id="tpocupadas"></label>
                        </div>
                    </div>
            </div>
            <div class="col-sm-3">
                <!--Tercer CARD-->
                    <div class="card mt-3">
                        <div class="card-header">
                            <h5>Total posiciones Inhabilitadas</h5>
                            <hr />
                            <label id="tposiciones_inh"></label>
                        </div>
                    </div>
            </div>
            <div class="col-sm-3">
                <!--Tercer CARD-->
                    <div class="card mt-3">
                        <div class="card-header">
                            <h5>Total posiciones</h5>
                            <hr />
                            <label id="tposiciones"></label>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    
    <div class="container" id="contenedor_excel">
        <div class="row">
            <div class="col-sm-12">
                <button type="button" class="btn btn-dark" id="btn-excel" name="btn-excel">Generar Excel <i class="fas fa-file-excel"></i></button>
            </div>
        </div>
    </div>
    
    <div class="container">
        <div class="table-responsive w-100" id="tb_dxe">
              <div class="row  text-center">
                <div class="col-sm-12">
                    <table id="tb_mx" class="table table-bordered table-striped table-hover table-sm cell-border" style="display: block;overflow-x: auto;">
                        <thead style="background:#667CA5;color:white">
                            <tr id="tcab">
                            
                            </tr>
                        </thead>
                        <tbody style="background:white">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!--
    <div class="container mt-4">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h3>Stock de paletas por productor</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-1">
                                <p>Fecha: </p>
                            </div>
                            <div class="col-sm-4">
                                <input type="date" style="cursor:pointer" class="form-control" name="txtfecha_" id="txtfecha_" autocomplete="off" />
                            </div>
                            <div class="col-sm-4">
                                <button type="button" class="btn btn-success" id="btnMostrarStock" name="btnMostrarStock">Mostrar Stock</button>
                            </div>
                        </div>       
                    </div>
                </div>
            </div>
            <div class="col-sm-12 mb-4" id="tbl_display" style="display:none">
                <table id="tabla_" class="table table-sm table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>Productor</th>
                            <th>Total Paleta</th>
                        </tr>
                    </thead>   
                    <tbody id="tb_x">

                    </tbody>
                </table>
                <button type="button" class="btn btn-info mt-2" name="btnexcel_stock" id="btnexcel_stock">Generar Excel</button>
            </div>
        </div>
    </div>-->
        

  
                    
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/autofill/2.3.9/js/dataTables.autoFill.min.js"></script>
    <script src="https://cdn.datatables.net/fixedcolumns/4.0.1/js/dataTables.fixedColumns.min.js"></script>

    <!-- BEGIN: PageScripts/ Vendor JS -->
    <script src="../Scripts/dt/datatables.min.js"></script>
    <script src="../Scripts/dt/dataTables.buttons.min.js"></script>
    <script src="../Scripts/dt/buttons.bootstrap4.min.js"></script>
    <script src="../Scripts/dt/vfs_fonts.js"></script>
    <script src="../Scripts/dt/buttons.html5.min.js"></script>
    <!-- END: Page VScripts/endor JS-->


    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>


    <script src="../Scripts/qrcode.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="//cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.1.0/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>


    <div class="modal fade" id="modalqr" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row center">
                           <div class="qr-code-generator">
                                    <h5 style="text-align:center" id="txtcode"></h5>
                                    <div id="qrcode"></div>
                           </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $("document").ready(function () {
            CargarCamara();
            DeshabilitarTotal();
            $("#contenedor_excel").attr("hidden", true);
            
        });

        function DeshabilitarTotal() {
            $("#cmbrack").attr("disabled", true);
            $("#cmbpiso").attr("disabled", true);
        }

        function HabilitarRack() {
            $("#cmbrack").attr("disabled", false);
        }

        function HabilitarPiso() {
            $("#cmbpiso").attr("disabled", false);
        }

        function CargarCamara() {
            $.ajax({
                url: "../SerFrio.asmx/MostrarCamaras_Reporte",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var p = JSON.parse(data.d);
                    $("#cmbcamara").append("<option value='0' selected disabled>Seleccione Camara</option>");
                    for (var i = 0; i < p.length; i++) {
                        $("#cmbcamara").append("<option value='" + p[i].IDCAMARA + "'>" + p[i].DESCRIPCION + "</option>");
                    }

                }
            });
        }

        $("#cmbcamara").on("change", function () {
            $("#cmbrack").empty();
            HabilitarRack();
            var data = $("#cmbcamara").val();
            CargarRack(data);

            $("#cmbpiso").empty();
            HabilitarPiso();
            var p = '';
            CargarPiso(p);
        });

        function CargarRack(camara) {
            $.ajax({
                type: "post",
                data: JSON.stringify({ camara: camara }),
                url: "../SerFrio.asmx/MostrarRacks_Reporte",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var p = JSON.parse(data.d);
                    $("#cmbrack").append("<option value=''>TODOS</option>");
                    for (var i = 0; i < p.length; i++) {
                        $("#cmbrack").append("<option value='" + p[i].CODIGOCLIENTE + "'>" + p[i].RACK + "</option>");
                    }

                }
            });
        }

        $("#cmbrack").on("change", function () {
            $("#cmbpiso").empty();
            HabilitarPiso();
            var p = $("#cmbrack").val();
            CargarPiso(p);
        });

        function CargarPiso(rack) {
            $.ajax({
                type: "post",
                data: JSON.stringify({ rack: rack }),
                url: "../SerFrio.asmx/MostrarPiso_Reporte",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var p = JSON.parse(data.d);
                    $("#cmbpiso").append("<option value=''>TODOS</option>");
                    for (var i = 0; i < p.length; i++) {
                        $("#cmbpiso").append("<option value='" + p[i].CODIGOCLIENTE + "'>" + p[i].PISO + "</option>");
                    }

                }
            });
        }

        $("#btn-buscar").on("click", function () {

            $("#tcab").html('');
            $("#tb_mx tbody").html('');
            $("#contenedor_excel").attr("hidden", true);

            var empresa_ = "001";
            var camara_ = $("#cmbcamara").val();
            var rack_ = $("#cmbrack").val();
            var piso_ = $("#cmbpiso").val();

            var contarlibre = 0;
            var contarocupado = 0;
            var contarinhabilitado = 0;

            var objeto = {
                objZonificacion: {
                    empresa: empresa_,
                    camara: camara_,
                    rack: (rack_).substr(2, 3),
                    piso: piso_,
                    fila: "",
                    columna: ""
                }
            }
            
            //console.log(objeto);

            $.ajax({
                type: "post",
                data: JSON.stringify(objeto),
                url: "../SerFrio.asmx/MostrarDataTable_Reporte",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    $("#btn-buscar").attr("disabled", "true");
                    
                    swal.fire({
                        title: "Consultando...",
                        text: "Espere por favor.",
                        imageUrl: '../Img/loading.gif',
                        showConfirmButton: false,
                        backdrop: false,
                        showClass: {
                            popup: 'animate__animated animate__fadeInDown'
                        },
                        hideClass: {
                            popup: 'animate__animated animate__fadeOutUp'
                        }
                    });
                },
                success: function (r) {

                    swal.close();
                    
                    $("#btn-buscar").removeAttr("disabled", "true");
                    $("#contenedor_excel").attr("hidden", false);

                    $("#tb_mx").removeClass("animate__animated  animate__fadeInLeft");

                    tmp = JSON.parse(r.d);

                    //console.log(tmp);

                    var rack = [];
                    var rack_ap = [];
                    var orden = [];
                    var inhabilitar = [];
                    //var inhabilitar = '';

                    var fila_extra = [];
                    for (var i = 0; i < tmp.dd.length; i++) {
                        fila_extra.push(tmp.dd[i].A_fila);
                    }

                    //Limpiando duplicados
                    var fila_extra_limpio = [...new Set(fila_extra)];
                    var cuenta_fila_extra = fila_extra_limpio.length;
                    var valida_fila_extra = 0;


                    if (rack_ == '') {

                        for (var i = 0; i < tmp.dt.length; i++) {
                            rack.push(tmp.dt[i].codigo);
                            rack_ap.push(tmp.dt[i].codigo);
                        }

                        for (var i = 0; i < tmp.ci.length; i++) {
                            if (camara_ == tmp.ci[i].Camara) {
                                inhabilitar.push(tmp.ci[i].Completo);
                            }
                        }

                        //RACKS TOTALES
                        var rackunico = [...new Set(rack)];
                        var longitud = rackunico.length;
                        var contar = 0;
                        var rack_ap_unico = [...new Set(rack_ap)];

                        //ORDENES
                        var ordenunico = [...new Set(orden)];

                        $("#tcab").append("<th style='position: absolute;z-index:100;background:#fc9038;width:6%'>Piso</th>");
                        $("#tcab").append("<th style='position: absolute;padding-left: 100px!important;background:#fc9038'>Fila</th>");
                        for (var j = 0; j < rackunico.length; j++) {
                            if (j == 0) {
                                $("#tcab").append("<th style='padding-left: 160px!important;'>" + rackunico[j] + "</th>");
                            } else {
                                $("#tcab").append("<th style=''>" + rackunico[j] + "</th>");
                            }
                            
                        }

                        var rack = '';
                        var paleta = '';
                        var fila = '';

                        for (var i = 0; i < tmp.dd.length; i++) {
                            var valida_fila = 0;

                            if (contar == longitud) {
                                contar = 0;
                            }

                            if (valida_fila_extra == cuenta_fila_extra) {
                                var valida_fila_extra = 0;
                                $("#tb_mx tbody").append("<tr><td></td></tr>");
                            }

                            $("#tb_mx tbody").append("<tr>");
                            while (rackunico.length != 0) {
                                if (camara_ == 'C04' || camara_ == 'C03') {
                                    switch (rackunico[0]) {
                                        case 'A': rack = tmp.dd[i].A_rack; piso = tmp.dd[i].A_piso; posicion = tmp.dd[i].A_posicion; paleta = tmp.dd[i].A_nropaleta; fila = tmp.dd[i].A_fila; break;
                                        case 'B': rack = tmp.dd[i].B_rack; piso = tmp.dd[i].B_piso; posicion = tmp.dd[i].B_posicion; paleta = tmp.dd[i].B_nropaleta; fila = tmp.dd[i].B_fila; break;
                                        case 'C': rack = tmp.dd[i].C_rack; piso = tmp.dd[i].C_piso; posicion = tmp.dd[i].C_posicion; paleta = tmp.dd[i].C_nropaleta; fila = tmp.dd[i].C_fila; break;
                                        case 'D': rack = tmp.dd[i].D_rack; piso = tmp.dd[i].D_piso; posicion = tmp.dd[i].D_posicion; paleta = tmp.dd[i].D_nropaleta; fila = tmp.dd[i].D_fila; break;
                                        case 'E': rack = tmp.dd[i].E_rack; piso = tmp.dd[i].E_piso; posicion = tmp.dd[i].E_posicion; paleta = tmp.dd[i].E_nropaleta; fila = tmp.dd[i].E_fila; break;
                                        case 'F': rack = tmp.dd[i].F_rack; piso = tmp.dd[i].F_piso; posicion = tmp.dd[i].F_posicion; paleta = tmp.dd[i].F_nropaleta; fila = tmp.dd[i].F_fila; break;
                                        case 'G': rack = tmp.dd[i].G_rack; piso = tmp.dd[i].G_piso; posicion = tmp.dd[i].G_posicion; paleta = tmp.dd[i].G_nropaleta; fila = tmp.dd[i].G_fila; break;
                                        case 'H': rack = tmp.dd[i].H_rack; piso = tmp.dd[i].H_piso; posicion = tmp.dd[i].H_posicion; paleta = tmp.dd[i].H_nropaleta; fila = tmp.dd[i].H_fila; break;
                                        case 'I': rack = tmp.dd[i].I_rack; piso = tmp.dd[i].I_piso; posicion = tmp.dd[i].I_posicion; paleta = tmp.dd[i].I_nropaleta; fila = tmp.dd[i].I_fila; break;
                                        case 'J': rack = tmp.dd[i].J_rack; piso = tmp.dd[i].J_piso; posicion = tmp.dd[i].J_posicion; paleta = tmp.dd[i].J_nropaleta; fila = tmp.dd[i].J_fila; break;
                                        case 'K': rack = tmp.dd[i].K_rack; piso = tmp.dd[i].K_piso; posicion = tmp.dd[i].K_posicion; paleta = tmp.dd[i].K_nropaleta; fila = tmp.dd[i].K_fila; break;
                                        case 'L': rack = tmp.dd[i].L_rack; piso = tmp.dd[i].L_piso; posicion = tmp.dd[i].L_posicion; paleta = tmp.dd[i].L_nropaleta; fila = tmp.dd[i].L_fila; break;
                                        case 'M': rack = tmp.dd[i].M_rack; piso = tmp.dd[i].M_piso; posicion = tmp.dd[i].M_posicion; paleta = tmp.dd[i].M_nropaleta; fila = tmp.dd[i].M_fila; break;
                                        case 'N': rack = tmp.dd[i].N_rack; piso = tmp.dd[i].N_piso; posicion = tmp.dd[i].N_posicion; paleta = tmp.dd[i].N_nropaleta; fila = tmp.dd[i].N_fila; break;
                                    };
                                } else {
                                    switch (rackunico[0]) {
                                        case 'A': rack = tmp.dd[i].A_rack; piso = tmp.dd[i].A_piso; posicion = tmp.dd[i].A_posicion; paleta = tmp.dd[i].A_nropaleta; fila = tmp.dd[i].A_fila; break;
                                        case 'B': rack = tmp.dd[i].B_rack; piso = tmp.dd[i].B_piso; posicion = tmp.dd[i].B_posicion; paleta = tmp.dd[i].B_nropaleta; fila = tmp.dd[i].B_fila; break;
                                        case 'C': rack = tmp.dd[i].C_rack; piso = tmp.dd[i].C_piso; posicion = tmp.dd[i].C_posicion; paleta = tmp.dd[i].C_nropaleta; fila = tmp.dd[i].C_fila; break;
                                        case 'D': rack = tmp.dd[i].D_rack; piso = tmp.dd[i].D_piso; posicion = tmp.dd[i].D_posicion; paleta = tmp.dd[i].D_nropaleta; fila = tmp.dd[i].D_fila; break;
                                        case 'E': rack = tmp.dd[i].E_rack; piso = tmp.dd[i].E_piso; posicion = tmp.dd[i].E_posicion; paleta = tmp.dd[i].E_nropaleta; fila = tmp.dd[i].E_fila; break;
                                        case 'F': rack = tmp.dd[i].F_rack; piso = tmp.dd[i].F_piso; posicion = tmp.dd[i].F_posicion; paleta = tmp.dd[i].F_nropaleta; fila = tmp.dd[i].F_fila; break;
                                        case 'G': rack = tmp.dd[i].G_rack; piso = tmp.dd[i].G_piso; posicion = tmp.dd[i].G_posicion; paleta = tmp.dd[i].G_nropaleta; fila = tmp.dd[i].G_fila; break;
                                        case 'H': rack = tmp.dd[i].H_rack; piso = tmp.dd[i].H_piso; posicion = tmp.dd[i].H_posicion; paleta = tmp.dd[i].H_nropaleta; fila = tmp.dd[i].H_fila; break;
                                        case 'I': rack = tmp.dd[i].I_rack; piso = tmp.dd[i].I_piso; posicion = tmp.dd[i].I_posicion; paleta = tmp.dd[i].I_nropaleta; fila = tmp.dd[i].I_fila; break;
                                        case 'J': rack = tmp.dd[i].J_rack; piso = tmp.dd[i].J_piso; posicion = tmp.dd[i].J_posicion; paleta = tmp.dd[i].J_nropaleta; fila = tmp.dd[i].J_fila; break;
                                        case 'K': rack = tmp.dd[i].A_rack; piso = tmp.dd[i].K_piso; posicion = tmp.dd[i].K_posicion; paleta = tmp.dd[i].K_nropaleta; fila = tmp.dd[i].K_fila; break;
                                    };
                                }


                                    //Obtenemos camara
                                    var concatenar_inh = '';
                                    concatenar_inh = 'C' + camara_.substr(2) + rack + '' + piso;

                                    //COLUMNAS IZQUIERDA
                                    if (valida_fila == 0) {
                                        $("#tb_mx tbody").append("<td style='position: absolute;background: white; color: black; width:6%; z-index: 100;'>" + piso + "<br>&nbsp;</td>");
                                        $("#tb_mx tbody").append("<td style='position: absolute;padding-left: 100px!important;background:white;'>" + fila + "<br>&nbsp;</td>");
                                        valida_fila = 1;
                                    }

                                
                           
                                    if ($.trim(paleta) == "LIBRE") {
                                        if (rackunico[0] == 'A') {
                                            $("#tb_mx tbody").append("<td style='padding-left: 160px!important;'><span class='badge bg-success' >" + paleta + "</span></td>");
                                        } else {
                                            $("#tb_mx tbody").append("<td style=''><span class='badge bg-success' >" + paleta + "</span></td>");
                                        }
                                        contarlibre++;
                                    } else if ($.trim(paleta) == "INHABILITADO") {
                                            if (rackunico[0] == 'A') {
                                                $("#tb_mx tbody").append("<td style='padding-left: 160px!important;'><span class='badge bg-danger' >INHABILITADO</span></td>");
                                            } else {
                                                $("#tb_mx tbody").append("<td style=''><span class='badge bg-danger' >INHABILITADO</span></td>");
                                            }
                                            contarinhabilitado++;
                                        }else {
                                        var pals_cut = paleta.substring(0, 9) + '<br>' + paleta.substring(9, 16);
                                        var estado_cut = paleta.substring(17, 19);

                                        if (rackunico[0] == 'A' && estado_cut == 'DE') {
                                            $("#tb_mx tbody").append("<td style='padding-left: 160px!important;'><a type='button' style='background:#4698eb;border-radius:10px;color:white;' class='qrview'>" + pals_cut + "</a></td>");
                                        } else if (rackunico[0] != 'A' && estado_cut == 'DE') {
                                            $("#tb_mx tbody").append("<td style=''><a type='button' style='background:#4698eb;border-radius:10px;color:white;' class='qrview'>" + pals_cut + "</a></td>");
                                        } else if (rackunico[0] == 'A') {
                                            $("#tb_mx tbody").append("<td style='padding-left: 160px!important;'><a type='button' class='qrview'>" + pals_cut + "</a></td>");
                                        } else {
                                            $("#tb_mx tbody").append("<td style=''><a type='button' class='qrview'>" + pals_cut + "</a></td>");
                                        }

                                        contarocupado++;
                                    }
                               

                                rackunico.splice(0, 1);
                            }
                            $("#tb_mx tbody").append("</tr>");

                            for (var p = 0; p < rack_ap_unico.length; p++) {
                                rackunico.push(rack_ap_unico[p]);
                            }
                            
                            //Elimino primer elemento
                            contar++;
                            valida_fila_extra++;
                        }
                        
                        $("#tplibres").text(contarlibre);
                        $("#tpocupadas").text(contarocupado);
                        var contartotal = parseInt(contarlibre) + parseInt(contarocupado)+parseInt(contarinhabilitado);
                        $("#tposiciones").text(contartotal);
                        $("#tposiciones_inh").text(contarinhabilitado);

                        $("#tb_mx").addClass("animate__animated  animate__fadeInLeft");
                    }
                }
            });

        });

        

        $("#btn-excel").on("click", function () {
            window.open('data:application/vnd.ms-excel,' + encodeURIComponent($('#div_excel').html()));
            e.preventDefault();
        });


        $(document).on('click', '.qrview', function () {
            var cant = $(this).text();
            $('#qrcode').empty();
            $('#txtcode').text('');

            $('#qrcode').css({
                'width': 200,
                'height': 200
            })

            $('#qrcode').qrcode({ width: 200, height: 200, text: cant });
            $('#txtcode').text(cant);
            $('#modalqr').modal('show');
        });
        
        $("#btnMostrarStock").on("click", function () {
            
            var fecha = $("#txtfecha_").val();

            $("#tbl_display").css('display','none');

            if (fecha == "") {
                swal.fire({
                    title: "Ingresar Fecha",
                    text: "",
                    icon: "error",
                    timer:1500
                });
            } else {
                $.ajax({
                    type: "post",
                    data: JSON.stringify({ "fecha": fecha }),
                    url: "../SerFrio.asmx/MostrarStock",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    beforeSend: function () {
                        swal.fire({
                            title: "Procesando...",
                            text: "",
                            timer:500,
                            imageUrl: '../Img/loading.gif',
                            showConfirmButton: false,
                            timerProgressBar: true,
                            showClass: {
                                popup: 'animate__animated animate__fadeInDown'
                            },
                            hideClass: {
                                popup: 'animate__animated animate__fadeOutUp'
                            }
                        });
                    }, success: function (r) {
                        $("#tbl_display").fadeIn('slow', 'swing');
                        reset();
                        var parse = JSON.parse(r.d);
                        
                        for (var i = 0; i < parse.length; i++) {
                            $("#tb_x").append("<tr><td>" + parse[i].RAZON_SOCIAL + "</td><td>" + parse[i].TOTALPALETA+"</td></tr>");
                        }
                        destroy();
                    }
                });
                
            }
        });

        function destroy() {
            $("#tabla_").DataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
                },
                autoFill: true,
                responsive: true,
                dom: "Bfrtip",
                buttons: {
                    dom: {
                        button: {
                            className: 'btn'
                        }
                    },
                    buttons: [
                        {
                            extend: "excel",
                            text: "Exportar Excel",
                            className: "btn btn-success",
                            excelstyles: {
                                template: 'header_blue'
                            }
                        }
                    ]
                }
            });
        }
        function reset() {
            $("#tabla_").DataTable().destroy();
            $("#tb_x").html('');
        }

        $("#btnexcel_stock").on("click", function () {
            window.open('data:application/vnd.ms-excel,' + encodeURIComponent($('#tbl_display').html()));
            e.preventDefault();
        });

    </script>



</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">

</asp:Content>
