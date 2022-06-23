<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_DetalleProceso.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Wfo_DetalleProceso" %>

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
    <!-- END: Vendor CSS-->
    <style>


.dx-freespace-row {  
           height: 0px !important;  
        }  

        #DataGrid {
            height: 70vh;
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
            height: 70vh;
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
        
        #DataGrid {
            font-size: 15px;
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
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0" id="DivFeCont">
            <label for="txtFeCont">Fecha Inicio</label>
            <input type="text" id="txtFeCont" name="txtFeCont" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
            <script type="text/javascript">
                $(function () {
                    $('#txtFeCont').datetimepicker({
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
        <asp:UpdatePanel runat="server" ID="UpdDLL1" style="width: -webkit-fill-available; display: contents">
            <ContentTemplate>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0">
                            <label for="message-text">Area:</label>
                            <asp:DropDownList ID="ddlArea" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlArea_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0">
                            <label for="message-text">Linea:</label>
                            <asp:DropDownList ID="ddlAreaGrupo" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlArea" />
            </Triggers>
        </asp:UpdatePanel>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0" style="display: none">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnBusc2" class="btn btn-secondary col-12">
                <i class="fas fa-search"></i>Buscar
            </button>
        </div>
<%--        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="btnAdd">&nbsp;</label>
            <button type="button" id="btnAdd" class="btn btn-warning col-12" data-toggle="modal" data-target="#modalAdd">
                <i class="fa fa-plus"></i>Castigar Cajas
            </button>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="btnAdd">&nbsp;</label>
            <button type="button" id="btnRep" class="btn btn-primary col-12" data-toggle="modal" data-target="#modalRepo">
                <i class="fas fa-plus"></i>Generar Reporte
            </button>
        </div>--%>
    </div>
    
    
    <br />
        <section id="cell-background" style="height:80vh;">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Reporte Avance Proceso Detallado </h4>
                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li id="btn-excel2""><button type="button" id="btnBusc" class="btn btn-secondary col-12"><i class="fas fa-search"></i>Buscar </button></li>
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

        <div class="modal fade" id="EditProcesoDetalle" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Detalle Proceso</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group p-0 m-0">
                        <label for="ddlAProceso" class="col-form-label">Area de Proceso</label>
                        <asp:DropDownList ID="ddlAProceso" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlArea_m_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Linea:</label>
                        <asp:DropDownList ID="ddlAreaGrupo_m" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Cliente:</label>
                        <asp:DropDownList ID="ddlCliente" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Cultivo:</label>
                        <asp:DropDownList ID="ddlCultivo" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Variedad:</label>
                        <asp:DropDownList ID="ddlVariedad" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Embalaje:</label>
                        <asp:DropDownList ID="ddlEmbalaje" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Supervisor:</label>
                        <asp:DropDownList ID="ddlSupervisor" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group" style="display: none">
                        <label for="recipient-name" class="col-form-label">Fecha Evento:</label>
                        <input type="text" id="FechaIni" class="form-control round" value="" autocomplete="off" placeholder="dd/mm/yyyy">
                        <script type="text/javascript">
                            $(function () {
                                $('#FechaIni').datetimepicker({
                                    format: 'DD/MM/YYYY hh:mm:ss',
                                    locale: 'es'
                                });
                                $(function () {
                                    $('#FechaIni').datetimepicker({
                                        format: 'DD/MM/YYYY hh:mm:ss',
                                        locale: 'es'
                                    });
                                });
                            });
                        </script>
                    </div>
                    <div class="form-group" style="display: none">
                        <label for="recipient-name" class="col-form-label">Fecha Evento:</label>
                        <input type="text" id="FechaFin" class="form-control round" value="" autocomplete="off" placeholder="dd/mm/yyyy">
                        <script type="text/javascript">
                            $(function () {
                                $('#FechaFin').datetimepicker({
                                    format: 'DD/MM/YYYY hh:mm:ss',
                                    locale: 'es'
                                });
                                $(function () {
                                    $('#FechaFin').datetimepicker({
                                        format: 'DD/MM/YYYY hh:mm:ss',
                                        locale: 'es'
                                    });
                                });
                            });
                        </script>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="proceso" value="0">
                    <input type="hidden" id="procesodetalle" value="0">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" id="btnUpdate" class="btn btn-primary">Actualizar</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).on('click', '#btnUpdate', function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdArea = $("#<%=ddlAProceso.ClientID%> :selected").val();
            obj.vnIdGrupo = $("#<%=ddlAreaGrupo_m.ClientID%> :selected").val();
            obj.vnIdProceso = $("#proceso").val();
            obj.vnIdProcesoDetalle = $("#procesodetalle").val();
            obj.vnIdClieProv = $("#<%=ddlCliente.ClientID%> :selected").val();
            obj.vnIdEmbalaje = $("#<%=ddlEmbalaje.ClientID%> :selected").val();
            obj.vnIdCultivo = $("#<%=ddlCultivo.ClientID%> :selected").val();
            obj.vnIdVariedad = $("#<%=ddlVariedad.ClientID%> :selected").val();
            obj.vnIdsupervisor = $("#<%=ddlSupervisor.ClientID%> :selected").val();


            if (obj.vnIdProceso != '' && obj.vnIdprocesoDetalle != '' && obj.vnIdArea != '' && obj.vnIdGrupo != '' && obj.vnIdClieProv != '' && obj.vnIdEmbalaje != '' && obj.vnIdCultivo != '' && obj.vnIdVariedad != '' && obj.vnIdsupervisor != '') {
                
                $.ajax({
                    type: 'POST',
                    url: "../SerProd.asmx/ListRendimientoProcesoDetalle_update",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst != '') {
                            if (lst[0].job == 1) {
                                toastr["success"]('', "Actualizado");
                                $('#EditProcesoDetalle').modal('hide');
                                cargatabla();
                            } else {
                                toastr["error"]('Proceso: ' + lst[0].proceso + ' Detalle:' + lst[0].detalle, "No Actualizado");
                            }
                        }
                    }
                });
            }

        });



        function EditDetalleProceso(nIdProceso, nIdprocesoDetalle, nIdArea) {
                var obj = new Object();
                obj.vcIdEmpresa = fuGetCdEmpre();
            if (nIdProceso != '' && nIdprocesoDetalle != '' && nIdArea != '') {
                    obj.vnIdProceso = nIdProceso;
                    obj.vnIdProcesoDetalle = nIdprocesoDetalle;
                    obj.vnIdArea = nIdArea;
                    obj.vnIdGrupo = 0;
                    $.ajax({
                        type: 'POST',
                        url: "../SerProd.asmx/ReadRendimientoProcesoDetalle",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            if (lst != '') {
                                // $('#CodeHead').val('');
                                // $('#CodeHead').hide();
                                var area = lst[0].nIdArea;
                                var linea = lst[0].nIdGrupo;
                                var proceso = lst[0].nIdProceso;
                                var procesodetalle = lst[0].nIdProcesoDetalle;
                                var namelinea = lst[0].cDescAGrupo;
                                var cliente = lst[0].nIdClieProv;
                                var embalaje = lst[0].nIdEmbalaje;
                                var cultivo = lst[0].nIdCultivo;
                                var variedad = lst[0].nIdVariedad;
                                var supervisor = lst[0].nIdsupervisor;
                                var fechaini = lst[0].dFechaIni;
                                var fechafin = lst[0].dFechaFin;
                                if (area != "" && linea != "" && cliente != "" && embalaje != "" && cultivo != "" && variedad != "" && supervisor != "") {
                  
                                $("#<%=ddlAProceso.ClientID%>").val(area);
                                Load_Agrupo(area, linea, namelinea);
                                $("#<%=ddlCliente.ClientID%>").val(cliente);
                                $("#<%=ddlCultivo.ClientID%>").val(cultivo);
                                $("#<%=ddlSupervisor.ClientID%>").val(supervisor);
                                Load_Variedad(cultivo, variedad);
                                Load_Embalaje(cultivo, embalaje);


                                $('#proceso').val(proceso);
                                $('#procesodetalle').val(procesodetalle);
                                $('#FechaIni').val(fechaini);
                                $('#FechaFin').val(fechafin);

                                $('#infolinea').text(namelinea + ' - ' + $("#<%=ddlSupervisor.ClientID%> :selected").text());

                                $('#EditProcesoDetalle').modal('show');

                            }
                            else {
                                ShowToast("error", "Error...", "Detalle no contiene todos los parametros");
                                document.getElementById("CodeBar").autofocus;
                                $('#qrcode').empty();
                                $('#txtcode').text('');
                            }
                        } else {
                            toastr["error"]('', "No se ha Iniciado Proceso")
                            $('#qrcode').empty();
                            $('#txtcode').text('');
                        }
                    },
                    error: function (error) {
                        if (error.status == '401') {
                            window.location.reload();
                        } else {
                            alert(JSON.stringify(error));
                        }
                    }
                });
            } else {
                ShowToast("error", "Error...", "Empresa no activo");
            }
        };


        $("#btnBusc").click(function () {
            cargatabla();
        });


        function cargatabla() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdProceso = '0';
            obj.vnIdArea = $('#<%=ddlArea.ClientID%>').val();
            obj.vnIdGrupo = $('#<%=ddlAreaGrupo.ClientID%>').val();
            obj.vcFecha = $("#txtFeCont").val();
            //  var f = new Date();
            //alert(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
            if (obj.vcIdEmpresa != '' && obj.vnIdArea != 0) {
                $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                $.ajax({
                    type: 'POST',
                    url: "../SerProd.asmx/ListRendimientoProcesoDetalleRepo",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    error: function () {
                        $('#activos').hide();
                    },
                    success: function (data) {
                        var lst = JSON.parse(data.d);  
                        $('#container-x').html('<div class="options"><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="DataGrid"></div>');
                        TbDataGrid(lst, obj.vcFecha);

                    },
                    error: function (data) {
                        alert(JSON.stringify(data));
                    },
                    timeout: 50000
                });
            } else {
                toastr.error('error', 'SELECCIONE AREA', '')
            }
        }

        function TbDataGrid(data, vfecha) {
            DevExpress.localization.locale('es');

            var dataGrid = $("#DataGrid").dxDataGrid({
                dataSource: data.dh,
                keyExpr: "nIdProcesoDetalle",
                scrolling: {
                    mode: "virtual"
                },
                grouping: {
                    autoExpandAll: false
                },
                groupPanel: {
                    visible: true,
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
                    fileName: "Reporte Rendimiento"
                },

                filterRow: {
                    visible: true,
                    applyFilter: "auto"
                },
                filterRow: { visible: true },
                filterPanel: { visible: true },
                headerFilter: { visible: true },
                //filterValue: [["dia1", "<>", "0"]],
                //filterBuilderPopup: {
                //    position: { of: window, at: "top", my: "top", offset: { y: 10 } },
                //},
                searchPanel: {
                    visible: false,
                    placeholder: "Search..."
                },
                headerFilter: {
                    visible: false
                },
                //  groupIndex: 0,
                columns: [

                    //  { caption: "", dataField: "", width: 150, visible: false }
                     { caption: "nIdArea", dataField: "nIdArea" }
                    , { caption: "nIdProceso", dataField: "nIdProceso" }
                    , { caption: "nIdProcesoDetalle", dataField: "nIdProcesoDetalle" }
                    , { caption: "Linea", dataField: "cDescAGrupo" }
                    , { caption: "Supervisor", dataField: "supervisor" }
                    , { caption: "Productor", dataField: "cDescClieProv" }
                    , { caption: "Presentacion", dataField: "cDesEmbalaje" }
                    , { caption: "Cultivo", dataField: "cDesCultivo" }
                    , { caption: "Variedad", dataField: "cDescVariedad" }
                    , { caption: "FechaIni", dataField: "dFechaIni", dataType: "date", format: 'dd/MM/yyyy HH:mm:ss'  }
                    , { caption: "FechaFin", dataField: "dFechaFin", dataType: "date", format: 'dd/MM/yyyy HH:mm:ss' }
                    , { caption: "Ult. Etiqueta Leida", dataField: "UltEtiqueta", dataType: "date", format: 'dd/MM/yyyy HH:mm:ss' }
                    , { caption: "Clamshell", dataField: "Clamshell" }
                    , { caption: "Embalaje", dataField: "Embalaje"}
                    , { caption: "Seleccion", dataField: "Seleccion" }
                    , { caption: "Total", dataField: "Personas" }
                   // nIdProceso	nIdProcesoDetalle	nIdGrupo	cDescAGrupo	nIdsupervisor	supervisor	nIdClieProv	cDescClieProv	nIdEmbalaje	cDesEmbalaje	nIdCultivo	cDesCultivo	nIdVariedad	cDescVariedad	dFechaIni	dFechaFin	UltEtiqueta	Seleccion	Embalaje	Personas

                    , {
                        type: "buttons",
                        buttons: [
                            {
                                icon: "exportselected",
                                hint: "Generar",
                                onClick: function (e) {
                                    GenerateOE(e.row.data.nIdProceso, e.row.data.nIdProcesoDetalle, e.row.data.nIdArea);
                                    e.event.preventDefault();
                                },
                                visible: function (e) {
                                        return false;
                                }
                            },
                            {
                                icon: "edit",
                                hint: "Editar",
                                onClick: function (e) {
                                    EditDetalleProceso(e.row.data.nIdProceso, e.row.data.nIdProcesoDetalle, e.row.data.nIdArea);
                                    e.event.preventDefault();
                                },
                                visible: function (e) {
                                        return true;
                                }
                            }
                        ]
                    }
                ],
                sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }],
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
                                    { caption: "nIdProceso", dataField: "nIdProceso" },
                                    { caption: "nIdProcesoDetalle", dataField: "nIdProcesoDetalle" },
                                    { caption: "nIdPersonal	", dataField: "nIdPersonal" },
                                    { caption: "cNroDocumento", dataField: "cNroDocumento" },
                                    { caption: "cNombres", dataField: "cNombres" },
                                    { caption: "cApPaterno", dataField: "cApPaterno" },
                                    { caption: "cApMaterno", dataField: "cApMaterno" },
                                    { caption: "Funcion", dataField: "cCodigoLabor" },
                                    { caption: "Labor Realizada", dataField: "cLabor" },
                                    { caption: "etiquetas", dataField: "etiquetas" }
                                ],
                                onCellPrepared: function (e) {
                                    if (e.rowType === 'header') {
                                        e.cellElement.css("backgroundColor", "#657790" /*"#2f394a"*/);
                                        e.cellElement.css("color", "#fff");
                                    }
                                },
                                dataSource: new DevExpress.data.DataSource({
                                    store: new DevExpress.data.ArrayStore({
                                        key: "nIdProcesoDetalle",
                                        data: data.dd,
                                    }),
                                    filter: ["nIdProcesoDetalle", "=", options.key]
                                })
                            }).appendTo(container);
                    }
                },
                onCellPrepared: function (e) {
                    if (e.rowType === 'header') {
                        e.cellElement.css("backgroundColor", "#657790" /*"#2f394a"*/);
                        e.cellElement.css("color", "#fff");
                    }
                }
            }).dxDataGrid("instance");

            $("#autoExpand").dxCheckBox({
                value: false,
                text: "Expandir todos los grupos",
                onValueChanged: function (data) {
                    dataGrid.option("grouping.autoExpandAll", data.value);
                }
            });

            $("#filterRow").dxCheckBox({
                text: "Filtro de filas",
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


        function clearProceso() {
            $('#msg').text('error al obtener proceso');
            var btn = document.getElementById("Read");
            var tipo = btn.getAttribute("data-tipo");
            $('#lector').hide();
            // $('#info').show();

            btn.setAttribute("data-tipo", 'add');
            $("#btnSave").html('<i class="fas fa-edit"></i> Iniciar Lectura');


            $("#<%=ddlAProceso.ClientID%>").val('0');
            $("#<%=ddlAreaGrupo.ClientID%>").val('0');
            $("#<%=ddlEmbalaje.ClientID%>").val('0');
            $("#<%=ddlCliente.ClientID%>").val('0');
            $("#<%=ddlCultivo.ClientID%>").val('0');
            $("#<%=ddlVariedad.ClientID%>").val('0');
            $("#<%=ddlSupervisor.ClientID%>").val('0');

            $('#proceso').val(0);
            $('#procesodetalle').val(0);

            window.location.reload();
            return false;
        }


        //function askConfirmation(evt) {
        //    var msg = 'Si recarga la página perdera todos los datos ingresados.\n¿Deseas recargar la página?';
        //    evt.returnValue = msg;
        //    return msg;
        //}
        //window.addEventListener('beforeunload', askConfirmation);

        $('body').on('change', '#<%=ddlAProceso.ClientID%>', function () {
            var id = $(this).val();
            Load_Agrupo(id, 0, '');
        });

        function Load_Agrupo(id, idgru, namegru) {

            if (id != '' && idgru != '' && namegru != '') {
                var obj = new Object();
                obj.vcIdEmpresa = fuGetCdEmpre();
                obj.vnIdArea = id;
                $.ajax({
                    type: 'POST',
                    url: "../SerProd.asmx/AGrupoList",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        $("#<%=ddlAreaGrupo_m.ClientID%>").html('');
                        if (lst.length != '0') {
                            var option = "";
                            option += '<option value="0">Seleccione Linea</option>';

                            for (i = 0; i < lst.length; ++i) {
                                option += '<option value="' + lst[i].nIdGrupo + '">' + lst[i].cDescAGrupo + '</option>';
                            }
                            $("#<%=ddlAreaGrupo_m.ClientID%>").append(option);
                            $("#<%=ddlAreaGrupo_m.ClientID%>").val(idgru);
                        } else {
                            $("#<%=ddlAreaGrupo_m.ClientID%>").html('');
                        }

                    },
                    error: function (error) {
                        toastr.error(JSON.stringify(error), '');
                    }
                });
            } else {
                alert('algo mal' + ' ' + id + ' ' + idgru + ' ' + namegru)
            }
        }

        $('body').on('change', '#<%=ddlCultivo.ClientID%>', function () {
            var id = $(this).val();
            Load_Variedad(id, 0);
            Load_Embalaje(id, 0);
        });

        function Load_Variedad(id, idva) {

            if (id != '' && idva != '') {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdCultivo = id;
            obj.vnIdVariedad = '0';
            $.ajax({
                type: 'POST',
                url: "../SerComex.asmx/VariedadList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    $("#<%=ddlVariedad.ClientID%>").html('');
                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0">Seleccione Variedad</option>';
                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdVariedad + '">' + lst[i].cDescVariedad + '</option>';
                        }
                        $("#<%=ddlVariedad.ClientID%>").append(option);
                        $("#<%=ddlVariedad.ClientID%>").val(idva);
                    } else {
                        $("#<%=ddlVariedad.ClientID%>").html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
            } else {
                alert('algo mal' + ' ' + id + ' ' + idva)
            }
        }

        function Load_Embalaje(id, idem) {

            if (id != '' && idem != '') {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdCultivo = id;
            obj.vnIdEmbalaje = '0';
            $.ajax({
                type: 'POST',
                url: "../SerComex.asmx/EmbalajeList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    $("#<%=ddlEmbalaje.ClientID%>").html('');
                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0">Seleccione Embalaje</option>';
                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdEmbalaje + '">' + lst[i].cDesEmbalaje + '</option>';
                        }
                        $("#<%=ddlEmbalaje.ClientID%>").append(option);
                        $("#<%=ddlEmbalaje.ClientID%>").val(idem);
                    } else {
                        $("#<%=ddlEmbalaje.ClientID%>").html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
            } else {
                alert('algo mal' + ' ' + id + ' ' + idem)
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
