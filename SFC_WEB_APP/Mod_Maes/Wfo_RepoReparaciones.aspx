<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_RepoReparaciones.aspx.cs" Inherits="SFC_WEB_APP.Mod_Maes.Wfo_RepoReparaciones" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.common.css" />
    <%--   <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.light.css" />--%>
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.1.3/css/dx.material.orange.light.css" />
   
    <link href="../Content/jquery-ui.css" rel="stylesheet" />
    <script src="../Content/DevExtreme/cldr.min.js"></script>
    <script src="../Content/DevExtreme/event.min.js"></script>
    <script src="../Content/DevExtreme/supplemental.min.js"></script>
    <script src="../Content/DevExtreme/unresolved.min.js"></script>
    <script src="../Content/DevExtreme/globalize.min.js"></script>
    <%--<script src="../Content/DevExtreme/number.min.js"></script>--%>
    <script src="../Content/DevExtreme/message.min.js"></script>
    <%-- <script src="../Content/DevExtreme/currency.min.js"></script>--%>
    <script src="../Content/DevExtreme/date.min.js"></script>
    <script src="../Content/DevExtreme/jszip.min.js"></script>
    <script src="../Content/DevExtreme/dx.all.js"></script>
    <script src="../Content/DevExtreme/dx.messages.es.js"></script>
    <script src="../Content/DevExtreme/supplemental.js"></script>
    <script src="../Content/DevExtreme/es.js"></script>
    <link href="../Content/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/print.min.css" />
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>

    <script src="../Content/DevExtreme/print.min.js"></script>
    <!-- END: Vendor CSS-->
    <style>
        .dx-freespace-row {
            height: 0px !important;
        }

        #DataGrid {
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
            height: 100vh;
        }

        .options {
            padding: 0px;
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
            padding: 15px;
        }

        .dx-datagrid .dx-row > td {
            padding-top: 10px;
            padding-bottom: 10px;
            font-size: 10px;
            line-height: 20px;
        }

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


        /*        .dx-datagrid-drag-action {
            background-color: #667ca5 !important;
            color: white !important;
        }

        .dx-datagrid-headers {
            background-color: #667ca5 !important;
        }*/

        .table th {
            padding: 0.8rem 0.4rem !important;
            font-size: 10px
        }

        .table td {
            padding: 0.8rem 0.4rem !important;
            font-size: 10px;
            font-weight: 600;
        }

        .highcharts-credits {
            display: none !important;
        }

        #tbOperaciones {
            height: auto;
            width: 100%;
            color: black;
            font-weight: bold;
            font-size: 10px !important;
            min-height: 30vh;
            max-height: 70vh;
        }

        .dx-datagrid-headers .dx-datagrid-table .dx-row > td {
            border-bottom: 1px solid #e0e0e0;
            padding-top: 10px;
            padding-bottom: 10px;
            line-height: 16px;
            font-weight: 500;
            font-size: 10px;
        }

        .dx-editor-cell .dx-texteditor .dx-texteditor-input {
            background: rgba(255,255,255,0);
            font-size: 10px;
            height: 48px;
            line-height: 48px;
            padding: 0 10px;
            margin-top: 0;
        }

        #table-sfe{
            height: 300px;
        }

        #table-adl{
            height: 300px;
        }
    </style>
    <!-- <script type="text/javascript" src="http://192.168.20.20/ch/js/Chart.min.js"></script>-->
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

    
            <input type="text" id="txtFeCont" name="txtFeCont" style="cursor:pointer;" autocomplete="off" class="form-control" placeholder="YYYYMM">
            
            
            <script type="text/javascript">
                $(function () {

                    $('#txtFeCont').datetimepicker({
                        format: 'YYYYMM',
                        locale: 'es'
                    });
                
                    $(function () {
                        $('#DivFeCont').datetimepicker({
                            format: 'YYYYMM',
                            locale: moment.locale('es'),
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

        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnRec" class="btn btn-secondary col-12">
                <i class="fas fa-search"></i>Recuperar
            </button>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2" style="display: none">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnReproc" class="btn btn-secondary col-12">
                <i class="fas fa-code"></i>
                Reprocesar
            </button>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2" style="display: none" id="closefact">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="closefacturacion" class="btn btn-secondary col-12">
                <i class="fas fa-code"></i>
                Cerrar Facturacion
            </button>
        </div>
    </div>

    <div id="container" class="dx-viewport">
            <div id="button"></div>
            <div id="popup"></div>
    </div>

    <section id="cell-background" style="width: 100%">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Reporte Reparaciones - FINALIZADOS
                       <a class="heading-elements-toggle"  id="DIVORDREP" style="top: 0px; padding-top: 4px; display: block">
                        </a>

                        </h4>
                    </div>
                    <div class="card-content collapse show" style="overflow: auto">
                        <div class="card-body card-dashboard" style="min-height: 30vh; max-height: 90vh; /*width: 1500px;*/ overflow: auto" id="divdatagrid">
                            <div id="container-x" class="device-mobile-tablet-container" style="min-height: 30vh;/* width: 1600px;overflow: auto;*/">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Reporte Reparaciones - Pendientes
                       <a class="heading-elements-toggle"  id="DIVORDREP2" style="top: 0px; padding-top: 4px; display: block">
                        </a>

                        </h4>
                    </div>
                    <div class="card-content collapse show" style="overflow: auto">
                        <div class="card-body card-dashboard" style="min-height: 30vh; max-height: 90vh; /*width: 1500px;*/ overflow: auto" id="divdatagrid2">
                            <div id="container-xx" class="device-mobile-tablet-container" style="min-height: 30vh;/* width: 1600px;overflow: auto;*/">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">DISTRIBUCIÓN DE HORAS
                        <a class="heading-elements-toggle"  id="DIVDISTSUELD" style="top: 0px; padding-top: 4px; display: block"></a>
                        </h4>
                    </div>
                    <div class="card-content collapse show" style="height:305px;">
                        <div class="card-body card-dashboard">
                            <table id="tbcliente" class="table table-striped dataex-html5-background" width="100%">
                                <thead>
                                    <tr>
                                        <th>Cliente</th>
                                        <th>Horas</th>
                                        <th>Porcentaje Horas</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot id="footer">
                                    <tr>
                                        <td>Total</td>
                                        <td id="tothoras"></td>
                                        <td></td>
                                        <td id="totsueldos"></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    
                </div>
                
                
            </div>
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-header">                     
                        <h4 class="card-title">DISTRIBUCIÓN GRÁFICA DE HORAS POR CLIENTE</h4>
                    </div>
                    <div class="card-content">
                        <div id="piec" style="height:304px"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">DISTRIBUCION DE COSTOS POR CLIENTE
                            <a class="heading-elements-toggle"  id="DIVDISTCLIE" style="top: 0px; padding-top: 4px; display: block">
                        </a>
                        </h4>
                    </div>
                    <div class="card-content collapse show" style="height:376px">
                        <div class="card-body card-dashboard">
                            <table id="tbdistribucioncosto" class="table table-striped dataex-html5-background" width="100%">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>SOCIEDAD AGRICOLA DON LUIS</th>
                                        <th>SUN FRUITS EXPORTS</th>
                                        <th>TOTAL</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td>Total</td>
                                        <td id="ccadl"></td>
                                        <td id="ccsfe"></td>
                                        <td id="cctotal"></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">HISTORICO</h4>
                    </div>
                    <div class="card-body">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="contdist-tab" data-toggle="tab" href="#contdist" role="tab" aria-controls="contdist" aria-selected="true">SUNFRUITS EXPORTS</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">ASOCIACION AGRICOLA DON LUIS</a>


                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="contdist" role="tabpanel" aria-labelledby="contdist-tab">

                                <div id="table-sfe"></div>
                            </div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">

                                <div id="table-adl"></div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">GASTOS GENERALES<a class="heading-elements-toggle"  id="DIVGASTGEN" style="top: 0px; padding-top: 4px; display: block">
                        </a></h4>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body card-dashboard" id="container-tbdist">
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>

    <div class="modal fade" id="ModViewTrab" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Detalle Sueldos de trabajadores</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <table id="tbtrabajadores" class="table table-striped dataex-html5-background" width="100%">
                        <thead>
                            <tr>
                                <th>PERIODO</th>
                                <th>CARGO</th>
                                <th>DNI</th>
                                <th>TRABAJADOR</th>
                                <th>SUELDO</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>Total</td>
                                <td id="totsueldo"></td>
                            </tr>
                        </tfoot>
                    </table>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="Modal_detalle" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-xl">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Distribución de horas</h5>
            
          </div>
          <div class="modal-body table-responsive" id="detalle_distri"></div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" id="btncerrarmodal" data-mdb-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>

    <!-- BEGIN: PageScripts/ Vendor JS -->
    <script src="../Scripts/dt/datatables.min.js"></script>
    <script src="../Scripts/dt/dataTables.buttons.min.js"></script>
    <script src="../Scripts/dt/buttons.bootstrap4.min.js"></script>
    <script src="../Scripts/dt/vfs_fonts.js"></script>
    <script src="../Scripts/dt/buttons.html5.min.js"></script>

    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/no-data-to-display.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>
    <script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>

    <script src="../Content/mindmup-editabletable.js"></script>
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

      <link rel="stylesheet" href="/Content/bootstrap-datetimepicker.css" />
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="../Content/moment.js"></script>
        <script src="../Content/bootstrap-datetimepicker.min.js"></script>
        <script src="../Content/tempusdominus-bootstrap-4.min.js"></script>
        <script src="../Content/ru.js"></script>
        <script src="../Content/es.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.4/i18n/jquery.ui.datepicker-es.min.js"></script>
    <!-- END: Page VScripts/endor JS-->
    <script>

        $("document").ready(function () {
            $.datepicker.regional['es'] = {
                closeText: 'Cerrar',
                prevText: '<Ant',
                nextText: 'Sig>',
                currentText: 'Hoy',
                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
                dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
                dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
                weekHeader: 'Sm',
                dateFormat: 'yymm',
                firstDay: 1,
                isRTL: false,
                showMonthAfterYear: false,
                yearSuffix: ''
            };
            $.datepicker.setDefaults($.datepicker.regional['es']);
        });

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

        $(document).on('click', '.AprBtn', function () {
            var obj = new Object();
            obj.vcAccion = this.id;
            obj.vcPeriodo = $('#txtFeCont').val();
            $.ajax({
                type: 'POST',
                url: "../SerMaes.asmx/AprobReparaciones",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    toastr.success('', lst.d1[0].msg);

                    if (lst.d2[0].VERAPROB == 1) {
                        if (lst.d2[0].aprobado == 0) {
                            $('#DIVORDREP').show();
                            $('#DIVORDREP').html('Aprobar: <button type="button" class="btn btn-success AprBtn" style="right: inherit" id="ORDREP"><i class="fa fa-check"></i></button>');
                        } else {
                            $('#DIVORDREP').show();
                            $('#DIVORDREP').html('Aprobado: ' + lst.d2[0].usuario + ' El ' + lst.d2[0].fechaaprobacion);
                        }
                    } else {
                        $('#DIVORDREP').show();
                        if (lst.d2[0].usuario != '' && lst.d2[0].usuario != null) {
                            $('#DIVORDREP').html('Aprobado: ' + lst.d2[0].usuario + ' El ' + lst.d2[0].fechaaprobacion);
                        } else {
                            $('#DIVORDREP').html('No Aprobado');
                        }
                    }

                    if (lst.d2[1].VERAPROB == 1) {
                        if (lst.d2[1].aprobado == 0) {
                            $('#DIVDISTSUELD').show();
                            $('#DIVDISTSUELD').html('Aprobar: <button type="button" class="btn btn-success AprBtn" style="right: inherit" id="DISTSUELD"><i class="fa fa-check"></i></button>');
                        } else {
                            $('#DIVDISTSUELD').show();
                            $('#DIVDISTSUELD').html('Aprobado: ' + lst.d2[1].usuario + ' El ' + lst.d2[1].fechaaprobacion);
                        }
                    } else {
                        $('#DIVDISTSUELD').show();
                        if (lst.d2[1].usuario != '' && lst.d2[1].usuario != null) {
                            $('#DIVDISTSUELD').html('Aprobado: ' + lst.d2[1].usuario + ' El ' + lst.d2[1].fechaaprobacion);
                        } else {
                            $('#DIVDISTSUELD').html('No Aprobado');
                        }
                    }
                    if (lst.d2[2].VERAPROB == 1) {
                        if (lst.d2[2].aprobado == 0) {
                            $('#DIVDISTCLIE').show();
                            $('#DIVDISTCLIE').html('Aprobar: <button type="button" class="btn btn-success AprBtn" style="right: inherit" id="DISTCLIE"><i class="fa fa-check"></i></button>');
                        } else {
                            $('#DIVDISTCLIE').show();
                            $('#DIVDISTCLIE').html('Aprobado: ' + lst.d2[2].usuario + ' El ' + lst.d2[2].fechaaprobacion);
                        }
                    } else {
                        $('#DIVDISTCLIE').show();
                        if (lst.d2[2].usuario != '' && lst.d2[2].usuario != null) {
                            $('#DIVDISTCLIE').html('Aprobado: ' + lst.d2[2].usuario + ' El ' + lst.d2[2].fechaaprobacion);
                        } else {
                            $('#DIVDISTCLIE').html('No Aprobado');
                        }
                    }
                    if (lst.d2[3].VERAPROB == 1) {
                        if (lst.d2[3].aprobado == 0) {
                            $('#DIVGASTGEN').show();
                            $('#DIVGASTGEN').html('Aprobar: <button type="button" class="btn btn-success AprBtn" style="right: inherit" id="GASTGEN"><i class="fa fa-check"></i></button>');
                        } else {
                            $('#DIVGASTGEN').show();
                            $('#DIVGASTGEN').html('Aprobado: ' + lst.d2[3].usuario + ' El ' + lst.d2[3].fechaaprobacion);
                        }
                    } else {
                        $('#DIVGASTGEN').show();
                        if (lst.d2[3].usuario != '' && lst.d2[3].usuario != null) {
                            $('#DIVGASTGEN').html('Aprobado: ' + lst.d2[3].usuario + ' El ' + lst.d2[3].fechaaprobacion);
                        } else {
                            $('#DIVGASTGEN').html('No Aprobado');
                        }
                    }
                }, error: function (data) {
                    alert(JSON.stringify(data));
                }
            });
        });

        $('#viewsueldos').hide();
        $('#closefact').hide();

        $("#btnRec").click(function () {
            cargatabla(2);
        });

        $("#btnReproc").click(function () {
            cargatabla(1);
        });

        $("#closefacturacion").click(function () {
            cargatabla(3);
        });

        $("#viewsueldosbtn").click(function () {
            $('#ModViewTrab').modal('show');
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

        function cargatabla(accion) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcPeriodo = $('#txtFeCont').val();
            obj.vcFecha = $('#txtFeIni').val();
            obj.vcFechaFin = $('#txtFeFin').val();

            $("#detalle_distri").html('');


            obj.vcAccion = accion;
            //obj.vcFechaFin = $("#txtFeFin").val();
            if (obj.vcIdEmpresa != '') {
                $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                $('#container-xx').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                $('#container-y').hide();
                $('#tbdesc tbody').fadeIn(1000).html('');
                $.ajax({
                    type: 'POST',
                    url: "../SerMaes.asmx/InformeReparaciones_List_ADL",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        //if (lst.d1[0].msg == undefined) {

                        console.log(lst);

                        $('#container-x').html('<div id="PivotGrid"></div>');
                        $('#container-xx').html('<div id="PivotGrid2"></div>');
                        TbPivotGrid('PivotGrid', lst.d1)
                        TbPivotGrid('PivotGrid2', lst.d9)

                        createHighcharts(lst.d4);

                        var totalsueldo = 0;
                        var data2 = new Array();
                        for (var x = 0; x < lst.d2.length; x++) {
                            var row = {};
                            row["PERIODO"] = lst.d2[x].PERIODO;
                            row["CARGO"] = lst.d2[x].CARGO;
                            row["DNI"] = lst.d2[x].DNI;
                            row["TRABAJADOR"] = lst.d2[x].TRABAJADOR;
                            row["SUELDO"] = lst.d2[x].SUELDO;
                            data2[x] = row;

                            totalsueldo = totalsueldo + lst.d2[x].SUELDO;
                        }
                        $("#totsueldo").html(formatNumber.new(totalsueldo.toFixed(2)));

                        if (lst.d2[0].CERRARFACT == 1) {
                            if (lst.d8[0].aprobado == 1 && lst.d8[1].aprobado == 1 && lst.d8[2].aprobado == 1 && lst.d8[3].aprobado == 1) {
                                $('#closefact').show();
                            } else {
                                toastr.error('', 'Falta Aprobaciones para poder cerrar facturacion')
                            }
                        } else {
                            $('#closefact').hide();
                        }

                        if (lst.d2[0].MOSTRARTRAB == 1) {
                            $('#viewsueldos').show();
                        } else {
                            $('#viewsueldos').hide();
                        }

                        var totalrep = 0;
                        for (var x = 0; x < lst.d1.length; x++) {
                            totalrep = totalrep + lst.d1[x].COSTO;
                        }
                        $("#distrep").html(formatNumber.new(totalrep.toFixed(2)));

                        var totalcosto = 0;
                        for (var x = 0; x < lst.d3.length; x++) {
                            totalcosto = totalcosto + lst.d3[x].COSTO;
                        }
                        $("#to").html(formatNumber.new(totalcosto.toFixed(2)));
                        $("#povxperiodo").html(formatNumber.new(totalcosto.toFixed(2)));

                        $("#tor").html(formatNumber.new((totalrep + totalcosto + totalsueldo).toFixed(2)));

                        var sueldos = 0;
                        var horasx = 0;
                        for (var x = 0; x < lst.d4.length; x++) {
                            sueldos = sueldos + lst.d4[x].SUELDOS;
                            horasx = horasx + lst.d4[x].HORAS;
                        }
                        //$("#totsueldos").html(formatNumber.new(sueldos.toFixed(2)));
                        $("#totsueldos").html("<button type='button' class='btn btn-warning btn-sm' id='btnMostrarDetalle' onclick='MostrarDetalleFN()' name='btnMostrarDetalle'>Mostrar Detalle</button>");
                        $("#tothoras").html(formatNumber.new(horasx.toFixed(2)));


                        var ccadl = 0;
                        var ccsfe = 0;
                        var cctotal = 0;
                        for (var x = 0; x < lst.d5.length; x++) {
                            ccadl = ccadl + lst.d5[x].SOCIEDAD_AGRICOLA_DON_LUIS;
                            ccsfe = ccsfe + lst.d5[x].SUNFRUITS_EXPORTS;
                            cctotal = cctotal + lst.d5[x].TOTAL;
                        }
                        $("#ccadl").html(formatNumber.new(ccadl.toFixed(2)));
                        $("#ccsfe").html(formatNumber.new(ccsfe.toFixed(2)));
                        $("#cctotal").html(formatNumber.new(cctotal.toFixed(2)));


                        TbTrabajadores(lst.d2);
                        TbDistribucion(lst.d5);
                        TbCliente(lst.d4);
                        TbHistorico(lst.d6, 'table-sfe');
                        TbHistorico(lst.d7, 'table-adl');
                        $('#container-tbdist').html('<div id="tbOperaciones"></div>');
                        TbDataGrid(lst.d3);

                        $('#dashboard').show();
                        $('#container-y').show();
                        //} else {
                        //    alert(lst.d1[0].msg);
                        //    $('#container-x').html('');
                        //}
                        var a = 0;
                        var b = 0;
                        var c = 0;
                        var d = 0;
                        //REPORTE REPARACIONES - FINALIZADOS
                        if (lst.d8[0].VERAPROB == 1) {
                            if (lst.d8[0].aprobado == 0) {
                                $('#DIVORDREP').show();
                                $('#DIVORDREP').html('1.- Aprobar: <button type="button" class="btn btn-success AprBtn" style="right: inherit" id="ORDREP"><i class="fa fa-check"></i></button>');
                                a = 1;
                            } else {
                                $('#DIVORDREP').show();
                                $('#DIVORDREP').html('Aprobado: ' + lst.d8[0].usuario + ' El ' + lst.d8[0].fechaaprobacion);
                            }
                        } else {
                            $('#DIVORDREP').show();
                            if (lst.d8[0].usuario != '' && lst.d8[0].usuario != null) {
                                $('#DIVORDREP').html('Aprobado: ' + lst.d8[0].usuario + ' El ' + lst.d8[0].fechaaprobacion);
                            } else {
                                $('#DIVORDREP').html('No Aprobado');
                            }
                        }

                        //DISTRIBUCIÓN DE HORAS
                        if (lst.d8[1].VERAPROB == 1) {
                            if (lst.d8[1].aprobado == 0) {
                                $('#DIVDISTSUELD').show();
                                //Aqui tenia en su atributo class AprBtn
                                $('#DIVDISTSUELD').html('2.- Distribuir Tarifa: <button type="button" class="btn btn-success" onclick="DistribuirTar()" style="right: inherit" id="DISTSUELD"><i class="fa fa-check"></i></button>');
                                b = 1;
                            } else {
                                $('#DIVDISTSUELD').show();
                                $('#DIVDISTSUELD').html('Aprobado: ' + lst.d8[1].usuario + ' El ' + lst.d8[1].fechaaprobacion);
                            }
                        } else {
                            $('#DIVDISTSUELD').show();
                            if (lst.d8[1].usuario != '' && lst.d8[1].usuario != null) {
                                $('#DIVDISTSUELD').html('Aprobado: ' + lst.d8[1].usuario + ' El ' + lst.d8[1].fechaaprobacion);
                            } else {
                                $('#DIVDISTSUELD').html('No Aprobado');
                            }
                        }
                        //DISTRIBUCION DE COSTOS POR CLIENTE
                        if (lst.d8[2].VERAPROB == 1) {
                            if (lst.d8[2].aprobado == 0) {
                                $('#DIVDISTCLIE').show();
                                $('#DIVDISTCLIE').html('4.- Aprobar: <button type="button" class="btn btn-success AprBtn" style="right: inherit" id="DISTCLIE"><i class="fa fa-check"></i></button>');
                                d = 1;
                            } else {
                                $('#DIVDISTCLIE').show();
                                $('#DIVDISTCLIE').html('Aprobado: ' + lst.d8[2].usuario + ' El ' + lst.d8[2].fechaaprobacion);
                            }
                        } else {
                            $('#DIVDISTCLIE').show();
                            if (lst.d8[2].usuario != '' && lst.d8[2].usuario != null) {
                                $('#DIVDISTCLIE').html('Aprobado: ' + lst.d8[2].usuario + ' El ' + lst.d8[2].fechaaprobacion);
                            } else {
                                $('#DIVDISTCLIE').html('No Aprobado');
                            }
                        }
                        //GASTOS GENERALES
                        if (lst.d8[3].VERAPROB == 1) {
                            if (lst.d8[3].aprobado == 0) {
                                $('#DIVGASTGEN').show();
                                $('#DIVGASTGEN').html('3.- Aprobar: <button type="button" class="btn btn-success AprBtn" style="right: inherit" id="GASTGEN"><i class="fa fa-check"></i></button>');
                                c = 1;
                            } else {
                                $('#DIVGASTGEN').show();
                                $('#DIVGASTGEN').html('Aprobado: ' + lst.d8[3].usuario + ' El ' + lst.d8[3].fechaaprobacion);
                            }
                        } else {
                            $('#DIVGASTGEN').show();
                            if (lst.d8[3].usuario != '' && lst.d8[3].usuario != null) {
                                $('#DIVGASTGEN').html('Aprobado: ' + lst.d8[3].usuario + ' El ' + lst.d8[3].fechaaprobacion);
                            } else {
                                $('#DIVGASTGEN').html('No Aprobado');
                            }
                        }

                        //a = 1 -- REPORTE REPARACIONES - FINALIZADOS
                        //a = 2 -- DISTRIBUCIÓN DE HORAS
                        //a = 3 -- GASTOS GENERALES
                        //a = 4 -- DISTRIBUCION DE COSTOS POR CLIENTE

                        if (parseInt(a) == 1 && parseInt(b) == 1 && parseInt(c) == 1 && parseInt(d) == 1) {
                            $("#DISTSUELD").prop("disabled", true);
                            $("#DISTSUELD").css("cursor","not-allowed");
                            
                        } else if (parseInt(b) == 1 && parseInt(c) == 1 && parseInt(d) == 1) {
                            $("#DISTSUELD").prop("disabled", false);
                            $("#DISTSUELD").css("cursor", "hand");
                            
                        }

                        if (parseInt(c) == 1 && parseInt(d) == 1) {
                            $("#GASTGEN").prop("disabled", false);
                            $("#GASTGEN").css("cursor", "hand");
                            $("#DISTCLIE").prop("disabled", true);
                            $("#DISTCLIE").css("cursor", "not-allowed");
                        } else if (parseInt(d) == 1) {
                            $("#DISTCLIE").prop("disabled", false);
                            $("#DISTCLIE").css("cursor", "hand");
                        }

                        

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

        $("#btncerrarmodal").on("click", function () {
            $("#Modal_detalle").modal("hide");
        });

        function DistribuirTar() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcPeriodo = $('#txtFeCont').val();
            obj.vcFecha = $('#txtFeIni').val();
            obj.vcFechaFin = $('#txtFeFin').val();
            obj.vcAccion = "4";

            $.ajax({
                type: "POST",
                data: JSON.stringify({objeto:obj}),
                url: "../SerMaes.asmx/DistribuirTarifaWbm",
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                
                success: function (a) {
                    console.log(a);
                    var parsear = JSON.parse(a.d);
                    if (parseInt(parsear) > 0) {

                        swal.fire({
                            title: "Se generó la distribución correctamente.",
                            text: "",
                            imageUrl: '../Img/e-sun_logo-min.png',
                            showConfirmButton: false,
                            timer: 2500,
                            timerProgressBar: true,
                            showClass: {
                                popup: 'animate__animated animate__fadeInDown'
                            },
                            hideClass: {
                                popup: 'animate__animated animate__fadeOutUp'
                            }
                        });

                        setTimeout(cargatabla(2),4000);


                    } else {
                        swal.fire({
                            title: "No se generó la distribución.",
                            text: "",
                            icon:"error",
                            showConfirmButton: false,
                            timer: 2500,
                            timerProgressBar: true,
                            showClass: {
                                popup: 'animate__animated animate__fadeInDown'
                            },
                            hideClass: {
                                popup: 'animate__animated animate__fadeOutUp'
                            }
                        });
                    }
                }

            });
        }

        function MostrarDetalleFN() {

            $("#Modal_detalle").modal("show");

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcPeriodo = $('#txtFeCont').val();
            obj.vcFecha = $('#txtFeIni').val();
            obj.vcFechaFin = $('#txtFeFin').val();

            $.ajax({
                type: 'POST',
                url: "../SerMaes.asmx/InformeRep_Detalle",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (r) {

                    var p = JSON.parse(r.d);
                    var sumatoria = 0;
                    var extra = 0;
                    $("#detalle_distri").html('');

                    var html = '';

                    html = "<table class='table table-striped dataex-html5-background dataTable dtr-inline collapsed' id='tb_detalle' name='tb_detalle'>";
                    html += "<thead>";
                    html += "<tr><th>CARGO</th><th>TRABAJADOR</th><th>BASICO</th><th>ASIG. FAM.</th><th>BONO</th><th>GRATIFICACION</th><th>CTS</th><th>VACACIONES</th><th>ESSALUD</th><th>COSTO - EMPRESA</th><th style='text-align:right;'>HORAS EXTRAS</th></tr>";
                    html += "</thead>";
                    html += "<tbody id='body_tbdetalle'>";
                    for (var i = 0; i < p.length; i++) {
                        html += '<tr><td id = "cargo' + i + '">' + p[i].CARGO + '</td>' +
                            '<td id = "trabajador' + i + '"> ' + p[i].TRABAJADOR + '</td>' +
                            '<td contenteditable="true" id = "basico' + i + '" onkeyup="cambio(' + "'" + p[i].BASICO + "'" + ", " + "'basico" + i + "'" + ", " + "'" + i + "'" + "," +  p.length + ')" > ' + p[i].BASICO + '</td> ' +
                            '<td contenteditable="true" id = "asigfam' + i + '" onkeyup="cambio(' + "'" + p[i].ASIG_FAM + "'" + ", " + "'asigfam" + i + "'" + ", " + "'" + i + "'" + "," + p.length +')" > ' + p[i].ASIG_FAM + '</td>' +
                            '<td id = "bono' + i + '"> ' + p[i].BONO + '</td>' +
                            '<td id = "gratif' + i + '"> ' + p[i].GRATIF + '</td>' +
                            '<td id = "cts' + i + '"> ' + p[i].CTS + '</td>' +
                            '<td id = "vacaciones' + i + '"> ' + p[i].VACACIONES + '</td>' +
                            '<td id = "essalud' + i + '" > ' + p[i].ESSALUD + '</td>' +
                            '<td id = "sueldo' + i + '" > ' + p[i].SUELDO + '</td>' +
                            '<td contenteditable="true" style="text-align:right;color:#36d666" id = "horext' + i + '" onkeyup="updatextra(' + "'" + p[i].HOR_EXT + "'" + ", " + "'horext" + i + "'" + ", " + "'" + i + "'" + "," + p.length + ')">' + p[i].HOR_EXT + '</td>'+'</tr>';
                        sumatoria = sumatoria + parseFloat(p[i].SUELDO);
                        extra = extra + parseFloat(p[i].HOR_EXT);
                    }
                    html += '<tr>' + '<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>Total: </td><td id="idtotal">' + parseFloat(sumatoria).toLocaleString() + '</td><td style="text-align:right;">Total extra: ' + "<p id='idextra'>" + extra + "</p>" + '</td>' + '</tr>';
                    html += "</tbody>";
                    html += "</table>";
                    $("#detalle_distri").append(html);

                    //$('#tb_detalle').editableTableWidget({ editor: $(''), preventColumns: [4, 1,2,3] });


                }
            });
        }

        function updatextra(data, id, code, p) {
            var suma = 0.0;
            for (var i = 0; i < p; i++) {
                suma = suma + parseFloat($("#horext" + i).text());
            }
            $("#idextra").text(suma);
            //DATOS PARA VALIDAR A NIVEL DE BD
            var periodo = $("#txtFeCont").val();
            var cargo = $("#cargo" + code).text();
            var trabajador = $("#trabajador" + code).text();
            var extra = $("#horext"+code).text();

            //Objeto con la data actualizar
            var objeto = new Object();

            objeto.periodo = periodo;
            objeto.personal = trabajador;
            objeto.cargo = cargo;
            objeto.extra = extra;

            $.ajax({
                type: "POST",
                data: JSON.stringify({ obj: objeto }),
                url: "../SerMaes.asmx/UpdateExtra",
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (r) {
                    //console.log(r.d);
                    var parsear = JSON.parse(r.d);
                    if (parseInt(parsear) > 0) {

                        //alertify.set('notifier', 'position', 'bottom-right');
                        //alertify.success('Cambio efectuado', 'success', 1);
                        console.log("correcto");

                    } else {
                        //alertify.set('notifier', 'position', 'top-right');
                        //alertify.error('Cambio no efectuado', 'error', 1);
                        console.log("incorrecto");
                    }

                }
            });

        }



        function cambio(data, id, code,p) {
            //SUMATORIA
            var basico = parseFloat($("#basico" + code).text());
            if (isNaN(parseFloat(basico))) {
                $("#basico" + code).text("");
                basico = parseFloat($("#basico" + code).text("0"));
            }
            var asigfam = parseFloat($("#asigfam" + code).text());
            if (isNaN(parseFloat(asigfam))) {
                $("#asigfam" + code).text("");
                asigfam = parseFloat($("#asigfam" + code).text("0"));
            }

            //var bono = parseFloat($("#bono" + code).text());
            var bono = (parseFloat(basico) / 12).toFixed(2);
            $("#bono" + code).text(bono);
            //var gratif = parseFloat($("#gratif" + code).text());
            var gratif = (parseFloat(((parseFloat(basico) + parseFloat(asigfam) + parseFloat(bono)) + ((parseFloat(basico) + parseFloat(asigfam) + parseFloat(bono)) * 0.09))) / 6).toString().match(/^-?\d+(?:\.\d{0,2})?/)[0];
            //console.log((parseFloat(((parseFloat(basico) + parseFloat(asigfam) + parseFloat(bono)) + ((parseFloat(basico) + parseFloat(asigfam) + parseFloat(bono)) * 0.09))) / 6).toString().match(/^-?\d+(?:\.\d{0,2})?/)[0]);
            $("#gratif" + code).text(gratif);
            //var cts = parseFloat($("#cts" + code).text());
            var cts = (parseFloat(parseFloat(basico) + parseFloat(asigfam) + parseFloat(bono) + parseFloat(gratif)) / 12).toString().match(/^-?\d+(?:\.\d{0,2})?/)[0];
            $("#cts" + code).text(cts);
            //var vacaciones = parseFloat($("#vacaciones" + code).text());
            var vacaciones = ((parseFloat(basico) + parseFloat(asigfam)) / 12).toFixed(2);
            $("#vacaciones" + code).text(vacaciones);
            //var essalud = parseFloat($("#essalud" + code).text());
            var essalud = (parseFloat(parseFloat(basico) + parseFloat(asigfam) + parseFloat(bono) + parseFloat(vacaciones)) / 12).toString().match(/^-?\d+(?:\.\d{0,2})?/)[0];
            $("#essalud" + code).text(essalud);


            var horext = parseFloat($("#horext" + code).text());

            var total = parseFloat(basico + asigfam + parseFloat($("#bono" + code).text()) + parseFloat($("#gratif" + code).text()) + parseFloat($("#cts" + code).text()) + parseFloat($("#vacaciones" + code).text()) + parseFloat($("#essalud" + code).text()));

            

            //DATOS PARA VALIDAR A NIVEL DE BD
            var periodo = $("#txtFeCont").val();
            var cargo = $("#cargo" + code).text();
            var trabajador = $("#trabajador" + code).text();

            //ALERTA DE PRUEBA
            //alert("Periodo: " + periodo + "\nCambio para: " + trabajador + "\nCargo: " + cargo + "\nNuevo sueldo: " + total);

            //ASIGNAR NUEVO SUELOD
            $("#sueldo" + code).text(parseFloat(total).toFixed(2));


            //ASIGNAMOS SUMA TOTAL
            var suma = 0;
            for (var i = 0; i < p; i++) {
                suma = suma + parseFloat($("#sueldo" + i).text());
            }

            $("#idtotal").text(parseFloat(parseFloat(suma).toFixed(2)).toLocaleString());

            console.log(parseFloat(($("#idtotal").text())).toLocaleString('de-DE'))

            var objeto = new Object();

            objeto.periodo = periodo;
            objeto.personal = trabajador;
            objeto.cargo = cargo;
            objeto.basico = basico;
            objeto.asig_fam = asigfam;
            objeto.bono = bono;
            objeto.hor_ext = horext;
            objeto.gratif = gratif;
            objeto.cts = cts;
            objeto.vacaciones = vacaciones;
            objeto.essalud = essalud;
            objeto.total = total;

            $.ajax({
                type: "POST",
                data: JSON.stringify({ obj: objeto }),
                url: "../SerMaes.asmx/CambiarSueldo",
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (r) {
                    //console.log(r.d);
                    var parsear = JSON.parse(r.d);
                    if (parseInt(parsear) > 0) {
                        
                        //alertify.set('notifier', 'position', 'bottom-right');
                        //alertify.success('Cambio efectuado', 'success', 1);
                        console.log("correcto");
                       
                    } else {
                        //alertify.set('notifier', 'position', 'top-right');
                        //alertify.error('Cambio no efectuado', 'error', 1);
                        console.log("incorrecto");
                    }

                }
            });

        }


        function TbHistorico(data, tb) {
            DevExpress.localization.locale('es');

            var dataGrid = $("#" + tb).dxDataGrid({
                dataSource: data,
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
                columnMinWidth: 30,
                columnAutoWidth: true,
                showBorders: true,
                //columnChooser: {
                //    enabled: true
                //},
                columnFixing: {
                    enabled: true
                },
                //wordWrapEnabled: true,
                showBorders: true,
                //export: {
                //    enabled: true,
                //    fileName: "Reporte"
                //},

                filterRow: {
                    visible: false,
                    applyFilter: "auto"
                },
                searchPanel: {
                    visible: false,
                    placeholder: "Buscar..."
                },
                filterRow: {
                    visible: true
                },
                headerFilter: {
                    visible: true
                },
                columns: [
                    { caption: "EMPRESA", dataField: "EMPRESA" }
                    , { caption: "DESCRIPCION", dataField: "DESCRIPCION" }
                    , { caption: "periodo", dataField: "periodo" }
                    , {
                        caption: "Costo", dataField: "COSTO",
                        dataType: "number",
                        format: function (value) {
                            return formatNumber.new(value.toFixed(2));
                        }
                    }
                ],

            })
        }

        function TbTrabajadores(data) {
            var tabletb = $('#tbtrabajadores').DataTable({

                destroy: true,
                dom: '<"row"<"col-sm-6"Bl><"col-sm-6"f>>' +
                    '<"row"<"col-sm-12"<"table-responsive"tr>>>' +
                    '<"row"<"col-sm-5"i><"col-sm-7"p>>',
                fixedHeader: {
                    header: true
                },
                "searching": false,
                "paging": false,
                "ordering": false,
                "info": false,
                responsive: true,
                data: data,
                columns: [
                    {
                        data: 'PERIODO',
                        className: "text-center",
                        width: "5%"
                    },
                    {
                        data: 'CARGO',
                        className: "text-left",
                        width: "30%"
                    },
                    {
                        data: 'DNI',
                        className: "text-center",
                        width: "10%"
                    },
                    {
                        data: 'TRABAJADOR',
                        className: "text-left",
                        width: "50%"
                    },
                    {
                        data: 'SUELDO',
                        render: function (SUELDO) {
                            return formatNumber.new(SUELDO.toFixed(2));
                        },
                        className: "text-right",
                        width: "5%"
                    }
                ],
                language: {
                    "processing": "<img src='../img/loading.gif' />"
                },
            });
        }

        function TbDistribucion(data) {
            var tabledf = $('#tbdistribucioncosto').DataTable({

                destroy: true,
                dom: '<"row"<"col-sm-6"Bl><"col-sm-6"f>>' +
                    '<"row"<"col-sm-12"<"table-responsive"tr>>>' +
                    '<"row"<"col-sm-5"i><"col-sm-7"p>>',
                //fixedHeader: {
                //    header: true
                //},
                buttons: {
                    buttons: [{
                        extend: 'print',
                        text: '<i class="fa fa-print"></i> Imprimir',
                        title: 'tbOperaciones',
                        exportOptions: {
                            columns: ':not(.no-print)'
                        },
                        footer: true,
                        autoPrint: true,
                    }, {
                        extend: 'excel',
                        text: '<i class="fa fa-file"></i> Excel',
                        title: 'tbOperaciones',
                        exportOptions: {
                            columns: [0, 1, 2, 3]
                        },
                        footer: true,
                    }, {
                        extend: 'pdf',
                        text: '<i class="fa fa-file-pdf-o"></i> PDF',
                        title: 'tbOperaciones',
                        exportOptions: {
                            columns: [0, 1, 2, 3],
                            columns: ':not(.no-print)'
                        },
                        footer: true
                    }],
                    dom: {
                        container: {
                            className: 'dt-buttons'
                        },
                        button: {
                            className: 'btn btn-info btn-sm'
                        }
                    }
                },
                "searching": false,
                "paging": false,
                "ordering": false,
                "info": false,
                responsive: true,
                data: data,
                columns: [

                    {
                        data: 'CLIENTE',
                        className: "text-left",
                        width: "50%"
                    }, {
                        data: 'SOCIEDAD_AGRICOLA_DON_LUIS',
                        render: function (SOCIEDAD_AGRICOLA_DON_LUIS) {
                            return formatNumber.new(SOCIEDAD_AGRICOLA_DON_LUIS.toFixed(2));
                        },
                        className: "text-center",
                        width: "25%"
                    }, {
                        data: 'SUNFRUITS_EXPORTS',
                        render: function (SUNFRUITS_EXPORTS) {
                            return formatNumber.new(SUNFRUITS_EXPORTS.toFixed(2));
                        },
                        className: "text-center",
                        width: "25%"
                    }, {
                        data: 'TOTAL',
                        render: function (TOTAL) {
                            return formatNumber.new(TOTAL.toFixed(2));
                        },
                        className: "text-center",
                        width: "25%"
                    }
                ],
                language: {
                    "processing": "<img src='../img/loading.gif' />"
                },
            });
        }

        function TbCliente(data) {
            var table = $('#tbcliente').DataTable({

                destroy: true,
                dom: '<"row"<"col-sm-6"Bl><"col-sm-6"f>>' +
                    '<"row"<"col-sm-12"<"table-responsive"tr>>>' +
                    '<"row"<"col-sm-5"i><"col-sm-7"p>>',
                //fixedHeader: {
                //    header: true
                //},
                buttons: {
                    buttons: [{
                        extend: 'print',
                        text: '<i class="fa fa-print"></i> Imprimir',
                        title: 'tbOperaciones',
                        exportOptions: {
                            columns: ':not(.no-print)'
                        },
                        footer: true,
                        autoPrint: true,
                    }, {
                        extend: 'excel',
                        text: '<i class="fa fa-file"></i> Excel',
                        title: 'tbOperaciones',
                        exportOptions: {
                            columns: [0, 1, 2, 3]
                        },
                        footer: true,
                    }, {
                        extend: 'pdf',
                        text: '<i class="fa fa-file-pdf-o"></i> PDF',
                        title: 'tbOperaciones',
                        exportOptions: {
                            columns: [0, 1, 2, 3],
                            columns: ':not(.no-print)'
                        },
                        footer: true
                    }],
                    dom: {
                        container: {
                            className: 'dt-buttons'
                        },
                        button: {
                            className: 'btn btn-info btn-sm'
                        }
                    }
                },
                "searching": false,
                "paging": false,
                "ordering": false,
                "info": false,
                responsive: true,
                data: data,
                columns: [

                    {
                        data: 'CLIENTE',
                        className: "text-left",
                        width: "55%"
                    },
                    {
                        data: 'HORAS',
                        render: function (HORAS) {
                            return formatNumber.new(HORAS.toFixed(2));
                        },
                        className: "text-center",
                        width: "15%"
                    }, {
                        data: 'PORC_HORAS',
                        render: function (PORC_HORAS) {
                            return formatNumber.new(PORC_HORAS.toFixed(2));
                        },
                        className: "text-center",
                        width: "15%"
                    },
                    {
                        data: 'SUELDOS',
                        render: function (SUELDOS) {
                            return "";//formatNumber.new(SUELDOS.toFixed(2));
                        },
                        className: "text-right",
                        width: "15%"
                    }
                ],
                language: {
                    "processing": "<img src='../img/loading.gif' />"
                },
            });
        }


        function TbPivotGrid(tablef, data) {
            DevExpress.localization.locale('es');
            DevExpress.config({ forceIsoDateParsing: true });
            $("#" + tablef).dxPivotGrid({
                allowSortingBySummary: true,
                //allowSorting: true,
                allowFiltering: true,
                //allowExpandAll: true,
                //height: 440,
                showBorders: true,
                bindingOptions: {
                    headerFilter: "headerFilter"
                },
                fieldPanel: {
                    visible: true
                },
                fieldChooser: {
                    allowSearch: true,
                    enabled: true
                },
                export: {
                    enabled: true,
                    fileName: "Reporte Reparaciones"
                },
                dataSource: {
                    fields: [
                        {
                            caption: "Cliente",
                            dataField: "CLIENTE",
                            area: "row"
                        }, {
                            caption: "Maquinaria",
                            dataField: "MAQUINARIA",
                            area: "row",
                        }, {
                            caption: "Fecha",
                            width: 30,
                            dataField: "FECHA",
                            area: "row",
                        }, {
                            caption: "Orden Rep.",
                            dataField: "ORDENREPARACION",
                            width: 30,
                            area: "row"
                        }, {
                            caption: "Observacion",
                            dataField: "OBSERVACION",
                            area: "row",
                        }, {
                            caption: "Datos",
                            dataField: "DATOS",
                            area: "row",
                        }, {
                            caption: "Cant",
                            dataField: "CANT",
                            area: "row",
                        }, {
                            caption: "Validacion",
                            dataField: "VALIDACION",
                            area: "filter",
                        }, {
                            caption: "Clase",
                            dataField: "CLASE",
                            width: 150,
                            area: "column",
                            filterType: 'include',
                            filterValues: ['ARTICULO', 'SERVICIO','TRABAJADOR']
                        }, {
                            caption: "Costo",
                            dataField: "costo",
                            dataType: "number",
                            summaryType: "sum",
                            format: function (value) {
                                if (value == 0) {
                                    return null;
                                } else {
                                    return formatNumber.new(value.toFixed(3));
                                }
                            },
                            area: "data",
                        }, {
                            caption: "Moneda",
                            dataField: "MONEDA",
                            area: "filter",
                        }, {
                            caption: "CECOS",
                            dataField: "CECOS",
                            area: "filter",
                        }, {
                            caption: "Mes",
                            dataField: "MES",
                            area: "filter"
                        }, {
                            caption: "UM",
                            dataField: "UM",
                            area: "filter",
                        }
                    ],
                    store: data
                }
            });

            $("#reset").dxButton({
                text: "Reset the PivotGrid's State",
                onClick: function () {
                    pivotgrid.getDataSource().state({});
                }
            });

        }

        var valorizar = 0;

        function TbDataGrid(data) {
            DevExpress.localization.locale('es');

            var dataGrid = $("#tbOperaciones").dxDataGrid({
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
                    fileName: "Reporte"
                },

                filterRow: {
                    visible: false,
                    applyFilter: "auto"
                },
                searchPanel: {
                    visible: false,
                    placeholder: "Buscar..."
                },
                filterRow: {
                    visible: true
                },
                headerFilter: {
                    visible: true
                },
                columns: [
                    { caption: "PERIODO", dataField: "PERIODO", width: 80 }
                    , { caption: "FECHA", dataField: "FECHA" }
                    , { caption: "CONSUMIDOR", dataField: "IDCONSUMIDOR" }
                    , { caption: "OPERACION", dataField: "OPERACION" }
                    , { caption: "DOCUMENTO", dataField: "DOCUMENTO" }
                    , { caption: "PROVEEDOR", dataField: "PROVEEDOR" }
                    , { caption: "DESCRIPCION", dataField: "DESCRIPCION", width: 380 }
                    , {
                        caption: "COSTO",
                        dataField: "COSTO",
                        cellTemplate: function (element, info) {
                            //Valor de cada costo
                            var x = info.text;
                            if (parseFloat(x)>0) {
                                //info.css("color", "blue");
                                element.append("<div>" + info.text + "</div>").css("color", "blue");
                            } else {
                                element.append("<div>" + info.text + "</div>").css("color", "red");
                                valorizar = 1;
                            }
                            //element.append("<div>xd</div>").css("color", "blue");
                        },
                        dataType: "number",
                        format: function (value) {
                            return formatNumber.new(value.toFixed(2));
                        }
                    }
                ], 
                sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }],
                summary: {
                    groupItems: [{
                        column: "PERIODO",
                        summaryType: "count",
                        displayFormat: "{0} items",
                    }, {
                        column: "COSTO",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(2));
                        },
                        displayFormat: "{0}",
                        showInGroupFooter: false,
                        alignByColumn: true
                        , dataType: "number"
                    }
                    ],
                    totalItems: [{
                        column: "COSTO",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(2));
                        },
                        displayFormat: "{0}",
                        dataType: "number"
                    }
                    ]
                }


            }).dxDataGrid("instance");

            
            if (parseInt(valorizar) == 1) {
                $("#container-tbdist").append("<div class='mt-3'><span class='badge bg-danger' style='font-size:20px'>Movimientos sin valorizar.</span></div>");
                $("#GASTGEN").prop("disabled",true);
            } else {
                $("#container-tbdist").append("<div class='mt-3'><span class='badge bg-success' style='font-size:20px'>Valorización correcta.</span></div>");
                $("#GASTGEN").prop("disabled", false);
            }

        };




        function createHighcharts(data) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ","
                }
            });

            var final = [];

            for (var i = 0; i < data.length; i++) {

                final.push({
                    name: data[i].CLIENTE,
                    y: data[i].PORC_HORAS,
                });

            }
            Highcharts.setOptions({
                colors: ['#24CBE5', '#64E572', '#FF9655', '#FFF263', '#6AF9C4']
            });

            Highcharts.chart('piec', {
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
                    text: ''
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                            style: {
                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                            }
                        }
                    }
                },
                series: [{
                    name: "porcentaje de horas",
                    colorByPoint: true,
                    data: final
                }]

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

