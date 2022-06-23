<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_GastosPorCC.aspx.cs" Inherits="SFC_WEB_APP.Mod_Admi.Wfo_GastosPorCC" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.light.css" />
    <script src="../Scripts/moment-with-locales.min.js"></script>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DvPeriDesd">
            <label for="txtFeCont">Desde</label>
            <input type="text" id="txtPeridesd" runat="server" autocomplete="off" class="form-control" placeholder="202001">
            <script type="text/javascript">
                $(function () {
                    $('#<%=txtPeridesd.ClientID %>').datetimepicker({
                        format: 'YYYYMM',
                        locale: 'es'
                    });
                    $(function () {
                        $('#DvPeriDesd').datetimepicker({
                            format: 'YYYYMM',
                            locale: 'es'
                        });
                    });
                });
            </script>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DvPeriHast">
            <label for="txtFeCont">Hasta</label>
            <input type="text" id="txtPeriHast" runat="server" autocomplete="off" class="form-control" placeholder="202002">
            <script type="text/javascript">
                $(function () {
                    $('#<%=txtPeriHast.ClientID %>').datetimepicker({
                        format: 'YYYYMM',
                        locale: 'es'
                    });
                    $(function () {
                        $('#DvPeriHast').datetimepicker({
                            format: 'YYYYMM',
                            locale: 'es'
                        });
                    });
                });
            </script>
        </div>
        <div class="form-group col-12 col-sm-6 col-md-6 col-lg-2">
            <label class="control-label" for="ddlEstructura">Ce. Co.</label>
            <asp:DropDownList ID="ddlEstructura" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-12 col-sm-6 col-md-6 col-lg-3">
            <label class="control-label" for="ddlEstructura">Ce. Co.</label>
            <asp:DropDownList ID="ddlCuenta" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-12 col-sm-6 col-md-6 col-lg-1">
            <div class="form-check">
                <label class="chkApertura" for="ddlEstructura">Apertura</label>
                <input class="form-control" type="checkbox" id="chkApertura">
            </div>
        </div>
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
                        <h4 class="card-title">Informe  de gastos por Centro de Costo</h4>
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
        //
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
            obj.vcPeriodo = $("#<%=txtPeridesd.ClientID%>").val();
            obj.vcPeriodoHasta = $("#<%=txtPeriHast.ClientID%>").val();
            obj.vcAgrupadorCC = $("#<%=ddlEstructura.ClientID%>").val();
            obj.vcAgrupadorCTA = $("#<%=ddlCuenta.ClientID%>").val();
            obj.vbEstado = $('#chkApertura').is(':checked');
            //var tmp = null;
            $.ajax({
                type: 'POST',
                url: "../SerAdmi.asmx/ListGastosxAgrupador",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var tmp = JSON.parse(data.d);
                    $('#container-x').html('<div id="PivotChart"></div><div id="PivotGrid"></div>');
                    TbPivotGrid(tmp);
                }
            });
        }
        //
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
                    fileName: "Informe de Gastos Agrupados"
                },
                printingEnabled: true,
                dataSource: {
                    fields: [
                        { caption: "Descripción", width: 120, dataField: "nombre_cco", visible: true },
                        { caption: "Cuenta", width: 120, dataField: "idcuenta", visible: true },
                        { caption: "Descripción", width: 120, dataField: "nombre_cta", visible: true },
                        { caption: "Periodo", width: 120, dataField: "periodo", visible: true },
                        { caption: "Fecha", width: 120, dataField: "fecha", visible: true },
                        { caption: "Voucher Contable", width: 120, dataField: "Voucher", visible: true },
                        { caption: "Documento Referencia", width: 120, dataField: "DocumentoReferencia", visible: true },
                        { caption: "Glosa", width: 120, dataField: "glosa", visible: true },
                        { caption: "Idcabconta", width: 120, dataField: "idcabconta", visible: true },
                        { caption: "Refe. 1", width: 120, dataField: "REFERENCIA", visible: true },
                        { caption: "Refe. 2", width: 120, dataField: "REFERENCIA2", visible: true },
                        { caption: "Refe. 3", width: 120, dataField: "REFERENCIA3", visible: true },
                        { caption: "Ce.Co. N.1", width: "auto", dataField: "cconivel1", visible: true, area: "column" },
                        { caption: "Ce.Co. N.2", width: "auto", dataField: "cconivel2", visible: true, area: "column" },
                        { caption: "Ce.Co. N.3", width: "auto", dataField: "cconivel3", visible: true, area: "column" },
                        { caption: "Ce.Co. N.4", width: "auto", dataField: "cconivel4", visible: true, area: "column" },
                        { caption: "Ce.Co. N.5", width: "auto", dataField: "cconivel5", visible: true, area: "column" },
                        { caption: "Centro Costo", width: 120, dataField: "idccosto", visible: true, area: "column" },
                        { caption: "Cta. N.1", width: 60, dataField: "ctanivel1", visible: true, area: "row", },
                        { caption: "Cta. N.2", width: 60, dataField: "ctanivel2", visible: true, area: "row", },
                        { caption: "Cta. N.3", width: 60, dataField: "ctanivel3", visible: true, area: "row", },
                        { caption: "Cta. N.4", width: 60, dataField: "ctanivel4", visible: true, area: "row", },
                        { caption: "Cta. N.5", width: 60, dataField: "ctanivel5", visible: true },

                        {
                            caption: "Soles", width: 120, dataField: "total_mof", visible: true, dataType: "number", summaryType: "sum", area: "data",
                            format: function (value) { return formatNumber.new(value.toFixed(2)); },  
                        },
                        {
                            caption: "Dólares", width: 120, dataField: "total_mex", visible: true, dataType: "number", summaryType: "sum",
                            format: function (value) { return formatNumber.new(value.toFixed(2)); },
                        },
                    ],
                    store: data
                }
            }).dxPivotGrid("instance");

            PivotGrid.bindChart(PivotChart, {
                dataFieldsDisplayMode: "splitPanes",
                alternateDataFields: false
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
    </script>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
