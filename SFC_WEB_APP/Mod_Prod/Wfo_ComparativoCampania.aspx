<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ComparativoCampania.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Web_ComparativoCampania" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.light.css" />

    <script src="../Content/DevExtreme/cldr.min.js"></script>
    <script src="../Content/DevExtreme/event.min.js"></script>
    <script src="../Content/DevExtreme/supplemental.min.js"></script>
    <script src="../Content/DevExtreme/unresolved.min.js"></script>
    <script src="../Content/DevExtreme/globalize.min.js"></script>


    <%--<script src="../Content/DevExtreme/number.min.js"></script>--%>


    <script src="../Content/DevExtreme/message.min.js"></script>


    <%--   <script src="../Content/DevExtreme/currency.min.js"></script>
    <script src="../Content/DevExtreme/date.min.js"></script>--%>


    <script src="../Content/DevExtreme/jszip.min.js"></script>
    <script src="../Content/DevExtreme/dx.all.js"></script>
    <script src="../Content/DevExtreme/dx.messages.es.js"></script>
    <script src="../Content/DevExtreme/supplemental.js"></script>
    <script src="../Content/DevExtreme/es.js"></script>



    <style>
        .dx-freespace-row {
            height: 0px !important;
        }

        #DataGrid {
            max-height: 60vh;
            width: 100%;
        }

        .long-title h3 {
            font-family: 'Segoe UI Light', 'Helvetica Neue Light', 'Segoe UI', 'Helvetica Neue', 'Trebuchet MS', Verdana;
            font-weight: 200;
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
        }

        @media print {
            body, .printjsa, .dx-scrollable-content {
                display: block !important;
                position: relative !important;
                width: auto !important;
                height: auto !important;
                overflow: visible !important;
                margin-left: 0 !important;
                display: block !important; /* Not really needed in all cases */
                position: relative !important;
                width: auto !important;
                height: auto !important;
                overflow: visible !important;
            }
        }

        #gridContainer {
            height: 70vh;
        }

        .options {
            padding: 0px;
            margin-top: 0px;
        }

        .caption {
            font-size: 15px;
            font-weight: 500;
        }

        .option {
            margin-top: 0px;
        }

        .dx-datagrid-rowsview .dx-row > .dx-master-detail-cell {
            padding: 15px;
        }

        #DataGrid {
            font-size: 12px;
        }



/* ft calendar customization */
.fc-cal-date-normal-fusion {
  color: #5F5F5F;
  font-family: 'Source Sans Pro';
  font-size: 11px;
}

.fc-cal-date-selected-fusion {
  color: #FEFEFE;
  font-family: 'Source Sans Pro SemiBold';
  font-size: 11px;
}


#chartdiv {
  width: 100%;
  height: 500px;
}

    </style>
<script src="http://cdn.amcharts.com/lib/4/core.js"></script>
<script src="http://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="http://cdn.amcharts.com/lib/4/themes/animated.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
            <div class="row">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="btnBusc">Cultivo</label>
            <select class="form-control" id="txtTipoDato" name="txtTipoDato">
                <option value="0" selected disabled>Seleccione</option>
<%--                <option value="U">Uva</option>--%>
                <option value="P">Palta</option>
<%--                <option value="C">Citrico</option>--%>
            </select>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivCampania">
            <label for="txtFeInicio">Campaña 1</label>
            <asp:DropDownList ID="ddlCampania" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivCampania2">
            <label for="txtFeInicio">Campaña 2</label>
            <asp:DropDownList ID="ddlCampania2" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnBusc" name="btnBusc" runat="server" class="btn btn-secondary col-12">
                <i class="fa fa-search"></i>Buscar
            </button>
        </div>
    </div>
    <section id="cell-background" style="">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Comparativo por Campaña</h4>
                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li id="btn-excel" style="display: none"><a id='excelExport' title="Exportar en Excel"><i class="fas fa-file-excel"></i></a></li>
                                <li id="btn-pdf" style="display: none"><a id='pdfExport' title="Exportar en Pdf"><i class="fas fa-file-pdf"></i></a></li>
                                <li id="btn-expand" style="display: none"><a id='expandall' title="Expandir Grupos"><i class="fas fa-angle-double-down"></i></a></li>
                                <li id="btn-collapse" style="display: none"><a id='collapseall' title="Collapsar Grupos"><i class="fas fa-angle-double-up"></i></a></li>
                                <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body card-dashboard">
                            <div class="row">
                            <div id="container-x" class="device-mobile-tablet-container col-md-6">
                            </div>
                            <div id="container-y" class="device-mobile-tablet-container col-md-6">
                            </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12" id="dashboard1" style="display: none">
                <div class="card">
                     <div class="card-header">
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body card-dashboard">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                    <table id="tbdesc1" class="table table-striped table-bordered" width="100%">
                                         <thead style="display:none;">
                                            </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                    <div id="chartdiv1" style="height: 100%; padding-top: 3px"></div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                    <table id="tbdesc2" class="table table-striped table-bordered" width="100%">
                                        <thead style="display:none;">
                                            </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                    <div id="chartdiv2" style="height: 100%; padding-top: 3px"></div>
                                </div>
                            </div>
                        </div>
                   </div>
                 </div>
            </div>
            <div class="col-12" id="DashMini" style="display: none">
                <div class="card">
                     <div class="card-header">
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body card-dashboard">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <table id="tbComparativo" class="table col-lg-4 table-striped table-bordered" width="100%" style=" width: 100px;  margin: 0 auto;">
                                         <thead>
                                             <tr>
                                                 <th></th>
                                                 <th id="anio1"></th>
                                                 <th id="anio2"></th>
                                                 <th>Crecimiento</th>
                                             </tr>
                                            </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                   </div>
                 </div>
            </div>
        </div>
    </section>

       <!-- BEGIN: PageScripts/ Vendor JS -->
    <script src="../Scripts/dt/datatables.min.js"></script>
    <script src="../Scripts/dt/buttons.bootstrap4.min.js"></script>
    <!-- END: Page VScripts/endor JS-->
    <script>

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


        am4core.useTheme(am4themes_animated);

        // Create chart
        function chargedashboard(percent, dash) {
            var chart = am4core.createFromConfig({

                // Set inner radius
                "innerRadius": -20,

                // Create axis
                "xAxes": [{
                    "type": "ValueAxis",
                    "min": 0,
                    "max": 100,
                    "strictMinMax": true,

                    // Add ranges
                    "axisRanges": [{
                        "value": 0,
                        "endValue": 30,
                        "axisFill": {
                            "fillOpacity": 1,
                            "fill": "#FF0000",
                            "zIndex": -1
                        }
                    }, {
                        "value": 30,
                        "endValue": 80,
                        "axisFill": {
                            "fillOpacity": 1,
                            "fill": "#FFFF00",
                            "zIndex": -1
                        }
                    }, {
                        "value": 80,
                        "endValue": 100,
                        "axisFill": {
                            "fillOpacity": 1,
                            "fill": "#008000",
                            "zIndex": -1
                        }
                    }]
                }],

                // Add hands
                "hands": [{
                    "type": "ClockHand",
                    "value": percent,
                    "fill": "#2D93AD",
                    "stroke": "#2D93AD",
                    "innerRadius": "50%",
                    "radius": "80%",
                    "startWidth": 15,
                    "pin": {
                        "disabled": false
                    }
                }]

            }, dash, am4charts.GaugeChart);
        }



        $(document).ready(function () {
            //removeTag("footer");
        });
        $("#<%=btnBusc.ClientID%>").click(function () {
           ObtieneInformacion();
        });


        $('body').on('change', '#<%=ddlCampania.ClientID%>', function () {
           // 
            var id = $(this).val();
            var text = $('#ValOperacion :selected').text();

            Load_Campania(2, id);
        });

        Load_Campania(1, -1);
        Load_Campania(2, -1);

        function Load_Campania(optionid, idval) {
            var obj = new Object();
            $.ajax({
                //cache: false,
                type: 'POST',
                url: "../SerProd.asmx/ListProyectadoCampania",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    
                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0">Seleccione Campaña</option>';

                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].Campaña + '">' + lst[i].CampaniaTipo + '</option>';
                        }
                        if (optionid == 1) {
                            $("#<%=ddlCampania.ClientID%>").html('');
                            $("#<%=ddlCampania.ClientID%>").append(option);
                        } else if (optionid == 2) {
                            $("#<%=ddlCampania2.ClientID%>").html('');
                            $("#<%=ddlCampania2.ClientID%>").append(option);


                            $('#<%=ddlCampania2.ClientID%>').find('[value="' + idval + '"]').remove();
                        }
                    } else {
                        $("#<%=ddlCampania.ClientID%>").html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }


        function ObtieneInformacion() {
            $('#container-x').html('');
            $('#container-y').html('');
            $('#dashboard').hide();
            $('#dashboard2').hide();
            $("#tbdesc1 tbody").html('');
            $("#tbdesc2 tbody").html('');
            $("#chartdiv1").html('');
            $("#chartdiv2").html('');
            $("#DashMini").hide();
            
            var obj = new Object();
            obj.vnTipoOperacion = 2;
            obj.vcTipoDato = $("#txtTipoDato").val();
            obj.vcCampania = $("#<%=ddlCampania.ClientID%> :selected").val();
            obj.vcCampania2 = $("#<%=ddlCampania2.ClientID%> :selected").val();
            var tmp = null;
            
                if (obj.vcTipoDato != null) {
                    if (obj.vcCampania != null && obj.vcCampania != 0 ) {
                        if (obj.vcCampania2 != null && obj.vcCampania2 != 0 ) {
                            cargatabla(obj);
                        } else {
                            alert('SELECCIONE CAMPAÑA A COMPARAR');
                        }
                    } else {
                        alert('SELECCIONE CAMPAÑA');
                    }
                } else {
                    alert('SELECCIONE CULTIVO');
                }
        }


        function cargatabla(obj) {
            $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
            $('#container-y').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
            $.ajax({
                type: 'POST',
                url: "../SerProd.asmx/InformeParteTransformacionComparativo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    tmp = JSON.parse(data.d);

                    $('#container-x').html('<div style="font-size: 2rem; text-align: center; font-weight: bold;" id="aniohd1"></div><div id="DataGrid1"></div>');
                    $('#container-y').html('<div style="font-size: 2rem; text-align: center; font-weight: bold;" id="aniohd2"></div><div id="DataGrid2"></div>');
                    TbDataGrid(tmp.dt1, 'DataGrid1');
                    TbDataGrid(tmp.dt2, 'DataGrid2');

                        var data1 = new Array();
                        for (var x = 0; x < tmp.dd1.length; x++) {
                            var row = {};
                            if (tmp.dd1[x].descripcion == '% Avance') {
                                chargedashboard(tmp.dd1[x].detalle, 'chartdiv1');
                                var rowx = formatNumber.new(tmp.dd1[x].detalle.toFixed(3)) + ' %';
                            } else {
                                if (tmp.dd1[x].descripcion == 'Dias de Producción') {
                                    var rowx = tmp.dd1[x].detalle;
                                } else {
                                    var rowx = formatNumber.new(tmp.dd1[x].detalle.toFixed(3));
                                }
                            }
                            row["descripcion"] = tmp.dd1[x].descripcion;
                            row["detalle"] = rowx;
                            data1[x] = row;
                    }

                        //  $("#tbdesc tbody").html(vvEmb);
                        $('#tbdesc1 tbody').fadeIn(1000).html('');
                        var table = $('#tbdesc1').DataTable({

                            destroy: true,
                            "searching": false,
                            "paging": false,
                            "ordering": false,
                            "info": false,
                            responsive: true,
                            data: data1,
                            columns: [
                                {
                                    data: 'descripcion',
                                    className: "text-center"
                                },
                                {
                                    data: 'detalle',
                                    className: "text-right"
                                }
                            ],
                            language: {
                                "processing": "<img src='../img/loading.gif' />"
                            },
                        });

                    var data2 = new Array();
                    for (var y = 0; y < tmp.dd2.length; y++) {
                        var row = {};
                        if (tmp.dd2[y].descripcion == '% Avance') {
                            chargedashboard(tmp.dd2[y].detalle, 'chartdiv2');
                            var rowy = formatNumber.new(tmp.dd2[y].detalle.toFixed(3)) + ' %';
                        } else {
                            if (tmp.dd1[y].descripcion == 'Dias de Producción') {
                                var rowy = tmp.dd2[y].detalle;
                            } else {
                                var rowy = formatNumber.new(tmp.dd2[y].detalle.toFixed(3));
                            }
                        }
                        row["descripcion"] = tmp.dd2[y].descripcion;
                        row["detalle"] = rowy;
                        data2[y] = row;
                    }
                    //  $("#tbdesc tbody").html(vvEmb);
                    $('#tbdesc2 tbody').fadeIn(1000).html('');
                    var table2 = $('#tbdesc2').DataTable({

                        destroy: true,
                        "searching": false,
                        "paging": false,
                        "ordering": false,
                        "info": false,
                        responsive: true,
                        data: data2,
                        columns: [
                            {
                                data: 'descripcion',
                                className: "text-center"
                            },
                            {
                                data: 'detalle',
                                className: "text-right"
                            }
                        ],
                        language: {
                            "processing": "<img src='../img/loading.gif' />"
                        },
                    });
                    $('#dashboard1').show();
                    $('#dashboard2').show();

                    			
                    var data3 = new Array();
                    for (var z = 0; z < tmp.dtt.length; z++) {
                        var row = {};


                        var rowz1 = formatNumber.new(tmp.dtt[z].Anio2020.toFixed(3));
                        var rowz2 = formatNumber.new(tmp.dtt[z].Anio2021.toFixed(3));
                        var rowz3 = formatNumber.new(tmp.dtt[z].Crecimiento.toFixed(3)) + ' %';

                        			
                        row["anio"] = tmp.dtt[z].anio;
                        row["Anio2020"] = rowz1;
                        row["Anio2021"] = rowz2;
                        row["Crecimiento"] = rowz3;
                        data3[z] = row;
                    }
                    $('#tbComparativo tbody').fadeIn(1000).html('');
                    var table3 = $('#tbComparativo').DataTable({

                        destroy: true,
                        "searching": false,
                        "paging": false,
                        "ordering": false,
                        "info": false,
                        responsive: true,
                        data: data3,
                        columns: [
                            {
                                data: 'anio',
                                className: "text-center"
                            },
                            {
                                data: 'Anio2020',
                                className: "text-right"
                            },
                            {
                                data: 'Anio2021',
                                className: "text-right"
                            },
                            {
                                data: 'Crecimiento',
                                className: "text-right"
                            }
                        ],
                        language: {
                            "processing": "<img src='../img/loading.gif' />"
                        },
                    });
                    $('#DashMini').show();

                    $("#anio1").text(obj.vcCampania);
                    $("#anio2").text(obj.vcCampania2);
                    $("#aniohd1").text(obj.vcCampania);
                    $("#aniohd2").text(obj.vcCampania2);
                }, error: function (data) {
                    $('#container-x').html('');
                    $('#container-y').html('');
                    $('#dashboard').hide();
                    $('#dashboard2').hide();
                    $("#tbdesc1 tbody").html('');
                    $("#tbdesc2 tbody").html('');
                    $("#chartdiv1").html('');
                    $("#chartdiv2").html('');
                    $("#DashMini").hide();
                    alert(JSON.stringify(data));
                },
                timeout: 3000000,
            });
        }


        function TbDataGrid(data, table) {
            DevExpress.localization.locale('es');

            var dataGrid = $("#" + table).dxDataGrid({
                dataSource: data,
                scrolling: {
                    mode: "virtual"
                },
                grouping: {
                    autoExpandAll: false
                },
                groupPanel: {
                    visible: false
                },
                allowColumnReordering: true,
                allowColumnResizing: true,
                columnMinWidth: 30,
                columnAutoWidth: true,
                showBorders: true,
                columnChooser: {
                    enabled: false
                },
                columnFixing: {
                    enabled: false
                },
                wordWrapEnabled: true,
                showBorders: true,
                export: {
                    enabled: false,
                    fileName: "Reporte Informe Parte Transformacion"
                },

                filterRow: {
                    visible: false,
                    applyFilter: "auto"
                },
                searchPanel: {
                    visible: false,
                    placeholder: "Search..."
                },
                headerFilter: {
                    visible: false
                },
                columns: [{
                    caption: "Periodo",
                    dataField: "Periodo",
                    //  groupIndex: 0,
                }, {
                    caption: "Fecha Inicio",
                    dataField: "FechaIni",
                    //  groupIndex: 0,
                }, {
                    caption: "Fecha Fin",
                    dataField: "FechaFin",
                    //  groupIndex: 0,
                }, {
                    caption: "Cantidad Cajas",
                    dataField: "Cantidad_Cajas",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(3));
                    }
                    , dataType: "number"
                }, {
                    caption: "Peso Recepcionado",
                    dataField: "Peso_Recepcionado",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(3));
                    }
                    , dataType: "number",
                    visible: false
                }, {

                    caption: "Salida x Venta",
                    dataField: "SalidaxVenta",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(3));
                    }
                    , dataType: "number",
                    visible: false
                }, {
                    caption: "Ajuste Produccion",
                    dataField: "AjusteProduccion",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(3));
                    }
                    , dataType: "number",
                    visible: false
                }, {
                    caption: "Recepcionado Real",
                    dataField: "Recepcionado_Real",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(3));
                    }
                    , dataType: "number"
                }, {
                    caption: "Exportable",
                    dataField: "Exportable",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(3));
                    }
                    , dataType: "number"
                }, {
                    caption: "Rendimiento %",
                    dataField: "Rendimiento",
                    format: function (value) {
                        return value + ' %';
                    }
                }, {
                    caption: "Merma",
                    dataField: "Merma",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(3));
                    },
                    dataType: "number"
                }, {
                    caption: "Merma %",
                    dataField: "PorcMerma",
                    format: function (value) {
                        return value + ' %';
                    }
                }, {
                    caption: "Exceso",
                    dataField: "Exceso",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(3));
                    },
                    dataType: "number"
                }, {
                    caption: "Exceso %",
                    dataField: "PorcExceso",
                    format: function (value) {
                        return value + ' %';
                    }
                }, {
                    caption: "Descarte",
                    dataField: "Descarte",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(3));
                    },
                    dataType: "number"
                }, {
                    caption: "Descarte %",
                    dataField: "PorcDescarte",
                    format: function (value) {
                        return value + ' %';
                    }
                }, {
                    caption: "total",
                    dataField: "total",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(3));
                    },
                    dataType: "number"
                }, {
                    caption: "Dias Producidos",
                    dataField: "DiasProducidos"
                }, {
                    caption: "Diferencia",
                    dataField: "Diferencia",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(3));
                    },
                    dataType: "number",
                    visible: false
                }],
                sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }],
                summary: {
                    groupItems: [
                        {
                            column: "Cantidad_Cajas",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(3));
                            },
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            alignByColumn: true
                            , dataType: "number"
                        }, {
                            column: "Peso_Recepcionado",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(3));
                            },
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            alignByColumn: true
                            , dataType: "number"
                        }
                        , {
                            column: "SalidaxVenta",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(3));
                            },
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            alignByColumn: true
                            , dataType: "number"
                        }
                        , {
                            column: "AjusteProduccion",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(3));
                            },
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            alignByColumn: true
                            , dataType: "number"
                        }, {
                            column: "Recepcionado_Real",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(3));
                            },
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            alignByColumn: true
                            , dataType: "number"
                        }, {
                            column: "Merma",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(3));
                            },
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            alignByColumn: true
                            , dataType: "number"
                        }, {
                            column: "Exceso",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(3));
                            },
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            alignByColumn: true
                            , dataType: "number"
                        }, {
                            column: "Descarte",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(3));
                            },
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            alignByColumn: true
                            , dataType: "number"
                        }, {
                            column: "total",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(3));
                            },
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            alignByColumn: true
                            , dataType: "number"
                        }, {
                            column: "Diferencia",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(3));
                            },
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            alignByColumn: true
                            , dataType: "number"
                        }
                    ],
                    totalItems: [{
                        column: "Cantidad_Cajas",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(3));
                        },
                        displayFormat: "{0}",
                        dataType: "number"
                    }, {
                        column: "Peso_Recepcionado",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(3));
                        },
                        displayFormat: "{0}",
                        dataType: "number"
                    }, {
                        column: "SalidaxVenta",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(3));
                        },
                        displayFormat: "{0}",
                        dataType: "number"
                    }, {
                        column: "AjusteProduccion",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(3));
                        },
                        displayFormat: "{0}",
                        dataType: "number"
                    }, {
                        column: "Recepcionado_Real",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(3));
                        },
                        displayFormat: "{0}",
                        dataType: "number"
                    }, {
                        column: "Exportable",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(3));
                        },
                        displayFormat: "{0}",
                        dataType: "number"
                    }, {
                        column: "Produccion",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(3));
                        },
                        displayFormat: "{0}",
                        dataType: "number"
                    }, {
                        column: "Merma",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(3));
                        },
                        displayFormat: "{0}",
                        dataType: "number"
                    }, {
                        column: "Exceso",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(3));
                        },
                        displayFormat: "{0}",
                        dataType: "number"
                    }, {
                        column: "Descarte",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(3));
                        },
                        displayFormat: "{0}",
                        dataType: "number"
                    }, {
                        column: "total",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(3));
                        },
                        displayFormat: "{0}",
                        dataType: "number"
                    }, {
                        column: "Diferencia",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(3));
                        },
                        displayFormat: "{0}",
                        dataType: "number"
                    }
                        // ...
                    ]
                }
            })
        };

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
