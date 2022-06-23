<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ComedorRepo.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_ComedorRepo" %>

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
            font-size: 12px;
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">

    <div class="row">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivFeCont">
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

        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="message-text">Linea:</label>
            <asp:DropDownList ID="ddlTipoEvento" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnBusc" class="btn btn-secondary col-12">
                <i class="fas fa-search"></i>Buscar
            </button>
        </div>
    </div>
    <br />
   
    <!-- Excel - Cell background table -->
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


    <script>

        $("#btnBusc").click(function () {
            cargatabla();
        });


        function cargatabla() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcFecha = $("#txtFeCont").val();
            obj.vnIdTipoEvento = $('#<%=ddlTipoEvento.ClientID%>').val();
            if ($("#txtFeCont").val() != '') {
                var title = 'Reporte Comedor de ' + $("#txtFeCont").val() + ' hasta ' + sumarDias($("#txtFeCont").val(), 6);
            } else {
                var title = 'Reporte Comedor de ' + sumarDias($("#txtFeCont").val(), 0) + ' hasta ' + sumarDias($("#txtFeCont").val(), 6);
            }
            $("#titulo").text(title);
            //  var f = new Date();
            //alert(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());


                $('.dataex-html5-background tbody').html('<tr><td colspan="13" class="text-center bold" style="font-size: 16px"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</td><tr>');

                        $.ajax({
                            type: 'POST',
                            url: "../SerRRHH.asmx/TicketAlimentosList",
                            data: JSON.stringify({ obj: obj }),
                            dataType: 'json',
                            contentType: 'application/json; charset=utf-8',
                            error: function () {
                                $('#activos').hide();
                            },
                            success: function (data) {
                                var lst = JSON.parse(data.d);

                                $('#container-x').html('<div class="options"><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="DataGrid"></div>');
                                TbDataGrid(lst, obj.vcFecha, title);
                            },
                            error: function (data) {
                                alert(JSON.stringify(data));
                            },
                            timeout: 50000
                        });

                }

        function TbDataGrid(data, vfecha, title) {
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
                    fileName: title
                },

                //filterRow: {
                //    visible: true,
                //    applyFilter: "auto"
                //},
                //filterRow: { visible: true },
                //filterPanel: { visible: true },
                //headerFilter: { visible: true },
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
                    { caption: "DNI", dataField: "cNroDocumento" }
                    , { caption: "Fotocheck", dataField: "cCodigoControl" }
                    , { caption: "Nombre", dataField: "cNombres" }
                    , { caption: "Grupo Trabajo", dataField: "cGrupoTrabajo" }
                    , { caption: "Evento", dataField: "nIdTipoEvento" }
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
        $(document).ready(function () {
            cargatabla();
        });
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
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
