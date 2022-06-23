<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ReporteRendimiento.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Wfo_ReporteRendimiento" %>

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

    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/print.min.css" />
    <script src="../Content/DevExtreme/print.min.js"></script>
    <!-- END: Vendor CSS-->
    <style>


.dx-freespace-row {  
           height: 0px !important;  
        }  

        #DataGrid {
            height: 70vh;
            width: 100%;
        }
        #PivotGrid {
            height: 70vh;
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
            font-size: 18px;
            font-weight: 500;
        }

        .option {
            margin-top: 0px;
        }

        .dx-datagrid-rowsview .dx-row > .dx-master-detail-cell {
            padding: 15px;
        }
        
        #DataGrid {
            font-size: 8px;
        }


    </style>
    <!-- <script type="text/javascript" src="http://192.168.20.20/ch/js/Chart.min.js"></script>-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">

    <div class="row">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0" id="DivFeCont">
            <label for="txtFeCont">Fecha Inicio</label>
            <input type="text" id="txtFeCont" name="txtFeCont" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
            <script type="text/javascript">
                $(function () {
                    $('#txtFeCont').datetimepicker({
                        format: 'DD/MM/YYYY',
                        locale: 'es'
                    });
                    $(function () {
                        $('#DivFeCont').datetimepicker({
                            format: 'DD/MM/YYYY',
                            locale: 'es'
                        });
                    });
                });
            </script>
        </div>
        <asp:UpdatePanel runat="server" ID="UpdDLL1" style="width: -webkit-fill-available; display: contents">
            <ContentTemplate>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0">
                            <label for="message-text">Area:</label>
                            <asp:DropDownList ID="ddlArea" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlArea_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0">
                            <label for="message-text">Linea:</label>
                            <asp:DropDownList ID="ddlAreaGrupo" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlArea" />
            </Triggers>
        </asp:UpdatePanel>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 pt-0 m-0" style="display: none">
            <label for="message-text">Labor:</label>
            <asp:DropDownList ID="ddlLabor" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
                    <label for="btnBusc">&nbsp;</label>
                    <button type="button" id="btnInicProc" runat="server" class="btn btn-primary col-12 proceso" data-toggle="modal" data-target="#ModProceso">
                        <i class="fa fa-play-circle"></i> Iniciar
                    </button>
                    <button type="button" id="btnFinProc" runat="server" class="btn btn-primary col-12 proceso" data-toggle="modal" data-target="#ModProceso">
                        <i class="fa fa-stop-circle"></i> Terminar
                    </button>
                </div>
                <div class="form-group col-6 col-sm-6 col-md-6 col-lg-2">
                    <label for="btnBusc">&nbsp;</label>
                   <b><p id="txtProc" class="" runat="server"></p></b>
                </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0" style="display: none">
            <label for="message-text">Presentacion:</label>
            <asp:DropDownList ID="ddlEmbalaje" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0" style="display: none">
            <label for="message-text">Supervisor:</label>
            <asp:DropDownList ID="ddlSupervisor" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0" style="display: none">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnBusc2" class="btn btn-secondary col-12">
                <i class="fas fa-search"></i>Buscar
            </button>
        </div>
<%--        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="btnAdd">&nbsp;</label>
            <button type="button" id="btnAdd" class="btn btn-warning col-12" data-toggle="modal" data-target="#modalAdd">
                <i class="fa fa-plus"></i>Castigar Cajas
            </button>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="btnAdd">&nbsp;</label>
            <button type="button" id="btnRep" class="btn btn-primary col-12" data-toggle="modal" data-target="#modalRepo">
                <i class="fas fa-plus"></i>Generar Reporte
            </button>
        </div>--%>
    </div>
    
    
    <br />
        <section id="cell-background" style="height:80vh;">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Reporte Rendimiento</h4>
                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li id="btn-pivot"">pivot? <input type="checkbox" id="pivot" name="pivot" value="1"/></li>
                                <li id="btn-excel2""><button type="button" id="btnBusc" class="btn btn-secondary col-12"><i class="fas fa-search"></i>Buscar </button></li>
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
                            <div id="container-x" class="device-mobile-tablet-container">
                                   
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <div class="modal fade" id="modalAdd" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Agregar Excepciones</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="input-group mb-3">
                        <input type="text" id="CodeUser" name="CodeUser" class="form-control has-icon-left" placeholder="Ingrese su número de  Dni" required="required" onkeypress="validar(event)" />
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" id="btnSearch" type="button">Buscar</button>
                        </div>
                    </div>
                    <div id="labels" class="form-group">
                    </div>
                    <div id="det">
                        <div class="form-group p-0 m-0">
                            <label for="message-text" class="col-form-label">Linea:</label>
                            <asp:DropDownList ID="ddlAreaGrupo_c" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="form-group p-0 m-0" id="DivFechaProc">
                            <label for="txtFecha">Fecha</label>
                            <input type="text" id="txtFechaProc" name="txtFechaProc" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
                            <script type="text/javascript">
                                $(function () {
                                    $('#txtFechaProc').datetimepicker({
                                        format: 'DD/MM/YYYY',
                                        locale: 'es'
                                    });
                                    $(function () {
                                        $('#DivFechaProc').datetimepicker({
                                            format: 'DD/MM/YYYY',
                                            locale: 'es'
                                        });
                                    });
                                });
                            </script>
                        </div>

                        <div class="form-group p-0 m-0">
                            <label for="recipient-name" class="col-form-label">Cajas de Calidad:</label>
                            <input type="number" id="ncajas" class="form-control round" value="" autocomplete="off">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="cNroDocumento" value="">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" id="btnaddCastigo" class="btn btn-success" style="display: none">Aplicar</button>
                </div>
            </div>
        </div>
    </div>
    <script>



        $(document).on('click', '#btnaddCastigo', function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcIdCodigoGeneral = $('#cNroDocumento').val();
            obj.vnIdGrupo = $('#<%=ddlAreaGrupo_c.ClientID%>').val();
            obj.vcFecha = $('#txtFechaProc').val();
            obj.vnCastigo = $('#ncajas').val();
            if (obj.vcNroDocumento != '' && obj.vnIdGrupo != '' && obj.vcFecha != '' && obj.vnCastigo != '') {
                $.ajax({
                    async: false,
                    type: 'POST',
                    url: "../SerProd.asmx/RendimientoCastigo_Regi",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        if (lst != "") {
                            toastr["success"]('Se ha Aplicado ' + lst[0].cajas + ' cajas de castigo a ' + lst[0].Personal + ' del proceso del dia ' + lst[0].Fecha, "Castigo Aplicado");
                            $('#labels').html('');
                        }
                        else {
                            toastr["error"]("No hay proceso del dia " + obj.vcFecha + ", y/o los datos son incorrectos", 'Fecha y/o Datos Incorrectos');
                            $('#txtFechaProc').val('');
                            $('#<%=ddlAreaGrupo_c.ClientID%>').val('');
                            $('#ncajas').val('');
                            $('#labels').html('');
                        }
                    },
                    error: function (error) {
                        console.log(error);
                        alert(JSON.stringify(error))
                    }
                });
            } else {
                toastr['error']('', 'SELECCIONE TODOS LOS CAMPOS');
            }

        });

        $("#btnBusc").click(function () {
            cargatabla();
        });


        function cargatabla() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdArea = $('#<%=ddlArea.ClientID%>').val();
            obj.vcFecha = $("#txtFeCont").val();
            obj.vnIdGrupo = $('#<%=ddlAreaGrupo.ClientID%>').val();
            obj.vcLabor = $('#<%=ddlLabor.ClientID%>').val();
            obj.vnIdEmbalaje = $('#<%=ddlEmbalaje.ClientID%>').val();
            obj.vnIdPersonal = $('#<%=ddlSupervisor.ClientID%>').val();
            //  var f = new Date();
            //alert(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
            if (obj.vcIdEmpresa != '' && obj.vnIdArea != 0) {
                $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                $.ajax({
                    type: 'POST',
                    url: "../SerProd.asmx/RendimientoProcesoRegistroList",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    error: function () {
                        $('#activos').hide();
                    },
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        var data = new Array();
                        for (var x = 0; x < lst.length; x++) {
                            var row = {};
                            row["cDescAGrupo"] = lst[x].cDescAGrupo;
                            row["cIdCodigoGeneral"] = lst[x].cIdCodigoGeneral;
                            row["Nombre"] = lst[x].Nombre;
                            row["clabor"] = lst[x].clabor;
                            row["cDesEmbalaje"] = lst[x].cDesEmbalaje;
                            row["supervisor"] = lst[x].supervisor;
                            row["productor"] = lst[x].productor;
                            row["turno"] = lst[x].turno;
                            row["dia1"] = lst[x].dia1;
                            row["dia2"] = lst[x].dia2;
                            row["dia3"] = lst[x].dia3;
                            row["dia4"] = lst[x].dia4;
                            row["dia5"] = lst[x].dia5;
                            row["dia6"] = lst[x].dia6;
                            row["dia7"] = lst[x].dia7;
                            row["total"] = lst[x].total;
                            data[x] = row;
                        }


                        if ($('#pivot').prop('checked')) {
                            $('#container-x').html('<div id="PivotGrid"></div>');
                            TbPivotGrid(data, obj.vcFecha);
                        } else {
                            var tblgrid = '';
                            $('#container-x').html('<div class="options"><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="DataGrid"></div>');
                            TbDataGrid(data, obj.vcFecha);
                        }
                    },
                    error: function (data) {
                        alert(JSON.stringify(data));
                    },
                    timeout: 50000
                });
            } else {
                toastr.error('error', 'SELECCIONE AREA', '')
            }
        }

        function TbDataGrid(data, vfecha) {
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
                    visible: true,
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
                //wordWrapEnabled: true,
                showBorders: true,
                export: {
                    enabled: true,
                    fileName: "Reporte Rendimiento"
                },

                filterRow: {
                    visible: true,
                    applyFilter: "auto"
                },
                filterRow: { visible: true },
                filterPanel: { visible: true },
                headerFilter: { visible: true },
                //filterValue: [["dia1", "<>", "0"]],
                //filterBuilderPopup: {
                //    position: { of: window, at: "top", my: "top", offset: { y: 10 } },
                //},
                searchPanel: {
                    visible: false,
                    placeholder: "Search..."
                },
                headerFilter: {
                    visible: false
                },
                //  groupIndex: 0,
                columns: [

                    //  { caption: "", dataField: "", width: 150, visible: false }
                    { caption: "Linea", dataField: "cDescAGrupo" }
                    , { caption: "DNI", dataField: "cIdCodigoGeneral" }
                    , { caption: "Nombre", dataField: "Nombre" }
                    , { caption: "Labor", dataField: "clabor" }
                    , { caption: "Presentacion", dataField: "cDesEmbalaje" }
                    , { caption: "Supervisor", dataField: "supervisor" }
                    , { caption: "Productor", dataField: "productor" }
                    , { caption: "Turno", dataField: "turno" }
                    , { caption: sumarDias(vfecha, 0), dataField: "dia1", dataType: "number", }
                    , { caption: sumarDias(vfecha, 1), dataField: "dia2", dataType: "number", visible: true }
                    , { caption: sumarDias(vfecha, 2), dataField: "dia3", dataType: "number", visible: true }
                    , { caption: sumarDias(vfecha, 3), dataField: "dia4", dataType: "number", visible: true }
                    , { caption: sumarDias(vfecha, 4), dataField: "dia5", dataType: "number", visible: true }
                    , { caption: sumarDias(vfecha, 5), dataField: "dia6", dataType: "number", visible: true }
                    , { caption: sumarDias(vfecha, 6), dataField: "dia7", dataType: "number", visible: true }
                    , { caption: "total", dataField: "total" }
                ],
                sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }],
                summary:
                {
                    groupItems: [
                        //    {
                        //    column: "cDescAGrupo",
                        //    summaryType: "count",
                        //      //  displayFormat: "{0} items",
                        //        displayFormat: "",
                        //},
                        {
                            column: "dia1",
                            summaryType: "sum",
                            displayFormat: "{0}",
                            dataType: "number",
                            showInGroupFooter: false,
                            alignByColumn: true
                        }, {
                            column: "dia2",
                            summaryType: "sum",
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            dataType: "number",
                            alignByColumn: true
                        }, {
                            column: "dia3",
                            summaryType: "sum",
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            dataType: "number",
                            alignByColumn: true
                        }, {
                            column: "dia4",
                            summaryType: "sum",
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            dataType: "number",
                            alignByColumn: true
                        }, {
                            column: "dia5",
                            summaryType: "sum",
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            dataType: "number",
                            alignByColumn: true
                        }, {
                            column: "dia6",
                            summaryType: "sum",
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            dataType: "number",
                            alignByColumn: true
                        }, {
                            column: "dia7",
                            summaryType: "sum",
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            dataType: "number",
                            alignByColumn: true
                        }
                        //, {
                        //    column: "TotalAmount",
                        //    summaryType: "sum",
                        //    valueFormat: "currency",
                        //    displayFormat: "Total: {0}",
                        //    showInGroupFooter: true
                        //}
                    ],
                    totalItems: [{
                        column: "dia1",
                        summaryType: "sum",
                        displayFormat: "{0}",
                        dataType: "number",
                    }, {
                        column: "dia2",
                        summaryType: "sum",
                        displayFormat: "{0}",
                        dataType: "number",
                    }, {
                        column: "dia3",
                        summaryType: "sum",
                        displayFormat: "{0}",
                        dataType: "number",
                    }, {
                        column: "dia4",
                        summaryType: "sum",
                        displayFormat: "{0}",
                        dataType: "number",
                    }, {
                        column: "dia5",
                        summaryType: "sum",
                        displayFormat: "{0}",
                        dataType: "number",
                    }, {
                        column: "dia6",
                        summaryType: "sum",
                        displayFormat: "{0}",
                        dataType: "number",
                    }, {
                        column: "dia7",
                        summaryType: "sum",
                        displayFormat: "{0}",
                        dataType: "number",
                    }
                        // ...
                    ]
                }
            }).dxDataGrid("instance");

            $("#autoExpand").dxCheckBox({
                value: false,
                text: "Expandir todos los grupos",
                onValueChanged: function (data) {
                    dataGrid.option("grouping.autoExpandAll", data.value);
                }
            });

            $("#filterRow").dxCheckBox({
                text: "Filtro de filas",
                value: false,
                onValueChanged: function (data) {
                    dataGrid.clearFilter();
                    dataGrid.option("filterRow.visible", data.value);
                    // applyFilterModeEditor.option("disabled", !data.value);
                }
            });

            $("#headerFilter").dxCheckBox({
                text: "Filtro de encabezado",
                value: false,
                onValueChanged: function (data) {
                    dataGrid.clearFilter();
                    dataGrid.option("headerFilter.visible", data.value);
                }
            });

        }

        function TbPivotGrid(data, vfecha) {
            DevExpress.localization.locale('es');

            $("#PivotGrid").dxPivotGrid({
                allowSortingBySummary: true,
                allowSorting: true,
                allowFiltering: true,
                //  allowExpandAll: false,
                //height: 440,
                showBorders: true,
                bindingOptions: {
                    headerFilter: "headerFilter"
                },
                //fieldPanel: {
                //    visible: true
                //},
                fieldChooser: {
                    allowSearch: true,
                    // enabled: true
                },
                export: {
                    enabled: true,
                    fileName: "Reporte Proceso"
                },
                printingEnabled: true,
                dataSource: {
                    fields: [

                            //  { caption: "", dataField: "", width: 150, visible: false }
                        { caption: "Linea", dataField: "cDescAGrupo" }
                        , { caption: "Supervisor", dataField: "supervisor", area: "row", expanded: true, }
                        , { caption: "Productor", dataField: "productor", area: "row", expanded: true, }
                        , { caption: "Presentacion", dataField: "cDesEmbalaje", area: "row", expanded: true,}
                        , { caption: "Labor", dataField: "clabor", area: "row", expanded: true,}
                        , { caption: "DNI", dataField: "cIdCodigoGeneral", area: "row", expanded: true,}
                        , { caption: "Nombre", dataField: "Nombre", area: "row", width: 450, expanded: true,}

                        , { caption: sumarDias(vfecha, 0), dataField: "dia1", dataType: "number", summaryType: "sum", area: "data" }
                        , { caption: sumarDias(vfecha, 1), dataField: "dia2", dataType: "number", summaryType: "sum", area: "data" }
                        , { caption: sumarDias(vfecha, 2), dataField: "dia3", dataType: "number", summaryType: "sum", area: "data" }
                        , { caption: sumarDias(vfecha, 3), dataField: "dia4", dataType: "number", summaryType: "sum", area: "data" }
                        , { caption: sumarDias(vfecha, 4), dataField: "dia5", dataType: "number", summaryType: "sum", area: "data" }
                        , { caption: sumarDias(vfecha, 5), dataField: "dia6", dataType: "number", summaryType: "sum", area: "data" }
                        , { caption: sumarDias(vfecha, 6), dataField: "dia7", dataType: "number", summaryType: "sum", area: "data" }

                    ],
                    store: data
                }
            });

        }

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

        function sumarDias(fecha, dias) {
            if (fecha != '') {
                var dat = fecha.split('/');
                var fech = dat[1] + '/' + dat[0] + '/' + dat[2];
                var fecha = new Date(fech);
            } else {
                var fecha = new Date();
                fecha.setDate(fecha.getDate() - 6);
            }
            fecha.setDate(fecha.getDate() + dias);
            return ('0' + fecha.getDate()).slice(-2) + "/" + ('0' + (fecha.getMonth() + 1)).slice(-2) + "/" + fecha.getFullYear();
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
