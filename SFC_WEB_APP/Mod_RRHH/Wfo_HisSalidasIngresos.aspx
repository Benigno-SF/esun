<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_HisSalidasIngresos.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_HisSalidasIngresos" %>
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
        <script src="../Content/DevExtreme/currency.min.js"></script>
        <script src="../Content/DevExtreme/date.min.js"></script>
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
            width: 100%;
            font-size: 12px;
            max-height: 70vh
        }

        .long-title h3 {
            font-family: 'Segoe UI Light', 'Helvetica Neue Light', 'Segoe UI', 'Helvetica Neue', 'Trebuchet MS', Verdana;
            font-weight: 200;
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
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

        .dx-datagrid-rowsview{
            /*overflow: auto; width: 100%; min-height: 15vh !important;*/
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
      <div class="row" style="height: auto">
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="DivFeIni"  style="display: none">
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
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="DivFeFin" style="display: none">
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
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnRec" class="btn btn-secondary col-12">
                <i class="fas fa-search"></i> Recuperar
            </button>
        </div>
    </div>
    <section id="cell-background" style="width: 100%">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Historico Ingresos y Salidas</h4>
                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li id="btn-excel" style="display: none"><a id='excelExport' title="Exportar en Excel"><i class="fas fa-file-excel"></i></a></li>
                                <li id="btn-pdf" style="display: none"><a id='pdfExport' title="Exportar en Pdf"><i class="fas fa-file-pdf"></i></a></li>
                                <li id="btn-expand" style="display: none"><a id='expandall' title="Expandir Grupos"><i class="fas fa-angle-double-down"></i></a></li>
                                <li id="btn-collapse" style="display: none"><a id='collapseall' title="Collapsar Grupos"><i class="fas fa-angle-double-up"></i></a></li>
                                <li><a data-action="expand" id="xpand1" class="maheight"><i class="ft-maximize"></i></a></li>
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

        $("#btnRec").click(function () {
            cargatabla();
        });

        $("#xpand1").click(function () {
            if ($("#xpand1").attr("maheight") == 'maheight') {
                $('#PivotGrid').css("max-height", "90vh");
                $("#xpand1").removeClass("maheight");
                $("#xpand1").addClass("miheight");
            } else if ($("#xpand1").attr("miheight") == 'maheight') {
                $('#PivotGrid').css("max-height", "60vh");
                $("#xpand1").removeClass("miheight");
                $("#xpand1").addClass("maheight");
            }
        });

        function cargatabla() {
            var obj = new Object();
            obj.vcEmpresa = "001";

            if ($('#txtFeIni').val() != '') {
                var str1 = $('#txtFeIni').val();
                var res1 = str1.split("/", 3);
                obj.vcFecha = res1[2] + '-' + res1[1] + '-' + res1[0];
            } else {
                obj.vcFecha = '';
            }
            if ($('#txtFeFin').val() != '') {
                var str2 = $('#txtFeFin').val();;
                var res2 = str2.split("/", 3);
                obj.vcFechaFin = res2[2] + '-' + res2[1] + '-' + res2[0];
            } else {
                obj.vcFechaFin = '';
            }

            //obj.vcFecha = $("#txtFeIni").val();
            //obj.vcFechaFin = $("#txtFeFin").val();
            if (obj.vcEmpresa != '') {
                $('#container-x').html('<div width="20px" class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                $.ajax({
                    type: 'POST',
                    url: "../SerRRHH.asmx/HistoricoIngresosSalidas",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    error: function () {
                        $('#activos').hide();
                    },
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        $('#container-x').html('<div id="DataGrid"></div>');
                        TbDataGrid(lst)

                    },
                    error: function (data) {
                        alert(JSON.stringify(data));
                    },
                    timeout: 50000
                });
            } else {
                toastr.error('error', 'falta empresa', '')
            }
        }


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
                    fileName: "Reporte "
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
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
