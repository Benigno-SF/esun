<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_InformeParteTransformacion.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Wfo_InformeParteTransformacion" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.light.css" />
   
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.css" rel="stylesheet"/>

    <script src="../Content/DevExtreme/cldr.min.js"></script>
    <script src="../Content/DevExtreme/event.min.js"></script>
    <script src="../Content/DevExtreme/supplemental.min.js"></script>
    <script src="../Content/DevExtreme/unresolved.min.js"></script>
    <script src="../Content/DevExtreme/globalize.min.js"></script>

    <%--<script src="../Content/DevExtreme/number.min.js"></script>--%>

    <script src="../Content/DevExtreme/message.min.js"></script>
    <script src="../Content/DevExtreme/currency.min.js"></script>
    <script src="../Content/DevExtreme/date.min.js"></script>
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
            width: 100%;
            font-size: 12px;
            max-height: 70vh
        }

        .long-title h3 {
            font-family: 'Segoe UI Light', 'Helvetica Neue Light', 'Segoe UI', 'Helvetica Neue', 'Trebuchet MS', Verdana;
            font-weight: 200;
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
        }

        #gridContainer {
            /* height: 70vh;*/
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

        .dx-datagrid-rowsview {
            /*overflow: auto; width: 100%; min-height: 15vh !important;*/
        }

        #gridTopScroll {
            width: 1000px;
            height: 20px;
            overflow-x: scroll;
            overflow-y: hidden;
        }

        .dx-scrollable-container {
            overflow: auto !important;
        }

        .dx-scrollbar-hoverable {
            display: none;
        }


        .dx-datagrid-drag-action {
        background-color: #667ca5 !important;
        color: white !important;
        }

        .dx-datagrid-headers {
        background-color: #667ca5 !important;
        }
    </style>
    <script src="https://cdn.amcharts.com/lib/4/core.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
  


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="btnBusc">Tipo Operacion</label>
            <select class="form-control js-find-cul" style="cursor:pointer" id="ValOperacion" name="ValOperacion">
                <option value="0" selected disabled>Seleccione</option>
                <option value="1">Avance</option>
                <option value="2">Detalle</option>
            </select>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="btnBusc">Cultivo</label>
            <select class="form-control js-find-cul" style="cursor:pointer"  id="txtTipoDato" onchange="CampanaChange(this)" name="txtTipoDato">
                <option value="0" selected disabled>Seleccione</option>
                <option value="U">UVA</option>
                <option value="P">PALTA</option>
                <option value="C">CITRICO</option>
                <option value="A">ARANDANO</option>
            </select>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivCampania" style="display: none">
            <label for="txtFeInicio">Campa&ntilde;a</label>
            <asp:DropDownList ID="ddlCampania" style="cursor:pointer"  runat="server" CssClass="form-control js-find-cul"></asp:DropDownList>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivFeInicio" style="display: none">
            <label for="txtFeInicio">Desde</label>
            <input type="text" name="txtFeInicio" id="txtFeInicio" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
            <script type="text/javascript">
                $(function () {
                    $('#<%=txtFeInicio.ClientID %>').datetimepicker({
                        format: 'DD/MM/YYYY',
                        locale: 'es'
                    });
                    $(function () {
                        $('#DivFeInicio').datetimepicker({
                            format: 'DD/MM/YYYY',
                            locale: 'es'
                        });
                    });
                });
            </script>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivFeFin" style="display: none">
            <label for="txtFechaFin">Hasta</label>
            <input type="text" name="txtFeFin" id="txtFeFin" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy" style>
            <script type="text/javascript">
                $(function () {
                    $('#<%=txtFeFin.ClientID %>').datetimepicker({
                        format: 'DD/MM/YYYY',
                        locale: 'es'
                    });
                    $(function () {
                        $('#DivFeFin').datetimepicker({
                            format: 'DD/MM/YYYY',
                            locale: 'es'
                        });
                    });
                });
            </script>
        </div>
        <div class="form-group col-12 col-sm-12 col-md-5 col-lg-2">
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
                        <h4 class="card-title">Informe Parte de Tranformacion</h4>
                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li id="btn-excel" style="display: none"><a id='excelExport' title="Exportar en Excel"><i class="fas fa-file-excel"></i></a></li>
                                <li id="btn-pdf" style="display: none"><a id='pdfExport' title="Exportar en Pdf"><i class="fas fa-file-pdf"></i></a></li>
                                <li id="btn-expand" style="display: none"><a id='expandall' title="Expandir Grupos"><i class="fas fa-angle-double-down"></i></a></li>
                                <li id="btn-collapse" style="display: none"><a id='collapseall' title="Collapsar Grupos"><i class="fas fa-angle-double-up"></i></a></li>
                                <li><a data-action="expand" id="xpand1" class="maheight"><i class="ft-maximize"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body card-dashboard" style="min-height: 30vh">
                            <div id="container-x" class="device-mobile-tablet-container">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--ANGEL GONZALES CASTILLA - T.I.-->
            <div class="row" id="comparativo_hiden" style="text-align:center">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">CUADRO COMPARATIVO DE MATERIA PRIMA RECEPCIONADO VS PROYECTADO</h5>
                        </div>
                        <div class="card-content collapse show">
                            <div class="card-body">
                                <div class="row">
                                    <div id="w-100">
                                        <table id="tbdetalle_ag" class="table table-hover table-sm">
                                            <thead style="background:#667CA5;color:white">
                                                <tr>
                                                    <td>PROYECTADO KG.</td>
                                                    <td>RECEPCIONADO KG.</td>
                                                    <td>% AVANCE EJECUTADO VS PROYECTADO</td>
                                                </tr>
                                            </thead>
                                             <tbody>
                                                 
                                             </tbody>
                                        </table>
                                    </div>
                                </div>  
                            </div>  
                        </div>  
                    </div>                
                </div>
            </div>
            <!------------------------------------------------------------------------------------->

            <div class="col-12" id="dashboard" style="display: none">
                <div class="card">
                    <div class="card-header">
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body card-dashboard">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <table id="tbdesc" class="table table-striped table-bordered" width="100%">
                                        <thead style="display: none;">
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div id="chartdiv" style="height: 100%; padding-top: 3px"></div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="card">
        <div class="card-header">
            <div class="container" id="div_chart_contenedores">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="contenedor_chart">
                          <div id="chart" style="height: 440px">

                          </div>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </div>
    
    
  

    <%--    <div class="dx-viewport">
    <div class="demo-container">
        <div id="pie"></div>
    </div>
</div>--%>


    <!-- BEGIN: PageScripts/ Vendor JS -->
    <script src="../Scripts/dt/datatables.min.js"></script>
    <script src="../Scripts/dt/dataTables.buttons.min.js"></script>
    <script src="../Scripts/dt/buttons.bootstrap4.min.js"></script>
    <script src="../Scripts/dt/vfs_fonts.js"></script>
    <script src="../Scripts/dt/buttons.html5.min.js"></script>
    <!-- END: Page VScripts/endor JS-->


    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>


    <script>
        $("document").ready(function () {
            startslc();
            
        });

        function startslc() {
            /*PLUGIN SELECT2*/

            $("#<%=ddlCampania.ClientID%>").prepend("<option value = '0' disabled selected>" + "Seleccione Campa&ntilde;a" + "</option>");
            /*FIN PLUGIN*/
        }

        $("#xpand1").click(function () {
            if ($("#xpand1").attr("class") == 'maheight') {
                $('#DataGrid').css("max-height", "90vh");
                $("#xpand1").removeClass("maheight");
                $("#xpand1").addClass("miheight");
            } else if ($("#xpand1").attr("class") == 'miheight') {
                $('#DataGrid').css("max-height", "60vh");
                $("#xpand1").removeClass("miheight");
                $("#xpand1").addClass("maheight");
            }
        });


        am4core.useTheme(am4themes_animated);

        // Create chart
        function chargedashboard(percent) {
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

            }, "chartdiv", am4charts.GaugeChart);
        }



        $(document).ready(function () {
            //removeTag("footer");
        });
        $("#<%=btnBusc.ClientID%>").click(function () {
            ObtieneInformacion();
           
        });

        $('body').on('change', '#ValOperacion', function () {
            var id = $(this).val();
            var text = $('#ValOperacion :selected').text();
            if (id == 1) {
                $("#DivFeInicio").hide();
                $("#DivFeFin").hide();
                $("#DivCampania").show();

                $("#<%=txtFeInicio.ClientID%>").val('');
                $("#<%=txtFeFin.ClientID%>").val('');
                $("#<%=ddlCampania.ClientID%>").val(0);
            } else if (id == 2) {
                $("#DivFeInicio").show();
                $("#DivFeFin").show();
                $("#DivCampania").hide();

                $("#<%=txtFeInicio.ClientID%>").val('');
                $("#<%=txtFeFin.ClientID%>").val('');
                $("#<%=ddlCampania.ClientID%>").val(0);
            }
        });

       

        /********************************************************************************************************************************/
        //ANGEL GONZALES CASTILLA - TI.
        function CampanaChange() {
            $("#<%=ddlCampania.ClientID%>").empty();
            //OBTENGO EL VALOR DEL CULTIVO
            var c = $("#txtTipoDato").val();
            var dt = {
                pt: {
                    cultivo: c
                }
            }
            $.ajax({
                type: "post",
                data: JSON.stringify(dt),
                url: "../SerProd.asmx/ListarCampana_SUN",
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            }).done(function (r) {
                //alert(r.d);
                var req = JSON.parse(r.d);
                for (var i = 0; i < req.length; i++) {
                    $("#<%=ddlCampania.ClientID%>").prepend("<option value='" + req[i].FECHAINICIO + "'>" + req[i].DESCRIPCION + "</option>");
                    
                }
                $("#<%=ddlCampania.ClientID%>").prepend("<option value = '0' disabled selected>" + "Seleccione Campa&ntilde;a" + "</option>");
            })

        }

        /********************************************************************************************************************************/

       

        function ObtieneInformacion() {
            $('#dashboard').hide();
            
            $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
            var obj = new Object();
            obj.vcFecha = $("#<%=txtFeInicio.ClientID%>").val();
            obj.vcFechaFin = $("#<%=txtFeFin.ClientID%>").val();
            obj.vnTipoOperacion = $("#ValOperacion").val();
            obj.vcTipoDato = $("#txtTipoDato").val();
            obj.vcCampania = $("#<%=ddlCampania.ClientID%> :selected").val();
            $("#tbdetalle_ag tbody").html('');
            $("#div_chart_contenedores").attr("hidden", true);
            var tmp = null;
            if (obj.vnTipoOperacion != null) {
                if (obj.vcTipoDato != null) {

                    if (obj.vnTipoOperacion == 2) {
                        if (obj.vcFecha != '' && obj.vcFechaFin != '') {
                            cargatabla(obj);
                            $('#dashboard').hide();
                            $("#tbdesc tbody").html('');
                            $("#tbdetalle_ag tbody").html('');
                            $("#div_chart_contenedores").attr("hidden", true);
                        } else {
                            alert('SELECCIONE FECHAS INICIO Y FIN');
                            $('#container-x').html('');
                            $('#dashboard').hide();
                            $("#tbdesc tbody").html('');
                            $("#tbdetalle_ag tbody").html('');
                            $("#div_chart_contenedores").attr("hidden", true);
                        }
                    }
                    if (obj.vnTipoOperacion == 1) {
                        if (obj.vnTipoOperacion == 1 && obj.vcCampania != 0) {
                            cargatabla(obj);
                        } else {
                            alert('SELECCIONE CAMPAÑA');
                            $('#container-x').html('');
                            $("#tbdetalle_ag tbody").html('');
                            $("#div_chart_contenedores").attr("hidden", true);
                        }
                    }

                } else {
                    alert('SELECCIONE CULTIVO');
                    $('#container-x').html('');
                    $("#div_chart_contenedores").attr("hidden", true);
                }
            } else {
                alert('SELECCIONE TIPO DE OPERACION');
                $('#container-x').html('');
                $("#div_chart_contenedores").attr("hidden", true);
            }
        }


        function cargatabla(obj) {
            $("#div_chart_contenedores").attr("hidden", false);
            //alert(obj);
            $.ajax({
                type: 'POST',
                url: "../SerProd.asmx/InformeParteTransformacion",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    tmp = JSON.parse(data.d);
                    console.log(tmp);
                    $('#container-x').html('<div class="options"><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="DataGrid"></div>');
                    //$("#tbdetalle_ag").html('<div class="options"><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="DataGrid_f"></div>');

                    //ANGEL GONZLES CASTILLA T.I.
                    $("#tbdetalle_ag tbody").append("<tr>");
                    //alert(tmp.df.length);
                    for (var i = 0; i < tmp.df.length; i++) {
                        $("#tbdetalle_ag tbody").append("<td>" + parseFloat(tmp.df[i].PROYECTADO_T).toLocaleString() + "</td>");
                        $("#tbdetalle_ag tbody").append("<td>" + parseFloat(tmp.df[i].RECEPCIONADO_T).toLocaleString() + "</td>");
                        $("#tbdetalle_ag tbody").append("<td>" + parseFloat(tmp.df[i].RENDIMIENTO_T).toLocaleString()+" %" + "</td>");
                    }
                    $("#tbdetalle_ag tbody").append("</tr>");
                    ///////////////////////////////



                    if (obj.vnTipoOperacion == 1) {
                        //Esconder Comparativo
                        $("#comparativo_hiden").attr("hidden", false);


                        TbDataGrid(tmp.dd);
                        chart_con(tmp.dc);

                        for (i = 0; i < tmp.dh.length; ++i) {
                            if (tmp.dh[i].descripcion == '% Avance') {
                                chargedashboard(parseInt(tmp.dh[i].detalle))
                            }
                            // vvEmb += "<tr><td><b>" + tmp.dd[i].descripcion + "</b></td><td style='text-align: right'><b>" + formatNumber.new(tmp.dd[i].detalle.toFixed(3)); + "</b></td></tr>";
                        }

                        var datad = new Array();
                        for (var x = 0; x < tmp.dh.length; x++) {
                            var row = {};
                            if (tmp.dh[x].descripcion == '% Avance') {
                                chargedashboard(parseInt(tmp.dh[x].detalle));
                                var rowx = tmp.dh[x].detalle + ' %';
                            } else {
                                if ('Dias de Producción') {
                                    var rowx = tmp.dh[x].detalle;
                                } else {
                                    var rowx = tmp.dh[x].detalle;
                                }
                            }
                            row["descripcion"] = tmp.dh[x].descripcion;
                            row["detalle"] = rowx;
                            datad[x] = row;
                        }
                        //  $("#tbdesc tbody").html(vvEmb);
                        $('#tbdesc tbody').fadeIn(1000).html('');
                        var table = $('#tbdesc').DataTable({

                            destroy: true,
                            "searching": false,
                            "paging": false,
                            "ordering": false,
                            "info": false,
                            responsive: true,
                            data: datad,
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
                        $('#dashboard').show();
                        
                    } else if (obj.vnTipoOperacion == 2) {
                        $("#comparativo_hiden").attr("hidden",true);
                        TbDataGrid2(tmp.df);
                       
                    }
                }, error: function (data) {
                    alert(JSON.stringify(data));
                },
                timeout: 3000000,
            });
        }


        function chart_con(data) {
            //console.log(data);
            const dataSource = [{            
                state: data[0].cliente,
                avance: data[0].avance_chart,
                    proyectado: data[0].proyectado_chart,
                    
            }, {
                state: data[1].cliente,
                avance: data[1].avance_chart,
                    proyectado: data[1].proyectado_chart,
                    
                }, {
                state: data[2].cliente,
                avance: data[2].avance_chart,
                    proyectado: data[2].proyectado_chart,
                    
                }, {
                state: data[3].cliente,
                avance: data[3].avance_chart,
                    proyectado: data[3].proyectado_chart,
                    
                }, {
                state: data[4].cliente,
                avance: data[4].avance_chart,
                    proyectado: data[4].proyectado_chart,
                    
                }];
            pasar_chart(dataSource);
        }


        function pasar_chart(dataSource) {
            $(() => {
                $('#contenedor_chart').dxChart({
                    dataSource,
                    commonSeriesSettings: {
                        argumentField: 'state',
                        type: 'bar',
                        hoverMode: 'allArgumentPoints',
                        selectionMode: 'allArgumentPoints',
                        label: {
                            visible: true,
                            format: {
                                type: 'fixedPoint',
                                precision: 0,
                            },
                        },
                    },
                    series: [
                        { valueField: 'avance', name: 'Avance' },
                        { valueField: 'proyectado', name: 'Proyectado' },    
                    ],
                    title: 'Comparativo de Avance VS Proyectado de contenedores',
                    legend: {
                        verticalAlignment: 'bottom',
                        horizontalAlignment: 'center',
                    },
                    export: {
                        enabled: true,
                    },
                    onPointClick(e) {
                        e.target.select();
                    },
                });
            });
        }

        //function PieDataGrid(dataSource) {
        //    console.log(dataSource);
        //    $("#pie").dxPieChart({
        //        palette: "bright",
        //        dataSource: dataSource,
        //        title: "Top internet languages",
        //        legend: {
        //            horizontalAlignment: "center",
        //            verticalAlignment: "bottom"
        //        },
        //        "export": {
        //            enabled: true
        //        },
        //        series: [{
        //            argumentField: "Productor",
        //            valueField: "peso",
        //            label: {
        //                visible: true,
        //                connector: {
        //                    visible: true,
        //                    width: 0.5
        //                },
        //                format: "fixedPoint",
        //                customizeText: function (point) {
        //                    return point.argumentText + ": " + point.valueText + "%";
        //                }
        //            },
        //            smallValuesGrouping: {
        //                mode: "smallValueThreshold",
        //                threshold: 4.5
        //            }
        //        }]
        //    });
        //};


        function TbDataGrid(data) {
            DevExpress.localization.locale('es');

            var dataGrid = $("#DataGrid").dxDataGrid({
                dataSource: data,
                scrolling: {
                    mode: "virtual"
                },
                grouping: {
                    autoExpandAll: false
                },
                groupPanel: {
                    visible: true
                },
                //scrolling: {
                //    showScrollbar: 'always',
                //    useNative: true,
                //    scrollByThumb: true
                //},
                allowColumnReordering: true,
                allowColumnResizing: true,
                columnMinWidth: 30,
                columnAutoWidth: true,
                showBorders: true,
                columnChooser: {
                    enabled: true
                },
                columnFixing: {
                    enabled: true
                },
                wordWrapEnabled: true,
                showBorders: true,
                export: {
                    enabled: true,
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
                    displayFormat: "dd/mm/yyyy",
                    type: "date",
                }, {
                    caption: "Fecha Fin",
                    dataField: "FechaFin",
                    displayFormat: "dd/mm/yyyy",
                    type: "date",
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
                        caption: "Proyectado KG.",
                        dataField: "Proyectado",
                        format: function (value) {
                            return formatNumber.new(value.toFixed(3));
                        }
                        , dataType: "number"
                        //  groupIndex: 0,
                    },{
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
                    caption: "Desecho",
                    dataField: "Desecho",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(3));
                    },
                    dataType: "number"
                }, {
                    caption: "Desecho %",
                    dataField: "PorcDesecho",
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
                            column: "Proyectado KG.",
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
                            column: "Desecho",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(3));
                            },
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            alignByColumn: true
                            , dataType: "number"
                        },{
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
                            column: "Proyectado KG.",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(3));
                            },
                            displayFormat: "{0}",
                            dataType: "number"
                    },{
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
                            column: "Desecho",
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
            }).dxDataGrid("instance");

            $("#autoExpand").dxCheckBox({
                value: false,
                text: "Expandir",
                onValueChanged: function (data) {
                    dataGrid.option("grouping.autoExpandAll", data.value);
                }
            });

            $("#filterRow").dxCheckBox({
                text: "Buscar",
                value: false,
                onValueChanged: function (data) {
                    dataGrid.clearFilter();
                    dataGrid.option("filterRow.visible", data.value);
                    // applyFilterModeEditor.option("disabled", !data.value);
                }
            });

            $("#headerFilter").dxCheckBox({
                text: "Filtro",
                value: false,
                onValueChanged: function (data) {
                    dataGrid.clearFilter();
                    dataGrid.option("headerFilter.visible", data.value);
                }
            });

        };

        


        function TbDataGrid2(data) {
            DevExpress.localization.locale('es');

            var dataGrid = $("#DataGrid").dxDataGrid({
                dataSource: data,
                scrolling: {
                    mode: "virtual"
                },
                grouping: {
                    autoExpandAll: false
                },
                groupPanel: {
                    visible: true
                },
                allowColumnReordering: true,
                allowColumnResizing: true,
                columnMinWidth: 30,
                columnAutoWidth: true,
                showBorders: true,
                columnChooser: {
                    enabled: true
                },
                columnFixing: {
                    enabled: true
                },
                wordWrapEnabled: true,
                showBorders: true,
                export: {
                    enabled: true,
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
                    caption: "FechaProduccion",
                    dataField: "FechaProduccion",
                    //  groupIndex: 0,
                }, {
                    caption: "Semana",
                    dataField: "Semana",
                    //  groupIndex: 0,
                }, {
                    caption: "NombreCliente",
                    dataField: "NombreCliente",
                    //  groupIndex: 0,
                }, {
                    caption: "Productor",
                    dataField: "Productor",
                }, {
                    caption: "Fundo",
                    dataField: "Fundo",
                }, {
                    caption: "NombreFamiliaArticulo",
                    dataField: "NombreFamiliaArticulo",
                }, {

                    caption: "Merma",
                    dataField: "Merma",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(3));
                    }
                    , dataType: "number"
                }, {
                    caption: "Merma %",
                    dataField: "Porc_Merma",
                    format: function (value) {
                        return value + ' %';
                    }
                }, {
                    caption: "Exportable",
                    dataField: "Exportable",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(3));
                    }
                    , dataType: "number"
                }, {
                    caption: "Exportable %",
                    dataField: "Porc_Exportable",
                    format: function (value) {
                        return value + ' %';
                    }
                }, {
                    caption: "Exceso de Peso",
                    dataField: "Exceso_de_Peso",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(3));
                    },
                    dataType: "number"
                }, {
                    caption: "Exceso de peso %",
                    dataField: "Porc_Exceso_de_peso",
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
                    dataField: "Porc_descarte",
                    format: function (value) {
                        return value + ' %';
                    }
                    }, {
                        caption: "Desecho",
                        dataField: "Desecho",
                        format: function (value) {
                            return formatNumber.new(value.toFixed(3));
                        },
                        dataType: "number"
                    }, {
                        caption: "Desecho %",
                        dataField: "Porc_desecho",
                        format: function (value) {
                            return value + ' %';
                        }
                    },{
                    caption: "Cantidad envases",
                    dataField: "Cantidad_envases",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(3));
                    },
                    dataType: "number"
                }, {
                    caption: "Peso Neto Total",
                    dataField: "PesoNetoTotal",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(3));
                    },
                    dataType: "number"
                }],
                sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }],
                summary: {
                    groupItems: [
                        {
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
                            column: "Exportable",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(3));
                            },
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            alignByColumn: true
                            , dataType: "number"
                        }, {
                            column: "Exceso_de_Peso",
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
                            column: "Desecho",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(3));
                            },
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            alignByColumn: true
                            , dataType: "number"
                        }, {
                            column: "Cantidad_envases",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(3));
                            },
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            alignByColumn: true
                            , dataType: "number"
                        }, {
                            column: "PesoNetoTotal",
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
                        column: "Merma",
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
                        column: "Exceso_de_Peso",
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
                            column: "Desecho",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(3));
                            },
                            displayFormat: "{0}",
                            dataType: "number"
                        }, {
                        column: "Cantidad_envases",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(3));
                        },
                        displayFormat: "{0}",
                        dataType: "number"
                    }, {
                        column: "PesoNetoTotal",
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
            }).dxDataGrid("instance");

            $("#autoExpand").dxCheckBox({
                value: false,
                text: "Expandir",
                onValueChanged: function (data) {
                    dataGrid.option("grouping.autoExpandAll", data.value);
                }
            });

            $("#filterRow").dxCheckBox({
                text: "Buscar",
                value: false,
                onValueChanged: function (data) {
                    dataGrid.clearFilter();
                    dataGrid.option("filterRow.visible", data.value);
                    // applyFilterModeEditor.option("disabled", !data.value);
                }
            });

            $("#headerFilter").dxCheckBox({
                text: "Filtro",
                value: false,
                onValueChanged: function (data) {
                    dataGrid.clearFilter();
                    dataGrid.option("headerFilter.visible", data.value);
                }
            });

        };

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

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
