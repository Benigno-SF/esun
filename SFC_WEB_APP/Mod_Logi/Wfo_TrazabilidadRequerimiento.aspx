<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_TrazabilidadRequerimiento.aspx.cs" Inherits="SFC_WEB_APP.Mod_Logi.Wfo_TrazabilidadRequerimiento" %>

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

        #gridContainer {
            min-height: 70vh;
        }

        #DataGrid {
            height: auto;
            width: 100%;
            color: black;
            font-weight: bold;
            font-size: 12px;
            min-height: 30vh;
            max-height: 70vh;
        }

        #DataGridReq {
            height: auto;
            width: 100%;
            color: black;
            font-weight: bold;
            font-size: 12px;
            min-height: 30vh;
            max-height: 70vh;
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

        .cell-background {
            min-height: 30vh;
        }

        .dx-datagrid-headers .dx-header-row {
            /* color: #fff;*/
        }

        .dx-button-has-icon .dx-button-content {
            padding: 0px !important;
            font-size: 10px !important;
        }

        .dx-button .dx-button-content {
            padding: 1px 3px !important;
            font-size: 10px !important;
        }

        .dx-datagrid-rowsview {
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
        <div class="form-group col-12 col-sm-6 col-md-6 col-lg-1 pl-0 pr-0">
            <div class="form-check">
                <label class="chkTodos" for="">Todos</label>
                <input class="form-control" type="checkbox" id="chkTodos">
            </div>
        </div>
        <div class="form-group col-12 col-sm-6 col-md-6 col-lg-1 pl-0 pr-0" style="display: none">
            <div class="form-check">
                <label class="chkTodos" for="">Por Periodo</label>
                <input class="form-control" type="checkbox" id="chkPeriodo">
            </div>
        </div>
        <div class="form-group col-12 col-sm-6 col-md-6 col-lg-1 pl-0 pr-0">
            <div class="form-check">
                <label class="chkTodos" for="">Por Fecha</label>
                <input class="form-control" type="checkbox" id="chkFecha">
            </div>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="impPeriodo" style="display: none">
            <label for="txtFeCont">Recuperar de</label>
            <input type="text" id="txtFeCont" name="txtFeCont" autocomplete="off" class="form-control" placeholder="YYYYMM">
            <script type="text/javascript">
                $(function () {
                    $('#txtFeCont').datetimepicker({
                        format: 'YYYYMM',
                        locale: 'es'
                    });
                    $(function () {
                        $('#DivFeCont').datetimepicker({
                            format: 'YYYYMM',
                            locale: 'es'
                        });
                    });
                });
            </script>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="divfecini" style="display: none">
            <label for="txtFeCont">Desde</label>
            <input type="text" id="txtFeIni" name="txtFeIni" autocomplete="off" class="form-control" placeholder="DD/MM/YYYY">
            <script type="text/javascript">
                $(function () {
                    $('#txtFeIni').datetimepicker({
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
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="divfecfin" style="display: none">
            <label for="txtFeCont">Hasta</label>
            <input type="text" id="txtFeFin" name="txtFeFin" autocomplete="off" class="form-control" placeholder="DD/MM/YYYY">
            <script type="text/javascript">
                $(function () {
                    $('#txtFeFin').datetimepicker({
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
<%--        <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="txtFeCont" class="col-form-label pb-0">Estado Requerimiento:</label>
            <div id="estadoreq"></div>
        </div>
        <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="txtFeCont" class="col-form-label pb-0">Estado Pedido:</label>
            <div id="estadoped"></div>
        </div>
        <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="txtFeCont" class="col-form-label pb-0">Estado Ordenes:</label>
            <div id="estadoor"></div>
        </div>
        <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="" class="col-form-label pb-0">Area:</label>
            <div id="areas"></div>
        </div>--%>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnRec" class="btn btn-secondary col-12">
                <i class="fas fa-search"></i> Recuperar
            </button>
        </div>

        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" style="display:none">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btntest" class="btn btn-secondary col-12">
                <i class="fas fa-search"></i> Test
            </button>
        </div>
    </div>
    <section id="cell-background" style="<%--height: 700px; "--%>">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title" id="titletraza">Trazabilidad de Requerimientos : Pendientes Cualquier Periodo</h4>
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
                    <div class="pl-4">
                        <div class="dx-button dx-button-danger dx-button-mode-contained dx-widget dx-button-has-text" aria-label="R" tabindex="0" role="button"><div class="dx-button-content"><span class="dx-button-text">R</span></div></div> En Requerimiento | 
                        <div class="dx-button dx-button-default dx-button-mode-contained dx-widget dx-button-has-text" aria-label="P" tabindex="0" role="button"><div class="dx-button-content"><span class="dx-button-text">P</span></div></div> Con Pedido | 
                        <div class="dx-button dx-button-success dx-button-mode-contained dx-widget dx-button-has-text" aria-label="O" tabindex="0" role="button"><div class="dx-button-content"><span class="dx-button-text">O</span></div></div> Con Orden</div>
                    
                        <div class="card-body card-dashboard pt-0">
                            <div id="container-x" class="device-mobile-tablet-container" style="min-height: 30vh">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
        <div class="modal fade  modal-child" id="ModIngreso" data-backdrop-limit="1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <center><h6 class="modal-title" id="titleing"></h6></center>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <span id="observacioning"></span>
                    <div id="container-ing" class="device-mobile-tablet-container">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade  modal-child" id="ModDetalle" data-backdrop-limit="1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <center><h6 class="modal-title" id="titledet"></h6></center>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <span id="observacion"></span>
                    <div id="container-req" class="device-mobile-tablet-container">
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="nIdCajasOE" value="0" />
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade  modal-child" id="ModDetalleoco" data-backdrop-limit="1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="titledetoco"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="container-oco" class="device-mobile-tablet-container">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <script>

        function cargatablacc() {
            var elmnt = $('.dx-scrollable-container');
            elmnt.scrollLeft = 250;
        }


        $(document).on('change', '#chkPeriodo', function () {
            if (this.checked) {
                $('#impPeriodo').show();
                $('#titletraza').html('Trazabilidad de Requerimientos : por Periodo');
                $("#chkFecha").prop("checked", false);
                $('#divfecini').hide();
                $('#divfecfin').hide();
                $('#txtFeIni').data("DateTimePicker").clear();
                $('#txtFeFin').data("DateTimePicker").clear();
                //$("#estadoreq").dxSelectBox({ disabled: false });
                //$("#estadoped").dxSelectBox({ disabled: false });
                //$("#estadoor").dxSelectBox({ disabled: false });
                //$("#areas").dxSelectBox({ disabled: false });
            } else {
                $("#txtFeCont").val('');
                if ($('#chkFecha').prop('checked')) {
                    $('#impPeriodo').hide();
                } else {
                    $('#divfecini').hide();
                    $('#divfecfin').hide();
                    $('#impPeriodo').hide();
                    //$("#estadoreq").dxSelectBox("instance").option('value', 'PE');
                    //$("#estadoped").dxSelectBox("instance").option('value', 'PE');
                    //$("#estadoor").dxSelectBox("instance").option('value', 'PE');
                    //$("#estadoreq").dxSelectBox({ disabled: true });
                    //$("#estadoped").dxSelectBox({ disabled: true });
                    //$("#estadoor").dxSelectBox({ disabled: true });
                    //$("#areas").dxSelectBox({ disabled: true });
                    $('#titletraza').html('Trazabilidad de Requerimientos : Pendientes');
                }
            }
        });

        $(document).on('change', '#chkTodos', function () {
            if (this.checked) {
                $('#titletraza').html('Trazabilidad de Requerimientos : Todos');
                $("#chkFecha").prop("checked", false);
                $('#divfecini').hide();
                $('#divfecfin').hide();
                $('#txtFeIni').data("DateTimePicker").clear();
                $('#txtFeFin').data("DateTimePicker").clear();
                $('#txtFeIni').val('15/02/2021');
                var fecha = new Date(); //Fecha actual
                var mes = fecha.getMonth() + 1; //obteniendo mes
                var dia = fecha.getDate(); //obteniendo dia
                var ano = fecha.getFullYear(); //obteniendo año
                if (dia < 10)
                    dia = '0' + dia; //agrega cero si el menor de 10
                if (mes < 10)
                    mes = '0' + mes //agrega cero si el menor de 10
                var fech = dia + "/" + mes + "/" + ano;
                $('#txtFeFin').val(fech);


                //$("#estadoreq").dxSelectBox({ disabled: false });
                //$("#estadoped").dxSelectBox({ disabled: false });
                //$("#estadoor").dxSelectBox({ disabled: false });
                //$("#areas").dxSelectBox({ disabled: false });
            } else {
                $("#txtFeCont").val('');
                if ($('#chkFecha').prop('checked')) {
                    $('#impPeriodo').hide();
                } else {
                    $('#divfecini').hide();
                    $('#divfecfin').hide();
                    $('#impPeriodo').hide();
                    //$("#estadoreq").dxSelectBox("instance").option('value', 'PE');
                    //$("#estadoped").dxSelectBox("instance").option('value', 'PE');
                    //$("#estadoor").dxSelectBox("instance").option('value', 'PE');
                    //$("#estadoreq").dxSelectBox({ disabled: true });
                    //$("#estadoped").dxSelectBox({ disabled: true });
                    //$("#estadoor").dxSelectBox({ disabled: true });
                    //$("#areas").dxSelectBox({ disabled: true });
                    $('#titletraza').html('Trazabilidad de Requerimientos : Pendientes');
                }
            }
        });


        $(document).on('change', '#chkFecha', function () {
            if (this.checked) {
                $('#divfecini').show();
                $('#divfecfin').show();
                $('#titletraza').html('Trazabilidad de Requerimientos : por Fecha');
                $("#chkPeriodo").prop("checked", false);
                $("#chkTodos").prop("checked", false);
                $('#impPeriodo').hide();
                $('#txtFeCont').data("DateTimePicker").clear();
                $('#txtFeIni').data("DateTimePicker").clear();
                $('#txtFeFin').data("DateTimePicker").clear();
                //$("#estadoreq").dxSelectBox({ disabled: false });
                //$("#estadoped").dxSelectBox({ disabled: false });
                //$("#estadoor").dxSelectBox({ disabled: false });
                //$("#areas").dxSelectBox({ disabled: false });
            } else {
                $("#txtFeIni").val('');
                $("#txtFeFin").val('');
                if ($('#chkPeriodo').prop('checked')) {
                    $('#divfecini').hide();
                    $('#divfecfin').hide();
                } else {
                    $('#divfecini').hide();
                    $('#divfecfin').hide();
                    $('#impPeriodo').hide();
                    //$("#estadoreq").dxSelectBox("instance").option('value', 'PE');
                    //$("#estadoped").dxSelectBox("instance").option('value', 'PE');
                    //$("#estadoor").dxSelectBox("instance").option('value', 'PE');
                    //$("#estadoreq").dxSelectBox({ disabled: true });
                    //$("#estadoped").dxSelectBox({ disabled: true });
                    //$("#estadoor").dxSelectBox({ disabled: true });
                    //$("#areas").dxSelectBox({ disabled: true });
                    $('#titletraza').html('Trazabilidad de Requerimientos : Pendientes');
                }

                //cargatabla();
            }
        });


        $("#btnRec").click(function () {
            cargatabla();
        });

        $("#btntest").click(function () {
            cargafilter();
        });

        //var dreq = new Array();
        //var dped = new Array();
        var doco = new Array();

        function cargatabla() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();

            if ($("#txtFeCont").val() === '' && $("#txtFeIni").val() == '' && $("#txtFeFin").val() == '') {
                obj.vcTipo = 0;
            } else {
                obj.vcTipo = 1;
            }

            obj.vcPeriodo = $("#txtFeCont").val();
            obj.vcFecha = $("#txtFeIni").val();
            obj.vcFechaFin = $("#txtFeFin").val();

            if (obj.vcTipo == 1) {
                if (obj.vcPeriodo === '') {
                    if (obj.vcFecha === '' && obj.vcFechaFin === '') {
                        toastr.error('', 'SELECCIONE EL FECHAS')
                        return;
                    }
                }
                if (obj.vcFecha === '') {
                    if (obj.vcPeriodo === '') {
                        toastr.error('', 'SELECCIONE EL PERIODO')
                        return;
                    }
                }
            }

            $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
            $.ajax({
                type: 'POST',
                url: "../SerLogi.asmx/ListTrazaReqs",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                error: function () {
                    $('#activos').hide();
                },
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    TbDataGrid(lst);
                    //TbDataGrid(lst.dh, lst.dd);
                    //dreq = lst.dd;
                    //dped = lst.d3;
                },
                error: function (data) {
                    alert(JSON.stringify(data));
                    $('#container-x').html('');
                }
            });
            //} else {
            //    ShowToast('error', 'SELECCIONE EL PERIODO', '')
            //}
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

        var headerTemplate = function (header, info) {
            $('<div>').html(info.column.caption).appendTo(header);
            header.parent().css("backgroundColor", "skyblue")
        };


        function TbDataGrid(datah) {
            DevExpress.localization.locale('es');
            $('#container-x').html('<div id="DataGrid"></div>');

            var dataGrid = $("#DataGrid").dxDataGrid({
                dataSource: datah,
                showBorders: true,
                scrolling: {
                    mode: "virtual"
                },
                //grouping: {
                //    autoExpandAll: false
                //},
                //groupPanel: {
                //    visible: true
                //},
                allowColumnReordering: true,
                allowColumnResizing: true,
                columnMinWidth: 20,
                columnAutoWidth: true,
                //columnChooser: {
                //    enabled: true
                //},
                columnFixing: {
                    enabled: true
                },
                //wordWrapEnabled: true,
                showColumnLines: true,
                showRowLines: true,
                rowAlternationEnabled: true,
                showBorders: true,
                export: {
                    enabled: true,
                    fileName: "Reporte Trazabilidad Requerimientos"
                },
                filterRow: {
                    visible: true,
                    applyFilter: "auto"
                },
                headerFilter: {
                    visible: true,
                    applyFilter: "auto"
                },
                searchPanel: {
                    visible: true,
                    //width: 240,
                    placeholder: "Buscar..."
                },
                //focusedRowEnabled: true,
                //focusedRowKey: 117,
                filterPanel: { visible: true },
                columns: [
                    {
                        caption: '#',
                        cellTemplate: function (cellElement, cellInfo) {
                            cellElement.text(cellInfo.row.rowIndex + 1)
                        }
                    },
                    //{
                    //    dataField: "EMPRESA",
                    //    caption: "EMPRESA",
                    //    //headerCellTemplate: function (header, info) {
                    //    //    $('<div>')
                    //    //        .html(info.column.caption)
                    //    //        .css("background", "#66799a")
                    //    //        .appendTo(header);
                    //    //}
                    //    headerCellTemplate: $('<i style="color: black">Mailing Address</i>')
                    //}, 
                    {
                        caption: "Estado",
                        //allowFiltering: false,
                        //allowSorting: false,
                        alignment: "center",
                        cellTemplate: function (container, options) {
                            if (options.data.IDREQINTERNO != '' && options.data.IDPEDIDO == '' && options.data.IDCOMPRA == '') {
                                $("<div />").dxButton({
                                    type: "danger",
                                    text: 'R',
                                }).appendTo(container);
                            }
                            if (options.data.IDREQINTERNO != '' && options.data.IDPEDIDO != '' && options.data.IDCOMPRA == '') {
                                $("<div />").dxButton({
                                    type: "default",
                                    text: 'P',
                                }).appendTo(container);
                            }
                            if (options.data.IDREQINTERNO != '' && options.data.IDPEDIDO != '' && options.data.IDCOMPRA != '') {
                                $("<div />").dxButton({
                                    type: "success",
                                    text: 'O',
                                }).appendTo(container);
                            }
                        }

                    },
                   { dataField: "EMPRESA", caption: "EMPRESA"/*, groupIndex: 0*/ },
                    { dataField: "PERIODO", caption: "PERIODO", visible: false },
                    { dataField: "AREA", caption: "AREA"/*, groupIndex: 1 */ },
                    //------------------------REQUERIMIENTO--------------------------------------------------------------------------//
                    {
                        caption: "REQUERIMIENTOS",
                        headerCellTemplate: function (header, info) {
                            $('<div>')
                                .html(info.column.caption)
                                .css('text-align', 'center')
                                .appendTo(header);
                        },
                        columns: [
                            { dataField: "IDDOCUMENTO", caption: "ID" },
                            //{ dataField: "IDREQINTERNO", caption: "IDREQINTERNO" },
                            , {
                                caption: "DREQ",
                                dataField: "IDREQINTERNO",
                                //cellTemplate: $("#gridPhoto"),
                                cellTemplate: function (container, options) {
                                    if (options.value != '') {
                                        $("<div />").dxButton({
                                            icon: 'plus',
                                            stylingMode: "text",
                                            type: "default",
                                            onClick: function (e) {
                                                TbDetReq(options.value, options.data.EMPRESA, options.data.IDDOCUMENTO, options.data.CODREQ, options.data.RESREQ, options.data.APROBADOR_REQ, options.data.OBSERVACION)
                                            }
                                        }).appendTo(container);
                                    }
                                },
                                //visible: false
                            },
                            {
                                dataField: "CODREQ", caption: "CÓDIGO"
                            },
                          	
                            //{ dataField: "IDAREA", caption: "IDAREA" },
                            // { dataField: "IDALMACEN", caption: "IDALMACEN" },
                            { dataField: "ALMACEN", caption: "ALMACEN" },
                            { dataField: "FECHAREQ", caption: "FECHA"/*, dataType: "date", format: 'dd/MM/yyyy', sortOrder: "desc"*/ },
                            { dataField: "FECHACREACION", caption: "CREACIÓN"/*, dataType: "date", format: 'dd/MM/yyyy', sortOrder: "desc"*/  },
                            //{ dataField: "IDRESPONSABLE", caption: "IDRESPONSABLE" },
                            { dataField: "RESREQ", caption: "RESPONSABLE" },
                            //{ dataField: "IDESTADO", caption: "IDESTADO" },
                            { dataField: "ESTADOREQ", caption: "ESTADO" },
                            { dataField: "APROBADOR_REQ", caption: "APROBADOR" },
                            { dataField: "FECHA_APRUEBA_REQINTERNO", caption: "FECHA APRUEBA REQINTERNO" },
                            { dataField: "OBSERVACION", caption: "OBSERVACION", width: 500 }
                            ]
                    },
                    //------------------------PEDIDO--------------------------------------------------------------------------//
                    {
                        caption: "PEDIDO",
                        headerCellTemplate: function (header, info) {
                            $('<div>')
                                .html(info.column.caption)
                                .css('text-align', 'center')
                                .appendTo(header);
                        },
                        columns: [
                            { dataField: "PEDIDDOCUMENTO", caption: "ID" },
                            //{ dataField: "IDPEDIDO", caption: "ID" },
                            , {
                                caption: "DPED",
                                dataField: "IDPEDIDO",
                                //allowFiltering: false,
                                //allowSorting: false,
                                //cellTemplate: $("#gridPhoto"),
                                cellTemplate: function (container, options) {
                                    if (options.value != '') {
                                        $("<div />").dxButton({
                                            icon: 'plus',
                                            stylingMode: "text",
                                            type: "default",
                                            onClick: function (e) {
                                                TbDet(options.value, options.data.EMPRESA, options.data.PEDIDDOCUMENTO, options.data.CODPED, options.data.APROBADOR_PEDIDO, options.data.APROBADOR_PEDIDO, options.data.GLOSA)
                                            }
                                        }).appendTo(container);
                                    }
                                },
                                //visible: false
                            },
                     		
                    { dataField: "CODPED", caption: "N° PEDIDO" },
                    { dataField: "FECHAPED", caption: "FECHA"/*, dataType: "date", format: 'dd/MM/yyyy', sortOrder: "desc"*/  },
                    { dataField: "PEFECHACREACION", caption: "CREACIÓN"/*, dataType: "date", format: 'dd/MM/yyyy', sortOrder: "desc"*/  },
                    //{ dataField: "PEIDRESPONSABLE", caption: "PEIDRESPONSABLE" },
                    //{ dataField: "PEIDESTADO", caption: "PEIDESTADO" },
                    { dataField: "ESTADOPED", caption: "ESTADO" },
                            { dataField: "ALMACEN", caption: "ALMACEN" },
                            { dataField: "APROBADOR_PEDIDO", caption: "APROBADOR" },
                            { dataField: "FECHA_APRUEBA_PEDIDO", caption: "FECHA APRUEBA PEDIDO" },
                    { dataField: "GLOSA", caption: "GLOSA", width: 500 },
                        ]
                    },
                     //------------------------ORDEN--------------------------------------------------------------------------//
                    {
                        caption: "ORDENES",
                        headerCellTemplate: function (header, info) {
                            $('<div>')
                                .html(info.column.caption)
                                .css('text-align', 'center')
                                .appendTo(header);
                        },
                        columns: [
                            { dataField: "OCIDDOCUMENTO", caption: "ID" },
                            {
                                caption: "DORD",
                                dataField: "IDCOMPRA",
                                //allowFiltering: false,
                                //allowSorting: false,
                                //cellTemplate: $("#gridPhoto"),
                                cellTemplate: function (container, options) {
                                    if (options.value != '') {
                                        $("<div />").dxButton({
                                            icon: 'plus',
                                            stylingMode: "text",
                                            type: "default",
                                            onClick: function (e) {
                                                TbDet(options.value, options.data.EMPRESA, options.data.OCIDDOCUMENTO, options.data.OCCODCOM, options.data.RESOC, options.data.APROBADOR_ORDCOMPRA, options.data.PROVEEDOR)
                                            }
                                        }).appendTo(container);
                                    }
                                },
                                //visible: false
                            },
                        
                            //{ dataField: "IDCOMPRA", caption: "IDCOMPRA" },
                            { dataField: "OCCODCOM", caption: "CÓDIGO" },
                            { dataField: "FECHACOM", caption: "FECHA"/*, dataType: "date", format: 'dd/MM/yyyy', sortOrder: "desc"*/  },
                            { dataField: "OCFECHACREACION", caption: "CREACIÓN"/*, dataType: "date", format: 'dd/MM/yyyy', sortOrder: "desc"*/  },
                            //{ dataField: "OCIDRESPONSABLE", caption: "OCIDRESPONSABLE" },
                            { dataField: "RESOC", caption: "RESPONSABLE" },
                            //{ dataField: "OCIDESTADO	", caption: "OCIDESTADO	" },
                            { dataField: "ESTADOOC", caption: "ESTADO" },
                            { dataField: "APROBADOR_ORDCOMPRA", caption: "APROBADOR" },
                            { dataField: "FECHA_APRUEBA_OC", caption: "FECHA_APRUEBA_OC" },
                            //{ dataField: "IDCLIEPROV", caption: "IDCLIEPROV" },
                            { dataField: "PROVEEDOR", caption: "PROVEEDOR" },
                            {
                                dataField: "COSTO_TOTAL", caption: "COSTO TOTAL",
                                format: function (value) {
                                    return formatNumber.new(value.toFixed(2));
                                }
                                , dataType: "number"
                                , alignment: "right"
                            },
                            {
                                caption: "VER INGRESO",
                                dataField: "IDCOMPRA",
                                //allowFiltering: false,
                                //allowSorting: false,
                                //cellTemplate: $("#gridPhoto"),
                                cellTemplate: function (container, options) {
                                    if (options.data['TIENE_RECEPCION?'] == 'SI') {
                                        if (options.value != '') {
                                            $("<div />").dxButton({
                                                icon: 'download',
                                                stylingMode: "text",
                                                type: "default",
                                                onClick: function (e) {
                                                    TbIngresoDet(options.value, options.data.EMPRESA, options.data.OCIDDOCUMENTO, options.data.OCCODCOM, options.data.RESOC, options.data.APROBADOR_ORDCOMPRA, options.data.PROVEEDOR)
                                                }
                                            }).appendTo(container);
                                        }
                                    }
                                },
                                //visible: false
                            },

                            {

                                dataField: "change",
                                caption: "Change",
                                visible: false
                            }]
                    }
                ],
                //sortByGroupSummaryInfo: [{
                //    summaryItem: "count"
                //}],
                //summary: {
                //    totalItems: [
                //        {
                //            column: "DREQ",
                //            summaryType: "count"
                //        }
                //        // ...
                //    ]
                //},
                //onRowPrepared: function (e) {
                //    if (e.rowType !== "data")
                //        return;
                //    if (e.data.COSTO_TOTAL >= 1) {
                //        e.rowElement.find("td").css('background', 'green');
                //        //e.rowElement.css("background-color", "green");
                //        e.rowElement.css("color", "white");
                //    }
                //    if (e.data.COSTO_TOTAL <= -1) {
                //        e.rowElement.find("td").css('background', 'red');
                //        //e.rowElement.css("background-color", "red");
                //        e.rowElement.css("color", "white");
                //    }
                //},
                //rowPrepared: function (rowElement, rowInfo) {
                //    if (rowInfo.data.Priority == 'H')
                //        rowElement.css('background', 'green');
                //    else if (rowInfo.data.Priority == 'L')
                //        rowElement.css('background', 'yellow');
                //    else if (rowInfo.data.Priority == 'M')
                //        rowElement.css('background', 'red');
                //},
                onCellPrepared: function (e) {
                    //console.log(simpleStringify(e.e.rowType.text));

                    //if (e.rowType === 'header' && e.columnIndex == '4') {
                    //    e.cellElement.css("backgroundColor", "red");
                    //    e.cellElement.css("color", "#fff");
                    //}
                    //if (e.rowType === 'header' && e.columnIndex == '5') {
                    //    e.cellElement.css("backgroundColor", "red");
                    //    e.cellElement.css("color", "#fff");
                    //}
                    //if (e.rowType === 'header' && e.columnIndex == '6') {
                    //    e.cellElement.css("backgroundColor", "red");
                    //    e.cellElement.css("color", "#fff");
                    //}
                    //if (e.rowType === 'header' && e.columnIndex == '7') {
                    //    e.cellElement.css("backgroundColor", "red");
                    //    e.cellElement.css("color", "#fff");
                    //}
                    //if (e.rowType === 'header' && e.columnIndex == '8') {
                    //    e.cellElement.css("backgroundColor", "red");
                    //    e.cellElement.css("color", "#fff");
                    //}
                    //if (e.rowType === 'header' && e.columnIndex == '9') {
                    //    e.cellElement.css("backgroundColor", "red");
                    //    e.cellElement.css("color", "#fff");
                    //}
                    //if (e.rowType === 'header' && e.columnIndex == '10') {
                    //    e.cellElement.css("backgroundColor", "red");
                    //    e.cellElement.css("color", "#fff");
                    //}
                    //if (e.rowType === 'header' && e.columnIndex == '11') {
                    //    e.cellElement.css("backgroundColor", "red");
                    //    e.cellElement.css("color", "#fff");
                    //}
                    //if (e.rowType === 'header' && e.columnIndex == '12') {
                    //    e.cellElement.css("backgroundColor", "red");
                    //    e.cellElement.css("color", "#fff");
                    //}
                    //if (e.rowType === 'header' && e.columnIndex == '13') {
                    //    e.cellElement.css("backgroundColor", "red");
                    //    e.cellElement.css("color", "#fff");
                    //}
                    //if (e.rowType === 'header' && e.columnIndex == '14') {
                    //    e.cellElement.css("backgroundColor", "red");
                    //    e.cellElement.css("color", "#fff");
                    //}
                    //if (e.rowType === 'header' && e.columnIndex == '15') {
                    //    e.cellElement.css("backgroundColor", "red");
                    //    e.cellElement.css("color", "#fff");
                    //}
                    //if (e.rowType === 'header' && e.columnIndex == '16') {
                    //    e.cellElement.css("backgroundColor", "red");
                    //    e.cellElement.css("color", "#fff");
                    //}
                    //if (e.rowType === 'header' && e.columnIndex == '29') {
                    //    e.cellElement.css("backgroundColor", "red");
                    //    e.cellElement.css("color", "#fff");
                    //}

                    //if (e.rowType === 'header' && e.columnIndex >= '16' && e.columnIndex <= '22') {
                    //    e.cellElement.css("backgroundColor", "#52617b");
                    //    e.cellElement.css("color", "#fff");
                    //}

                    if (e.rowType === 'header') {
                        e.cellElement.css("backgroundColor", "#52617b" /*"#2f394a"*/);
                        e.cellElement.css("color", "#fff");
                    }
                },
                //onContentReady: function (e) {
                //    var visibleRowsCount = e.component.totalCount();
                //    var pageSize = e.component.pageSize();
                //    if (visibleRowsCount > pageSize)
                //        visibleRowsCount = pageSize;
                //    var totalCount = e.component.option('dataSource').length;
                //    e.component.option('pager.infoText', 'Displaying ' + visibleRowsCount + ' of ' + totalCount + ' records');
                //}
            }).dxDataGrid("instance");

          

        };

        function cargafilter() {
            alert(simpleStringify($("#DataGrid").dxDataGrid().dxDataGrid('instance').option("headerFilter")));
        }

        function simpleStringify(object) {
            var simpleObject = {};
            for (var prop in object) {
                if (!object.hasOwnProperty(prop)) {
                    continue;
                }
                if (typeof (object[prop]) == 'object') {
                    continue;
                }
                if (typeof (object[prop]) == 'function') {
                    continue;
                }
                simpleObject[prop] = object[prop];
            }
            return JSON.stringify(simpleObject); // returns cleaned up JSON
        };


        function TbDetReq(id, empresa, tipo, numero, responsable, aprobador, observacion) {
            $('#titledet').text('Documento ' + tipo + ' N°: ' + numero);
            $('#responsable').text('Documento: ' + responsable);
            $('#aprobador').text('Aprobador: ' + aprobador);
            $('#observacion').html('<b>Observacion</b>: ' + observacion);
            //let approved = dreq.filter(student => student.IDDOCX == idreq);
            $('#ModDetalle').modal('show');
            $('#container-req').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');

            var obj = new Object();
            obj.vcId = id;
            obj.vcType = tipo;
            obj.vcIdEmpresa = empresa;
            $.ajax({
                type: 'POST',
                url: "../SerLogi.asmx/ListDetaReq",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                  
                    DevExpress.localization.locale('es');
                    $('#container-req').html('<div id="DataGridReq"></div>');
                    $('titledet').html('');


                    var dataGridReq = $("#DataGridReq").dxDataGrid({
                        dataSource: lst,
                        //focusedRowEnabled: true,
                        showBorders: true,
                        scrolling: {
                            mode: "virtual"
                        },
                        export: {
                            enabled: true,
                            fileName: "Reporte Detalle " + empresa + ' ' + tipo + ' ' + id,
                        },
                        columns: [{ dataField: "ITEM", caption: "ITEM", width: 50 },
                        { dataField: "IDPRODUCTO", caption: "IDPRODUCTO", width: 120 },
                        { dataField: "DESCRIPCION", caption: "DESCRIPCION", width: 350 },
                        {
                            dataField: "CANTIDAD_REQUERIDA", caption: "CANTIDAD REQUERIDA", alignment: "right", format: function (value) {
                                return formatNumber.new(value.toFixed(2));
                            }, width: 100
                        },
                        {
                             dataField: "CANTIDAD_PEDIDA", caption: "CANTIDAD PEDIDA", alignment: "right", format: function (value) {
                                return formatNumber.new(value.toFixed(2));
                            }, width: 100
                        }, {
                             dataField: "CANTIDAD_ATENDIDA", caption: "CANTIDAD ATENDIDA", alignment: "right", format: function (value) {
                                return formatNumber.new(value.toFixed(2));
                            }, width: 100
                        },
                        { dataField: "IDMEDIDA", caption: "IDMEDIDA", width: 100 },
                            {
                                dataField: "PARAFECHA", caption: "PARA FECHA", width: 100
                            }], sortByGroupSummaryInfo: [{
                            summaryItem: "count"
                        }],
                        //summary: {
                        //    totalItems: [{
                        //        column: "CANTIDAD",
                        //        summaryType: "sum",
                        //        valueFormat: function (value) {
                        //            return formatNumber.new(value.toFixed(2));
                        //        },
                        //        displayFormat: "{0}",
                        //    }, {
                        //        column: "DESCRIPCION",
                        //        summaryType: "count"
                        //    }
                        //        // ...
                        //    ]
                        //},
                        onCellPrepared: function (e) {
                            if (e.rowType === 'header') {
                                e.cellElement.css("backgroundColor", "#52617b" /*"#2f394a"*/);
                                e.cellElement.css("color", "#fff");
                            }
                        },
                        onContentReady: function (e) {
                            var visibleRowsCount = e.component.totalCount();
                            var pageSize = e.component.pageSize();
                            if (visibleRowsCount > pageSize)
                                visibleRowsCount = pageSize;
                            var totalCount = e.component.option('dataSource').length;
                            e.component.option('pager.infoText', 'Displaying ' + visibleRowsCount + ' of ' + totalCount + ' records');
                        }
                    });

                    

                },
                error: function (error) {
                    alert(JSON.stringify(error));
                }
            });



        };

        function TbDet(id, empresa, tipo, numero, responsable, aprobador, observacion) {
            $('#titledet').text('Documento ' + tipo+' N°: ' + numero);
            $('#responsable').text('Documento: ' + responsable);
            $('#aprobador').text('Aprobador: ' + aprobador);
            $('#observacion').html('<b>Observacion</b>: ' + observacion);
            //let approved = dreq.filter(student => student.IDDOCX == idreq);

            var obj = new Object();
            obj.vcId = id;
            obj.vcType = tipo;
            obj.vcIdEmpresa = empresa;
            $.ajax({
                type: 'POST',
                url: "../SerLogi.asmx/ListDetaReq",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    DevExpress.localization.locale('es');
                    $('#container-req').html('<div id="DataGridReq"></div>');
                    $('titledet').html('');


                    var dataGridReq = $("#DataGridReq").dxDataGrid({
                        dataSource: lst,
                        //focusedRowEnabled: true,
                        showBorders: true,
                        scrolling: {
                            mode: "virtual"
                        },
                        export: {
                            enabled: true,
                            fileName: "Reporte Detalle " + empresa + ' ' + tipo + ' ' + id,
                        },
                        columns: [{ dataField: "ITEM", caption: "ITEM", width: 50 },
                        { dataField: "IDPRODUCTO", caption: "IDPRODUCTO", width: 120 },
                        { dataField: "DESCRIPCION", caption: "DESCRIPCION", width: 350 },
                        {
                            dataField: "CANTIDAD", caption: "CANTIDAD", alignment: "right", Format: function (value) {
                                return formatNumber.new(value.toFixed(2));
                            }, width: 100
                        }
                        ], sortByGroupSummaryInfo: [{
                            summaryItem: "count"
                        }],
                        //summary: {
                        //    totalItems: [{
                        //        column: "CANTIDAD",
                        //        summaryType: "sum",
                        //        valueFormat: function (value) {
                        //            return formatNumber.new(value.toFixed(2));
                        //        },
                        //        displayFormat: "{0}",
                        //    }, {
                        //        column: "DESCRIPCION",
                        //        summaryType: "count"
                        //    }
                        //        // ...
                        //    ]
                        //},
                        onCellPrepared: function (e) {
                            if (e.rowType === 'header') {
                                e.cellElement.css("backgroundColor", "#52617b" /*"#2f394a"*/);
                                e.cellElement.css("color", "#fff");
                            }
                        },
                        onContentReady: function (e) {
                            var visibleRowsCount = e.component.totalCount();
                            var pageSize = e.component.pageSize();
                            if (visibleRowsCount > pageSize)
                                visibleRowsCount = pageSize;
                            var totalCount = e.component.option('dataSource').length;
                            e.component.option('pager.infoText', 'Displaying ' + visibleRowsCount + ' of ' + totalCount + ' records');
                        }
                    });

                    $('#ModDetalle').modal('show');

                },
                error: function (error) {
                    alert(JSON.stringify(error));
                }
            });



        };

        function TbIngresoDet(id, empresa, tipo, numero, responsable, aprobador, observacion) {
            $('#titleing').text('Documento ' + tipo + ' N°: ' + numero);
            $('#responsableing').text('Documento: ' + responsable);
            $('#aprobadoring').text('Aprobador: ' + aprobador);
            $('#observacioning').html('<b>Observacion</b>: ' + observacion);
            //let approved = dreq.filter(student => student.IDDOCX == idreq);

            var obj = new Object();
            obj.vcId = id;
            obj.vcIdEmpresa = empresa;
            $.ajax({
                type: 'POST',
                url: "../SerLogi.asmx/ListDetaIngreso",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    DevExpress.localization.locale('es');
                    $('#container-ing').html('<div id="DataGridIngreso"></div>');
                    $('titleing').html('');


                    var dataGridReq = $("#DataGridIngreso").dxDataGrid({
                        dataSource: lst,
                        //focusedRowEnabled: true,
                        showBorders: true,
                        scrolling: {
                            mode: "virtual"
                        },
                        export: {
                            enabled: true,
                            fileName: "Reporte Detalle " + empresa + ' ' + tipo + ' ' + id,
                        },
                        allowColumnReordering: true,
                        allowColumnResizing: true,
                        columnMinWidth: 50,
                        columnAutoWidth: true,
                        columns: [
                            { dataField: "item", caption: "item" },
                            { dataField: "idproducto", caption: "idproducto"},
                            { dataField: "descripcion", caption: "descripcion"},
                            { dataField: "idmedida", caption: "idmedida"},
                            { dataField: "cantidad", caption: "cantidad"},
                            { dataField: "total", caption: "total"},
                            //{ dataField: "idingresosalidaalm", caption: "idingresosalidaalm"},
                            { dataField: "grecepcion", caption: "grecepcion"},
                            { dataField: "cantidadrecepcion", caption: "cantidadrecepcion"},
                            { dataField: "imprecepcion", caption: "imprecepcion"},
                            //{ dataField: "ventana", caption: "ventana"},
                            { dataField: "fecha", caption: "fecha"},
                            //{ dataField: "idembarque", caption: "idembarque"},
                            //{ dataField: "embarque", caption: "embarque"},
                            //{ dataField: "cantidadembarque", caption: "cantidadembarque"},
                            //{ dataField: "iddevolucion", caption: "iddevolucion"},
                            //{ dataField: "doc_dev", caption: "doc_dev"},
                            //{ dataField: "cantidad_dev", caption: "cantidad_dev"}
                        ], sortByGroupSummaryInfo: [{
                            summaryItem: "count"
                        }],
                        //summary: {
                        //    totalItems: [{
                        //        column: "CANTIDAD",
                        //        summaryType: "sum",
                        //        valueFormat: function (value) {
                        //            return formatNumber.new(value.toFixed(2));
                        //        },
                        //        displayFormat: "{0}",
                        //    }, {
                        //        column: "DESCRIPCION",
                        //        summaryType: "count"
                        //    }
                        //        // ...
                        //    ]
                        //},
                        onCellPrepared: function (e) {
                            if (e.rowType === 'header') {
                                e.cellElement.css("backgroundColor", "#52617b" /*"#2f394a"*/);
                                e.cellElement.css("color", "#fff");
                            }
                        },
                        onContentReady: function (e) {
                            var visibleRowsCount = e.component.totalCount();
                            var pageSize = e.component.pageSize();
                            if (visibleRowsCount > pageSize)
                                visibleRowsCount = pageSize;
                            var totalCount = e.component.option('dataSource').length;
                            e.component.option('pager.infoText', 'Displaying ' + visibleRowsCount + ' of ' + totalCount + ' records');
                        }
                    });

                    $('#ModIngreso').modal('show');

                },
                error: function (error) {
                    alert(JSON.stringify(error));
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

        


    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
