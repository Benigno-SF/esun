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
        <table style="width: 100%; text-align: left; margin-bottom: 0px;/* display: none*/" class="table">
            <tr>
                <td style="width: 30%; padding: 0px; margin: 0px">
                    <asp:DropDownList ID="ddlAreaGrupo" runat="server" CssClass=""></asp:DropDownList>
                </td>
            </tr>
        </table>

        <table style="width: 100%; text-align: left; margin-bottom: 0px" class="table">
            <tr>
                <td style="width: 10%; padding: 0px; margin: 0px">
                    <img src="../Img/sf-logo.png" style="width: 160px; position: absolute; left: 0;" />
                </td>
                <td style="width: 60%; padding: 0px; margin: 0px">
                    <div class="text-center" style="font-size: 2.5rem; color: white">
                        <span id="dvTitle" runat="server"></span>- <span id="lblCLiente"></span>
                    </div>
                </td>
                <td style="width: 15%; padding: 0px; margin: 0px">
                    <div style="padding-top: 7px; font-size: 16px" class="text-white">
                        Variedad: <span id="lblVariedad" class="text-warning"></span>
                        <br />
                        Embalaje: <span id="lblEmbalaje" class="text-warning"></span>
                    </div>
                </td>
                <td style="width: 15%; padding: 0px; margin: 0px">
                    <div style="padding-top: 7px; font-size: 16px" class="text-white">
                        Tiempo Trancurrido: <span id="tiempocliente" class="text-warning"></span>
                        <br />
                        Turno: <span id="turnoproceso" class="text-warning"></span> - <span id="procesoactivo" class="text-warning"></span>
                    </div>
                </td>
            </tr>
        </table>
        <div>
            <div class="row">
                <div class="col" style="font-size: 16px; display: none" id="divsel">
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
                <div class="col" style="font-size: 16px; display: none" id="divemb">
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
                <div class="col" style="font-size: 16px; display: none" id="divcla">
                    <div class="row m-2">
                        <div class="col-9">Clamshell</div>
                        <div class="col-3">Total: <span id="lblCaClamshell" class="text-warning"></span></div>
                    </div>
                    <div class="m-2">
                        <table id="tblClamshell" style="text-align: center; margin-bottom: 0px; width: 100%;" class="tbRend">
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
        <input type="hidden" id="ip" value="0"/>
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
    <script type="text/javascript">
        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        $('body').on('change', '#<%=ddlAreaGrupo.ClientID%>', function () {
            var id = $(this).val();
            var text = $('#ddlAreaGrupo :selected').text();
            $('#<%=hdfIdMonitor.ClientID%>').val(id);
            $('#<%=dvTitle.ClientID%>').text(text);
            setTimeout(function () {
                //openFullscreen();
                loadIdMonitor(ip);
                setInterval(LoadData, 2000);
                setInterval(LoadHeadData, 5000);
            }, 4000);
        });

        function Load_Agrupo() {
            var obj = new Object();
            obj.vcIdEmpresa = 1;
            obj.vnIdArea = 2;
            $.ajax({
                //cache: false,
                type: 'POST',
                url: "SerApp.asmx/ListMonitorArea",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    $("#<%=ddlAreaGrupo.ClientID%>").html('');
                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0">Seleccione Linea</option>';

                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdMonitor + '">' + lst[i].cDescMonitor + '</option>';
                        }

                        $("#<%=ddlAreaGrupo.ClientID%>").append(option);
                    } else {
                        $("#<%=ddlAreaGrupo.ClientID%>").html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        

        $(document).ready(function () {
            window.RTCPeerConnection = window.RTCPeerConnection || window.mozRTCPeerConnection || window.webkitRTCPeerConnection;   //compatibility for firefox and chrome
            var pc = new RTCPeerConnection({ iceServers: [] }), noop = function () { };
            pc.createDataChannel("");    //create a bogus data channel
            pc.createOffer(pc.setLocalDescription.bind(pc), noop);    // create offer and set local description
            pc.onicecandidate = function (ice) {  //listen for candidate events
                if (!ice || !ice.candidate || !ice.candidate.candidate) return;
                var myIP = /([0-9]{1,3}(\.[0-9]{1,3}){3}|[a-f0-9]{1,4}(:[a-f0-9]{1,4}){7})/.exec(ice.candidate.candidate)[1];
                $('#ip').val(myIP);
                pc.onicecandidate = noop;

            };

            Load_Agrupo();

            setTimeout(function () {
                //openFullscreen();

               // loadIdMonitor();
                setInterval(LoadData, 2000);
                setInterval(LoadHeadData, 5000);
            }, 4000);
        });

        var id = -1;

        function loadIdMonitor() {
            var obj = new Object();
            obj.vcIpLocal = $('#ip').val();
            $.ajax({
               // cache: false,
                type: 'POST',
                url: "SerApp.asmx/ListMonitor",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    $('#<%=hdfIdMonitor.ClientID%>').val(lst[0].nIdMonitor);
                    $('#<%=dvTitle.ClientID%>').text(lst[0].cDescMonitor);
                }
            });
        };

        function LoadData() {
            var obj = new Object();
            obj.vnIdMonitor = $('#<%=hdfIdMonitor.ClientID%>').val();
            obj.vcFecha = getParameterByName('f');
            if (obj.vnIdMonitor != -1) {
                $.ajax({
                    //cache: false,
                    type: 'POST',
                    url: "SerApp.asmx/ListMonitorRendimiento",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        //alert(JSON.stringify(lst))
                        var vvEmb = "";
                        var vvSel = "";
                        var vvCla = "";
                        var vnEmb = 0;
                        var vnSel = 0;
                        var vnCla = 0;
                        var Emb = 1;
                        var Sel = 1;
                        var Cla = 1;
                        //lst[i].cLabor
                        for (i = 0; i < lst.length; ++i) {
                            if (lst[i].cLabor == "E") {
                                var Embal = Emb++;
                                vvEmb += "<tr><td>" + Embal + "</td><td style='text-align: left;'>" + lst[i].Nombre + "</td><td>" + lst[i].cajas + "</td><td>" + lst[i].clamshell + "</td><td><b>" + lst[i].total + "<b></td></tr>";
                                vnEmb += lst[i].total
                            } else if (lst[i].cLabor == "S") {
                                var Selec = Sel++;
                                vvSel += "<tr><td>" + Selec + "</td><td style='text-align: left;'>" + lst[i].Nombre + "</td><td>" + lst[i].cajas + "</td><td>" + lst[i].clamshell + "</td><td><b>" + lst[i].total + "<b></td></tr>";
                                vnSel += lst[i].total
                            } else if (lst[i].cLabor == "C"){
                                var Clam = Cla++;
                                vvCla += "<tr><td>" + Clam + "</td><td style='text-align: left;'>" + lst[i].Nombre + "</td><td>" + lst[i].cajas + "</td><td>" + lst[i].clamshell + "</td><td><b>" + lst[i].total + "<b></td></tr>";
                                vnCla += lst[i].total
                            }
                        }
                        if (vnEmb != 0) {
                            $("#tblEmbalaje tbody").html(vvEmb);
                            $("#divemb").show();
                        } else {
                            $("#divemb").hide();
                        }

                        if (vnSel != 0) {
                            $("#tblSeleccion tbody").html(vvSel);
                            $("#divsel").show();
                        }else {
                            $("#divsel").hide();
                        }

                        if (vnCla != 0) {
                            $("#tblClamshell tbody").html(vvCla);
                            $("#divcla").show();
                        } else {
                            $("#divcla").hide();
                        }

                        $("#lblCaEmbalaje").html('<b>' + vnEmb + '</b>');
                        $("#lblCaSeleccion").html('<b>' + vnSel + '</b>');
                        $("#lblCaClamshell").html('<b>' + vnCla + '</b>');

                        Emb = null;
                        Sel = null;

                        vnEmb = null
                        vnSel = null
                        vvEmb = null
                        vvSel = null

                        lst = null
                    },
                    error: function (error) {
                        toastr.error(JSON.stringify(error), '');
                    }
                });
            }
            obj = null
        }

        function isValidDate(date) {
            var matches = /^(\d{1,2})[-\/](\d{1,2})[-\/](\d{4})$/.exec(date);
            if (matches == null) return false;
            var d = matches[2];
            var m = matches[1] - 1;
            var y = matches[3];
            var composedDate = new Date(y, m, d);
            return composedDate.getDate() == d &&
                composedDate.getMonth() == m &&
                composedDate.getFullYear() == y;
        }

        function LoadHeadData() {
            var obj = new Object();
            obj.vnIdMonitor = $('#<%=hdfIdMonitor.ClientID%>').val();
            obj.vcFecha = getParameterByName('f');
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
                            $("#turnoproceso").text(lst[0].turno);

                            $("#kiloscliente").html('Kilos Abastecidos de ' + lst[0].cClieProv + ' en: <b>' + Number(lst[0].volcadoxcliente).toFixed(2) + '</b> Kg.');
                            $("#kilosprocesados").html('Kilos Abastecidos en Total: <b>' + Number(lst[0].volcado).toFixed(2) + '</b> Kg.');

                            lst = null
                        }
                    });
                }
            obj = null
        }

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
