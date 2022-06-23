<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_SyncTareo.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_SyncTareo" %>

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
        table {
            border-spacing: 0;
            border-collapse: collapse;
            width: 100%;
            margin: 0 auto;
        }

        .table th {
            padding: 0.65rem 1rem;
            font-size: 10px
        }

        .table td {
            padding: 0.65rem 0.65rem !important;
            font-size: 10px
        }

        .bolded {
            font-weight: bold;
        }

        .dataex-html5-background {
            height: 500px;
        }

        #DataGrid {
            font-size: 10px;
            font-weight: bold;
        }

        .dx-datagrid-content .dx-datagrid-table .dx-row > td, .dx-datagrid-content .dx-datagrid-table .dx-row > tr > td {
            font-size: 10px;
        }

        #DataGridh, #DataGridd , #DataGridf, #DataGrida {
            max-height: 350px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdDLL1" style="width: -webkit-fill-available;" class="col-md-12">
        <ContentTemplate>
            <div class="row">
                <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                    <label for="ddlAnio" class="col-form-label">Año</label>
                    <asp:DropDownList ID="ddlAnio" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAnio_SelectedIndexChanged"></asp:DropDownList>
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
                    <button type="button" id="SyncTareo" runat="server" class="btn btn-secondary col-12">
                        <i class="fa fa-sync"></i>Sincronizar
                    </button>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlAnio" />
        </Triggers>
    </asp:UpdatePanel>

    <div id="accordion">
        <div id="charge"></div>
        <div class="card m-0" id="tbl1" style="display: none">
            <div class="card-header p-0" id="headingOne">
                <h5 class="mb-0">
                    <a class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Errores del tareo  <span id="msjtbl1"></span>
                    </a>
                </h5>
            </div>
            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="card-body" id="container-w">
                </div>
            </div>
        </div>

        <div class="card m-0" id="tbl2" style="display: none">
            <div class="card-header p-0" id="headingTwo">
                <h5 class="mb-0">
                    <a class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Tareo por Jornal
                    </a>
                </h5>
            </div>
            <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordion">
                <div class="card-body" id="container-x">
                </div>
            </div>
        </div>

        <div class="card m-0" id="tbl3" style="display: none">
            <div class="card-header p-0" id="headingThree">
                <h5 class="mb-0">
                    <a class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Tareo por Rendimiento
                    </a>
                </h5>
            </div>
            <div id="collapseThree" class="collapse show" aria-labelledby="headingThree" data-parent="#accordion">
                <div class="card-body" id="container-y">
                </div>
            </div>
        </div>

        <div class="card m-0" id="tbl4" style="display: none">
            <div class="card-header p-0" id="headingFour">
                <h5 class="mb-0">
                    <a class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseThree">Tareos Adicionales
                    </a>
                </h5>
            </div>
            <div id="collapseFour" class="collapse show" aria-labelledby="headingFour" data-parent="#accordion">
                <div class="card-body" id="container-z">
                </div>
            </div>
        </div>
    </div>

    <script src="../Scripts/sweetalert2.js"></script>
    <script type="text/javascript">
        $(document).on('click', '#<%=btnRec.ClientID%>', function () {
            cargatabla();
        });

        $(document).on('click', '#<%=SyncTareo.ClientID%>', function () {
            SyncTareo();
        });

        function cargatabla() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcAnio = $('#<%=ddlAnio.ClientID%>').val();
            obj.vcSemana = $('#<%=ddlSemana.ClientID%>').val();
            if (obj.vcIdEmpresa != null && obj.vcAnio != null && obj.vcSemana != null) {
                $('#syncd').hide();
                $('#charge').html('<div class="col-md-12 text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                $('#tbl1').hide();
                $('#tbl2').hide();
                $('#tbl3').hide();
                $('#tbl4').hide();
                $('#container-w').html('');
                $('#container-x').html('');
                $('#container-y').html('');
                $('#container-z').html('');
                $.ajax({
                    type: 'POST',
                    url: "../SerRRHH.asmx/ListVisualizaTareo",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        $('#charge').fadeIn(1000).html('');

                        if (lst.dh.length != 0) {
                            $('#syncd').hide();
                            $('#tbl1').show();
                            $('#container-w').html('<div id="DataGridh"></div>');
                            var count_cerrados = 0;
                            var count_abiertos = 0;
                            var total = 0;
                            for (var x = 0; x < lst.dh.length; x++) {
                                total = total + 1;
                            }
                            $('#msjtbl1').html(' - ' + total + ' errores encontrados');

                            var dataGridhh = $("#DataGridh").dxDataGrid({
                                dataSource: lst.dh,
                                showBorders: true,
                                scrolling: {
                                    mode: "virtual"
                                },
                                allowColumnReordering: true,
                                allowColumnResizing: true,
                                columnMinWidth: 30,
                                columnAutoWidth: true,
                                export: {
                                    enabled: true,
                                    fileName: "Reporte Errores Tareos"
                                },
                                columns: [
                                    { caption: "Nombre Estructura", dataField: "Nombre Estructura", visible: false }
                                    , { caption: "Cerrado?", dataField: "Cerrado" }
                                    , { caption: "Observacion", dataField: "Observacion" }
                                    , { caption: "Planilla", dataField: "NIS_PLANILLA" }
                                    , { caption: "Turno", dataField: "NIS_TURNO" }
                                    , { caption: "Cod Trabajador", dataField: "NIS_COD_TRABAJADOR" }
                                    , { caption: "Trabajador", dataField: "NIS_TRABAJADOR" }
                                    , { caption: "Periodo", dataField: "NIS_PERIODO" }
                                    , { caption: "Cod Actividad", dataField: "NIS_COD_ACTIVIDAD" }
                                    , { caption: "Cod Labor", dataField: "NIS_COD_LABOR" }
                                    , { caption: "Cod Consumidor", dataField: "NIS_COD_CONSUMIDOR" }
                                    , { caption: "Cod Ord Produccion", dataField: "NIS_COD_ORDEN_PRODUCCION" }
                                    , { caption: "Tipo Asistencia", dataField: "NIS_TIPO_ASISTENCIA" }
                                    , { caption: "Horas Rend", dataField: "NIS_HORAS_REND" }
                                    , { caption: "Fecha", dataField: "NIS_FECHA" }
                                    , { caption: "dia", dataField: "dia" }
                                    , { caption: "Cultivo", dataField: "CULTIVO" }
                                    , { caption: "Id Actividad", dataField: "ID_ACTIVIDAD" }
                                ]
                            })
                            $('#syncd').show();
                        } else {
                            $('#msjtbl1').html();

                            $('#tbl1').hide();
                            $('#container-w').html('');
                            $('#syncd').show();
                        }

                        if (lst.dd.length != 0) {
                            $('#tbl2').show();
                            $('#container-x').html('<div id="DataGridd"></div>');
                            TbDataGrid(lst.dd, 'd');
                        } else {
                            $('#tbl2').hide();
                            $('#container-x').html('');
                        }

                        if (lst.df.length != 0) {
                            $('#tbl3').show();
                            $('#container-y').html('<div id="DataGridf"></div>');
                            TbDataGrid(lst.df, 'f');
                        } else {
                            $('#tbl3').hide();
                            $('#container-y').html('');
                        }

                        if (lst.da.length != 0) {
                            $('#tbl4').show();
                            $('#container-z').html('<div id="DataGrida"></div>');
                            TbDataGrid(lst.da, 'a');
                        } else {
                            $('#tbl4').hide();
                            $('#container-z').html('');
                        }

                        if (lst.dd.length == 0 && lst.df.length == 0) {
                            $('#syncd').hide();
                        }

                    }, error: function (data) {
                        alert(JSON.stringify(data));
                    },
                });
            } else {
                toastr.error('Seleccione Año Y Semana', '');
            }
        }

        function TbDataGrid(data, id) {
            DevExpress.localization.locale('es');
            if (id != 'a') {
                var dataGrid = $("#DataGrid" + id).dxDataGrid({
                    dataSource: data,
                    showBorders: true,
                    scrolling: {
                        mode: "virtual"
                    },
                    height: '350',
                    allowColumnReordering: true,
                    allowColumnResizing: true,
                    columnMinWidth: 30,
                    columnAutoWidth: true,
                    export: {
                        enabled: true,
                        fileName: "Reporte Tareos"
                    },
                    columns: [
                        { caption: "Nombre Estructura", dataField: "Nombre Estructura", visible: false }
                        , { caption: "Cerrado?", dataField: "Cerrado" }
                        , { caption: "Planilla", dataField: "NIS_PLANILLA" }
                        , { caption: "Turno", dataField: "NIS_TURNO" }
                        , { caption: "Cod Trabajador", dataField: "NIS_COD_TRABAJADOR" }
                        , { caption: "Trabajador", dataField: "NIS_TRABAJADOR" }
                        , { caption: "Periodo", dataField: "NIS_PERIODO" }
                        , { caption: "Cod Actividad", dataField: "NIS_COD_ACTIVIDAD" }
                        , { caption: "Cod Labor", dataField: "NIS_COD_LABOR" }
                        , { caption: "Cod Consumidor", dataField: "NIS_COD_CONSUMIDOR" }
                        , { caption: "Cod Ord Produccion", dataField: "NIS_COD_ORDEN_PRODUCCION" }
                        , { caption: "Tipo Asistencia", dataField: "NIS_TIPO_ASISTENCIA" }
                        , { caption: "Lunes", dataField: "D1" }
                        , { caption: "Martes", dataField: "D2" }
                        , { caption: "Miercoles", dataField: "D3" }
                        , { caption: "Jueves", dataField: "D4" }
                        , { caption: "Viernes", dataField: "D5" }
                        , { caption: "Sabado", dataField: "D6" }
                        , { caption: "Domingo", dataField: "D7" }
                    ]
                })
            } else {

                var dataGrid = $("#DataGrid" + id).dxDataGrid({
                    dataSource: data,
                    showBorders: true,
                    scrolling: {
                        mode: "virtual"
                    },
                    height: '350',
                    allowColumnReordering: true,
                    allowColumnResizing: true,
                    columnMinWidth: 30,
                    columnAutoWidth: true,
                    export: {
                        enabled: true,
                        fileName: "Reporte Traeos Adicionales"
                    },
                    columns: [
                        { caption: "Nombre Estructura", dataField: "Nombre Estructura", visible: false }
                        , { caption: "Cerrado?", dataField: "Cerrado" }
                        , { caption: "Cod Trabajador", dataField: "NIS_COD_TRABAJADOR" }
                        , { caption: "Trabajador", dataField: "NIS_TRABAJADOR" }
                        , { caption: "Concepto", dataField: "Concepto" }
                        , { caption: "Nro Tareas Adic", dataField: "NRO_TAREAS_ADIC" }
                    ]
                })
            }
        };

        function SyncTareo() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcAnio = $('#<%=ddlAnio.ClientID%>').val();
            obj.vcSemana = $('#<%=ddlSemana.ClientID%>').val();

            if (obj.vcIdEmpresa != null && obj.vcAnio != null && obj.vcSemana != null && obj.vcAnio != '0' && obj.vcSemana != '0') {
                console.log("realizar la insercion");
                /*
                Swal.fire({
                    title: 'Sincronizar Tareo?',
                    text: "Iniciara la Sincronización de tareo!",
                    icon: 'question',
                    showCancelButton: true,
                    allowOutsideClick: false,
                    confirmButtonColor: '#218838',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Sí, Sincronizar!',
                    timer: 10000000,
                    cancelButtonText: 'Cancelar',
                    showLoaderOnConfirm: true,
                    allowOutsideClick: () => !Swal.isLoading(),
                    preConfirm: function () {
                        return $.ajax({
                            type: 'POST',
                            url: "../SerRRHH.asmx/SyncTareo",
                            timeout: 10000000,
                            data: JSON.stringify({ obj: obj }),
                            dataType: 'json',
                            contentType: 'application/json; charset=utf-8',
                            success: function (data) { },
                            error: function (error) { }
                        });
                    }
                }).then((result) => {
                    if (result.value) {
                        if (result.value.d != null) {
                            var lst = JSON.parse(result.value.d);

                            Swal.fire({
                                title: `${lst[0].msg}`,
                            })
                            cargatabla();
                        } else {

                            Swal.fire({
                                title: `Verificar Sincronizacion`,
                            })
                            cargatabla();
                        }
                    }
                })*/

            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
