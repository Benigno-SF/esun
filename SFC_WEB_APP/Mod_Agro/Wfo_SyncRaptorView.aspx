<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_SyncRaptorView.aspx.cs" Inherits="SFC_WEB_APP.Mod_Agro.Wfo_SyncRaptorView" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
        #gridContainer {
            height: 500px;
        }

        #DataGrid {
            height: auto;
            width: 100%;
            color: black;
            font-weight: bold;
            font-size: 10px;
            height: 400px;
        }

        .options {
            margin-top: 20px;
            padding: 20px;
            background-color: rgba(191, 191, 191, 0.15);
            position: relative;
        }

        .options {
            margin-top: 20px;
            padding: 20px;
            background-color: rgba(191, 191, 191, 0.15);
            position: relative;
        }

        .caption {
            font-size: 18px;
            font-weight: 500;
        }

        .option {
            margin-top: 10px;
        }

        .checkboxes-mode {
            position: absolute;
            right: 20px;
            bottom: 20px;
        }

        .option > .dx-selectbox {
            width: 150px;
            display: inline-block;
            vertical-align: middle;
        }

        .option > span {
            margin-right: 10px;
        }
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/20.1.7/css/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/20.1.7/css/dx.light.css" />
    <script src="https://cdn3.devexpress.com/jslib/20.1.7/js/dx.all.js"></script>
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
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display:none">
            <label for="btnBusc">Tipo Informacion</label>
            <select class="form-control" id="ValOperacion" name="ValOperacion">
                <option value="0" selected disabled>Seleccione</option>
                <option value="1">RIEGO</option>
               <%-- <option value="2">APLICACIONES</option>--%>
            </select>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
            <label for="btnBusc">Cultivo</label>
            <select class="form-control" id="txtTipoDato" name="txtTipoDato">
                <option value="0" selected disabled>Seleccione</option>
                <option value="U">Uva</option>
                <option value="P">Palta</option>
                <option value="C">Citrico</option>
            </select>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivCampania"  style="display: none">
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
            <input type="text" name="txtFeFin" id="txtFeFin" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy" style>
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
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="btnBusc">Subir Informacion Por:</label>
            <select class="form-control" id="RiegoPor" name="RiegoPor">
                <option value="-1" selected disabled>Seleccione</option>
                <option value="0">LOTES</option>
                <option value="1">VALVULAS</option>
            </select>
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
                    <div class="card-header">
                        <h4 class="card-title">
                            <div class="selected-data" style="margin-bottom: 20px;">
                                <span class="caption">Sync Riego Hispatec - Raptor View:</span>
                                <span id="selected-items-container">[Seleccionados: <span id="_seleccionados">0</span>]</span>&nbsp;<button type="button" id="btn-send" data-tipo="add" class="btn btn-success" style="display: none" data-toggle="modal" data-target="#ModSendSms"><i class="fa fa-paper-plane"></i><span>Sincronizar</span></button>
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
                            <div id="container-x" class="device-mobile-tablet-container">
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
                    <h5 class="modal-title">Syncronizar con Raptor View</h5> 
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="body-sync" >
                    <span>Sinc. Inf. de Riego</span><span id="restantes" style="display: none">&nbsp;-&nbsp;Restantes:<b><span id="counttk"></span></b></span>
                    <div class="form-group mb-1 text-center" style="display: none" id="sendutil">
                        <img src="..\img\load_map.gif" width="80px"/>&nbsp;<span id="Nombreinfo" style="font-weight: bold"></span>
                    </div> 
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" id="btnSend" class="btn btn-primary">Syncronizar</button>
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
            obj.vcTipoDato = $("#RiegoPor option:selected").val();
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
            obj.vcCodigo = '';
            obj.vcRiegoPor = ''
            $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
            $.ajax({
                type: 'POST',
                url: "../SerAgro.asmx/ListRiego",
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
                        var dataGrid = $("#DataGrid").dxDataGrid({
                            dataSource: lst,
                            keyExpr: "ID",
                            allowColumnResizing: true,
                            columnMinWidth: 30,
                            columnAutoWidth: true,
                            showBorders: true,
                            selection: {
                                mode: "multiple"
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
                            },
                            columns: [
                                { caption: "ID", dataField: "ID", visible: false}
                                , { caption: "FUNDO", dataField: "FUNDO" }
                                , { caption: "VARIEDAD", dataField: "VARIEDAD" }
                                , { caption: "COD_LOTE - SUFNRUITS", dataField: "COD_LOTE" }
                                , { caption: "LOTE - RAPTOR VIEW", dataField: "LOTE" }
                                , { caption: "COD_VALVULA", dataField: "COD_VALVULA" }
                                , { caption: "VALVULA", dataField: "VALVULA" }
                                , { caption: "FECHA", dataField: "FECHA" }
                                , { caption: "FECHA_APLICACION", dataField: "FECHA_APLICACION" }
                                , { caption: "HORA", dataField: "HORA" }
                                , { caption: "RANGO_HORAS", dataField: "RANGO_HORAS" }
                                , { caption: "CAUDAL - m3/s", dataField: "CAUDAL" }
                                , { caption: "SUPERFICIE - Ha", dataField: "SUPERFICIE" }
                                , { caption: "VOLUMEN_TOTAL - m3", dataField: "VOLUMEN_TOTAL"}
                                , { caption: "VOLUMENXHA", dataField: "VOLUMENXHA" }
                                , { caption: "FUENTE_AGUA", dataField: "FUENTE_AGUA" }
                                , { caption: "USUARIO", dataField: "USUARIO" }
                                , { caption: "FEC_SINCRONIZADO", dataField: "FEC_SINCRONIZADO"}
                                , { caption: "SINCRONIZADO", dataField: "SINCRONIZADO", visible: false }
                                , { caption: "PROYECTO", dataField: "PROYECTO", visible: false }
                                , { caption: "VARIABLE", dataField: "VARIABLE", visible: false }


                                		 
                                , {
                                    type: "buttons",
                                    buttons: [
                                        {
                                            icon: "exportselected",
                                            hint: "Syncronizar",
                                            onClick: function (e) {
                                                toastr.success('', 'SYNCRONIZANDO.... ' + e.row.data.ID, { timeOut: 9500 });
                                                var obj2x = new Object();
                                                var objx = new Object();
                                                objx.ID = e.row.data.ID;
                                                objx.FUNDO = e.row.data.FUNDO;
                                                objx.VARIEDAD = e.row.data.VARIEDAD;
                                                objx.COD_LOTE = e.row.data.COD_LOTE;
                                                objx.LOTE = e.row.data.LOTE;
                                                objx.COD_VALVULA = e.row.data.COD_VALVULA;
                                                objx.VALVULA = e.row.data.VALVULA;
                                                objx.FECHA = e.row.data.FECHA;
                                                objx.FECHA_APLICACION = e.row.data.FECHA_APLICACION;
                                                objx.HORA = e.row.data.HORA;
                                                objx.RANGO_HORAS = e.row.data.RANGO_HORAS;
                                                objx.CAUDAL = e.row.data.CAUDAL;
                                                objx.SUPERFICIE = e.row.data.SUPERFICIE;
                                                objx.VOLUMEN_TOTAL = e.row.data.VOLUMEN_TOTAL;
                                                    
                                                objx.VOLUMENXHA = e.row.data.VOLUMENXHA;
                                                objx.FUENTE_AGUA = e.row.data.FUENTE_AGUA;
                                                objx.USUARIO = e.row.data.USUARIO;
                                                objx.FEC_SINCRONIZADO = e.row.data.FEC_SINCRONIZADO;
                                                objx.SINCRONIZADO = e.row.data.SINCRONIZADO;
                                                    
                                                objx.PROYECTO = e.row.data.PROYECTO;
                                                objx.VARIABLE = e.row.data.VARIABLE;
                                                obj2x[0] = objx;
                                                declare(obj2x, 0, 0);

                                                e.event.preventDefault();
                                            },
                                            visible: function (e) {
                                                if (e.row.data.SINCRONIZADO == 0) {
                                                    return true;
                                                } else {
                                                    return false
                                                }
                                            }
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
                                        return value.ID;
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

        var finalName = ""

        function declare(obj, nums, max) {

            if (nums <= max) {

                $('#counttk').html(max - nums);

                if (obj[nums].SINCRONIZADO == 0) {

                    if (obj[nums].ID != null) {

                        $('#Nombreinfo').html(obj[nums].ID);
                        $('#sendutil').show();

                        if (obj[nums].FECHA != null) {


                            if (obj[nums].LOTE != null) {

                                if (obj[nums].VOLUMENXHA != null) {

                                    if (obj[nums].FUENTE_AGUA != null) {

                                        if (obj[nums].CAUDAL != null) {

                                            if (obj[nums].HORA != null) {

                                                var strapi = obj[nums].FECHA;
                                                var resapi = strapi.split("-", 3);
                                                var idsave = obj[nums].ID;
                                                var fech = resapi[2] + '-' + resapi[1] + '-' + resapi[0];
                                                if ($("#RiegoPor option:selected").val() == 1) {
                                                    var RIEGOPOR = obj[nums].VALVULA 
                                                } else if ($("#RiegoPor option:selected").val() == 0) {
                                                    var RIEGOPOR = obj[nums].LOTE 
                                                }
                                                //alert(obj[nums].PROYECTO + ' ' + obj[nums].VARIABLE);
                                                var urlphp = "http://204.199.164.92/raptorview/SyncRaptorView.php";
                                                var urlsag = 'projects/' + obj[nums].PROYECTO + '/variables/' + obj[nums].VARIABLE + '/records/bulk_create/';
                                                var query2 = '[{"_date":"' + obj[nums].FECHA + '","cartographic_unit":' + RIEGOPOR + ',"value":' + obj[nums].VOLUMEN_TOTAL + ',"metadata":{"Fuente de agua":"' + obj[nums].FUENTE_AGUA + '","Caudal":' + obj[nums].CAUDAL + ',"Hora":"' + obj[nums].HORA + '","Rango de Horas":"' + obj[nums].RANGO_HORAS + '","Fecha de Aplicacion":"' + obj[nums].FECHA_APLICACION + '"}}]';
                                                //alert(urlsag + ' ' + query2);
                                                $.ajax({
                                                    type: 'POST',
                                                    url: urlphp,
                                                    data: { obj: query2, urlrv: urlsag },
                                                    dataType: 'json',
                                                    success: function (data1) {
                                                        if (data1 != '') {
                                                            if (data1[0].created_records == 1) {
                                                               // toastr.success('guardando info', 'SYNCRONIZADO CON RAPTOR VIEW ' + obj[nums].ID, { timeOut: 9500 });

                                                                var objsv = new Object();
                                                                objsv.vcTipoDato = 2;
                                                                objsv.vcFecha = '';
                                                                objsv.vcFechaFin = '';
                                                                objsv.vcCodigo = idsave;
                                                                objsv.vcRiegoPor = $("#RiegoPor option:selected").val();
                                                                $.ajax({
                                                                    type: 'POST',
                                                                    url: "../SerAgro.asmx/ListRiego",
                                                                    data: JSON.stringify({ obj: objsv }),
                                                                    dataType: 'json',
                                                                    contentType: 'application/json; charset=utf-8',
                                                                    success: function (datasv) {
                                                                        var lst = JSON.parse(datasv.d);
                                                                        //finalName += JSON.stringify(datasv)+'SYNCRONIZADO Y GUARDADO \n';
                                                                           // toastr.success(JSON.stringify(datasv), 'SYNCRONIZADO Y GUARDADO ' + obj[nums].ID, { timeOut: 9500 });
                                                                            nums = nums + 1;
                                                                            declare(obj, nums, max);
                                                                    },
                                                                    error: function (error3) {
                                                                        finalName += JSON.stringify(error3) + 'ERROR AL GUARDAR LOG DE SINCRONIZADO \n';
                                                                       // toastr.error(JSON.stringify(error3), 'ERROR AL GUARDAR LOG DE SINCRONIZADO ' + obj[nums].ID, { timeOut: 9500 });
                                                                        nums = nums + 1;
                                                                        declare(obj, nums, max);
                                                                    }
                                                                });
                                                            } else {
                                                                finalName += obj[nums].ID + 'NO SINCRONIZADO ERROR 0 - FALTA VALIDAR EN RAPTOR VIEW \n';
                                                               // toastr.warning(obj[nums].ID, 'NO SINCRONIZADO ERROR 0 - FALTA VALIDAR EN RAPTOR VIEW', { timeOut: 9500 });
                                                                console.log(urlsag + ' ' + query2);
                                                                nums = nums + 1;
                                                                declare(obj, nums, max);
                                                            }
                                                        } else {
                                                            finalName += obj[nums].ID + 'ERROR DE SINCRONIZADO CON RAPTOR VIEW \n';
                                                            //toastr.error(obj[nums].ID, 'ERROR DE SINCRONIZADO CON RAPTOR VIEW', { timeOut: 9500 });
                                                            nums = nums + 1;
                                                            declare(obj, nums, max);
                                                        }
                                                    }, error: function (error2) {
                                                        finalName += JSON.stringify(error2) + 'ERROR AL SINCRONIZAR ' + obj[nums].ID+' \n';
                                                       // toastr.error(JSON.stringify(error2), 'ERROR AL SINCRONIZAR ' + obj[nums].ID, { timeOut: 9500 });
                                                        nums = nums + 1;
                                                        declare(obj, nums, max);
                                                    }
                                                });
                                            } else {
                                                finalName += 'SE NECESITA LA HORA PARA PODER SYNCRONIZAR ' + obj[nums].ID +'NO TIENE HORA \n';
                                              //  toastr.error('SE NECESITA LA HORA PARA PODER SYNCRONIZAR ' + obj[nums].ID, 'NO TIENE HORA', { timeOut: 9500 });
                                                nums = nums + 1;
                                                declare(obj, nums, max);
                                            }
                                        } else {
                                            finalName += 'SE NECESITA EL CAUDAL PARA PODER SYNCRONIZAR ' + obj[nums].ID, 'NO TIENE CAUDAL \n';
                                           // toastr.error('SE NECESITA EL CAUDAL PARA PODER SYNCRONIZAR ' + obj[nums].ID, 'NO TIENE CAUDAL', { timeOut: 9500 });
                                            nums = nums + 1;
                                            declare(obj, nums, max);
                                        }
                                    } else {
                                        finalName += 'SE NECESITA LA FUENTE DE AGUA PARA PODER SYNCRONIZAR ' + obj[nums].ID, 'NO TIENE FUENTE DE AGUA \n';
                                       // toastr.error('SE NECESITA LA FUENTE DE AGUA PARA PODER SYNCRONIZAR ' + obj[nums].ID, 'NO TIENE FUENTE DE AGUA', { timeOut: 9500 });
                                        nums = nums + 1;
                                        declare(obj, nums, max);
                                    }

                                } else {
                                    finalName += 'SE NECESITA LA FUENTE DE AGUA PARA PODER SYNCRONIZAR ' + obj[nums].ID, 'NO TIENE FUENTE DE AGUA \n';
                                  //  toastr.error('SE NECESITA EL VOLUMEN POR HECTAREA PARA PODER SYNCRONIZAR ' + obj[nums].ID, 'NO TIENE VOLUMEN POR HECTAREA', { timeOut: 9500 });
                                    nums = nums + 1;
                                    declare(obj, nums, max);
                                }

                            } else {
                                finalName += 'SE NECESITA EL CODIGO DE LOTE PARA PODER SYNCRONIZAR ' + obj[nums].ID, 'NO TIENE CODIGO DE LOT \n';
                               // toastr.error('SE NECESITA EL CODIGO DE LOTE PARA PODER SYNCRONIZAR ' + obj[nums].ID, 'NO TIENE CODIGO DE LOTE', { timeOut: 9500 });
                                nums = nums + 1;
                                declare(obj, nums, max);
                            }

                        } else {
                            finalName += 'SE NECESITA FECHA DE RIEGO PARA PODER SYNCRONIZAR ' + obj[nums].ID, 'NO TIENE FECHA DE RIEGO  \n';
                           // toastr.error('SE NECESITA FECHA DE RIEGO PARA PODER SYNCRONIZAR ' + obj[nums].ID, 'NO TIENE FECHA DE RIEGO ', { timeOut: 9500 });
                            nums = nums + 1;
                            declare(obj, nums, max);
                        }

                    } else {
                        //alert('Complete los Datos, Por Favor');
                        nums = nums + 1;
                        declare(obj, nums, max);
                    }

                } else if (obj[nums].SINCRONIZADO == 1) {
                    finalName += 'LA INFORMACION ' + obj[nums].ID + ' YA FUE SINCRONIZADO \n';
                    //toastr.error('LA INFORMACION ' + obj[nums].ID + ' YA FUE SINCRONIZADO', 'YA SINCRONIZADO', { timeOut: 9500 });
                    nums = nums + 1;
                    declare(obj, nums, max);
                }                  

            } else {
                $('#ModSendSms').modal('hide');
                $('#Nom2').html('');
                $('#loadingutil').hide();
                toastr.success('', 'SINCRONIZADO FINALIZADO');
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



                download(filename, text);

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
                obj.ID = selected[i].ID;
                obj.FUNDO = selected[i].FUNDO;
                obj.VARIEDAD = selected[i].VARIEDAD;
                obj.COD_LOTE = selected[i].COD_LOTE;
                obj.LOTE = selected[i].LOTE;
                obj.COD_VALVULA = selected[i].COD_VALVULA;
                obj.VALVULA = selected[i].VALVULA;
                obj.FECHA = selected[i].FECHA;
                obj.FECHA_APLICACION = selected[i].FECHA_APLICACION;
                obj.HORA = selected[i].HORA;
                obj.RANGO_HORAS = selected[i].RANGO_HORAS;
                obj.CAUDAL = selected[i].CAUDAL;
                obj.SUPERFICIE = selected[i].SUPERFICIE;
                obj.VOLUMEN_TOTAL = selected[i].VOLUMEN_TOTAL;

                obj.VOLUMENXHA = selected[i].VOLUMENXHA;
                obj.FUENTE_AGUA = selected[i].FUENTE_AGUA;
                obj.USUARIO = selected[i].USUARIO;
                obj.FEC_SINCRONIZADO = selected[i].FEC_SINCRONIZADO;
                obj.SINCRONIZADO = selected[i].SINCRONIZADO;

                obj.PROYECTO = selected[i].PROYECTO;
                obj.VARIABLE = selected[i].VARIABLE;

                obj2[i] = obj;
            }
            declare(obj2, 0, x);
        });


    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
