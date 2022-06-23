<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_RepoHorasActividad.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_RepoHorasActividad" %>


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
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-3 pb-0 mb-0" id="">
            <label for="txtFeCont" class="col-form-label pb-0">Planilla:</label>
            <div id="PLA"></div>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="">
            <label for="txtFeCont" class="col-form-label pb-0">SubPlanilla:</label>
            <div id="TPR"></div>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2  pb-0 mb-0" id="DivFeIni">
            <label for="txtFeCont">Fecha Ini</label>
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
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2  pb-0 mb-0" id="DivFeFin">
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
                <div class="form-group col-12 col-sm-6 col-md-6 col-lg-2">
            <div class="form-check">
                <br />
                <label class="chkTodos" for="">Detallado por Fechas</label>
                <input type="checkbox" id="chkDetFechas">
                <label class="chkTodos" for="">Detallado por Conceptos</label>
                <input type="checkbox" id="chkDetConcepto">
            </div>
        </div>
        <div class="form-group col-12 col-sm-6 col-md-6 col-lg-2  pb-0 mb-0">
            <div class="form-check">
                <label class="chkTodos" for="">Por:</label><br />
                <input type="radio" name="bedStatus" id="Consumidor" value="Consumidor" checked="checked" class="rButton" /> Consumidor &nbsp;
                <input type="radio" name="bedStatus" id="Actividad" value="Actividad" class="rButton" /> Actividad
                <input type="hidden" id="tipeConsAct" />
            </div>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-3 pb-0 mb-0" id="impConsumidor" style="display: none">
            <label for="txtFeCont" class="col-form-label pb-0">Consumidor:</label>
            <div id="CCS"></div>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-3 pb-0 mb-0" id="impActividad" style="display: none">
            <label for="txtFeCont" class="col-form-label pb-0">Actividad:</label>
            <div id="ACT"></div>
        </div>

        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2" id="DivBoton">
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
                        <h4 class="card-title">Reporte Resumen Horas Personal</h4>
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

    <script src="../Scripts/FunctionEsun.js"></script>
    <script type="text/javascript">
        $('#impConsumidor').show();
        $('#tipeConsAct').val('C');

        $(document).on('click', '.rButton', function () {
            switch ($(this).val()) {
                case 'Consumidor':
                    $('#impConsumidor').show();
                    $('#impActividad').hide();
                    $('#tipeConsAct').val('C');
                    break;
                case 'Actividad':
                    $('#impConsumidor').hide();
                    $('#impActividad').show();
                    $('#tipeConsAct').val('A');
                    break;
            }
        });

        Load_Datos('PLA', '001', '', 'PLA', 'DESCRIPCION', 'IDPLANILLA');
        Load_Datos('TPR', '001', '', 'TPR', 'DESCRIPCION', 'IDTIPOPERSONAL');
        Load_Datos('CCS', '001', '', 'CCS', 'DESCRIPCION', 'IDCONSUMIDOR');
        Load_Datos('ACT', '001', '', 'ACT', 'DESCRIPCION', 'IDACTIVIDAD');

        function Load_Datos(type, emp, suc, idsel, name, id) {
            var obj = new Object();
            obj.vcType = type;
            obj.vcEmpresa = emp;
            obj.vcSucursal = suc;
            $.ajax({
                type: 'POST',
                url: "../SerAdmi.asmx/DateNisira_list",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    select(lst, idsel, name, id);
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

            if ($("#PLA").dxSelectBox('instance').option('selectedItem') != null) {
                obj.vnIdPlanilla = $("#PLA").dxSelectBox('instance').option('selectedItem').IDPLANILLA;
            } else {
                obj.vnIdPlanilla = ''
            }

            if ($("#TPR").dxSelectBox('instance').option('selectedItem') != null) {
                obj.vcIdTipoPersonal = $("#TPR").dxSelectBox('instance').option('selectedItem').IDTIPOPERSONAL;
            } else {
                obj.vcIdTipoPersonal = 'XX'
            }

            obj.vcFecha = $('#txtFeIni').val();
            obj.vcFechaFin = $('#txtFeFin').val();

            if (document.querySelector('#chkDetFechas:checked')) {
                obj.vcPorFecha = '1';
                obj.vResumen = '0';
            } else {
                obj.vcPorFecha = '0';
                obj.vResumen = '1';
            }

            if (document.querySelector('#chkDetConcepto:checked')) {
                obj.vcPorConcepto = '1';
                obj.vResumen = '0';
            } else {
                obj.vcPorConcepto = '0';
                obj.vResumen = '1';
            }

            obj.vcType = $('#tipeConsAct').val();

            if (obj.vcType == 'C') {
                if ($("#CCS").dxSelectBox('instance').option('selectedItem') != null) {
                    obj.vcCecos = $("#CCS").dxSelectBox('instance').option('selectedItem').IDCONSUMIDOR;
                } else {
                    obj.vcCecos = ''
                }
            } else {
                obj.vcCecos = ''
            }

            if (obj.vcType == 'A') {
                if ($("#ACT").dxSelectBox('instance').option('selectedItem') != null) {
                    obj.vcIdActividad = $("#ACT").dxSelectBox('instance').option('selectedItem').IDACTIVIDAD;
                } else {
                    obj.vcIdActividad = ''
                }
            } else {
                obj.vcIdActividad = ''
            }



            $('#btn-pdf').hide();
            $('#tccontainer').hide();

            if (obj.vcIdEmpresa != '0') {
                $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                $.ajax({
                    type: 'POST',
                    url: "../SerRRHH.asmx/RepoResumenHorasPersonal",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        $('#container-x').html('<div id="PivotGrid"></div>');
                        TbPivotGrid(lst);
                    },
                    error: function (data) {
                        alert(JSON.stringify(data));
                    }
                });
            } else {
                ShowToast('error', 'INGRESE NUMERO DE REQUERIMIENT0', '')
            }
        }

        function TbPivotGrid(data) {
            //DevExpress.Globalize.culture
            DevExpress.localization.locale('es');
            //DevExpress.Globalize.culture().numberFormat.currency.symbol = "S/";
            var PivotChart = $("#PivotChart").dxChart({
                commonSeriesSettings: {
                    type: "bar"
                },
                tooltip: {
                    enabled: true,
                    format: function (value) { return formatNumber.new(value.toFixed(2)); },
                    customizeTooltip: function (args) {
                        return {
                            html: TextHtml(args.seriesName) + "Total: S/ " +
                                args.valueText + " " + args.percentText
                        }
                    }
                },
                size: {
                    height: 200
                },
            }).dxChart("instance");

            function TextHtml(data) {
                var cadena = data.split(/[\.\,\-]/);
                var vhtml = "";
                $.each(cadena, function (index, value) {
                    for (x = 0; x < (index * 2); x++)
                        vhtml += "&nbsp;";
                    vhtml += "- " + value + "<br />";
                });
                return vhtml;
            }
            var PivotGrid = $("#PivotGrid").dxPivotGrid({
                rowHeaderLayout: "tree",
                allowSortingBySummary: true,
                allowSorting: true,
                allowFiltering: true,
                showColumnTotals: false,
                showRowTotals: false,
                //  allowExpandAll: false,
                // height: 440,
                showBorders: true,
                bindingOptions: {
                    headerFilter: "headerFilter"
                },
                //fieldPanel: {
                //    visible: true
                //},
                fieldChooser: {
                    allowSearch: true,
                    enabled: true
                },
                headerFilter: {
                    allowSearch: true,
                    showRelevantValues: true,
                    width: 300,
                    height: 400
                },
                fieldChooser: {
                    allowSearch: true
                },
                fieldPanel: {
                    visible: true
                },
                export: {
                    enabled: true,
                    fileName: "Informe"
                },
                printingEnabled: true,
                dataSource: {
                    store: data,
                    area: "filter",
                }
            }).dxPivotGrid("instance");

            PivotGrid.bindChart(PivotChart, {
                dataFieldsDisplayMode: "splitPanes",
                alternateDataFields: false
            });
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
