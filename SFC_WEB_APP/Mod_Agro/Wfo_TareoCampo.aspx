<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_TareoCampo.aspx.cs" Inherits="SFC_WEB_APP.Mod_Agro.Wfo_TareoCampo" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.common.css" />
    <%--   <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.light.css" />--%>
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.1.3/css/dx.material.orange.light.css" />

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">


<%--    <asp:UpdatePanel runat="server" ID="UpdDLL1" style="width: -webkit-fill-available; display: none" class="col-md-12">
        <ContentTemplate>
<%--            <div class="row">
                <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                    <label for="ddlPeriodo" class="col-form-label">Periodo</label>
                    <asp:DropDownList ID="ddlPeriodo" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPeriodo_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                    <label for="message-text" class="col-form-label">Semana:</label>
                    <asp:DropDownList ID="ddlSemana" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>

                <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                    <label for="btnRec" class="col-form-label">&nbsp;</label>
                    <button type="button" id="btnRec" runat="server" class="btn btn-secondary col-12">
                        <i class="fa fa-search"></i>Recuperar
                    </button>
                </div>
                <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="syncd" style="display: none">
                    <label for="btnRec" class="col-form-label">&nbsp;</label>

                    <span id="msjtbl1" style="display: none"></span>
                </div>
            </div>--%>
     <%--    </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlPeriodo" />
        </Triggers>
    </asp:UpdatePanel>--%>
              <div class="row">
                 <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivFechaGuia2">
                    <label for="txtFeCont" class="col-form-label">Fecha:</label>
                    <input type="text" id="cFecha2" name="cFecha" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy" />
                    <script type="text/javascript">
                        $(function () {
                            $('#cFecha2').datetimepicker({
                                format: 'DD/MM/YYYY',
                                locale: 'es'
                            });
                            $(function () {
                                $('#DivFechaGuia2').datetimepicker({
                                    format: 'DD/MM/YYYY',
                                    locale: 'es'
                                });
                            });
                        });
                    </script>
                </div>

                <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                    <label for="btnRec" class="col-form-label">&nbsp;</label>
                    <button type="button" id="btnRec" class="btn btn-secondary col-12">
                        <i class="fa fa-search"></i>Recuperar
                    </button>
                </div>

            </div>

    <section id="cell-background" style="min-height: 30vh">


    </section>

    <div class="modal fade" id="ModSendSms" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">APROBAR TAREO</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="body-sync">
                    <div class="form-group mb-1 text-center" id="sendutil">
                        <img src="..\img\load_map.gif" width="80px" />&nbsp;<span  style="font-weight: bold">APROBANDO....</span>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <script src="../Scripts/sweetalert2.js"></script>
    <script type="text/javascript">
        $(document).on('click', '#btnRec', function () {
            cargatabla();
        });

        $(document).on('click', '.btn-sendx', function () {
            $('#ModSendSms').modal('show');

            var tareo = $('.btn-sendx').attr("idt");
            var requ = $('.btn-sendx').attr("idr");
            var hidetx = $('.btn-sendx').attr("hidet");
            if (requ === 'null' || requ === '') {
                requ = '';
            }

            var objj = new Object();
            objj.vcPeriodo = '';
            objj.vcSemana = '';
            objj.vcFecha = $('#cFecha2').val();
            objj.vcAccion = '2';
            objj.vcId = tareo;
            objj.vcIdConcepto = requ;
            // alert(JSON.stringify(objj));
            $.ajax({
                type: 'POST',
                url: "../SerAgro.asmx/Aprobar_Tareo_Nisira",
                data: JSON.stringify({ obj: objj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    if (lst.length != 0) {
                        setTimeout(function () { $('#ModSendSms').modal('hide'); }, 1000);
                        setTimeout(function () { $('#' + hidetx).hide(); }, 1000);
                        setTimeout(function () { toastr.success('', JSON.stringify(lst), { timeOut: 9500 });; }, 1000);
                    } else {
                        toastr.error('', JSON.stringify(lst), { timeOut: 9500 });
                    }
                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });
        });

        function filterArray(inputArr) {
            var found = {};
            var out = inputArr.filter(function (element) {
                return found.hasOwnProperty(element) ? false : (found[element] = true);
            });
            return out;
        }

        function cargatabla() {
            var obj = new Object();
            obj.vcPeriodo = '';
            obj.vcSemana = '';
            obj.vcFecha = $('#cFecha2').val();
            obj.vcAccion = '1';
            obj.vcId = "";
            obj.vcIdConcepto = "";
            $('#aprob-btn').html('');
            if (obj.vcFecha != null) {
                $('#cell-background').html('<div class="col-md-12 text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                $.ajax({
                    type: 'POST',
                    url: "../SerAgro.asmx/Aprobar_Tareo_Nisira",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        $('#cell-background').fadeIn(1000).html('');

                        if (lst.length != 0)
                        {

                            var count_cerrados = 0;
                            var count_abiertos = 0;


                            function getUniqueListBy(arr, key) {
                                return [...new Map(arr.map(item => [item[key], item])).values()]
                            }

                            const arr1 = getUniqueListBy(lst, 'IDTAREO');
                            console.log(arr1);

                            //console.log("Unique by place")
                            //console.log(arr1)


                            var htmlx = '';
                            for (var i = 0; i < arr1.length; i++) {

                                var btn = '<button type="button" id="btn-send" idt="' + arr1[i].IDTAREO + '" idr="' + arr1[i].cIdRequerimiento + '" hidet="req' + arr1[i].numero + '" class="btn btn-success btn-sendx" ><i class="fa fa-paper-sync"></i><span>Aprobar</span></button>';

                                var htmlv = '';
                                htmlv += '<div class="row hidetab" id="req' + arr1[i].numero + '"><div class="col-12"> <div class="card"><div class="card-header"> <h4 class="card-title">Aprobar Tareo <br> N° : ' + arr1[i].numero + '<br>fecha : ' + arr1[i].Fecha + '<br>Fundo : ' + arr1[i].FUNDO + '</h4>';
                                htmlv += '<div>' + btn + '</div>';
                                htmlv += '</div > <div class="card-content collapse show">';
                                htmlv += '<div class="card-body card-dashboard" style="min-height: 30vh; max-height: 90vh; /*width: 1500px;*/ overflow: auto" ><div class="device-mobile-tablet-container" style="min-height: 30vh;/* width: 1600px;overflow: auto;*/"><div id="DataGrid' + i + '"><div class="col-md-12 text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div></div>';
                                htmlv += '</div></div></div></div></div></div >';
                                htmlx += htmlv;


                                var datax = lst.filter(function (lst) {
                                    return lst.IDTAREO == arr1[i].IDTAREO;
                                });
                                console.log('1');
                                console.log(datax);
                            }




                            if (htmlx != '') {
                                $('#cell-background').html(htmlx);

                                for (var i = 0; i < arr1.length; i++) {

                                    var datax = lst.filter(function (lst) {
                                        return lst.IDTAREO == arr1[i].IDTAREO;
                                    });

                                    console.log('2');
                                    console.log(datax);
                                    TbPivotGrid(datax, 'DataGrid' + i)
                                }
                            }


                            $('#syncd').show();
                        }
                        else
                        {
                            $('#msjtbl1').html();

                            $('#tbl1').hide();
                            $('#container-x').html('<div id="DataGrid">No se encontraron resgistros</div>');
                            $('#syncd').show();

                        }


                        //if (lst.dd.length != 0) {
                        //    $('#tbl2').show();
                        //    $('#container-y').html('<div id="DataGridf"></div>');
                        //    TbDataGrid(lst.dd, 'f');
                        //} else {
                        //    $('#tbl2').hide();
                        //    $('#container-y').html('');
                        //}


                    }, error: function (data) {
                        alert(JSON.stringify(data));
                    },
                });
            } else {
                toastr.error('Seleccione Año Y Semana', '');
            }
        }

        function TbPivotGrid(data, id) {
            DevExpress.localization.locale('es');
            DevExpress.config({ forceIsoDateParsing: true });
            $("#" + id).dxPivotGrid({
                allowSortingBySummary: true,
                //allowSorting: true,
                allowFiltering: true,
                //allowExpandAll: true,
                //height: 440,
                showBorders: true,
                //bindingOptions: {
                //    headerFilter: "headerFilter"
                //},
                //fieldPanel: {
                //    visible: true
                //},
                //fieldChooser: {
                //    allowSearch: true,
                //    enabled: true
                //},
                fieldChooser: {
                    enabled: true,
                    applyChangesMode: "instantly",
                    allowSearch: true
                },
                export: {
                    enabled: true,
                    fileName: "Reporte Reparaciones"
                },
                allowColumnReordering: true,
                dataSource: {
                    fields: [
                        { caption: "IDTAREO", dataField: "IDTAREO", }
                        , { caption: "REQUERIMIENTO", dataField: "IDREQUERIMIENTO" }
                        , { caption: "FECHA", dataField: "DFECHAPROGR" }
                        , { caption: "FUNDO", dataField: "FUNDO" }
                        , { caption: "PERIODO", dataField: "PERIODO" }
                        , { caption: "SEMANA", dataField: "SEMANA" }
                        , { caption: "CESTADO", dataField: "CESTADO", area: "filter" }
                        , { caption: "SERIE", dataField: "SERIE", area: "filter" }
                        , { caption: "NUMERO", dataField: "numero", area: "filter" }
                        , { caption: "FECHA", dataField: "DFECHAPROGR", area: "filter" }
                        , { caption: "ACTIVIDAD", dataField: "ACTIVIDAD", area: "row" }
                        , { caption: "LABOR", dataField: "LABOR", area: "row" }
                        , { caption: "EMPRESA", dataField: "EMPRESA" }

                        , { caption: "PLANILLA", dataField: "PLANILLA", area: "filter" }
                        , { caption: "DESCRIPCIÓN", dataField: "DESCRIPCION", area: "filter" }
                        , { caption: "RESPONSABLE", dataField: "RESPONSABLE", area: "row" }
                        , { caption: "TRABAJADOR", dataField: "TRABAJADOR", area: "row" }
                        , { caption: "LOTE", dataField: "CECO", area: "row", area: "column" }
                        , { caption: "SUPERVISOR", dataField: "SUPERVISOR", area: "filter" }
                        , { caption: "TURNO", dataField: "Turno", area: "filter" }
                        , { caption: "ASISTENCIA", dataField: "ASISTENCIA", area: "filter" }
                        , { caption: "CODIGO", dataField: "CTG30TRABID", area: "filter" }
                        , { caption: "HORA INICIO", dataField: "DHORAINICIO" }
                        , { caption: "HORA FIN", dataField: "DHORAFIN" }
                        , {
                            caption: "TOTAL HORAS DIURNAS", dataField: "HORAS_DIURNAS", area: "data", dataType: "number",
                            summaryType: "sum",
                            format: function (value) {
                                if (value == 0) {
                                    return null;
                                } else {
                                    return formatNumber.new(value.toFixed(3));
                                }
                            },
                        }
                        //, { caption: "RENDIMINTO DIURNO BRUTO", dataField: "irendimientodiurnobruto", area: "data"}
                        //, { caption: "AVANCE", dataField: "iavance", area: "data"}
                        //, { caption: "AVANCE DIRUNO BRUTO", dataField: "iavancediurnobruto", area: "data"}
                        //, { caption: "HORA INI NOCTURNO", dataField: "DHORAINICIONOCTURNO", area: "filter"}
                        // , { caption: "HORA FIN NOCTURNO", dataField: "DHORAFINNOCTURNO", area: "filter"}
                        , {
                            caption: "TOTAL HORAS NOCTURNAS", dataField: "IHORASNOCTURNAS", area: "data", dataType: "number",
                            summaryType: "sum",
                            format: function (value) {
                                if (value == 0) {
                                    return null;
                                } else {
                                    return formatNumber.new(value.toFixed(3));
                                }
                            }
                        }
                        //, { caption: "RENDIMIENTONOCTURNO", dataField: "IRENDIMIENTONOCTURNO", area: "data"}
                        //, { caption: "AVANCE NOCTURNO", dataField: "IAVANCENOCTURNO", area: "data"}
                        //, { caption: "RENDIMIENTO", dataField: "IRENDIMIENTO", area: "data"}
                        ////  { caption: "cPeriodo", dataField: "cPeriodo" }
                        ////, { caption: "cSemana", dataField: "cSemana" }
                        ////, { caption: "cIdFundo", dataField: "cIdFundo" }
                        //// { caption: "cCodigo", dataField: "cCodigo" }
                        ////, { caption: "cNombres", dataField: "cNombres" }
                        ////, { caption: "Dia1", dataField: "Dia1" }


//*********************************************************************************************************************************************

                        //, {
                        //    caption: data[0].Fecha, dataField: "nDia1", area: "filter", dataType: "number",
                        //    summaryType: "sum",
                        //    format: function (value) {
                        //        if (value == 0) {
                        //            return null;
                        //        } else {
                        //            return formatNumber.new(value.toFixed(3));
                        //        }
                        //    },
                        //}


                         //, {
                        //    caption: "CANTIDAD", dataField: "ncantidad", area: "filter", dataType: "number",
                        //    summaryType: "sum",
                        //    format: function (value) {
                        //        if (value == 0) {
                        //            return null;
                        //        } else {
                        //            return formatNumber.new(value.toFixed(3));
                        //        }
                        //    },
                        //}
                       


//*********************************************************************************************************************************************



                       

                         //  , { caption: "OBSERVACION", dataField: "cobservacion", area: "filter"}
                        //  , { caption: "BASICO", dataField: "nBasico", area: "filter"}
                        //, {
                        //    caption: "ADICIONAL", dataField: "nMonto", area: "data", dataType: "number",
                        //    summaryType: "sum",
                        //    format: function (value) {
                        //        if (value == 0) {
                        //            return null;
                        //        } else {
                        //            return formatNumber.new(value.toFixed(3));
                        //        }
                        //    },
                        //}

                        //, {
                        //    caption: "Cant",
                        //    dataField: "CANT",
                        //    area: "row",
                        //}, {
                        //    caption: "Validacion",
                        //    dataField: "VALIDACION",
                        //    area: "filter",
                        //}, {
                        //    caption: "Clase",
                        //    dataField: "CLASE",
                        //    width: 150,
                        //    area: "column",
                        //    filterType: 'include',
                        //    filterValues: ['ARTICULO', 'SERVICIO']
                        //}
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


        var finalName = ""

        function declare(obj, nums, max) {

            if (nums <= max) {

                $('#counttk').html(max - nums);

                if (obj[nums].CESTADO == 'ES') {

                    if (obj[nums].IDTAREO != null) {

                        $('#Nombreinfo').html(obj[nums].numero);
                        $('#sendutil').show();

                        var objj = new Object();
                        objj.vcPeriodo = '';
                        objj.vcSemana = '';
                        objj.vcAccion = '2';
                        objj.vcId = obj[nums].IDTAREO;
                        objj.vcIdConcepto = obj[nums].IDREQUERIMIENTO;

                        $.ajax({
                            type: 'POST',
                            url: "../SerAgro.asmx/Aprobar_Tareo_Nisira",
                            data: JSON.stringify({ obj: objj }),
                            dataType: 'json',
                            contentType: 'application/json; charset=utf-8',
                            success: function (data) {
                                var lst = JSON.parse(data.d);

                                if (lst.dh.length != 0) {
                                    toastr.success('', JSON.stringify(lst.dh), { timeOut: 9500 });
                                    nums = nums + 1;
                                    declare(obj, nums, max);
                                } else {
                                    toastr.error('', JSON.stringify(lst.dh), { timeOut: 9500 });
                                    nums = nums + 1;
                                    declare(obj, nums, max);
                                }
                            },
                            error: function (data) {
                                alert(JSON.stringify(data));
                            }
                        });

                    } else {
                        // finalName += 'SE NECESITA EL IDTAREO DE AGUA PARA PODER SYNCRONIZAR ' + obj[nums].IDTAREO, 'NO TIENE IDTAREO\n';
                        toastr.error('SE NECESITA EL IDTAREO PARA PODER SYNCRONIZAR ' + obj[nums].IDTAREO, 'NO TIENE IDTAREO', { timeOut: 9500 });
                        nums = nums + 1;
                        declare(obj, nums, max);
                    }

                } else if (obj[nums].CESTADO == 'AP') {
                    //finalName += 'LA INFORMACION ' + obj[nums].IDTAREO + ' YA FUE SINCRONIZADO \n';
                    toastr.error('LA INFORMACION ' + obj[nums].IDTAREO + ' YA FUE APROBADO', 'YA IDTAREO', { timeOut: 9500 });
                    nums = nums + 1;
                    declare(obj, nums, max);
                }

            } else {
                $('#ModSendSms').modal('hide');
                $('#Nom2').html('');
                $('#loadingutil').hide();
                toastr.success('', 'APROBACION FINALIZADO');
                $('#counttk').html('');
                $('#restante').hide();
                cargatabla();
                $('#sendutil').hide();
                $('#selx').text('');
                $("#Div_close_part").hide();
                $("#btn-send").hide();
                $('#selx').text('0');

                var text = finalName;
                var filename = "log_sync.txt";



                //  download(filename, text);

                function download(filename, text) {
                    var element = document.createElement('a');
                    element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
                    element.setAttribute('download', filename);

                    element.style.display = 'none';
                    document.body.appendChild(element);

                    element.click();

                    document.body.removeChild(element);
                }
                finalName = "";
            }

        }

        $("#btnSend").click(function () {
            $('#restantes').show();
            var obj2 = new Object();
            x = -1;
            for (var i = 0; i < selected.length; i++) {
                x++
                var obj = new Object();
                obj.IDTAREO = selected[i].IDTAREO;
                obj.IDREQUERIMIENTO = selected[i].IDREQUERIMIENTO;
                obj.numero = selected[i].numero;
                obj.CESTADO = selected[i].CESTADO;

                obj2[i] = obj;
            }
            declare(obj2, 0, x);
        });

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
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
