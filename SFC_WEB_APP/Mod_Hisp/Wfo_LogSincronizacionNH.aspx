<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_LogSincronizacionNH.aspx.cs" Inherits="SFC_WEB_APP.Mod_Hisp.Wfo_LogSincronizacionNH" %>



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
            height: auto;
            width: 100%;
            color: black;
            font-weight: bold;
            font-size: 10px;
            height: 70vh;
        }
    </style>
    <!-- <script type="text/javascript" src="http://192.168.20.20/ch/js/Chart.min.js"></script>-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">

       <div class="row">
            <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
                <label for="btnBusc">&nbsp;</label>
                <button type="button" id="btnBusc" runat="server" class="btn btn-secondary col-12">
                    <i class="fa fa-search"></i>Recuperar
                </button>
            </div>
        </div>
        <section id="cell-background" style="height: 100%">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Informe Log Sync NH</h4>
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
        <script>
            $(document).ready(function () {
                removeTag("footer");
                ObtieneInformacion();
            });
            $("#<%=btnBusc.ClientID%>").click(function () {
                ObtieneInformacion();
            });

            function ObtieneInformacion() {
                $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                var obj = new Object();
                obj.vcIdEmpresa = fuGetCdEmpre();
                var tmp = null;
                $.ajax({
                    type: 'POST',
                    url: "../SerTransf.asmx/ProcesoSincronizacionNHLog",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        lst = JSON.parse(data.d);
                        $('#container-x').html('<div class="options"><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="DataGrid"></div>');
                        var data = new Array();
                        for (var x = 0; x < lst.length; x++) {
                            var row = {};
                            			
                            row["nidproc"] = lst[x].nidproc;
                            row["empresa"] = lst[x].empresa;
                            row["cProceso"] = lst[x].cProceso;
                            row["RESULTADO"] = lst[x].RESULTADO;
                            row["serie"] = lst[x].serie;
                            row["numero"] = lst[x].numero;
                            row["fecha"] = DateConvert(lst[x].fecha);;
                            row["det_resultado"] = lst[x].det_resultado;
                            row["id"] = lst[x]['id'];
                            row["ot"] = lst[x].ot;

                            data[x] = row;
                        }

                            $('#container-x').html('<div class="options"><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="DataGrid"></div>');
                            TbDataGrid(data);
                    }
                });
            }

            function TbDataGrid(data) {
                DevExpress.localization.locale('es');

                var dataGrid = $("#DataGrid").dxDataGrid({
                    dataSource: data,
                    showBorders: true,
                    scrolling: {
                        columnRenderingMode: "virtual"
                    },
                    paging: {
                        enabled: false
                    },
                    grouping: {
                        autoExpandAll: false
                    },
                    groupPanel: {
                        visible: true
                    },
                    allowColumnReordering: true,
                    allowColumnResizing: true,
                    columnMinWidth: 20,
                    columnAutoWidth: false,
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
                        caption: "nidproc",
                        dataField: "nidproc",
                        alignment: "center",
                        //  groupIndex: 0,
                    }, {
                            caption: "empresa",
                            dataField: "empresa",
                        //  groupIndex: 1,
                    }, {
                            caption: "Proceso",
                            dataField: "cProceso",
                            width: 300,
                    }, {
                            caption: "RESULTADO",
                            dataField: "RESULTADO",
                            width: 300,
                    }, {

                            caption: "serie",
                            dataField: "serie",
                            alignment: "center",

                    }, {
                            caption: "numero",
                            dataField: "numero",
                            alignment: "center",

                    }, {
                            caption: "fecha",
                            dataField: "fecha",
                            alignment: "center",

                    }, {
                        caption: "det_resultado",
                        dataField: "det_resultado",
                    }, {
                        caption: "id",
                            dataField: "id",
                            alignment: "center",
                    }, {
                        caption: "ot",
                            dataField: "ot",
                            alignment: "center",
                    }],
                    //sortByGroupSummaryInfo: [{
                    //    summaryItem: "count"
                    //}],
                    //summary: {
                    //    groupItems: [
                    //        {
                    //            column: "Total Horas",
                    //            summaryType: "sum",
                    //            valueFormat: function (value) {
                    //                return formatNumber.new(value.toFixed(3));
                    //            },
                    //            displayFormat: "{0}",
                    //            showInGroupFooter: false,
                    //            alignByColumn: true
                    //            , dataType: "number"
                    //        }
                    //    ],
                    //    totalItems: [{
                    //        column: "Total Horas",
                    //        summaryType: "sum",
                    //        valueFormat: function (value) {
                    //            return formatNumber.new(value.toFixed(3));
                    //        },
                    //        displayFormat: "{0}",
                    //        dataType: "number"
                    //    }
                    //        // ...
                    //    ]
                    //}
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

        </script>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
