<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_Tiemporecepcion.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_Tiemporecepcion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title></title>
    <%: Scripts.Render("~/jquery") %>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.23/b-1.6.5/b-html5-1.6.5/datatables.min.css"/>
    <style>
        td, th {
            font-size: small;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h2 style="margin-top: 10px">CONTROL DE TIEMPOS DE RECEPCIÓN</h2>
                <hr/>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6" id="opcion3">
                <div class="form-group">
                    <label>Fecha:</label>
                    <input type="date" id="fecha" class="form-control" value="<%=  DateTime.Today.ToString("yyyy-MM-dd") %>" />
                </div>
            </div>
            <div  class="col-md-6">
                <div class="form-group">
                    <label>Leyenda: <span style="font-size: smaller"><b>[Unidades en minutos]</b></span></label>
                    <div class="input-group mb-3">
                        <div id="leyendacolores" class="form-control"></div>
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button" id="BtnConfigurar"><i class="fas fa-cog"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <hr/>
        </div>

        <div class="row">
            <div class="col-md-12">
                <button class="btn btn-outline-secondary" type="button" id="BtnExportarExcel"><i class="fas fa-print"></i> Exportar a ms-excel</button>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12"><div id="tablas"></div></div>
        </div>
        
    </div>

    <div class="modal" id="configlimites" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="fh_productor"><i class="fas fa-cog"></i>&nbsp;&nbsp;Configurar <span id="camionnumero" style="font-weight: normal;"></span></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="width: 127px;"></span>
                            </div>
                            <input type="text" readonly="readonly" value="Mínimo" style="text-align: center; font-weight: bold;" class="inicio form-control"/>
                            <input type="text" readonly="readonly" value="Máximo" style="text-align: center; font-weight: bold;" class="inicio form-control"/>
                        </div>
                    </div>
                    <div id="selectorcolores"></div>
                    <div class="btn-group">
                        <button type="button" id="BtnGuardarconfiguracion" class="btn btn-info">Guardar</button>
                    </div>
                    <label id="msgConfiguracionError" class="text-danger float-right"></label>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.23/b-1.6.5/b-html5-1.6.5/datatables.min.js"></script>

    
    <script type="text/javascript">
        var tbltemp = "";
        $("#BtnExportarExcel").click(function () {
            tbltemp = "<table>";
            $('table[id*=tblreporte]').each(function () {
                tbltemp += '<tr><td>' + $(this).html() + '<td><tr>';
            });
            tbltemp += "</table>";
            tbltemp = removeElements(tbltemp, ".algo");
            tableToExcel('Control de tiempos');
        });

        var removeElements = function (text, selector) {
            var wrapped = $("<div>" + text + "</div>");
            wrapped.find(selector).remove();
            return wrapped.html();
        }

        var tableToExcel = (function () {
            var uri = 'data:application/vnd.ms-excel;base64,'
                , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
                , base64 = function (s) { return window.btoa(unescape(encodeURIComponent(s))) }
                , format = function (s, c) { return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; }) }
            return function (name) {
                //if (!table.nodeType) table = document.getElementById(table)
                var ctx = { worksheet: name || 'Worksheet', table: tbltemp }
                window.location.href = uri + base64(format(template, ctx))
            }
        })()
    </script>

    <script>


        $("#BtnConfigurar").click(function () {
            $('#configlimites').modal('show');
        });

        function FnConvertirNumeroAFecha2(formatonumero) {
            var fecha = "";
            if (formatonumero != null) {
                var valuze = new Date(parseInt(formatonumero.substr(6)));
                if (valuze.getFullYear() == '1990') {
                    fecha = "N/A";
                } else {
                    fecha = updateTime(valuze.getFullYear()) + "-" + updateTime(valuze.getMonth() + 1) + "-" + updateTime(valuze.getDate()) + " " + updateTime(valuze.getHours()) + ":" + updateTime(valuze.getMinutes()) + ":" + updateTime(valuze.getSeconds());
                }
            } else {
                fecha = "00:00";
            }
            return fecha;
        }

        function CalcularMinutos(campoFin, campoIni) {
            var completar = "";
            if (campoFin != null && campoIni != null) {
                if (!campoFin.includes("0:0") && !campoFin.includes("N/A") && !campoIni.includes("0:0") && !campoIni.includes("N/A")) {
                    var diff = (new Date(FnConvertirNumeroAFecha2(campoFin)).getTime() - new Date(FnConvertirNumeroAFecha2(campoIni)).getTime()) / 1000;
                    diff /= 60;
                    var res = Math.abs(Math.round(diff));
                    var color = "";

                    //Reccorer en un array de corolres:

                    for (var i = 0; i < leyendalimites.length; i++) {
                        console.log(leyendalimites[i].nMinimo + "<" + res + "<" + leyendalimites[i].nMaximo)
                        var max = leyendalimites[i].nMaximo;
                        if (max == null) {
                            max = 500;
                        }
                        if (leyendalimites[i].nMinimo <= res && res <= max) {
                            color = leyendalimites[i].cColor;
                        }
                    }
                    if (!isNaN(res)) {
                        completar = '<div class="algo" style="color: white; position: absolute; display: inline; background: ' + color + '; border-radius: 8px; margin-top: -2px; text-align: center; margin-left: -54px; padding: 3px; width: 22px;">' + res + "'</div>";
                    } else {
                        completar = "";
                    }
                }
            }
            
            return completar;
        }
      

        function updateTime(k) {
            if (k < 10) {
                return "0" + k;
            }
            else {
                return k;
            }
        }

        function FnConvertirNumeroAFecha(formatonumero) {
            var fecha = "";
            if (formatonumero != null) {
                var valuze = new Date(parseInt(formatonumero.substr(6)));
                if (valuze.getFullYear() == '1990') {
                    fecha = "N/A";
                } else {
                    fecha = updateTime(valuze.getHours()) + ":" + updateTime(valuze.getMinutes());// + ":" + updateTime(valuze.getSeconds());
                }
            } else {
                fecha = "00:00";
            }
            return fecha;
        }

        var leyendalimites;
        CargarColoresMinMax();
        function CargarColoresMinMax() {
            var obj = new Object();
            obj.nTipo = 2;
            $.ajax({
                async: false,
                type: 'POST',
                url: "SerApp.asmx/RecepciontiempoconfiguracionSelect",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var datos = JSON.parse(data['d']);
                    leyendalimites = datos;
                    var estructura0 = '';
                    var estructura = '<table><tr>';
                    for (var i = 0; i < datos.length; i++) {
                        var maximo = "";
                        if (datos[i].nMaximo == null || datos[i].nMaximo == 600) {
                            maximo = "más";
                        } else {
                            maximo = datos[i].nMaximo;
                        }
                        estructura += '<td><div class="algo" style="color: white; background: ' + datos[i].cColor + '; border-radius: 50%; text-align: center;  padding: 3px; width: 17px; height:17px;"></div></td>';
                        estructura += '<td style="padding-left:5px; padding-right:20px;"> de ' + datos[i].nMinimo + ' a ' + maximo + ' [' + datos[i].cDescripcion + ']</td>';

                        if (i == 0) {
                            estructura0 += '<div class="form-group">';
                            estructura0 += '<div class="input-group">';
                            estructura0 += '<div class="input-group-prepend">';
                            estructura0 += '<span class="input-group-text"><i class="fas fa-circle" style="color: ' + datos[i].cColor+'"></i></span>';
                            estructura0 += '</div>';
                            estructura0 += '<div class="input-group-prepend">';
                            estructura0 += '<span class="input-group-text" style="width: 85px;">' + datos[i].cDescripcion + '</span>';
                            estructura0 += '</div>';
                            estructura0 += '<input id="ti_' + datos[i].nIdRecepciontiempoconfiguracion + '" type="number" readonly="readonly" value="' + datos[i].nMinimo+'" class="inicio form-control">';
                            estructura0 += '<input type="number" value="' + datos[i].nMaximo +'" class="fin form-control">';
                            estructura0 += '</div>';
                            estructura0 += '</div>';
                        } else if (i == datos.length - 1) {
                            estructura0 += '<div class="form-group">';
                            estructura0 += '<div class="input-group">';
                            estructura0 += '<div class="input-group-prepend">';
                            estructura0 += '<span class="input-group-text"><i class="fas fa-circle" style="color: ' + datos[i].cColor +'"></i></span>';
                            estructura0 += '</div>';
                            estructura0 += '<div class="input-group-prepend">';
                            estructura0 += '<span class="input-group-text" style="width: 85px;">' + datos[i].cDescripcion + '</span>';
                            estructura0 += '</div>';
                            estructura0 += '<input id="ti_' + datos[i].nIdRecepciontiempoconfiguracion + '" type="number" value="' + datos[i].nMinimo +'" class="inicio form-control">';
                            estructura0 += '<input type="text" readonly="readonly" value="más" class="fin form-control">';
                            estructura0 += '</div>';
                            estructura0 += '</div>';
                        } else {
                            estructura0 += '<div class="form-group">';
                            estructura0 += '<div class="input-group">';
                            estructura0 += '<div class="input-group-prepend">';
                            estructura0 += '<span class="input-group-text"><i class="fas fa-circle" style="color: ' + datos[i].cColor +'"></i></span>';
                            estructura0 += '</div>';
                            estructura0 += '<div class="input-group-prepend">';
                            estructura0 += '<span class="input-group-text" style="width: 85px;">' + datos[i].cDescripcion + '</span>';
                            estructura0 += '</div>';
                            estructura0 += '<input class="id" type="hidden" value="' + datos[i].nIdRecepciontiempoconfiguracion + '">';
                            estructura0 += '<input id="ti_' + datos[i].nIdRecepciontiempoconfiguracion + '" type="number" value="' + datos[i].nMinimo +'" class="inicio form-control">';
                            estructura0 += '<input type="number" value="' + datos[i].nMaximo +'" class="fin form-control">';
                            estructura0 += '</div>';
                            estructura0 += '</div>';
                        }
                    }                    
                    estructura += '</tr></table>';

                    $("#leyendacolores").empty();
                    $("#selectorcolores").empty();

                    $("#leyendacolores").append(estructura);
                    $("#selectorcolores").append(estructura0);

                },
                error: function (error) {
                    console.log(error);
                }
            });
        }

        $("#BtnGuardarconfiguracion").click(function () {
            var contador = 0;
            var objetos = [];

            $("#selectorcolores .form-group").each(function () {
                contador++;
                var obj = new Object();
                obj.nIdRecepciontiempoconfiguracion = $(this).find('.inicio').attr('id').replace("ti_", "");
                if (contador == 1) {
                    obj.nMinimo = 0;
                } else {
                    obj.nMinimo = $(this).find('.inicio').val();
                }

                if (contador == leyendalimites.length) {
                    obj.nMaximo = 600;
                } else {
                    obj.nMaximo = $(this).find('.fin').val();
                }

                objetos.push(obj);
            });
            var ultimo = -1;
            var validacion = false;
            for (var i = 0; i < objetos.length; i++) {
                if (parseInt(parseInt((ultimo)) + 1) == objetos[i].nMinimo) {
                    validacion = true;
                    if (objetos[i].nMinimo < objetos[i].nMaximo) {
                        validacion = true;
                        ultimo = objetos[i].nMaximo;
                    } else {
                        validacion = false;
                        break;
                    }
                } else {
                    validacion = false;
                    break;
                }
            }

            if (validacion) {
                for (var i = 0; i < objetos.length; i++) {
                    $.ajax({
                        async: false,
                        type: 'POST',
                        url: "SerApp.asmx/RecepciontiempoconfiguracionActualizarminmax",
                        data: JSON.stringify({ obj: objetos[i] }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            CargarColoresMinMax();
                            $("#msgConfiguracionError").html('<span class="text-success">Se guardó correctamente.<span>');
                            setTimeout(function () {
                                $('#msgConfiguracionError').html("");
                            }, 4000);
                        },
                        error: function (error) {
                            $("#msgConfiguracionError").html('<span class="text-danger">Existe un error de conectividad.<span>');
                            setTimeout(function () {
                                $('#msgConfiguracionError').html("");
                            }, 4000);
                        }
                    });
                }
            } else {
                $("#msgConfiguracionError").html('<span class="text-danger">Los tiempos no son coherentes.<span>');
                setTimeout(function () {
                    $('#msgConfiguracionError').html("");
                }, 4000);
            }
        });

        $("#fecha").change(function () {
            FnCargarReporte1();
        });

        function FnCargarReporte1() {
            var obj = new Object();
            obj.dFecha = $("#fecha").val();

            $("#tablas").empty();

            $.ajax({
                async: false,
                type: 'POST',
                url: "SerApp.asmx/RecepciontiempoReporte1",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var camionescomominimo = 50;
                    var nombreproductor = "";
                    var datos = JSON.parse(data['d']);
                    var tablabase = "";
                    var contador_fila = -1;
                    var contador = -1;
                    for (var i = 0; i < datos.length; i++) {
                        tablabase = "";
                        if (nombreproductor != datos[i].cDescClieProv) {
                            nombreproductor = datos[i].cDescClieProv;
                            contador++;
                            contador_fila = 0;
                            tablabase += '<div ><table id="tblreporte' + contador + '"  class="table table-bordered table-striped" style="margin-top:20px;">';
                            tablabase += '<thead>';
                            tablabase += '<tr>';
                            tablabase += '<th style="width:200px; text-align: left" colspan="' + ((camionescomominimo * 2) + 1)+'" >' + datos[i].cDescClieProv + '</th>';
                            tablabase += '</tr>';
                            tablabase += '<tr>';
                            tablabase += '<th style="min-width:180px">CAMIONES</th>';
                            for (var x = 1; x <= camionescomominimo; x++) {
                                tablabase += '<th colspan="2" style="text-align: center">CAMIÓN ' + x + '</th>';
                            }
                            tablabase += '</tr>';
                            tablabase += '</thead>';
                            tablabase += '<tbody>';
                            tablabase += '<tr>';
                            tablabase += '<td>NRO. DE PARIHUELAS</td>';
                            for (var x = 1; x <= camionescomominimo; x++) {
                                tablabase += '<td colspan="2" style="text-align: center" id="pr' + contador + '_cm' + x + '_ph">0</td>';
                            }
                            tablabase += '</tr>';
                            tablabase += '<tr>';
                            tablabase += '<td>DESCARGA DE CAMION</td>';
                            for (var x = 1; x <= camionescomominimo; x++) {
                                tablabase += '<td id="pr' + contador + '_cm' + x + '_dcini">00:00</td>';
                                tablabase += '<td id="pr' + contador + '_cm' + x + '_dcfin">00:00</td>';
                            }
                            tablabase += '</tr>';
                            tablabase += '<tr>';
                            tablabase += '<td>PESADO Y ETIQUETADO</td>';
                            for (var x = 1; x <= camionescomominimo; x++) {
                                tablabase += '<td id="pr' + contador + '_cm' + x + '_peini">00:00</td>';
                                tablabase += '<td id="pr' + contador + '_cm' + x + '_pefin">00:00</td>';
                            }
                            tablabase += '</tr>';
                            tablabase += '<tr>';
                            tablabase += '<td>GASIFICADO</td>';
                            for (var x = 1; x <= camionescomominimo; x++) {
                                tablabase += '<td id="pr' + contador + '_cm' + x + '_gaini">00:00</td>';
                                tablabase += '<td id="pr' + contador + '_cm' + x + '_gafin">00:00</td>';
                            }
                            tablabase += '</tr>';
                            tablabase += '<tr>';
                            tablabase += '<td>CARGA DE JABAS</td>';
                            for (var x = 1; x <= camionescomominimo; x++) {
                                tablabase += '<td id="pr' + contador + '_cm' + x + '_jaini">00:00</td>';
                                tablabase += '<td id="pr' + contador + '_cm' + x + '_jafin">00:00</td>';
                            }
                            tablabase += '</tr>';
                            tablabase += '</tbody></table></div>';
                            $("#tablas").append(tablabase);
                            
                        }
                        $("#pr" + contador + "_cm" + (contador_fila + 1) + "_ph").html(datos[i].nParihuelas);
                        $("#pr" + contador + "_cm" + (contador_fila + 1) + "_dcini").html(FnConvertirNumeroAFecha(datos[i].dIniDescarga));
                        $("#pr" + contador + "_cm" + (contador_fila + 1) + "_dcfin").html(FnConvertirNumeroAFecha(datos[i].dFinDescarga) + CalcularMinutos(datos[i].dFinDescarga, datos[i].dIniDescarga));
                        $("#pr" + contador + "_cm" + (contador_fila + 1) + "_peini").html(FnConvertirNumeroAFecha(datos[i].dIniPesadoetiquetado));
                        $("#pr" + contador + "_cm" + (contador_fila + 1) + "_pefin").html(FnConvertirNumeroAFecha(datos[i].dFinPesadoetiquetado) + CalcularMinutos(datos[i].dFinPesadoetiquetado, datos[i].dIniPesadoetiquetado));
                        $("#pr" + contador + "_cm" + (contador_fila + 1) + "_gaini").html(FnConvertirNumeroAFecha(datos[i].dIniCamaragasificado));
                        $("#pr" + contador + "_cm" + (contador_fila + 1) + "_gafin").html(FnConvertirNumeroAFecha(datos[i].dFinCamaragasificado) + CalcularMinutos(datos[i].dFinCamaragasificado, datos[i].dIniCamaragasificado));
                        $("#pr" + contador + "_cm" + (contador_fila + 1) + "_jaini").html(FnConvertirNumeroAFecha(datos[i].dIniCargajabas));
                        $("#pr" + contador + "_cm" + (contador_fila + 1) + "_jafin").html(FnConvertirNumeroAFecha(datos[i].dFinCargajabas) + CalcularMinutos(datos[i].dFinCargajabas, datos[i].dIniCargajabas));
                        contador_fila++;
                        
                    }
                    
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }

        FnCargarReporte1();
    </script>
</body>
</html>

