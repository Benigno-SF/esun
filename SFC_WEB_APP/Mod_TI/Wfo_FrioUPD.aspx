<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_FrioUPD.aspx.cs" Inherits="SFC_WEB_APP.Mod_TI.Wfo_FrioUPD" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.css" rel="stylesheet"/>

    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.light.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.2.4/css/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.2.4/css/dx.light.css" />

    <link href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/buttons/2.1.0/css/buttons.dataTables.min.css" rel="stylesheet" />

    <script src="https://cdn.amcharts.com/lib/4/core.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <div class="container m-0 p-0 w-100 text-center" id="content_header" style="display:none">
        <div class="row">
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-header">
                        <h5>FRÍO - SOLUCIONAR ERRORES</h5>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <button type="button" class="btn btn-info btn-block mt-2" id="btnconsulta" name="btnconsulta">Consultar BD</button>
            </div>
        </div>
    </div>

    <div class="container m-0 p-0 w-100 text-center" id="content_table" style="display:none">
        <div class="row">
            <div class="col-sm-12 mb-3">
                <div class="py-2 text-white" style="background:#343536">
                    <h4>Paletas con doble Ingreso</h4>
                </div>
                <table class="table table-sm bg-white" id="tb_1">
                    <thead>
                        <tr>
                            <th>Paleta</th>
                            <th>Ubicacion</th>
                        </tr>
                    </thead>
                    <tbody id="tbody_tb1">

                    </tbody>
                </table>
            </div>
            <div class="col-sm-12 mb-3">
                <div class="py-2 text-white" style="background:#343536">
                    <h4>Paletas con más de una salida (Negativos)</h4>
                </div>
                <table class="table table-sm bg-white" id="tb_2">
                    <thead>
                        <tr>
                            <th>Paleta</th>
                            <th>Ubicacion</th>
                        </tr>
                    </thead>
                    <tbody id="tbody_tb2">

                    </tbody>
                </table>
            </div>
            <div class="col-sm-12 mb-3">
                <div class="py-2 text-white" style="background:#343536">
                    <h4>Ubicaciones duplicadas</h4>
                </div>
                <table class="table table-sm bg-white" id="tb_3">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Paleta</th>
                            <th>Ubicacion</th>
                        </tr>
                    </thead>
                    <tbody id="tbody_tb3">

                    </tbody>
                </table>
            </div>
            <div class="col-sm-12 mb-3">
                <div class="py-2 text-white" style="background:#343536">
                    <h4>Paletas duplicadas</h4>
                </div>
                <table class="table table-sm bg-white" id="tb_4">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Paleta</th>
                            <th>Ubicacion</th>
                        </tr>
                    </thead>
                    <tbody id="tbody_tb4">

                    </tbody>
                </table>
            </div>
            <div class="col-sm-12 mb-3">
                <div class="py-2 text-white" style="background:#343536">
                    <h4>Paletas en orden que no corresponde (FIFO)</h4>
                </div>
                <table class="table table-sm bg-white" id="tb_5">
                    <thead>
                        <tr>
                            <th>Orden</th>
                            <th>Ubicacion</th>
                            <th>Paleta</th>
                            <th>Ubicacion</th>
                        </tr>
                    </thead>
                    <tbody id="tbody_tb5">

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <hr />

        <div class="col-sm-12" style="display:none" id="content_input">
            <div class="card">
                <div class="card-header text-center text-white" style="background:#2360a6">
                    <h5>CONSULTAR PALETA (PASO 1) <a style="cursor:pointer" id="modal_ayuda"><i class="fas fa-info-circle"></i></a></h5>
                </div>
                <div class="card-body row">
                    <div class="col-sm-6">
                        <input type="text" placeholder="NRO PALETA" class="form-control" id="txtnropaleta" name="txtnropaleta" autocomplete="off" />
                    </div>
                    <div class="col-sm-6">
                        <button type="button" class="btn btn-success" id="btnsol" name="btnsol">MOSTRAR DATA</button>
                    </div>
                </div>
            </div>
        </div>

    <hr />
    <div class="container text-center" style="display:none" id="tb_detalle_uno">
        <div class="row">
            <div class="col-sm-12 table-responsive">
                <h4>TABLA MOV UBICACION</h4>
                <table class="table table-hover table-sm" id="tbg_uno">
                    <thead>
                        <tr class="bg-info">
                            <th>ID</th>
                            <th>IDEMPRESA</th>
                            <th>NROPALETA</th>
                            <th>UBICACION</th>
                            <th>UBICACION PALETA</th>
                            <th>FECHA REGISTRO</th>
                            <th>MOVIMIENTO</th>
                            <th>FACTOR</th>
                            <th>STOCK</th>
                        </tr>
                    </thead>
                    <tbody id="tbx_uno">

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="container text-center">
        <div class="row">
            <div class="col-sm-12" id="add_valida_uno">

            </div>
        </div>
    </div>

    <div class="container mb-3 text-center"  style="display:none" id="tb_detalle_dos">
        <div class="row">
            <div class="col-sm-12 table-responsive">
                <h4>TABLA MOV UBICACION PALETA</h4>
                <table class="table table-hover table-sm" id="tbg_dos">
                    <thead >
                        <tr class="bg-info">
                            <th>ID</th>
                            <th>IDEMPRESA</th>
                            <th>NROPALETA</th>
                            <th>UBICACION</th>
                            <th>UBICACION PALETA</th>
                            <th>FECHA REGISTRO</th>
                            <th>MOVIMIENTO</th>
                            <th>FACTOR</th>
                            <th>STOCK</th>
                        </tr>
                    </thead>
                    <tbody id="tbx_dos">

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="container text-center">
        <div class="row">
            <div class="col-sm-12" id="add_valida_dos">

            </div>
        </div>
    </div>



    <!-- Modal AYUDA -->
    <div class="modal fade" id="ModalHelp" tabindex="-1" aria-labelledby="ModalHelp" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Recomendaciones</h5>
            <button type="button" class="btn-close" onclick="CerrarModal()" id="btncerrar" data-mdb-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
              <div class="container">
                  <div class="row">
                      <div class="col-sm-12">
                          <p>1.- Se recomienda copiar y pegar los numero de paleta que se encuentra en la tabla <b>"Paletas con doble Ingreso".</b></p>
                          <p>2.- Se recomienda copiar y pegar los numero de paleta que se encuentra en la tabla <b>"Paletas en orden que no corresponde (FIFO)."</b></p>
                      </div>
                  </div>
              </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-info" onclick="CerrarModal()" data-mdb-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>


    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="//cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.1.0/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
   

    <script>

        $("document").ready(function () {
            $("#content_header").fadeIn();
            $("#content_header").fadeIn("slow");
            $("#content_header").fadeIn(4000);
        });

        //Longitudes
        var l1 = 0;
        var l2 = 0;
        var l3 = 0;
        var l4 = 0;
        var l5 = 0;

        $("#btnconsulta").on("click", function () {

            fadeIn();
            Emptytable();

            $.ajax({
                type: "post",
                data: JSON.stringify({ "d": "" }),
                url: "../SerTI.asmx/ConsultarErroresfrio",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                beforeSend: function () {
                    $("#content_table").css("display", "none");
                    $("#con_sin_stock").css("display", "none");
;                    swal.fire({
                        title: "Procesando...",
                        text: "",
                        imageUrl: '../Img/loading.gif',
                        showConfirmButton: false,
                        timer: 800,
                        timerProgressBar: true,
                        showClass: {
                            popup: 'animate__animated animate__fadeInDown'
                        },
                        hideClass: {
                            popup: 'animate__animated animate__fadeOutUp'
                        }
                    });
                }, success: function (r) {
                    
                    fadeIn();
                    var tmp = JSON.parse(r.d);

                    //Longitudes
                    l1 = 0;
                    l2 = 0;
                    l3 = 0;
                    l4 = 0;
                    l5 = 0;

                    //Asignar Longitudes
                    l1 = tmp.d1.length;
                    l2 = tmp.d2.length;
                    l3 = tmp.d3.length;
                    l4 = tmp.d4.length;
                    l5 = tmp.d5.length;

                    //console.log(l1+" "+l2+" "+l3+" "+l4+" "+l5);

                    if (parseInt(l1) == 0 && parseInt(l2) == 0 && parseInt(l3) == 0 && parseInt(l4) == 0 && parseInt(l5) == 0) {                      
                        $("#content_input").attr("hidden", "true");
                    } else {
                        $("#content_input").removeAttr("hidden", "true");
                    }
                        
                        //VARIABLE AUXILIAR QUE CONSTRUYE TABLAS
                        var tbcnct = '';

                        //PRIMERA TABLA -- Paletas con doble Ingreso
                        if (parseInt(l1) == 0) {
                            tbcnct = '<tr>';
                            tbcnct += '<td style="color:#d11932">SIN DATA</td><td style="color:#d11932">SIN DATA</td>';
                            tbcnct += '</tr>';
                            $("#tbody_tb1").append(tbcnct);
                        } else {
                            for (var i = 0; i < tmp.d1.length; i++) {
                                tbcnct = '<tr>';
                                tbcnct += '<td>' + tmp.d1[i].DOBLE_INGRESO + '</td>' + '<td>' + tmp.d1[i].IDUBICACION + '</td>';
                                tbcnct += "</tr>";
                                $("#tbody_tb1").append(tbcnct);
                            }
                        }

                        tbcnct = '';

                        //SEGUNDA TABLA -- Paletas con más de una salida (Negativos)
                        if (parseInt(l2) == 0) {
                            tbcnct = '<tr>';
                            tbcnct += '<td style="color:#d11932">SIN DATA</td><td style="color:#d11932">SIN DATA</td>';
                            tbcnct += '</tr>';
                            $("#tbody_tb2").append(tbcnct);
                        } else {
                            for (var i = 0; i < tmp.d2.length; i++) {
                                tbcnct = '<tr>';
                                tbcnct += "<td>" + tmp.d2[i].NROPALETA + "</td>" + "<td>" + tmp.d2[i].IDUBICACION + "</td>";
                                tbcnct += "</tr>";
                                $("#tbody_tb2").append(tbcnct);
                            }
                        }

                        tbcnct = '';

                        //TERCERA TABLA -- Ubicaciones duplicadas
                        if (parseInt(l3) == 0) {
                            tbcnct = '<tr>';
                            tbcnct += '<td style="color:#d11932">SIN DATA</td><td style="color:#d11932">SIN DATA</td><td style="color:#d11932">SIN DATA</td>';
                            tbcnct += '</tr>';
                            $("#tbody_tb3").append(tbcnct);
                        } else {
                            for (var j = 0; j < tmp.d3.length; j++) {
                                tbcnct = '<tr>';
                                tbcnct += '<td>' + tmp.d3[j].a + '</td>' + '<td>' + tmp.d3[j].NROPALETA + '</td>' + '<td>' + tmp.d3[j].IDUBICACION + '</td>';
                                tbcnct += '</tr>';
                                $("#tbody_tb3").append(tbcnct);
                            }
                        }

                        tbcnct = '';

                        //CUARTA TABLA -- Paletas duplicadas
                        if (parseInt(l4) == 0) {
                            tbcnct = '<tr>';
                            tbcnct += '<td style="color:#d11932">SIN DATA</td><td style="color:#d11932">SIN DATA</td><td style="color:#d11932">SIN DATA</td>';
                            tbcnct += '</tr>';
                            $("#tbody_tb4").append(tbcnct);
                        } else {
                            for (var j = 0; j < tmp.d4.length; j++) {
                                tbcnct = '<tr>';
                                tbcnct += '<td>' + tmp.d4[j].a + '</td>' + '<td>' + tmp.d4[j].NROPALETA + '</td>' + '<td>' + tmp.d4[j].IDUBICACION + '</td>';
                                tbcnct += '</tr>';
                                $("#tbody_tb4").append(tbcnct);
                            }
                        }


                        tbcnct = '';

                        //QUINTA TABLA -- Paletas en orden que no corresponde (FIFO)
                        if (parseInt(l5) == 0) {
                            tbcnct = '<tr>';
                            tbcnct += '<td style="color:#d11932">SIN DATA</td><td style="color:#d11932">SIN DATA</td><td style="color:#d11932">SIN DATA</td><td style="color:#d11932">SIN DATA</td>';
                            tbcnct += '</tr>';
                            $("#tbody_tb5").append(tbcnct);
                        } else {
                            for (var j = 0; j < tmp.d5.length; j++) {
                                tbcnct = '<tr>';
                                tbcnct += '<td>' + tmp.d5[j].orden + '</td>' + '<td>' + tmp.d5[j].ubi + '</td>' + '<td>' + tmp.d5[j].NROPALETA + '</td>' + '<td>' + tmp.d5[j].IDUBICACION + '</td>';
                                tbcnct += '</tr>';
                                $("#tbody_tb5").append(tbcnct);
                            }
                        }
                        dt_fram();
                }
            });
        });


        $("#btnsol").on("click", function () {
            var nropaleta = $("#txtnropaleta").val();
            ResetDataTable();

            if (nropaleta == '') {
                swal.fire({
                    title: "Ingresar Número de Paleta",
                    text: "",
                    icon: "error",
                    timer: 1500,
                    timerProgressBar: true,
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    },
                    showConfirmButton: false
                });
            } else {

                setTabla();
                fadeInDetalle();
                
                $.ajax({
                    type: "post",
                    data: JSON.stringify({ "paleta": nropaleta }),
                    url: "../SerTI.asmx/ConsultarPaleta",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (r) {
                        var p = JSON.parse(r.d);

                        var data = "";
                        var bool = 0;
                        var paletabool = "";
                        var ultimo = 0;
                        var ultimo_bool = "";
                        var ultimo_ID = "";
                        var sumafactor = 0;
                        var IDENEGATIVO = [];
                        var negativobool = 0;

                        for (var i = 0; i < p.a.length; i++) {
                            data = "<tr>";
                            
                            sumafactor = parseInt(sumafactor) + parseInt(p.a[i].FACTOR);
                            console.log(sumafactor);

                            if (parseInt(p.a[0].FACTOR) == -1) {
                                bool = 1;
                                paletabool = p.a[0].NROPALETA;
                                ultimo_ID = 0;
                                data += "<td>" + p.a[i].ID + "</td><td>" + p.a[i].IDEMPRESA + "</td><td>" + p.a[i].NROPALETA + "</td><td>" + p.a[i].UBICACION + "</td><td>" + p.a[i].UBICACION_PALETA + "</td><td>" + p.a[i].FECHA + "</td><td>" + p.a[i].MOVIMIENTO + "</td><td>" + p.a[i].FACTOR + "</td><td>" + p.a[i].STOCK + "</td>";
                                data += "</tr>";
                            } else if (parseInt((p.a[p.a.length - 1].UBICACION_PALETA).substring(5, 7)) > 1) {
                                ultimo = 1;
                                ultimo_bool = p.a[i].UBICACION_PALETA;
                                ultimo_ID = p.a[i].ID;
                                paletabool = p.a[i].NROPALETA;
                                data += "<td>" + p.a[i].ID + "</td><td>" + p.a[i].IDEMPRESA + "</td><td>" + p.a[i].NROPALETA + "</td><td>" + p.a[i].UBICACION + "</td><td>" + p.a[i].UBICACION_PALETA + "</td><td>" + p.a[i].FECHA + "</td><td>" + p.a[i].MOVIMIENTO + "</td><td>" + p.a[i].FACTOR + "</td><td>" + p.a[i].STOCK + "</td>";
                                data += "</tr>";
                            }

                            if (sumafactor < 0 || sumafactor > 1) {
                                IDENEGATIVO.push(p.a[i].ID);
                                negativobool = 1;
                                paletabool = p.a[i].NROPALETA;
                                data += "<td>" + p.a[i].ID + "</td><td>" + p.a[i].IDEMPRESA + "</td><td>" + p.a[i].NROPALETA + "</td><td>" + p.a[i].UBICACION + "</td><td>" + p.a[i].UBICACION_PALETA + "</td><td>" + p.a[i].FECHA + "</td><td>" + p.a[i].MOVIMIENTO + "</td><td>" + p.a[i].FACTOR + "</td><td>" + p.a[i].STOCK + "</td>";
                                data += "</tr>";
                            }
                            $("#tbx_uno").append(data);
                        }

                        console.log(l5);

                        if (bool == 1 && ultimo == 1) {
                            $("#add_valida_uno").append("<label class='badge bg-primary text-wrap mt-2' style='font-size:16px'>Diagnostico: El registro de la paleta " + paletabool + " inicia con factor negativo (salida), la cual no es lo que corresponde, por tal sentido se tiene la siguiente solución.</label>");
                            $("#add_valida_uno").append("<h4>Solución para tabla MOV UBICACION:</h4>");
                           // $("#add_valida_uno").append('<button type="button" class="btn btn-danger" id="btnupdatemov_neg" name="btnupdatemov_neg" onclick="btnultimoneg(' + "'" + ultimo_ID + "'" + "," + "'" + paletabool + "'" + ')"  >Cambiar IDEMPRESA de todos los registrossssssssss.</button>');
                            $("#add_valida_uno").append("<label class='text-wrap mt-1' style='font-weight:bold'>*Después de ejecutar el procedimiento, obligatoriamente tiene que volver hacer el ingreso de la paleta para que pueda tomar la posición en la camara y rack que corresponde.</label>");
                            $("#add_valida_uno").append("<hr>");
                        } else if (negativobool == 1) {
                            $("#add_valida_uno").append("<label class='badge bg-primary text-wrap mt-2' style='font-size:16px'>Diagnostico: El registro de la paleta " + paletabool + " a partir del ID numero " + IDENEGATIVO[0] + " presenta inconsistencias de ingresos y salidas (NEGATIVOS). </label>");
                            $("#add_valida_uno").append("<h4>Solución para tabla MOV UBICACION:</h4>");
                            $("#add_valida_uno").append('<button type="button" class="btn btn-danger" onclick="btnultimo_inc(' + "'" + IDENEGATIVO[0] + "'" + "," + "'" + paletabool + "'" + ')">Cambiar IDEMPRESA a partir del ID' + IDENEGATIVO[0] + '</button>');
                            $("#add_valida_uno").append("<label class='text-wrap mt-1' style='font-weight:bold'>*Después de ejecutar el procedimiento, obligatoriamente tiene que volver hacer el ingreso de la paleta para que pueda tomar la posición en la camara y rack que corresponde.</label>");
                            $("#add_valida_uno").append("<hr>");
                        } else if (bool == 1) {
                            $("#add_valida_uno").append("<label class='badge bg-primary text-wrap mt-2' style='font-size:16px'>Diagnostico: El registro de la paleta " + paletabool + " inicia con factor negativo (salida), la cual no es lo que corresponde, por tal sentido se tiene la siguiente solución.</label>");
                            $("#add_valida_uno").append("<h4>Solución para tabla MOV UBICACION Y MOV UBICACION PALETA:</h4>");
                            $("#add_valida_uno").append('<button type="button" class="btn btn-danger" id="btnupdatemov_neg" name="btnupdatemov_neg" onclick="btnprimernegativo(' + "'" + ultimo_ID + "'" + "," + "'" + paletabool + "'" + ')">Cambiar IDEMPRESA de todos los registros.</button>');
                            $("#add_valida_uno").append("<label class='text-wrap mt-1' style='font-weight:bold'>*Después de ejecutar el procedimiento, obligatoriamente tiene que volver hacer el ingreso de la paleta para que pueda tomar la posición en la camara y rack que corresponde.</label>");
                            $("#add_valida_uno").append("<hr>");
                        } else if (ultimo == 1 && parseInt(l5) > 0) {
                            $("#add_valida_uno").append("<label class='badge bg-primary text-wrap mt-2' style='font-size:16px'>Diagnostico: El último registro de la paleta " + paletabool + " tiene la posición (<b>" + ultimo_bool + ")</b> la cual no corresponde según la metodología FIFO.</label>");
                            $("#add_valida_uno").append("<h4>Solución para tabla MOV UBICACION:</h4>");
                            $("#add_valida_uno").append('<button type="button" class="btn btn-danger" onclick="btnultimo(' + "'" + ultimo_ID + "'" + "," + "'" + paletabool + "'" + ')"  id="btnupdatemov" name="btnupdatemov">Cambiar IDEMPRESA del último registro.</button>');
                            $("#add_valida_uno").append("<label class='text-wrap mt-1' style='font-weight:bold'>*Después de ejecutar el procedimiento, obligatoriamente se tiene que volver hacer el ingreso a la paleta para que pueda reestructurarse y pueda tomar la posicion correcta.</label>");
                            $("#add_valida_uno").append("<hr>");
                        }

                        
                        var data_d = "";
                        var bool_d = 0;
                        var paletabool_d = "";
                        var ultimo_d = 0;
                        var ultimo_bool_d = "";
                        var ultimo_bool_IDE = "";
                        var sumafactor_d = 0;
                        var IDENEGATIVO_d = [];
                        var negativobool_d = 0;


                        for (var i = 0; i < p.b.length; i++) {
                            data_d = "<tr>";

                            sumafactor_d = parseInt(sumafactor_d) + parseInt(p.b[i].FACTOR);
                            console.log(sumafactor_d);

                            if (parseInt(p.b[0].FACTOR) == -1) {
                                bool_d = 1;
                                paletabool_d = p.b[i].NROPALETA;
                                data_d += "<td>" + p.b[i].ID + "</td><td>" + p.b[i].IDEMPRESA + "</td><td>" + p.b[i].NROPALETA + "</td><td>" + p.b[i].UBICACION + "</td><td>" + p.b[i].UBICACION_PALETA + "</td><td>" + p.b[i].FECHA + "</td><td>" + p.b[i].MOVIMIENTO + "</td><td>" + p.b[i].FACTOR + "</td><td>" + p.b[i].STOCK + "</td>";
                                data_d += "</tr>";
                            } else if (parseInt((p.b[p.b.length - 1].UBICACION_PALETA).substring(5, 7)) > 1) {
                                ultimo_d = 1;
                                ultimo_bool_d = p.b[i].UBICACION_PALETA;
                                ultimo_bool_IDE = p.b[i].ID;
                                paletabool_d = p.b[i].NROPALETA;
                                data_d += "<td>" + p.b[i].ID + "</td><td>" + p.b[i].IDEMPRESA + "</td><td>" + p.b[i].NROPALETA + "</td><td>" + p.b[i].UBICACION + "</td><td>" + p.b[i].UBICACION_PALETA + "</td><td>" + p.b[i].FECHA + "</td><td>" + p.b[i].MOVIMIENTO + "</td><td>" + p.b[i].FACTOR + "</td><td>" + p.b[i].STOCK + "</td>";
                                data_d += "</tr>";
                            }

                            if (sumafactor_d < 0 || sumafactor_d > 1) {
                                IDENEGATIVO_d.push(p.b[i].ID);
                                negativobool_d = 1;
                                paletabool_d = p.b[i].NROPALETA;
                                data_d += "<td>" + p.b[i].ID + "</td><td>" + p.b[i].IDEMPRESA + "</td><td>" + p.b[i].NROPALETA + "</td><td>" + p.b[i].UBICACION + "</td><td>" + p.b[i].UBICACION_PALETA + "</td><td>" + p.b[i].FECHA + "</td><td>" + p.b[i].MOVIMIENTO + "</td><td>" + p.b[i].FACTOR + "</td><td>" + p.b[i].STOCK + "</td>";
                                data_d += "</tr>";
                            }

                            $("#tbx_dos").append(data_d);
                        }

                        if (bool_d == 1 && ultimo_d == 1) {
                            $("#add_valida_dos").append("<label class='badge bg-primary text-wrap mt-2' style='font-size:16px'>Diagnostico: El registro de la paleta " + paletabool_d + " inicia con factor negativo (salida), la cual no es lo que corresponde, por tal sentido se tiene la siguiente solución.</label>");
                            $("#add_valida_dos").append("<h4>Solución para tabla MOV UBICACIONPALETA:</h4>");
                            $("#add_valida_dos").append("<button type='button'  class='btn btn-danger'>Cambiar IDEMPRESA de todos los registros.</button>");
                            $("#add_valida_dos").append("<label class='text-wrap mt-1' style='font-weight:bold'>*Después de ejecutar el procedimiento, obligatoriamente tiene que volver hacer el ingreso de la paleta para que pueda tomar la posición en la camara y rack que corresponde.</label>");
                            $("#add_valida_dos").append("<hr>");
                        } else if (negativobool_d == 1) {
                            $("#add_valida_dos").append("<label class='badge bg-primary text-wrap mt-2' style='font-size:16px'>Diagnostico: El registro de la paleta " + paletabool_d + " a partir del ID numero " + IDENEGATIVO_d[0] + " presenta inconsistencias de ingresos y salidas (NEGATIVOS). </label>");
                            $("#add_valida_dos").append("<h4>Solución para tabla MOV UBICACIONPALETA:</h4>");
                            $("#add_valida_dos").append('<button type="button" class="btn btn-danger" onclick="btnultimo_inc_movpalet(' + "'" + IDENEGATIVO_d[0] + "'" + "," + "'" + paletabool_d + "'" + ')">Cambiar IDEMPRESA a partir del ID' + IDENEGATIVO_d[0] + '</button>');
                            $("#add_valida_dos").append("<label class='text-wrap mt-1' style='font-weight:bold'>*Después de ejecutar el procedimiento, obligatoriamente tiene que volver hacer el ingreso de la paleta para que pueda tomar la posición en la camara y rack que corresponde.</label>");
                            $("#add_valida_dos").append("<hr>");
                        } else if (bool_d == 1) {
                            $("#add_valida_dos").append("<label class='badge bg-primary text-wrap mt-2' style='font-size:16px'>Diagnostico: El registro de la paleta " + paletabool_d + " inicia con factor negativo (salida), la cual no es lo que corresponde, por tal sentido se tiene la siguiente solución.</label>");
                            $("#add_valida_dos").append("<h4>Solución para tabla MOV UBICACIONPALETA:</h4>");
                            $("#add_valida_dos").append("<h4>Solo se realiza un movimiento, favor de ingresar a la primera tabla.</h4>");
                            $("#add_valida_dos").append("<label class='text-wrap mt-1' style='font-weight:bold'>*Después de ejecutar el procedimiento, obligatoriamente tiene que volver hacer el ingreso de la paleta para que pueda tomar la posición en la camara y rack que corresponde.</label>");
                            $("#add_valida_dos").append("<hr>");
                        } else if (ultimo_d == 1 && parseInt(l5) > 0) {
                            $("#add_valida_dos").append("<label class='badge bg-primary text-wrap mt-2' style='font-size:16px'>Diagnostico: El último registro de la paleta " + paletabool_d + " tiene la posición (<b>" + ultimo_bool_d + ")</b> la cual no corresponde según la metodología FIFO.</label>");
                            $("#add_valida_dos").append("<h4>Solución para tabla MOV UBICACIONPALETA:</h4>");
                            $("#add_valida_dos").append('<button type="button" class="btn btn-danger" onclick="btnultimo_mov(' + "'" + ultimo_bool_IDE + "'" + "," + "'" + paletabool_d + "'" + ')" >Cambiar IDEMPRESA del último registro.</button>');
                            $("#add_valida_dos").append("<label class='text-wrap mt-1' style='font-weight:bold'>*Después de ejecutar el procedimiento, obligatoriamente se tiene que volver hacer el ingreso a la paleta para que pueda reestructurarse y pueda tomar la posicion correcta.</label>");
                            $("#add_valida_dos").append("<hr>");
                        } 
                        evaluar();
                    }
                });
                ResetDataTable();
            }
            
        });

        function btnultimo(a,b) {
            var ID = a;
            var paleta = b;
            $.ajax({
                type: "post",
                data: JSON.stringify({ "ID": ID, "paleta": paleta }),
                url: "../SerTI.asmx/EliminarUltimoElemento",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                beforeSend: function () {
                    swal.fire({
                        title: "Procesando...",
                        text: "",
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
                    //console.log(r);
                    if (parseInt(r.d[0]) > 0) {
                        swal.fire({
                            title: "Se actualizó con exito la tabla MOVUBICACION",
                            text: "",
                            icon: "success",
                            timer:1500
                        });
                    } else {
                        swal.fire({
                            title: "No se actualizó IDEMPRESA",
                            text: "",
                            icon: "error",
                            timer: 1500
                        });
                    }
                }
            });
        }

        function btnultimo_mov(a, b) {
            var ID = a;
            var paleta = b;
            $.ajax({
                type: "post",
                data: JSON.stringify({ "ID": ID, "paleta": paleta }),
                url: "../SerTI.asmx/EliminarUltimoElementoMov",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                beforeSend: function () {
                    swal.fire({
                        title: "Procesando...",
                        text: "",
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
                    if (parseInt(r.d[0]) > 0) {
                        swal.fire({
                            title: "Se actualizó con exito la tabla MOVUBICACIONPALETA",
                            text: "",
                            icon: "success",
                            timer:1500
                        });
                    } else {
                        swal.fire({
                            title: "No se actualizó IDEMPRESA",
                            text: "",
                            icon: "error",
                            timer: 1500
                        });
                    }
                }
            });
        }

        function btnultimo_inc_movpalet(ide,paleta) {
            
            $.ajax({
                type: "post",
                data: JSON.stringify({ "ID": ide, "paleta": paleta }),
                url: "../SerTI.asmx/EliminarwhenNegativoMovUbicPaleta",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                beforeSend: function () {
                    swal.fire({
                        title: "Procesando...",
                        text: "",
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
                    if (parseInt(r.d[0]) > 0) {
                        swal.fire({
                            title: "Se actualizó con exito la tabla MOVUBICACIONPALETA",
                            text: "",
                            icon: "success",
                            timer: 1500
                        });
                    } else {
                        swal.fire({
                            title: "No se actualizó IDEMPRESA",
                            text: "",
                            icon: "error",
                            timer: 1500
                        });
                    }
                }
            });
        }

        function btnprimernegativo(a, b) {
            var ID = "";
            var PALETA = $.trim(b);
            $.ajax({
                type: "POST",
                data: JSON.stringify({ "ID": ID, "paleta": PALETA }),
                url: "../SerTI.asmx/EliminarTodoMovimiento",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                beforeSend: function () {
                    swal.fire({
                        title: "Procesando...",
                        text: "",
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
                    if (parseInt(r.d[0]) > 0) {
                        swal.fire({
                            title: "Se actualizó con exito la tabla MOVUBICACION Y MOVUBICACIONPALETA",
                            text: "",
                            icon: "success",
                            timer: 1500
                        });



                        $("#tbx_uno").html('');
                        $("#tbx_dos").html('');
                    } else {
                        swal.fire({
                            title: "No se actualizó IDEMPRESA",
                            text: "",
                            icon: "error",
                            timer: 1500
                        });
                    }

                }
            });

        }


        function btnultimo_inc(ide,paleta) {
            
            $.ajax({
                type: "post",
                data: JSON.stringify({ "ID": ide, "paleta": paleta }),
                url: "../SerTI.asmx/EliminarwhenNegativo",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                beforeSend: function () {
                    swal.fire({
                        title: "Procesando...",
                        text: "",
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
                    if (parseInt(r.d[0]) > 0) {
                        swal.fire({
                            title: "Se actualizó con exito la tabla MOVUBICACION - Negativos solucionados.",
                            text: "",
                            icon: "success",
                            timer: 1500
                        });
                    } else {
                        swal.fire({
                            title: "No se actualizó IDEMPRESA",
                            text: "",
                            icon: "error",
                            timer: 1500
                        });
                    }
                }
            });
        }

        function dt_fram() {
            $("#tb_1").DataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
                },
                autoFill: true,
                responsive: true
            });

            $("#tb_2").DataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
                },
                autoFill: true,
                responsive: true
            });

            $("#tb_3").DataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
                },
                autoFill: true,
                responsive: true
            });

            $("#tb_4").DataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
                },
                autoFill: true,
                responsive: true
            });

            $("#tb_5").DataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
                },
                autoFill: true,
                responsive: true
            });

        }

        function Emptytable() {
            $("#tb_1").DataTable().destroy();
            $("#tb_2").DataTable().destroy();
            $("#tb_3").DataTable().destroy();
            $("#tb_4").DataTable().destroy();
            $("#tb_5").DataTable().destroy();
            $("#tbody_tb1").html('');
            $("#tbody_tb2").html('');
            $("#tbody_tb3").html('');
            $("#tbody_tb4").html('');
            $("#tbody_tb5").html('');
            
        }

        function fadeIn() {
            $("#content_table").fadeIn('slow', 'swing');
            $("#div_boton").fadeIn('slow', 'swing');
            $("#content_input").fadeIn('slow', 'swing');
            $("#con_sin_stock").fadeIn('slow', 'swing');
            $("#content_input").focus();
        }

        function ResetDataTable() {
            $("#tbg_uno").DataTable().destroy();
            $("#tbg_dos").DataTable().destroy();
        }

        function fadeInDetalle() {
            $("#tb_detalle_uno").fadeIn('slow', 'swing');
            $("#tb_detalle_dos").fadeIn('slow', 'swing');
        }

        function evaluar() {   
            $("#tbg_uno").DataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
                },
                autoFill: true,
                responsive: true
            });
            $("#tbg_dos").DataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
                },
                autoFill: true,
                responsive: true
            });
        }
        
        function setTabla() {
            $("#tbx_uno").html('');
            $("#tbx_dos").html('');
            $("#add_valida_uno").html('');
            $("#add_valida_dos").html('');
        }

        $("#modal_ayuda").on("click", function () {
            $("#ModalHelp").modal();
        });
        function CerrarModal() {
            $("#ModalHelp").modal('toggle');
        }

    </script>



</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>

