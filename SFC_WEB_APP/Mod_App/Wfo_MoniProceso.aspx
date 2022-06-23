<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_MoniProceso.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_MoniEstatistics" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>Monitor Proceso</title>

    <%: Styles.Render("~/Content/css") %>
    <%: Scripts.Render("~/jquery") %>
    <style>
        #footer {
            width: 100%;
            height: 30px;
            background: #333;
            border-top: 2px solid #000;
            position: absolute;
            bottom: 0;
        }

        body {
           /* color: lawngreen;
            background-color: #212529 !important;*/
        }

        .divt {
            padding: 0px;
            background-color: coral;
            color: white;
            padding: 3px;
        }

        .divc {
            border-left: solid;
            border-right: solid;
            border-color: coral;
            height: 80vh;
            padding: 0px;
        }

        .right {
            float: right;
        }

        .tbRend {
            font-size: 16px;
        }

            .tbRend td {
                border-bottom: 1px solid white;
                font-size: 14px;
            }

        .tittleth {
            color: grey;
        }
    </style>

    <style>
        .table.table-sm th, .table.table-sm td {
            padding: 0.3rem 0.6rem;
            vertical-align: middle;
            margin: auto;
            font-weight: bold;
        }
    </style>
</head>

<body>

    <div class="row">
        <div class="col-md-3" style="margin: auto">
            <h3>MONITOR DE LINEAS - <span id="fecha"></span></h3>
        </div>
        <div class="col-md-3" style="margin: auto">
            <button class="btn btn-success btn-small ft-bold"">
                <span id="totalcajas" style="font-weight: bold"></span> TOTAL CAJAS
            </button>
        </div>
        <div class="col-md-3" style="margin: auto">
            <button class="btn btn-primary btn-small ft-bold"">
                <span id="totalabastecido" style="font-weight: bold"></span> TOTAL ABASTECIDO
            </button>
        </div>
        <div class="col-md-3">
            <div class="row">
                <div class="col-md-4 mb-0" style="margin: auto">
                    <div class="form-group">
                            <div id="loading" style="display: none">
                               Actualizando.... <img src="../img/loading.gif">
                            </div>
                        <div id="displayReloj"></div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtFeCont">Fecha Inicio</label>
                        <input type="text" id="txtFeCont" name="txtFeCont" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
                        <script type="text/javascript">
                            $(function () {
                                $('#txtFeCont').datetimepicker({
                                    format: 'DD-MM-YYYY',
                                    locale: 'es'
                                });
                                $(function () {
                                    $('#DivFeCont').datetimepicker({
                                        format: 'DD-MM-YYYY',
                                        locale: 'es'
                                    });
                                });
                            });
                        </script>
                    </div>
                </div>
                <div class="col-md-4 mb-0" style="margin: auto">
                    <div class="form-group">
                        <button class="btn btn-primary btn-large" id="recuperar">Recuperar</button>
                    </div>
                </div>
            </div>


        </div>
    </div>


    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <table id="tblLineas" class="table table-sm table-stripe table-bordered ">
                        <thead>
                            <tr>
                                <th style="font-weight: bold" class="align-middle">Linea</th>
                                <th style="font-weight: bold" class="align-middle">E</th>
                                <th style="font-weight: bold" class="align-middle">S</th>
                                <th style="font-weight: bold" class="align-middle">CL</th>
                                <th style="font-weight: bold" class="align-middle"><i class="fas fa-users" style="color: blue;"></i> Total <br />Personas</th>
                                <th style="font-weight: bold" class="align-middle"><i class="fas fa-boxes" style="color: green;"></i> Clamshell</th>
                                <th style="font-weight: bold" class="align-middle"><i class="fas fa-box" style="color: green;"></i> Cajas</th>
                                <th style="font-weight: bold" class="align-middle">% Cajas/Total</th>
                                <th style="font-weight: bold; text-align: center">Cajas <br />x Hora</th>
                                <th style="font-weight: bold; text-align: center">Clamshell <br />x Hora</th>
                                <th style="font-weight: bold"><i class="fas fa-clock" style="color: purple;"></i> Inicio </th>
                                <th style="font-weight: bold"><i class="fas fa-stopwatch" style="color: purple;"></i> Final </th>
                                <th style="font-weight: bold">Tiempo Linea</th>
                                <th style="font-weight: bold">Kilos Abastecidos</th>
                                <th style="font-weight: bold">% Kilos/Total</th>
                                <th style="font-weight: bold">Estado Linea</th>
                                <th style="font-weight: bold">Supervisora</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <%: Scripts.Render("~/js") %>
    <script>
        $(document).ready(function () {
            //setInterval('showGraph()',5000);
            showGraph();
        });

        $("#recuperar").click(function () {
            segundos = 10;
            reloj();
           // showGraph();
        });

        var segundos = 10;
        function reloj() {
            if (segundos == 60) {
                document.getElementById('displayReloj').innerHTML = '01:00';
            } else if (segundos > 9) {
                document.getElementById('displayReloj').innerHTML = 'update in : ' + segundos;
            } else {
                document.getElementById('displayReloj').innerHTML = 'update in : ' + '0' + segundos;
            }
            if (segundos == 0) {
                //reloj();
                showGraph();
            } else {
                var t = setTimeout(function () { reloj() }, 1000);
            }
            segundos--;
        }


        function showGraph() {
            var obj = new Object();
            obj.vcIdEmpresa = 'iOSoj9CXOnnbgHw5p9jlfQ==';
            obj.vnIdGrupo = 1;
            obj.vcFecha = $("#txtFeCont").val();;
            $('#loading').show();
           
            if (obj.vcIdEmpresa != "") {
                $.ajax({
                    type: 'POST',
                    url: "SerApp.asmx/ListRendimientoProcesoRegistroRT",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        
                        var lst = JSON.parse(data.d);
                        var vvBody = "";
                        if (lst != "") {
                            $('#totalabastecido').text(formatNumber.new(lst[0].totalkilos.toFixed(2)) + ' KG');
                            $('#totalcajas').text(formatNumber.new(lst[0].totalcajas.toFixed(2)) + ' CAJAS');
                            $('#fecha').text(lst[0].fecha);
                            for (i = 0; i < lst.length; ++i) {

                                // nIdProceso	dFeInic	Linea	supervisor	seleccion	embalaje	Clamshell	totalpersonas	etiquetas	cajas	horas	cajashora	Productor	Presentacion	Variedad	inicio	fin

                                vvBody += '<tr>';
                                vvBody += '<td> <div class="position-relative px-7 py-0"><div class="position-absolute start-0 top-0 w-4px h-100 rounded-2 bg-info"></div>';
                                vvBody += '<span href="#" class="mb-1 text-dark text-hover-primary fw-bolder">' + lst[i].linea + '</span>';
                                vvBody += '</div></td>';
                                vvBody += '<td style="text-align: center"><div class="fs-5 text-bolder fw-bolder">' + lst[i].Embalaje + '</div></td>';
                                vvBody += '<td style="text-align: center"><div class="fs-5 text-bolder fw-bolder">' + lst[i].Seleccion + '</div></td>';
                                vvBody += '<td style="text-align: center"><div class="fs-5 text-bolder fw-bolder">' + lst[i].Clamshell + '</div></td>';
                                vvBody += '<td style="text-align: center"><div class="fs-5 text-bolder fw-bolder">' + lst[i].personas + '</div></td>';
                                vvBody += '<td style="text-align: right"><div class="fs-5 text-bolder fw-bolder">' + formatNumber.new(lst[i].tapers.toFixed(2)) + '</div></td>';
                                vvBody += '<td style="text-align: right"><div class="fs-5 text-bolder fw-bolder">' + formatNumber.new(lst[i].cajas.toFixed(2)) + '</div></td> ';

                                //vvBody += '<td><div class="d-flex align-items-center w-100 mw-125px">';
                                //vvBody += '<div class="progress h-6px w-100 me-2 bg-light-warning">';
                                //vvBody += '<div class="progress-bar bg-warning" role="progressbar" style="width: ' + lst[i].porcentajecajas + '%" aria-valuenow="' + lst[i].porcentajecajas + '" aria-valuemin="0" aria-valuemax="100"></div>';
                                //vvBody += '</div><span class="text-black-400 fw-bold">' + lst[i].porcentajecajas + '%</span></div></td>';

                                vvBody += '<td><div class="progress">';
                                vvBody += '<div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: ' + lst[i].porcentajecajas + '%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>' + lst[i].porcentajecajas + '%';
                                vvBody += '</div></td>';

                                vvBody += '<td style="text-align: right"><div class="fs-5 text-bolder fw-bolder">' + formatNumber.new(lst[i].cajasxhora.toFixed(2)) + '</div></td>';
                                vvBody += '<td style="text-align: right"><div class="fs-5 text-bolder fw-bolder">' + formatNumber.new(lst[i].clamshellxhora.toFixed(2)) + '</div></td>';
                                vvBody += '<td><div class="fs-5 text-bolder fw-bolder">' + lst[i].H_inicio + '</div></td>';
                                vvBody += '<td><div class="fs-5 text-bolder fw-bolder">' + lst[i].H_final + '</div></td>';
                                vvBody += '<td style="text-align: right"><div class="fs-5 text-bolder fw-bolder">' + lst[i].tiempo_trabajo + '</div></td>';
                                vvBody += '<td style="text-align: right"><div class="fs-5 text-bolder fw-bolder">' + formatNumber.new(lst[i].kilos_abastecidos.toFixed(2)) + ' KG</div></td>';
                                vvBody += '<td><div class="progress">';
                                vvBody += '<div class="progress-bar progress-bar-striped" role="progressbar" style="width: ' + lst[i].porcentajekilos + '%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>' + lst[i].porcentajekilos + '%';
                                vvBody += '</div></td>';
                                vvBody += '<td style="text-align: center">';
                                if (lst[i].tiemposinleer == 'ACTIVA') {
                                    vvBody += '<button class="btn btn-warning btn-sm">ACTIVA</button>';
                                }
                                if (lst[i].tiemposinleer == 'LINEA PARADA') {
                                    vvBody += '<button class="btn btn-danger btn-sm">PARADA</button>';
                                }
                                vvBody += '</td>';
                                vvBody += '<td class=""><div class="fs-5 fw-bolder text-bolder"><i class="fas fa-user-circle" style="color: darkgoldenrod;"></i> ' + lst[i].supervisor + '</div></td>';

                                vvBody += '</tr>';
                            }
                        } else {
                            $('#fecha').text('');
                        }
                        $("#tblLineas tbody").html(vvBody);


                        // $("#lblCaClamshell").html('<b>' + vnCla + '</b>');

                        vvBody = null;
                        $('#loading').hide();

                    }, complete: function () {
                        $('#loading').hide();
                        //setTimeout(showGraph, 15000);
                        segundos = 10
                        reloj();
                    }, error: function (data) {
                        var lst = JSON.parse(data.d);
                        alert(lst)
                    }

                });
            }
        };
        var formatNumber = {
            separador: ",", // separador para los miles
            sepDecimal: '.', // separador para los decimales
            formatear: function (num) {
                num += '';
                var splitStr = num.split('.');
                var splitLeft = splitStr[0];
                var splitRight = splitStr.length > 1 ? this.sepDecimal + splitStr[1] : '';
                var regx = /(\d+)(\d{3})/;
                while (regx.test(splitLeft)) {
                    splitLeft = splitLeft.replace(regx, '$1' + this.separador + '$2');
                }
                return this.simbol + splitLeft + splitRight;
            },
            new: function (num, simbol) {
                this.simbol = simbol || '';
                return this.formatear(num);
            }
        }
    </script>
</body>

</html>
