<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_InformeTareaCampo.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_InformeTareaCampo" %>

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
    <style>
        .options {
            padding: 10px;
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
            padding: 12px;
        }

        #DataGrid {
            font-size: 10px;
            font-weight: bold;
            width: 100%;
        }

        /*            #gridContainer {
                height: 440px;
            }

            #DataGrid {
                height: 520px;
                width: 100%;
            }*/
        .dx-datagrid-content .dx-datagrid-table .dx-row > td, .dx-datagrid-content .dx-datagrid-table .dx-row > tr > td {
            font-size: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2" id="DivFeInicio">
            <label for="txtFeInicio">Fecha</label>
            <input type="text" id="txtFeInicio" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
            <script type="text/javascript">
                $(function () {
                    $('#<%=txtFeInicio.ClientID %>').datetimepicker({
                        format: 'DD/MM/YYYY',
                        locale: 'es'
                    });
                    $(function () {
                        $('#DivFeInicio').datetimepicker({
                            format: 'DD/MM/YYYY',
                            locale: 'es'
                        });
                    });
                });
            </script>
        </div>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnBusc" runat="server" class="btn btn-secondary col-12">
                <i class="fa fa-search"></i>Recuperar
            </button>
        </div>
        <div id="Div_close_part" class="form-group col-6 col-sm-6 col-md-5 col-lg-2" style="display: none">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="close_part" runat="server" class="btn btn-secondary col-12">
                <i class="fa fa-save"></i>Cerrar Partes
            </button>
        </div>
    </div>
    <section id="cell-background" style="height: 100%">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Partes de Campo Pendientes de Aprobacion</h4>
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
    <div id="datad"></div>
    <script>
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
            obj.vcFecha = $("#<%=txtFeInicio.ClientID%>").val();
            //var tmp = null;
            $.ajax({
                type: 'POST',
                url: "../SerRRHH.asmx/InformeTareasCampo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var tmp = JSON.parse(data.d);
                    $('#container-x').html('<div id="gridContainer"></div>');
                    CargaGrid(tmp);
                }
            });
        }
        DevExpress.localization.locale('es');
        function CargaGrid(lst) {
            $("#gridContainer").dxDataGrid({
                dataSource: lst.EjecucionTarea,
                selection: {
                    mode: "multiple",
                    showCheckBoxesMode: "always"
                },
                grouping: {
                    contextMenuEnabled: true,
                    autoExpandAll: false
                },
                groupPanel: {
                    visible: true   // or "auto"
                },
                keyExpr: "Id",
                showBorders: true,
                columns: [
                    { dataField: "Id", caption: "Id", visible: false },
                    { dataField: "Serie", caption: "Serie", width: "10%" },
                    { dataField: "Numero", caption: "Numero", width: "10%" },
                    { dataField: "Fecha", caption: "Fecha", width: "15%", dataType: "date", format: "dd/MM/yyyy" },
                    { dataField: "Codigo", caption: "Codigo Tarea", width: "15%" },
                    { dataField: "Nombre", caption: "Nombre Tarea", width: "40%", groupIndex: 0, },
                ],
                masterDetail: {
                    enabled: true,
                    template: function (container, options) {
                        var currentEmployeeData = options.data;

                        $("<div>")
                            .addClass("master-detail-caption")
                            .text("")
                            .appendTo(container);
                        $("<div>")
                            .dxDataGrid({
                                wordWrapEnabled: false,
                                columnAutoWidth: true,
                                showBorders: true,
                                columns: [
                                    { dataField: "Codigo", caption: "Codigo", width: 80 },
                                    { dataField: "Identificador", caption: "Identificador", width: 70 },
                                    { dataField: "Trabajador", caption: "Trabajador", width: 180 },
                                    { dataField: "HoraInicio", caption: "H. Inicio", width: 45, dataType: "date", format: "HH:mm" },
                                    { dataField: "HoraFinal", caption: "H. Final", width: 45, dataType: "date", format: "HH:mm" },
                                    { dataField: "Horas", caption: "Total Horas", width: 50 },
                                    { dataField: "Adicional", caption: "Adicional", width: 50 },
                                    { dataField: "Rendimiento", caption: "Rendimiento", width: 50 },
                                    { dataField: "Lotes", caption: "Lotes" },
                                    { dataField: "Id", caption: "Id", visible: false },
                                ],
                                dataSource: new DevExpress.data.DataSource({
                                    store: new DevExpress.data.ArrayStore({
                                        key: "Id",
                                        data: lst.Trabajadores
                                    }),
                                    filter: ["Id", "=", options.key]
                                })
                            }).appendTo(container);
                    }
                }
            });
        }




    </script>



</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
