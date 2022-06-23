<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_Incidencias.aspx.cs" Inherits="SFC_WEB_APP.Mod_Segu.Wfo_Incidencias" %>
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
            // 1 border-spacing: 0;
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
                                    <a class="btn btn-lg btn-success" id="Incidencia
                                        " data-toggle="modal" data-target="#ModIncidencia">
                                        <i class="fa fa-book"></i> Incidencia
                                    </a>
                                </div>
                                <div class="col-md-3 pt-4">
                                    <a class="btn btn-lg btn-success" id="salida" data-toggle="modal" data-target="#ModRepoVigilantes">
                                        <i class="fa fa-user-secret"></i> Reporte Vigilantes
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
                                    <span>INCIDENCIAS</span>
                                    <table id="tblIncidencias" class="table table-striped table-bordered dt-responsive nowrap tr-nopm">
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
                                    <span>REP VIGILANTES</span>
                                    <table id="tblVigilantes" class="table table-striped table-bordered dt-responsive nowrap tr-nopm">
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

      <!-- ////////////////////// GUIAS ////////////////////////////////// -->
    <div class="modal fade" id="ModIncidencia" data-backdrop="true" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-xs" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Incidencia</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">N° Guia:</label>
                        <input type="text" id="Guia" class="form-control round num" placeholder="N° Guia">
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Tipo:</label>
                        <asp:DropDownList ID="ddlFundo" runat="server" CssClass="form-control" ></asp:DropDownList>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Tipo:</label>
                        <asp:DropDownList ID="ddlTipoIncidencia" runat="server" CssClass="form-control" ></asp:DropDownList>
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Jabas:</label>
                        <input type="text" id="Jabas" class="form-control round num" placeholder="Jabas">
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="nidIncidencia" value="0">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" id="SaveGuia" class="btn btn-primary">Agregar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- ////////////////////// GUIAS ////////////////////////////////// -->
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
