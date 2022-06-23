<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_CreateGuiaRemision.aspx.cs" Inherits="SFC_WEB_APP.Mod_Agro.Wfo_CreateGuiaRemision" %>

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
    <link rel="stylesheet" type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />

    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap4.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <%--    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>--%>

    <style>
        .dx-freespace-row {
            height: 0px !important;
        }

        #DataGrid {
            height: 520px;
            width: 100%;
        }

        .long-title h3 {
            font-family: 'Segoe UI Light', 'Helvetica Neue Light', 'Segoe UI', 'Helvetica Neue', 'Trebuchet MS', Verdana;
            font-weight: 200;
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
        }

        #gridContainer {
            height: 440px;
        }

        .options {
            padding: 0px;
            margin-top: 0px;
        }

        .caption {
            font-size: 18px;
            font-weight: 500;
        }

        .option {
            margin-top: 0px;
        }

        .dx-datagrid-rowsview .dx-row > .dx-master-detail-cell {
            padding: 15px;
        }
    </style>
    <style>
        #events {
            background-color: rgba(191, 191, 191, 0.15);
            padding: 20px;
            margin-top: 20px;
        }

            #events > div {
                padding-bottom: 5px;
            }

                #events > div:after {
                    content: "";
                    display: table;
                    clear: both;
                }

            #events #clear {
                float: right;
            }

            #events .caption {
                float: left;
                font-weight: bold;
                font-size: 115%;
                line-height: 115%;
                padding-top: 7px;
            }

            #events ul {
                list-style: none;
                max-height: 100px;
                overflow: auto;
                margin: 0;
            }

                #events ul li {
                    padding: 7px 0;
                    border-bottom: 1px solid #dddddd;
                }

                    #events ul li:last-child {
                        border-bottom: none;
                    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">


    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h4 class="card-title text-uppercase">Guia Remision</h4>
                        <br />
                        <div class="row" id="head_guia">
                            <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <table style="width: 100%">
                                    <thead>
                                        <tr>
                                            <td class="p-0 m-0">
                                                <label class="col-form-label pb-0 white">SERIE:</label></td>
                                            <td class="p-0 m-0">
                                                <label class="col-form-label pb-0 white">NUMERO:</label></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td style="width: 50%" class="p-0 m-0">
                                                <div class="input-group mb-1">
                                                    <div id="Serieb" class="form-control"></div>

                                                </div>
                                            </td>
                                            <td style="width: 50%" class="p-0 m-0">
                                                <div class="input-group mb-1">
                                                    <div id="cNumerob" class="form-control"></div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
                                <label for="btnRec">&nbsp;</label>
                                <button type="button" id="SearchGuia" class="btn btn-secondary col-12">
                                    <i class="fa fa-search"></i>Buscar Guia
                                </button>
                            </div>
                            <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
                                <label for="btnRec">&nbsp;</label>
                                <button type="button" id="NewGuia" class="btn btn-secondary col-12">
                                    <i class="fa fa-plus"></i>Nueva Guia
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="card-body" style="display: none" id="body_guia">
                        <div class="row">
                            <div class="col-lg-12 ">
                                <div class="row">
                                    <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <label for="message-text" class="col-form-label pb-0">Almacen:</label>
                                        <div id="Almacen"></div>
                                    </div>
                                    <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                                        <label for="txtFeCont" class="col-form-label pb-0">Punto Partida:</label>
                                        <div id="cPuntoPartida"></div>
                                    </div>
                                    <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                                        <label for="txtFeCont" class="col-form-label pb-0">Ubigeo:</label>
                                        <input type="text" id="cUbigeoPartida" name="cUbigeoPartida" autocomplete="off" class="form-control" placeholder="Ubigeo" />
                                    </div>
                                    <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <td class="p-0 m-0">
                                                        <label class="col-form-label pb-0">SERIE:</label></td>
                                                    <td class="p-0 m-0">
                                                        <label class="col-form-label pb-0">NUMERO:</label></td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td style="width: 50%" class="p-0 m-0">
                                                        <div class="input-group mb-1">
                                                            <div id="Serie" class="form-control"></div>

                                                        </div>
                                                    </td>
                                                    <td style="width: 50%" class="p-0 m-0">
                                                        <div class="input-group mb-1">
                                                            <input type="text" id="cNumero" name="cNumero" autocomplete="off" class="form-control" placeholder="Numero" />
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivFechaGuia">
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
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group mb-2">
                                    <table style="width: -webkit-fill-available">
                                        <thead>
                                            <tr>
                                                <td class="p-0 m-0">
                                                    <label for="txtFeCont" class="col-form-label pb-0">Cliente:</label></td>
                                                <td class="p-0 m-0 text-right font-weight-bold"><span id="cClienteruc"></span></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td colspan="2" class="p-0 m-0">
                                                    <div class="input-group mb-1">
                                                        <input type="text" id="cCliente" name="cCliente" autocomplete="off" class="form-control" placeholder="Cliente" />
                                                        <input type="hidden" id="IdCliente" name="IdCliente" value="0" />
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="form-group mb-2">
                                    <table style="width: -webkit-fill-available">
                                        <thead>
                                            <tr>
                                                <td class="p-0 m-0">
                                                    <label for="txtFeCont" class="col-form-label pb-0">Cliente Destino:</label></td>
                                                <td class="p-0 m-0 text-right font-weight-bold"><span id="cClienteDestinoruc"></span></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td colspan="2" class="p-0 m-0">
                                                    <div class="input-group mb-1">
                                                        <input type="text" id="cClienteDestino" name="cClienteDestino" autocomplete="off" class="form-control" placeholder="Cliente Destino" />
                                                        <input type="hidden" id="IdClienteDestino" name="IdClienteDestino" value="0" />
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group mb-2">
                                    <label for="txtFeCont" class="col-form-label pb-0">Unidad de Negocio:</label>
                                    <div id="cUnidadNegocio"></div>
                                </div>
                                <div class="form-group mb-2">
                                    <label for="txtFeCont" class="col-form-label pb-0">Sub Unidad de Negocio:</label>
                                    <div id="cSubUnidadNegocio"></div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group mb-2">
                                    <label for="txtFeCont" class="col-form-label pb-0">Motivo Traslado:</label>
                                    <div id="MotivoTraslado"></div>
                                </div>
                                <div class="form-group mb-2" id="DivFechaTraslado">
                                    <label for="txtFeCont" class="col-form-label pb-0">Fecha Traslado:</label>
                                    <input type="text" id="cFechaTraslado" name="cFechaTraslado" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy" />
                                    <script type="text/javascript">
                                        $(function () {
                                            $('#cFechaTraslado').datetimepicker({
                                                format: 'DD/MM/YYYY',
                                                locale: 'es'
                                            });
                                            $(function () {
                                                $('#DivFechaTraslado').datetimepicker({
                                                    format: 'DD/MM/YYYY',
                                                    locale: 'es'
                                                });
                                            });
                                        });
                                    </script>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group mb-2">
                                    <label for="txtFeCont" class="col-form-label pb-0">Responsable:</label>
                                    <div id="Responsable"></div>
                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label pb-0">Glosa:</label>
                                    <textarea id="cGlosa" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="row">
                                    <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <table style="width: -webkit-fill-available">
                                            <thead>
                                                <tr>
                                                    <td class="p-0 m-0">
                                                        <label for="txtFeCont" class="col-form-label pb-0">Empresa Transportista:</label></td>
                                                    <td class="p-0 m-0 text-right font-weight-bold"><span id="cTransportistaruc"></span></td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td colspan="2" class="p-0 m-0">
                                                        <div class="input-group mb-1">
                                                            <input type="text" id="cTransportista" name="cTransportista" autocomplete="off" class="form-control" placeholder="Transportista" />
                                                            <input type="hidden" id="IdTransportista" name="IdTransportista" value="0" />
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <label for="txtFeCont" class="col-form-label pb-0">Modo Transporte:</label>
                                        <select class="form-control" id="Idmodalidad_transporte" name="Idmodalidad_transporte">
                                            <option value="00" selected="selected">seleccione</option>
                                            <option value="01">PUBLICO</option>
                                            <option value="02">PRIVADO</option>
                                        </select>
                                    </div>
                                    <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <label for="txtFeCont" class="col-form-label pb-0">Conductor:</label>
                                        <div id="cChofer"></div>
                                    </div>
                                    <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <label for="txtFeCont" class="col-form-label pb-0">Dni Conductor:</label>
                                        <input type="tel" id="dnicon" name="Dni" autocomplete="off" class="form-control" placeholder="Dni" />
                                    </div>
                                    <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <label for="txtFeCont" class="col-form-label pb-0">Brevete:</label>
                                        <input type="text" id="cBrevete" name="cBrevete" autocomplete="off" class="form-control" placeholder="Brevete" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <label for="txtFeCont" class="col-form-label pb-0">Placa:</label>
                                        <input type="text" id="cPlaca1" name="cPlaca1" autocomplete="off" class="form-control" placeholder="PLACA 1" />
                                    </div>
                                    <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <label for="txtFeCont" class="col-form-label pb-0">Marca:</label>
                                        <input type="text" id="cMarca1" name="cMarca1" autocomplete="off" class="form-control" placeholder="MARCA 1" />
                                    </div>
                                    <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <label for="txtFeCont" class="col-form-label pb-0">Certif. Inscripcion:</label>
                                        <input type="text" id="IdCertificadoTransporte1" name="IdCertificadoTransporte1" autocomplete="off" class="form-control" placeholder="Certificado Transporte 1" />
                                    </div>
                                    <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                                        <label for="txtFeCont" class="col-form-label pb-0">Certif. Inscripcion 2:</label>
                                        <input type="text" id="IdCertificadoTransporte2" name="IdCertificadoTransporte2" autocomplete="off" class="form-control" placeholder="Certificado Transporte 2" />
                                    </div>
                                    <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                                        <label for="txtFeCont" class="col-form-label pb-0">Marca 2:</label>
                                        <input type="text" id="cMarca2" name="cMarca2" autocomplete="off" class="form-control" placeholder="MARCA 2" />
                                    </div>
                                    <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                                        <label for="txtFeCont" class="col-form-label pb-0">Placa 2:</label>
                                        <input type="text" id="cPlaca2" name="cPlaca2" autocomplete="off" class="form-control" placeholder="PLACA 2" />
                                    </div>
                                    <%--                                </div>
                                <div class="row">--%>
                                    <div class="form-group mb-2 col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                                        <label for="txtFeCont" class="col-form-label pb-0">Nro Bultos:</label>
                                        <input type="text" id="cNroBultos" name="cNroBultos" autocomplete="off" class="form-control" placeholder="Nro Bultos" disabled="disabled" />
                                    </div>
                                    <div class="col-md-3">
                                        <input type="hidden" id="IdEstado" name="IdEstado" value="PE" />
                                        <div class="form-group mb-2">
                                            <label for="txtFeCont" class="col-form-label pb-0">PESO TOTAL:</label>
                                            <input type="text" id="cPeso" name="cPeso" autocomplete="off" class="form-control" placeholder="Peso Total" disabled="disabled" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group mb-2 text-center">
                                    <button type="button" id="btnProductos" class="btn btn-primary btn-sm" data-toggle="modal">Añadir</button>
                                </div>
                                <div class="form-group mb-2" style="min-height: 10vh; overflow: auto;">
                                    <table class="table table-sm" id="tblProductos" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th>Item</th>
                                                <th>Producto</th>
                                                <th>Descripcion</th>
                                                <th>U.M.</th>
                                                <th>Consumidor</th>
                                                <th>Cantidad</th>
                                                <th style="display: none">Precio</th>
                                                <th style="display: none">Importe</th>
                                                <th>Peso</th>
                                                <th>Observacion</th>
                                                <td>/</td>
                                                <th>X</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot style="display: none">
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td style="display: none"></td>
                                                <td><b id="Cantidadtotal"></b></td>
                                                <td style="display: none"><b id="preciototal"></b></td>
                                                <td style="display: none"><b id="Importetotal"></b></td>
                                                <td><b id="Pesototal"></b></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer" style="display: none" id="footer_guia">
                        <div class="col-md-12t">
                            <input type="hidden" id="idingresosalidaalm" name="idingresosalidaalm" value="" />
                            <input type="hidden" id="idaccion" name="idaccion" value="1" />
                            <button type="button" id="PrintGuia" class="btn btn-primary" style="display: none">Imprimir</button>
                            <button type="button" id="btn-cancel" class="btn btn-info">Cancelar</button>
                            <button type="button" id="addGuia" class="btn btn-primary">Guardar</button>
                            <button type="button" id="EditGuia" class="btn btn-warning" style="display: none">Editar</button>
                            <button type="button" id="AnularGR" class="btn btn-danger" style="display: none">Anular</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade  modal-child" id="ModProductos" data-backdrop-limit="1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-modal-parent="#ModOrden">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Producto</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group p-0 m-0">
                        <input type="hidden" id="hfRowIndex" value="" />
                        <div class="form-group pb-0 m-0">
                            <label for="message-text" class="col-form-label">Producto:</label>
                            <input type="text" id="vcdescripcion" name="tDescripcion" autocomplete="off" class="form-control" placeholder="Producto" />
                        </div>
                        <div class="form-group mb-2">
                            <div class="form-group mb-2">
                                <label for="message-text" class="col-form-label pb-0">Codigo Prod:</label>
                                <input type="text" id="vcidproducto" class="form-control" autocomplete="off" />
                            </div>
                        </div>
                        <div class="form-group mb-2">
                            <div class="form-group mb-2">
                                <label for="message-text" class="col-form-label pb-0">U.M.:</label>
                                <input type="text" id="vcidmedida" class="form-control" autocomplete="off" />
                            </div>
                        </div>
                        <div class="form-group mb-2">
                            <div class="form-group mb-2">
                                <label for="message-text" class="col-form-label pb-0">Consumidor:</label>
                                <div id="sel-cc" class="form-control"></div>
                            </div>
                        </div>
                        <div class="form-group mb-2" style="display: none">
                            <div class="form-group mb-2">
                                <label for="message-text" class="col-form-label pb-0">Cantidad:</label>
                                <input type="tel" id="vccantidad" class="form-control number" autocomplete="off" />
                            </div>
                        </div>
                        <div class="form-group mb-2" style="display: none">
                            <div class="form-group mb-2">
                                <label for="message-text" class="col-form-label pb-0">Precio:</label>
                                <input type="tel" id="vcprecio" class="form-control number" autocomplete="off" />
                            </div>
                        </div>
                        <div class="form-group mb-2" style="display: none">
                            <label for="message-text" class="col-form-label pb-0">Importe:</label>
                            <input type="tel" id="vcimporte" class="form-control number" autocomplete="off" />
                        </div>
                        <div class="form-group mb-2">
                            <div class="form-group mb-2">
                                <label for="message-text" class="col-form-label pb-0">Peso:</label>
                                <input type="tel" id="vcpeso" class="form-control number" autocomplete="off" />
                            </div>
                        </div>
                        <div class="form-group mb-2">
                            <div class="form-group mb-2">
                                <label for="message-text" class="col-form-label pb-0">Observacion:</label>
                                <input type="text" id="vcobservacion" class="form-control" autocomplete="off" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" id="nIdCajasOE" value="0" />
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="button" id="addProductos" class="btn btn-primary" style="display: none">Agregar</button>
                        <button type="button" id="EditProductos" class="btn btn-primary" style="display: none">Actualizar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(".number").on({
            "focus": function (event) {
                $(event.target).select();
            },
            "keyup": function (event) {
                $(event.target).val(function (index, value) {
                    return value.replace(/\D/g, "")
                        .replace(/([0-9])([0-9]{2})$/, '$1.$2')
                        .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
                });
            }
        });
        var hoy = new Date();
        var fecha = ('0' + hoy.getDate()).slice(-2) + '/' + ('0' + (hoy.getMonth() + 1)).slice(-2) + '/' + hoy.getFullYear();

        $('#cFechaGuia').val(fecha);
        $('#cFechaTraslado').val(fecha);

        $("#vccantidad").change(function () {
            var cant = $(this).val();
            var pre = $("#vcprecio").val();
            $("#vcimporte").val(parseInt(quita_comas(cant)) * parseInt(quita_comas(pre)));
        });

        $("#vcprecio").change(function () {
            var cant = $(this).val();
            var pre = $("#vccantidad").val();

            $("#vcimporte").val(parseInt(quita_comas(cant)) * parseInt(quita_comas(pre)));
        });

        $("#btnProductos").click(function () {
            //si seleccionas almacen se activa punto partida lo carga
            //si seleccionas unidad de negoco se activa sub unidad

            idempresa = '001';
            idingresosalidaalm = '';
            idsucursal = '001';
            if ($("#Almacen").dxSelectBox('instance').option('selectedItem') != null) {
                idalmacen = $("#Almacen").dxSelectBox('instance').option('selectedItem').IDALMACEN;
            } else {
                idalmacen = '';
            }
            iddocumento = 'GRE';
            if ($("#Serie").dxSelectBox('instance').option('selectedItem') != null) {
                serie = $("#Serie").dxSelectBox('instance').option('selectedItem').IDRESPONSABLE;
            } else {
                serie = ''
            }
            numero = $('#cNumero').val();
            ventana = 'EDT_REMISION';
            fecha = $('#cFechaGuia').val();
            idclieprov = $('#IdCliente').val();
            idclieprovdest = $('#IdClienteDestino').val();
            fechatraslado = $('#cFechaTraslado').val();
            if ($("#Responsable").dxSelectBox('instance').option('selectedItem') != null) {
                idresponsable = $("#Responsable").dxSelectBox('instance').option('selectedItem').IDRESPONSABLE;
            } else {
                idresponsable = '';
            }
            idmoneda = '01';
            idmotivo = 'TF1';
            idestado = 'PE';
            glosa = $('#cGlosa').val();
            idtransportista = $('#IdTransportista').val();
            dni = $('#dnicon').val();
            if ($("#cChofer").dxSelectBox('instance').option('selectedItem') != null) {
                cChofer = $("#cChofer").dxSelectBox('instance').option('selectedItem').descripcion;
            } else {
                cChofer = '';
            }
            brevete = $('#cBrevete').val();
            certiftransporte = $('#IdCertificadoTransporte1').val();
            certiftransporte1 = $('#IdCertificadoTransporte2').val();
            marca = $('#cMarca1').val();
            marca1 = $('#cMarca2').val();
            placa = $('#cPlaca1').val();
            placa1 = $('#cPlaca2').val();
            if ($("#MotivoTraslado").dxSelectBox('instance').option('selectedItem') != null) {
                idmotivo_traslado_sunat = $("#MotivoTraslado").dxSelectBox('instance').option('selectedItem').IDRESPONSABLE;
            } else {
                idmotivo_traslado_sunat = '';
            }
            if ($("#cUnidadNegocio").dxSelectBox('instance').option('selectedItem') != null) {
                idunidadnegocio = $("#cUnidadNegocio").dxSelectBox('instance').option('selectedItem').IDUNIDADNEGOCIO;
            } else {
                idunidadnegocio = '';
            }
            if ($("#cSubUnidadNegocio").dxSelectBox('instance').option('selectedItem') != null) {
                idsubunidadnegocio = $("#cSubUnidadNegocio").dxSelectBox('instance').option('selectedItem').IDSUBUNIDADNEGOCIO;
            } else {
                idsubunidadnegocio = '';
            }


            idubigeopartida = $('#cUbigeoPartida').val();
            peso_total = $('#cPeso').val();
            idmodalidad_transporte = $('#Idmodalidad_transporte').val();
            nro_bultos = $('#cNroBultos').val();
            idusuario = 'ESUN';

            //if (idsucursal != '' && idalmacen != '' && idmotivo != '' && iddocumento != '' && idclieprov != '' && idclieprovdest != '' && idubigeopartida != '' && idunidadnegocio != '' && idsubunidadnegocio != '') {
            clearModProductos();
            $('#addProductos').show();
            $('#EditProductos').hide();
            $('#ModProductos').modal('show');
            //    $('#nIdCajasOE').val($(this).val());
            //} else {
            //    toastr.error('', 'seleccione cultivo');
            //    $('#nIdCajasOE').val('0');
            //}
        });



        function clearall() {

            var obj = new Object();
            $('#idingresosalidaalm').val('');
            $('#idaccion').val('1');

            $("#tblProductos tbody").html('')

            $("#Almacen").dxSelectBox("reset");
            $('#iddocumento').val('GRE');
            $("#Serie").dxSelectBox("reset");
            $('#cNumero').val('');
            //$('#cPuntoPartida').dxSelectBox("reset");
            $('#cFechaGuia').data("DateTimePicker").clear();
            $('#IdCliente').val('');
            $('#cCliente').val('');
            $('#cClienteruc').text('');
            $('#IdClienteDestino').val('');
            $('#cClienteDestino').val('');
            $('#cClienteDestinoruc').text('');
            $('#cFechaTraslado').data("DateTimePicker").clear();
            $("#Responsable").dxSelectBox("reset");
            $("#Motivo").dxSelectBox("reset");
            $('#cGlosa').val('');
            $('#cTransportista').val("");
            $('#cTransportistaruc').text("");
            $('#IdTransportista').val("");
            $("#dnicon").val('');
            $('#cChofer').dxSelectBox("reset");
            $('#cBrevete').val('');
            $('#IdCertificadoTransporte1').val('');
            $('#IdCertificadoTransporte2').val('');
            $('#cMarca1').val('');
            $('#cMarca2').val('');
            $('#cPlaca1').val('');
            $('#cPlaca2').val('');
            $("#MotivoTraslado").dxSelectBox("reset");
            $("#cUnidadNegocio").dxSelectBox("reset");
            $("#cSubUnidadNegocio").dxSelectBox("reset");
            $('#cUbigeoPartida').val('');
            //$('#cPeso').val('');
            $('#Idmodalidad_transporte').val('00');
            //$('#cNroBultos').val('');
            $('#cFechaGuia').val(fecha);
            $('#cFechaTraslado').val(fecha);

            $('#PrintGuia').hide();

            $('#addGuia').html('Guardar');
        }

        function readonly() {

            var obj = new Object();
            $("#Almacen").dxSelectBox('instance').option('disabled', true);
            //$('#cPuntoPartida').dxSelectBox('instance').option('disabled', true);
            $("#Serie").dxSelectBox({ disabled: true });
            $('#cNumero').attr('disabled', 'disabled');
            $('#cFechaGuia').attr('disabled', 'disabled');
            $('#IdCliente').attr('disabled', 'disabled');
            $('#cCliente').attr('disabled', 'disabled');
            $('#IdClienteDestino').attr('disabled', 'disabled');
            $('#cClienteDestino').attr('disabled', 'disabled');
            $('#cFechaTraslado').attr('disabled', 'disabled');
            $("#Responsable").dxSelectBox('instance').option('disabled', true);
            //$("#Motivo").dxSelectBox('instance').option('disabled', true);
            $('#cGlosa').attr('disabled', 'disabled');
            $('#cTransportista').attr('disabled', 'disabled');
            $("#dnicon").attr('disabled', 'disabled');
            $('#cChofer').dxSelectBox('instance').option('disabled', true);
            $('#cBrevete').attr('disabled', 'disabled');
            $('#IdCertificadoTransporte1').attr('disabled', 'disabled');
            $('#IdCertificadoTransporte2').attr('disabled', 'disabled');
            $('#cMarca1').attr('disabled', 'disabled');
            $('#cMarca2').attr('disabled', 'disabled');
            $('#cPlaca1').attr('disabled', 'disabled');
            $('#cPlaca2').attr('disabled', 'disabled');
            $("#MotivoTraslado").dxSelectBox('instance').option('disabled', true);
            $("#cUnidadNegocio").dxSelectBox('instance').option('disabled', true);
            $("#cSubUnidadNegocio").dxSelectBox('instance').option('disabled', true);
            $('#cUbigeoPartida').attr('disabled', 'disabled');
            $('#cPeso').attr('disabled', 'disabled');
            $('#Idmodalidad_transporte').attr('disabled', 'disabled');
            $('#cNroBultos').attr('disabled', 'disabled');

            $('#btnProductos').hide();
            $('#addGuia').hide();
            $('#EditGuia').show();
            $('#AnularGR').show();
            $('#PrintGuia').show();

            $('.EditProductos').hide();
            $('.DeleteProductos').hide();
        }

        $(document).on('click', '#EditGuia', function (e) {
            e.preventDefault();
            $('#idaccion').val('2');
            edit();

            $('#PrintGuia').hide();
        });

        $(document).on('click', '#NewGuia', function (e) {
            e.preventDefault();
            edit();
            $('#idaccion').val('1');
            clearall();
            $('#body_guia').show();
            $('#footer_guia').show();

            $("#Serieb").dxSelectBox("reset");
            $("#cNumerob").dxSelectBox("reset");

            $('#PrintGuia').hide();
        });


        function edit() {
            var obj = new Object();
            $("#Almacen").dxSelectBox('instance').option('disabled', false);
           //$('#cPuntoPartida').dxSelectBox('instance').option('disabled', false);
            $("#Serie").dxSelectBox('instance').option('disabled', false);
            $('#cNumero').removeAttr('disabled');
            $('#cFechaGuia').removeAttr('disabled');
            $('#IdCliente').removeAttr('disabled');
            $('#cCliente').removeAttr('disabled');
            $('#IdClienteDestino').removeAttr('disabled');
            $('#cClienteDestino').removeAttr('disabled');
            $('#cFechaTraslado').removeAttr('disabled');
            $("#Responsable").dxSelectBox('instance').option('disabled', false);
            // $("#Motivo").dxSelectBox({ disabled: true });
            $('#cGlosa').removeAttr('disabled');
            $('#cTransportista').removeAttr('disabled');
            $("#dnicon").removeAttr('disabled');
            $('#cChofer').dxSelectBox('instance').option('disabled', false);
            $('#cBrevete').removeAttr('disabled');
            $('#IdCertificadoTransporte1').removeAttr('disabled');
            $('#IdCertificadoTransporte2').removeAttr('disabled');
            $('#cMarca1').removeAttr('disabled');
            $('#cMarca2').removeAttr('disabled');
            $('#cPlaca1').removeAttr('disabled');
            $('#cPlaca2').removeAttr('disabled');
            $("#MotivoTraslado").dxSelectBox('instance').option('disabled', false);
            $("#cUnidadNegocio").dxSelectBox('instance').option('disabled', false);
            $("#cSubUnidadNegocio").dxSelectBox('instance').option('disabled', false);
            $('#cUbigeoPartida').removeAttr('disabled');
            //$('#cPeso').removeAttr('disabled');
            $('#Idmodalidad_transporte').removeAttr('disabled');
            //$('#cNroBultos').removeAttr('disabled');


            $('#addGuia').html('Actualizar');
            $('#btnProductos').show();
            $('#addGuia').show();
            $('#EditGuia').hide();
            $('#AnularGR').hide();

            $('.EditProductos').show();
            $('.DeleteProductos').show();
        }

        $(document).on('click', '#AnularGR', function (e) {
            e.preventDefault();
            $('#idaccion').val('3');
            AddEdit();
        });

        $(document).on('click', '#btn-cancel', function (e) {
            e.preventDefault();
            clearall();
            $('#body_guia').hide();
            $('#footer_guia').hide();


            $("#Serieb").dxSelectBox("reset");
            $("#cNumerob").dxSelectBox("reset");
        });

        $(document).on('click', '#PrintGuia', function (e) {
            e.preventDefault();
            var vcida = $('#idingresosalidaalm').val();
            if (vcida != '') {
                openurl('http://esun.sunfruits.com.pe/Mod_Agro/Wfo_PrintGuia?Cd=iOSoj9CXOnnbgHw5p9jlfQ==&Gre=' + vcida);
            }
        });



        $(document).on('click', '#addGuia', function (e) {
            e.preventDefault();
            AddEdit();
        });

        function AddEdit() {

            var obj = new Object();
            obj.vcidempresa = '001';
            obj.vcidingresosalidaalm = $('#idingresosalidaalm').val();
            obj.vcidsucursal = '001';
            if ($("#Almacen").dxSelectBox('instance').option('selectedItem') != null) {
                obj.vcidalmacen = $("#Almacen").dxSelectBox('instance').option('selectedItem').IDALMACEN;
            } else {
                obj.vcidalmacen = '';
                toastr.error('', 'Seleccione Almacen');
                return
            }
            obj.vciddocumento = 'GRE';
            if ($("#Serie").dxSelectBox('instance').option('selectedItem') != null) {
                obj.vcserie = $("#Serie").dxSelectBox('instance').option('selectedItem').SERIE;
            } else {
                obj.vcserie = ''
                toastr.error('', 'Seleccione Numero y Serie');
                return
            }
            obj.vcnumero = $('#cNumero').val();
            obj.vcventana = 'EDT_REMISION';
            //obj.vcfecha = $('#cFechaGuia').val();
            if ($('#cFechaGuia').val() != '') {
                var str2 = $('#cFechaGuia').val();
                var res2 = str2.split("/", 3);
                obj.vcfecha = res2[2] + '-' + res2[1] + '-' + res2[0] + 'T00:00:00';
            } else {
                obj.vcfecha = '';
                toastr.error('', 'Seleccione Fecha Guia');
                return
            }
            obj.vcidclieprov = $('#IdCliente').val();
            obj.vcidclieprovdest = $('#IdClienteDestino').val();
            if ($('#IdCliente').val() == '') {
                toastr.error('', 'Seleccione Cliente');
                return
            }
            //obj.vcfechatraslado = $('#cFechaTraslado').val();
            if ($('#cFechaTraslado').val() != '') {
                var str2 = $('#cFechaTraslado').val();
                var res2 = str2.split("/", 3);
                obj.vcfechatraslado = res2[2] + '-' + res2[1] + '-' + res2[0] + 'T00:00:00';
            } else {
                obj.vcfechatraslado = '';
                toastr.error('', 'Seleccione Fecha Traslado');
                return
            }
            if ($("#Responsable").dxSelectBox('instance').option('selectedItem') != null) {
                obj.vcidresponsable = $("#Responsable").dxSelectBox('instance').option('selectedItem').IDRESPONSABLE;
            } else {
                obj.vcidresponsable = '';
            }
            obj.vcidmoneda = '01';
            obj.vcidmotivo = 'TF1';
            obj.vcidestado = 'PE';
            obj.vcglosa = $('#cGlosa').val();
            obj.vcidtransportista = $('#IdTransportista').val();
            obj.vcdni = $('#dnicon').val();
            if ($("#cChofer").dxSelectBox('instance').option('selectedItem') != null) {
                obj.vcchofer = $("#cChofer").dxSelectBox('instance').option('selectedItem').descripcion;
            } else {
                obj.vcchofer = '';
            }
            obj.vcbrevete = $('#cBrevete').val();
            obj.vccertiftransporte = $('#IdCertificadoTransporte1').val();
            obj.vccertiftransporte1 = $('#IdCertificadoTransporte2').val();
            obj.vcmarca = $('#cMarca1').val();
            obj.vcmarca1 = $('#cMarca2').val();
            obj.vcplaca = $('#cPlaca1').val();
            obj.vcplaca1 = $('#cPlaca2').val();
            if ($("#MotivoTraslado").dxSelectBox('instance').option('selectedItem') != null) {
                obj.vcidmotivo_traslado_sunat = $("#MotivoTraslado").dxSelectBox('instance').option('selectedItem').IDMOTIVO;
            } else {
                obj.vcidmotivo_traslado_sunat = '';
                toastr.error('', 'Motivo Traslado');
                return
            }
            if ($("#cUnidadNegocio").dxSelectBox('instance').option('selectedItem') != null) {
                obj.vcidunidadnegocio = $("#cUnidadNegocio").dxSelectBox('instance').option('selectedItem').IDUNIDADNEGOCIO;
            } else {
                obj.vcidunidadnegocio = '';
                toastr.error('', 'Seleccione Unidad Negocio');
                return
            }
            if ($("#cSubUnidadNegocio").dxSelectBox('instance').option('selectedItem') != null) {
                obj.vcidsubunidadnegocio = $("#cSubUnidadNegocio").dxSelectBox('instance').option('selectedItem').IDSUBUNIDADNEGOCIO;
            } else {
                obj.vcidsubunidadnegocio = '';
                toastr.error('', 'Seleccione Sub Unidad Negocio');
                return
            }


            obj.vcidubigeopartida = $('#cUbigeoPartida').val();
            obj.vcpeso_total = quita_comas($('#cPeso').val());
            obj.vcidmodalidad_transporte = $('#Idmodalidad_transporte').val();
            obj.vcnro_bultos = quita_comas($('#cPeso').val());
            obj.vcidusuario = 'ESUN';

            obj.vcAccion = $('#idaccion').val();
            obj.valida_stock = 1;

            var Productos = [];
            var vcitem, vcidproducto, vcdescripcion, vcidmedida, vcidconsumidor, vccantidad, vcprecio, vcimporte, vcobservacion, vcpeso;
            $("#tblProductos tbody tr").each(function (index) {
                vcitem = $(this).find('.vcitem').text();
                vcidproducto = $(this).find('.vcidproducto').text();
                vcdescripcion = $(this).find('.vcdescripcion').text();
                vcidmedida = $(this).find('.vcidmedida').text();
                vcidconsumidor = $(this).find('.vcidconsumidor').text();
                vccantidad = quita_comas($(this).find('.vccantidad').text());
                vcprecio = '0';
                vcimporte = '0';
                vcobservacion = $(this).find('.vcobservacion').text();
                vcpeso = quita_comas($(this).find('.vcpeso').text());

                var itx = zfill(index + 1, 3);
                //---->Form validation goes here
                Productos.push({
                    vcitem: itx,
                    vcidproducto: vcidproducto,
                    vcdescripcion: vcdescripcion,
                    vcidmedida: vcidmedida,
                    vcidconsumidor: vcidconsumidor,
                    vccantidad: vccantidad,
                    vcprecio: vcprecio,
                    vcimporte: vcimporte,
                    vcobservacion: vcobservacion,
                    vcpeso: vcpeso
                });
            });
            //alert(obj.vcchofer);
            $.ajax({
                type: 'POST',
                url: "../SerAgro.asmx/XmlCreateGuia",
                data: JSON.stringify({ obj: obj, arrayDetail: Productos }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    var data = new Array();
                    for (var x = 0; x < lst.length; x++) {

                        if (lst[x].tipo == '2') {
                            toastr.error('', lst[x].mensaje);
                        } else if (lst[x].tipo == '1') {
                            if (lst[x].mensaje != '') {
                                toastr.success('id=' + lst[x].iddoc, 'GUARDADO');
                                $('#idingresosalidaalm').val(lst[x].iddoc);
                                readonly();
                                openurl('http://esun.sunfruits.com.pe/Mod_Agro/Wfo_PrintGuia?Cd=iOSoj9CXOnnbgHw5p9jlfQ==&Gre=' + lst[0].iddoc)
                            } else {
                                toastr.success('id=' + lst[x].mensaje, 'ERROR NO SE GUARDO CORRECTAMENTE');
                            }
                        } else if (lst[x].tipo == '3') {
                            toastr.warning('id=' + lst[x].iddoc, 'DOCUMENTO ANULADO');
                            edit();
                            clearall();
                            $('#body_guia').hide();
                            $('#footer_guia').hide();


                            $("#Serieb").dxSelectBox("reset");
                            $("#cNumerob").dxSelectBox("reset");
                        }
                    }
                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
            // alert(JSON.stringify(Productos))
        };


        function openurl(url) {
            window.open(url, "TGuia", "width=300, height=900")
        }



        $(document).on('click', '#SearchGuia', function (e) {
            e.preventDefault();

            clearall();
            $("#tblProductos tbody").html('');
            $('#body_guia').hide();
            $('#footer_guia').hide();

            var obj = new Object();
            obj.vcidingresosalidaalm = '';

            if ($("#Serieb").dxSelectBox('instance').option('selectedItem') != null) {
                obj.vcserie = $("#Serieb").dxSelectBox('instance').option('selectedItem').SERIE;
            } else {
                obj.vcserie = ''
            }
            if ($("#cNumerob").dxSelectBox('instance').option('selectedItem') != null) {
                obj.vcnumero = $("#cNumerob").dxSelectBox('instance').option('selectedItem').NUMERO;
            } else {
                obj.vcnumero = ''
            }
            if (obj.vcserie != '' && obj.vcnumero != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerAgro.asmx/PrintGuiaRemision",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        if (lst.length != 0) {

                            if (lst[0].IDESTADO != 'AN') {
                                $('#idingresosalidaalm').val(lst[0].IDINGRESOSALIDAALM);
                                $('#idaccion').val('2');

                               // $("#cPuntoPartida").dxSelectBox("reset");
                                $("#Almacen").dxSelectBox("instance").option('value', lst[0].IDALMACEN);
                                $("#Serie").dxSelectBox("instance").option('value', lst[0].SERIE);
                                $('#cNumero').val(lst[0].NUMERO);
                                $('#cFechaGuia').val(lst[0].FECHAEMISION);
                                $('#IdCliente').val(lst[0].IDCLIEPROV);
                                $('#cCliente').val(lst[0].DES_EMISOR);
                                $('#cClienteruc').text(lst[0].RUC_EMISOR);
                                $('#IdClienteDestino').val(lst[0].IDCLIEPROVDEST);
                                $('#cClienteDestino').val(lst[0].DESTINATARIO);
                                $('#cClienteDestinoruc').text(lst[0].RUC_DESTINATARIO);
                                $('#cFechaTraslado').val(lst[0].FECHATRASLADO);
                                $("#Responsable").dxSelectBox("instance").option('value', lst[0].IDRESPONSABLE);
                                // $("#Motivo").dxSelectBox("instance").option('value', lst[0].IDMOTIVO);
                                $('#cGlosa').val(lst[0].GLOSA);
                                $('#cTransportista').val(lst[0].DES_TRANSPORTE);
                                $('#cTransportistaruc').text(lst[0].RUC_TRANSPORTE);
                                $('#IdTransportista').val(lst[0].IDTRANSPORTISTA);
                                //$('#cPuntoPartida').dxSelectBox("instance").option('value', lst[0].PUNTOPARTIDA);
                                $("#dnicon").val(lst[0].dni);
                                $('#cChofer').dxSelectBox("instance").option('value', lst[0].CHOFER);
                                $('#cBrevete').val(lst[0].BREVETE);
                                $('#IdCertificadoTransporte1').val(lst[0].CERTIFTRANSPORTE);
                                $('#IdCertificadoTransporte2').val(lst[0].CERTIFTRANSPORTE1);
                                $('#cMarca1').val(lst[0].MARCA);
                                $('#cMarca2').val(lst[0].MARCA1);
                                $('#cPlaca1').val(lst[0].PLACA);
                                $('#cPlaca2').val(lst[0].PLACA1);
                                $("#MotivoTraslado").dxSelectBox("instance").option('value', lst[0].IDMOTIVO_TRASLADO_SUNAT);
                                $("#cUnidadNegocio").dxSelectBox("instance").option('value', lst[0].IDUNIDADNEGOCIO);
                                $("#cSubUnidadNegocio").dxSelectBox("instance").option('value', lst[0].IDSUBUNIDADNEGOCIO);
                                $('#cUbigeoPartida').val(lst[0].IDUBIGEOPARTIDA);
                                $('#cPeso').val(lst[0].PESO_TOTAL);
                                $('#Idmodalidad_transporte').val(lst[0].idmodalidad_transporte).change();
                                $('#cNroBultos').val(lst[0].NRO_BULTOS);

                                var vccants = 0;
                                var vcpesos = 0;

                                for (var x = 0; x < lst.length; x++) {


                                    if (vcidproducto != 0 && vccantidad != 0 && vcprecio != '') {

                                        var vrow = '<tr>';

                                        vrow += "<td class='vcitem'>" + lst[x].ITEM + "</td>";
                                        vrow += "<td class='vcidproducto'>" + lst[x].IDPRODUCTO + "</td>";
                                        vrow += "<td class='vcdescripcion'>" + lst[x].DESCRIPCION + "</td>";
                                        vrow += "<td class='vcidmedida'>" + lst[x]['U.M'] + "</td>";
                                        vrow += "<td class='vcidconsumidor'>" + lst[x].IDCONSUMIDOR + "</td>";
                                        vrow += "<td class='vccantidad'>" + lst[x].CANTIDAD + "</td>";
                                        //vrow += "<td class='vcprecio' style='display: none'>" + vcprecio + "</td>";
                                        //vrow += "<td class='vcimporte' style='display: none'>" + vcimporte + "</td>";
                                        vrow += "<td class='vcpeso'>" + lst[x].PESO + "</td>";
                                        vrow += "<td class='vcobservacion'>" + lst[x].OBSERVACION + "</td>";
                                        vrow += "<td class=''><button class='EditProductos btn btn-link yellow m-0 p-0'><i class='fas fa-edit'></i></button></td>";
                                        vrow += "<td class=''><button class='DeleteProductos btn btn-link red m-0 p-0'><i class='fas fa-remove'></i></button></td>";
                                        vrow += "</tr>"

                                        vccants = vccants + parseInt(lst[x].CANTIDAD);
                                        vcpesos = vcpesos + parseInt(lst[x].PESO);

                                        $("#tblProductos tbody").append(vrow);
                                    }
                                }

                                $("#cNroBultos").val(formatNumber.new(vccants.toFixed(2)));
                                $("#cPeso").val(formatNumber.new(vcpesos.toFixed(2)));

                                readonly();

                                $('#body_guia').show();
                                $('#footer_guia').show();

                                $('#PrintGuia').show();
                            } else {
                                toastr.error('Esta Guia ha sido Anulada', 'Guia Anulada');
                            }

                        } else {
                            toastr.error('Guia no Encontrada', 'Verifique Serie y Numero');
                        }

                    },
                    error: function (error) {
                        toastr.error(JSON.stringify(error), '');
                    }
                });
            } else {
                toastr.error('', 'Ingrese Serie y Numero');
            }

        });


        // Load_Datos('SUC', '001', '', 'Sucursal', 'DESCRIPCION', 'IDSUCURSAL', '', 'ALM');
        Load_DatosUser('ALM', '001', 'Almacen', 'DESCRIPCION', 'IDALMACEN', '', 'CRG');

        Load_Datos('RES', '001', '', 'Responsable', 'NOMBRE', 'IDRESPONSABLE', '', '');
        Load_Datos('MON', '001', '', 'Moneda', 'DESCRIPCION', 'IDMONEDA', '', '');
        Load_Datos('MTT', '001', '', 'MotivoTraslado', 'DESCRIPCION', 'IDMOTIVO', '', '');
        Load_Datos('MOT', '001', '', 'Motivo', 'DESCRIPCION', 'IDMOTIVO', '', '');
        Load_Datos('SER', '001', 'EMI', 'Serie', 'SERIE', 'SERIE', 'NUMERO', '');
        Load_Datos('UNN', '001', '', 'cUnidadNegocio', 'DESCRIPCION2', 'IDUNIDADNEGOCIO', '', 'SUN');
        Load_Datos('SUN', '', '', 'cSubUnidadNegocio', 'DESCRIPCION2', 'IDUNIDADNEGOCIO', '', '');
        //Load_Datos('PNP', '001', '', 'cPuntoPartida', 'direccion', 'item', '33', 'cUbigeoPartida');

        Load_Datos2('CHF', '001', '', 'cChofer', 'descripcion', 'item', '', '');

        Load_Datos('SER', '001', 'EMI', 'Serieb', 'SERIE', 'SERIE', 'cNumerob', '');
        Load_Datos('SER', '001', '', 'cNumerob', 'NUMERO', 'NUMERO', '', '');


        function Load_Datos(type, emp, suc, idsel, name, id, chang, con_id) {
            var obj = new Object();
            obj.vcType = type;
            obj.vcEmpresa = emp;
            obj.vcSucursal = suc;
            $.ajax({
                type: 'POST',
                url: "../SerAlm.asmx/ListDatNis",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    select(lst, idsel, name, id, chang, con_id)
                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        function Load_DatosUser(type, emp, idsel, name, id, chang, con_id) {
            var obj = new Object();
            obj.vcType = type;
            obj.vcEmpresa = emp;
            $.ajax({
                type: 'POST',
                url: "../SerAgro.asmx/ListDatNisUser",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    select(lst, idsel, name, id, chang, con_id)
                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        function select(dat, idsel, name, id, chang, con_id) {
            if (chang != '' && con_id == '') {
                var searchBox = $("#" + idsel).dxSelectBox({
                    dataSource: dat,
                    displayExpr: name,
                    valueExpr: id,
                    searchEnabled: true,
                    placeholder: "Seleccione",
                    noDataText: "Sin Datos",
                    acceptCustomValue: true,
                    onValueChanged: function (data) {
                        var $result = $(".current-value");

                        if (data.value !== null) {
                            var selectedItem = data.component.option('selectedItem');
                            // alert(selectedItem.SERIE + " (ID: " + selectedItem.SERIE + ")");
                            if (selectedItem != null) {
                                $('#cNumero').val(selectedItem.NUMERO);
                                Load_Datos('SER', '001', selectedItem.SERIE, 'cNumerob', 'NUMERO', 'NUMERO', '', '');
                            }
                        }
                    },
                }).dxSelectBox("instance");
            } else if (chang == '' && con_id != '') {

                var searchBox = $("#" + idsel).dxSelectBox({
                    dataSource: dat,
                    displayExpr: name,
                    valueExpr: id,
                    searchEnabled: true,
                    placeholder: "Seleccione",
                    noDataText: "Sin Datos",
                    acceptCustomValue: true,
                    onValueChanged: function (data) {
                        if (con_id == 'SUN') {
                            var selectedItem = data.component.option('selectedItem');
                            if (selectedItem != null) {
                                Load_Datos('SUN', '001', selectedItem.IDUNIDADNEGOCIO, 'cSubUnidadNegocio', 'DESCRIPCION', 'IDSUBUNIDADNEGOCIO', '', 'NET');
                            }
                        }


                        if (con_id == 'cNumerob') {
                            var selectedItem4 = data.component.option('selectedItem');
                            if (selectedItem != null && selectedItem != '' && selectedItem.length != 0) {
                                $("#cNumero").dxSelectBox('instance').option(selectedItem4.NUMERO);
                            }
                        }
                    },
                }).dxSelectBox("instance");
            } else {
                var searchBox = $("#" + idsel).dxSelectBox({
                    dataSource: dat,
                    displayExpr: name,
                    valueExpr: id,
                    searchEnabled: true,
                    placeholder: "Seleccione",
                    noDataText: "Sin Datos",
                    acceptCustomValue: true,
                }).dxSelectBox("instance");
            }

        }

        function Load_Datos2(type, emp, suc, idsel, name, id, chang, con_id) {
            var obj = new Object();
            obj.vcType = type;
            obj.vcEmpresa = emp;
            obj.vcSucursal = suc;
            $.ajax({
                type: 'POST',
                url: "../SerAlm.asmx/ListDatNis",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var dat = JSON.parse(data.d);

                    var productsDataSource = new DevExpress.data.DataSource({
                        store: {
                            data: dat,
                            type: "array",
                            key: 'descripcion'
                        }
                    });

                    var searchBox = $("#cChofer").dxSelectBox({
                        dataSource: productsDataSource,
                        displayExpr: 'descripcion',
                        valueExpr: 'descripcion',
                        searchEnabled: true,
                        placeholder: "Seleccionex",
                        noDataText: "Sin Datos",
                        onValueChanged: function (data) {
                            if (data.value !== null) {
                                var selectedItem = data.component.option('selectedItem');
                                if (selectedItem != null && selectedItem != '') {
                                    $("#dnicon").val(selectedItem.dni);
                                    $("#cBrevete").val(selectedItem.brevete);
                                }
                            }
                        },
                        acceptCustomValue: true,
                        onCustomItemCreating: function (data) {
                            if (!data.text) {
                                data.customItem = null;
                                return;
                            }

                            var productIds = dat.map(function (item) {
                                return item.descripcion;
                            });

                            var incrementedId = Math.max.apply(null, productIds) + 1;
                            var newItem = {
                                descripcion: data.text,
                                id: data.text
                            };
                            data.customItem = productsDataSource.store().insert(newItem)
                                .then(() => productsDataSource.load())
                                .then(() => {
                                    return newItem;
                                })
                                .catch((error) => {
                                    throw error;
                                });
                        },

                    }).dxSelectBox("instance");
                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }



        function simpleStringify(object) {
            var simpleObject = {};
            for (var prop in object) {
                if (!object.hasOwnProperty(prop)) {
                    continue;
                }
                if (typeof (object[prop]) == 'object') {
                    continue;
                }
                if (typeof (object[prop]) == 'function') {
                    continue;
                }
                simpleObject[prop] = object[prop];
            }
            return JSON.stringify(simpleObject); // returns cleaned up JSON
        };

        $("#cSerie").change(function () {
            $(this).val();
            var conceros = zeroFill($(this).val(), 4);
            $(this).val(conceros);
        });

        $("#cNumero").change(function () {
            $(this).val();
            var conceros = zeroFill($(this).val(), 7);
            $(this).val(conceros);
        });

        function zeroFill(number, width) {
            width -= number.toString().length;
            if (width > 0) {
                return new Array(width + (/\./.test(number) ? 2 : 1)).join('0') + number;
            }
            return number + ""; // siempre devuelve tipo cadena
        }
        // CLIENTE //
        $("#cCliente").autocomplete({
            source: function (request, response) {
                var obj = new Object();
                obj.vcIdCliente = $("#cCliente").val();
                $.ajax({
                    url: "../SerComex.asmx/ArrayClienteNis",
                    data: JSON.stringify({ obj: obj }),
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    // dataFilter: function (data) { return data; },
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('|')[2],
                                val: item.split('|')[1],
                                num: item.split('|')[0]
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
                    if (ui.item.num != 0) {
                        $('#cCliente').val(ui.item.label);
                        $('#IdCliente').val(ui.item.num);
                        $('#cClienteruc').text(ui.item.num);
                        $('#cClienteDestino').val(ui.item.label);
                        $('#IdClienteDestino').val(ui.item.num);
                        $('#cClienteDestinoruc').text(ui.item.num);
                    } else {
                        $('#cCliente').val("");
                        $('#IdCliente').val("");
                        $('#cClienteruc').text("");
                        $('#cClienteDestino').val("");
                        $('#IdClienteDestino').val("");
                        $('#cClienteDestinoruc').text("");
                    }
                } else {
                    $('#cCliente').val("");
                    $('#IdCliente').val("");
                    $('#cClienteDestino').val("");
                    $('#IdClienteDestino').val("");
                    $('#cClienteDestinoruc').text("");
                }
            },
            minLength: 2
        });
        // CLIENTE //
        // CLIENTE //
        $("#cClienteDestino").autocomplete({
            source: function (request, response) {
                var obj = new Object();
                obj.vcIdCliente = $("#cClienteDestino").val();
                $('#DatCliente').hide();
                $.ajax({
                    url: "../SerComex.asmx/ArrayClienteNis",
                    data: JSON.stringify({ obj: obj }),
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    // dataFilter: function (data) { return data; },
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('|')[2],
                                val: item.split('|')[1],
                                num: item.split('|')[0]
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
                    if (ui.item.num != 0) {
                        $('#cClienteDestino').val(ui.item.label);
                        $('#IdClienteDestino').val(ui.item.num);
                        $('#cClienteDestinoruc').text(ui.item.num);
                    } else {
                        $('#cClienteDestino').val("");
                        $('#IdClienteDestino').val("");
                        $('#cClienteDestinoruc').text("");
                    }
                } else {
                    $('#cClienteDestino').val("");
                    $('#IdClienteDestino').val("");
                    $('#cClienteDestinoruc').text("");
                }
            },
            minLength: 2
        });
        // CLIENTE //

        // CLIENTE //
        $("#cTransportista").autocomplete({
            source: function (request, response) {
                var obj = new Object();
                obj.vcIdCliente = $("#cTransportista").val();
                $.ajax({
                    url: "../SerComex.asmx/ArrayClienteNis",
                    data: JSON.stringify({ obj: obj }),
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    // dataFilter: function (data) { return data; },
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('|')[2],
                                val: item.split('|')[1],
                                num: item.split('|')[0]
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
                    if (ui.item.num != 0) {
                        $('#cTransportista').val(ui.item.label);
                        $('#cTransportistaruc').text(ui.item.num);
                        $('#IdTransportista').val(ui.item.num);
                        Load_Datos2('CHF', '001', ui.item.num, 'cChofer', 'descripcion', 'dni', 'DNB', 'DNB');
                    } else {
                        $('#cTransportista').val("");
                        $('#cTransportistaruc').text("");
                        $('#IdTransportista').val("");
                    }
                } else {
                    $('#cTransportistaruc').text("");
                    $('#cTransportista').val("");
                    $('#IdTransportista').val("");
                }
            },
            minLength: 2
        });
        // CLIENTE //

        // CLIENTE //
        $("#vcdescripcion").autocomplete({
            source: function (request, response) {
                var obj = new Object();
                obj.vcId = $("#vcdescripcion").val();
                $.ajax({
                    url: "../SerComex.asmx/ArrayProductoNis",
                    data: JSON.stringify({ obj: obj }),
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    // dataFilter: function (data) { return data; },
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('-')[2],
                                val: item.split('-')[1],
                                num: item.split('-')[0]
                            }
                        }))
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(JSON.stringify(XMLHttpRequest));
                    }
                });
            },
            select: function (event, ui) {
                if (ui.item) {
                    if (ui.item.num != 0) {
                        $('#vcidproducto').val(ui.item.num);
                        $('#vcdescripcion').val(ui.item.label);
                        $('#vcidmedida').val(ui.item.val);
                    } else {
                        $('#vcidproducto').val("");
                        $('#vcdescripcion').val("");
                        $('#vcidmedida').val("");
                    }
                } else {
                    $('#vcidproducto').val("");
                    $('#vcdescripcion').val("");
                    $('#vcidmedida').val("");
                }
            },
            minLength: 2
        });

        listcc();
        var treeView, dataGrid;

        var syncTreeViewSelection = function (treeView, value) {
            if (!value) {
                treeView.unselectAll();
                return;
            }

            value.forEach(function (key) {
                treeView.selectItem(key);
            });
        };

        var makeAsyncDataSource = function (jsonFile, id) {
            return new DevExpress.data.CustomStore({
                loadMode: "raw",
                key: id,
                load: function () {
                    return jsonFile;
                }
            });

        };

        function listcc() {

            var obj = new Object();
            obj.vcType = 'CCO';
            obj.vcEmpresa = '001';
            obj.vcSucursal = 'ACA';
            $.ajax({
                type: 'POST',
                url: "../SerAdmi.asmx/DateNisira_list",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    var searchBox = $("#sel-cc").dxSelectBox({
                        dataSource: lst,
                        displayExpr: 'DESCRIPCIONCOSTO',
                        valueExpr: 'IDCCOSTO',
                        searchEnabled: true,
                        placeholder: "Seleccione",
                        noDataText: "Sin Datos",
                        onValueChanged: function (data) {

                        },
                    }).dxSelectBox("instance");

                },
                error: function (error) {
                    alert(JSON.stringify(error));
                }
            });
        }

        // CLIENTE //
        //$("#selectBox").dxSelectBox({});

        //$("#selectBox").dxSelectBox({});

        $(document).on('click', '#addProductos', function (e) {
            e.preventDefault();

            const count = $('#tblProductos tbody tr').each(function () {
                // Do something
            }).length;

            var vcitem = count + 1;
            var vcidproducto = $('#vcidproducto').val();
            var vcdescripcion = $('#vcdescripcion').val();
            var vcidmedida = $('#vcidmedida').val();

            if ($("#sel-cc").dxSelectBox('instance').option('value') != null) {
                vcidconsumidor = $("#sel-cc").dxSelectBox('instance').option('value');
            } else {
                vcidconsumidor = ''
            }
            var vccantidad = $('#vccantidad').val();
            var vcobservacion = $('#vcobservacion').val();
            var vcpeso = $('#vcpeso').val();

            if (vccantidad == '' || vccantidad == null) {
                vccantidad = '0';
            }
            //vcprecio = '0';
            //vcimporte = '0';
            if (vcpeso == '' || vcpeso == null) {
                vcpeso = '0';
            }

            if (vcidproducto != 0 && vcidconsumidor != 0 && vcprecio != '') {
                // var cajas = parseInt(cajas);


                var vrow = "<tr>";
                vrow += "<td class='vcitem'>" + vcitem + "</td>";
                vrow += "<td class='vcidproducto'>" + vcidproducto + "</td>";
                vrow += "<td class='vcdescripcion'>" + vcdescripcion + "</td>";
                vrow += "<td class='vcidmedida'>" + vcidmedida + "</td>";
                vrow += "<td class='vcidconsumidor'>" + vcidconsumidor + "</td>";
                vrow += "<td class='vccantidad'>" + vcpeso + "</td>";
                //vrow += "<td class='vcprecio' style='display: none'>" + vcprecio + "</td>";
                //vrow += "<td class='vcimporte' style='display: none'>" + vcimporte + "</td>";
                vrow += "<td class='vcpeso'>" + vcpeso + "</td>";
                vrow += "<td class='vcobservacion'>" + vcobservacion + "</td>";
                vrow += "<td class=''><button class='EditProductos btn btn-link yellow m-0 p-0'><i class='fas fa-edit'></i></button></td>";
                vrow += "<td class=''><button class='DeleteProductos btn btn-link red m-0 p-0'><i class='fas fa-remove'></i></button></td>";
                vrow += "</tr>"

                $("#tblProductos tbody").append(vrow);

                var vccants = 0;
                var vcpesos = 0;
                $("#tblProductos tbody tr").each(function (index) {
                    vccantidad = quita_comas($(this).find('.vccantidad').text());
                    vccants = vccants + parseInt(vccantidad);

                    vcPeso = quita_comas($(this).find('.vcpeso').text());
                    vcpesos = vcpesos + parseInt(vcPeso);
                });

                $("#cNroBultos").val(formatNumber.new(vccants.toFixed(2)));
                $("#cPeso").val(formatNumber.new(vcpesos.toFixed(2)));
                toastr.success('', 'Articulo ' + vcdescripcion + ' Añadido con peso ' + vcpeso + ' ' + vcidmedida);
                clearModProductos();
            } else {
                toastr.error('', 'Complete todos los campos')
            }
        });

        $(document).on('click', '#EditProductos', function (e) {
            e.preventDefault();

            var vcidproducto = $('#vcidproducto').val();
            var vcdescripcion = $('#vcdescripcion').val();
            var vcidmedida = $('#vcidmedida').val();

            if ($("#sel-cc").dxSelectBox('instance').option('value') != null) {
                vcidconsumidor = $("#sel-cc").dxSelectBox('instance').option('value');
            } else {
                vcidconsumidor = ''
            }
            var vccantidad = $('#vccantidad').val();

            var vcpeso = $('#vcpeso').val();
            var vcobservacion = $('#vcobservacion').val();

            if (vccantidad == '' || vccantidad == null) {
                vccantidad = '0';
            }
            //vcprecio = '0';
            //vcimporte = '0';
            if (vcpeso == '' || vcpeso == null) {
                vcpeso = '0';
            }

            if (vcidproducto != 0 && vccantidad != 0 && vcprecio != '') {

                $('#tblProductos tbody tr').eq($('#hfRowIndex').val()).find('td').eq(1).html(vcidproducto);
                $('#tblProductos tbody tr').eq($('#hfRowIndex').val()).find('td').eq(2).html(vcdescripcion);
                $('#tblProductos tbody tr').eq($('#hfRowIndex').val()).find('td').eq(3).html(vcidmedida);
                $('#tblProductos tbody tr').eq($('#hfRowIndex').val()).find('td').eq(4).html(vcidconsumidor);
                $('#tblProductos tbody tr').eq($('#hfRowIndex').val()).find('td').eq(5).html(vcpeso);
                $('#tblProductos tbody tr').eq($('#hfRowIndex').val()).find('td').eq(6).html(vcpeso);
                $('#tblProductos tbody tr').eq($('#hfRowIndex').val()).find('td').eq(7).html(vcobservacion);

                $('#addProductos').show();
                $('#EditProductos').hide();
                $('#ModProductos').modal('hide');
                $('#hfRowIndex').val('');
                clearModProductos();

                var vccants = 0;
                var vcpesos = 0;
                $("#tblProductos tbody tr").each(function (index) {
                    vccantidad = quita_comas($(this).find('.vccantidad').text());
                    vccants = vccants + parseInt(vccantidad);

                    vcPeso = quita_comas($(this).find('.vcpeso').text());
                    vcpesos = vcpesos + parseInt(vcPeso);
                });

                $("#cNroBultos").val(formatNumber.new(vccants.toFixed(2)));
                $("#cPeso").val(formatNumber.new(vcpesos.toFixed(2)));

                toastr.success('', 'Articulo ' + vcdescripcion + ' Actualizado con peso ' + vcpeso + ' ' + vcidmedida)
            }
        });

        $("#tblProductos").on("click", ".EditProductos", function (e) {
            e.preventDefault();

            var row = $(this).closest('tr');
            $('#hfRowIndex').val($(row).index());
            var td = $(row).find("td");


            $('#vcidproducto').val($(td).eq(1).html());
            $('#vcdescripcion').val($(td).eq(2).html());
            $('#vcidmedida').val($(td).eq(3).html());
            $("#sel-cc").dxSelectBox('instance').option('value', $(td).eq(4).html());
            $('#vccantidad').val($(td).eq(6).html());
            $('#vcpeso').val($(td).eq(6).html());
            $('#vcobservacion').val($(td).eq(7).html());

            $('#ModProductos').modal('show');
            $('#addProductos').hide();
            $('#EditProductos').show();
        });


        function clearModProductos() {
            $('#vcidproducto').val('');
            $('#vcdescripcion').val('');
            $('#vcidmedida').val('');
            $('#vccantidad').val('0.0');
            $('#vcprecio').val('0.0');
            $('#vcimporte').val('0.0');
            $('#vcpeso').val('0.0');
            $('#vcobservacion').val('');
            $("#sel-cc").dxSelectBox("reset");
        }

        $("#tblProductos").on("click", ".DeleteProductos", function (e) {
            e.preventDefault();

            $(this).closest("tr").remove();
            var kgtotal = 0;
            var kgAprox = 0;
            var total = 0;
            $("#tblProductos tbody tr").each(function (index) {
                vnCajas = parseFloat($(this).find('.Cajas').text(), 10);
                vnKilos = parseFloat($(this).find('.Kilos').text(), 10);

                kgtotal = (vnCajas * vnKilos) + kgtotal;
                kgAprox = kgtotal + 1.09;
                total = vnCajas + total;
            });

            if (kgtotal == 0) {

                $("#kgtotal").html('');
            } else {
                $("#kgtotal").html(formatNumber.new(kgtotal.toFixed(2)));
            }
        });

        function quita_comas(numero) {
            var cadenas = numero.split(",");
            cadena_sin_comas = "";
            for (i = 0; i < cadenas.length; i++) {
                cadena_sin_comas = cadena_sin_comas + cadenas[i];
            }
            return cadena_sin_comas;
        }

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

        function zfill(number, width) {
            var numberOutput = Math.abs(number); /* Valor absoluto del número */
            var length = number.toString().length; /* Largo del número */
            var zero = "0"; /* String de cero */

            if (width <= length) {
                if (number < 0) {
                    return ("-" + numberOutput.toString());
                } else {
                    return numberOutput.toString();
                }
            } else {
                if (number < 0) {
                    return ("-" + (zero.repeat(width - length)) + numberOutput.toString());
                } else {
                    return ((zero.repeat(width - length)) + numberOutput.toString());
                }
            }
        }

        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
