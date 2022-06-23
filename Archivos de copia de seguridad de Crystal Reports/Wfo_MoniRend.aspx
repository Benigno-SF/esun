<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_MoniRend.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_MoniRend" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rendimiento Packing</title>
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
            color: lawngreen;
            background-color: #212529 !important;
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
    <!-- <script type="text/javascript" src="http://192.168.20.20/ch/js/Chart.min.js"></script>-->
</head>
<body>
    <form id="frm" runat="server">
        <table style="width: 100%; text-align: left; margin-bottom: 0px" class="table">
            <tr>
                <td style="width: 25%; padding: 0px; margin: 0px">
                    <img src="../Img/sf-logo.png" style="width: 160px; position: absolute; left: 0;" />
                </td>
                <td style="width: 35%; padding: 0px; margin: 0px">
                    <div class="text-center" style="font-size: 3rem; color: white">
                        <span id="dvTitle" runat="server"></span>- <span id="lblCLiente"></span>
                    </div>
                </td>
                <td style="width: 20%; padding: 0px; margin: 0px">
                    <div style="padding-top: 7px; font-size: 16px" class="text-white">
                        Variedad: <span id="lblVariedad" class="text-warning"></span>
                        <br />
                        Embalaje: <span id="lblEmbalaje" class="text-warning"></span>
                    </div>
                </td>
                <td style="width: 20%; padding: 0px; margin: 0px">
                    <div style="padding-top: 7px; font-size: 16px" class="text-white">
                        Tiempo Trancurrido: <span id="tiempocliente" class="text-warning"></span>
                        <br />
                        Proceso Activo: <span id="procesoactivo" class="text-warning"></span>
                    </div>
                </td>
            </tr>
        </table>
        <div>
            <div class="row">
                <div class="col-6" style="font-size: 16px;">
                    <div class="row m-2">
                        <div class="col-9">Selección</div>
                        <div class="col-3">Total: <span id="lblCaSeleccion" class="text-warning"></span></div>
                    </div>
                    <div class="m-2">
                        <table id="tblSeleccion" style="text-align: center; margin-bottom: 0px; width: 100%" class="tbRend">
                            <thead class="tittleth">
                                <tr>
                                    <th>#</th>
                                    <th style='text-align: left;'>Colaborador</th>
                                    <th>Cajas</th>
                                    <th>Clamshell</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody class="text-white">
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-6" style="font-size: 16px;">
                    <div class="row m-2">
                        <div class="col-9">Embalaje</div>
                        <div class="col-3">Total: <span id="lblCaEmbalaje" class="text-warning"></span></div>
                    </div>
                    <div class="m-2">
                        <table id="tblEmbalaje" style="text-align: center; margin-bottom: 0px; width: 100%;" class="tbRend">
                            <thead class="tittleth">
                                <tr>
                                    <th>#</th>
                                    <th style='text-align: left;'>Colaborador</th>
                                    <th>Cajas</th>
                                    <th>Clamshell</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody class="text-white">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="hdfIdMonitor" Value="1" runat="server" />
    </form>
    <div class="fixed-bottom pb-3 pl-3">
        <table class="bg-black round">
            <tr>
                <td class="pt-3 pl-3 pr-3 pb-1 round"><span id="kiloscliente"></span></td>
            </tr>
            <tr>
                <td class="pt-1 pl-3 pr-3 pb-3 round"><span id="kilosprocesados"></span></td>
            </tr>
        </table>
    </div>
    <script>
        function LoadData() {
            var obj = new Object();
            obj.vnIdMonitor = $('#<%=hdfIdMonitor.ClientID%>').val();
            obj.vcLabor = 'S';
            if (obj.vnIdMonitor != -1) {
                $.ajax({
                    type: 'POST',
                    url: "SerApp.asmx/ListMonitorRendimiento",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        var vvEmb = "";
                        var vvSel = "";
                        var vnEmb = 0;
                        var vnSel = 0;
                        var Emb = 1;
                        var Sel = 1;
                        //lst[i].cLabor
                        for (i = 0; i < lst.length; ++i) {
                            if (lst[i].cLabor == "E") {
                                var Embal = Emb++;
                                vvEmb += "<tr><td>" + Embal + "</td><td style='text-align: left;'>" + lst[i].Nombre + "</td><td>" + lst[i].cajas + "</td><td>" + lst[i].clamshell + "</td><td><b>" + lst[i].total + "<b></td></tr>";
                                vnEmb += lst[i].total
                            } else {
                                var Selec = Sel++;
                                vvSel += "<tr><td>" + Selec + "</td><td style='text-align: left;'>" + lst[i].Nombre + "</td><td>" + lst[i].cajas + "</td><td>" + lst[i].clamshell + "</td><td><b>" + lst[i].total + "<b></td></tr>";
                                vnSel += lst[i].total
                            }
                        }
                        $("#tblEmbalaje tbody").html(vvEmb);
                        $("#tblSeleccion tbody").html(vvSel);
                        $("#lblCaEmbalaje").html('<b>' + vnEmb + '</b>');
                        $("#lblCaSeleccion").html('<b>' + vnSel + '</b>');

                        Emb = null;
                        Sel = null;

                        vnEmb = null
                        vnSel = null
                        vvEmb = null
                        vvSel = null

                        lst = null
                    }
                });
            }
            obj = null
        }
        function LoadHeadData() {
            var obj = new Object();
            obj.vnIdMonitor = $('#<%=hdfIdMonitor.ClientID%>').val();
            if (obj.vnIdMonitor != -1) {
                $.ajax({
                    type: 'POST',
                    url: "SerApp.asmx/ListRendimientoProcesoDetalle",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        $("#lblCLiente").text(lst[0].cClieProv);

                        $("#lblVariedad").text(lst[0].cDescVariedad);
                        $("#lblEmbalaje").text(lst[0].cEmbalaje);
                        $("#procesoactivo").text(lst[0].inicioproceso);
                        $("#tiempocliente").text(lst[0].tiempocliente);

                        $("#kiloscliente").html('Kilos Abastecidos de ' + lst[0].cClieProv + ' en: <b>' + Number(lst[0].volcadoxcliente).toFixed(2) + '</b> Kg.');
                        $("#kilosprocesados").html('Kilos Abastecidos en Total: <b>' + Number(lst[0].volcado).toFixed(2) + '</b> Kg.');

                        lst = null
                    }
                });
            }
            obj = null
        }
        $(document).ready(function () {
            openFullscreen();
            setInterval(LoadData, 2000);
            setInterval(LoadHeadData, 5000);
        });

        var elem = document.documentElement;
        function openFullscreen() {
            if (elem.requestFullscreen) {
                elem.requestFullscreen();
            } else if (elem.mozRequestFullScreen) { /* Firefox */
                elem.mozRequestFullScreen();
            } else if (elem.webkitRequestFullscreen) { /* Chrome, Safari and Opera */
                elem.webkitRequestFullscreen();
            } else if (elem.msRequestFullscreen) { /* IE/Edge */
                elem.msRequestFullscreen();
            }
        }
    </script>
</body>
</html>
