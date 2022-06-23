<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_MoniIngresoCamionesMP.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_MoniIngresoCamionesMP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>CAMIONES MP</title>
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
            padding: 8px;
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
            font-size: 20px;
        }

        .tbRend td {
            border-bottom: 1px solid white;
            padding: 2px;
            font-size: 20px;
        }
    </style>
</head>
<body>
    <form id="frm" runat="server">
        <table style="width: 100%; text-align: left; margin-bottom: 0px" class="table">
            <tr>
                <td style="width: 30%; padding: 0px; margin: 0px">
                    <img src="../Img/sf-logo.png" style="width: 160px; position: absolute; left: 0;" />
                </td>
                <td style="width: 70%; padding: 0px; margin: 0px">
                    <div class="text-center" style="font-size: 3rem; color: white">
                    <span id="dvTitle" runat="server"></span> INGRESO CAMIONES DE MATERIA PRIMA <span id="lblCLiente" ></span>
                    </div>
                </td>
            </tr>
        </table>
        <div>
            <div class="row">
                <div class="col-12" style="font-size: 16px;">
                    
                <!--<h1>Pendiente por abastecer</h1>-->
                        <table id="tblUbicaciones" style="text-align: center; margin-bottom: 0px; width: 100%" class="tbRend">
                            <thead>
                                <tr>
                                    <td>Vehiculo</td>
                                    <td>Placa</td>
                                    <td>Cliente</td>
                                    <td>Guias</td>
                                    <td>Variedad</td>
                                    <td>Fecha</td>
                                    <td>Hora</td>
                                    <td>tiempo en planta</td>
                                    <td>Jabas</td>
                                </tr>
                            </thead>
                            <tbody class="text-white">
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td id="lblpalets"></td>
                                    <td id="lblkilos"></td>
                                </tr>
                            </tfoot>
                        </table>
                </div>
                <!-- <div class="col-6" style="font-size: 16px;">
                        <table id="tblVolcados" style="text-align: center; margin-bottom: 0px; width: 100%" class="tbRend">
                            <thead>
                                <tr>
                                    <td>CLIENTE</td>
                                    <td>FAMILIA</td>
                                    <td>PALETS</td>
                                    <td>KILOS</td>
                                </tr>
                            </thead>
                            <tbody class="text-white">
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td></td>
                                    <td>TOTAL</td>
                                    <td id="lbl"></td>
                                    <td id="lbl2"></td>
                                </tr>
                            </tfoot>
                        </table>
                </div>
                 <div class="col-6" style="font-size: 16px;">
                         <div class="row">
        <div class="col-12">
            <div class="card" style="zoom: 1;">
                <div class="card-header">
                    <h4 style="color: #000">Variedad Por palets</h4>
  
                </div>
                <div class="card-content collapse show" style="">
                    <div class="card-body">
                        <div class="height-400">
                            <canvas id="graphCanvas" class="chartjs-render-monitor" style="display: block;"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
                </div>-->
            </div>
        </div>
        <asp:HiddenField ID="hdfIdMonitor" Value="1" runat="server" />
    </form>
    <script>
        function LoadData() {
            var obj = new Object();
            obj.vnIdMonitor = $('#<%=hdfIdMonitor.ClientID%>').val();
            obj.vcfecha = '';
            obj.vnIdControlGarita = 0;
            if (obj.vnIdMonitor != -1) {
                $.ajax({
                    type: 'POST',
                    url: "SerApp.asmx/ListControlGarita",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        var vvtb = "";
                        var plt = 0;
                        var kgs = 0;
                        
                        for (i = 0; i < lst.length; ++i) {
                            if (lst[i].dFechaSalida == null && lst[i].dFechaRegiSalida == null) {
                                plt += lst[i].jabas;
                                vvtb += "<tr><td>" + lst[i].cDescripcion + "</td><td>" + lst[i].cPlaca + "</td><td><i class='fas fa-cubes'></i> " + lst[i].cRazonSocial + "</td><td>" + lst[i].guias + "</td><td>" + lst[i].variedades + "</td><td>" + lst[i].FechaIngreso + "</td><td>" + lst[i].HIngreso + "</td><td>" + lst[i].transcurrido + " Horas</td><td><i class='fas fa-weight-hanging'></i> " + lst[i].jabas + "</td></tr>";
                            }
                        }
                        $("#lblpalets").html('<b></b>');
                        $("#lblkilos").html('<b> ' + plt+' Jabas</b>');
                        $("#tblUbicaciones tbody").html(vvtb);

                    }
                });
            }
        }
        $(document).ready(function () {
            openFullscreen();
            LoadData();
           setInterval(LoadData, 1000);
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


        var formatNumber = {
 separador: ",", // separador para los miles
 sepDecimal: '.', // separador para los decimales
 formatear:function (num){
 num +='';
 var splitStr = num.split('.');
 var splitLeft = splitStr[0];
 var splitRight = splitStr.length > 1 ? this.sepDecimal + splitStr[1] : '';
 var regx = /(\d+)(\d{3})/;
 while (regx.test(splitLeft)) {
 splitLeft = splitLeft.replace(regx, '$1' + this.separador + '$2');
 }
 return this.simbol + splitLeft +splitRight;
 },
 new:function(num, simbol){
 this.simbol = simbol ||'';
 return this.formatear(num);
 }
}

    </script>

    </body>
    </html>

