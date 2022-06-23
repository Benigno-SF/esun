<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_MoniAbastecimiento.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_MoniAbastecimiento" %>

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
            font-size: 17px;
        }

        .tbRend td {
            border-bottom: 1px solid white;
            padding: 2px;
            font-size: 17px;
        }
    </style>
    <script type="text/javascript" src="http://192.168.20.20/ch/js/Chart.min.js"></script>
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
                    <span id="dvTitle" runat="server"></span> PANEL DE ABASTECIMIENTO - <span id="lblCLiente" ></span>
                    </div>
                </td>
            </tr>
        </table>
        <div>
            <div class="row">
                <div class="col-6" style="font-size: 16px;">
                    
                <!--<h1>Pendiente por abastecer</h1>-->
                        <table id="tblUbicaciones" style="text-align: center; margin-bottom: 0px; width: 100%" class="tbRend">
                            <thead>
                                <tr>
                                    <td>CLIENTE</td>
                                    <td>VARIEDAD</td>
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
                </div>-->
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
                </div>
            </div>
        </div>
        <asp:HiddenField ID="hdfIdMonitor" Value="1" runat="server" />
    </form>
    <script>
        function LoadData() {
            var obj = new Object();
            obj.vnIdMonitor = $('#<%=hdfIdMonitor.ClientID%>').val();
            obj.vcfecha = '';
            if (obj.vnIdMonitor != -1) {
                $.ajax({
                    type: 'POST',
                    url: "SerApp.asmx/ListPaletsProducidosAbast",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        var vvtb = "";
                        var plt = 0;
                        var kgs = 0;
                        
                        for (i = 0; i < lst.length; ++i) {
                            
                            plt +=lst[i].palets;
                            kgs += lst[i].kilos;
                            if (lst[i].NombreUbicacion == 'ALMACEN GENERAL') {
                                var nub = lst[i].NombreProveedor;
                            } else {
                                var nub = lst[i].NombreUbicacion;
                            }
                            vvtb += "<tr><td>"+nub.substring(0, 26)+"</td><td>" + lst[i].NombreFamilia + "</td><td><i class='fas fa-cubes'></i> " + lst[i].palets + "</td><td><i class='fas fa-weight-hanging'></i> " + formatNumber.new(lst[i].kilos.toFixed(2)) + "</td></tr>";
                        }
                        $("#lblpalets").html('<b>'+plt+'</b>');
                        $("#lblkilos").html('<b>'+formatNumber.new(kgs.toFixed(2))+' Kg.</b>');
                        $("#tblUbicaciones tbody").html(vvtb);



                        //function groupBy(list, keyGetter) {
                        //    const map = new Map();
                        //    list.forEach((item) => {
                        //        const key = keyGetter(item);
                        //        if (!map.has(key)) {
                        //            map.set(key, [item]);
                        //        } else {
                        //            map.get(key).push(item);
                        //        }
                        //    });
                        //    return map;
                        //}

                        //const lst = groupBy(lst, NombreFamilia => NombreFamilia.type);

                        var name = [];
                        var palets = [];

                        for (var i in lst) {
                            name.push(lst[i].NombreFamilia.substring(0, 26));
                            palets.push(lst[i].palets);
                        }

                        var cadena = "cadena de texto",
                        inicio = 1,
                        fin    = 15,
                        subCadena = cadena.substring(inicio, fin);

                        var chartdata = {
                            labels: name,
                            datasets: [
                                {
                                    label: 'PALETS',
                                    backgroundColor: ["#3e95cd", "#D1ED0A","#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
                                    data: palets
                                }
                            ]
                        };
                        
                        var ctx = document.getElementById("graphCanvas"),
                            myLineChart = new Chart(ctx, {
                                type: 'pie',
                                data: chartdata,
                            });


                    }
                });
            }
        }
        $(document).ready(function () {
            openFullscreen();
            LoadData();
           setInterval(LoadData, 300000);
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