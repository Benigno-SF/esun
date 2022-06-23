<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_RepGeneralCalidad.aspx.cs" Inherits="SFC_WEB_APP.Mod_Cali.Wfo_RepGeneralCalidad" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    

    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <!--LIBRERIA DE BOOSTRAP 5 -->
    <%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    <!-- js databales -->
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

    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/print.min.css" />
    <script src="../Content/DevExtreme/print.min.js"></script>

     <script src="../Scripts/sweetalert2.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- fin js databales -->

    <!-- linreria de select 2 -->
    <%--<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>--%>
    <style>
        .dx-freespace-row {
            height: 0px !important;
        }

        .long-title h3 {
            font-family: 'Segoe UI Light', 'Helvetica Neue Light', 'Segoe UI', 'Helvetica Neue', 'Trebuchet MS', Verdana;
            font-weight: 200;
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
        }

        /* css para el scrol bar */
        .dx-scrollable-scroll-content{
            background-color: #2f394a !important;
        }
        

        #gridContainer {
            height: 60vh;
        }

        #DataGrid {
            height: auto;
            width: 100%;
            color: black;
            font-weight: bold;
            font-size: 10px;
            height: 60vh;
        }

        .options {
            padding: 0px;
            margin-top: 0px;
        }

        .caption {
            font-size: 18px;
            font-weight: 500;
        }

        .option {
            margin-top: 0px;
        }

        .dx-datagrid-rowsview .dx-row > .dx-master-detail-cell {
            padding: 15px;
        }

        .table th {
            padding: 0.8rem 0.4rem !important;
            font-size: 10px
        }

        .table td {
            padding: 0.8rem 0.4rem !important;
            font-size: 10px;
            font-weight: 600;
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
<!-- Inicio   del font -->
<div class="shadow p-3 mb-5 bg-body rounded bg-white">
  <div class="card-header border border-3 border-success text-center"> <h5>Reporte General Calidad</h5></div>
  <div class="card-body border border-1">
        <div class="row">
            <div class="col-md-3">  
                <label for="" class="form-label">Sucursal (*)</label>
                <div id="list_sucursal" class="form-control"></div> 
            </div>
             <div class="col-md-5">
                <label for="" class="form-label">Variable (*)</label>
                <div id="list_variable" class="form-control"></div> 
            </div>
            <div class="col-md-4">
                <div class="row">
                    <div class="col-sm-6">
                        <label for="" class="form-label">Desde (*)</label>
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                          </div>
                            <input type="text" name="list_fecha_ini_reg" id="list_fecha_ini" class="form-control"/>
                            <script type="text/javascript">
                                $(function () {
                                    $('#list_fecha_ini').datetimepicker({
                                        format: 'DD/MM/YYYY',
                                        locale: 'es'
                                    });
                                });
                            </script>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <label for="" class="form-label">Hasta (*)</label>
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text" ><i class="fa fa-calendar"></i></span>
                          </div>
                          <input type="text" name="list_fecha_actual_reg" id="list_fecha_actual" class="form-control"/>
                            <script type="text/javascript">
                                $(function () {
                                    $('#list_fecha_actual').datetimepicker({
                                        format: 'DD/MM/YYYY',
                                        locale: 'es'
                                    });
                                });
                            </script>
                        </div>
                    </div>
                </div> 
            </div>
            <div class="col-md-3 mt-2">
                <label for="" class="form-label">Reportar (*)</label>
                <div id="list_reporte" class="form-control"></div> 
            </div>
            <div class="col-md-3 mt-3">
                <button type="button" class="btn btn-info mt-4" onclick="reporte_general_calidad();">Consultar | <i class="fa fa-search"></i></button>
            </div>

            <!--  datagrid mostrar datos-->
           <%-- <div class="col-md-12 mt-3">
                <div class="card">
                    <div class="card-content collapse show">
                        <div class="card-body card-dashboard" id="container-tbdist">
                            <div id="xxx">

                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
            <div class=" col-md-12 mt-3">
                <section id="cell-background" style="/*height: 300px; */">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">       
                                <div class="card-body card-dashboard">
                                    <div id="container-x" class="device-mobile-tablet-container">
                                    </div>
                                </div> 
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        <!-- datagrid mostrar datos -->

        </div>
        
  </div>
</div>
<!-- fin   del font -->
<script>
    window.addEventListener('load', function () {
        // funcion listar sucursal
        listar_sucursal();
        // funcion listar variable
        listar_varaible();
        // asifnar dia inicio
        mostrar_primer_dia_mes();
        // fecha actual
        asignar_dia_actual_mes();
        // funcion listar reporte
        listar_reporte();

    });

    //funcion para listar sucursal
    function listar_sucursal() {
        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SerCali.asmx/SER_listar_sucursal",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);

                var searchBox = $("#list_sucursal").dxSelectBox({
                    dataSource: lst,
                    displayExpr: 'DESCRIPCION',
                    valueExpr: 'IDSUCURSAL',
                    placeholder: "Seleccione",
                    noDataText: "Sin Datos",
                    searchEnabled: true,
                }).dxSelectBox("instance");

            },
            error: function (data) {
                alert(JSON.stringify(data));
            }
        });
    }

    // funcion para listar variable
    function listar_varaible() {
        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SerCali.asmx/SER_listar_variable",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);

                var searchBox = $("#list_variable").dxSelectBox({
                    dataSource: lst,
                    displayExpr: 'descripcion',
                    valueExpr: 'idvariable',
                    placeholder: "Seleccione",
                    noDataText: "Sin Datos",
                    searchEnabled: true,
                }).dxSelectBox("instance");

            },
            error: function (data) {
                alert(JSON.stringify(data));
            }
        });

    }

    // asignar el primer dia del mes
    function mostrar_primer_dia_mes() {
        var date = new Date();
        var pirmer_dia = new Date(date.getFullYear(), date.getMonth(), 1);

        var mes_inicial = pirmer_dia.getMonth() + 1
        var dia_inicial = pirmer_dia.getDate();

        if (dia_inicial < 10) {
            dia_inicial = "0" + dia_inicial;
        } else {
            dia_inicial = dia_inicial;
        }

        if (mes_inicial < 10) {
            mes_inicial = "0" + mes_inicial;
        } else {
            mes_inicial = mes_inicial;
        }

        var anio_inicial = pirmer_dia.getFullYear();

        var fecha_inicial_mes = dia_inicial + "/" + mes_inicial + "/" + anio_inicial;

        $("#list_fecha_ini").val(fecha_inicial_mes);
    }
    //  funcion asignar dia actual del mes actual
    function asignar_dia_actual_mes() {
        var fecha_actual_sistema = new Date();
        var mes = fecha_actual_sistema.getMonth() + 1; //obteniendo mes
        var dia = fecha_actual_sistema.getDate(); //obteniendo dia
        if (dia < 10) {
            dia = "0" + dia;
        } else {
            dia = dia;
        }

        if (mes < 10) {
            mes = "0" + mes;
        } else {
            mes = mes;
        }
        var anio = fecha_actual_sistema.getFullYear(); //obteniendo año
        var fecha_actual = dia + "/" + mes + "/" + anio;

        $("#list_fecha_actual").val(fecha_actual);
    }

    // funcion para listar reporte
    function listar_reporte() {
        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SerCali.asmx/SER_listar_reporte",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);

                var searchBox = $("#list_reporte").dxSelectBox({
                    dataSource: lst,
                    displayExpr: 'reporte',
                    valueExpr: 'idformato',
                    placeholder: "Seleccione",
                    noDataText: "Sin Datos",
                    searchEnabled: true,
                }).dxSelectBox("instance");

            },
            error: function (data) {
                alert(JSON.stringify(data));
            }
        });
    }

    // funcion para mostrar el reporte.
    function reporte_general_calidad() {
        // recepcionamos la variables.
        var sucursal = $("#list_sucursal").dxSelectBox('instance').option('selectedItem').IDSUCURSAL;
        var variable = $("#list_variable").dxSelectBox('instance').option('selectedItem').idvariable;
        var fecha_desde_ini = document.getElementById("list_fecha_ini").value;
        var fecha_hasta_ini = document.getElementById("list_fecha_actual").value;
        var reporte = $("#list_reporte").dxSelectBox('instance').option('selectedItem').idformato;

        // obtenemos las fechas en formsto anio mes dia
        var formato_fecha_desde = fecha_desde_ini.split("/");
        var dia_desde = formato_fecha_desde[0];
        var mes_desde = formato_fecha_desde[1];
        var anio_desde = formato_fecha_desde[2];

        var fecha_desde = anio_desde + mes_desde + dia_desde;

        var formato_fecha_hasta = fecha_hasta_ini.split("/");
        var dia_hasta = formato_fecha_hasta[0];
        var mes_hasta = formato_fecha_hasta[1];
        var anio_hasta = formato_fecha_hasta[2];

        var fecha_hasta = anio_hasta + mes_hasta + dia_hasta;

        $('#container-x').html('<div class="text-center bold"><img src="../img/loading3.gif" width="200px" alt="loading" /><br/>Un momento, por favor...</div>');

        var obj = new Object();
        obj.REPORTE_ID_SUCURSAL = sucursal;
        obj.REPORTE_ID_VARIABLE = variable;
        obj.REPORTE_DESDE = fecha_desde;
        obj.REPORTE_HASTA = fecha_hasta;
        obj.REPORTE_ID_REPORTE = reporte;
        $.ajax({
            type: 'POST',
            url: "../SerCali.asmx/SER_listar_reporte_general",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);
                /* $('#container-x').html('<div id="data_grid"></div>');*/
                $('#container-x').html('<div class=""><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="gridDeleteSelected"></div><div id="DataGrid"></div>');
                TbDataGrid(lst);
            },
            error: function (data) {
                alert(JSON.stringify(data));
            }
        });

        //function TbDataGrid(data) {
        //    DevExpress.localization.locale('es');

        //    var dataGrid = $("#DataGrid").dxDataGrid({
        //        dataSource: data,
        //        scrolling: {
        //            mode: "virtual"
        //        },
        //        grouping: {
        //            autoExpandAll: true
        //        },
        //        selection: {
        //            mode: "single" // or "multiple" | "none"
        //        },
        //        onCellPrepared: function (e) {
        //            if (e.rowType === 'header') {
        //                e.cellElement.css("backgroundColor", "#2f394a" /*"#2f394a"*/);
        //                e.cellElement.css("color", "#fff");
        //            }
        //        },
        //        groupPanel: {
        //            visible: true
        //        },
        //        allowColumnReordering: true,
        //        allowColumnResizing: true,
        //        columnMinWidth: 30,
        //        columnAutoWidth: true,
        //        showBorders: true,
        //        columnChooser: {
        //            enabled: true
        //        },
        //        columnFixing: {
        //            enabled: true
        //        },

        //        showRowLines: true,
        //        /*showColumnLines: true,*/
        //        /*rowAlternationEnabled: true,*/
        //        RowAutoHeight: true,
        //        showBorders: true,
        //        //wordWrapEnabled: true,
        //        showBorders: true,

        //        //editing: {
        //        //    mode: "row",
        //        //    allowDeleting: true,
        //        //    useIcons: true,
        //        //    width: 50
        //        //},

        //        export: {
        //            enabled: true,
        //            fileName: "Reporte General de Calidad"
        //        },

        //        filterRow: {
        //            visible: false,
        //            applyFilter: "auto"
        //        },
        //        searchPanel: {
        //            visible: false,
        //            placeholder: "Buscar..."
        //        },
        //        filterRow: {
        //            visible: true
        //        },
        //        headerFilter: {
        //            visible: true
        //        },
        //        // co,umanque no se mueve.
        //        //editing: {
        //        //    mode: "row",
        //        //    allowDeleting: true,
        //        //    useIcons: true,
        //        //    width: 50
        //        //},

        //    }).dxDataGrid("instance");

           


        //};

        function TbDataGrid(data) {
            DevExpress.localization.locale('es');
            var dataGrid = $("#DataGrid").dxDataGrid({
                dataSource: data,
                scrolling: {
                    mode: 'virtual'
                },
                grouping: {
                    autoExpandAll: false
                },
                selection: {
                    mode: "single" // or "multiple" | "none"
                },
                onCellPrepared: function (e) {
                    if (e.rowType === 'header') {
                        e.cellElement.css("backgroundColor", "#2f394a" /*"#2f394a"*/);
                        e.cellElement.css("color", "#fff");
                    }
                },
                // seleccianr de comunas.
                columnChooser: {
                    enabled: true
                },
                groupPanel: {
                    visible: true
                },
                allowColumnReordering: true,
                allowColumnResizing: true,
                columnMinWidth: 30,
                columnAutoWidth: true,
                showBorders: true,
                columnFixing: {
                    enabled: true
                },
                export: {
                    enabled: true,
                    fileName: "Reporte de Descansos y Licencias"
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
                filterRow: {
                    visible: true
                },
                //  groupIndex: 0,
                sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }],
                onRowRemoving: function (e) {
                    DeleteSeleccion(e.key.nIdPersona, '0');
                },
                onRowRemoved: function (e) {
                }

            }).dxDataGrid("instance");
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
