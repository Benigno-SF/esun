
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_OrdenEmbarque_Edit.aspx.cs" Inherits="SFC_WEB_APP.Mod_Cmx.Wfo_OrdenEmbarque_Edit" %>

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
    <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />

    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap4.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<%--    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>--%>
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
                    <div class="card-header bg-primary text-white">
                        <h4 class="card-title text-uppercase">Orden de Embarque</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group mb-2">
                                        <label for="message-text" class="col-form-label pb-0">Instruccion Embarque:</label>
                                        <asp:DropDownList ID="ddlInstruccion" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="form-group mb-2">
                                        <label for="message-text" class="col-form-label pb-0">Campaña:</label>
                                        <asp:DropDownList ID="ddlCampana" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="form-group mb-1">
                                        <label for="txtFeCont" class="col-form-label pb-0">Cliente:</label>
                                        <input type="text" id="cCliente" name="cCliente" autocomplete="off" class="form-control round" placeholder="Cliente" />
                                        <input type="hidden" id="IdCliente" name="IdCliente" value="0" />
                                    </div>
                                    <div class="form-group mb-1">
                                        <label for="message-text" class="col-form-label pb-0">Destino:</label>
                                        <asp:DropDownList ID="ddlDestino" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="form-group mb-1">
                                        <label for="txtFeCont" class="col-form-label pb-0">Consignatario:</label>
                                        <input type="text" id="cConsignatario" name="cConsignatario" autocomplete="off" class="form-control round" placeholder="Consignatario" />
                                        <input type="hidden" id="IdConsignatario" name="IdConsignatario" value="0" />
                                    </div>
                                    <div class="form-group mb-1">
                                        <label for="txtFeCont" class="col-form-label pb-0">Notificador 1:</label>
                                        <input type="text" id="cNotificador" name="cNotificador" autocomplete="off" class="form-control round" placeholder="Consignatario"/>
                                        <input type="hidden" id="IdNotificador" name="IdConsignatario" value="0" />
                                    </div>
                                    <div class="form-group mb-1">
                                        <label for="txtFeCont" class="col-form-label pb-0">Notificador 2:</label>
                                        <input type="text" id="cNotificador2" name="cNotificador2" autocomplete="off" class="form-control round" placeholder="Consignatario" />
                                        <input type="hidden" id="IdNotificador2" name="IdNotificador2" value="0" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group mb-2">
                                        <label for="message-text" class="col-form-label pb-0">Tipo Transporte:</label>
                                        <asp:DropDownList ID="ddlTipoTransporte" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="form-group mb-1">
                                        <label for="txtFeCont" class="col-form-label pb-0">Operador Logistico:</label>
                                        <input type="text" id="cOpLogistico" name="cOpLogistico" autocomplete="off" class="form-control round" placeholder="Operador Logistico" />
                                        <input type="hidden" id="IdOpLogistico" name="IdOpLogistico" value="0" />
                                    </div>
                                    <div class="form-group mb-2">
                                        <label for="message-text" class="col-form-label pb-0">Shipper:</label>
                                        <asp:DropDownList ID="ddlShipper" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="form-group mb-2" id="DivFechaEmbarque">
                                        <label for="txtFeCont" class="col-form-label pb-0">Fecha Embarque:</label>
                                        <input type="text" id="cFechaEmbarque" name="cFechaEmbarque" autocomplete="off" class="form-control round" placeholder="dd/mm/yyyy" />
                                        <script type="text/javascript">
                                            $(function () {
                                                $('#cFechaEmbarque').datetimepicker({
                                                    format: 'DD/MM/YYYY',
                                                    locale: 'es'
                                                });
                                                $(function () {
                                                    $('#DivFechaEmbarque').datetimepicker({
                                                        format: 'DD/MM/YYYY',
                                                        locale: 'es'
                                                    });
                                                });
                                            });
                                        </script>
                                    </div>
                                    <div class="form-group mb-2">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="message-text" class="col-form-label pb-0">Flete:</label>
                                                <asp:DropDownList ID="ddlFlete" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="message-text" class="col-form-label pb-0">Emision BL:</label>
                                                <asp:DropDownList ID="ddlEmisionBL" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group p-0 m-0">
                                        <label for="message-text" class="col-form-label">Cultivo:</label>
                                        <asp:DropDownList ID="ddlCultivo" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="form-group mb-2 text-center pt-4">
                                        <button type="button" id="btnaddCajas" value="0" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#ModVariedad">Agregar Cajas</button>
                                    </div>
                                    <div class="form-group mb-2" style="height: 22vh; overflow: auto;">
                                        <table class="table-m table-striped table-bordered" id="tblCajasOE">
                                            <thead>
                                                <tr>
                                                    <th>Varie</th>
                                                    <th>Pres.</th>
                                                    <th>Kilos</th>
                                                    <th>Cajas</th>
                                                    <th>PC</th>
                                                    <th>#</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td id="kgtotal"></td>
                                                    <td><b id="cajastotal"></b></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="form-group mb-2">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="message-text" class="col-form-label pb-0">N° Cajas:</label>
                                                <input type="text" id="nCajas" name="nCajas" class="form-control round" autocomplete="off" onkeypress="return filterFloat(event,this);" />
                                            </div>
                                            <div class="col-md-6">

                                                <label for="message-text" class="col-form-label pb-0">Peso Neto:</label>
                                                <input type="text" id="nPesoNeto" name="nPesoNeto" class="form-control round" autocomplete="off" onkeypress="return filterFloat(event,this);" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mb-2">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="message-text" class="col-form-label pb-0">Peso Bruto Aprox.:</label>
                                                <input type="text" id="nPesoBruto" name="nPesoBruto" class="form-control round" autocomplete="off" onkeypress="return filterFloat(event,this);" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <br />
                            <hr />
                            <br />
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group mb-2">
                                        <table class="table-m table-striped" style="width: 100%; display: table;" id="FRG">
                                            <tr>
                                                <td>CERTIFICADO DE ORIGEN</td>
                                                <td><input type="checkbox" id="bCertOrigen" name="bCertOrigen" value="1" /></td>
                                            </tr>
                                            <tr>
                                                <td>TRATAMIENTO DE FRIO</td>
                                                <td><input type="checkbox" id="bCertFrio" name="bCertFrio" value="1" /></td>
                                            </tr>
                                            <tr>
                                                <td>CERTIFICADO FITOSANITARIO</td>
                                                <td><input type="checkbox" id="bCertFitosanitario" name="bCertFitosanitario" value="1" /></td>
                                            </tr>
                                            <tr>
                                                <td>AFORO PREVIO EN PLANTA (SFE)</td>
                                                <td><input type="checkbox" id="bAPPlanta" name="bAPPlanta" value="1" /></td>
                                            </tr>
                                            <tr>
                                                <td>SE ACOGE AL DRAWBACK</td>
                                                <td><input type="checkbox" id="bAcogeDrawback" name="bAcogeDrawback" value="1" /></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <br />
                                    <div class="form-group mb-2">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="message-text" class="col-form-label pb-0">Temperatura:</label>
                                                <input type="text" id="cTemperatura" class="form-control round" autocomplete="off">
                                            </div>
                                            <div class="col-md-6">
                                                <label for="message-text" class="col-form-label pb-0">Atmosfera Controlada:</label>
                                                <input type="text" id="cAtmosferaControlada" class="form-control round" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="message-text" class="col-form-label pb-0">Humedad:</label>
                                                <input type="text" id="cHumedad" class="form-control round" autocomplete="off">
                                            </div>
                                            <div class="col-md-6">
                                                <label for="message-text" class="col-form-label pb-0">Ventilacion:</label>
                                                <input type="text" id="cVentilacion" class="form-control round" autocomplete="off">
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group mb-2">
                                        <label for="message-text" class="col-form-label pb-0">Consolidar Ordenes de Embarque?:</label>
                                        <input type="checkbox" id="checkConsolidarOE" name="checkConsolidarOE" value="1"/>

                                <div id="sbOrdenEmbarqueConsolidado" class="form-control" style="display: none"></div>


                                    </div>
                                    <br />
                                    <div class="form-group mb-2 text-center">
                                        <button type="button" id="btnaddObservacion" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#ModObservacion">Añadir Observación</button>
                                    </div>
                                    <div class="form-group mb-2" style="height: 22vh; overflow: auto;">
                                        <table id="tblObservacionOE" class="table-m table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th style="width: 90%">Observacion</th>
                                                    <th style="width: 10%">#</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div class="col-md-4">

                                    <div class="form-group mb-2">
                                        <label for="message-text" class="col-form-label pb-0">Planta:</label>
                                        <div class="input-group mb-3">
                                            <asp:DropDownList ID="ddlPlanta" runat="server" CssClass="form-control"></asp:DropDownList>
                                            <div class="input-group-append">
                                                <button class="btn btn-outline-primary"  id="LoadModPlanta" type="button"><i class="fas fa-plus"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mb-2" id="DivFechaSalida">
                                        <label for="cFechaSalida" class="col-form-label pb-0">Salida de Planta: <span style="font-size:x-small; font-weight: bold;">&nbsp;(Fecha y hora)</span></label>
                                        <table>
                                            <tr>
                                                <td style="width: 50%">
                                                    <input type="text" id="cFechaSalida" name="cFechaSalida" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy" />
                                                    <script type="text/javascript">
                                                        $(function () {
                                                            $('#cFechaSalida').datetimepicker({
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
                                                </td>
                                                <td style="width: 50%">
                                                    <input type="text" id="cHoraSalida" name="cHoraSalida" autocomplete="off" class="form-control" placeholder="hh:mm A" />
                                                    <script type="text/javascript">
                                                        $(function () {
                                                            $('#cHoraSalida').datetimepicker({
                                                                format: 'hh:mm A',
                                                                locale: 'es'
                                                            });
                                                            $(function () {
                                                                $('#DivHoraSalida').datetimepicker({
                                                                    format: 'hh:mm A',
                                                                    locale: 'es'
                                                                });
                                                            });
                                                        });
                                                    </script>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <hr />
                                    <div class="form-group mb-2" id="DivFeNac">
                                        <label for="txtFeCont" class="col-form-label pb-0">Lugar de salida (Puerto):</label>
                                        <div id="ccLugarSalida" class="form-control"></div>
                                    </div>
                                    <div class="form-group mb-2" id="DivIngresoAlmacen">
                                        <label for="cIngresoAlmacen" class="col-form-label pb-0">Ingreso a Almacen (Puerto):</label>
                                        <input type="text" id="cIngresoAlmacen" name="cIngresoAlmacen" autocomplete="off" class="form-control round" placeholder="dd/mm/yyyy" />
                                        <script type="text/javascript">
                                            $(function () {
                                                $('#cIngresoAlmacen').datetimepicker({
                                                    format: 'DD/MM/YYYY',
                                                    locale: 'es'
                                                });
                                                $(function () {
                                                    $('#DivIngresoAlmacen').datetimepicker({
                                                        format: 'DD/MM/YYYY',
                                                        locale: 'es'
                                                    });
                                                });
                                            });
                                        </script>
                                    </div>
                                    <div class="form-group mb-2" id="DivEDT">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="cEDT" class="col-form-label pb-0">ETD:</label>
                                                <input type="text" id="cETD" name="cETD" autocomplete="off" class="form-control round" placeholder="dd/mm/yyyy" />
                                                <script type="text/javascript">
                                                    $(function () {
                                                        $('#cETD').datetimepicker({
                                                            format: 'DD/MM/YYYY',
                                                            locale: 'es'
                                                        });
                                                        $(function () {
                                                            $('#DivEDT').datetimepicker({
                                                                format: 'DD/MM/YYYY',
                                                                locale: 'es'
                                                            });
                                                        });
                                                    });
                                                </script>
                                            </div>
                                            <div class="col-md-6" id="DivETA">
                                                <label for="cETA" class="col-form-label pb-0">ETA Aprox.</label>
                                                <input type="text" id="cETA" name="cETA" autocomplete="off" class="form-control round" placeholder="dd/mm/yyyy" />
                                                <script type="text/javascript">
                                                    $(function () {
                                                        $('#cETA').datetimepicker({
                                                            format: 'DD/MM/YYYY',
                                                            locale: 'es'
                                                        });
                                                        $(function () {
                                                            $('#DivETA').datetimepicker({
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
                                <div class="col-md-4">
                                    <div class="form-group mb-2">
                                        <label for="message-text" class="col-form-label pb-0">Vapor:</label>
                                        <table>
                                            <tr>
                                                <td style="width: 50%">
                                                    <div class="input-group mb-1">
                                                        <%--<asp:DropDownList ID="ddlNavio" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                                                        <div id="ccNavio" class="form-control"></div>
                                                        <div class="input-group-append">
                                                            <button class="btn btn-outline-primary" id="LoadModVapor" type="button"><i class="fas fa-plus"></i></button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td style="width: 50%">
                                                    <input type="text" id="cCodeVapor" name="CodeVapor" autocomplete="off" class="mb-1 form-control" placeholder="code" />
                                                </td>
                                            </tr>
                                        </table>

                                    </div>
                                    <div class="form-group mb-2">
                                        <label for="message-text" class="col-form-label pb-0">CIA.:</label>
                                        <table>
                                            <tr>
                                                <td style="width: 50%">
                                                    <div class="input-group mb-1">
                                                        <asp:DropDownList ID="ddlTipoEmbarque" runat="server" CssClass="form-control"></asp:DropDownList>
                                                        <div class="input-group-append">
                                                            <button class="btn btn-outline-primary" id="LoadModCIA" type="button"><i class="fas fa-plus"></i></button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td style="width: 50%">
                                                    <div class="input-group mb-1">
                                                        <asp:DropDownList ID="ddlLineaNaviera" runat="server" CssClass="form-control"></asp:DropDownList>
                                                        <div class="input-group-append">
                                                            <button class="btn btn-outline-primary" id="LoadModLineaNaviera" type="button"><i class="fas fa-plus"></i></button>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="form-group mb-2">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="message-text" class="col-form-label pb-0">Container #:</label>
                                                <input type="text" id="cContainer" name="cContainer" autocomplete="off" class="form-control round" placeholder="Container" required="required" />
                                                <div class="invalid-tooltip">
                                                    Ingresa Nro Container.  
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="message-text" class="col-form-label pb-0">SVC :</label>
                                                <input type="text" id="cSVC" name="cSVC" autocomplete="off" class="form-control round" placeholder="Service Contrat" required="required" />
                                                <div class="invalid-tooltip">
                                                    Ingresa Service Contrat.  
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mb-2">
                                        <label for="message-text" class="col-form-label pb-0">Preparado por:</label>
                                        <asp:DropDownList ID="ddlPersonal" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>

                            </div> 
                    </div>
                    <div class="card-footer">
                        <div class="col-md-12 text-right">
                            <input type="hidden" id="IdOrdenEmbarque" name="IdOrdenEmbarque" value="0" />
                            <a href="javascript:history.back()" class="btn btn-danger">Volver</a>
                            <button type="button" id="btn-back" class="btn btn-danger" style="display: none">Volver</button>
                            <button type="button" id="btn-cancel" class="btn btn-danger" style="display: none">Cancel</button>
                            <button type="button" id="AddOrdenEmbarque" class="btn btn-primary">Agregar</button>
                            <button type="button" id="EditOrdenEmbarque" class="btn btn-warning" style="display: none">Editar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade  modal-child" id="ModCajas" data-backdrop-limit="1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-modal-parent="#ModOrden">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Cajas</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                            <div class="form-group p-0 m-0">
                                <label for="message-text" class="col-form-label">Variedad:</label>
                                <asp:DropDownList ID="ddlVariedad" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group pb-0 m-0">
                                <label for="message-text" class="col-form-label">Presentación:</label>
                                <asp:DropDownList ID="ddlEmbalaje" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group mb-2">
                                <div class="form-group mb-2">
                                    <label for="message-text" class="col-form-label pb-0">Cajas:</label>
                                    <input type="text" id="ncajas" class="form-control round" autocomplete="off" onkeypress="return filterFloat(event,this);" />
                                </div>
                            </div>
                            <div class="form-group mb-2">
                                <div class="form-group mb-2 form-check">
                                    <table>
                                        <tr>
                                            <td style="width: 32%"><label for="message-text" class="col-form-label pb-0 form-check-label">Por Confirmar:</label></td>
                                            <td><input type="checkbox"  class="form-check-input" id="porconfirmar" name="porconfirmar" value="1" style="position: absolute; text-align: left; margin: 0px;"/></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="nIdCajasOE" value="0" />
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" id="addCajasOE" class="btn btn-primary">Agregar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade  modal-child" id="ModObservacion" data-backdrop-limit="1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-modal-parent="#ModOrden">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Observación</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group mb-2">
                        <div class="form-group mb-2">
                            <label for="message-text" class="col-form-label pb-0">Observación:</label>
                            <textarea id="cObservacion" class="form-control"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="nIdObservacionOE" value="0" />
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" id="btnAddObservacion" class="btn btn-primary">Agregar</button>
                </div>
            </div>
        </div>
    </div>

    <%-- Formulario actualizar planta --%>
    <div class="modal fade  modal-child" id="ModPlanta" data-backdrop-limit="1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-modal-parent="#ModOrden">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Planta</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="ModPlanta_Id" class="form-control"/>

                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Descripción:</label>
                        <input type="text" id="ModPlanta_Descripcion" class="form-control"/>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Dirección:</label>
                        <input type="text" id="ModPlanta_Direccion" class="form-control"/>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Contacto:</label>
                        <input type="text" id="ModPlanta_Contacto" class="form-control"/>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Móvil del contacto:</label>
                        <input type="text" id="ModPlanta_Movil" class="form-control"/>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Nota:</label>
                        <input type="text" id="ModPlanta_Nota" class="form-control"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="ModPlanta_Guardar">Guardar</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>


    <%-- Formulario actualizar vapor --%>
    <div class="modal fade  modal-child" id="ModVapor" data-backdrop-limit="1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-modal-parent="#ModOrden">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Vapor</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="ModVapor_Id" class="form-control"/>
                    
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Descripción:</label>
                        <input type="text" class="form-control" id="ModVapor_Descripcion"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="ModVapor_Guardar">Guardar</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <%-- Formulario actualizar cia --%>
    <div class="modal fade  modal-child" id="ModCIA" data-backdrop-limit="1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-modal-parent="#ModOrden">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">CIA</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="ModCIA_Id" class="form-control"/>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Nombre de la CIA:</label>
                        <input type="text" id="ModCIA_Nombre" class="form-control"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="ModCIA_Guardar" class="btn btn-primary">Guardar</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>


    <%-- Formulario actualizar linea naviera --%>
    <div class="modal fade  modal-child" id="ModLineaNaviera" data-backdrop-limit="1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-modal-parent="#ModOrden">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Linea naviera</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="ModLineaNaviera_Id" class="form-control"/>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Descripción:</label>
                        <input type="text" id="ModLineaNaviera_Descripcion" class="form-control"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="ModLineaNaviera_Guardar" class="btn btn-primary">Guardar</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

    <script>
        CargarSelect("Planta");
        CargarSelect("Vapor");
        CargarSelect("Cia");
        CargarSelect("Lineanaviera");

        function CargarSelect(entidad) {
            var plt = "";
            parametro = new Object();
            parametro.vcNota = entidad;
            parametro.vcIdEmpresa = fuGetCdEmpre();
            _url = "../SerComex.asmx/OrdenEmbarqueEdit_CargarSelect";
            $.ajax({
                type: "POST",
                url: _url,
                data: JSON.stringify({ entidad: parametro }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (datos) {
                    var o = JSON.parse(datos['d']);
                    plt = '<option value="0">(Seleccionar)</option>';
                    for (var i = 0; i < o.length; i++) {
                        plt += '<option value="' + o[i].codigo + '">' + o[i].descripcion + '</option>';
                    }
                    switch (entidad) {
                        case 'Planta':
                            $("#Body_ddlPlanta").html(plt);

                            if ($("#ModPlanta_Id").val() != "") {
                                $("#Body_ddlPlanta").val($("#ModPlanta_Id").val())
                            }
                            break;
                        case 'Vapor':
                            $("#Body_ddlNavio").html(plt);
                            if ($("#ModVapor_Id").val() != "") {
                                $("#Body_ddlNavio").val($("#ModVapor_Id").val())
                            }
                            break;
                        case 'Cia':
                            $("#Body_ddlTipoEmbarque").html(plt);
                            if ($("#ModCIA_Id").val() != "") {
                                $("#Body_ddlTipoEmbarque").val($("#ModCIA_Id").val())
                            }
                            break;
                        case 'Lineanaviera':
                            $("#Body_ddlLineaNaviera").html(plt);
                            if ($("#ModLineaNaviera_Id").val() != "") {
                                $("#Body_ddlLineaNaviera").val($("#ModLineaNaviera_Id").val())
                            }
                            break;
                        case 'Lineanaviera':
                            $("#Body_ddlLineaNaviera").html(plt);
                            if ($("#ModLineaNaviera_Id").val() != "") {
                                $("#Body_ddlLineaNaviera").val($("#ModLineaNaviera_Id").val())
                            }
                            break;
                        default:
                            console.log("...");
                            break;
                    }
                },
                error: function () {
                    toastr.error("Existe un error de conectividad.", "Error");
                }
            });
        }

        function CargarPorId(entidad, Id, Tipo = 5) {
            parametro = new Object();
            parametro.nId = Id;
            parametro.nTipo = Tipo;
            if (Id == 0) {
                switch (entidad) {
                    case "Lineanaviera":
                        $("#ModLineaNaviera_Id").val("");
                        $("#ModLineaNaviera_Descripcion").val("");
                        break;
                    case "Vapor":
                        $("#ModVapor_Id").val("");
                        $("#ModVapor_Descripcion").val("");
                    case "Planta":
                        $("#ModPlanta_Id").val("");
                        $("#ModPlanta_Descripcion").val("");
                        $("#ModPlanta_Direccion").val("");
                        $("#ModPlanta_Contacto").val("");
                        $("#ModPlanta_Movil").val("");
                        $("#ModPlanta_Nota").val("");
                        break;
                }
                return;
            }

            _url = "../SerComex.asmx/OrdenEmbarqueEdit_" + entidad;
            $.ajax({
                type: "POST",
                url: _url,
                data: JSON.stringify({ obj: parametro }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (datos) {
                    var o = JSON.parse(datos['d']);
                    switch (entidad) {
                        case 'Planta':
                            $("#ModPlanta_Id").val(o.vnIdPlanta);
                            $("#ModPlanta_Descripcion").val(o.vcDescripcion);
                            $("#ModPlanta_Direccion").val(o.vcDireccion);
                            $("#ModPlanta_Contacto").val(o.vcContacto);
                            $("#ModPlanta_Movil").val(o.vcContactoMovil);
                            $("#ModPlanta_Nota").val(o.vcNota);
                            break;
                        case 'Vapor':
                            $("#ModVapor_Id").val(o.vnIdNavio);
                            $("#ModVapor_Descripcion").val(o.vcDescripcion);
                            break;
                        case 'Cia':
                            $("#ModCIA_Id").val(o.vcCodigo);
                            $("#ModCIA_Nombre").val(o.vcDescripcion);
                            break;
                        case 'Lineanaviera':
                            $("#ModLineaNaviera_Id").val(Id);
                            $("#ModLineaNaviera_Descripcion").val(o.cDescLineaNaviera);
                            break;
                        default:
                            console.log("...");
                            break;
                    }
                },
                error: function () {
                    toastr.error("Existe un error de conectividad.", "Error");
                }
            });
        }

        function GuardarModal(entidad, Id, Tipo = 1) {
            parametro = new Object();


            switch (entidad) {
                case 'Vapor':
                    parametro.nId = 0;
                    parametro.nTipo = 1; // Insert
                    break;
                default:
                    if (Id == "") {
                        parametro.nId = 0;
                        parametro.nTipo = 1; // Insert
                    } else {
                        parametro.nId = Id;
                        parametro.nTipo = 3; // Update
                    }
                    break;
            }

            switch (entidad) {
                case 'Planta':
                    parametro.vnIdPlanta = parametro.nId;
                    parametro.vcIdEmpresa = fuGetCdEmpre();
                    parametro.vcDescPlanta = $("#ModPlanta_Descripcion").val();
                    parametro.vcDireccion = $("#ModPlanta_Direccion").val();
                    parametro.vcNota = $("#ModPlanta_Nota").val();
                    parametro.vcContacto = $("#ModPlanta_Contacto").val();
                    parametro.vcContactoMovil = $("#ModPlanta_Movil").val();
                    break;
                case 'Vapor':
                    parametro.vnIdNavio = parametro.nId;
                    parametro.vcIdEmpresa = fuGetCdEmpre();
                    parametro.vcDescNavio = $("#ModVapor_Descripcion").val();
                    break;
                case 'Cia':
                    parametro.vnIdNavio = parametro.nId;
                    parametro.vcIdEmpresa = fuGetCdEmpre();
                    parametro.vcDescripcion = $("#ModCIA_Nombre").val();
                    break;
                case 'Lineanaviera':
                    parametro.vcIdEmpresa = fuGetCdEmpre();
                    parametro.vnIdLineaNaviera = parametro.nId;
                    parametro.cDescLineaNaviera = $("#ModLineaNaviera_Descripcion").val();
                    break;
                default:
                    console.log("...");
                    break;
            }
            _url = "../SerComex.asmx/OrdenEmbarqueEdit_" + entidad;
            $.ajax({
                type: "POST",
                url: _url,
                data: JSON.stringify({ obj: parametro }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (datos) {
                    console.log("REGISTRO GUARDADO");
                    switch (entidad) {
                        case 'Vapor':
                            $('#ModVapor').modal('hide');
                            Load_Navio();
                            break;
                        default:
                            console.log("...");
                            break;
                    }
                },
                error: function () {
                    toastr.error("Existe un error de conectividad.", "Error");
                }
            });
        }

        $('#LoadModPlanta').click(function () {
            CargarPorId("Planta", $("#Body_ddlPlanta").val(), 5);
            $("#ModPlanta").modal('show');
        });
        $('#LoadModCIA').click(function () {
            if ($("#Body_ddlTipoEmbarque").val() != "" && $("#Body_ddlTipoEmbarque").val() != 0) {
                CargarPorId("Cia", $("#Body_ddlTipoEmbarque").val(), 5);
                $("#ModCIA").modal('show');
            }
        });
        $('#LoadModVapor').click(function () {
            CargarPorId("Vapor", $("#Body_ddlNavio").val(), 5);
            $("#ModVapor").modal('show');
        });
        $('#LoadModLineaNaviera').click(function () {
            CargarPorId("Lineanaviera", $("#Body_ddlLineaNaviera").val(), 5);
            $("#ModLineaNaviera").modal('show');
        });

        $("#ModPlanta_Guardar").click(function () {
            var Id = $("#ModPlanta_Id").val();
            GuardarModal("Planta", Id, 0);
            CargarSelect("Planta");
        });
        $("#ModCIA_Guardar").click(function () {
            var Id = $("#ModCIA_Id").val();
            GuardarModal("Cia", Id, 0);
            CargarSelect("Cia");
        });
        $("#ModVapor_Guardar").click(function () {
            var Id = $("#ModVapor_Id").val();
            GuardarModal("Vapor", Id, 0);
            CargarSelect("Vapor");
        });
        $("#ModLineaNaviera_Guardar").click(function () {
            var Id = $("#ModLineaNaviera_Id").val();
            GuardarModal("Lineanaviera", Id, 0);
            CargarSelect("Lineanaviera");
        });

        function CambiarIcono(objeto, asociado) {
            if ($("#" + objeto).val() == 0) {
                $("#" + asociado + " i").attr("class", "");
                $("#" + asociado + " i").addClass("fas fa-plus");
            } else {
                $("#" + asociado + " i").attr("class", "");
                $("#" + asociado + " i").addClass("fas fa-eye");
            }
        }

        $("#Body_ddlPlanta").change(function () {
            CambiarIcono("Body_ddlPlanta", "LoadModPlanta");
        });

        $("#Body_ddlNavio").change(function () {
            CambiarIcono("Body_ddlNavio", "LoadModVapor");
        });

        $("#Body_ddlLineaNaviera").change(function () {
            CambiarIcono("Body_ddlLineaNaviera", "LoadModLineaNaviera");
        });

        $("#Body_ddlTipoEmbarque").change(function () {
            CambiarIcono("Body_ddlTipoEmbarque", "LoadModCIA");
        });

        window.addEventListener("DOMContentLoaded", function () {

            if (getParameterByName('Coe')) {
                var obj = new Object();
                obj.vcIdEmpresa = getParameterByName('Cd');
                obj.vnIdOrdenEmbarque = getParameterByName('Coe');
                obj.vnIdIntruccion = '0';
                obj.vcIdCampana = '0';
                obj.vnIdCliente = '0';
                if (obj.vcIdEmpresa != "" && obj.vnIdOrdenEmbarque != '0') {
                    $.ajax({
                        type: 'POST',
                        url: "../SerComex.asmx/OrdenEmbarqueList",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            if (lst.length != '0') {
                                for (i = 0; i < lst.length; ++i) {
                                    $('#<%=ddlCultivo.ClientID%>').val(lst[i].nIdCultivo);

                                    //Load_CultivoTemp(lst[i].nIdCultivo, lst[i].nIdCultivoTemp);
                                    Load_Variedad(lst[i].nIdCultivo);
                                    Load_Embalaje(lst[i].nIdCultivo);

                                    Load_CajasOE(lst[i].nIdOrdenEmbarque);
                                    Load_ObservacionOE(lst[i].nIdOrdenEmbarque);

                                    $('#<%=ddlCampana.ClientID%>').val(lst[i].nIdCampana);
                                    $('#IdCliente').val(lst[i].nIdCliente);
                                    $('#cCliente').val(lst[i].cDescCliente);
                                    $('#<%=ddlDestino.ClientID%>').val(lst[i].nIdDestino);
                                    $('#IdConsignatario').val(lst[i].nIdConsignee);
                                    $('#cConsignatario').val(lst[i].cDescConsignee);
                                    $('#IdNotificador').val(lst[i].nIdNotify);
                                    $('#cNotificador').val(lst[i].cDescNotify);
                                    $('#IdNotificador2').val(lst[i].nIdNotify2);
                                    $('#cNotificador2').val(lst[i].cDescNotify2);

                                    $('#IdOrdenEmbarque').val(lst[i].nIdOrdenEmbarque);
                                    $('#<%=ddlInstruccion.ClientID%>').val(lst[i].nIdInstruccion);
                                    $('#<%=ddlTipoTransporte.ClientID%>').val(lst[i].cTipoTranporte);

                                    $('#cOpLogistico').val(lst[i].cDescOpLogistico);
                                    $('#IdOpLogistico').val(lst[i].nIdOpLogistico);
                                    $('#<%=ddlShipper.ClientID%>').val(lst[i].nIdShipper);
                                    $('#cFechaEmbarque').val(lst[i].dFechaEmbarque);

                                    $('#<%=ddlFlete.ClientID%>').val(lst[i].cFlete);
                                    $('#<%=ddlEmisionBL.ClientID%>').val(lst[i].cEmisionBL);

                                    $('#nCajas').val(lst[i].nCajas);
                                    $('#nPesoNeto').val(lst[i].nPesoNeto);
                                    $('#nPesoBruto').val(lst[i].nPesoBrutoAprox);

                                    $('#bCertOrigen').prop("checked", lst[i].bCertOrigen);
                                    $('#bCertFrio').prop('checked', lst[i].bCertFrio);
                                    $('#bCertFitosanitario').prop('checked', lst[i].bCertFitosanitario);
                                    $('#bAPPlanta').prop('checked', lst[i].bAPPlanta);
                                    $('#bAcogeDrawback').prop('checked', lst[i].bAcogeDrawback);

                                    if (lst[i].nIdOrdenEmbarqueConsolidado != null && lst[i].nIdOrdenEmbarqueConsolidado != 0) {
                                        $('#checkConsolidarOE').prop('checked', true);
                                        $("#sbOrdenEmbarqueConsolidado").dxSelectBox("instance").option('value', lst[i].nIdOrdenEmbarqueConsolidado);
                                        $('#sbOrdenEmbarqueConsolidado').show();
                                } else {
                                    $('#checkConsolidarOE').prop('checked', false);
                                        //$("#sbOrdenEmbarqueConsolidado").dxSelectBox("instance").option('value', '');
                                        $('#sbOrdenEmbarqueConsolidado').hide();
                                    }

                                    $('#cAtmosferaControlada').val(lst[i].cAtmosferaControlada);

                                    $('#cTemperatura').val(lst[i].cTemperatura);
                                    $('#cHumedad').val(lst[i].cHumedad);
                                    $('#cVentilacion').val(lst[i].cVentilacion);

                                    $('#<%=ddlPlanta.ClientID%>').val(lst[i].nIdPlanta);
                                    $('#ccLugarSalida').dxSelectBox("instance").option('value', lst[i].nIdLugarSalida);

                                    $('#cFechaSalida').val(lst[i].dFechaSalida);
                                    $('#cHoraSalida').val(lst[i].dHoraSalida);
                                    $('#cIngresoAlmacen').val(lst[i].dFIngresoAlmacen);
                                    $('#cETD').val(lst[i].dETD);
                                    $('#cETA').val(lst[i].dETA);
                                    $('#ccNavio').dxSelectBox("instance").option('value', lst[i].nIdVapor);
                                    $('#cCodeVapor').val(lst[i].cCodeVapor);
                                    $('#<%=ddlTipoEmbarque.ClientID%>').val(lst[i].cCIANaviera);
                                    $('#<%=ddlLineaNaviera.ClientID%>').val(lst[i].nIdLineaNaviera);

                                    $('#cContainer').val(lst[i].cContainer);
                                    $('#cSVC').val(lst[i].cSVC);
                                    $('#<%=ddlPersonal.ClientID%>').val(lst[i].nIdPersonal);

<%--                                    $('#<%=ddlCultivoTemp.ClientID%>').val(lst[i].nIdCultivoTemp);--%>


                                    $("#btn-cancel").show();

                                    ReadOnlyFormOE();
                                }
                            }
                        },
                        error: function (error) {
                            toastr.error(JSON.stringify(error), '');
                        }
                    });

                } else {
                    toastr.error('Verifique', 'Faltan datos');
                }
            };
            // ....
        });



        $('body').on('change', '#<%=ddlInstruccion.ClientID%>', function () {
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

                            for (i = 0; i < lst.length; ++i) {
                                $('#<%=ddlCampana.ClientID%>').val(lst[i].nIdCampana);
                                $('#IdCliente').val(lst[i].nIdCliente);
                                $('#cCliente').val(lst[i].cDescCliente);
                                $('#<%=ddlDestino.ClientID%>').val(lst[i].nIdDestino);
                                $('#IdConsignatario').val(lst[i].nIdConsignee);
                                $('#cConsignatario').val(lst[i].cDesConsignee);
                                $('#IdNotificador').val(lst[i].nIdNotify);
                                $('#cNotificador').val(lst[i].cDesNotify);
                                $('#IdNotificador2').val(lst[i].nIdNotify2);
                                $('#cNotificador2').val(lst[i].cDesNotify2);
                            }
                        } else {
                            $('#<%=ddlCampana.ClientID%>').val('0');
                            $('#IdCliente').val('0');
                            $('#cdCliente').val('');
                            $('#<%=ddlDestino.ClientID%>').val('0');
                            $('#IdConsignatario').val('0');
                            $('#cdConsignatario').val('');
                            $('#IdNotificador').val('0');
                            $('#cdNotificador').val('');
                            $('#IdNotificador').val('0');
                            $('#cdNotificador2').val('');
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
                $('#<%=ddlCampana.ClientID%>').val('0');
                $('#IdCliente').val('0');
                $('#cdCliente').val('');
                $('#<%=ddlDestino.ClientID%>').val('0');
                $('#IdConsignatario').val('0');
                $('#cdConsignatario').val('');
                $('#IdNotificador').val('0');
                $('#cdNotificador').val('');
                $('#IdNotificador').val('0');
                $('#cdNotificador2').val('');
            }
        });

        $('.modal-child').on('show.bs.modal', function () {
            var modalParent = $(this).attr('data-modal-parent');
            $(modalParent).css('opacity', 0);
        });

        $('.modal-child').on('hidden.bs.modal', function () {
            var modalParent = $(this).attr('data-modal-parent');
            $(modalParent).css('opacity', 1);
        });

        $("#btn-add").click(function () {
            $('#ModOrden').modal('show');
        });

        $("#btn-cancel").click(function () {
            ClearFormOE();
        });


        $("#EditOrdenEmbarque").click(function () {
            EditFormOE();
            $('#AddOrdenEmbarque').show();
            $('#AddOrdenEmbarque').text('Actualizar');
        });

        $("#btnaddCajas").click(function () {
            if ($("#<%=ddlCultivo.ClientID%>").val() != '0') {
                $('#ModCajas').modal('show');
                $('#nIdCajasOE').val($(this).val());
            } else {
                toastr.error('', 'seleccione cultivo');
                $('#nIdCajasOE').val('0');
            }
        });

        $(".edit").click(function () {
            $('#ModOrden').modal('show');
        });

        $("#btn-back").click(function () {
            window.location.href = 'Wfo_OrdenEmbarque?Cd=' + fuGetCdEmpre();
        });

        $(document).on('click', '#btnAddObservacion', function (e) {
            e.preventDefault();
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdObservacionOE = '0';
            obj.vcDescObservacion = $('#cObservacion').val();
            if (obj.vcIdEmpresa != "" && obj.vcDescObservacion != '') {
                var vrow = '';

                vrow += "<tr><td class='IdObservacionOE' style='display: none'>" + obj.vnIdObservacionOE + "</td><td class='Obs'>" + obj.vcDescObservacion + "</td>";
                vrow += "<td><button class='DeleteObservacionOE btn btn-link red m-0 p-0'><i class='fas fa-remove'></i></button></td>"
                vrow += "</tr>";

                $("#tblObservacionOE tbody").append(vrow);

                $('#cObservacion').val('');
                $('#cObservacion').focus();
            } else {
                toastr.error('Verifique', 'Faltan datos');
            }

        });

        $("#tblObservacionOE").on("click", ".DeleteObservacionOE", function () {
            $(this).closest("tr").remove();
            $('#cObservacion').val('');
        });

        $(document).on('click', '#addCajasOE', function (e) {
            e.preventDefault();

            var IdVariedad = $("#<%=ddlVariedad.ClientID%>").val();
            var IdEmbalaje = $("#<%=ddlEmbalaje.ClientID%>").val();
            var cajas = $('#ncajas').val();
            if ($('#porconfirmar').prop('checked')) {
                vbPorConfirmar = true;
                check = 'checked="checked" disabled="disabled"';
            } else {
                vbPorConfirmar = false;
                check = 'disabled="disabled"';
            }
            var kg = $("#<%=ddlEmbalaje.ClientID%> option:selected").attr('Kilos');
            if (kg == '' || kg == null) {
                kg = '0';
            }

            if (IdVariedad != 0 && IdEmbalaje != 0 && cajas != '') {
                var cajas = parseInt(cajas);

                $("#<%=ddlCultivo.ClientID%>").attr('disabled', 'disabled');

                var vrow = '';

                vrow += "<tr><td class='IdCajasOE' style='display: none'>0</td><td class='IdVariedad' style='display: none'>" + IdVariedad + "</td><td class='IdPresentacion' style='display: none'>" + IdEmbalaje + "</td><td>" + $("#<%=ddlVariedad.ClientID%> option:selected").text() + "</td><td>" + $("#<%=ddlEmbalaje.ClientID%> option:selected").text() + "</td>";
                vrow += "<td>" + kg + " Kg</td><td class='Kilos' style='display: none'>" + kg + "</td><td class='Cajas' style='display: none'>" + cajas + "</td><td>" + formatNumber.new(cajas.toFixed(2)) + "</td><td><input type='checkbox' " + check + "></td><td class='PC' style='display: none'>" + vbPorConfirmar + "</td>";
                vrow += "<td><button class='DeleteCajasOE btn btn-link red m-0 p-0'><i class='fas fa-remove'></i></button></td>";
                vrow += "</tr>"

                $("#tblCajasOE tbody").append(vrow);

                var kgtotal = 0;
                var kgAprox = 0;
                var total = 0;
                $("#tblCajasOE tbody tr").each(function (index) {
                    vnCajas = parseFloat($(this).find('.Cajas').text(), 10);
                    vnKilos = parseFloat($(this).find('.Kilos').text(), 10);

                    kgtotal = (vnCajas * vnKilos) + kgtotal;
                    kgAprox = (vnCajas * vnKilos) + kgtotal * 1.09;
                    total = vnCajas + total;
                });
                $("#kgtotal").html(formatNumber.new(kgtotal.toFixed(2)));
                $("#cajastotal").html(formatNumber.new(total.toFixed(2)));

                $("#nCajas").val(formatNumber.new(total.toFixed(2)));
                $("#nPesoNeto").val(formatNumber.new(kgtotal.toFixed(2)));
                $("#nPesoBruto").val(formatNumber.new(kgAprox.toFixed(2)));
                clearModCajasOE();
            } else {
                toastr.error('', 'Complete todos los campos')
            }
        });

        $("#tblCajasOE").on("click", ".DeleteCajasOE", function () {
            $(this).closest("tr").remove();
            var kgtotal = 0;
            var kgAprox = 0;
            var total = 0;
            $("#tblCajasOE tbody tr").each(function (index) {
                vnCajas = parseFloat($(this).find('.Cajas').text(), 10);
                vnKilos = parseFloat($(this).find('.Kilos').text(), 10);

                kgtotal = (vnCajas * vnKilos) + kgtotal;
                kgAprox = kgtotal + 1.09;
                total = vnCajas + total;
            });

            if (kgtotal == 0) {

                $("#<%=ddlCultivo.ClientID%>").removeAttr('disabled');

                $("#kgtotal").html('');
                $("#cajastotal").html('');
                $("#nCajas").val('0');
                $("#nPesoNeto").val('0');
                $("#nPesoBruto").val('0');
            } else {
                $("#kgtotal").html(formatNumber.new(kgtotal.toFixed(2)));
                $("#cajastotal").html(formatNumber.new(total.toFixed(2)));

                $("#nCajas").val(formatNumber.new(total.toFixed(2)));
                $("#nPesoNeto").val(formatNumber.new(kgtotal.toFixed(2)));
                $("#nPesoBruto").val(formatNumber.new(kgAprox.toFixed(2)));
            }
        });

        function clearModObservacionOE() {
            $('#nIdObservacionOE').val('0');
            $('#cObservacion').val('');
        }

        function clearModCajasOE() {
            $('#nIdCajasOE').val('0');
            $("#<%=ddlVariedad.ClientID%>").val('0');
            $("#<%=ddlEmbalaje.ClientID%>").val('0');
            $('#ncajas').val('');
            $("#porconfirmar").prop("checked", false);
        }

        function Load_CajasOE(id) {
            var obj = new Object();
            if (id == 0 || id == '') {
                id = -1;
            }
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdOrdenEmbarque = id;
            obj.vnIdCajasOE = 0;
            obj.vnIdCultivo = 0;
            obj.vnIdvariedad = 0;
            obj.vnIdEmbalaje = 0;
            $.ajax({
                type: 'POST',
                url: "../SerComex.asmx/CajasOEList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    if (lst.length != '0') {
                        var vvIng = "";
                        var total = 0;
                        var kgtotal = 0;

                        for (i = 0; i < lst.length; ++i) {
                            $("#<%=ddlCultivo.ClientID%>").val(lst[i].nIdCultivo);
                            $("#<%=ddlCultivo.ClientID%>").attr('disabled', 'disabled');

                            if (lst[i].bPorConfirmar == true) {
                                check = 'checked="checked" disabled="disabled"';
                            } else {
                                check = 'disabled="disabled"';
                            }

                            vvIng += "<tr><td class='IdCajasOE' style='display: none'>" + lst[i].nIdCajasOE + "</td><td class='IdVariedad' style='display: none'>" + lst[i].nIdVariedad + "</td><td class='IdPresentacion' style='display: none'>" + lst[i].nIdEmbalaje + "</td><td>" + lst[i].cDescVariedad + "</td><td>" + lst[i].cDesEmbalaje + "</td>";
                            vvIng += "<td>" + lst[i].nkilos + " Kg</td><td class='Kilos' style='display: none'>" + lst[i].nkilos + "</td><td class='Cajas' style='display: none'>" + lst[i].nCajas + "</td><td>" + formatNumber.new(lst[i].nCajas.toFixed(2)) + "</td><td><input type='checkbox' " + check + "></td><td class='PC' style='display: none'>" + lst[i].bPorConfirmar + "</td>";
                            vvIng += "<td><button class='DeleteCajasOE btn btn-link red m-0 p-0'><i class='fas fa-remove'></i></button></td>";
                            vvIng += "</tr>"

                            kgtotal = (lst[i].nCajas * lst[i].nkilos) + kgtotal;
                            kgAprox = kgtotal + 1.09;
                            total = lst[i].nCajas + total;
                        }

                        $("#kgtotal").html(formatNumber.new(kgtotal.toFixed(2)));
                        $("#cajastotal").html(formatNumber.new(total.toFixed(2)));
                        $("#tblCajasOE tbody").html(vvIng);

                        //$("#nCajas").val(formatNumber.new(total.toFixed(2)));
                        //$("#nPesoNeto").val(formatNumber.new(kgtotal.toFixed(2)));
                        //$("#nPesoBruto").val(formatNumber.new(kgAprox.toFixed(2)));
                    } else {
                        $("#<%=ddlCultivo.ClientID%>").removeAttr('disabled');
                        $("#<%=ddlCultivo.ClientID%>").val('0');

                        $("#kgtotal").html('');
                        $("#cajastotal").html('');
                        $("#tblCajasOE tbody").html('');

                        $("#nCajas").val('0');
                        $("#nPesoNeto").val('0');
                        $("#nPesoBruto").val('0');
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


        function Load_ObservacionOE(id) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdOrdenEmbarque = id;
            obj.vnIdObservacionOE = 0;
            $.ajax({
                type: 'POST',
                url: "../SerComex.asmx/ObservacionOEList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    if (lst.length != '0') {
                        var vvIng = "";

                        for (i = 0; i < lst.length; ++i) {

                            vvIng += "<tr><td class='IdObservacionOE' style='display: none'>" + lst[i].nIdObservacionOE + "</td><td class='Obs' >" + lst[i].cDescObservacion + "</td>";
                            vvIng += "<td><button class='DeleteObservacionOE btn btn-link red m-0 p-0'><i class='fas fa-remove'></i></button></td>"
                            vvIng += "</tr>";
                        }
                        $("#tblObservacionOE tbody").html(vvIng);
                    } else {
                        $("#tblObservacionOE tbody").html('');
                    }
                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        };

        $('body').on('change', '#<%=ddlCultivo.ClientID%>', function () {
            var id = $(this).val();
            //Load_CultivoTemp(id, '0');
            Load_Variedad(id);
            Load_Embalaje(id);
        });

<%--        function Load_CultivoTemp(id, idCt) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdCultivo = id;
            obj.vnIdCultivoTemp = '0';
            $.ajax({
                type: 'POST',
                url: "../SerComex.asmx/CultivoTemperaturaList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    $("#<%=ddlCultivoTemp.ClientID%>").html('');
                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0">Seleccione</option>';
                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdCultivoTemp + '">' + lst[i].cTemperatura + '</option>';
                        }
                        $("#<%=ddlCultivoTemp.ClientID%>").append(option);
                        $("#<%=ddlCultivoTemp.ClientID%>").val(idCt);
                    } else {
                        $("#<%=ddlCultivoTemp.ClientID%>").html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }--%>

        function Load_Variedad(id) {
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
                        option += '<option value="0">Seleccione</option>';
                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdVariedad + '">' + lst[i].cDescVariedad + '</option>';
                        }
                        $("#<%=ddlVariedad.ClientID%>").append(option);
                    } else {
                        $("#<%=ddlVariedad.ClientID%>").html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        function Load_Embalaje(id) {
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
                        option += '<option value="0">Seleccione</option>';
                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdEmbalaje + '" kilos="' + lst[i].nKilos + '">' + lst[i].cDesEmbalaje + '</option>';
                        }
                        $("#<%=ddlEmbalaje.ClientID%>").append(option);
                    } else {
                        $("#<%=ddlEmbalaje.ClientID%>").html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        $('#checkConsolidarOE').on('change', function () {
            var checked = this.checked
            if (checked == true) {
                $('#sbOrdenEmbarqueConsolidado').show();
            } else {
                $('#sbOrdenEmbarqueConsolidado').hide();
            }
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

        function filterFloat(evt, input) {
            // Backspace = 8, Enter = 13, ‘0′ = 48, ‘9′ = 57, ‘.’ = 46, ‘-’ = 43
            var key = window.Event ? evt.which : evt.keyCode;
            var chark = String.fromCharCode(key);
            var tempValue = input.value + chark;
            if (key >= 48 && key <= 57) {
                if (filter(tempValue) === false) {
                    return false;
                } else {
                    return true;
                }
            } else {
                if (key == 8 || key == 13 || key == 0) {
                    return true;
                } else if (key == 46) {
                    if (filter(tempValue) === false) {
                        return false;
                    } else {
                        return true;
                    }
                } else {

                    toastr.warning('', 'solo se permiten Numeros');
                    return false;
                }
            }
        }
        function filter(__val__) {
            var preg = /^([0-9]+\.?[0-9]{0,2})$/;
            if (preg.test(__val__) === true) {
                return true;
            } else {

                toastr.warning('', 'solo se permiten dos decimales');
                return false;
            }

        }

        function ClearFormOE() {
            Load_ObservacionOE('0');
            Load_CajasOE('0');

            $('#IdOrdenEmbarque').val('0');
            $('#cCliente').val('');
            $('#cConsignatario').val('');
            $('#cNotificador').val('');
            $('#cNotificador2').val('');

            // obj.vnIdOrdenEmbarque = '0';
            $('#<%=ddlInstruccion.ClientID%>').val('0');
            $('#<%=ddlCampana.ClientID%>').val('0');
            $('#IdCliente').val('0');
            $('#<%=ddlDestino.ClientID%>').val('0');
            $('#IdConsignatario').val('0');
            $('#IdNotificador').val('0');
            $('#IdNotificador2').val('0');
            $('#<%=ddlTipoTransporte.ClientID%>').val('0');

            $('#cOpLogistico').val('');
            $('#IdOpLogistico').val('0');
            $('#<%=ddlShipper.ClientID%>').val('0');
            $('#cFechaEmbarque').val('');
            $('#<%=ddlFlete.ClientID%>').val('0');
            $('#<%=ddlEmisionBL.ClientID%>').val('0');
            $('#<%=ddlCultivo.ClientID%>').val('0');
         <%--   $('#<%=ddlCultivoTemp.ClientID%>').val('0');--%>

            $('#nCajas').val('');
            $('#nPesoNeto').val('');
            $('#nPesoBruto').val('');

            $('#bCertOrigen').prop("checked", false);
            $('#bCertFrio').prop('checked', false);
            $('#bCertFitosanitario').prop('checked', false);
            $('#bAPPlanta').prop('checked', false);
            $('#bAcogeDrawback').prop('checked', false);
            $('#checkConsolidarOE').prop('checked', false);
            $('#ddlOrdenEmbarque').hide();
            $('#ddlOrdenEmbarque').val('0');

            <%--$('#<%=ddlCultivoTemp.ClientID%>').val('0');--%>
            $('#cAtmosferaControlada').val('');
            $('#cTemperatura').val('');
            $('#cVentilacion').val('');
            $('#cHumedad').val('');
            $('#<%=ddlPlanta.ClientID%>').val('0');
            $('#ccLugarSalida').dxSelectBox("reset");
            $('#cFechaSalida').val('');
            $('#cHoraSalida').val('');
            $('#cIngresoAlmacen').val('');
            $('#cETD').val('');
            $('#cETA').val('');
            $('#ccNavio').dxSelectBox("reset");
            $('#cCodeVapor').val('');
            $('#<%=ddlTipoEmbarque.ClientID%>').val('0');
            
            $('#<%=ddlLineaNaviera.ClientID%>').val('0');

            $('#cContainer').val('');
            $('#cSVC').val('');
            $('#<%=ddlPersonal.ClientID%>').val('0');

            Load_CajasOE('0');
            Load_ObservacionOE('0');

            $('#AddOrdenEmbarque').text('Agregar');
            $("#btn-cancel").hide();

            $('#btnaddCajas').show();
            $('#addCajasOE').show();

            $('#AddOrdenEmbarque').show();
            $('#EditOrdenEmbarque').hide();
        }

        function ReadOnlyFormOE() {
            $('#IdOrdenEmbarque').attr('disabled', 'disabled');
            $('#cCliente').attr('disabled', 'disabled');
            $('#cConsignatario').attr('disabled', 'disabled');
            $('#cNotificador').attr('disabled', 'disabled');
            $('#cNotificador2').attr('disabled', 'disabled');

            // obj.vnIdOrdenEmbarque = '0';
            $('#<%=ddlInstruccion.ClientID%>').attr('disabled', 'disabled');
            $('#<%=ddlCampana.ClientID%>').attr('disabled', 'disabled');
            $('#IdCliente').attr('disabled', 'disabled');
            $('#<%=ddlDestino.ClientID%>').attr('disabled', 'disabled');
            $('#IdConsignatario').attr('disabled', 'disabled');
            $('#IdNotificador').attr('disabled', 'disabled');
            $('#IdNotificador2').attr('disabled', 'disabled');
            $('#<%=ddlTipoTransporte.ClientID%>').attr('disabled', 'disabled');

            $('#cOpLogistico').attr('disabled', 'disabled');
            $('#IdOpLogistico').attr('disabled', 'disabled');
            $('#<%=ddlShipper.ClientID%>').attr('disabled', 'disabled');
            $('#cFechaEmbarque').attr('disabled', 'disabled');
            $('#<%=ddlFlete.ClientID%>').attr('disabled', 'disabled');
            $('#<%=ddlEmisionBL.ClientID%>').attr('disabled', 'disabled');
            $('#<%=ddlCultivo.ClientID%>').attr('disabled', 'disabled');
        <%--    $('#<%=ddlCultivoTemp.ClientID%>').attr('disabled', 'disabled');--%>

            $('#nCajas').attr('disabled', 'disabled');
            $('#nPesoNeto').attr('disabled', 'disabled');
            $('#nPesoBruto').attr('disabled', 'disabled');

            $('#bCertOrigen').attr('disabled', 'disabled');
            $('#bCertFrio').attr('disabled', 'disabled');
            $('#bCertFitosanitario').attr('disabled', 'disabled');
            $('#bAPPlanta').attr('disabled', 'disabled');
            $('#bAcogeDrawback').attr('disabled', 'disabled');
            $('#checkConsolidarOE').attr('disabled', 'disabled');
            $('#ddlOrdenEmbarque').attr('disabled', 'disabled');

           <%-- $('#<%=ddlCultivoTemp.ClientID%>').attr('disabled', 'disabled');--%>
            $('#cAtmosferaControlada').attr('disabled', 'disabled');
            $('#cTemperatura').attr('disabled', 'disabled');
            $('#cVentilacion').attr('disabled', 'disabled');
            $('#cHumedad').attr('disabled', 'disabled');
            $('#<%=ddlPlanta.ClientID%>').attr('disabled', 'disabled');
            $('#ccLugarSalida').dxSelectBox({ disabled: true });
            $('#sbOrdenEmbarqueConsolidado').dxSelectBox({ disabled: true });
            
            $('#cFechaSalida').attr('disabled', 'disabled');
            $('#cHoraSalida').attr('disabled', 'disabled');
            $('#cIngresoAlmacen').attr('disabled', 'disabled');
            $('#cETD').attr('disabled', 'disabled');
            $('#cETA').attr('disabled', 'disabled');
            $('#ccNavio').dxSelectBox({ disabled: true });
            $('#cCodeVapor').attr('disabled', 'disabled');
            $('#<%=ddlTipoEmbarque.ClientID%>').attr('disabled', 'disabled');
            
            $('#<%=ddlLineaNaviera.ClientID%>').attr('disabled', 'disabled');

            $('#cContainer').attr('disabled', 'disabled');
            $('#cSVC').attr('disabled', 'disabled');
            $('#<%=ddlPersonal.ClientID%>').attr('disabled', 'disabled');

            $('#AddOrdenEmbarque').hide();
            $("#btn-cancel").hide();

            $('.DeleteCajasOE').hide();
            $('.DeleteObservacionOE').hide();

            $('#btnaddCajas').hide();
            $('#addCajasOE').hide();

            $('#btnaddObservacion').hide();
            $('#EditOrdenEmbarque').show();
        }

        function EditFormOE() {
            $('#IdOrdenEmbarque').removeAttr('disabled');
            $('#cCliente').removeAttr('disabled');
            $('#cConsignatario').removeAttr('disabled');
            $('#cNotificador').removeAttr('disabled');
            $('#cNotificador2').removeAttr('disabled');

            // obj.vnIdOrdenEmbarque = '0';
            $('#<%=ddlInstruccion.ClientID%>').removeAttr('disabled');
            $('#<%=ddlCampana.ClientID%>').removeAttr('disabled');
            $('#IdCliente').removeAttr('disabled');
            $('#<%=ddlDestino.ClientID%>').removeAttr('disabled');
            $('#IdConsignatario').removeAttr('disabled');
            $('#IdNotificador').removeAttr('disabled');
            $('#IdNotificador2').removeAttr('disabled');
            $('#<%=ddlTipoTransporte.ClientID%>').removeAttr('disabled');

            $('#cOpLogistico').removeAttr('disabled');
            $('#IdOpLogistico').removeAttr('disabled');
            $('#<%=ddlShipper.ClientID%>').removeAttr('disabled');
            $('#cFechaEmbarque').removeAttr('disabled');
            $('#<%=ddlFlete.ClientID%>').removeAttr('disabled');
            $('#<%=ddlEmisionBL.ClientID%>').removeAttr('disabled');
            $('#<%=ddlCultivo.ClientID%>').removeAttr('disabled');
<%--            $('#<%=ddlCultivoTemp.ClientID%>').removeAttr('disabled');--%>

            $('#nCajas').removeAttr('disabled');
            $('#nPesoNeto').removeAttr('disabled');
            $('#nPesoBruto').removeAttr('disabled');

            $('#bCertOrigen').removeAttr('disabled');
            $('#bCertFrio').removeAttr('disabled');
            $('#bCertFitosanitario').removeAttr('disabled');
            $('#bAPPlanta').removeAttr('disabled');
            $('#bAcogeDrawback').removeAttr('disabled');
            $('#checkConsolidarOE').removeAttr('disabled');
            $('#ddlOrdenEmbarque').removeAttr('disabled');

<%--            $('#<%=ddlCultivoTemp.ClientID%>').removeAttr('disabled');--%>
            $('#cAtmosferaControlada').removeAttr('disabled');
            $('#cTemperatura').removeAttr('disabled');
            $('#cVentilacion').removeAttr('disabled');
            $('#cHumedad').removeAttr('disabled');
            $('#<%=ddlPlanta.ClientID%>').removeAttr('disabled');
            $('#ccLugarSalida').dxSelectBox('instance').option('disabled', false);
            $('#cFechaSalida').removeAttr('disabled');
            $('#cHoraSalida').removeAttr('disabled');
            $('#cIngresoAlmacen').removeAttr('disabled');
            $('#cETD').removeAttr('disabled');
            $('#cETA').removeAttr('disabled');
            $('#ccNavio').dxSelectBox('instance').option('disabled', false);
            $('#cCodeVapor').removeAttr('disabled');
            $('#<%=ddlTipoEmbarque.ClientID%>').removeAttr('disabled');
            
            $('#<%=ddlLineaNaviera.ClientID%>').removeAttr('disabled');

            $('#cContainer').removeAttr('disabled');
            $('#cSVC').removeAttr('disabled');
            $('#<%=ddlPersonal.ClientID%>').removeAttr('disabled');

            $("#btn-cancel").show();

            $('.DeleteCajasOE').show();
            $('.DeleteObservacionOE').show();

            $('#btnaddCajas').show();
            $('#addCajasOE').show();

            $('#btnaddObservacion').show();
            $('#EditOrdenEmbarque').hide();
        }

        $(document).on('click', '#AddOrdenEmbarque', function (e) {
            e.preventDefault();
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdOrdenEmbarque = $('#IdOrdenEmbarque').val();
            if ($('#<%=ddlInstruccion.ClientID%>').val() != null && $('#<%=ddlInstruccion.ClientID%>').val() != '') {
                obj.vnIdInstruccion = $('#<%=ddlInstruccion.ClientID%>').val();
            } else {
                obj.vnIdInstruccion = '0';
            }
            obj.vnIdCampana = $('#<%=ddlCampana.ClientID%>').val();
            obj.vnIdCliente = $('#IdCliente').val();
            obj.vnIdDestino = $('#<%=ddlDestino.ClientID%>').val();
            obj.vnIdConsignee = $('#IdConsignatario').val();
            obj.vnIdNotify = $('#IdNotificador').val();
            obj.vnIdNotify2 = $('#IdNotificador2').val();
            obj.vcTipoTranporte = $('#<%=ddlTipoTransporte.ClientID%>').val();
            obj.vnIdOpLogistico = $('#IdOpLogistico').val();
            obj.vnIdShipper = $('#<%=ddlShipper.ClientID%>').val();
            obj.vcFechaEmbarque = $('#cFechaEmbarque').val();
            obj.vcFlete = $('#<%=ddlFlete.ClientID%>').val();
            obj.vcEmisionBL = $('#<%=ddlEmisionBL.ClientID%>').val();
            obj.vnIdCultivo = $('#<%=ddlCultivo.ClientID%>').val();

            obj.vncajas = $('#nCajas').val().replace(/,/g, '');
            obj.vnPesoNeto = $('#nPesoNeto').val().replace(/,/g, '');
            obj.vnPesoBrutoAprox = $('#nPesoBruto').val().replace(/,/g, '');

            if ($('#bCertOrigen').prop('checked')) {
                obj.vbCertOrigen = '1';
            } else {
                obj.vbCertOrigen = '0';
            }
            if ($('#bCertFrio').prop('checked')) {
                obj.vbCertFrio = '1';
            } else {
                obj.vbCertFrio = '0';
            }
            if ($('#bCertFitosanitario').prop('checked')) {
                obj.vbCertFitosanitario = '1';
            } else {
                obj.vbCertFitosanitario = '0';
            }
            if ($('#bAPPlanta').prop('checked')) {
                obj.vbAPPlanta = '1';
            } else {
                obj.vbAPPlanta = '0';
            }
            if ($('#bAcogeDrawback').prop('checked')) {
                obj.vbAcogeDrawback = '1';
            } else {
                obj.vbAcogeDrawback = '0';
            }

<%--            obj.vnIdCultivoTemp = $('#<%=ddlCultivoTemp.ClientID%>').val();--%>
            obj.vcAtmosferaControlada = $('#cAtmosferaControlada').val();
            obj.vcTemperatura = $('#cTemperatura').val();
            obj.vcVentilacion = $('#cVentilacion').val();
            obj.vcHumedad = $('#cHumedad').val();

            if ($('#checkConsolidarOE').prop('checked')) {
                obj.vnIdOrdenEmbarqueConsolidado = $("#sbOrdenEmbarqueConsolidado").dxSelectBox("instance").option('value');
            } else {
                obj.vnIdOrdenEmbarqueConsolidado = '0';
            }
            obj.vnIdPlanta = $('#<%=ddlPlanta.ClientID%>').val();
            
            if ($("#ccLugarSalida").dxSelectBox('instance').option('selectedItem') != null) {
                obj.vnIdLugarSalida = $("#ccLugarSalida").dxSelectBox('instance').option('selectedItem').Id;
            } else {
                obj.vnIdLugarSalida = '0';
            }
            obj.vcFechaSalida = $('#cFechaSalida').val() + ' ' + $('#cHoraSalida').val();
            obj.vcFIngresoAlmacen = $('#cIngresoAlmacen').val();
            obj.vcETD = $('#cETD').val();
            obj.vcETA = $('#cETA').val();

            if ($("#ccNavio").dxSelectBox('instance').option('selectedItem') != null) {
                obj.vnIdVapor = $("#ccNavio").dxSelectBox('instance').option('selectedItem').nIdNavio;
            } else {
                obj.vnIdVapor = '';
            }

            obj.vcCodeVapor = $('#cCodeVapor').val();
            obj.vcCIANaviera = $('#<%=ddlTipoEmbarque.ClientID%>').val();
            obj.vnIdLineaNaviera = $('#<%=ddlLineaNaviera.ClientID%>').val(); 
            obj.vcContainer = $('#cContainer').val();
            obj.vcSVC = $('#cSVC').val();
            obj.vnIdPersonal = $('#<%=ddlPersonal.ClientID%>').val();

            var cajas = [];
            var vnIdCultivo, vnIdVariedad, vnIdEmbalaje, vnCajas, vbPorConfirmar;
            $("#tblCajasOE tbody tr").each(function (index) {
                vnIdCultivo = $('#<%=ddlCultivo.ClientID%>').val();
                vnIdCajasOE = $(this).find('.IdCajasOE').text()
                vnIdVariedad = $(this).find('.IdVariedad').text();
                vnIdEmbalaje = $(this).find('.IdPresentacion').text();
                vnCajas = $(this).find('.Cajas').text();
                vbPorConfirmar = $(this).find('.PC').text();
                //---->Form validation goes here
                cajas.push({
                    vnIdCajasOE: vnIdCajasOE,
                    vnIdCultivo: vnIdCultivo,
                    vnIdVariedad: vnIdVariedad,
                    vnIdEmbalaje: vnIdEmbalaje,
                    vnCajas: vnCajas,
                    vbPorConfirmar: vbPorConfirmar,
                });
            });

            var observaciones = [];
            var vnIdObservacionOE, vcDescObservacion;
            $("#tblObservacionOE tbody tr").each(function (index) {
                vnIdObservacionOE = $(this).find('.IdObservacionOE').text()
                vcDescObservacion = $(this).find('.Obs').text();
                //---->Form validation goes here
                observaciones.push({
                    vnIdObservacionOE: vnIdObservacionOE,
                    vcDescObservacion: vcDescObservacion,
                });
            });
            alert(JSON.stringify(obj));
            if (obj.vcIdEmpresa != "" &&
                obj.vnIdCampana != "0" &&
                obj.vnIdCliente != "0" &&
                obj.vnIdDestino != "0" &&
                obj.vnIdConsignee != "0" &&
                obj.vnIdNotify != "0" &&
                obj.vcTipoTranporte != "0" &&
                obj.vnIdOpLogistico != "0" &&
                obj.vnIdShipper != "0" &&
                obj.vcFechaEmbarque != "0" &&
                obj.vcFlete != "0" &&
                obj.vcEmisionBL != "0" &&
                obj.vnIdCultivo != "0" &&
                obj.vncajas != "0" &&
                obj.vnPesoNeto != "0" &&
                obj.vnPesoBrutoAprox != "0" &&
                obj.vnIdCultivoTemp != "0" &&
                obj.vcAtmosferaControlada != "0" &&
                obj.vnIdPlanta != "0" &&
                obj.vnIdLugarSalida != "0" &&
                obj.vnIdVapor != "0" &&
                obj.vcCodeVapor != "0" &&
                obj.vcCIANaviera != "0" &&
                obj.vnIdLineaNaviera != "0" &&
                obj.vcContainer != "0" &&
                obj.vcSVC != "0"
            ) {
                $.ajax({
                    type: 'POST',
                    url: "../SerComex.asmx/OrdenEmbarqueRegi",
                    data: JSON.stringify({ obj: obj, arrayCoe: cajas, arrayObs: observaciones }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        toastr.success(data, 'Orden Registrado');
                        ReadOnlyFormOE();
                        //ClearFormOE();
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

        $("#cProveedor").autocomplete({
            source: function (request, response) {
                var obj = new Object();
                obj.vnId = '0';
                obj.vcNombre = $("#cProveedor").val();
                $.ajax({
                    url: "../SerComex.asmx/ProveedorListArray",
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
                        $('#IdProveedor').val(ui.item.val);
                        $("#cNroDocumento").focus();
                    } else {
                        $('#IdProveedor').val('0');
                    }
                } else {
                    $('#IdProveedor').val('0');
                }
            },
            minLength: 2
        });

        $("#cOpLogistico").autocomplete({
            source: function (request, response) {
                var obj = new Object();
                obj.vnId = '0';
                obj.vcNombre = $("#cOpLogistico").val();
                $.ajax({
                    url: "../SerComex.asmx/ProveedorListArray",
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
                        $('#IdOpLogistico').val(ui.item.val);
                        $("#cNroDocumento").focus();
                    } else {
                        $('#IdOpLogistico').val(0);
                    }
                } else {
                    $('#IdOpLogistico').val(0);
                }
            },
            minLength: 2
        });

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
                        $('#IdNotificador2').val(ui.item.val);
                        $("#cNroDocumento").focus();
                    } else {
                        $('#IdNotificador2').val('0');
                    }
                } else {
                    $('#IdNotificador2').val('0');
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
                        $('#IdNotificador').val(ui.item.val);
                        $("#cNroDocumento").focus();
                    } else {
                        $('#IdNotificador').val('0');
                    }
                } else {
                    $('#IdNotificador').val('0');
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
                        $('#IdConsignatario').val(ui.item.val);
                        $("#cNroDocumento").focus();
                    } else {
                        $('#IdConsignatario').val('0');
                    }
                } else {
                    $('#IdConsignatario').val('0');
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
                        $('#IdCliente').val(ui.item.val);
                        $("#cNroDocumento").focus();
                    } else {
                        $('#IdCliente').val('0');
                    }
                } else {
                    $('#IdCliente').val('0');
                }

            },
            minLength: 2
        });
        Load_OECons();
        function Load_OECons() {
            var obj = new Object();
            $.ajax({
                type: 'POST',
                url: "../SerComex.asmx/OrdenEmbarqueConsolidadoList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    var searchBox = $("#sbOrdenEmbarqueConsolidado").dxSelectBox({
                        dataSource: lst,
                        displayExpr: 'cConsolidado',
                        valueExpr: 'nIdOrdenEmbarque',
                        searchEnabled: true,
                        placeholder: "Seleccione",
                        noDataText: "Sin Datos",
                        acceptCustomValue: true,
                    }).dxSelectBox("instance");
                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        Load_LugarSalida();
        function Load_LugarSalida() {
            var obj = new Object();
            $.ajax({
                type: 'POST',
                url: "../SerComex.asmx/LugarSalidaList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    var searchBox = $("#ccLugarSalida").dxSelectBox({
                        dataSource: lst,
                        displayExpr: 'Nombre',
                        valueExpr: 'Id',
                        searchEnabled: true,
                        placeholder: "Seleccione",
                        noDataText: "Sin Datos",
                        acceptCustomValue: true,
                    }).dxSelectBox("instance");
                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        Load_Navio();
        function Load_Navio() {
            var obj = new Object();
            $.ajax({
                type: 'POST',
                url: "../SerComex.asmx/NavioList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    var searchBox = $("#ccNavio").dxSelectBox({
                        dataSource: lst,
                        displayExpr: 'cDescNavio',
                        valueExpr: 'nIdNavio',
                        searchEnabled: true,
                        placeholder: "Seleccione",
                        noDataText: "Sin Datos",
                        acceptCustomValue: true,
                    }).dxSelectBox("instance");
                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
