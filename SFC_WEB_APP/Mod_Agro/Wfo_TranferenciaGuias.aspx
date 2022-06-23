<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_TranferenciaGuias.aspx.cs" Inherits="SFC_WEB_APP.Mod_Agro.Wfo_TranferenciaGuias" %>

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



        .dx-datagrid-rowsview {
            /*overflow: auto; width: 100%; min-height: 15vh !important;*/
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

        .dx-datagrid-rowsview .dx-row > .dx-master-detail-cell {
            padding: 15px;
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
        <%--        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="btnBusc">Subir Informacion Por:</label>
            <select class="form-control" id="RiegoPor" name="RiegoPor">
                <option value="-1" selected disabled>Seleccione</option>
                <option value="0">LOTES</option>
                <option value="1">VALVULAS</option>
            </select>
        </div>--%>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2" id="DivFechaGuia">
            <label for="txtFeCont" class="col-form-label pb-0">Fecha:</label>
            <input type="text" id="cFechaGuia" name="cFechaGuia" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy" />
            <script type="text/javascript">
                $(function () {
                    $('#cFechaGuia').datetimepicker({
                        format: 'DD/MM/YYYY',
                        locale: 'es'
                    });
                    $(function () {
                        $('#DivFechaGuia').datetimepicker({
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
                    <div class="card-header">
                        <h4 class="card-title">
                            <div class="selected-data" style="margin-bottom: 20px;">
                                <span class="caption">Actualizar Guias:</span>
                                <span id="selected-items-container">[Seleccionados: <span id="_seleccionados">0</span>]</span>&nbsp;
                                <button type="button" id="btn-send" data-tipo="add" class="btn btn-success" style="display: none" data-toggle="modal" data-target="#ModSendSms"><i class="fa fa-paper-plane"></i><span>Sincronizar</span></button>
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
                    <h5 class="modal-title">Actualizar pesos</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="body-sync">
                    <span>Actualizar Pesos</span><span id="restantes" style="display: none">&nbsp;-&nbsp;Restantes:<b><span id="counttk"></span></b></span>
                    <div class="form-group mb-1 text-center" style="display: none" id="sendutil">
                        <img src="..\img\load_map.gif" width="80px" />&nbsp;<span id="Nombreinfo" style="font-weight: bold"></span>
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

        cargatabla();

         function cargatabla() {

            var obj = new Object();
<%--            obj.vcTipoDato = $("#RiegoPor option:selected").val();
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
            obj.vcCodigo = '';--%>
            obj.vcfecha = $('#cFechaGuia').val();
            $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
            $.ajax({
                type: 'POST',
                url: "../SerAgro.asmx/ListGuiasParaTranferencia",
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
                            keyExpr: "IDSEC",
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
                                { caption: "IDSEC", dataField: "IDSEC", visible: false }
                                , { caption: "ID", dataField: "ID" }
                                , { caption: "GUIA HISPATEC", dataField: "GUIA HISPATEC" }
                                , { caption: "FECHA", dataField: "FECHA" }
                                , { caption: "NOMBRE ARTICULO", dataField: "NOMBRE ARTICULO" }
                                , { caption: "PESO", dataField: "PESO", format: function (value) { return formatNumber.new(value.toFixed(2)); }, dataType: "number" }
                                , { caption: "CONSUMIDOR", dataField: "CONSUMIDOR" }
                                , { caption: "IDINGRESOSALIDAALM", dataField: "IDINGRESOSALIDAALM" }
                                , { caption: "GUIA NISIRA", dataField: "GUIA NISIRA" }
                                , { caption: "Id_Personalizacion", dataField: "Id_Personalizacion" }
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
                                                objx.GUIAHISPATEC = e.row.data['GUIA HISPATEC'];
                                                objx.FECHA = e.row.data['FECHA'];
                                                objx.NOMBREARTICULO = e.row.data['NOMBRE ARTICULO'];
                                                objx.PESO = e.row.data.PESO;
                                                objx.CONSUMIDOR = e.row.data.CONSUMIDOR;
                                                objx.IDINGRESOSALIDAALM = e.row.data.IDINGRESOSALIDAALM;
                                                objx.GUIANISIRA = e.row.data['GUIA NISIRA'];
                                                objx.Id_Personalizacion = e.row.data.Id_Personalizacion;
                                                obj2x[0] = objx;
                                                declare(obj2x, 0, 0);

                                                e.event.preventDefault();
                                            },
                                            visible: function (e) {
                                                if (e.row.data.Id_Personalizacion == 0) {
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

                if (obj[nums].Id_Personalizacion == 0) {

                    if (obj[nums].IDINGRESOSALIDAALM != null) {

                        $('#Nombreinfo').html(obj[nums].ID);
                        $('#sendutil').show();


                        if (obj[nums].PESO != null) {

                            if (obj[nums].CONSUMIDOR != null) {


                                var objsv = new Object();
                                objsv.vcidingresosalidaalm = obj[nums].IDINGRESOSALIDAALM;
                                objsv.vcidconsumidor = obj[nums].CONSUMIDOR;
                                objsv.vcpeso = obj[nums].PESO;
                                objsv.vciddocumento = obj[nums].ID;
                                $.ajax({
                                    type: 'POST',
                                    url: "../SerAgro.asmx/Guia_ActualizaPeso",
                                    data: JSON.stringify({ obj: objsv }),
                                    dataType: 'json',
                                    contentType: 'application/json; charset=utf-8',
                                    success: function (datasv) {
                                        var lst = JSON.parse(datasv.d);
                                        finalName += JSON.stringify(datasv) + 'SYNCRONIZADO Y GUARDADO \r\n';
                                        // toastr.success(JSON.stringify(datasv), 'SYNCRONIZADO Y GUARDADO ' + obj[nums].ID, { timeOut: 9500 });
                                        nums = nums + 1;
                                        declare(obj, nums, max);
                                    },
                                    error: function (error3) {
                                        finalName += JSON.stringify(error3) + 'ERROR AL GUARDAR LOG DE SINCRONIZADO \r\n';
                                        // toastr.error(JSON.stringify(error3), 'ERROR AL GUARDAR LOG DE SINCRONIZADO ' + obj[nums].ID, { timeOut: 9500 });
                                        nums = nums + 1;
                                        declare(obj, nums, max);
                                    }
                                });

                            } else {
                                finalName += 'SE NECESITA CONSUMIDOR PARA PODER SYNCRONIZAR ' + obj[nums].ID + 'NO TIENE CONSUMIDOR \r\n';
                                //  toastr.error('SE NECESITA LA HORA PARA PODER SYNCRONIZAR ' + obj[nums].ID, 'NO TIENE HORA', { timeOut: 9500 });
                                nums = nums + 1;
                                declare(obj, nums, max);
                            }
                        } else {
                            finalName += 'SE NECESITA EL PESO PARA PODER SYNCRONIZAR ' + obj[nums].ID, 'NO TIENE CANTIDAD \r\n';
                            // toastr.error('SE NECESITA EL CAUDAL PARA PODER SYNCRONIZAR ' + obj[nums].ID, 'NO TIENE CAUDAL', { timeOut: 9500 });
                            nums = nums + 1;
                            declare(obj, nums, max);
                        }
                    } else {
                        finalName += 'SE NECESITA IDINGRESOSALIDAALM PARA PODER SYNCRONIZAR ' + obj[nums].ID, 'NO TIENE IDINGRESOSALIDAALM \r\n';
                        // toastr.error('SE NECESITA LA FUENTE DE AGUA PARA PODER SYNCRONIZAR ' + obj[nums].ID, 'NO TIENE FUENTE DE AGUA', { timeOut: 9500 });
                        nums = nums + 1;
                        declare(obj, nums, max);
                    }

                } else if (obj[nums].Id_Personalizacion == 1) {
                    finalName += 'LA INFORMACION ' + obj[nums].ID + ' YA FUE SINCRONIZADO \r\n';
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
                obj.GUIAHISPATEC = selected[i]['GUIA HISPATEC'];
                obj.FECHA = selected[i].FECHA;
                obj.NOMBREARTICULO = selected[i]['NOMBRE ARTICULO'];
                obj.PESO = selected[i].PESO;
                obj.CONSUMIDOR = selected[i].CONSUMIDOR;
                obj.IDINGRESOSALIDAALM = selected[i].IDINGRESOSALIDAALM;
                obj.GUIANISIRA = selected[i]['GUIA NISIRA'];
                obj.Id_Personalizacion = selected[i].Id_Personalizacion;

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
