<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_InstruccionEmbarque.aspx.cs" Inherits="SFC_WEB_APP.Mod_Cmx.Wfo_InstruccionEmbarque" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/datatables.min.css">
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/buttons.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/buttons.bootstrap4.min.css">
    <!-- END: Vendor CSS-->
    <style>
        table {
            border-spacing: 0;
            border-collapse: collapse;
            width: 100%;
            margin: 0 auto;
        }

        .table th {
            padding: 0.65rem 1rem;
            font-size: 12px
        }

        .table td {
            padding: 0.65rem 0.65rem !important;
            font-size: 10px
        }

        .table-m th {
            font-size: 10px
        }

        .table-m td {
            padding: 0.35rem 0.35rem !important;
            font-size: 10px;
            padding-bottom: 6px;
        }

        .bolded {
            font-weight: bold;
        }

        .label-success {
            background-color: #72de1952;
            border-radius: 15px;
            padding: 2px;
            text-align: center;
        }

        .ui-autocomplete {
            z-index: 1115 !important;
        }

        .table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        .tr-nopm tbody tr td {
            padding: 4px;
            margin: 4px;
            text-align: center;
            font-size: 0.9rem;
        }

        .tr-nopm thead tr th {
            padding: 6px;
            margin: 6px;
        }

        .lbl-direccion {
            font-size: 10px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" style="display: none">
            <label for="btnBusc">Exportador</label>
            <select class="form-control" id="ficha" name="ficha">
                <option value="0" selected="selected" disabled="disabled">Seleccione Campaña</option>
                <option value="4">Sunfruits Packs</option>
            </select>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2 pb-0 mb-0">
            <label for="recuperar">&nbsp;</label>
            <button type="button" id="btnRecuperar" name="btnRecuperar" class="btn btn-secondary col-12">
                <i class="fa fa-search"></i>Recuperar
            </button>
        </div>
    </div>
    <section id="cell-background">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">INSTRUCCION DE EMBARQUE</h4>
                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li id="btn-excel" style="display: none"><a id='excelExport' title="Exportar en Excel"><i class="fas fa-file-excel"></i></a></li>
                                <li id="btn-add-div"><a id='btn-add' title="Añadir nuevo" data-toggle="modal" data-target="#AddPersonal"><i class="fas fa-plus"></i></a></li>
                                <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body card-dashboard">
                            <table id="tblInstruccion" class="table-striped table-bordered display" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>Cliente</th>
                                        <th>Destino</th>
                                        <th>Consignee</th>
                                        <th>Notify</th>
                                        <th>Notify 2</th>
                                        <th>Usuario</th>
                                        <th>Fecha</th>
                                        <th>#</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="modal fade" id="ModInstruccion" data-backdrop-limit="1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-modal-parent="#ModOrden">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Instruccion de Embarque</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Campaña:</label>
                                <asp:DropDownList ID="ddlCampana" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group mb-1">
                                <label for="txtFeCont" class="col-form-label pb-0">Cliente:</label>
                                <input type="text" id="cCliente" name="cCliente" autocomplete="off" class="form-control round" placeholder="Cliente">
                                <input type="hidden" id="IdCliente" name="IdCliente" value="0">
                                <div id="DivCliente" class="p-1 m-1 lbl-direccion" style="display: none"></div>
                                <div class="form-group mb-2" id="DivtblCliente" style="display: none">
                                    <table id="tblCliente" class="table-m table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Contacto</th>
                                                <th>Movil</th>
                                                <th>Email</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Destino:</label>
                                <asp:DropDownList ID="ddlDestino" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group mb-1">
                                <label for="txtFeCont" class="col-form-label pb-0">Consignatario:</label>
                                <input type="text" id="cConsignatario" name="cConsignatario" autocomplete="off" class="form-control round" placeholder="Consignatario">
                                <input type="hidden" id="IdConsignatario" name="IdConsignatario" value="0">
                                <div id="DivConsignatario" class="p-1 m-1 lbl-direccion"></div>
                                <div class="form-group mb-2" id="DivtblConsignatario" style="display: none">
                                    <table id="tblConsignatario" class="table-m table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Contacto</th>
                                                <th>Movil</th>
                                                <th>Email</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-1">
                                <label for="txtFeCont" class="col-form-label pb-0">Notificador 1:</label>
                                <input type="text" id="cNotificador" name="cNotificador" autocomplete="off" class="form-control round" placeholder="Consignatario">
                                <input type="hidden" id="IdNotificador" name="IdConsignatario" value="0">
                                <div id="DivNotificador" class="p-1 m-1 lbl-direccion"></div>
                                <div class="form-group mb-2" id="DivtblNotificador" style="display: none">
                                    <table id="tblNotificador" class="table-m table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Contacto</th>
                                                <th>Movil</th>
                                                <th>Email</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="form-group mb-1">
                                <label for="txtFeCont" class="col-form-label pb-0">Notificador 2:</label>
                                <input type="text" id="cNotificador2" name="cNotificador" autocomplete="off" class="form-control round" placeholder="Consignatario">
                                <input type="hidden" id="IdNotificador2" name="IdConsignatario" value="0">
                                <div id="DivNotificador2" class="p-1 m-1 lbl-direccion"></div>
                                <div class="form-group mb-2" id="DivtblNotificador2" style="display: none">
                                    <table id="tblNotificador2" class="table-m table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Contacto</th>
                                                <th>Movil</th>
                                                <th>Email</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="form-group mb-1" id="DivFeIni">
                                <label for="txtFeCont" class="col-form-label pb-0">Fecha Inicio:</label>
                                <input type="text" id="FechaIni" name="FechaIni" autocomplete="off" class="form-control round" placeholder="dd/mm/yyyy">
                                <script type="text/javascript">
                                    $(function () {
                                        $('#FechaIni').datetimepicker({
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
                            <div class="form-group mb-1" id="DivFeFin">
                                <label for="txtFeCont" class="col-form-label pb-0">Fecha Fin:</label>
                                <input type="text" id="FechaFin" name="FechaFin" autocomplete="off" class="form-control round" placeholder="dd/mm/yyyy">
                                <script type="text/javascript">
                                    $(function () {
                                        $('#FechaFin').datetimepicker({
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
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="nIdInstruccion" value="0" />
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" id="addInstruccion" class="btn btn-primary">Agregar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- BEGIN: PageScripts/ Vendor JS-->
    <script src="../Scripts/dt/datatables.min.js"></script>
    <script src="../Scripts/dt/dataTables.buttons.min.js"></script>
    <script src="../Scripts/dt/buttons.bootstrap4.min.js"></script>
    <script src="../Scripts/dt/vfs_fonts.js"></script>
    <script src="../Scripts/dt/buttons.html5.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <!-- END: Page VScripts/endor JS-->
    <script>
        $(document).on('click', '#btnRecuperar', function (e) {
            e.preventDefault();
            Load_InstruccionE();
        })

        $("#cNotificador2").autocomplete({
            source: function (request, response) {
                var obj = new Object();
                obj.vnId = '0';
                obj.vcNombre = $("#cNotificador2").val();
                $.ajax({
                    url: "../SerComex.asmx/ClienteListArray",
                    data: JSON.stringify({ obj: obj }),
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    // dataFilter: function (data) { return data; },
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                val: item.split('-')[0],
                                label: item.split('-')[1],
                                num: item.split('-')[2]
                            }
                        }))
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(textStatus);
                    }
                });
            },
            select: function (event, ui) {
                if (ui.item) {
                    if (ui.item.val != '0' && ui.item.label != '') {
                        var obj = new Object();
                        obj.vnId = ui.item.val;
                        $.ajax({
                            type: 'POST',
                            url: "../SerComex.asmx/ListContactosClientes",
                            data: JSON.stringify({ obj: obj }),
                            dataType: 'json',
                            contentType: 'application/json; charset=utf-8',
                            success: function (data) {
                                var lst = JSON.parse(data.d);
                                if (lst.length != '0') {
                                    var vvIng = "";

                                    for (i = 0; i < lst.length; ++i) {
                                        vvIng += "<tr><td>" + lst[i].NombreCompleto + "</td><td>" + lst[i].Telefonofijo + '/' + lst[i].TelefonoMovil + "</td><td>" + lst[i].Email + "</td></tr>";
                                    }
                                    $('#DivtblNotificador2').show();
                                    $("#tblNotificador2 tbody").html(vvIng);
                                } else {
                                    $('#DivtblNotificador2').hide();
                                    $("#tblNotificador2 tbody").html('');
                                }

                            }
                        })
                        var labels = '<p class="m-0 p-0"><b>Dir: ' + ui.item.num + '</b></p>';
                        $('#IdNotificador2').val(ui.item.val);
                        $('#DivNotificador2').show();
                        $('#DivNotificador2').html(labels);
                        $("#cNroDocumento").focus();
                    } else {
                        $('#IdNotificador2').val('0');
                    }
                }
            },
            minLength: 2
        });

        $("#cNotificador").autocomplete({
            source: function (request, response) {
                var obj = new Object();
                obj.vnId = '0';
                obj.vcNombre = $("#cNotificador").val();
                $.ajax({
                    url: "../SerComex.asmx/ClienteListArray",
                    data: JSON.stringify({ obj: obj }),
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    // dataFilter: function (data) { return data; },
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                val: item.split('-')[0],
                                label: item.split('-')[1],
                                num: item.split('-')[2]
                            }
                        }))
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(textStatus);
                    }
                });
            },
            select: function (event, ui) {
                if (ui.item) {
                    if (ui.item.val != '0' && ui.item.label != '') {
                        var obj = new Object();
                        obj.vnId = ui.item.val;
                        $.ajax({
                            type: 'POST',
                            url: "../SerComex.asmx/ListContactosClientes",
                            data: JSON.stringify({ obj: obj }),
                            dataType: 'json',
                            contentType: 'application/json; charset=utf-8',
                            success: function (data) {
                                var lst = JSON.parse(data.d);
                                if (lst.length != '0') {
                                    var vvIng = "";

                                    for (i = 0; i < lst.length; ++i) {
                                        vvIng += "<tr><td>" + lst[i].NombreCompleto + "</td><td>" + lst[i].Telefonofijo + '/' + lst[i].TelefonoMovil + "</td><td>" + lst[i].Email + "</td></tr>";
                                    }
                                    $('#DivtblNotificador').show();
                                    $("#tblNotificador tbody").html(vvIng);
                                } else {
                                    $('#DivtblNotificador').hide();
                                    $("#tblNotificador tbody").html('');
                                }

                            }
                        })
                        var labels = '<p class="m-0 p-0"><b>Dir: ' + ui.item.num + '</b></p>';
                        $('#IdNotificador').val(ui.item.val);
                        $('#DivNotificador').show();
                        $('#DivNotificador').html(labels);
                        $("#cNroDocumento").focus();
                    } else {
                        $('#IdNotificador').val('0');
                    }
                }
            },
            minLength: 2
        });

        $("#cConsignatario").autocomplete({
            source: function (request, response) {
                var obj = new Object();
                obj.vnId = '0';
                obj.vcNombre = $("#cConsignatario").val();
                $.ajax({
                    url: "../SerComex.asmx/ClienteListArray",
                    data: JSON.stringify({ obj: obj }),
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    // dataFilter: function (data) { return data; },
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                val: item.split('-')[0],
                                label: item.split('-')[1],
                                num: item.split('-')[2]
                            }
                        }))
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(textStatus);
                    }
                });
            },
            select: function (event, ui) {
                if (ui.item) {
                    if (ui.item.val != '0' && ui.item.label != '') {
                        var obj = new Object();
                        obj.vnId = ui.item.val;
                        $.ajax({
                            type: 'POST',
                            url: "../SerComex.asmx/ListContactosClientes",
                            data: JSON.stringify({ obj: obj }),
                            dataType: 'json',
                            contentType: 'application/json; charset=utf-8',
                            success: function (data) {
                                var lst = JSON.parse(data.d);
                                if (lst.length != '0') {
                                    var vvIng = "";

                                    for (i = 0; i < lst.length; ++i) {
                                        vvIng += "<tr><td>" + lst[i].NombreCompleto + "</td><td>" + lst[i].Telefonofijo + '/' + lst[i].TelefonoMovil + "</td><td>" + lst[i].Email + "</td></tr>";
                                    }

                                    $('#DivtblConsignatario').show();
                                    $("#tblConsignatario tbody").html(vvIng);
                                } else {
                                    $('#DivtblConsignatario').hide();
                                    $("#tblConsignatario tbody").html('');
                                }

                            }
                        })
                        var labels = '<p class="m-0 p-0"><b>Dir: ' + ui.item.num + '</b></p>';
                        $('#IdConsignatario').val(ui.item.val);
                        $('#DivConsignatario').show();
                        $('#DivConsignatario').html(labels);
                        $("#cNroDocumento").focus();
                    } else {
                        $('#IdConsignatario').val('0');
                    }
                }
            },
            minLength: 2
        });

        $("#cCliente").autocomplete({
            source: function (request, response) {
                var obj = new Object();
                obj.vnId = '0';
                obj.vcNombre = $("#cCliente").val();
                $.ajax({
                    url: "../SerComex.asmx/ClienteListArray",
                    data: JSON.stringify({ obj: obj }),
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    // dataFilter: function (data) { return data; },
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                val: item.split('-')[0],
                                label: item.split('-')[1],
                                num: item.split('-')[2]
                            }
                        }))
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(textStatus);
                    }
                });
            },
            select: function (event, ui) {
                if (ui.item) {
                    if (ui.item.val != '0' && ui.item.label != '') {
                        var obj = new Object();
                        obj.vnId = ui.item.val;
                        $.ajax({
                            type: 'POST',
                            url: "../SerComex.asmx/ListContactosClientes",
                            data: JSON.stringify({ obj: obj }),
                            dataType: 'json',
                            contentType: 'application/json; charset=utf-8',
                            success: function (data) {
                                var lst = JSON.parse(data.d);
                                if (lst.length != '0') {
                                    var vvIng = "";

                                    for (i = 0; i < lst.length; ++i) {
                                        vvIng += "<tr><td>" + lst[i].NombreCompleto + "</td><td>" + lst[i].Telefonofijo + '/' + lst[i].TelefonoMovil + "</td><td>" + lst[i].Email + "</td></tr>";
                                    }

                                    $('#DivtblCliente').show();
                                    $("#tblCliente tbody").html(vvIng);
                                } else {
                                    $('#DivtblCliente').hide();
                                    $("#tblCliente tbody").html('');
                                }

                            }
                        })
                        var labels = '<p class="m-0 p-0"><b>Dir: ' + ui.item.num + '</b></p>';
                        $('#IdCliente').val(ui.item.val);
                        $('#DivCliente').html(labels);
                        $('#DivCliente').show();
                        $("#cNroDocumento").focus();
                    } else {
                        $('#DivCliente').hide();
                        $('#DivtblCliente').hide();
                        $("#tblCliente tbody").html('');
                    }
                } else {
                    $('#DivCliente').hide();
                    $('#DivtblCliente').hide();
                    $("#tblCliente tbody").html('');
                }
            },
            minLength: 2
        });
<%--           $('body').on('change', '#', function () {
               var obj = new Object();
               obj.vcIdEmpresa = fuGetCdEmpre();
               obj.vnIdInstruccion = this.value;
               obj.vnIdCliente = 0;
               obj.vnIdDestino = 0;
               obj.vnIdConsignee = 0;
               obj.vnIdNotify = 0;
               obj.vnIdNotify2 = 0;
               if (obj.vcIdEmpresa != "" && obj.vnIdInstruccion != '0') {

                   $.ajax({
                       type: 'POST',
                       url: "../SerComex.asmx/InstruccionList",
                       data: JSON.stringify({ obj: obj }),
                       dataType: 'json',
                       contentType: 'application/json; charset=utf-8',
                       success: function (data) {
                           var lst = JSON.parse(data.d);
                           if (lst.length != '0') {
                               var vvIng = "";

                               for (i = 0; i < lst.length; ++i) {
                               }
                           } else {
                               $('#<%=ddlCliente.ClientID%>').val(lst[i].nIdCliente);
                           }
                           //var table = $('#tblGuias').DataTable();
                           //table.destroy();
                           //LoadGuias();

                       },
                       error: function (error) {
                           toastr.error(JSON.stringify(error), '');
                       }
                   });
               } else {
               }
           });--%>

        $('.modal-child').on('show.bs.modal', function () {
            var modalParent = $(this).attr('data-modal-parent');
            $(modalParent).css('opacity', 0);
        });

        $('.modal-child').on('hidden.bs.modal', function () {
            var modalParent = $(this).attr('data-modal-parent');
            $(modalParent).css('opacity', 1);
        });

        $("#btn-add").click(function () {
            $('#ModInstruccion').modal('show');
        });

        $("#btnaddCajas").click(function () {
            if ($("#ddlCultivo").val() != '0') {
                $('#ModCajas').modal('show');
                $('#nIdCajasOE').val($(this).val());
            } else {
                toastr.error('', 'selesccione cultivo');
                $('#nIdCajasOE').val('0');
            }
        });

        $(".edit").click(function () {
            $('#ModOrden').modal('show');
        });

        var table = $('#OrdenEmbarque').DataTable({

        });

        $(document).on('click', '#addInstruccion', function (e) {
            e.preventDefault();
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdInstruccion = $('#nIdInstruccion').val();
            obj.vnIdCampana = $('#<%=ddlCampana.ClientID%>').val();
               obj.vnIdCliente = $('#IdCliente').val();
               obj.vnIdLocalizacion = $('#<%=ddlDestino.ClientID%>').val();
               obj.vnIdConsignee = $('#IdConsignatario').val();
               obj.vnIdNotify = $('#IdNotificador').val();
               obj.vnIdNotify2 = $('#IdNotificador2').val();
               obj.vcFechaIni = $('#FechaIni').val();
               obj.vcFechaFin = $('#FechaFin').val();
               if (obj.vcIdEmpresa != "" && obj.vnIdInstruccion != '' && obj.vnIdCliente != '0' && obj.vnIdDestino != '0' && obj.vnIdConsignee != '0' && obj.vnIdNotify != '0') {
                   $.ajax({
                       type: 'POST',
                       url: "../SerComex.asmx/InstruccionRegi",
                       data: JSON.stringify({ obj: obj }),
                       dataType: 'json',
                       contentType: 'application/json; charset=utf-8',
                       success: function (data) {
                           toastr.success(data, 'Agregado');
                           //clearModCajasOE();
                           Load_InstruccionE();
                           $('#ModInstruccion').modal('hide');
                           //var table = $('#tblGuias').DataTable();
                           //table.destroy();
                           //LoadGuias();
                       },
                       error: function (error) {
                           toastr.error(JSON.stringify(error), '');
                       }
                   });

               } else {
                   toastr.error('Verifique', 'Faltan datos');
               }

           });

        $(document).on('click', '.DeleteInstruccionEmbarque', function (e) {
            e.preventDefault();
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdInstruccion = $(this).val();
            if (obj.vcIdEmpresa != "" && obj.vnIdInstruccion != '0') {
                $.ajax({
                    type: 'POST',
                    url: "../SerComex.asmx/InstruccionEmbarqueDelete",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        toastr.success(data, 'Eliminado');
                        Load_InstruccionE();
                        //var table = $('#tblGuias').DataTable();
                        //table.destroy();
                        //LoadGuias();
                    },
                    error: function (error) {
                        toastr.error(JSON.stringify(error), '');
                    }
                });

            } else {
                toastr.error('Verifique', 'Faltan datos');
            }

        });

        function clearModCajasOE() {
            $('#nIdCajasOE').val('0');
            $('#ncajas').val('');
            $("#porconfirmar").prop("checked", false);
        }

        function Load_InstruccionE() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdInstruccion = 0;
            obj.vnIdCampaña = 0;
            obj.vnIdCliente = 0;
            obj.vnIdLocalizacion = 0;
            obj.vnIdConsignee = 0;
            obj.vnIdNotify = 0;
            obj.vnIdNotify2 = 0;
            $.ajax({
                type: 'POST',
                url: "../SerComex.asmx/InstruccionList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    if (lst.length != '0') {
                        var vvIng = "";

                        for (i = 0; i < lst.length; ++i) {

                            vvIng += "<tr><td>" + lst[i].cDescCliente + "</td><td>" + lst[i].cDescDestino + "</td><td>" + lst[i].cDesConsignee + "</td><td>" + lst[i].cDesNotify + "</td><td>" + lst[i].cDesNotify2 + "</td><td>" + lst[i].cUsuarioCrea + "</td><td>"+lst[i].cFechaCrea+"</td >";
                            // vvIng += "<td><button class='cajas-edit btn btn-link yellow m-0 p-0' value='" + lst[i].nIdInstruccion + "'><i class='fas fa-edit'></i></button>"
                            vvIng += "<td><button class='DeleteInstruccionEmbarque btn btn-link red m-0 p-0' value='" + lst[i].nIdInstruccion + "'><i class='fas fa-remove'></i></button></td>"
                            vvIng += "</tr>"

                        }
                        $("#tblInstruccion tbody").html(vvIng);
                    } else {

                        $("#tblInstruccion tbody").html('');
                    }

                    //toastr.success(data, 'Agregado');
                    //var table = $('#tblGuias').DataTable();
                    //table.destroy();
                    //LoadGuias();
                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        };

        Load_InstruccionE();

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
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
