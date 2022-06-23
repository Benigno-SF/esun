<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ReqvsExistencia.aspx.cs" Inherits="SFC_WEB_APP.Mod_Logi.Wfo_ReqvsExistencia" %>

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
    <%--<script src="../Content/DevExtreme/currency.min.js"></script>
    <script src="../Content/DevExtreme/date.min.js"></script>--%>
    <script src="../Content/DevExtreme/jszip.min.js"></script>
    <script src="../Content/DevExtreme/dx.all.js"></script>
    <script src="../Content/DevExtreme/dx.messages.es.js"></script>
    <script src="../Content/DevExtreme/supplemental.js"></script>
    <script src="../Content/DevExtreme/es.js"></script>

    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/print.min.css" />
    <script src="../Content/DevExtreme/print.min.js"></script>
       <style>
            .options {
                padding: 10px;
                margin-top: 0px;
            }

            .caption {
                font-size: 10px;
                font-weight: 500;
            }

            .option {
                margin-top: 0px;
            }

            .dx-datagrid-rowsview .dx-row > .dx-master-detail-cell {
                padding: 12px;
            }

            #DataGrid {
                font-size: 10px;
                font-weight: bold;
                width: 100%;
            }

/*            #gridContainer {
                height: 440px;
            }

            #DataGrid {
                height: 520px;
                width: 100%;
            }*/
            .dx-datagrid-content .dx-datagrid-table .dx-row > td, .dx-datagrid-content .dx-datagrid-table .dx-row > tr > td {
            font-size: 10px;
            }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">

    <div class="row">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="ddlAnio" class="col-form-label">Numero Requerimiento</label>
            <input id="numero" name="numero" class="form-control" />
        </div>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnRec">&nbsp;</label>
            <button type="button" id="btnRec" class="btn btn-secondary col-12">
                <i class="fa fa-search"></i>Recuperar
            </button>
        </div>
    </div>

    <section id="cell-background" style="height: 100%;">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Existencias por Almacen</h4>
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
                            <div id="container-x" class="device-mobile-tablet-container">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script type="text/javascript">

        $(document).on('click', '#btnRec', function () {
            cargatabla();
        });

        function cargatabla() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcNumero = $('#numero').val();
            $('#btn-pdf').hide();
            $('#tccontainer').hide();

            if (obj.vcNumero != '0') {
                $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                $.ajax({
                    type: 'POST',
                    url: "../SerLogi.asmx/ReqvsExistencia",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        $('#container-x').html('<div class="options"><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="DataGrid"></div>');
                        TbDataGrid(lst.dh, lst.dd);
                    },
                    error: function (data) {
                        alert(JSON.stringify(data));
                    }
                });
            } else {
                ShowToast('error', 'INGRESE NUMERO DE REQUERIMIENT0', '')
            }
        }

        function TbDataGrid(datah, datad) {
            DevExpress.localization.locale('es');

            var dataGrid = $("#DataGrid").dxDataGrid({
                dataSource: datah,
                keyExpr: "Id_Articulo",
                showBorders: true,
                scrolling: {
                    mode: "virtual"
                },
                grouping: {
                    autoExpandAll: true
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
                //wordWrapEnabled: true,
                showBorders: true,
                //export: {
                //    enabled: true,
                //    fileName: "Reporte Productos"
                //},

                filterRow: {
                    visible: false,
                    applyFilter: "auto"
                },
                searchPanel: {
                    visible: false,
                    width: 240,
                    placeholder: "Search..."
                },
                columns: [{
                    dataField: "Numero",
                    caption: "Numero",
                }, {
                    dataField: "Id_Articulo",
                        caption: "Id_Articulo",
                        visible: false,
                }, {
                    dataField: "Codigo",
                    caption: "Codigo",
                }, {
                    dataField: "NombreArticulo",
                    caption: "NombreArticulo",
                },{
                    dataField: "Cant Solicitada",
                    caption: "Solicitada",
                }, {
                    dataField: "Cant Pendiente",
                    caption: "Pendiente",
                }, {
                    dataField: "Cant Existencias",
                        caption: "Existente",
                        visible: false,
                }, {
                    dataField: "fecha",
                    caption: "fecha",
                }, {
                    dataField: "Id_PedidoVenta",
                        caption: "Id_PedidoVenta",
                        visible: false,
                }, {
                        dataField: "EstadoPed",
                    caption: "Estado",
                }, {
                    dataField: "UsuarioCreacion",
                    caption: "UsuarioCreacion",
                }, {
                    dataField: "SolicitadoPor",
                    caption: "SolicitadoPor",
                }, {
                    dataField: "NombreAlmacen",
                    caption: "NombreAlmacen",
                }
                ], sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }],

                masterDetail: {
                    enabled: true,
                    template: function (container, options) {
                        var currentData = options.data;
                        $("<div>")
                            .dxDataGrid({
                                columnAutoWidth: true,
                                showBorders: true,
                                scrolling: {
                                    mode: "virtual"
                                },
                                columns: [
                                    {
                                        dataField: "Id_Articulo",
                                        visible: false,
                                    }, {
                                        dataField: "NombreAlmacen",
                                    }, {
                                        dataField: "Articulo",
                                        visible: false,
                                    }, {
                                        dataField: "NombreArticulo",
                                    }, {
                                        dataField: "cantidad",
                                    }],
                                    summary: {
                                    totalItems: [{
                                        column: "cantidad",
                                        summaryType: "sum",
                                        valueFormat: function (value) {
                                            return formatNumber.new(value.toFixed(0));
                                        },
                                        displayFormat: "{0}",
                                    }
                                        // ...
                                    ]
                                },
                                dataSource: new DevExpress.data.DataSource({
                                    store: new DevExpress.data.ArrayStore({
                                        key: "Id_Articulo",
                                        data: datad
                                    }),
                                    filter: ["Id_Articulo", "=", options.key]
                                })
                            }).appendTo(container);
                    }
                }
            }).dxDataGrid("instance");

            $("#autoExpand").dxCheckBox({
                value: false,
                text: "Expandir Todo",
                onValueChanged: function (data) {

                    var dataGrid = $('#DataGrid').dxDataGrid('instance');
                    if (data.value == 1) {
                        dataGrid.expandAll(-1);
                    } else {
                        dataGrid.collapseAll(-1);
                    }
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

        function ShowToast(tipo, titulo, mensaje) {
            toastr.options = {
                tapToDismiss: false
                , timeOut: 5000
                , extendedTimeOut: 0
                , allowHtml: true
                , preventDuplicates: false
                , preventOpenDuplicates: false
                , newestOnTop: true
                , closeButton: true
                //, closeHtml: '<button class="btn-sm" style="background-color: grey; padding: 5px;">X</button>'
            }
            toastr[tipo](mensaje, titulo);
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

        function DateConvert(datestring) {
            if (datestring != null) {
                var fullDate = new Date(parseInt(datestring.substr(6)));

                var twoDigitMonth = (fullDate.getMonth() + 1) + ""; if (twoDigitMonth.length == 1) twoDigitMonth = "0" + twoDigitMonth;
                var twoDigitDate = fullDate.getDate() + ""; if (twoDigitDate.length == 1) twoDigitDate = "0" + twoDigitDate;
                var currentDate = twoDigitDate + "/" + twoDigitMonth + "/" + fullDate.getFullYear();

                var twoDigitHour = fullDate.getHours() + ""; if (twoDigitHour.length == 1) twoDigitHour = "0" + twoDigitHour;
                var twoDigitMinutes = fullDate.getHours() + ""; if (twoDigitMinutes.length == 1) twoDigitMinutes = "0" + twoDigitMinutes;
                var currentHour = twoDigitHour + ':' + twoDigitMinutes;
                if (currentHour != '00:00') {
                    return currentDate + ' ' + currentHour;
                } else {
                    return currentDate;
                }

            } else {
                return '';
            }
        }

        function print() {
            printJS({
                printable: 'sales',
                type: 'html',
                targetStyles: ['*']
            })
        }

        $(document).on('click', '#printButton', function (event) {
            event.preventDefault();
            print();
        });

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
