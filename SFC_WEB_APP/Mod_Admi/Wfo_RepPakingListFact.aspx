<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_RepPakingListFact.aspx.cs" Inherits="SFC_WEB_APP.Mod_Admi.Wfo_RepPakingListFact" %>
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


    </style>
    <!-- <script type="text/javascript" src="http://192.168.20.20/ch/js/Chart.min.js"></script>-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">

       <div class="row" style="height: auto">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
            <label for="btnBusc">Facturas Packing List</label>
            <select class="form-control" id="estado" name="estado">
                <option value="0" selected disabled>Seleccione</option>
                <option value="1">todas</option>
                <option value="2">Pendientes Facturar</option>
            </select>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
            <label for="btnBusc">Tipo Rep</label>
            <select class="form-control" id="ttabla" name="ttabla" disabled="disabled">
                <option value="0" selected disabled>Seleccione</option>
                <option value="P">Pivot</option>
                <option value="T" selected="selected">Tabla</option>
            </select>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnRec" class="btn btn-secondary col-12">
                <i class="fas fa-search"></i>Recuperar
            </button>
        </div>
    </div>
    <br />
            <section id="cell-background" style="height: 700px;">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Reporte Paking List - Facturas</h4>
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
            obj.vnFormato = $("#estado").val();
            obj.vcTRep = $("#ttabla option:selected").val();
            $('#btn-pdf').hide();
            $('#tccontainer').hide();

            if (obj.vnFormato != '' && obj.vcTRep != '0') {
                $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                $.ajax({
                    type: 'POST',
                    url: "../SerAdmi.asmx/ListPakingListFac",
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
                            row["documento"] = lst[x].documento;
                            row["idclieprov"] = lst[x].idclieprov;
                            row["razonsocial"] = lst[x].razonsocial;
                            row["fecha"] = DateConvert(lst[x].fecha);
                            row["variedad"] = lst[x].variedad;
                            row["presentacion"] = lst[x].presentacion;
                            row["contenedor"] = lst[x].contenedor;
                            row["referencia"] = lst[x].referencia;
                            row["nro_cajas"] = lst[x].nro_cajas;// 2 decimal
                            row["factura"] = lst[x].factura;
                            if (lst[x].fecha_factura != null) {
                                row["fecha_fac"] = DateConvert(lst[x].fecha_factura);
                            } else {
                                row["fecha_fac"] = '';
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

            //argarfecha(MyDateString, 1);
        });

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
                    fileName: "Reporte Paking List - Facturados"
                },
                printingEnabled: true,
                dataSource: {
                    fields: [
                        {
                            caption: "razonsocial",
                            width: 120,
                            dataField: "razonsocial",
                            area: "row"
                        },
                        {
                            dataField: "referencia",
                            area: "column"
                        },
                        {
                            caption: "fac",
                            dataField: "nro_cajas",
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
                wordWrapEnabled: true,
                showBorders: true,
                export: {
                    enabled: true,
                    fileName: "Reporte Packing List - Facturados"
                },
    
                filterRow: {
                    visible: false,
                    applyFilter: "auto"
                },
                searchPanel: {
                    visible: false,
                    width: 240,
                    placeholder: "Search..."
                },
                headerFilter: {
                    visible: false
                },

                columns: [{
                    caption: "DOC",
                    dataField: "documento",
                   //  groupIndex: 0,
                    width: 150
                }, {
                    caption: "RUC",
                        dataField: "idclieprov",
                    //  groupIndex: 1,
                    width: 150,
                }, {
                        caption: "Razon Social",
                        dataField: "razonsocial",
                    width: 150
                }, {
                        caption: "Fecha",
                        dataField: "fecha",
                        width: 150
                }, {
                        caption: "Variedad",
                        dataField: "variedad",
                    width: 150
                    }, {
                        caption: "Presentacion",
                        dataField: "presentacion",
                        width: 150
                    }, {
                        caption: "Contenedor",
                        dataField: "contenedor",
                        width: 150
                    },{
                        caption: "Referencia",
                        dataField: "referencia",
                        width: 150
                    },{
                        caption: "Nro Cajas",
                        dataField: "nro_cajas",
                        format: function (value) {
                            return formatNumber.new(value.toFixed(2));
                        },
                        width: 150
                    },{
                        caption: "Factura",
                        dataField: "factura",
                    width: 150
                }, {
                        caption: "Fecha Factura",
                        dataField: "fecha_fac",
                    width: 150
                }],
                sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }],
                summary: {
                    groupItems: [{
                        column: "idclieprov",
                        summaryType: "count",
                        displayFormat: "{0} facturas",
                    }
                    ],
                    totalItems: [
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
