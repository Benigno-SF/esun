<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ControlProyectosAnaliticos.aspx.cs" Inherits="SFC_WEB_APP.Mod_Admi.Wfo_ControlProyectosAnaliticos" %>

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
    <script type="text/javascript">
        var theme = '';
        try {
            if (jQuery) {
                $(document).ready(function () {
                    $(".example-description").css('margin-bottom', 15);

                    if (document.getElementById('chartContainer')) {
                        InitResponse();
                        var response = new $.jqx.response();

                        if (response.device.type === "Phone") {
                            var chart = document.getElementById('chartContainer');

                            if (chart) {
                                chart.style.marginLeft = '5%';
                                chart.style.width = '90%';
                            }
                        }
                    }
                });
                theme = getDemoTheme();
                if (window.location.toString().indexOf('file://') >= 0) {
                    var loc = window.location.toString();
                    var addMessage = false;
                    if (loc.indexOf('grid') >= 0 || loc.indexOf('chart') >= 0 || loc.indexOf('tree') >= 0 || loc.indexOf('list') >= 0 || loc.indexOf('combobox') >= 0 || loc.indexOf('php') >= 0 || loc.indexOf('adapter') >= 0 || loc.indexOf('datatable') >= 0 || loc.indexOf('ajax') >= 0) {
                        addMessage = true;
                    }

                    if (addMessage) {
                        $(document).ready(function () {
                            setTimeout(function () {
                                $(document.body).prepend($('<div style="font-size: 12px; font-family: Verdana;">Note: To run a sample that includes data binding, you must open it via "http://..." protocol since Ajax makes http requests.</div><br/>'));
                            }
                                , 50);
                        });
                    }
                }
            }
            else {
                $(document).ready(function () {
                    theme = getDemoTheme();
                });
            }
        }
        catch (error) {
            var er = error;
        }
    </script>
    <style>
        .dx-freespace-row {
            height: 0px !important;
        }
        #DataGrid {
            height: 520px;
            width: 100%;
        }
        .long-title h3 {
            font-family: 'Segoe UI Light', 'Helvetica Neue Light', 'Segoe UI', 'Helvetica Neue', 'Trebuchet MS', Verdana;
            font-weight: 200;
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
        }
        #gridContainer {
            height: 440px;
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
        #DataGrid {
            font-size: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
     <div class="row" style="height: auto">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
			<label for="txtFeCont">Recuperar Hasta</label>
			<input type="text" id="justAnInputBox1" placeholder="Select" autocomplete="off"/>
		</div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="DivFeIni">
            <label for="txtFeCont">Fecha Inicio</label>
            <input type="text" id="txtFeIni" name="txtFeCont" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
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
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="DivFeFin">
            <label for="txtFeCont">Fecha Fin</label>
            <input type="text" id="txtFeFin" name="txtFeCont" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
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
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-1 pb-0 mb-0">
            <label for="btnBusc">Tipo Rep</label>
            <select class="form-control" id="ttabla" name="ttabla">
                <option value="0" selected disabled>Seleccione</option>
                <option value="P">pivot</option>
                <option value="T">Tabla</option>
            </select>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnRec" class="btn btn-secondary col-12">
                <i class="fas fa-search"></i>Buscar
            </button>
        </div>
    </div>
    <br />
            <section id="cell-background" style="height: 700px;">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">reporte de rotacion de productos</h4>
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

        $("#btnRec").click(function () {
            cargatabla();
        });

        function cargatabla() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcFecha = $("#txtFeCont").val();
            obj.vcTRep = $("#ttabla option:selected").val();
            $('#btn-pdf').hide();
            $('#tccontainer').hide();

            if (obj.vcFecha != null && obj.vcFecha != '' && obj.vcTRep != '0') {
                $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                $.ajax({
                    type: 'POST',
                    url: "../SerAdmi.asmx/ListSaldoAlmacen",
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
                            row["CODPRODUCTO"] = lst[x].CODPRODUCTO;
                            row["PRODUCTO"] = lst[x].PRODUCTO;
                            row["ALMACEN"] = lst[x].ALMACEN;
                            row["GRUPO"] = lst[x].GRUPO;
                            row["SUBGRUPO"] = lst[x].SUBGRUPO;
                            row["MEDIDA"] = lst[x].MEDIDA;
                            row["STOCK"] = lst[x].STOCK;
                            row["IMPORTE_SOL"] = lst[x].IMPORTE_SOL;
                            row["IMPORTE_DOL"] = lst[x].IMPORTE_DOL;
                            row["PRECIOUNIT_SOL"] = lst[x].PRECIOUNIT_SOL;
                            row["PRECIOUNIT_DOL"] = lst[x].PRECIOUNIT_DOL;
                            row["ULTFECHACOMPRA"] = DateConvert(lst[x].ULTFECHACOMPRA);

                            if (lst[x].NDIASCOM != null) {
                                row["NDIASCOM"] = lst[x].NDIASCOM;
                            } else {
                                row["NDIASCOM"] = 0;
                            }

                            row["ULTFECHASALIDA"] = DateConvert(lst[x].ULTFECHASALIDA);

                            if (lst[x].NDIASSAL != null) {
                                row["NDIASSAL"] = lst[x].NDIASSAL;
                            } else {
                                row["NDIASSAL"] = 0;
                            }

                            data[x] = row;
                        }

                        if (obj.vcTRep == 'P') {
                            $('#container-x').html('<div id="PivotGrid"></div>');
                            TbPivotGrid(data);
                        } else if (obj.vcTRep == 'T') {
                            var tblgrid = '';
                            $('#container-x').html('<div class="options"><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="DataGrid"></div>');
                            TbDataGrid(data);
                        }
                        cargarfecha(obj.vcFecha, 2);
                    },
                    error: function (data) {
                        alert(JSON.stringify(data));
                    }
                });
            } else {
                ShowToast('error', 'SELECCIONE UNA FECHA Y TIPO REPORTE', '')
            }
        }

        $(document).ready(function () {
            var MyDate = new Date();
            var MyDateString; MyDate.setDate(MyDate.getDate() + 20);
            MyDateString = ('0' + MyDate.getDate()).slice(-2) + '/' + ('0' + (MyDate.getMonth() + 1)).slice(-2) + '/' + MyDate.getFullYear();

            cargarfecha(MyDateString, 1);
        });

        function cargarfecha(date, type) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcFecha = date;
            if (obj.vcIdEmpresa != null && obj.vcIdEmpresa != '' && obj.vcFecha != null && obj.vcFecha != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerAdmi.asmx/ListFechaAct",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    error: function () {
                        $('#activos').hide();
                    },
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst[0].fec_ult_valorizacion != null && lst[0].fec_ult_valorizacion != '') {
                            $('#ufvalorizacion').text(DateConvert(lst[0].fec_ult_valorizacion));
                        }
                        if (lst[0].fec_ult_sincronizacion != null && lst[0].fec_ult_sincronizacion != '') {
                            $('#ufactualizacion').text(DateConvert(lst[0].fec_ult_sincronizacion));
                        }
                        if (lst[0].TipoCambio != null && lst[0].TipoCambio != '') {
                            $('#tcambio').text('$ ' + lst[0].TipoCambio.toFixed(4));
                        }

                        if (type == 1) {
                            $('#tccontainer').hide();
                        } else if (type == 2) {
                            $('#tccontainer').show();
                        } else {
                            $('#tccontainer').hide();
                        }
                    }
                });
            } else {

            }
        };


        function TbPivotGrid(data) {
            DevExpress.localization.locale('es');

            $("#PivotGrid").dxPivotGrid({
                allowSortingBySummary: true,
                allowSorting: true,
                allowFiltering: true,
                //  allowExpandAll: false,
                height: 440,
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
                    fileName: "Reporte Productos"
                },
                printingEnabled: true,
                dataSource: {
                    fields: [
                        {
                            caption: "GRUPO",
                            width: 120,
                            dataField: "GRUPO",
                            area: "row"
                        },
                        {
                            caption: "SUBGRUPO",
                            dataField: "SUBGRUPO",
                            width: 150,
                            area: "row",
                            //selector: function (data) {
                            //    return data.PRODUCTO + " (" + data.GRUPO + ")";
                            //}
                        },
                        {
                            dataField: "ALMACEN",
                            area: "column"
                        },
                        {
                            caption: "Importe Soles",
                            dataField: "IMPORTE_SOL",
                            dataType: "number",
                            summaryType: "sum",
                            format: function (value) {
                                return formatNumber.new(value.toFixed(2));
                            },
                            area: "data"
                        }, {
                            caption: "Importe Dolares",
                            dataField: "IMPORTE_DOL",
                            dataType: "number",
                            summaryType: "sum",
                            format: function (value) {
                                return formatNumber.new(value.toFixed(2));
                            },
                            area: "data"
                        }],
                    store: data
                }
            });

        }

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
                    fileName: "Reporte Productos"
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
                    caption: "ALMACEN",
                    dataField: "ALMACEN",
                    //  groupIndex: 0,
                }, {
                    caption: "GRUPO",
                    dataField: "GRUPO",
                    //  groupIndex: 1,
                }, {
                    caption: "SUBGRUPO",
                    dataField: "SUBGRUPO",
                }, {
                    caption: "CODPRODUCTO",
                    dataField: "CODPRODUCTO",
                }, {
                    caption: "PRODUCTO",
                    dataField: "PRODUCTO",
                }, {
                    caption: "STOCK",
                    dataField: "STOCK",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(6));
                    }
                    , dataType: "number"
                }, {
                    caption: "UM",
                    dataField: "MEDIDA",
                    alignment: "center",
                }, {
                    caption: "IMPORTE_SOL",
                    dataField: "IMPORTE_SOL",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(2));
                    },
                    dataType: "number"
                }, {
                    caption: "IMPORTE_DOL",
                    dataField: "IMPORTE_DOL",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(2));
                    },
                    dataType: "number"
                }, {
                    caption: "PRECIOUNIT_SOL",
                    dataField: "PRECIOUNIT_SOL",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(6));
                    },
                    dataType: "number"
                }, {
                    caption: "PRECIOUNIT_DOL",
                    dataField: "PRECIOUNIT_DOL",
                    format: function (value) {
                        return formatNumber.new(value.toFixed(6));
                    },
                    dataType: "number"
                }, {
                    caption: "UF COMPRA",
                    dataField: "ULTFECHACOMPRA",
                }, {
                    caption: "NDIASCOM",
                    dataField: "NDIASCOM",
                }, {
                    caption: "UF SALIDA",
                    dataField: "ULTFECHASALIDA",
                }, {
                    caption: "NDIASSAL",
                    dataField: "NDIASSAL",
                }],
                sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }],
                summary: {
                    groupItems: [{
                        column: "PRODUCTO",
                        summaryType: "count",
                        displayFormat: "{0} Productos",
                    }, {
                        column: "IMPORTE_SOL",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(2));
                        },
                        displayFormat: "{0}",
                        showInGroupFooter: false,
                        alignByColumn: true
                        , dataType: "number"
                    }, {
                        column: "IMPORTE_DOL",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(2));
                        },
                        displayFormat: "{0}",
                        showInGroupFooter: false,
                        alignByColumn: true
                        , dataType: "number"
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
                        column: "IMPORTE_SOL",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(2));
                        },
                        displayFormat: "{0}",
                        dataType: "number"
                    }, {
                        column: "IMPORTE_DOL",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(2));
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
                text: "Expandir Todos los Grupos",
                onValueChanged: function (data) {
                    dataGrid.option("grouping.autoExpandAll", data.value);
                }
            });

            $("#filterRow").dxCheckBox({
                text: "filtro de Filas",
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
