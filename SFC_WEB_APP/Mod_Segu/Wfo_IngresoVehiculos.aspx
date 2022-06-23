<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_IngresoVehiculos.aspx.cs" Inherits="SFC_WEB_APP.Mod_Segu.Wfo_IngresoVehiculos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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
    </style>

    <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body">
                            <h4 class="card-title info">Control Vehicular</h4>

                            <div class="row text-center">
                                <div class="col-md-3">
                                </div>
                                <div class="col-md-3 pt-4">

                                </div>
                                <div class="col-md-3 pt-4">

                                </div>
                                <div class="col-md-3">
                                </div>
                            </div>
                            <br />
                            <div class="form-group col-md-12">
                                <div class="row p-0 m-0 text-center">
                                    <div style="width: 50%">
                                                                            <a class="btn btn-lg btn-success" id="ingreso" data-toggle="modal" data-target="#ModIngreso">
                                        <i class="fa fa-arrow-down"></i>Ingreso <i class="fa fa-arrow-down"></i>
                                    </a>
                                    </div>
                                    <div style="width: 50%">
                                           <a class="btn btn-lg btn-success" id="salida" data-toggle="modal" data-target="#ModSalida">
                                        <i class="fa fa-arrow-up"></i>Salida <i class="fa fa-arrow-up"></i>
                                    </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body">
                            <h4 class="card-title info">Historial</h4>
                            <div class="row text-center">
                                <div class="col-md-6 table">
                                    <span>INGRESOS</span>
                                    <table id="tblIngreso" class="table table-striped table-bordered dt-responsive nowrap tr-nopm">
                                        <thead>
                                            <tr>
                                                <th># Placa</th>
                                                <th>tipo</th>
                                                <th>Ingreso</th>
                                                <th>Detalles</th>
                                                <th>Salida</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-6 table">
                                    <span>SALIDAS</span>
                                    <table id="tblSalida" class="table table-striped table-bordered dt-responsive nowrap tr-nopm">
                                        <thead>
                                            <tr>
                                                <th style="width: 20%"># Placa  </th>
                                                <th style="width: 30%">tipo</th>
                                                <th style="width: 20%">Ingreso</th>
                                                <th style="width: 20%">Salida</th>
                                                <th style="width: 10%">Detalles</th>
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
            </div>
        </div>
    </div>

    <!-- ////////////////////// ENTRADA ////////////////////////////////// -->
    <div class="modal fade" id="ModIngreso" data-backdrop="true" tabindex="-1" role="dialog" aria-hidden="true">

        <div class="modal-dialog modal-xs" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">INGRESO VEHICULO</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <!-- VEHICULO -->
                    <div class="form-group mb-1" id="idVehiculo">
                        <label for="message-text" class="col-form-label">Placa Vehiculo:</label>
                        <div class="input-group">
                            <input type="text" id="cPlaca" class="form-control round" placeholder="Ingrese Placa de Vehiculo" oninput="this.value = this.value.toUpperCase()" onkeyup="v_Placa(this.value, 'E')">
                            <input type="hidden" id="nIdVehiculo">
                        </div>
                    </div>
                    <label id="LabelVehiculo" class="label-success" style="display: none"></label>
                    <div id="DatVehiculo" style="padding-left: 25px; display: none">
                        <div class="form-group mb-1">
                            <label for="message-text" class="col-form-label">Tipo Vehiculo:</label>
                            <asp:DropDownList ID="ddlTipoVehiculo" runat="server" CssClass="custom-select myform-control"></asp:DropDownList>
                        </div>
                        <div class="form-group mb-1">
                            <label for="message-text" class="col-form-label">Descripcion Vehiculo:</label>
                            <input type="text" id="cDescVehiculo" class="form-control round" placeholder="" autocomplete="off">
                        </div>
                    </div>
                    <!-- VEHICULO -->


                    <!-- CONDUCTOR -->
                    <div class="form-group mb-1" id="idConductor">
                        <label for="message-text" class="col-form-label">DNI:</label>
                        <div class="input-group">
                            <input type="text" id="cNroDocumento" class="form-control round num" placeholder="Ingrese su número de  Dni" onkeyup="v_Conductor(this.value)">
                            <input type="hidden" id="nIdConductor">
                        </div>
                    </div>
                    <label id="LabelConductor" class="label-success" style="display: none"></label>
                    <div id="DatConductor" style="padding-left: 25px; display: none">
                        <div class="form-group mb-1">
                            <label for="message-text" class="col-form-label">Nombres:</label>
                            <input type="text" id="cNombres" class="form-control round dat-conductor" placeholder="" autocomplete="off">
                        </div>
                        <div class="form-group mb-1">
                            <label for="message-text" class="col-form-labelr">Apellido Paterno:</label>
                            <input type="text" id="cApPaterno" class="form-control round dat-conductor" placeholder="" autocomplete="off">
                        </div>
                        <div class="form-group mb-1">
                            <label for="message-text" class="col-form-label">Apellido Materno:</label>
                            <input type="text" id="cApMaterno" class="form-control round dat-conductor" placeholder="" autocomplete="off">
                        </div>
                        <div class="form-group mb-1">
                            <label for="message-text" class="col-form-label">Licencia:</label>
                            <input type="text" id="cLicenciaConducir" class="form-control round dat-conductor-lic" placeholder="" autocomplete="off">
                        </div>
                    </div>
                    <!-- CONDUCTOR -->

                    <!-- CLIENTE -->
                    <div class="form-group mb-1" id="idCliente">
                        <label for="message-text" class="col-form-label">Cliente / Proveedor:</label>
                        <div class="input-group">
                            <input type="text" id="cDescClieProv" class="form-control round descli" placeholder="Ingrese Nombre y/o RUC">
                            <input type="hidden" id="nIdClieProv">
                        </div>
                    </div>
                    <label id="LabelCliente" class="label-success" style="display: none"></label>
                    <div id="DatCliente" style="padding-left: 25px; display: none">
                        <div class="form-group mb-1">
                            <label for="message-text" class="col-form-label">Ruc:</label>
                            <input type="text" id="nIdentClieProv" value="" class="form-control round">
                        </div>
                    </div>
                    <!-- CLIENTE -->

                    <div class="form-group p-0 m-0" id="DivFechaProc">
                        <label for="txtFecha">Fecha Ingreso</label>
                        <input type="text" id="txtfechaIngreso" autocomplete="off" class="form-control round" placeholder="dd/mm/yyyy">
                        <script type="text/javascript">
                            $(function () {
                                $('#txtfechaIngreso').datetimepicker({
                                    format: 'DD/MM/YYYY',
                                    locale: 'es'
                                });
                                $(function () {
                                    $('#DivFechaProc').datetimepicker({
                                        format: 'DD/MM/YYYY',
                                        locale: 'es'
                                    });
                                });
                            });
                        </script>
                    </div>
                    <div class="form-group p-0 m-0" id="DivHoraProc">
                        <label for="recipient-name" class="col-form-label">Hora Ingreso:</label>
                        <input type="text" id="txtHoraIngreso" autocomplete="off" class="form-control" placeholder="HH:mm:ss">
                        <script type="text/javascript">
                            $(function () {
                                $('#txtHoraIngreso').datetimepicker({
                                    format: 'HH:mm:ss',
                                    locale: 'es'
                                });
                                $(function () {
                                    $('#DivHoraProc').datetimepicker({
                                        format: 'HH:mm:ss',
                                        locale: 'es'
                                    });
                                });
                            });
                        </script>
                    </div>
                    <br />
                    <div class="form-group mb-1 text-center">
                        <button type="button" id="insertdet" class="btn btn-primary" data-toggle="modal" data-target="#ModGuia">+ guia</button>
                    </div>
                    <div class="form-group mb-1">
                        <table class="table tr-nopm text-center" style="width:100%; display: table;" id="tblGuias">
                            <thead>
                                <tr>
                                    <th style="width:35%">guia</th>
                                    <th style="width:35%">variedad</th>
                                    <th style="width:15%">jabas</th>
                                    <th style="width:15%">#</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Observacion Ingreso:</label>
                        <textarea id="cObservacionIngreso" class="form-control round"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="nIdControlGarita" value="0">
                    <button class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <a id="SaveIn" class="btn btn-primary">Agregar</a>
                </div>
            </div>
        </div>
    </div>
    <!-- ////////////////////// ENTRADA ////////////////////////////////// -->


    <!-- ////////////////////// SALIDA ////////////////////////////////// -->
    <div class="modal fade" id="ModSalida" data-backdrop="true" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-xs" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">INGRESO VEHICULO</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- VEHICULO -->
                    <div class="form-group mb-1" id="idVehiculoSalida">
                        <label for="message-text" class="col-form-label">Placa Vehiculo:</label>
                        <div class="input-group">
                            <input type="text" id="cPlacaSalida" class="form-control round" placeholder="Ingrese Placa de Vehiculo" onkeyup="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase(); v_Placa(this.value, 'S')">
                            <input type="hidden" id="nIdVehiculoSalida">
                        </div>
                    </div>
                    <label id="LabelVehiculoSalida" class="label-success" style="display: none"></label>
                    <div id="DatVehiculoSalida" style="padding-left: 25px; display: none">
                        <div class="form-group mb-1">
                            <label for="message-text" class="col-form-label">Tipo Vehiculo:</label>
                            <asp:DropDownList ID="ddlTipoVehiculoS" runat="server" CssClass="custom-select myform-control"></asp:DropDownList>
                        </div>
                        <div class="form-group mb-1">
                            <label for="message-text" class="col-form-label">Descripcion Vehiculo:</label>
                            <input type="text" id="cDescVehiculoSalida" class="form-control round" placeholder="" autocomplete="off">
                        </div>
                    </div>
                    <!-- VEHICULO -->
                    <div id="obsSalidaSalida">
                        <div class="form-group p-0 m-0" id="DivFechaSalida">
                            <label for="txtFecha">Fecha Salida</label>
                            <input type="text" id="txtfechaSalida" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
                            <script type="text/javascript">
                                $(function () {
                                    $('#txtfechaSalida').datetimepicker({
                                        format: 'DD/MM/YYYY',
                                        locale: 'es'
                                    });
                                    $(function () {
                                        $('#DivFechaSalida').datetimepicker({
                                            format: 'DD/MM/YYYY',
                                            locale: 'es'
                                        });
                                    });
                                });
                            </script>
                        </div>
                        <div class="form-group p-0 m-0" id="DivHoraSalida">
                            <label for="recipient-name" class="col-form-label">Hora Salida:</label>
                            <input type="text" id="txtHoraSalida" autocomplete="off" class="form-control" placeholder="HH:mm:ss">
                            <script type="text/javascript">
                                $(function () {
                                    $('#txtHoraSalida').datetimepicker({
                                        format: 'HH:mm:ss',
                                        locale: 'es'
                                    });
                                    $(function () {
                                        $('#DivHoraSalida').datetimepicker({
                                            format: 'HH:mm:ss',
                                            locale: 'es'
                                        });
                                    });
                                });
                            </script>
                        </div>
                        <div class="form-group mb-1">
                            <label for="message-text" class="col-form-label">Observacion Salida:</label>
                            <textarea id="cObservacionSalida" class="form-control round"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="nIdControlGaritaSalida" value="0">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" id="SaveOutIn" class="btn btn-primary green">Agregar Salida</button>
                </div>
            </div>
        </div>
    </div>
    <!-- ////////////////////// SALIDA ////////////////////////////////// -->

    <!-- ////////////////////// GUIAS ////////////////////////////////// -->
    <div class="modal fade" id="ModGuia" data-backdrop="true" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-xs" role="document">
            <div class="modal-content" style="background-color: #17ceb8;">
                <div class="modal-header">
                    <h5 class="modal-title">Guia</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">N° Guia:</label>
                        <input type="text" id="Guia" class="form-control round num" placeholder="N° Guia">
                    </div>
                    <asp:UpdatePanel runat="server" ID="UpdDDL">
                        <ContentTemplate>
                            <div class="form-group p-0 m-0">
                                <label for="message-text" class="col-form-label">Cultivo:</label>
                                <asp:DropDownList ID="ddlCultivo" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCultivo_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="form-group p-0 m-0">
                                <label for="message-text" class="col-form-label">Variedad:</label>
                                <asp:DropDownList ID="ddlVariedad" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlCultivo" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Jabas:</label>
                        <input type="text" id="Jabas" class="form-control round num" placeholder="Jabas">
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Kilos:</label>
                        <input type="text" id="Kilos" class="form-control round num" placeholder="KIlos">
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="nidGuia" value="0">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar panel</button>
                    <button type="button" id="SaveGuia" class="btn btn-primary">Agregar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- ////////////////////// GUIAS ////////////////////////////////// -->

    <!-- ////////////////////// VER DATA ////////////////////////////////// -->
    <div class="modal fade" id="ModShow" data-backdrop="true" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-xs" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Informacion de Vehiculo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">N° Placa:</label>
                        <b><span id="txtPlaca"></span></b>
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Tipo Vehiculo:</label>
                        <b><span id="txttipo"></span></b>
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Conductor:</label>
                        <b><span id="txtconductor"></span></b>
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Productor:</label>
                        <b><span id="txtcliente"></span></b>
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Guias:</label>
                        <b><span id="txtguias"></span></b>
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Variedades:</label>
                        <b><span id="txtvariedades"></span></b>
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Jabas:</label>
                        <b><span id="txtjabas"></span></b>
                    </div>

                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Ingreso:</label>
                        <b><span id="txtfingreso"></span></b>
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Obs. Ingreso:</label>
                        <b><span id="txtobsingreso"></span></b>
                    </div>
                    <div id="divfsalida" class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Salida:</label>
                        <b><span id="txtfsalida"></span></b>
                    </div>
                    <div id="divobssalida" class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Obs. Salida:</label>
                        <b><span id="txtobssalida"></span></b>
                    </div>
                    <div id="divtranscurrido" class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Trancurrido:</label>
                        <b><span id="txttranscurrido"></span></b>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- ////////////////////// VER DATA ////////////////////////////////// -->

    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap4.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script type="text/javascript" charset="UTF-8">

        $(document).ready(function () {
            $('.num').keyup(function () {
                this.value = (this.value + '').replace(/[^0-9^-]/g, '');
            });
        });
        //VEHICULO//
        function v_Placa(value, type) {
            if (value.length >= 6) {
                $("#cDescVehiculo").blur();
                var obj = new Object();
                obj.vcIdEmpresa = fuGetCdEmpre();
                obj.vcPlaca = value;
                obj.vcType = type;
                obj.vcDescVehiculo = $("#cDescVehiculo").val();
                $.ajax({
                    url: "../SerSegu.asmx/ListVehiculo",
                    data: JSON.stringify({ obj: obj }),
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    // dataFilter: function (data) { return data; },
                    success: function (data) {
                        lst = JSON.stringify(data.d);
                        if (lst == '[]') {
                            data.d.push(obj.vcPlaca + "-0-0");
                        };
                        $.map(data.d, function (item) {
                            label = item.split('-')[0];
                            val = item.split('-')[1];
                            num = item.split('-')[2];
                            if (val == '0' && num == 'N') {
                                toastr.error('Vehiculo ya Registro Ingreso', 'Por Favor Verificar');
                                $("#cPlaca").val('');
                                $("#cPlaca").focus();
                            } else {
                                if (type == 'E') {
                                    if (val != 0 && label != 'NN') {
                                        var labels = '<p class="m-0 p-0"><b>Vehiculo Encontrado, ' + label + ', Tipo:' + num + '</b></p>';
                                        $('#nIdVehiculo').val(val);
                                        $('#LabelVehiculo').html(labels);
                                        $('#LabelVehiculo').show();
                                        $('#cPlaca').val(label);
                                        $("#<%=ddlTipoVehiculo.ClientID%>").val('00').change;
                                        $('#cDescVehiculo').val('');
                                        $('#DatVehiculo').hide();

                                        $(".ui-menu-item").hide();
                                        $("#cNroDocumento").focus();
                                    } else {
                                        toastr.warning('AGREGA INFORMACION DE VEHICULO')
                                        $('#nIdVehiculo').val('0');
                                        $('#LabelVehiculo').html('');
                                        $('#LabelVehiculo').hide();
                                        $("#<%=ddlTipoVehiculo.ClientID%>").val('00').change;
                                        $('#cDescVehiculo').val('');
                                        $('#DatVehiculo').show();

                                        $("#<%=ddlTipoVehiculo.ClientID%>").focus();
                                    }
                                } else if (type == 'S') {
                                    if (val != 0 && label != 'NN') {
                                        var labels = '<p class="m-0 p-0"><b>Vehiculo Encontrado, ' + label + ', Tipo:' + num + '</b></p>';
                                        $('#nIdVehiculoSalida').val(val);
                                        $('#LabelVehiculoSalida').html(labels);
                                        $('#LabelVehiculoSalida').show();
                                        $('#cPlacaSalida').val(label);
                                        $("#<%=ddlTipoVehiculoS.ClientID%>").val('00').change;
                                        $('#cDescVehiculoSalida').val('');
                                        $('#DatVehiculoSalida').hide();

                                        $(".ui-menu-item").hide();
                                        $("#txt").focus();
                                    } else {
                                        toastr.error('VEHICULO NO ENCONTRADO O NO INGRESO, VERIFIQUE NUMERO PLACA')
                                        $('#nIdVehiculoSalida').val('0');
                                        $('#LabelVehiculoSalida').html('');
                                        $('#LabelVehiculoSalida').hide();

                                    }
                                }

                            }
                        })


                    },
                });
            } else {
                $('#LabelVehiculo').hide();
                $('#DatVehiculo').hide();
            }
        }

        $("#cPlaca").autocomplete({
            source: function (request, response) {
                var obj = new Object();
                obj.vcIdEmpresa = fuGetCdEmpre();
                obj.vcPlaca = $("#cPlaca").val();
                obj.vcType = 'E';
                obj.vcDescVehiculo = $("#cDescVehiculo").val();
                $.ajax({
                    url: "../SerSegu.asmx/ListVehiculo",
                    data: JSON.stringify({ obj: obj }),
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    // dataFilter: function (data) { return data; },
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('-')[0],
                                val: item.split('-')[1],
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
                    if (ui.item.label.length >= 6 && ui.item.val == '0' && ui.item.num == 'N') {
                        toastr.error('Vehiculo con placa ' + ui.item.label + ' ya Registro Ingreso', 'Por Favor Verificar');
                        $("#cPlaca").val('');
                        $("#cPlaca").focus();
                    } else {
                        if (ui.item.val != '0' && ui.item.label != 'NN') {
                            var labels = '<p class="m-0 p-0"><b>Vehiculo Encontrado, ' + ui.item.label + ', Tipo:' + ui.item.num + '</b></p>';
                            $('#nIdVehiculo').val(ui.item.val);
                            $('#LabelVehiculo').html(labels);
                            $('#LabelVehiculo').show();
                            $('#cPlaca').val(ui.item.label);
                            $("#<%=ddlTipoVehiculo.ClientID%>").val('00').change;
                            $('#cDescVehiculo').val('');
                            $('#DatVehiculo').hide();

                            $(".ui-menu-item").hide();
                            $("#cNroDocumento").focus();
                        } else {
                            toastr.warning('AGREGA INFORMACION DE VEHICULO')
                            $('#nIdVehiculo').val('0');
                            $('#LabelVehiculo').html('');
                            $('#LabelVehiculo').hide();
                            $("#<%=ddlTipoVehiculo.ClientID%>").val('00').change;
                            $('#cDescVehiculo').val('');
                            $('#DatVehiculo').show();

                            $("#<%=ddlTipoVehiculo.ClientID%>").focus();
                        }
                    }

                }
            },
            minLength: 2
        });

        $("#cPlacaSalida").autocomplete({
            source: function (request, response) {
                var obj = new Object();
                obj.vcIdEmpresa = fuGetCdEmpre();
                obj.vcPlaca = $("#cPlacaSalida").val();
                obj.vcType = 'S';
                obj.vcDescVehiculo = $("#cDescVehiculo").val();
                $.ajax({
                    url: "../SerSegu.asmx/ListVehiculo",
                    data: JSON.stringify({ obj: obj }),
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    // dataFilter: function (data) { return data; },
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('-')[0],
                                val: item.split('-')[1],
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
                    if (ui.item.label.length >= 6 && ui.item.val == '0' && ui.item.num == 'N') {
                        toastr.error('Vehiculo con placa ' + ui.item.label + ' ya Registro Ingreso', 'Por Favor Verificar');
                        $("#cPlacaSalida").val('');
                        $("#cPlacaSalida").focus();
                    } else {
                        if (ui.item.val != '0' && ui.item.label != 'NN') {
                            var labels = '<p class="m-0 p-0"><b>Vehiculo Encontrado, ' + ui.item.label + ', Tipo:' + ui.item.num + '</b></p>';
                            $('#nIdVehiculoSalida').val(ui.item.val);
                            $('#LabelVehiculoSalida').html(labels);
                            $('#LabelVehiculoSalida').show();
                            $('#cPlacaSalida').val(ui.item.label);
                            $("#<%=ddlTipoVehiculo.ClientID%>").val('00').change;
                            $('#cDescVehiculoSalida').val('');
                            $('#DatVehiculoSalida').hide();

                            $(".ui-menu-item").hide();
                            $("#cNroDocumento").focus();
                        } else {
                            toastr.error('VEHICULO NO ENCONTRADO O NO INGRESO, VERIFIQUE NUMERO PLACA')
                            $('#nIdVehiculoSalida').val('0');
                            $('#LabelVehiculoSalida').html('');
                            $('#LabelVehiculoSalida').hide();
                            $("#<%=ddlTipoVehiculo.ClientID%>").val('00').change;
                            $('#cDescVehiculoSalida').val('');
                            $('#DatVehiculoSalida').show();

                            $("#<%=ddlTipoVehiculo.ClientID%>").focus();
                        }
                    }

                }
            },
            minLength: 2
        });
        //VEHICULO//


        //CONDUCTOR//
        $("#btnSearchConductor").click(function () {
            Buscar_Conductor($("#cNroDocumento").val())
        });

        function v_Conductor(value) {
            if (value.length == 8) {
                Buscar_Conductor($("#cNroDocumento").val())
                $('#LabelConductor').blur();
            } else {
                $('#LabelConductor').hide();
            }
        }

        function Buscar_Conductor(DNI) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcNroDocumento = DNI;
            obj.vcNombres = "";
            obj.vcLicenciaConducir = "";
            if (obj.vcNroDocumento != '' || obj.vcNroDocumento.length >= 8) {
                $('#LabelConductor').blur();
                $.ajax({
                    type: 'POST',
                    url: "../SerSegu.asmx/listConductor",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    beforeSend: function () {
                        $('#DatConductor').hide();
                        toastr.remove();
                        toastr.clear();
                        toastr.warning('', 'BUSCANDO INFORMACION ....');
                    },
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        if (lst != "") {

                            var labels = '<p class="m-0 p-0"><b>Conductor Encontrado, ' + lst[0].cApPaterno + ' ' + lst[0].cApMaterno + ' ' + lst[0].cNombres + ', con Licencia:' + lst[0].cLicenciaConducir + '</b></p>';
                            toastr.remove();
                            toastr.clear();
                            toastr.success('', labels)
                            $('#nIdConductor').val(lst[0].nIdConductor);
                            $('#LabelConductor').html(labels);
                            $('#LabelConductor').show();
                            $('#cApPaterno').val(lst[0].cApPaterno);
                            $('#cApMaterno').val(lst[0].cApMaterno);
                            $('#cNombres').val(lst[0].cNombres);
                            $('#cLicenciaConducir').val(lst[0].cLicenciaConducir);

                            $("#cDescCliente").focus()
                        } else {
                            $('#LabelConductor').html('');
                            $('#nIdConductor').val('0');
                            var formData = new FormData();
                            formData.append("token", "fmzh5FpaHsPWEpuGdQatjzh0dSsh1XRVpaaebkvpLMzgLbBt0jktQjR6tGLV");
                            formData.append("dni", obj.vcNroDocumento);

                            var request = new XMLHttpRequest();

                            request.open("POST", "https://api.migo.pe/api/v1/dni-beta");
                            request.setRequestHeader("Accept", "application/json");

                            request.send(formData);
                            request.onload = function () {
                                var lst = JSON.parse(this.response);
                                if (lst.success != true) {
                                    toastr.error('Informacion no Agregada', 'INFORMACION NO ENCONTRADA');
                                    $('.dat-conductor').removeAttr('disabled', 'disabled');
                                    $('#cApPaterno').val('');
                                    $('#cApMaterno').val('');
                                    $('#cNombres').val('');
                                    $('#LabelConductor').html('');
                                    $('#LabelConductor').hide();
                                    $('#cLicenciaConducir').val(DNI);
                                    $('#DatConductor').show();

                                    $('#cNombres').focus();
                                } else {
                                    var labels = '<p class="m-0 p-0"><b>Conductor Encontrado, ' + lst.apellido_materno + ' ' + lst.apellido_materno + ' ' + lst.nombres + '</b></p>';
                                    toastr.remove();
                                    toastr.clear();
                                    toastr.warning('Falta agregar Licencia de conducir', labels)
                                    $('.dat-conductor').attr('disabled', 'disabled');
                                    $('#cApPaterno').val(lst.apellido_paterno);
                                    $('#cApMaterno').val(lst.apellido_materno);
                                    $('#cNombres').val(lst.nombres);
                                    $('#cLicenciaConducir').val('');
                                    $('#LabelConductor').html('');
                                    $('#LabelConductor').hide();
                                    $('#DatConductor').show();

                                    $('#cLicenciaConducir').val(DNI);

                                    const input = document.getElementById('cLicenciaConducir');
                                    input.focus();
                                    input.setSelectionRange(0, 0);
                                }
                            };
                                

                            //$.ajax({
                            //    type: 'POST',
                            //    url: "../SerProd.asmx/GetPersonExt",
                            //    data: JSON.stringify({ obj: obj }),
                            //    dataType: 'json',
                            //    contentType: 'application/json; charset=utf-8',
                            //    success: function (data) {
                            //        toastr.remove();
                            //        toastr.clear();
                            //        alert(data.d);
                            //        var lstMast = JSON.parse(data.d);
                            //        var lst = lstMast.DatosPerson;
                            //        alert(lst);
                            //        if (lst[0].Nombres == '') {
                            //            toastr.error('Informacion no Agregada', 'INFORMACION NO ENCONTRADA');
                            //            $('.dat-conductor').removeAttr('disabled', 'disabled');
                            //            $('#cApPaterno').val(lst[0].ApellidoPaterno);
                            //            $('#cApMaterno').val(lst[0].ApellidoMaterno);
                            //            $('#cNombres').val(lst[0].Nombres);
                            //            $('#LabelConductor').html('');
                            //            $('#LabelConductor').hide();
                            //            $('#cLicenciaConducir').val(DNI);
                            //            $('#DatConductor').show();

                            //            $('#cNombres').focus();
                            //        } else {
                            //            var labels = '<p class="m-0 p-0"><b>Conductor Encontrado, ' + lst[0].ApellidoPaterno + ' ' + lst[0].ApellidoMaterno + ' ' + lst[0].Nombres + '</b></p>';
                            //            toastr.remove();
                            //            toastr.clear();
                            //            toastr.warning('Falta agregar Licencia de conducir', labels)
                            //            $('.dat-conductor').attr('disabled', 'disabled');
                            //            $('#cApPaterno').val(lst[0].ApellidoPaterno);
                            //            $('#cApMaterno').val(lst[0].ApellidoMaterno);
                            //            $('#cNombres').val(lst[0].Nombres);
                            //            $('#cLicenciaConducir').val('');
                            //            $('#LabelConductor').html('');
                            //            $('#LabelConductor').hide();
                            //            $('#DatConductor').show();

                            //            $('#cLicenciaConducir').val(DNI);

                            //            const input = document.getElementById('cLicenciaConducir');
                            //            input.focus();
                            //            input.setSelectionRange(0, 0);
                            //        }
                            //    },
                            //    error: function (error) {
                            //        toastr.error(JSON.stringify(error), '');
                            //    }
                            //});

                        }

                    },
                    error: function (error) {
                        toastr.error(JSON.stringify(error), '');
                    }
                });

            } else {
                toastr.error('Ingrese un Numero de DNI valido', 'Error en N° de DNI');
            }

        };
        //CONDUCTOR//


        // CLIENTE //
        function Buscar_Cliente(RUC) {
            var obj = new Object();
            obj.vcDescClieProv = cDescClieProv;
            if (obj.vcDescClieProv != '' || obj.vcDescClieProv.length >= 11) {
                $('#cDescCliente').blur();
                $.ajax({
                    type: 'POST',
                    url: "../SerSegu.asmx/listConductor",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    beforeSend: function () {
                        $('#DatConductor').hide();
                        toastr.remove();
                        toastr.clear();
                        toastr.warning('', 'BUSCANDO INFORMACION ....');
                    },
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        if (lst != "") {

                            var labels = '<p class="m-0 p-0"><b>Conductor Encontrado, ' + lst[0].cApPaterno + ' ' + lst[0].cApMaterno + ' ' + lst[0].cNombres + ', con Licencia:' + lst[0].cLicenciaConducir + '</b></p>';
                            toastr.remove();
                            toastr.clear();
                            toastr.success('', labels)
                            $('#nIdConductor').val(lst[0].nIdConductor);
                            $('#LabelConductor').html(labels);

                            $("#cDescCliente").focus()
                        } else {
                            $('#LabelConductor').html('');
                            $('#nIdConductor').val('0');
                            $.ajax({
                                type: 'POST',
                                url: "../SerProd.asmx/GetPersonExt",
                                data: JSON.stringify({ obj: obj }),
                                dataType: 'json',
                                contentType: 'application/json; charset=utf-8',
                                success: function (data) {
                                    toastr.remove();
                                    toastr.clear();
                                    var lstMast = JSON.parse(data.d);
                                    var lst = lstMast.DatosPerson;
                                    if (lst[0].Nombres == '') {
                                        toastr.error('Informacion no Agregada', 'INFORMACION NO ENCONTRADA');
                                        $('.dat-conductor').removeAttr('disabled', 'disabled');
                                        $('#cApPaterno').val(lst[0].ApellidoPaterno);

                                        $('#cNombres').focus();
                                    } else {
                                        var labels = '<p class="m-0 p-0"><b>Conductor Encontrado, ' + lst[0].ApellidoPaterno + ' ' + lst[0].ApellidoMaterno + ' ' + lst[0].Nombres + '</b></p>';
                                        toastr.remove();
                                        toastr.clear();
                                        toastr.warning('Falta agregar Licencia de conducir', labels)
                                        $('.dat-conductor').attr('disabled', 'disabled');

                                        $('#cLicenciaConducir').val();
                                        $('#cLicenciaConducir').focus();
                                    }
                                },
                                error: function (error) {
                                    toastr.error(JSON.stringify(error), '');
                                }
                            });

                        }

                    },
                    error: function (error) {
                        toastr.error(JSON.stringify(error), '');
                    }
                });

            } else {
                toastr.error('Ingrese un Numero de DNI valido', 'Error en N° de DNI');
            }

        };
        // CLIENTE //

        $(document).on('click', '.salida', function (e) {
            e.preventDefault();
            $('#txtfechaSalida').data("DateTimePicker").clear();
            $('#txtHoraSalida').data("DateTimePicker").clear();

            $('#nIdVehiculoSalida').val($(this).attr('idvehiculo'));
            $("#<%=ddlTipoVehiculo.ClientID%>").val('0');
            $('#cPlacaSalida').val($(this).attr('placa'));
            $('#nIdControlGaritaSalida').val($(this).attr('idcg'));
            $('#cPlacaSalida').hide();

            var labels = '<p class="m-1 p-1"><b>Vehiculo: ' + $(this).attr('placa') + ', Tipo:' + $(this).attr('tipo') + '</b></p>';
            $('#LabelVehiculoSalida').html(labels);
            $('#LabelVehiculoSalida').show();

            $('#ModSalida').modal("show");
        });

        $("#cDescClieProv").autocomplete({
            source: function (request, response) {
                var obj = new Object();
                obj.vcDescClieProv = $("#cDescClieProv").val();
                $.ajax({
                    url: "../SerSegu.asmx/ArrayClienteProd",
                    data: JSON.stringify({ obj: obj }),
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    // dataFilter: function (data) { return data; },
                    success: function (data) {
                        data.d.push("0-0-"+obj.vcDescClieProv);
                        response($.map(data.d, function (item) {
                            /*  return {
                                  value: item
                              }*/
                            return {
                                label: item.split('-')[2],
                                val: item.split('-')[1],
                                num: item.split('-')[0]
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
                    if (ui.item.val != 0) {
                        var labels = '<p class="m-0 p-0"><b>Cliente Encontrado ' + ui.item.label + ', con RUC:' + ui.item.val + '</b></p>';
                        $('#LabelCliente').html(labels);
                        $('#LabelCliente').show();

                        $('#cDescClieProv').val(ui.item.label);
                        $('#nIdentClieProv').val(ui.item.val);
                        $('#nIdClieProv').val(ui.item.num);

                        $("#txtfechaIngreso").focus();
                        $('#DatCliente').hide();
                    } else {
                        $('#LabelCliente').html('');
                        $('#LabelCliente').hide();
                        if (!isNaN(ui.item.label)) {
                            $('#nIdentClieProv').val(ui.item.label);
                            toastr.warning('INGRESE NOMBRE DE CLIENTE');
                        } else {
                            toastr.warning('INGRESE RUC Y NOMBRE DE CLIENTE');
                            $('#nIdentClieProv').focus();
                        }
                        $('#nIdClieProv').val('0');
                        
                        $('.descli').val('');
                        $('#DatCliente').show();
                    }
                }
            },
            minLength: 2
        });

        function LoadData() {

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdControlGarita = 0;
            if (obj.vcIdEmpresa != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerSegu.asmx/ListControlGarita",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        var vvIng = "";
                        var vvSal = "";

                        for (i = 0; i < lst.length; ++i) {

                            if (lst[i].dFechaSalida == null && lst[i].dFechaRegiSalida == null) {
                                //INGRESO
                                vvIng += "<tr><td><i class='fa fa-truck'></i> " + lst[i].cPlaca + "</td><td>" + lst[i].cDescripcion + "</td><td>" + lst[i].dFechaIngreso + "</td>";
                                vvIng += "<td><button class='show-data btn btn-link blue m-0 p-0' idcg='" + lst[i].nIdControlGarita + "' idvehiculo='" + lst[i].nIdVehiculo + "' placa='" + lst[i].cPlaca + "' tipo='" + lst[i].cDescripcion + "'><i class='fas fa-eye'></i></button></td>"
                                vvIng += "<td><button class='salida btn btn-link red m-0 p-0' idcg='" + lst[i].nIdControlGarita + "' idvehiculo='" + lst[i].nIdVehiculo + "' placa='" + lst[i].cPlaca + "' tipo='" + lst[i].cDescripcion + "'><i class='fas fa-sign-out-alt'></i></button></td>"
                                vvIng += "</tr>"
                            } else {
                                //SALIDA
                                vvSal += "<tr><td><i class='fa fa-truck'></i> " + lst[i].cPlaca + "</td><td>" + lst[i].cDescripcion + "</td><td>" + lst[i].dFechaIngreso + "</td><td>" + lst[i].dFechaSalida + "</td>";
                                vvSal += "<td><button class='show-data btn btn-link blue m-0 p-0' idcg='" + lst[i].nIdControlGarita + "' idvehiculo='" + lst[i].nIdVehiculo + "' placa='" + lst[i].cPlaca + "' tipo='" + lst[i].cDescripcion + "'><i class='fas fa-eye'></i></button></td>"
                                vvSal += "</tr>"
                            }
                        }
                        $("#tblIngreso tbody").html(vvIng);
                        $("#tblSalida tbody").html(vvSal);


                        $('#tblIngreso').DataTable({
                            "paging": true,
                            "ordering": false,
                            "info": false,
                            "searching": false

                        });

                        $('#tblSalida').DataTable({
                            "paging": true,
                            "ordering": false,
                            "info": false,
                            "searching": false
                        });
                        // CrearTablas(lst);
                    }
                });
            }
        }
        LoadData();
        //FUNCIONES 

        $(document).on('click', '.deleteguia', function (e) {
            e.preventDefault();
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdProd = $(this).attr("idprod");
            if (obj.vcIdEmpresa != "" && obj.nIdProd != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerSegu.asmx/IngresoProductoDel",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        toastr.success('', 'Eliminado');
                        var table = $('#tblGuias').DataTable();
                        table.destroy();
                        LoadGuias();
                    },
                    error: function (error) {
                        toastr.error(JSON.stringify(error), '');
                    }
                });

            } else {
                toastr.error('Verifique', 'Faltan datos');
            }

        });

        function LoadGuias() {

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            if (obj.vcIdEmpresa != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerSegu.asmx/ListIngresoProducto",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        var vvIng = "";

                        for (i = 0; i < lst.length; ++i) {

                            if (lst[i].cNroGuia != null && lst[i].cDescVariedad != null) {
                                //INGRESO
                                vvIng += "<tr><td>" + lst[i].cNroGuia + "</td><td>" + lst[i].cDescVariedad + "</td><td>" + lst[i].nCantProd + "</td>";
                                vvIng += "<td><button type='button' class='btn btn-link m-0 p-0 red deleteguia' idprod='" + lst[i].nIdProd + "'><i class='fas fa-trash'></i></button></td>"
                                vvIng += "</tr>"
                            }
                        }
                        $("#tblGuias tbody").html(vvIng);


                        $('#tblGuias').DataTable({
                            "paging": false,
                            "ordering": false,
                            "info": false,
                            "searching": false
                        });
                        // CrearTablas(lst);
                    }
                });
            }
        }
        LoadGuias();


        //////////////////////////////////////////7

        $(document).on('click', '.show-data', function (e) {
            e.preventDefault();

            $('#txtPlaca').text($(this).attr('placa'));
            $('#txttipo').text($(this).attr('tipo'));


            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdControlGarita = $(this).attr('idcg');
            $.ajax({
                type: 'POST',
                url: "../SerSegu.asmx/ListControlGarita",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                error: function () {
                    toastr.error('error');
                },
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    $('#txtconductor').text(lst[0].Nombre);
                    $('#txtcliente').text(lst[0].cRazonSocial);

                    $('#txtguias').text(lst[0].guias);
                    $('#txtvariedades').text(lst[0].variedades);

                    $('#txtjabas').text(lst[0].jabas);

                    $('#txtfingreso').text(lst[0].dFechaIngreso);
                    $('#txtobsingreso').text(lst[0].cObservacionIngreso);

                    $('#txtfsalida').text(lst[0].dFechaSalida);
                    $('#txtobssalida').text(lst[0].cObservacionSalida);

                    $('#txttranscurrido').text(lst[0].transcurrido);

                    if (lst[0].dFechaSalida == null) {
                        $('#divfsalida').hide();
                        $('#divobssalida').hide();
                        $('#divtranscurrido').show();
                    } else {
                        $('#divfsalida').show();
                        $('#divobssalida').show();
                        $('#divtranscurrido').hide();
                    }


                }
            });

            $('#ModShow').modal("show");
        });

        ///////////////////////////////////////////


        $(document).on('click', '#salida', function (event) {
            event.preventDefault();
            $('#txtfechaSalida').data("DateTimePicker").clear();
            $('#txtHoraSalida').data("DateTimePicker").clear();
            $('#cPlacaSalida').show();
            $('#LabelVehiculoSalida').hide();
            $('#DatVehiculoSalida').hide();

            $('#nIdVehiculo').val('0');
            $('#nIdConductor').val('0');
            $('#nIdControlGarita').val('0');

            $('#obsSalida').show();

            $('#cPlacaSalida').val('');
        });


        $(document).on('click', '#ingreso', function (event) {
            event.preventDefault();

            $('#frmMain')[0].reset();

            $('#cPlaca').focus();
            $('#idVehiculo').show();
            $('#LabelVehiculo').hide();
            $('#DatVehiculo').hide();

            $('#idConductor').show();
            $('#LabelConductor').hide();
            $('#DatConductor').hide();

            $('#idCliente').show();
            $('#LabelCliente').hide();
            $('#DatCliente').hide();

            $('#nIdVehiculo').val('0');
            $('#nIdConductor').val('0');
            $('#nIdControlGarita').val('0');

            $('#cPlaca').val('');

            $('#txtfechaIngreso').data("DateTimePicker").clear();
            $('#txtHoraIngreso').data("DateTimePicker").clear();
        });


        $(document).on('click', '#SaveGuia', function (e) {
            e.preventDefault();

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcNroGuia = $('#Guia').val();
            obj.vnIdCultivo = $("#<%=ddlCultivo.ClientID%>").val();
            obj.vnIdVariedad = $("#<%=ddlVariedad.ClientID%>").val();
            obj.vnCantProd = $('#Jabas').val();
            obj.vnKiloAproxProd = $('#Kilos').val();
            if (obj.vcNroGuia != "" && obj.vnIdCultivo != '' && obj.vnIdVariedad != '' && obj.vnCantProd != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerSegu.asmx/IngresoProductoRegi",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst != '') {
                            switch (lst[0].regi) {
                                case -1:
                                    toastr.error('Verifique ya existe', 'ERROR');
                                    $('#Guia').val('');

                                    break;
                                case 0:
                                    toastr.error('Guias Eliminadas', 'warning');
                                    $('#Guia').val('');
                                    $("#<%=ddlCultivo.ClientID%>").val('00');
                                    $('#Jabas').val(''); 
                                    $('#Kilos').val('');
                                    var table = $('#tblGuias').DataTable();
                                    table.destroy();
                                    LoadGuias()
                                    break;
                                default:
                                    toastr.success('', 'GUIA AGREGADA');

                                    $('#Guia').val('');
                                    $("#<%=ddlCultivo.ClientID%>").val('00');
                                    $("#<%=ddlVariedad.ClientID%>").val('00');
                                    $('#Jabas').val('');
                                    $('#Kilos').val('');

                                    var table = $('#tblGuias').DataTable();
                                    table.destroy();
                                    LoadGuias()
                                    break;
                            }

                        } else {
                            toastr.success('Verifique los Datos', 'ERROR');
                        }

                    },
                    error: function (error) {
                        toastr.error(JSON.stringify(error), '');
                    }
                });

            } else {
                toastr.error('Ingrese los datos correspondientes', 'Faltan datos');
            }

        });




        $(document).on('click', '#SaveIn', function (event) {
            event.preventDefault();

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdControlGarita = $('#nIdControlGarita').val();

            obj.vnIdVehiculo = $('#nIdVehiculo').val();
            obj.vcPlaca = $("#cPlaca").val();
            obj.vnTipoVehiculo = $("#<%=ddlTipoVehiculo.ClientID%>").val();
            obj.vcDescripcion = $('#cDescVehiculo').val();

            obj.vnIdConductor = $('#nIdConductor').val();
            obj.vcNroDocumento = $("#cNroDocumento").val();
            obj.vcApPaterno = $('#cApPaterno').val();
            obj.vcApMaterno = $('#cApMaterno').val();
            obj.vcNombres = $('#cNombres').val();
            obj.vcLicenciaConducir = $('#cLicenciaConducir').val();

            obj.vnIdClieProv = $('#nIdClieProv').val();
            obj.vnIdentClieProv = $('#nIdentClieProv').val();
            obj.vcDescClieProv = $('#cDescClieProv').val();

            if ($('#txtfechaIngreso').val() != '') {
                var fechaIngreso = $('#txtfechaIngreso').val() + ' ' + $('#txtHoraIngreso').val();
            } else {
                var fechaIngreso = '';
            }

            obj.vdFechaIngreso = fechaIngreso;
            obj.vcObservacionIngreso = $('#cObservacionIngreso').val();

            obj.vdFechaSalida = '';
            obj.vcObservacionSalida = '';

            if (obj.vcIdEmpresa != "" && obj.vnIdVehiculo != '' && obj.vcPlaca != '' && obj.vdFechaIngreso != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerSegu.asmx/ControlGaritaRegi",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst != '') {
                            switch (lst[0].regi) {
                                case 0:
                                    toastr.success('Verifique los Datos', 'ERROR');
                                    break;
                                case 1:
                                    toastr.success('Ingreso Agregada', 'CORRECTO');
                                    $("#ModIngreso").modal('hide');
                                    $('body').removeClass('modal-open');
                                    $('.modal-backdrop').remove();

                                    $('#frmMain')[0].reset();


                                    var table = $('#tblIngreso').DataTable();
                                    table.destroy();
                                    var table2 = $('#tblSalida').DataTable();
                                    table2.destroy();
                                    LoadData();
                                    var table3 = $('#tblGuias').DataTable();
                                    table3.destroy();
                                    LoadGuias();
                                    break;
                                case 3:
                                    toastr.warning('Vehiculo no Ingreso o Ya registro salida', 'Verificar');
                                    break;
                                case 4:
                                    toastr.warning('Vehiculo ya Ingresado o No registro salida', 'Verificar');
                                    break;
                                default:
                                    toastr.warning('ERROR', 'Verificar');
                                    break;
                            }

                        } else {
                            toastr.success('Verifique los Datos', 'ERROR');
                        }

                    },
                    error: function (error) {
                        toastr.error(JSON.stringify(error), '');
                    }
                });

            } else {
                toastr.error('Ingrese los datos correspondientes', 'Faltan datos');
            }

        });



        $(document).on('click', '#SaveOutIn', function (event) {
            event.preventDefault();

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdControlGarita = $('#nIdControlGaritaSalida').val();

            obj.vnIdVehiculo = $('#nIdVehiculoSalida').val();
            obj.vcPlaca = $("#cPlacaSalida").val();
            obj.vnTipoVehiculo = 0;
            obj.vcDescripcion = '';

            obj.vnIdConductor = 0;
            obj.vcNroDocumento = '';
            obj.vcApPaterno = '';
            obj.vcApMaterno = '';
            obj.vcNombres = '';
            obj.vcLicenciaConducir = '';

            obj.vnIdClieProv = 0;
            obj.vnIdentClieProv = '';
            obj.vcDescClieProv = '';

            obj.vdFechaIngreso = '';
            obj.vcObservacionIngreso = '';

            var fecha = $('#txtfechaSalida').val();
            var hora = $('#txtHoraSalida').val();

            obj.vdFechaSalida = fecha + ' ' + hora;
            obj.vcObservacionSalida = $('#cObservacionSalida').val();
            
            if (obj.vcIdEmpresa != "" && obj.vnIdControlGarita != '' && obj.vnIdVehiculo != '' && fecha != '' && hora != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerSegu.asmx/ControlGaritaRegi",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst != '') {
                            switch (lst[0].regi) {
                                case 0:
                                    toastr.success('Verifique los Datos', 'ERROR');
                                    break;
                                case 2:
                                    toastr.success('Salida Agregada', 'CORRECTO');
                                    $("#ModSalida").modal('hide');
                                    $('body').removeClass('modal-open');
                                    $('.modal-backdrop').remove();

                                    $('#frmMain')[0].reset();


                                    var table = $('#tblIngreso').DataTable();
                                    table.destroy();
                                    var table2 = $('#tblSalida').DataTable();
                                    table2.destroy();
                                    LoadData();
                                    var table3 = $('#tblGuias').DataTable();
                                    table3.destroy();
                                    LoadGuias();
                                    break;
                                case 3:
                                    toastr.warning('Vehiculo no Ingreso o Ya registro salida', 'Verificar');
                                    break;
                                default:
                                    toastr.warning('ERROR', 'Verificar');
                                    break;
                            }

                        } else {
                            toastr.success('Verifique los Datos', 'ERROR');
                        }

                    },
                    error: function (error) {
                        toastr.error(JSON.stringify(error), '');
                    }
                });

            } else {
                toastr.error('Ingrese los datos correspondientes', 'Faltan datos');
            }

        });

        document.addEventListener('DOMContentLoaded', () => {
            document.querySelectorAll('input[type=text]').forEach(node => node.addEventListener('keypress', e => {
                if (e.keyCode == 13) {
                    e.preventDefault();
                }
            }))
        });
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
