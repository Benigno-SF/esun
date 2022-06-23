<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_AprobReqNIS2.aspx.cs" Inherits="SFC_WEB_APP.Mod_Logi.Wfo_AprobReqNIS2" %>

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

        #gridContainer {
            min-height: 60vh;
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

        /*        .cell-background {
            min-height: 30vh;
        }
*/
        .dx-datagrid-headers .dx-header-row {
            color: #fff;
        }

        .dx-button-has-icon .dx-button-content {
            padding: 0px !important;
            font-size: 10px !important;
        }

        .dx-button .dx-button-content {
            padding: 1px 3px !important;
            font-size: 10px !important;
        }

        /*        .dx-datagrid-rowsview {
            overflow: auto; width: 100%; min-height: 15vh !important;
        }*/

        /*        #gridTopScroll {
            width: 1000px;
            height: 20px;
            overflow-x: scroll;
            overflow-y: hidden;
        }*/

        /*        .dx-scrollable-container {
            overflow: auto !important;
        }

        .dx-scrollbar-hoverable {
            display: none;
        }*/

/*        .dx-datagrid-rowsview .dx-row > .dx-master-detail-cell {
            padding: 15px;
            height: 500px !important;
        }

        .dx-scrollable-content {
            padding-bottom: 15px;
            margin-bottom: 15px;
        }

        .dx-datagrid > dx-gridbase-container > dx-datagrid-borders {
            height: 500px !important;
        }

        #DataGrid > div > div.dx-datagrid-rowsview.dx-datagrid-nowrap.dx-fixed-columns.dx-scrollable.dx-visibility-change-handler.dx-scrollable-both.dx-scrollable-simulated > div.dx-datagrid-content.dx-datagrid-content-fixed.dx-pointer-events-target > table > tbody > tr.dx-row.dx-column-lines.dx-master-detail-row > td > div.dx-widget.dx-visibility-change-handler > div {
            height: 450px
        }

        #DataGrid > div > div.dx-datagrid-rowsview.dx-datagrid-nowrap.dx-fixed-columns.dx-scrollable.dx-visibility-change-handler.dx-scrollable-both.dx-scrollable-native.dx-scrollable-native-android.dx-scrollable-scrollbar-simulated > div.dx-datagrid-content.dx-datagrid-content-fixed.dx-pointer-events-target > table > tbody > tr.dx-row.dx-column-lines.dx-master-detail-row > td > div.dx-widget.dx-visibility-change-handler > div {
            height: 450px
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
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnActualizar" class="btn btn-secondary col-12">
                <i class="fa fa-search"></i>Actualizar
            </button>
        </div>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnGuardar">&nbsp;</label>
            <button type="button" id="btnGuardar"  class="btn btn-secondary col-12">
                <i class="fa fa-save"></i> Guardar
            </button>
        </div>
    </div>

    <section id="cell-background" style="height: 100%">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title" id="titletraza">Aprobar Tareo
                               <span id="selected-items-container">[Seleccionados: <span id="_seleccionados">0</span>]</span>&nbsp;<button type="button" id="btn-send" data-tipo="add" class="btn btn-success" style="display: none" data-toggle="modal" data-target="#ModSendSms"><i class="fa fa-paper-sync"></i><span> Aprobar</span></button>
                            
                        </h4>
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
                            <div id="container-x" class="device-mobile-tablet-container" <%--style="min-height: 30vh;"--%>>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

        <div class="modal fade" id="ModSendSms" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">APROBAR TAREOS</h5> 
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="body-sync" >
                    <span>Aprobar Tareos Sellecionados</span><span id="restantes" style="display: none">&nbsp;-&nbsp;Restantes:<b><span id="counttk"></span></b></span>
                    <div class="form-group mb-1 text-center" style="display: none" id="sendutil">
                        <img src="..\img\load_map.gif" width="80px"/>&nbsp;<span id="Nombreinfo" style="font-weight: bold"></span>
                    </div> 
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" id="btnSend" class="btn btn-primary">Aprobar</button>
                </div>
            </div>
        </div>
    </div>

    <script src="../Scripts/sweetalert2.js"></script>
    <script type="text/javascript">
        $(document).on('click', '#btnActualizar', function () {
            cargatabla();
        });



        function cargatabla() {
            var obj = new Object();
            obj.vcPeriodo = '01-09-2021';
            obj.vcSemana = '15-09-2021';
            obj.vcAccion = '1';
            obj.vcId = "";
            obj.vcIdConcepto = "";
            if (obj.vcPeriodo != null && obj.vcSemana != null) {
                $('#syncd').hide();
                $('#container-x').html('<div class="col-md-12 text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                $('#tbl1').hide();
                $('#tbl2').hide();
                $.ajax({
                    type: 'POST',
                    url: "../SerLogi.asmx/ListRequConsumoNisira",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        $('#container-x').fadeIn(1000).html('');

                        if (lst.dh.length != 0) {
                            $('#syncd').hide();
                            $('#tbl1').show();
                            $('#container-x').html('<div id="DataGrid"></div>');
                            var count_cerrados = 0;
                            var count_abiertos = 0;



                            $('#msjtbl1').html(lst.dh[0].IDTAREO + ' ' + lst.dh[0].IDREQUERIMIENTO);
                            DevExpress.localization.locale('es');

                            var dataGridhh = $("#DataGrid").dxDataGrid({
                                dataSource: lst.dh,
                                keyExpr: "IDDOCX",
                                focusedRowEnabled: true,
                                ////focusedRowKey: 117,
                                //filterPanel: { visible: true },
                                selection: {
                                    mode: "multiple",
                                    showCheckBoxesMode: 'always'
                                },
                                showBorders: true,
                                //paging: {
                                //    enabled: false
                                //},
                                //allowColumnReordering: true,
                                //allowColumnResizing: true,
                                columnMinWidth: 100,
                                columnAutoWidth: true,


                                remoteOperations: true,
                                scrolling: {
                                    mode: "virtual",
                                    rowRenderingMode: "virtual"
                                },
                                paging: {
                                    pageSize: 100
                                },
                                headerFilter: {
                                    visible: true,
                                    allowSearch: true
                                },
                                wordWrapEnabled: true,
                                showBorders: true,
                                showRowLines: true,
                                columnFixing: {
                                    enabled: true
                                },
                                columns: [

                                    { caption: "EMPRESA", dataField: "IDEMPRESA" },
                                { caption: "DOC", dataField: "TIPO" },
                                    { caption: "IDDOCX", dataField: "IDDOCX", visible: false,},
                                { caption: "CODIGO", dataField: "CODIGO" },
                                { caption: "CREACION", dataField: "fechacreacion" },
                                { caption: "FECHA", dataField: "FECHA" },
                                { caption: "FECHA ENTREGA", dataField: "FECHA_ENTREGA" },
                                { caption: "AREA", dataField: "AREA" },
                                { caption: "ALMACEN", dataField: "ALMACEN" },
                                    { caption: "OBSERVACION", dataField: "OBSERVACION", width: 350 },
                                { caption: "MONTO", dataField: "MONTO" },
                                    { caption: "PROVEEDOR", dataField: "PROVEEDOR", width: 350  },
                                    { caption: "NOMBRE", dataField: "NOMBRE", width: 250},
                                    { caption: "APROBACION", dataField: "APROBACION", visible: false,},
                                    { caption: "IDESTADO", dataField: "IDESTADO", visible: false,},
                                    { caption: "IDMONEDA", dataField: "IDMONEDA", visible: false,},
                                { caption: "USUARIOAPROBADOR", dataField: "USUARIOAPROBADOR" },
                                    { caption: "IDDOCUMENTO", dataField: "IDDOCUMENTO", visible: false,},
                                {
                                    type: "buttons",
                                    buttons: [
                                        {
                                            icon: "exportselected",
                                            hint: "Syncronizar",
                                            onClick: function (e) {
                                                toastr.success('', 'APROBANDO.... ' + e.row.data.IDTAREO, { timeOut: 9500 });
                                                var obj2x = new Object();
                                                var objx = new Object();
                                                objx.IDTAREO = e.row.data.IDTAREO;
                                                objx.IDREQUERIMIENTO = e.row.data.IDREQUERIMIENTO;
                                                objx.numero = e.row.data.numero;
                                                objx.CESTADO = e.row.data.CESTADO;
                                                obj2x[0] = objx;
                                                declare(obj2x, 0, 0);

                                                e.event.preventDefault();
                                            },
                                            visible: function (e) {
                                                if (e.row.data.APROBACION == 'AP') {
                                                    return true;
                                                } else {
                                                    return true
                                                }
                                            }
                                        }
                                    ]
                                }],
                                onCellPrepared: function (e) {
                                    if (e.rowType === 'header') {
                                        e.cellElement.css("backgroundColor", "#52617b" /*"#2f394a"*/);
                                        e.cellElement.css("color", "#fff");
                                    }
                                },
                                onSelectionChanged: function (selectedItems) {
                                    selected = selectedItems.selectedRowsData;
                                    $("#_seleccionados").text(selected.length);

                                    changedBySelectBox = false;
                                    var data = selectedItems.selectedRowsData;
                                    if (data.length > 0)

                                        cad_id = $.map(data, function (value) {
                                            return value.IDDOCX;
                                        }).join(";")
                                    else
                                        cad_id = '';
                                    $("#Div_close_part").hide();
                                    var elements = cad_id.split(';');
                                    $('#selx').text(elements.length);
                                    if (!changedBySelectBox)
                                        changedBySelectBox = false;
                                    if (cad_id != '') {
                                        $("#Div_close_part").show();
                                        $("#btn-send").show();
                                    } else {
                                        $("#Div_close_part").hide();

                                        $("#btn-send").hide();
                                    }
                                },
                                masterDetail: {
                                    enabled: true,
                                    //autoExpandAll: true,
                                    template: function (container, options) {
                                        // var currentData = options.data;
                                        $("<div>")
                                            .addClass("master-detail-caption")
                                            .text('')
                                            .appendTo(container);

                                        $("<div>")
                                            .dxDataGrid({
                                                columnAutoWidth: true,
                                                showBorders: true,
                                                scrolling: {
                                                    mode: "virtual"
                                                },
                                                columns: [
                                                    //{
                                                    //    caption: '#',
                                                    //    cellTemplate: function (cellElement, cellInfo) {
                                                    //        cellElement.text(cellInfo.row.rowIndex + 1)
                                                    //    }
                                                    //},
                                                    { caption: "IDEMPRESA", dataField: "IDEMPRESA" },
                                                    { caption: "IDDOCX	", dataField: "IDDOCX	" },
                                                    { caption: "ITEM", dataField: "ITEM" },
                                                    { caption: "IDPRODUCTO", dataField: "IDPRODUCTO" },
                                                    { caption: "DESCRIPCION", dataField: "DESCRIPCION" },
                                                    { caption: "IDMEDIDA", dataField: "IDMEDIDA" },
                                                    { caption: "CANTIDAD", dataField: "CANTIDAD" },
                                                    { caption: "precio_unitario", dataField: "precio_unitario" },
                                                    { caption: "total", dataField: "total" },
                                                    { caption: "PROVEEDOR", dataField: "PROVEEDOR" },
                                                    { caption: "PARAFECHA", dataField: "PARAFECHA" }
                                                ],
                                                onCellPrepared: function (e) {
                                                    if (e.rowType === 'header') {
                                                        e.cellElement.css("backgroundColor", "#657790" /*"#2f394a"*/);
                                                        e.cellElement.css("color", "#fff");
                                                    }
                                                },
                                                dataSource: new DevExpress.data.DataSource({
                                                    store: new DevExpress.data.ArrayStore({
                                                        key: "IDDOCX",
                                                        data: lst.dd,
                                                    }),
                                                    filter: ["IDDOCX", "=", options.key]
                                                })
                                            }).appendTo(container);
                                    }
                                }
                            }).dxDataGrid("instance");
                            $('#syncd').show();
                        } else {
                            $('#msjtbl1').html();

                            $('#tbl1').hide();
                            $('#container-x').html('');
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
