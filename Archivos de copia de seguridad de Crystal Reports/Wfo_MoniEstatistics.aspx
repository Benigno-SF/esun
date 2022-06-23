<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_MoniEstatistics.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_MoniEstatistics" %>

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
        <table style="width: 100%; text-align: center; margin-bottom: 0px" class="table" border="1">
            <tr>
                <td>
                    <div class="row">
                        <div class="col-12">
                            <div class="card" style="zoom: 1;">
                                <div class="card-header">
                                    <h4 class="card-title" id="dvTitle" runat="server">Column Chart</h4>
                                    <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                    <div class="heading-elements">
                                        <ul class="list-inline mb-0">
                                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                            <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-content collapse show" style="">
                                    <div class="card-body">
                                        <div class="height-400">
                                            <div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
                                                <div class="chartjs-size-monitor-expand" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
                                                    <div style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
                                                </div>
                                                <div class="chartjs-size-monitor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
                                                    <div style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
                                                </div>
                                            </div>
                                            <canvas id="graphCanvas" width="1017" height="400" class="chartjs-render-monitor" style="display: block; width: 1017px; height: 400px;"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hdfIdMonitor" Value="1" runat="server" />
    </form>
<script>
        $(document).ready(function () {
          //setInterval('showGraph()',5000);
            showGraph();
        });


        function showGraph() {
            var obj = new Object();
            obj.vcIdEmpresa = '1';
            obj.vcFecha = '';
            if (obj.vcIdEmpresa != "") {
                $.ajax({
                    type: 'POST',
                    url: "../SerProd.asmx/ListGrupoRendimiento",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        alert();
                        var lst = JSON.parse(data.d);
                        var name = [];
                        var cajas = [];
                        var etiquetas = [];
                        var kilos = [];
                        var kilosf = [];

                        for (var i in lst) {
                            name.push(lst[i].cDescAGrupo);
                            cajas.push(lst[i].cajas);
                            etiquetas.push(lst[i].etiquetas);
                            kilos.push(lst[i].kilos);
                            kilosf.push(lst[i].kilosf);
                        }

                        var chartdata = {
                            labels: name,
                            datasets: [
                                {
                                    label: 'cajas aprox',
                                    backgroundColor: '#49e2ff',
                                    borderColor: '#46d5f1',
                                    hoverBackgroundColor: '#CCCCCC',
                                    hoverBorderColor: '#666666',
                                    data: cajas
                                },{
                                    label: 'etiquetas',
                                    backgroundColor: "#F98E76",
                                    hoverBackgroundColor: "rgba(249,142,118,.9)",
                                    borderColor: "transparent",
                                    data: etiquetas
                                },{
                                    label: 'kilos volcados',
                                    backgroundColor: "#16D39A",
                                    hoverBackgroundColor: "rgba(22,211,154,.9)",
                                    borderColor: "transparent",
                                    data: kilos
                                },{
                                    label: 'kilos Ingresados',
                                    backgroundColor: "#16D39A",
                                    hoverBackgroundColor: "rgba(22,211,154,.9)",
                                    borderColor: "transparent",
                                    data: kilosf
                                }
                            ]
                        };

                        //var graphTarget = $("#graphCanvas");

                        //var barGraph = new Chart(graphTarget, {
                        //    type: 'bar',
                        //    data: chartdata,
                            
                        //});



                    var opt = {
                        events: false,
                        tooltips: {
                            enabled: false
                        },
                        hover: {
                            animationDuration: 0
                        },
                        animation: {
                            duration: 1,
                            onComplete: function () {
                                var chartInstance = this.chart,
                                    ctx = chartInstance.ctx;
                                ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
                                ctx.textAlign = 'center';
                                ctx.textBaseline = 'bottom';

                                this.data.datasets.forEach(function (dataset, i) {
                                    var meta = chartInstance.controller.getDatasetMeta(i);
                                    meta.data.forEach(function (bar, index) {
                                        var data = dataset.data[index];                            
                                        ctx.fillText(data, bar._model.x, bar._model.y - 5);
                                    });
                                });
                            }
                        }
                    };
                     var ctx = document.getElementById("graphCanvas"),
                         myLineChart = new Chart(ctx, {
                            type: 'bar',
                            data: chartdata,
                            options: opt
                         });

                        
                    }
                });
            }
        };
        </script>
</body>
</html>
