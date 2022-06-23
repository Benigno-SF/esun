<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_MoniRendimiento.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_MoniRendimiento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Lineas</title>
    <%: Styles.Render("~/Content/css") %>
    <%: Scripts.Render("~/jquery") %>

    <!--  css     -->
    <%: Styles.Render("~/Content/css") %>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="../Content/app_sources/font-awesome.min.css" />
    <!-- js -->
    <%: Scripts.Render("~/jquery") %>
    <script type="text/javascript" src="../Scripts/app_sources/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../Scripts/app_sources/dataTables.bootstrap4.min.js"></script>
    <style>
        .body {
            background-color: #0e0c07;
            height: 100vh
        }
    </style>

    <style>
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
    </style>
</head>
<body>
    <form id="frm" runat="server">
        <div>
            <div class="row">
                <table class="table text-white m-0 p-0">
                    <tr>
                        <td style="width: 25%">
                            <img src="../Img/sf-logo.png" style="width: 160px; left: 0;" />
                        </td>
                        <td style="width: 40%">
                            <div id="dvTitle" runat="server" class="text-center" style="font-size: 2rem; color: white">
                            </div>
                        </td>
                        <td style="width: 35%">
                            <table style="text-align: left;" class="table text-white m-0 p-0">
                                <tr>
                                    <td style="border: 0px;">Cliente: <span id="productor_top" class="text-warning"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border: 0px;">Embalaje: <span id="embalaje_top" class="text-warning"></span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="dvDetalle">
            <div class="row">
                <table class="table text-white m-0 p-0">
                    <tr>
                        <td style="width: 50%; border: 0px;">
                            <div class="card  bg-dark">
                                <div class="card-header card-header-warning  m-0">
                                    <h3 class="card-title text-white" style="font-weight: bold;">SELECCION</h3>
                                </div>
                                <div class="card-body table-responsive">
                                    <table id="seleccion" style="text-align: center; margin-bottom: 0px; width: 100%" class="table m-0 p-0">
                                        <thead class="text-warning m-0 p-0">
                                            <tr>
                                                <th style="text-align: left;"><b>Colaborador</b></th>
                                                <th style="text-align: right;"><b>N° Cajas</b></th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-white m-0 p-0">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </td>
                        <td style="width: 50%; border: 0px;">
                            <div class="card  bg-dark">
                                <div class="card-header card-header-warning  m-0">
                                    <h3 class="card-title text-white" style="font-weight: bold;">EMBALAJE</h3>
                                </div>
                                <div class="card-body table-responsive">
                                    <table id="embalaje" style="text-align: center; margin-bottom: 0px; width: 100%" class="table m-0 p-0">
                                        <thead class="text-warning m-0 p-0">
                                            <tr>
                                                <th style="text-align: left;"><b>Colaborador</b></th>
                                                <th style="text-align: right;"><b>N° Cajas</b></th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-white m-0 p-0">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <asp:HiddenField ID="hdfIdMonitor" Value="1" runat="server" />
        <asp:HiddenField ID="hdfIdGrupo" Value="1" runat="server" />
    </form>
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

                        $('#seleccion').DataTable({
                            paging: false,
                            destroy: true,
                            searching: false,
                            info: false,
                            data: lst,
                            columns: [
                                { data: 'Nombre', className: "text-left pt-1 pb-1" },
                                { data: 'cajas', className: "text-right pt-1 pb-1" },
                            ],
                            language: {
                                "sEmptyTable": "<center class='text-white'>Linea En Espera</center>",
                            }
                        });
                    }
                });
            }
        };

        function LoadData2() {
            var obj = new Object();
            obj.vnIdMonitor = $('#<%=hdfIdMonitor.ClientID%>').val();
            obj.vcLabor = 'E';
            if (obj.vnIdMonitor != -1) {
                $.ajax({
                    type: 'POST',
                    url: "SerApp.asmx/ListMonitorRendimiento",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        $('#embalaje').DataTable({
                            paging: false,
                            destroy: true,
                            searching: false,
                            info: false,
                            data: lst,
                            columns: [
                                { data: 'Nombre', className: "text-left pt-1 pb-1" },
                                { data: 'cajas', className: "text-right pt-1 pb-1" },
                            ],
                            language: {
                                "sEmptyTable": "<center class='text-white'>Linea En Espera</center>",
                            }
                        });
                    }
                });
            }
        }

        function LoadDataTop() {
            var obj = new Object();
            obj.vnIdGrupo = $('#<%=hdfIdGrupo.ClientID%>').val();
            obj.vnIdMonitor = $('#<%=hdfIdMonitor.ClientID%>').val();
            if (obj.vnIdMonitor != -1) {
                $.ajax({
                    type: 'POST',
                    url: "SerApp.asmx/InfoAreaGrupoCliente",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        $('#productor_top').text(lst[0].RAZON_SOCIAL);
                        $('#embalaje_top').text(lst[0].cDesEmbalaje);
                    }
                });
            }
        }

        $(document).ready(function () {
            setInterval(LoadData, 2000);
            setInterval(LoadData2, 2000);
            setInterval(LoadDataTop, 2000);
        });

        var elem = document.documentElement;

        /* View in fullscreen */
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
        $(document).ready(function () {
            openFullscreen()
        });

    </script>
</body>
</html>

