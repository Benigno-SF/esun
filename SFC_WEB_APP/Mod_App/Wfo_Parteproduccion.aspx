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
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.5/css/buttons.dataTables.min.css" />
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h2 style="margin-top: 10px">INFORME DE PRODUCCIÓN</h2>
                <hr/>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label>Fecha de inicio:</label>
                    <input type="date" id="fechai" class="form-control" value="<%=  DateTime.Today.ToString("yyyy-MM-dd") %>" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label>Fecha de finalización:</label>
                    <input type="date" id="fechaf" class="form-control" value="<%=  DateTime.Today.ToString("yyyy-MM-dd") %>" />
                </div>
            </div>
            <hr/>
        </div>

        <div class="row">
            <div class="col-md-6">
                <button class="btn btn-secondary" type="button" id="BtnBuscar"><i class="fa fa-search"></i> Buscar</button>
                &nbsp;&nbsp;<span id="msg"></span>
            </div>
            <div class="col-md-6">
                
            </div>
        </div>

        <div class="row" style="margin-top: 20px;">
            <div class="col-md-12"><div id="tablas"></div></div>
        </div>
        
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.23/js/dataTables.bootstrap4.min.js"></script>
    

    <script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>

<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>

<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>

<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>

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

        function redondear(valor)
        {
           return  '<span style="color:red; font-weight:bold;">'+Math.round(Number(valor) * 100) / 100+'</span>';
        }


        function week(year, month, day) {
            function serial(days) { return 86400000 * days; }
            function dateserial(year, month, day) { return (new Date(year, month - 1, day).valueOf()); }
            function weekday(date) { return (new Date(date)).getDay() + 1; }
            function yearserial(date) { return (new Date(date)).getFullYear(); }
            var date = year instanceof Date ? year.valueOf() : typeof year === "string" ? new Date(year).valueOf() : dateserial(year, month, day),
                date2 = dateserial(yearserial(date - serial(weekday(date - serial(1))) + serial(4)), 1, 3);
            return ~~((date - date2 + serial(weekday(date2) + 5)) / serial(7));
        }

        $("#BtnBuscar").click(function () {
            var obj = new Object();
            obj.dFechaInicio = $("#fechai").val();
            obj.dFechaFin = $("#fechaf").val();

            
            //$("#datos").remove();
            $("#tablas").empty();
            
            $("#msg").html("");
            $.ajax({
                type: 'POST',
                url: "SerApp.asmx/ParteProduccion_Buscar",
                //timeout: 700,
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                beforeSend: function () {
                    $("#msg").html('<span style="padding: 20px 0px; display: block;">Cargando ...</span>');
                },
                success: function (data) {
                    
                    $("#msg").html("");
                    var datos = JSON.parse(data['d']);
                    leyendalimites = datos;
                    var estructura = '<table id="datos" class="table table-bordered table-striped">';
                    estructura += '<thead><tr><th style="min-width: 95px;">Fecha</th><th style="min-width: 95px;">F. de producción</th><th>Semana</th><th style="min-width: 300px;">Productor</th><th style="min-width: 300px;">Cliente</th><th style="min-width: 300px;">Artículo</th><th>Merma</th><th>(%) Merma</th><th>Exportable</th><th>(%) Exportabe</th><th>Exceso</th><th>(%) Exceso</th><th>Descarte</th><th>(%) Descarte</th><th>Envases</th><th>Peso total</th></tr></thead>';
                    estructura += '<tbody>';
                    for (var i = 0; i < datos.length; i++) {
                        //var fc = new Date(datos[i].fecha);
                        var parts = (datos[i].fecha).split("/");
                        var fc = new Date(Number(parts[2]), Number(parts[1]) - 1, Number(parts[0]));
                        estructura += '<tr>';
                        estructura += '<td>' + datos[i].fecha + '</td>';
                        estructura += '<td>' + datos[i].fechaproduccion + '</td>';
                        estructura += '<td>' + datos[i].semana + '</td>';
                        estructura += '<td>' + datos[i].productor + '</td>';
                        estructura += '<td>' + datos[i].cliente + '</td>';
                        estructura += '<td>' + datos[i].nombrefamiliaarticulo + '</td>';
                        estructura += '<td>' + datos[i].merma + '</td>';
                        estructura += '<td>' + redondear(datos[i].pmerma) + '</td>';
                        estructura += '<td>' + datos[i].exportable + '</td>';
                        estructura += '<td>' + redondear(datos[i].pexportable )+ '</td>';
                        estructura += '<td>' + datos[i].exceso + '</td>';
                        estructura += '<td>' + redondear(datos[i].pexceso) + '</td>';
                        estructura += '<td>' + datos[i].descarte + '</td>';
                        estructura += '<td>' + redondear(datos[i].pdescarte) + '</td>';
                        estructura += '<td>' + datos[i].cantidadenvase + '</td>';
                        estructura += '<td>' + datos[i].pesonetototal + '</td>';
                        estructura += '</tr>';
                    }
                    estructura += '</tbody>';
                    estructura += '</table>';
                    $("#tablas").append(estructura);
                    $('#datos').DataTable(
                        {
                            "paging": false,
                            "dom": 'Bfrtip',
                            "language": {
                                url: '//cdn.datatables.net/plug-ins/1.10.22/i18n/Spanish.json'
                            },
                            "buttons": [
                                { "extend": 'excelHtml5', "text": '<i class="fas fa-file-excel" aria-hidden="true"></i> MS Excel', "className": 'btn btn-primary btn-sm' }
                            ], "scrollX": true,
                            "initComplete": function () {
                                var btns = $('.dt-button');
                                btns.removeClass('dt-button');
                            },
                        }
                    );
                },
                error: function (error) {
                    console.log(error);
                    $("#msg").html('<span style="padding: 20px 0px; display: block;">'+error+'</span>');
                }
            });
        });

        var tableToExcel = (function () {
            var uri = 'data:application/vnd.ms-excel;base64,'
                , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
                , base64 = function (s) { return window.btoa(unescape(encodeURIComponent(s))) }
                , format = function (s, c) { return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; }) }
            return function (name) {
                var ctx = { worksheet: name || 'Worksheet', table: tbltemp }
                window.location.href = uri + base64(format(template, ctx))
            }
        })()
    </script>
</body>
</html>

