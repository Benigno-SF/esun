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
          border-collapse: collapse; // 1
          border-spacing: 0;
        }

        .tr-nopm tbody tr td {
        padding: 0px;
        margin: 0px;
        text-align: center;
        }

        .tr-nopm thead tr th {
        padding: 0 10px;
        margin: 0px;
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
                                    <a class="btn btn-lg btn-success" id="ingreso" data-toggle="modal" data-target="#ModIngreso">
                                        <i class="fa fa-arrow-down"></i>Ingreso <i class="fa fa-arrow-down"></i>
                                    </a>
                                </div>
                                <div class="col-md-3 pt-4">
                                    <a class="btn btn-lg btn-success" id="salida" data-toggle="modal" data-target="#ModSalida">
                                        <i class="fa fa-arrow-up"></i>Salida <i class="fa fa-arrow-up"></i>
                                    </a>
                                </div>
                                <div class="col-md-3">
                                </div>
                            </div>
                            <br />
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
                                        <table id="tblIngreso" class="table table-striped table-bordered dt-responsive nowrap">
                                            <thead>
                                                <tr>
                                                    <th># Placa</th>
                                                    <th>tipo Vehiculo</th>
                                                    <th>fecha Ingreso</th>
                                                    <th>Salida</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-md-6 table">
                                        <span>SALIDAS</span>
                                        <table id="tblSalida" class="table table-striped table-bordered dt-responsive nowrap">
                                            <thead>
                                                <tr>
                                                    <th># Placa</th>
                                                    <th>tipo Vehiculo</th>
                                                    <th>fecha Ingreso</th>
                                                    <th>fecha Salida</th>
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
        <div class="modal fade" id="ModIngreso" data-backdrop="false" tabindex="-1" role="dialog" aria-hidden="true">

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
                            <input type="text" id="cPlaca"  class="form-control round" placeholder="Ingrese Placa de Vehiculo" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase(); v_Placa(this.value)">
                            <input type="hidden" id="nIdVehiculo">
                        </div>
                    </div>
                    <label id="LabelVehiculo" class="label-success" style="display: none"></label>
                    <div id="DatVehiculo" style=" padding-left: 25px; display: none">
                        <div class="form-group mb-1">
                            <label for="message-text" class="col-form-label">Tipo Vehiculo:</label>
                            <asp:DropDownList ID="nTipoVehiculo" runat="server" CssClass="custom-select myform-control"></asp:DropDownList>
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
                            <input type="text" id="cNroDocumento" class="form-control round" placeholder="Ingrese su número de  Dni" onKeyUp="v_Conductor(this.value)">
                            <input type="hidden" id="nIdConductor">
                            <div class="input-group-prepend">
                                <button type="button" id="btnSearchConductor" data-tipo="add" class="btn btn-link text-warning"><i class="fa fa-search"></i></button>
                            </div>
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
                            <input type="text" id="cDescCliente" class="form-control round" placeholder="Ingrese Nombre y/o RUC">
                        </div>
                    </div>
                    <label id="LabelCliente" class="label-success" style="display: none"></label>
                    <div id="DatCliente" style="padding-left: 25px; display: none">
                        <div class="form-group mb-1">
                            <label for="message-text" class="col-form-label">Ruc:</label>
                            <input type="text" id="cNroRUC" value="" class="form-control round">
                        </div>
                    </div>
                    <!-- CLIENTE -->

                        <div class="form-group p-0 m-0" id="DivFechaProc">
                            <label for="txtFecha">Fecha Ingreso</label>
                            <input type="text" id="txtfechaIngreso"  autocomplete="off" class="form-control round" placeholder="dd/mm/yyyy">
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
                            <table class="table tr-nopm" id="tblGuias">
                                <thead>
                                    <tr>
                                        <th>guia</th><th>variedad</th><th>jabas</th><th>#</th>
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
    <div class="modal fade" id="ModSalida" data-backdrop="false" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-xs" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">INGRESO VEHICULO</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group mb-1" id="idVehiculoSalida">
                        <label for="message-text" class="col-form-label">Placa Vehiculo:</label>
                        <div class="input-group">
                            <input type="text" id="cPlacaSalida"  class="form-control round" placeholder="Ingrese Placa de Vehiculo" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase(); v_Placa(this.value)">
                            <input type="hidden" id="nIdVehiculoSalida">
                        </div>
                    </div>
                    <label id="LabelVehiculoSalida" class="label-success" style="display: none"></label>
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
    <div class="modal fade" id="ModGuia" data-backdrop="false" tabindex="-1" role="dialog" aria-hidden="true">
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
                            <input type="text" id="Guia"  class="form-control round" placeholder="N° Guia">
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
                            <input type="text" id="Jabas"  class="form-control round" placeholder="Jabas">
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


    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap4.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

    <script type="text/javascript" charset="UTF-8">

      //VEHICULO//
        function v_Placa(value) {
            if (value.length >= 6) {
                $("#cDescVehiculo").blur();
                var obj = new Object();
                obj.vcIdEmpresa = fuGetCdEmpre();
                obj.vcPlaca = value;
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
                            if (val == '0' && num == 'N' ){
                                toastr.error('Vehiculo ya Registro Ingreso', 'Por Favor Verificar');
                                $("#cPlaca").val('');
                                $("#cPlaca").focus();
                            }else{
                                if (val != 0 && label != 'NN') {
                                    var labels = '<p class="m-0 p-0"><b>Vehiculo Encontrado, ' + label + ', Tipo:' + num + '</b></p>';
                                    $('#nIdVehiculo').val(val);
                                    $('#LabelVehiculo').html(labels);
                                    $('#LabelVehiculo').show();
                                    $('#cPlaca').val(label);
                                    $("#<%=nTipoVehiculo.ClientID%>").val('00').change;
                                    $('#cDescVehiculo').val('');
                                    $('#DatVehiculo').hide();

                                    $(".ui-menu-item").hide();
                                    $("#cNroDocumento").focus();
                                    } else {
                                        toastr.warning('AGREGA INFORMACION DE VEHICULO')
                                        $('#nIdVehiculo').val('0');
                                        $('#LabelVehiculo').html('');
                                        $('#LabelVehiculo').hide();
                                        $("#<%=nTipoVehiculo.ClientID%>").val('00').change;
                                        $('#cDescVehiculo').val('');
                                        $('#DatVehiculo').show();

                                        $("#<%=nTipoVehiculo.ClientID%>").focus();
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
                        if (ui.item.label.length>=6 && ui.item.val == '0' && ui.item.num == 'N') {
                            toastr.error('Vehiculo con placa ' + ui.item.label+' ya Registro Ingreso', 'Por Favor Verificar');
                            $("#cPlaca").val('');
                            $("#cPlaca").focus();
                        } else {
                            if (ui.item.val != '0' && ui.item.label != 'NN') {
                                var labels = '<p class="m-0 p-0"><b>Vehiculo Encontrado, ' + ui.item.label + ', Tipo:' + ui.item.num + '</b></p>';
                                $('#nIdVehiculo').val(ui.item.val);
                                $('#LabelVehiculo').html(labels);
                                $('#LabelVehiculo').show();
                                $('#cPlaca').val(ui.item.label);
                                $("#<%=nTipoVehiculo.ClientID%>").val('00').change;
                                $('#cDescVehiculo').val('');
                                $('#DatVehiculo').hide();

                                $(".ui-menu-item").hide();
                                $("#cNroDocumento").focus();
                            } else {
                                toastr.warning('AGREGA INFORMACION DE VEHICULO')
                                $('#nIdVehiculo').val('0');
                                $('#LabelVehiculo').html('');
                                $('#LabelVehiculo').hide();
                                $("#<%=nTipoVehiculo.ClientID%>").val('00').change;
                                $('#cDescVehiculo').val('');
                                $('#DatVehiculo').show();

                                $("#<%=nTipoVehiculo.ClientID%>").focus();
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

        function Buscar_Conductor(DNI){
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
                                        $('#cApMaterno').val(lst[0].ApellidoMaterno);
                                        $('#cNombres').val(lst[0].Nombres);
                                        $('#LabelConductor').html('');
                                        $('#LabelConductor').hide();
                                        $('#cLicenciaConducir').val('');
                                        $('#DatConductor').show();

                                        $('#cNombres').focus();
                                    } else {
                                        var labels = '<p class="m-0 p-0"><b>Conductor Encontrado, ' + lst[0].ApellidoPaterno + ' ' + lst[0].ApellidoMaterno + ' ' + lst[0].Nombres + '</b></p>';
                                        toastr.remove();
                                        toastr.clear();
                                        toastr.warning('Falta agregar Licencia de conducir', labels)
                                        $('.dat-conductor').attr('disabled', 'disabled');
                                        $('#cApPaterno').val(lst[0].ApellidoPaterno);
                                        $('#cApMaterno').val(lst[0].ApellidoMaterno);
                                        $('#cNombres').val(lst[0].Nombres);
                                        $('#cLicenciaConducir').val('');
                                        $('#LabelConductor').html('');
                                        $('#LabelConductor').hide();
                                        $('#DatConductor').show();

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
        //CONDUCTOR//

        $(document).on('click', '.salidav', function (e) {
            e.preventDefault();

            $('#nIdVehiculoSalida').val($(this).attr('idvehiculo'));
            $("#<%=nTipoVehiculo.ClientID%>").val('0');
            $('#cPlacaSalida').val($(this).attr('placa'));
            $('#nIdControlGaritaSalida').val($(this).attr('idcg'));
            $('#cPlacaSalida').hide();

            var labels = '<p class="m-1 p-1"><b>Vehiculo: ' + $(this).attr('placa') + ', Tipo:' + $(this).attr('tipo') + '</b></p>';
            $('#LabelVehiculoSalida').html(labels);
            $('#LabelVehiculoSalida').show();

            $('#ModSalida').modal("show");
        });

        

        $("#cDescCliente").autocomplete({
            source: function (request, response) {
                var obj = new Object();
                obj.vcRazonSocial = $("#cDescCliente").val();
                $.ajax({
                    url: "../SerSegu.asmx/ListCliente",
                    data: JSON.stringify({ obj: obj }),
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    // dataFilter: function (data) { return data; },
                    success: function (data) {
                        data.d.push("0-"+obj.vcRazonSocial+"-0");
                        response($.map(data.d, function (item) {
                            /*  return {
                                  value: item
                              }*/
                            return {
                                label: item.split('-')[1],
                                val: item.split('-')[0],
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
                    if (ui.item.val != 0) {
                        var labels = '<p class="m-0 p-0"><b>Cliente Encontrado ' + ui.item.label + ', con RUC:' + ui.item.val + '</b></p>';
                        $('#LabelCliente').html(labels);
                        $('#LabelCliente').show();

                        $('#cDescCliente').val(ui.item.label);
                        $('#cNroRUC').val(ui.item.val);

                        $("#txtfechaIngreso").focus();
                    } else {
                        $('#LabelCliente').html('');
                        $('#LabelCliente').hide();
                        $('#cDescCliente').val('');
                        $('#cNroRUC').val('');

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
                                vvIng += "<tr><td><i class='fa fa-truck'></i>" + lst[i].cPlaca + "</td><td>" + lst[i].cDescripcion + "</td><td>" + lst[i].dFechaIngreso + "</td>";
                                vvIng += "<td><button class='salidav btn btn-link btn-danger m-0' idcg='" + lst[i].nIdControlGarita + "' idvehiculo='" + lst[i].nIdVehiculo + "' placa='" + lst[i].cPlaca + "' tipo='" + lst[i].cDescripcion + "'><i class='fas fa-sign-out-alt'></i></button></td>"
                                vvIng += "</tr>"
                            } else {
                                //SALIDA
                                vvSal += "<tr><td><i class='fa fa-truck'></i>" + lst[i].cPlaca + "</td><td>" + lst[i].cDescripcion + "</td><td>" + lst[i].dFechaIngreso + "</td>";
                                vvSal += "<td>" + lst[i].dFechaSalida + "</td>"
                                vvSal += "</tr>"
                            }
                        }
                        $("#tblIngreso tbody").html(vvIng);
                        $("#tblSalida tbody").html(vvSal);

                             
                               $('#tblIngreso').DataTable({
                                           "paging":   true,
                                           "ordering": false,
                                   "info": false,
                                   "searching": false
   
                           });
   
                               $('#tblSalida').DataTable({
                                           "paging":   true,
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
                    url: "../SerSegu.asmx/GuiaDel",
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
                    url: "../SerSegu.asmx/ListGuias",
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
                                vvIng += "<td><button type='button' class='btn btn-link m-0 red deleteguia' idprod='" + lst[i].nIdProd + "'><i class='fas fa-trash'></i></button></td>"
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



        function clear() {
            $('#nIdControlGarita').val('');

            $('#nIdVehiculo').val('');
            $("#cPlaca").val('');
            $("#<%=nTipoVehiculo.ClientID%>").val('00');
            $('#cDescVehiculo').val('');

            $('#nIdConductor').val('');
            $("#cNroDocumento").val('');
            $('#cApPaterno').val('');
            $('#cApMaterno').val('');
            $('#cNombres').val('');
            $('#cLicenciaConducir').val('');

            $('#cNroRUC').val('');
            $('#cDescCliente').val('');

            $('#txtfechaIngreso').val('');
            $('#txtHoraIngreso').val('');
            $('#cObservacionIngreso').val('');

            $('#txtfechaSalida').val('');
            $('#txtHoraSalida').val('');
            $('#cObservacionSalida').val('');

        }


        $("#salida").click(function () {
         /* $('#cPlaca').show();
            $('#LabelVehiculo').hide();
            $('#DatVehiculo').hide();

            $('#idConductor').hide();
            $('#LabelConductor').hide();
            $('#DatConductor').hide();

            $('#idCliente').hide();
            $('#LabelCliente').hide();
            $('#DatCliente').hide();

            $('#nIdVehiculo').val('0');
            $('#nIdConductor').val('0');
            $('#nIdControlGarita').val('0');

            $('#obsIngreso').hide();
            $('#obsSalida').show();

            $('#cPlaca').val('');*/
        });

        $("#ingreso").click(function () {
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
        });


        $(document).on('click', '#SaveGuia', function (e) {
            e.preventDefault();

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcNroGuia = $('#Guia').val();
            obj.vnIdCultivo = $("#<%=ddlCultivo.ClientID%>").val();
            obj.vnIdVariedad = $("#<%=ddlVariedad.ClientID%>").val();
            obj.vnCantProd = $('#Jabas').val();
            if (obj.vcNroGuia != "" && obj.vnIdCultivo != '' && obj.vnIdVariedad != '' && obj.vnCantProd != '') {
                        $.ajax({
                            type: 'POST',
                            url: "../SerSegu.asmx/GuiaRegi",
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




        $(document).on('submit', '#SaveIn', function (event) {
            event.preventDefault();

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdControlGarita = $('#nIdControlGarita').val();

            obj.vnIdVehiculo = $('#nIdVehiculo').val();
            obj.vcPlaca = $("#cPlaca").val();
            obj.vnTipoVehiculo = $("#<%=nTipoVehiculo.ClientID%>").val();
            obj.vcDescripcion = $('#cDescVehiculo').val();

            obj.vnIdConductor = $('#nIdConductor').val();
            obj.vcNroDocumento = $("#cNroDocumento").val();
            obj.vcApPaterno = $('#cApPaterno').val();
            obj.vcApMaterno = $('#cApMaterno').val();
            obj.vcNombres = $('#cNombres').val();
            obj.vcLicenciaConducir = $('#cLicenciaConducir').val();

            obj.vcNroRUC = $('#cNroRUC').val();
            obj.vcDescCliente = $('#cDescCliente').val();

            if ($('#txtfechaIngreso').val() != '') {
                var fechaIngreso = $('#txtfechaIngreso').val() + ' ' + $('#txtHoraIngreso').val();
            } else {
                var fechaIngreso = '';
            }

            obj.vdFechaIngreso = fechaIngreso;
            obj.vcObservacionIngreso = $('#cObservacionIngreso').val();

            if ($('#txtfechaSalida').val() != '') {
                var fechaSalida = $('#txtfechaSalida').val() + ' ' + $('#txtHoraSalida').val();
            } else {
                var fechaSalida = '';
            }
            obj.vdFechaSalida = fechaSalida;
            obj.vcObservacionSalida = $('#cObservacionSalida').val();

            if (obj.vcIdEmpresa != "" && obj.vnIdVehiculo != '' && obj.vcPlaca != '') {
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
                                    $('#ModIngreso').hide();
                                    $('#frmMain')[0].reset();
                                    clear();
                                    var table = $('#tblIngreso').DataTable();
                                    table.destroy();
                                    var table2 = $('#tblSalida').DataTable();
                                    table2.destroy();
                                    LoadData();
                                    var table3 = $('#tblGuias').DataTable();
                                    table3.destroy();
                                    LoadGuias();
                                    break;
                                case 2:
                                    toastr.success('Salida Agregada', 'CORRECTO');
                                    $('#ModSalida').hide();
                                    clear();
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



          $(document).on('submit', '#SaveOutIn', function (event) {
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

            obj.vcNroRUC = 0;
            obj.vcDescCliente = '';

            obj.vdFechaIngreso = '';
            obj.vcObservacionIngreso = '';

            obj.vdFechaSalida = $('#txtfechaSalida').val() + ' ' + $('#txtHoraSalida').val();
            obj.vcObservacionSalida = $('#cObservacionSalida').val();

            if (obj.vcIdEmpresa != "" && obj.vnIdControlGarita != '' && obj.vnIdVehiculo != '') {
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
                                            $('#ModSalida').hide();
                                            $('#frmMain')[0].reset();
                                            clear();
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
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
