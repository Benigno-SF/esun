<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ReporteVentas.aspx.cs" Inherits="SFC_WEB_APP.Mod_Admi.Wfo_ReporteVentas" %>

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
        .dx-freespace-row {
            height: 0px !important;
        }

        #DataGrid {
            width: 100%;
            font-size: 12px;
            height: 70vh
        }

        .long-title h3 {
            font-family: 'Segoe UI Light', 'Helvetica Neue Light', 'Segoe UI', 'Helvetica Neue', 'Trebuchet MS', Verdana;
            font-weight: 200;
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
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
/*ter
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
        background-color: #a6b4ce !important;
        color: white;
        }*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
        <div class="row">
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2" style="" id="">
            <label for="txtFeCont">Reporte Por</label>
            <select id="typerep" name="typerep" class="form-control" >
                <option value="0" selected="selected">Seleccione</option>
                <option value="1">por Campaña</option>
                <option value="2">por Fechas</option>
            </select>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2" style="display: none" id="DivFeIni">
            <label for="txtFeCont">Fecha Inicio</label>
            <input type="text" id="txtFeIni" name="txtFeIni" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
            <script type="text/javascript">
                $(function () {
                    $('#txtFeIni').datetimepicker({
                        format: 'DD/MM/YYYY',
                        locale: 'es'
                    });
                    $(function () {
                        $('#DivFeIni').datetimepicker({
                            format: 'DD/MM/YYYY',
                            locale: 'es'
                        });
                    });
                });
            </script>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2" style="display: none" id="DivFeFin">
            <label for="txtFeCont">Fecha Fin</label>
            <input type="text" id="txtFeFin" name="txtFeFin" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
            <script type="text/javascript">
                $(function () {
                    $('#txtFeFin').datetimepicker({
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
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" style="display: none" id="DivCampana">
            <label for="txtFeCont" class="col-form-label pb-0">Campaña:</label>
            <div id="VCV"></div>
        </div>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2" style="display: none" id="DivBoton">
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
                        <h4 class="card-title">Reporte de Ventas</h4>
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
                            <div id="container-x" class="device-mobile-tablet-container" style="min-height: 30vh">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script type="text/javascript">

        $('#typerep').on('change', function () {
            if (this.value == '1') {
                $('#DivFeIni').hide();
                $('#DivFeFin').hide();
                $('#DivCampana').show();
                $('#DivBoton').show();
                $('#txtFeIni').data("DateTimePicker").clear();
                $('#txtFeFin').data("DateTimePicker").clear();
            } else if (this.value == '2') {
                $('#DivFeIni').show();
                $('#DivFeFin').show();
                $('#DivCampana').hide();
                $('#DivBoton').show();
                $('#txtFeIni').data("DateTimePicker").clear();
                $('#txtFeFin').data("DateTimePicker").clear();
            } else {
                $('#DivFeIni').hide();
                $('#DivFeFin').hide();
                $('#DivCampana').hide();
                $('#DivBoton').hide();
                $('#txtFeIni').data("DateTimePicker").clear();
                $('#txtFeFin').data("DateTimePicker").clear();
            }
        });

        Load_Datos('VCV', '001', '', 'VCV', 'DESCRIPCION', 'IDCAMPANIA', '', 'DNB');

        function Load_Datos(type, emp, suc, idsel, name, id, chang, con_id) {
            var obj = new Object();
            obj.vcType = type;
            obj.vcEmpresa = emp;
            obj.vcSucursal = suc;
            $.ajax({
                type: 'POST',
                url: "../SerAlm.asmx/ListDatNis",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    select(lst, idsel, name, id, chang, con_id);
                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        function select(dat, idsel, name, id, chang, con_id) {

                var searchBox = $("#" + idsel).dxSelectBox({
                    dataSource: dat,
                    displayExpr: name,
                    valueExpr: id,
                    searchEnabled: true,
                    placeholder: "Seleccione",
                    noDataText: "Sin Datos",
                    acceptCustomValue: true
                }).dxSelectBox("instance");

        }


        $(document).on('click', '#btnRec', function () {
            cargatabla();
        });

        function cargatabla() {
            var obj = new Object();
            obj.vcIdEmpresa = '001';

            if ($('#txtFeIni').val() != '') {
                var str1 = $('#txtFeIni').val();
                var res1 = str1.split("/", 3);
                obj.vcFecha = res1[2] + res1[1] + res1[0];
            } else {
                obj.vcFecha = '';
            }
            if ($('#txtFeFin').val() != '') {
                var str2 = $('#txtFeFin').val();;
                var res2 = str2.split("/", 3);
                obj.vcFechaFin = res2[2]+ res2[1]+ res2[0];
            } else {
                obj.vcFechaFin = '';
            }
            if ($("#VCV").dxSelectBox('instance').option('selectedItem') != null) {
                obj.vcCampana = $("#VCV").dxSelectBox('instance').option('selectedItem').IDCAMPANIA;
            } else {
                obj.vcCampana = ''
            }

            $('#btn-pdf').hide();
            $('#tccontainer').hide();

            if (obj.vcIdEmpresa != '0') {
                $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                $.ajax({
                    type: 'POST',
                    url: "../SerAdmi.asmx/RepVentasList",
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
                keyExpr: "IDCOBRARPAGARDOC",
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
                    dataField: "SUCURSAL",
                    caption: "SUCURSAL",
                }, {
                        dataField: "IDDOC_VTA",
                        caption: "IDDOC_VTA",
                }, {
                        dataField: "DOCUMENTO",
                        caption: "DOCUMENTO",
                }, {
                        dataField: "FECHA",
                        caption: "FECHA",
                }, {
                        dataField: "IDCLIEPROV",
                        caption: "IDCLIEPROV",
                }, {
                        dataField: "RAZON_SOCIAL",
                        caption: "RAZON_SOCIAL",
                }, {
                        dataField: "PROYECTO",
                        caption: "PROYECTO",
                }, {
                        dataField: "VENDEDOR",
                        caption: "VENDEDOR",
                }, {
                        dataField: "MONEDA",
                        caption: "MONEDA",
                }, {
                        dataField: "TCMONEDA",
                        caption: "TCMONEDA",
                }, {
                        dataField: "TIPOMOVIMIENTO",
                        caption: "TIPOMOVIMIENTO",
                }, {
                        dataField: "TIPOVENTA",
                        caption: "TIPOVENTA",
                }, {
                        dataField: "CONDICION",
                        caption: "CONDICION",
                    }, {
                        dataField: "IDCAMPANA",
                        caption: "IDCAMPANA",
                    }, {
                        dataField: "DESCCAMPANA",
                        caption: "DESCCAMPANA",
                    }, {
                        dataField: "IDPRODUCTO",
                        caption: "IDPRODUCTO",
                    }, {
                        dataField: "DESCRIPCION",
                        caption: "DESCRIPCION",
                    }, {
                        dataField: "IDMEDIDA",
                        caption: "IDMEDIDA",
                    }, {
                        dataField: "IDGRUPO",
                        caption: "IDGRUPO",
                    }, {
                        dataField: "GRUPO",
                        caption: "GRUPO",
                    }, {
                        dataField: "IDSUBGRUPO",
                        caption: "IDSUBGRUPO",
                    }, {
                        dataField: "SUBGRUPO",
                        caption: "SUBGRUPO",
                    }, {
                        dataField: "MARCA",
                        caption: "MARCA",
                    }, {
                        dataField: "MODELO",
                        caption: "MODELO",
                    }, {
                        dataField: "TCAMBIO",
                        caption: "TCAMBIO",
                    }, {
                        dataField: "CANTIDAD",
                        caption: "CANTIDAD",
                    }, {
                        dataField: "Precio_Uni_Moneda_Of",
                        caption: "Precio Uni Moneda Of",
                    }, {
                        dataField: "Precio_Uni_Moneda_Extranj",
                        caption: "Precio Uni Moneda Extranj",
                    }, {
                        dataField: "VVENTAMOF",
                        caption: "VVENTAMOF",
                    }, {
                        dataField: "VVENTAMEX",
                        caption: "VVENTAMEX",
                    }, {
                        dataField: "IDCOBRARPAGARDOC",
                        caption: "IDCOBRARPAGARDOC",
                    }, {
                        dataField: "PESONETO_PRODUCTO",
                        caption: "PESONETO_PRODUCTO",
                    }, {
                        dataField: "SALDOMOF",
                        caption: "SALDOMOF",
                    }, {
                        dataField: "observaciones_detalle",
                        caption: "observaciones_detalle",
                        width: 350,
                    }, {
                        dataField: "NROEMBARQUE",
                        caption: "NROEMBARQUE",
                    }, {
                        dataField: "NRO_CONTENEDOR",
                        caption: "NRO_CONTENEDOR",
                    }
                ], sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }],
                summary: {
                    totalItems: [{
                        column: "VVENTAMOF",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(0));
                        },
                        displayFormat: "{0}",
                    }, {
                            column: "VVENTAMEX",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(0));
                        },
                        displayFormat: "{0}",
                    }, {
                            column: "PESONETO_PRODUCTO",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(0));
                        },
                        displayFormat: "{0}",
                        }, {
                            column: "Precio_Uni_Moneda_Of",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(0));
                            },
                            displayFormat: "{0}",
                        }, {
                            column: "Precio_Uni_Moneda_Extranj",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(0));
                            },
                            displayFormat: "{0}",
                        }, {
                            column: "SALDOMOF",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(0));
                            },
                            displayFormat: "{0}",
                        }
                        // ...
                    ]
                },

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
                                        dataField: "IDREFERENCIA",
                                        visible: false,
                                    }, {
                                        dataField: "DETALLE",
                                    }, {
                                        dataField: "DOCUMENTO",
                                    }, {
                                        dataField: "FECHA",
                                    }, {
                                        dataField: "IMPORTE",
                                    }, {
                                        dataField: "IMPORTEMEX",
                                    }, {
                                        dataField: "IMPORTEMOF",
                                    }
                                    						
                                ],
                                dataSource: new DevExpress.data.DataSource({
                                    store: new DevExpress.data.ArrayStore({
                                        key: "IDREFERENCIA",
                                        data: datad
                                    }),
                                    filter: ["IDREFERENCIA", "=", options.key]
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
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
