<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_EnvioInfMasiva.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_EnvioInfMasiva" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #gridContainer {
            min-height: 500px;
        }

        #DataGrid {
            height: auto;
            width: 100%;
            color: black;
            font-weight: bold;
            font-size: 10px;
            height: 60vh;
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



    <section id="cell-background" style="height: 100%">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">
                            <div class="selected-data" style="margin-bottom: 20px;">
                                <span class="caption">Envío de Informacion:</span>
                                <span id="selected-items-container">[Seleccionados: <span id="_seleccionados">0</span>]</span>&nbsp;
                                <button type="button" id="btn-send-email" data-tipo="add" class="btn btn-danger" style="display: none" data-toggle="modal" data-target="#ModSendEmail"><i class="fa fa-paper-plane"></i><span>Enviar Correo Utilidades</span></button>
                                <button type="button" id="btn-send-sms" data-tipo="add" class="btn btn-success" style="display: none" data-toggle="modal" data-target="#ModSendSms"><i class="fa fa-paper-plane"></i><span>Enviar Mensaje Texto</span></button>
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

    <div class="modal fade" id="ModSendEmail" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Enviar Informacion Masivo</h5> 
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <span>Enviando Correo </span><span id="restantes" style="display: none">&nbsp;-&nbsp;Restantes:<b><span id="counttk"></span></b></span>
                    <div class="form-group mb-1 text-center" style="display: none" id="sendutil">
                        <img src="..\img\sendemail.gif" width="80px"/>&nbsp;<span id="Nom2" style="font-weight: bold"></span>
                    </div> 
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" id="btnSendEmail" class="btn btn-primary">Enviar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModSendSms" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Enviar Mensaje Masivo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    
                    <span><b>$nombre$</b> = Nombre Completo</span><br />
                    <span><b>Add SMS</b> = <btn class="btn btn-sm btn-success" id="addsmsutilidad">sms ut 2021</btn></span>

                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Mensaje:</label>
                        <textarea id="txtmensaje" rows="10" cols="50" class="form-control round" ></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" id="btnSendSms" class="btn btn-primary">Enviar</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        var selected; var cells;

        $(document).ready(function () {
            cargatabla();
        });

        var cargatabla = function () {

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdPersona = 0;
            obj.vcNombres = '';
            obj.vcNroDocumento = '';
            obj.vnEstado = 0;
            $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
            $.ajax({
                type: 'POST',
                url: "../SerRRHH.asmx/PersonaList2x",
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
                            keyExpr: "cNroDocumento",
                            allowColumnResizing: true,
                            columnMinWidth: 30,
                            columnAutoWidth: true,
                            selection: {
                                mode: "multiple"
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
                                { caption: "DNI", dataField: "cNroDocumento", width: 70 }
                                , { caption: "Nombre", dataField: "cApeNom" }
                                , { caption: "Planilla", dataField: "cPlanilla" }
                                , { caption: "Banco", dataField: "cBanco" }
                                , { caption: "Cuenta", dataField: "Cuenta", visible:false }
                                , { caption: "Grupo Trabajo", dataField: "cGrupoTrabajo"}
                                , { caption: "Email", dataField: "cEmail" }
                                , { caption: "Celular", dataField: "cCelular" }
                                , { caption: "N° de Envios", dataField: "cEnvios" }
                                , { caption: "Ult Envio", dataField: "cUltiEnvios" }
                                , {
                                    type: "buttons",
                                    buttons: [
                                        {
                                            icon: "exportselected",
                                            hint: "Generar y Enviar Correo",
                                            onClick: function (e) {
                                                GeneraryEnviar(e.row.data.cNroDocumento);
                                                e.event.preventDefault();
                                            },
                                            visible: function (e) {
                                                if (e.row.data.cEmail != '' || e.row.data.cEmail != null) {
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
                                        return value.cNroDocumento;
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
                                    $("#btn-send-email").show();
                                    $("#btn-send-sms").show();
                                } else {
                                    $("#Div_close_part").hide();

                                    $("#btn-send-email").hide();
                                    $("#btn-send-sms").hide();
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

        function SendSMS(phone, message) {
            var obj = new Object();
            obj.cNumCel = phone;
            obj.cDescSms = message;

            // url = 'http://192.168.21.124:8080/v1/sms/send/?phone=' + phone + '&message=' + message;
            url = 'http://204.199.164.94/sms/sendSms.php?numero=' + phone + '&mensaje=' + message;
            $.ajax({
                url: url,
                type: 'GET',
                crossDomain: true,
                dataType: 'jsonp', // added data type
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    // toastr.remove();
                    alert(JSON.stringify(data));
                    //toastr.clear();
                    if (data == 'OK') {
                        toastr.success('', 'MENSAJE ENVIADO')
                    } else if (data.d == '500') {
                        toastr.error('', 'NO SE ENVIO EL MENSAJE, VERIFIQUE NUMERO')
                    } else {
                        toastr.error('', 'ERROR ' + JSON.stringify(data))
                    }
                },
                error: function (error) {
                    console.log(JSON.stringify(error));
                    if (error.status == '200') {
                        toastr.success('', 'MENSAJE ENVIADO')
                    } else if (error.status == '500') {
                        toastr.error('', 'NO SE ENVIO EL MENSAJE, VERIFIQUE NUMERO')
                    } else {
                        toastr.error('', 'ERROR ' + JSON.stringify(error))
                    }
                },
                timeout: 5000
            });
            //$.ajax({
            //    type: 'POST',
            //    url: "../SerRRHH.asmx/SendSmsExt",
            //    data: JSON.stringify({ obj: obj }),
            //    dataType: 'json',
            //    contentType: 'application/json; charset=utf-8',
            //    beforeSend: function () {
            //        toastr.remove();
            //        toastr.clear();
            //        toastr.warning('', 'Enviando Mensaje ...');
            //    },
            //    success: function (data) {
            //        // toastr.remove();
            //        //toastr.clear();
            //        var lst = JSON.parse(data.d);
            //        if (lst.response[0].status == 'pending') {
            //            toastr.success('', 'MENSAJE ENVIADO')
            //        } else if (lst.response[0].status == 'NOT') {
            //            toastr.error('', 'MENSAJE NO ENVIADO, GATEWAY INACTIVO')
            //        } else if (lst.status[0] == '500') {
            //            toastr.error('', 'NO SE ENVIO EL MENSAJE, VERIFIQUE NUMERO')
            //        } else {
            //            toastr.error('', 'ERROR ' + JSON.stringify(data))
            //        }
            //    },
            //    error: function (error) {
            //        $.toaster({
            //            title: 'ERROR',
            //            message: JSON.stringify(error),
            //            priority: 'danger'
            //        });
            //        clear();
            //    }
            //});
        }

        $("#addsmsutilidad").click(function () {

            $('#txtmensaje').val('Hola $nombre$; Sun Fruits te recuerda que ya empezamos con el pago de UTILIDADES 2021. Ingresa al siguiente link para consultar tu depósito: https://cutt.ly/UTILIDADSF');
        });
        $("#btnSendSms").click(function () {
            for (var i = 0; i < selected.length; i++) {
                if (selected[i].cCelular != null && (selected[i].cCelular).trim() != "") {
                    //alert("enviando a: " + selected[i].CELULAR);
                    //SendSMS(selected[i].CELULAR, "saludo");
                    var msj = $('#txtmensaje').val();
                    var mensaje = msj.replace('$nombre$', selected[i].cNombres);

                    SendSMS(selected[i].cCelular, mensaje);
                }
            }
        });

        emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;

        function declare(obj, nums, max) {

            if (nums <= max) {

                $('#counttk').html(max - nums);
                $('#Nom2').html(obj[nums].vcNombre);

                if (obj[nums].vcCodigo != null) {

                    $.ajax({
                        type: 'POST',
                        url: "../SerRRHH.asmx/RepUtilidad",
                        data: JSON.stringify({ obj: obj[nums] }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var tmp = JSON.parse(data.d);

                            if (tmp != '') {
                                if (emailRegex.test(obj[nums].vcEmail)) {
                                    $.ajax({
                                        type: 'POST',
                                        url: "../SerRRHH.asmx/SendMail",
                                        data: JSON.stringify({ obj: obj[nums], pdf: tmp[1].pdf }),
                                        dataType: 'json',
                                        contentType: 'application/json; charset=utf-8',
                                        success: function (data) {
                                            toastr.success(JSON.stringify(data), 'correo enviado del personal ' + obj[nums].vcNombre);
                                        }, error: function (data) {
                                            toastr.error('CORREO NO ENVIADO', 'el correo del personal ' + obj[nums].vcNombre + ' No se pudo enviar' + JSON.stringify(data));
                                            nums = nums + 1;
                                            declare(obj, nums, max);
                                        },
                                        complete: function (data) {
                                            nums = nums + 1;
                                            declare(obj, nums, max);
                                        }
                                    });
                                } else {
                                    toastr.error('CORREO INVALIDO', 'el correo del ' + obj[nums].vcNombre + ' No es valido');
                                    nums = nums + 1;
                                    declare(obj, nums, max);
                                };

                            } else {
                                toastr.error('NO SE PUDO GENERAR PDF', 'error al generar pdf del personal' + obj[nums].vcNombre);
                                nums = nums + 1;
                                declare(obj, nums, max);
                            }

                        },
                        error: function (error) {
                            alert(JSON.stringify(error))
                            nums = nums + 1;
                            declare(obj, nums, max);
                        }
                    });
                } else {
                    alert('Complete los Datos, Por Favor');
                }

            } else {
                $('#btnSendEmail').modal('hide');
                $('#Nom2').html('');
                $('#loadingutil').hide();
                toastr.success('ENVIO DE CORREOS FIANLIZADO', '');
                $('#counttk').html('');
                $('#restante').hide();
                cargatabla();

                $('#selx').text('');
                $("#Div_close_part").hide();
                $("#btn-send").hide();
            }

        }

        $("#btnSendEmail").click(function () {
            $('#restantes').show();
            $('#sendutil').show();
            var obj2 = new Object();
            x = -1;
            for (var i = 0; i < selected.length; i++) {
                x++
                var obj = new Object();
                obj.vcCodigo = selected[i].cNroDocumento;
                obj.vcNombre = selected[i].cApeNom;
                obj.vcEmail = selected[i].cEmail;
                obj.vnDetalle = 1;
                obj.vcAsuntoEmail = '';
                obj.vcMensaje = '';

                obj2[i] = obj;
            }
            declare(obj2, 0, x);
        });




    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
