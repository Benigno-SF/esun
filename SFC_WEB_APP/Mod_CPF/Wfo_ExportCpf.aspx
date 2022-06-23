<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ExportCpf.aspx.cs" Inherits="SFC_WEB_APP.Mod_CPF.Wfo_ExportCpf" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.common.css" />
       <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.light.css" />
<%--    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.1.3/css/dx.material.orange.light.css" />--%>

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

    <!-- END: Vendor CSS-->
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

        #gridContainer {
            /* height: 70vh;*/
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





    </style>

    <%--
        <script src="data.js"></script>
        <link rel="stylesheet" type="text/css" href="styles.css" />
        <script src="index.js"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivCampania" style="display: none">
            <label for="txtFeInicio">Campaña</label>
            <asp:DropDownList ID="ddlCampania" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivFeInicio">
            <label for="txtFeInicio">Desde</label>
            <input type="text" name="txtFeInicio" id="txtFeInicio" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
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
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivFeFin">
            <label for="txtFechaFin">Hasta</label>
            <input type="text" name="txtFeFin" id="txtFeFin" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy" >
            <script type="text/javascript">
                $(function () {
                    $('#<%=txtFeFin.ClientID %>').datetimepicker({
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
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivFeProc">
            <label for="txtFechaFin">Fecha Proceso</label>
            <input type="text" name="txtFeProc" id="txtFeProc" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy" >
            <script type="text/javascript">
                $(function () {
                    $('#<%=txtFeProc.ClientID %>').datetimepicker({
                        format: 'DD/MM/YYYY',
                        locale: 'es'
                    });
                    $(function () {
                        $('#DivFeProc').datetimepicker({
                            format: 'DD/MM/YYYY',
                            locale: 'es'
                        });
                    });
                });
            </script>
        </div>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnBusc" name="btnBusc" runat="server" class="btn btn-secondary col-12">
                <i class="fa fa-search"></i>Recuperar
            </button>
        </div>
    </div>

    <section id="cell-background" style="height: 100%">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header mt-0 pt-0 mb-0 pb-0">
                        <h4 class="card-title">
                            <div class="selected-data" style="margin-bottom: 20px;">
                                <span class="caption">Generar Xml Cpf:</span>
                                <span id="selected-items-container">&nbsp;&nbsp;[Seleccionados: <span id="_seleccionados">0</span>]</span>&nbsp;
                                <button type="button" id="btn-send" data-tipo="add" class="btn btn-success" style="display: none" data-toggle="modal" data-target="#ModSendSms"><i class="fa fa-paper-plane"></i><span>Generar Xml</span></button>
                            </div>
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
                            <div id="container-x" class="device-mobile-tablet-container" style="min-height: 30vh">
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
                    <h5 class="modal-title">Generar Xml Cpf</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="body-sync">
                    <span>Sinc. Inf. de Riego</span><span id="restantes" style="display: none">&nbsp;-&nbsp;Restantes:<b><span id="counttk"></span></b></span>
                    <div class="form-group mb-1 text-center" style="display: none" id="sendutil">
                        <img src="..\img\load_map.gif" width="80px" />&nbsp;<span id="Nombreinfo" style="font-weight: bold"></span>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" id="btnSend" class="btn btn-primary">Generar</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $("#<%=btnBusc.ClientID%>").click(function () {
            cargatabla();
        });

        var cargatabla = function () {

            var obj = new Object();
            if ($('#<%=txtFeInicio.ClientID %>').val() != '') {
                var str1 = $('#<%=txtFeInicio.ClientID %>').val();
                var res1 = str1.split("/", 3);
                obj.vcFecha = res1[2] + res1[1] + res1[0];
            } else {
                obj.vcFecha = '';
            }
            if ($('#<%=txtFeFin.ClientID %>').val() != '') {
                var str2 = $('#<%=txtFeFin.ClientID %>').val();;
                var res2 = str2.split("/", 3);
                obj.vcFechaFin = res2[2] + res2[1] + res2[0];
            } else {
                obj.vcFechaFin = '';
            }

            if ($('#<%=txtFeProc.ClientID %>').val() != '') {
                var str3 = $('#<%=txtFeProc.ClientID %>').val();;
                var res3 = str3.split("/", 3);
                obj.vcFechaProc = res3[2] + res3[1] + res3[0];
            } else {
                obj.vcFechaProc = '';
            }
            $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
            $.ajax({
                type: 'POST',
                url: "../SerCPF.asmx/ListConfeccionado_Cpf",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                error: function () {
                    $('#activos').hide();
                    console.log("120");
                },
                success: function (data1) {
                    var lst = JSON.parse(data1.d);
                    $('#container-x').html('<div class="options"><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="DataGrid"></div>');
                    $(function () {
                        DevExpress.localization.locale('es');

                        var dataGrid = $("#DataGrid").dxDataGrid({
                            dataSource: lst,
                            keyExpr: "Codigo_Barras",
                            allowColumnResizing: true,
                            columnMinWidth: 30,
                            columnAutoWidth: true,
                            showBorders: true,
                            selection: {
                                mode: "multiple"
                            },
                            editing: {
                                mode: "cell",
                                allowUpdating: true
                            },
                            paging: {
                                pageSize: 10
                            },
                            filterRow: {
                                visible: true
                            },
                            showBorders: true,
                            paging: {
                                enabled: false
                            },
                            columnFixing: {
                                enabled: true
                            },
                            bindingOptions: {
                                headerFilter: "headerFilter"
                            },
                            columnChooser: {
                                enabled: true
                            },
                            groupPanel: {
                                visible: true
                            },
                            filterRow: {
                                visible: false,
                                applyFilter: "auto"
                            },
                            searchPanel: {
                                visible: false,
                                placeholder: "Buscar..."
                            },
                            headerFilter: {
                                visible: false
                            }, export: {
                                enabled: true,
                                fileName: "Reporte Cpf"
                            },
                            columns: [
                                { caption: "Variedad", dataField: "variedad" }
                                , { caption: "Marca", dataField: "Marca" }
                                , { caption: "Categoria", dataField: "Categoria" }
                                , { caption: "calibre", dataField: "calibre" }
                                , { caption: "Peso", dataField: "Peso_de_caja" }
                                , { caption: "Envase", dataField: "Envase" }
                                , { caption: "numpartproduccion", dataField: "PARTPROD" }
                                , { caption: "Caja", dataField: "Tipo_de_caja" }
                                , { caption: "Pedido", dataField: "NumPedido" }
                                , { caption: "Guia_Ingreso", dataField: "Guia_Ingreso" }
                                , { caption: "Part_Num", dataField: "Part_Num" }
                                , { caption: "Articulo", dataField: "Articulo" }
                                , { caption: "Estado", dataField: "Situacion" }

                                , { caption: "CantidadEnvases", dataField: "CantidadEnvases" }
                                , { caption: "Fecha", dataField: "Fecha" }
                                , { caption: "Hora", dataField: "Hora" }
                                , { caption: "Nombre", dataField: "PaleNombre" }
                                , { caption: "DatoComp1", dataField: "DatoComp1" }
                                , { caption: "DatoComp2", dataField: "CodeComp2" }
                                , { caption: "Code Palet Cpf", dataField: "DatoComp2" }
                                , { caption: "Linea_Prod", dataField: "Linea_Prod" }
                                , { caption: "Codigo_Barras", dataField: "Codigo_Barras" }
                                , { caption: "Pale Creado", dataField: "Pale" }
                                , { caption: "Part_serie", dataField: "Part_serie" }
                                , {
                                    type: "buttons",
                                    buttons: [
                                        {
                                            icon: "exportselected",
                                            hint: "Syncronizar",
                                            onClick: function (e) {
                                                toastr.success('', 'Gnerando.... ' + e.row.data.Codigo_Barras, { timeOut: 9500 });
                                                var obj2x = new Object();
                                                var objx = new Object();
                                                objx.PaleNombre = e.row.data.PaleNombre;
                                                objx.Fecha = e.row.data.Fecha;
                                                objx.Peso_de_caja = e.row.data.Peso_de_caja;
                                                objx.PARTPROD = e.row.data.PARTPROD;
                                                objx.DatoComp1 = e.row.data.DatoComp1;
                                                objx.Situacion = e.row.data.Situacion;
                                                objx.CodeComp2 = e.row.data.CodeComp2;
                                                objx.DatoComp2 = e.row.data.DatoComp2;
                                                objx.Linea_Prod = e.row.data.Linea_Prod;
                                                objx.Codigo_Barras = e.row.data.Codigo_Barras;
                                                objx.Hora = e.row.data.Hora;
                                                objx.Articulo = e.row.data.Articulo;
                                                objx.Pale = e.row.data.Pale;
                                                objx.Envase = e.row.data.Envase;
                                                objx.CantidadEnvases = e.row.data.CantidadEnvases;
                                                objx.Part_serie = e.row.data.Part_serie;
                                                objx.Part_Num = e.row.data.Part_Num;
                                                obj2x[0] = objx;
                                                declare(obj2x, 0, 0);

                                                e.event.preventDefault();
                                            },
                                            //visible: function (e) {
                                            //    if (e.row.data.SINCRONIZADO == 0) {
                                            //        return true;
                                            //    } else {
                                            //        return false
                                            //    }
                                            //}
                                        }
                                    ]
                                }
                            ],


                            onSelectionChanged: function (selectedItems) {
                                selected = selectedItems.selectedRowsData;
                                $("#_seleccionados").text(selected.length);

                                changedBySelectBox = false;
                                var data = selectedItems.selectedRowsData;
                                if (data.length > 0)

                                    cad_id = $.map(data, function (value) {
                                        return value.Codigo_Barras;
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
                        }).dxDataGrid("instance");



                        var clearButton = $("#gridClearSelection").dxButton({
                            text: "Clear Selection",
                            disabled: true,
                            onClick: function () {
                                dataGrid.clearSelection();
                            }
                        }).dxButton("instance");

                        $("#autoExpand").dxCheckBox({
                            value: false,
                            text: "Expandir Todo",
                            onValueChanged: function (data) {

                                var dataGrid = $('#DataGrid').dxDataGrid('instance');
                                if (data.value == 1) {
                                    dataGrid.expandAll(-1);
                                } else {
                                    dataGrid.collapseAll(-1);
                                }
                            }
                        });

                        $("#filterRow").dxCheckBox({
                            text: "Buscar",
                            value: false,
                            onValueChanged: function (data) {
                                dataGrid.clearFilter();
                                dataGrid.option("filterRow.visible", data.value);
                                // applyFilterModeEditor.option("disabled", !data.value);
                            }
                        });

                        $("#headerFilter").dxCheckBox({
                            text: "Filtro",
                            value: false,
                            onValueChanged: function (data) {
                                dataGrid.clearFilter();
                                dataGrid.option("headerFilter.visible", data.value);
                            }
                        });
                    });
                }
            });
        }



        function declare(obj, nums, max) {

            if (nums <= max) {

                $('#counttk').html(max - nums);

                if (obj[nums].PaleNombre != '') {

                    if (obj[nums].Pale != '') {

                        $('#Nombreinfo').html(obj[nums].Pale);
                        $('#sendutil').show();

                        if (obj[nums].Fecha != '') {
                            if (obj[nums].Hora != '') {
                                if (obj[nums].PARTPROD != '') {
                                    if (obj[nums].DatoComp1 != '') {
                                        if (obj[nums].Situacion != '') {
                                                if (obj[nums].Codigo_Barras != '') {
                                                    if (obj[nums].Articulo != '') {
                                                        if (obj[nums].Linea_Prod != '') {
                                                            if (obj[nums].Envase != '') {
                                                                if (obj[nums].CantidadEnvases != '') {
                                                                    if (obj[nums].Part_serie != '') {
                                                                        //if (obj[nums].Part_Num != '') {
                                                                        var objsv = new Object();
                                                                        objsv.PaleNombre = obj[nums].PaleNombre;
                                                                        objsv.Pale = obj[nums].Pale;
                                                                        objsv.Fecha = obj[nums].Fecha;
                                                                        objsv.Hora = obj[nums].Hora;
                                                                        objsv.Peso_de_caja = obj[nums].Peso_de_caja;
                                                                        objsv.PARTPROD = obj[nums].PARTPROD;
                                                                        objsv.DatoComp1 = obj[nums].DatoComp1;
                                                                        objsv.Situacion = obj[nums].Situacion;
                                                                        objsv.DatoComp2 = obj[nums].DatoComp2;
                                                                        objsv.CodeComp2 = obj[nums].CodeComp2;
                                                                        objsv.Linea_Prod = obj[nums].Linea_Prod;
                                                                        objsv.Codigo_Barras = obj[nums].Codigo_Barras;
                                                                        objsv.Articulo = obj[nums].Articulo;
                                                                        objsv.Linea_Prod = obj[nums].Linea_Prod;
                                                                        objsv.Envase = obj[nums].Envase;
                                                                        objsv.CantidadEnvases = obj[nums].CantidadEnvases;
                                                                        objsv.Part_serie = obj[nums].Part_serie;
                                                                        objsv.Part_Num = obj[nums].Part_Num;
                                                                        objsv.numpalet = nums + 1;
                                                                        $.ajax({
                                                                            type: 'POST',
                                                                            url: "../SerRepo.asmx/XmlCreateCPF",
                                                                            data: JSON.stringify({ obj: objsv }),
                                                                            dataType: 'json',
                                                                            contentType: 'application/json; charset=utf-8',
                                                                            success: function (datasv) {
                                                                               // var lst = JSON.parse(datasv.d);
                                                                                nums = nums + 1;
                                                                                declare(obj, nums, max);
                                                                            },
                                                                            error: function (error3) {
                                                                                nums = nums + 1;
                                                                                declare(obj, nums, max);
                                                                            }
                                                                        });

                                                                        //} else {
                                                                        //    nums = nums + 1;
                                                                        //    declare(obj, nums, max);
                                                                        //}
                                                                } else {
                                                                    nums = nums + 1;
                                                                    declare(obj, nums, max);
                                                                }
                                                            } else {
                                                                nums = nums + 1;
                                                                declare(obj, nums, max);
                                                            }
                                                        } else {
                                                            nums = nums + 1;
                                                            declare(obj, nums, max);
                                                        }
                                                    } else {
                                                        nums = nums + 1;
                                                        declare(obj, nums, max);
                                                    }
                                                } else {
                                                    nums = nums + 1;
                                                    declare(obj, nums, max);
                                                }
                                            } else {
                                                nums = nums + 1;
                                                declare(obj, nums, max);
                                            }
                                        } else {
                                            nums = nums + 1;
                                            declare(obj, nums, max);
                                        }
                                    } else {
                                        nums = nums + 1;
                                        declare(obj, nums, max);
                                    }

                                } else {
                                    nums = nums + 1;
                                    declare(obj, nums, max);
                                }

                            } else {
                                nums = nums + 1;
                                declare(obj, nums, max);
                            }

                        } else {
                            nums = nums + 1;
                            declare(obj, nums, max);
                        }
                    } else {
                        nums = nums + 1;
                        declare(obj, nums, max);
                    }
                } else {
                    nums = nums + 1;
                    declare(obj, nums, max);
                }

            } else {
                $('#ModSendSms').modal('hide');
                $('#Nom2').html('');
                $('#loadingutil').hide();
                toastr.success('', 'Gereracion Xml Completa');
                $('#counttk').html('');
                $('#restante').hide();
                //cargatabla();
                $('#sendutil').hide();
                $('#selx').text('');
                $("#Div_close_part").hide();
                $("#btn-send").hide();
                $('#selx').text('0');

            }

        }

        $("#btnSend").click(function () {
            $('#restantes').show();
            var obj2 = new Object();
            x = -1;
            for (var i = 0; i < selected.length; i++) {
                x++
                var obj = new Object();
                obj.PaleNombre = selected[i].PaleNombre;
                obj.Fecha = selected[i].Fecha; 
                obj.Hora = selected[i].Hora;
                obj.Peso_de_caja = selected[i].Peso_de_caja;
                obj.PARTPROD = selected[i].PARTPROD;
                obj.DatoComp1 = selected[i].DatoComp1;
                obj.Situacion = selected[i].Situacion;
                obj.CodeComp2 = selected[i].CodeComp2;
                obj.DatoComp2 = selected[i].DatoComp2;
                obj.Linea_Prod = selected[i].Linea_Prod;
                obj.Codigo_Barras = selected[i].Codigo_Barras;
                obj.Articulo = selected[i].Articulo;
                obj.Pale = selected[i].Pale;
                obj.Envase = selected[i].Envase;
                obj.CantidadEnvases = selected[i].CantidadEnvases;
                obj.Part_serie = selected[i].Part_serie;
                obj.Part_Num = selected[i].Part_Num;

                obj2[i] = obj;
            }

            declare(obj2, 0, x);

        });


    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
