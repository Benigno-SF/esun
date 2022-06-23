<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_MoniLine.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_MoniLine" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Lineas</title>
    <%: Styles.Render("~/Content/css") %>
    <%: Scripts.Render("~/jquery") %>
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
            height: 90vh;
            padding: 0px;
        }

        .divtable {
            border-left: solid;
            border-right: solid;
            border-top: solid;
            border-color: coral;
            padding: 0px;
        }


        .right {
            float: right;
        }


.parpadea {
  
  animation-name: parpadeo;
  animation-duration: 1s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;

  -webkit-animation-name:parpadeo;
  -webkit-animation-duration: 1s;
  -webkit-animation-timing-function: linear;
  -webkit-animation-iteration-count: infinite;
}

@-moz-keyframes parpadeo{  
  0% { opacity: 1.0; }
  50% { opacity: 0.0; }
  100% { opacity: 1.0; }
}

@-webkit-keyframes parpadeo {  
  0% { opacity: 1.0; }
  50% { opacity: 0.0; }
   100% { opacity: 1.0; }
}

@keyframes parpadeo {  
  0% { opacity: 1.0; }
   50% { opacity: 0.0; }
  100% { opacity: 1.0; }
}
    </style>
</head>
<body>
    <form id="frm" runat="server">
        <table style="width: 100%; text-align: center; margin-bottom: 0px" class="table">
            <tr>
                <td style="width: 10%; padding: 0px; margin: 0px">
                    <img src="../Img/sf-logo.png" style="width: 160px; position: absolute; left: 0;" />
                </td>
                <td style="width: 60%; padding: 0px; margin: 0px">
                    <div class="text-center" style="font-size: 2rem; color: white">
                        <div id="title-line">
                        <span id="dvTitle" runat="server"></span> - <span id="lblCLiente"></span>
                        </div><div id="conexion" class="dvTitle parpadea" style="color: red;font-weight: bold;
    text-shadow: 1px 1px 10px white; display:none;">SIN CONEXION</div>
                    </div>
                </td>
                <td style="width: 15%; padding: 0px; margin: 0px">
                    <div style="padding-top: 7px; font-size: 16px" class="text-left text-white">
                        Variedad: <span id="lblVariedad" class="text-warning"></span>
                        <br />
                        Embalaje: <span id="lblEmbalaje" class="text-warning"></span>
                    </div>
                </td>
                <td style="width: 15%; padding: 0px; margin: 0px">
                    <div style="padding-top: 7px; font-size: 16px" class="text-left text-white">
                        <%--Tiempo Trancurrido: <span id="tiempocliente" class="text-warning"></span>--%>
                        Proceso Activo: <span id="procesoactivo" class="text-warning"></span>
                        <br />
                         Cajas En Linea: <span id="CabTotalCajas" class="text-warning"></span>
                    </div>
                </td>
            </tr>
        </table>
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-3" style="display: none">

                    <table id="tbl1" style="text-align: center; margin-bottom: 0px; width: 100%;">
                        <thead class="tittleth">
                            <tr>
                                <th>#</th>
                                <th style='text-align: left;'>Colaborador</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody class="text-white">
                        </tbody>
                         <tfoot class="text-white">
                            <tr>
                                <th></th>
                                <th style='text-align: left;'>Total Cajas</th>
                                <th><span id="TotalCajas"></span></th>
                            </tr>
                        </tfoot>
                    </table>


                </div>
                <div class="col-md-12">
                    <div id="dvDetalle" style="background-color: #0000008f; height: 90vh;"></div>
                </div>

            </div>
        </div>


        <asp:HiddenField ID="hdfIdMonitor" Value="1" runat="server" />
    </form>
    <script>
        window.addEventListener("offline", function (e) {
            $("#title-line").hide();
            $("#conexion").show();
        });

        window.addEventListener("online", function (e) {
            $("#title-line").show();
            $("#conexion").hide();
        });

        var vbTbl = false;
        var arPos = [];
        var vvCat = "C"
        function LoadData() {
            var obj = new Object();
            obj.vnIdMonitor = $('#<%=hdfIdMonitor.ClientID%>').val();
            $.ajax({
                type: 'POST',
                url: "SerApp.asmx/ListMonitorSubLinea",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    lst = JSON.parse(data.d);
                    if (!vbTbl)
                        Maketbl(lst);
                    if (vbTbl) {
                        for (i = 0; i < arPos.length; ++i) {
                            var vvDat = "<table width='100%'>";
                            lst.forEach(function (item, x) {
                                var plu = '';
                                if (item.nPosicion == arPos[i].nPosicion && item.cDesCategoria.length > 0) {
                                    if (item.bPlu == true) {
                                        plu = "<img src='../img/img_plu_small.png' width='40px'>";
                                    }
                                    vvDat += "<tr><td style='vertical-align: bottom; text-align: left' width='30%'><h1>" + vvCat + "-" + item.cDesCategoria+ "</h1></td>"
                                        + "<td class='display-1' style='font-weight: bold; font-size: 7rem; vertical-align: bottom; text-align: left' width='50%'>" + item.cDesCalibre + "</td>"
                                        + "<td width='20%' style='text-aling: center;'>"+plu+"</td></tr>"
                                    
                                }
                            });
                            vvDat + "</table> ";
                            $("#dv" + arPos[i].nPosicion).html(vvDat)
                        }

                    }
                }, complete: function () {
                    setTimeout(LoadData, 2000);
                }
            });
        }
        $(document).ready(function () {
            LoadData();
            LoadRend();
            LoadHeadData();
        });
        function Maketbl(lst) {
            var tbl = "<table style='width: 100%; text-align: center; height: 89vh' class='divc'><tr>";
            lst.forEach(function (item, x) {
                var vbExists = false;
                for (i = 0; i < arPos.length; ++i) {
                    if (item.nPosicion == arPos[i].nPosicion) {
                        vbExists = true;
                    }
                }
                if (vbExists == false) {
                    var obPos = new Object();
                    obPos.nPosicion = item.nPosicion;
                    obPos.cDescSubLinea = item.cDescSubLinea;
                    arPos.push(obPos);
                    tbl += "<td class='divc' style='vertical-align: top; width: 25%'>"
                        + "<h1 class='divt' style='font-weight: bold; line-height: 1;'>" + item.cDescSubLinea + "</h1><br />"
                        + "<div id='dv" + item.nPosicion + "' item.nPosicion>"
                        + "</div ></td > ";
                }
            });
            tbl += "<tr></table>"
            $("#dvDetalle").html(tbl);
            vbTbl = true;
        }

        function LoadRend() {
            var obj = new Object();
            obj.vnIdMonitor = $('#<%=hdfIdMonitor.ClientID%>').val();
            obj.vcFecha = '';
            if (obj.vnIdMonitor != -1) {
                $.ajax({
                    type: 'POST',
                    url: "SerApp.asmx/ListMonitorRendimiento",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        var vv1 = "";
                        var vnSel = 0;
                        var Sel = 1;
                        //lst[i].cLabor
                        for (i = 0; i < lst.length; ++i) {
                            var Selec = Sel++;

                            vv1 += "<tr><td>" + Selec + "</td><td style='text-align: left;'>" + lst[i].Nombre + "</td><td><b>" + lst[i].total + "<b></td></tr>";

                            vnSel += lst[i].total
                        }
                        $("#tbl1 tbody").html(vv1);
                        $("#TotalCajas").html('<b>' + vnSel + '</b>');
                        $("#CabTotalCajas").html('<b>' + vnSel + '</b>');

                        Emb = null;
                        Sel = null;
                        vnSel = null;
                        lst = null;
                    }, complete: function () {
                        setTimeout(LoadRend, 2000);
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
                    }, complete: function () {
                        setTimeout(LoadHeadData, 5000);
                    }
                });
            }
            obj = null
        }
    </script>
</body>
</html>
