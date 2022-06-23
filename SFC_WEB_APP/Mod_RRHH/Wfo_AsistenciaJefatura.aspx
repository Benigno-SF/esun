<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_AsistenciaJefatura.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_AsistenciaJefatura" %>

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

    <style>
        .dx-freespace-row {
            height: 0px !important;
        }

        #DataGrid {
            width: 100%;
            height: 60vh;
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
            /*font-size: 10px;*/
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
            /*font-size: 10px;*/
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
            /*font-size: 10px*/
        }

        .table td {
            padding: 0.8rem 0.4rem !important;
            /*font-size: 10px;*/
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
            /* font-size: 10px;*/
        }

        .dx-editor-cell .dx-texteditor .dx-texteditor-input {
            background: rgba(255,255,255,0);
            /*font-size: 10px;*/
            height: 48px;
            line-height: 48px;
            padding: 0 10px;
            margin-top: 0;
        }

        #table-sfe {
            height: 300px;
        }

        #table-adl {
            height: 300px;
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
    <div class="row">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label>CONSULTA</label>
            <select id="tipo" class="form-control" >
                <option value="" selected="selected" disabled="disabled">--seleccione--</option>
                <option value="V">VACACIONES</option>
                <option value="A">ASISTENCIA</option>
            </select>
        </div>
<%--        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 vacaciones" style="display: none">
            <label>Areas</label>
            <div id="nIdGrupo" class="form-control"></div>
        </div>--%>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0 vacaciones" style="display: none">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnBusc" class="btn btn-secondary col-12">
                <i class="fas fa-search"></i>Recuperar
            </button>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2  pb-0 mb-0 asistencia" id="DivFeIni" style="display: none">
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
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2  pb-0 mb-0 asistencia" id="DivFeFin" style="display: none">
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
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0 asistencia" style="display: none">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnRec" class="btn btn-secondary col-12">
                <i class="fas fa-search"></i>Recuperar
            </button>
        </div>
    </div>


    <br />
    <section id="cell-background" style="height: 80vh;">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title" id="titlereps"></h4>
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
    <script src="../Scripts/sweetalert2.js"></script>
    <script>
        function load_date() {
            var hoy = new Date();
            var fecha = ('0' + hoy.getDate()).slice(-2) + '/' + ('0' + (hoy.getMonth() + 1)).slice(-2) + '/' + hoy.getFullYear();
            //var fechaparse = hoy.getFullYear() + '-' + ('0' + (hoy.getMonth() + 1)).slice(-2) + '-' + ('0' + hoy.getDate()).slice(-2);
            //var periodo = hoy.getFullYear() + ('0' + (hoy.getMonth() + 1)).slice(-2);

            $('#txtFeIni').val(fecha);
            $('#txtFeFin').val(fecha);
        }
        load_date();


        $('body').on('change', '#tipo', function () {
            var id = $(this).val();
            //var tipo = $(this).find('option:selected').val();
            //alert(id);
            if (id == 'V') {
                $('.vacaciones').show();
                $('.asistencia').hide();
                $('#titlereps').text('Reporte de Vacaciones Personal');
            }

            if (id == 'A') {
                $('.vacaciones').hide();
                $('.asistencia').show();
                $('#titlereps').text('Reporte de Asistencia Personal')
            }

            $('#container-x').html('');
        })

        function LoadGrupo(bd) {

            var obj = new Object();
            obj.vnIdGrupo = '';
            obj.vcDescripcion = '';
            $.ajax({
                type: 'POST',
                url: "../SerRRHH.asmx/ListGrupoTrabajo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    var searchBox = $("#nIdGrupo").dxSelectBox({
                        dataSource: lst,
                        displayExpr: 'DESCRIPCION',
                        valueExpr: 'IDGRUPOTRABAJO',
                        placeholder: "Seleccione",
                        noDataText: "Sin Datos",
                        searchEnabled: true,
                    }).dxSelectBox("instance");


                    $('#nIdGrupo').dxSelectBox({
                        items: lst,
                        value: lst[0],
                        onValueChanged(frt) {
                            if (frt.value['codigo'] === undefined) {
                                //LoadSubGrupo(frt.value, bd)
                            }
                            //$('.current-value > span').text(data.value);
                        },
                    });

                },
                error: function (error) {
                    alert(JSON.stringify(error));
                }
            });
        }
       // LoadGrupo();
        //var searchBox2 = $("#cIdAlmacen").dxSelectBox({
        //    placeholder: "Seleccione",
        //    noDataText: "Sin Datos",
        //}).dxSelectBox("instance");

        $("#btnBusc").click(function () {
            cargatabla();
        });

        $("#btnRec").click(function () {
            cargatablaasist();
        });
        

        function cargatabla() {
            var obj = new Object();
            obj.vcCodigo = '';

            //if ($("#nIdGrupo").dxSelectBox('instance').option('selectedItem') != null) {
            //    obj.vnIdGrupo = $("#nIdGrupo").dxSelectBox('instance').option('selectedItem').IDGRUPOTRABAJO;
            //} else {
            //    toastr.error('', 'Seleccione Grupo');
            //    return;
            //}

            obj.vnIdGrupo = '';
            //  var f = new Date();
            //alert(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
            $('#container-x').html('<div class="text-center bold"><img width="40px" src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
            $.ajax({
                type: 'POST',
                url: "../SerRRHH.asmx/ListVacacionesPersonal",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                error: function () {
                    $('#activos').hide();
                },
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    $('#container-x').html('<div id="DataGrid"></div>');
                    TbDataGrid(lst);
                },
                error: function (data) {
                    alert(JSON.stringify(data));
                },
                timeout: 50000
            });

        }

        function cargatablaasist() {
            var obj = new Object();
            obj.vcEmpresa = "001";

            if ($('#txtFeIni').val() != '') {
                var str1 = $('#txtFeIni').val();
                var res1 = str1.split("/", 3);
                obj.vcFecha = res1[2] +  res1[1] +  res1[0];
            } else {
                obj.vcFecha = '';
            }
            if ($('#txtFeFin').val() != '') {
                var str2 = $('#txtFeFin').val();;
                var res2 = str2.split("/", 3);
                obj.vcFechaFin = res2[2] + res2[1] + res2[0];
            } else {
                obj.vcFechaFin = '';
            }



            //  var f = new Date();
            //alert(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
            $('#container-x').html('<div class="text-center bold"><img width="40px" src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
            $.ajax({
                type: 'POST',
                url: "../SerRRHH.asmx/ListAsistenciaPersonal",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                error: function () {
                    $('#activos').hide();
                },
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    $('#container-x').html('<div id="DataGrid"></div>');
                    TbDataGridAsist(lst);
                },
                error: function (data) {
                    alert(JSON.stringify(data));
                },
                timeout: 50000
            });

        }

        function TbDataGrid(data, vfecha) {
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
                columns: [
                    { caption: 'DNI', dataField: 'idcodigogeneral' }
                    , { caption: 'Nombre', dataField: 'apenom' }
                    , { caption: 'idgrupo', dataField: 'idgrupo', visible: false }
                    , { caption: 'dsc_grupo', dataField: 'dsc_grupo', visible: false }
                    , { caption: 'itemfecha', dataField: 'itemfecha', visible: false }
                    , { caption: 'Fecha Ingreso', dataField: 'ingreso' }
                    , { caption: 'Periodo Desde', dataField: 'd_periodo' }
                    , { caption: 'Periodo Hasta', dataField: 'h_periodo' }
                    , { caption: 'Saldo Dias', dataField: 'saldo_dias', dataType: 'number', }
                    , { caption: 'Grupo Trabajo', dataField: 'grupo_trabajo' }
                    , { caption: 'Planilla', dataField: 'planilla' }
                    , { caption: 'Fecha Vencimiento', dataField: 'fecha_vencimiento' }
                    , { caption: 'Mes Vencimiento', dataField: 'mes_vencimiento' }
                    , { caption: 'Dias Vencer', dataField: 'dias_vencer', visible: false }
                    , { caption: 'Dias Vencido', dataField: 'dias_vencido' }
                    , { caption: 'Subplanilla', dataField: 'subplanilla', visible: false }
                ],
                sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }],
                summary: {
                    groupItems: [{
                        column: 'saldo_dias',
                        summaryType: 'sum',
                        displayFormat: '{0}',
                        alignByColumn: true,
                    }],
                }
            }).dxDataGrid("instance");

        }

        function TbDataGridAsist(data, vfecha) {
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
                columns: [

                 { caption: 'Fecha', dataField: 'FECHAV' }
                ,{ caption: 'DNI', dataField: 'IDPERSONAL' }
                ,{ caption: 'NRODIA', dataField: 'NRODIA', visible: false }
                ,{ caption: 'Nombres', dataField: 'APENOM' }
                    , { caption: 'IDCARGO', dataField: 'IDCARGO', visible: false  }
                ,{ caption: 'CARGO', dataField: 'CARGO' }
                ,{ caption: 'IDPLANILLA', dataField: 'IDPLANILLA', visible: false  }
                    , { caption: 'PLANILLA', dataField: 'PLANILLA', visible: false  }
                ,{ caption: 'COD_SUCURSAL', dataField: 'COD_SUCURSAL', visible: false  }
                ,{ caption: 'SUCURSAL', dataField: 'SUCURSAL', visible: false  }
                ,{ caption: 'IDHORARIO', dataField: 'IDHORARIO', visible: false  }
                ,{ caption: 'HORARIO_PROG', dataField: 'HORARIO_PROG', visible: false  }
                ,{ caption: 'ESTADO', dataField: 'ESTADO', visible: false  }
                ,{ caption: 'Marca 1', dataField: 'MARCA1' }
                ,{ caption: 'Marca 2', dataField: 'MARCA2' }
                ,{ caption: 'Marca 3', dataField: 'MARCA3' }
                ,{ caption: 'Marca 4', dataField: 'MARCA4' }
                ,{ caption: 'Marca 5', dataField: 'MARCA5' }
                ,{ caption: 'NROMARCAS', dataField: 'NROMARCAS', visible: false   }
                , { caption: 'Total Horas', dataField: 'TOTALHORAS', dataType: 'number', }
                ,{ caption: 'NROMAXMARCAS', dataField: 'NROMAXMARCAS', visible: false  }
                ,{ caption: 'horasdia', dataField: 'horasdia', visible: false  }
                ,{ caption: 'MARCAB', dataField: 'MARCAB', visible: false  }
                ,{ caption: 'idgrupo_trabajo', dataField: 'idgrupo_trabajo', visible: false  }
                ,{ caption: 'Grupo Trabajo', dataField: 'dsc_grupotrabajo' }
                ],
                sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }],
                summary: {
                    groupItems: [{
                        column: 'TOTALHORAS',
                        summaryType: 'sum',
                        format: ",##0.##",
                        displayFormat: '{0}',
                        alignByColumn: true,
                    }],
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
