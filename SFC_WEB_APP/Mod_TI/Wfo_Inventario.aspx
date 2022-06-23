<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_Inventario.aspx.cs" Inherits="SFC_WEB_APP.Mod_TI.Wfo_Inventario" %>

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

    <link rel="stylesheet" href="../scripts/croppie/croppie.min.css" />
    <script src="../scripts/croppie/croppie.min.js"></script>
    <script src="../scripts/croppie/bootstrap.min.js"></script>
    <style>
        .dx-freespace-row {
            height: 0px !important;
        }

        #DataGrid {
            height: 60vh;
            width: 100%;
        }

        .long-title h3 {
            font-family: 'Segoe UI Light', 'Helvetica Neue Light', 'Segoe UI', 'Helvetica Neue', 'Trebuchet MS', Verdana;
            font-weight: 200;
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
        }

        @media print {
            body, .printjsa, .dx-scrollable-content {
                display: block !important;
                position: relative !important;
                width: auto !important;
                height: auto !important;
                overflow: visible !important;
                margin-left: 0 !important;
                display: block !important; /* Not really needed in all cases */
                position: relative !important;
                width: auto !important;
                height: auto !important;
                overflow: visible !important;
            }
        }

        #gridContainer {
            height: 50vh;
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

        #DataGrid {
            font-size: 12px;
        }


        .img-tbr {
            width: 40%;
            -webkit-filter: drop-shadow(0.1px 0.1px 3px #fff);
            filter: drop-shadow(0.1px 0.1px 3px #fff);
        }

        @media only screen and (max-width: 600px) {
            .img-tbr {
                width: 60%;
            }
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
    <div class="">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body">
                            <h4 class="card-title info">Inventario</h4>
                            <div class="form-group col-md-12">
                                <div class="row p-0 m-0 text-center">
                                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-3"><a class="btn btn-info" id="Asignar" >Asignar <i class="fa fa-user"></i><i class="fa fa-plus"></i></a></div>
                                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-3"><a class="btn btn-success" id="Equipo" >Equipo <i class="fa fa-desktop"></i></a></div>
                                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-3"><a class="btn btn-warning" id="Ubicacion" data-toggle="modal" data-target="#ModUbicacion">Ubicacion <i class="fa fa-map-marker"></i></a></div>
                                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-3"><a class="btn btn-danger" id="Area" data-toggle="modal" data-target="#ModArea">Area <i class="fa fa-building"></i></a></div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card" style="display: none" id="DispositivoNew">
                    <div class="card-header">
                        <h5 class="modal-title" id="add-tittle">DISPOSITIVO NUEVO</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="card-body" style="align-content: center">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">Tipo Dispositivo:</label>
                                    <asp:DropDownList ID="ddlTipoDevice" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">Hostname:</label>
                                    <input type="text" id="cHostname" name="cHostname" autocomplete="off" class="form-control round" placeholder="Hostname">
                                </div>
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">Codigo:</label>
                                    <input type="text" id="cCodigo" name="cCodigo" autocomplete="off" class="form-control round" placeholder="Codigo">
                                </div>
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">N° Serie:</label>
                                    <input type="text" id="cSerie" name="cSerie" autocomplete="off" class="form-control round" placeholder="N° Serie">
                                </div>
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">Marca:</label>
                                    <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">Modelo:</label>
                                    <input type="text" id="cModelo" name="cModelo" autocomplete="off" class="form-control round" placeholder="Modelo">
                                </div>
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">Propiedad:</label>
                                    <asp:DropDownList ID="ddlPropiedad" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <hr />
                            </div>
                            <div class="col-md-2" id="DetailEquipo" style="display: none">
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">Sistema Operativo:</label>
                                    <asp:DropDownList ID="ddlSO" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">Memoria RAM:</label>
                                    <input type="text" id="nRam" name="nRam" autocomplete="off" class="form-control round" value="0" placeholder="Memoria RAM">
                                </div>
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">Procesador:</label>
                                    <asp:DropDownList ID="ddlProcesador" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">M. Office:</label>
                                    <asp:DropDownList ID="ddlOffice" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">Antivirus:</label>
                                    <asp:DropDownList ID="ddlAntivirus" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <hr />
                            </div>
                            <div class="col-md-2" id="DetailEquipo2" style="display: none">
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">Dir Ip:</label>
                                    <input type="text" id="cIp" name="cIp" autocomplete="off" class="form-control round" placeholder="Direccion Ip">
                                </div>
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">Mac:</label>
                                    <input type="text" id="cMac" name="cMac" autocomplete="off" class="form-control round" placeholder="Mac">
                                </div>
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">Teamviwer:</label>
                                    <input type="text" id="cTeamviwer" name="cTeamviwer" autocomplete="off" class="form-control round" placeholder="Teamviwer">
                                </div>
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">Anydesk:</label>
                                    <input type="text" id="cAnydesk" name="cAnydesk" autocomplete="off" class="form-control round" placeholder="Anydesk">
                                </div>
                                <hr />
                            </div>
                            <div class="col-md-2" id="DetailMobEquipo" style="display: none">
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">Numero celular:</label>
                                    <input type="text" id="cNumero" name="cNumero" autocomplete="off" class="form-control round" placeholder="Numero">
                                </div>
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">IMEI:</label>
                                    <input type="text" id="cIMEI" name="IMEI" autocomplete="off" class="form-control round" placeholder="IEMI">
                                </div>
                                <div class="form-group mb-2">
                                    <label for="message-text" class="col-form-label pb-0">Se Entrego Audifonos?:</label>
                                    <input type="checkbox" id="bAudifonos" name="bAudifonos" value="1" />
                                </div>
                                <div class="form-group mb-2">
                                    <label for="message-text" class="col-form-label pb-0">Se Entrego Cargador?:</label>
                                    <input type="checkbox" id="bCargador" name="bCargador" value="1" />
                                </div>
                                <div class="form-group mb-2">
                                    <label for="message-text" class="col-form-label pb-0">Se Entrego Carcasa?:</label>
                                    <input type="checkbox" id="bCarcasa" name="bCarcasa" value="1" />
                                </div>
                                <hr />
                            </div>
                            <div class="col-md-3" id="Asignacion" style="display: none">
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">Ubicacion:</label>
                                    <asp:DropDownList ID="ddlUbicacion" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">Area:</label>
                                    <asp:DropDownList ID="ddlArea" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">Asignado A:</label>
                                    <asp:DropDownList ID="ddlAsignado" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group mb-1">
                                    <label for="message-text" class="col-form-label pb-0">Responsable:</label>
                                    <asp:DropDownList ID="ddlResponsable" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group mb-1" id="DivFechaAsig">
                                    <label for="txtFecha" class="col-form-label pb-0">Fecha Asignacion</label>
                                    <input type="text" id="txtFechaAsig" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
                                    <script type="text/javascript">
                                        $(function () {
                                            $('#txtFechaAsig').datetimepicker({
                                                format: 'DD/MM/YYYY',
                                                locale: 'es'
                                            });
                                            $(function () {
                                                $('#DivFechaAsig').datetimepicker({
                                                    format: 'DD/MM/YYYY',
                                                    locale: 'es'
                                                });
                                            });
                                        });
                                    </script>
                                </div>
                                <div class="form-group mb-1" id="DivHoraAsig">
                                    <label for="recipient-name" class="col-form-label pb-0">Hora Asignacion:</label>
                                    <input type="text" id="txtHoraAsig" autocomplete="off" class="form-control" placeholder="HH:mm:ss">
                                    <script type="text/javascript">
                                        $(function () {
                                            $('#txtHoraAsig').datetimepicker({
                                                format: 'HH:mm:ss',
                                                locale: 'es'
                                            });
                                            $(function () {
                                                $('#DivHoraAsig').datetimepicker({
                                                    format: 'HH:mm:ss',
                                                    locale: 'es'
                                                });
                                            });
                                        });
                                    </script>
                                </div>
                                <div class="row" id="icv">
                                    <div class="form-group col-md-12 mb-0">
                                        <label for="message-text" class="label-input">Subir Formato de Entrega</label>
                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input form-control main-search" id="ar" name="ar" accept=".doc, .docx, .ppt, .pptx, .pdf" />
                                            <input type="hidden" id="fileb64" />
                                            <input type="hidden" id="fileext" />
                                            <label class="custom-file-label" id="customlabel" for="customFile" style="text-align: left">Seleccionar Archivo</label>
                                            <div class="invalid-tooltip">Suba su curriculum por favor</div>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                            </div>
                            <div class="col-md-3" id="">
                                <div class="row">
                                    <div class="form-group col-md-12 mb-0">
                                        <label for="mes age-text" class="label-input">Agrega Foto de Etiqueta y Numero</label><br />
                                        <span class="label-input col-md-12 custom-file" id="input-f" />
                                        <input type="file" id="fpxx" name="fpxx" class="custom-file-input form-control" accept="image/*" />
                                        <label class="custom-file-label" for="customFile" style="text-align: left">Seleccionar Imagen</label>
                                        <div class="invalid-tooltip">Adjunte Foto</div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-12 text-center">
                                        <div id="charged"></div>
                                        <button class="btn btn-sm btn-danger" style="display: none; position: absolute; top: 20%; left: 65%; right: 0;" id="delete-img">X</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-12 mb-0">
                                        <label for="mes age-text" class="label-input">Agrega Foto del Equipo</label><br />
                                        <span class="label-input col-md-12 custom-file custom-file2" id="input-f2" />
                                        <input type="file" id="fp2" name="fp2" class="custom-file-input form-control" accept="image/*" />
                                        <label class="custom-file-label" for="customFile" style="text-align: left">Seleccionar Imagen</label>
                                        <div class="invalid-tooltip">Adjunte Foto</div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-12 text-center">
                                        <div id="charged2"></div>
                                        <button class="btn btn-sm btn-danger" style="display: none; position: absolute; top: 20%; left: 65%; right: 0;" id="delete-img2">X</button>
                                    </div>
                                </div>
                                <hr />
                            </div>
                            <br />
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group mb-4">
                                            <label for="message-text" class="col-form-label pb-0">&nbsp;</label><br />
                                            Asignar A personal?:
                                            <input type="checkbox" id="checkAsignacion" name="checkAsignacion" value="1" />
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group mb-1">
                                            <label for="message-text" class="col-form-label">Observacion Ingreso:</label>
                                            <textarea id="cObservacion" class="form-control round"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group mb-1">
                                            <label for="message-text" class="col-form-label">&nbsp</label><br />
                                            <input type="hidden" id="nIdDevice" value="0">
                                            <button class="btn btn-secondary closeform" id="CancelAddDevice">Cancelar</button>
                                            <a id="AddDevice" class="btn btn-primary">Agregar</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <section id="cell-background" style="height: 70vh;">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Reporte Inventario</h4>
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



    <!-- ////////////////////// INVERTARIO////////////////////////////////// -->
    <%--    <div class="modal fade" id="ModEquipo" data-backdrop="true" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm" id="modallg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">DISPOSITIVO NUEVO</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="align-content: center">
                    <div class="row">
                        <div class="col-md">
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Tipo Dispositivo:</label>
                                <asp:DropDownList ID="ddlTipoDevice" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Hostname:</label>
                                <input type="text" id="cHostname" name="cHostname" autocomplete="off" class="form-control round" placeholder="Hostname">
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Codigo:</label>
                                <input type="text" id="cCodigo" name="cCodigo" autocomplete="off" class="form-control round" placeholder="Codigo">
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">N° Serie:</label>
                                <input type="text" id="cSerie" name="cSerie" autocomplete="off" class="form-control round" placeholder="N° Serie">
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Marca:</label>
                                <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Modelo:</label>
                                <input type="text" id="cModelo" name="cModelo" autocomplete="off" class="form-control round" placeholder="Modelo">
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Propiedad:</label>
                                <asp:DropDownList ID="ddlPropiedad" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md" id="DetailEquipo" style="display: none">
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Sistema Operativo:</label>
                                <asp:DropDownList ID="ddlSO" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Memoria RAM:</label>
                                <input type="text" id="nRam" name="nRam" autocomplete="off" class="form-control round" value="0" placeholder="Memoria RAM">
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Procesador:</label>
                                <asp:DropDownList ID="ddlProcesador" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">M. Office:</label>
                                <asp:DropDownList ID="ddlOffice" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Antivirus:</label>
                                <asp:DropDownList ID="ddlAntivirus" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md" id="DetailEquipo2" style="display: none">
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Dir Ip:</label>
                                <input type="text" id="cIp" name="cIp" autocomplete="off" class="form-control round" placeholder="Direccion Ip">
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Mac:</label>
                                <input type="text" id="cMac" name="cMac" autocomplete="off" class="form-control round" placeholder="Mac">
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Teamviwer:</label>
                                <input type="text" id="cTeamviwer" name="cTeamviwer" autocomplete="off" class="form-control round" placeholder="Teamviwer">
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Anydesk:</label>
                                <input type="text" id="cAnydesk" name="cAnydesk" autocomplete="off" class="form-control round" placeholder="Anydesk">
                            </div>
                        </div>
                        <div class="col-md" id="DetailMobEquipo" style="display: none">
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Numero celular:</label>
                                <input type="text" id="cNumero" name="cNumero" autocomplete="off" class="form-control round" placeholder="Numero">
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">IMEI:</label>
                                <input type="text" id="cIMEI" name="IMEI" autocomplete="off" class="form-control round" placeholder="IEMI">
                            </div>
                            <div class="form-group mb-2">
                                <label for="message-text" class="col-form-label pb-0">Se Entrego Audifonos?:</label>
                                <input type="checkbox" id="bAudifonos" name="bAudifonos" value="1" />
                            </div>
                            <div class="form-group mb-2">
                                <label for="message-text" class="col-form-label pb-0">Se Entrego Cargador?:</label>
                                <input type="checkbox" id="bCargador" name="bCargador" value="1" />
                            </div>
                            <div class="form-group mb-2">
                                <label for="message-text" class="col-form-label pb-0">Se Entrego Carcasa?:</label>
                                <input type="checkbox" id="bCarcasa" name="bCarcasa" value="1" />
                            </div>
                        </div>
                       
                        <div class="col-md" id="Asignacion" style="display: none">
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Ubicacion:</label>
                                <asp:DropDownList ID="ddlUbicacion" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Area:</label>
                                <asp:DropDownList ID="ddlArea" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Asignado A:</label>
                                <asp:DropDownList ID="ddlAsignado" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label pb-0">Responsable:</label>
                                <asp:DropDownList ID="ddlResponsable" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group mb-1" id="DivFechaAsig">
                                <label for="txtFecha" class="col-form-label pb-0">Fecha Asignacion</label>
                                <input type="text" id="txtFechaAsig" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
                                <script type="text/javascript">
                                    $(function () {
                                        $('#txtFechaAsig').datetimepicker({
                                            format: 'DD/MM/YYYY',
                                            locale: 'es'
                                        });
                                        $(function () {
                                            $('#DivFechaAsig').datetimepicker({
                                                format: 'DD/MM/YYYY',
                                                locale: 'es'
                                            });
                                        });
                                    });
                                </script>
                            </div>
                            <div class="form-group mb-1" id="DivHoraAsig">
                                <label for="recipient-name" class="col-form-label pb-0">Hora Asignacion:</label>
                                <input type="text" id="txtHoraAsig" autocomplete="off" class="form-control" placeholder="HH:mm:ss">
                                <script type="text/javascript">
                                    $(function () {
                                        $('#txtHoraAsig').datetimepicker({
                                            format: 'HH:mm:ss',
                                            locale: 'es'
                                        });
                                        $(function () {
                                            $('#DivHoraAsig').datetimepicker({
                                                format: 'HH:mm:ss',
                                                locale: 'es'
                                            });
                                        });
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group mb-2">
                        <label for="message-text" class="col-form-label pb-0">Asignar A personal?:</label>
                        <input type="checkbox" id="checkAsignacion" name="checkAsignacion" value="1" />
                    </div>
                    <div class="row">
                        <div class="col-md">
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label">Observacion Ingreso:</label>
                                <textarea id="cObservacion" class="form-control round"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="nIdDevice" value="0">
                    <button class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <a id="AddDevice" class="btn btn-primary">Agregar</a>
                </div>
            </div>
        </div>
    </div>--%>
    <!-- ////////////////////// ENTRADA ////////////////////////////////// -->
    <div id="uploadimageModal" class="modal" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Subir Imagen</h4>
                </div>
                <div class="modal-body" style="padding: 0px">
                    <div class="text-center">
                        <div id="image_demo" style="height: auto"></div>
                    </div>
                    <button style="margin-left: 20px" class="btn rotate float-lef" data-deg="90">
                        <i class="fa fa-undo"></i>
                    </button>
                    <button style="margin-right: 20px" class="btn rotate float-right" data-deg="-90">
                        <i class="fa fa-repeat"></i>
                    </button>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-success crop_image">Aceptar</button>
                    <button type="button" class="btn btn-default cancel_crop_image" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
    <div id="uploadimageModal2" class="modal" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Subir Imagen</h4>
                </div>
                <div class="modal-body" style="padding: 0px">
                    <div class="text-center">
                        <div id="image_demo2" style="height: auto"></div>
                    </div>
                    <button style="margin-left: 20px" class="btn rotate float-lef" data-deg="90">
                        <i class="fa fa-undo"></i>
                    </button>
                    <button style="margin-right: 20px" class="btn rotate float-right" data-deg="-90">
                        <i class="fa fa-repeat"></i>
                    </button>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-success crop_image2">Aceptar</button>
                    <button type="button" class="btn btn-default cancel_crop_image2" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        // <pages enableEventValidation="true" />

        var fp = '';
        $(document).ready(function () {
            $image_crop = $('#image_demo').croppie({
                enableExif: true,
                viewport: {
                    width: 270,
                    height: 320,
                    type: 'square' //circle
                },
                boundary: {
                    width: 280,
                    height: 330
                },
                enableOrientation: true
            });
            $(".rotate").on("click", function (event) {
                event.preventDefault();
                $image_crop.croppie('rotate', parseInt($(this).data('deg')));
            });
            $('#fpxx').on('change', function (event) {
                event.preventDefault();
                var reader = new FileReader();
                reader.onload = function (event) {
                    $image_crop.croppie('bind', {
                        url: event.target.result
                    }).then(function () {
                        //console.log('jQuery bind complete');
                    });
                };
                reader.readAsDataURL(this.files[0]);
                $('#uploadimageModal').modal('show');
            });
            $('.crop_image').click(function (event) {
                event.preventDefault();
                $image_crop.croppie('result', {
                    type: 'canvas',
                    size: 'viewport'
                }).then(function (response) {
                    fp = response;
                    htmlx = '<img id="fot" class="img-tbr" src="' + response + '">';
                    $("#charged").html(htmlx);
                    $('#imagev').html("");
                    $('#uploadimageModal').modal('hide');
                    $('#upload_img').hide();
                    $('#delete-img').show();
                    $('#input-f').hide();
                });
            });
            $('.cancel_crop_image').click(function (event) {
                event.preventDefault();
                $('#delete-img').hide();
                $('#input-f').show();
                $("#charged").html('');
                $('#delete-img').hide();
                $("#fpxx").val('');
                $('#input-f').show();
                $('.custom-file-label').text('Seleccionar Imagen');
            });
        });

        var fp2 = '';
        $(document).ready(function () {
            $image_crop2 = $('#image_demo2').croppie({
                enableExif: true,
                viewport: {
                    width: 270,
                    height: 320,
                    type: 'square' //circle
                },
                boundary: {
                    width: 280,
                    height: 330
                },
                enableOrientation: true
            });
            $(".rotate").on("click", function (event) {
                event.preventDefault();
                $image_crop2.croppie('rotate', parseInt($(this).data('deg')));
            });
            $('#fp2').on('change', function (event) {
                event.preventDefault();
                var reader = new FileReader();
                reader.onload = function (event) {
                    $image_crop2.croppie('bind', {
                        url: event.target.result
                    }).then(function () {
                        //console.log('jQuery bind complete');
                    });
                };
                reader.readAsDataURL(this.files[0]);
                $('#uploadimageModal2').modal('show');
            });
            $('.crop_image2').click(function (event) {
                event.preventDefault();
                $image_crop2.croppie('result', {
                    type: 'canvas',
                    size: 'viewport'
                }).then(function (response) {
                    fp2 = response;
                    htmlx = '<img id="fot2" class="img-tbr" src="' + response + '">';
                    $("#charged2").html(htmlx);
                    $('#imagev2').html("");
                    $('#uploadimageModal2').modal('hide');
                    $('#upload_img2').hide();
                    $('#delete-img2').show();
                    $('#input-f2').hide();
                });
            });
            $('.cancel_crop_image2').click(function (event) {
                event.preventDefault();
                $('#delete-img2').hide();
                $('#input-f2').show();
                $("#charged2").html('');
                $('#delete-img2').hide();
                $("#fp2").val('');
                $('#input-f2').show();
                $('.custom-file-label2').text('Seleccionar Imagen');
            });
        });

        $("#ar").on("change", function (event) {
            event.preventDefault();
            var fileName = $(this).val().split("\\").pop();
            fileNamecort = fileName.substr(0, 15) + '_.' + fileName.split('.').pop();
            $(this).siblings("#customlabel").addClass("selected").html(fileNamecort);

            //var file = document.querySelector('input[type=file]').files[0];
            //var file = $("#ar").files[0];
            var file = document.querySelector('input[name=ar]').files[0];
            if (['pdf', 'pptx', 'ppt', 'docx', 'doc'].contains(fileName.split('.').pop())) {
                var reader = new FileReader();
                reader.readAsDataURL(file);
                reader.onload = function () {
                    if (reader.result.split(',')[1] != undefined) {
                        $('#fileb64').val(reader.result.split(',')[1]);
                        $('#fileext').val(fileName.split('.').pop());
                    } else {
                        toastr.warning('Verifique el archivo y/o seleccione otro', 'ERROR CON ARCHIVO');
                        $("#customlabel").text('Seleccione Documento');
                    }
                }
            } else {
                toastr.error('La extension no esta permitido por favor seleccione otro archivo', 'Archivo No permitido');
                $("#customlabel").text('Seleccione Documento');
            }

        });

        Array.prototype.contains = function (obj) {
            return this.indexOf(obj) > -1;
        };

        $('#delete-img').click(function (event) {
            event.preventDefault();
            $("#charged").html('');
            $('#delete-img').hide();
            $("#fpxx").val('');
            $('#input-f').show();
            $('.custom-file-label').text('Seleccionar Imagen');
        });

        $('#delete-img2').click(function (event) {
            event.preventDefault();
            $("#charged2").html('');
            $('#delete-img2').hide();
            $("#fp2").val('');
            $('#input-f2').show();
            $('.custom-file-label2').text('Seleccionar Imagen');
        });

        $(".custom-file-input").on("change", function () {
            var fileName = $(this).val().split("\\").pop();
            fileNamecort = fileName.substr(0, 25) + '_.' + fileName.split('.').pop();
            $(this).siblings(".custom-file-label").addClass("selected").html(fileNamecort);
        });

        $(".custom-file-input2").on("change", function () {
            var fileName = $(this).val().split("\\").pop();
            fileNamecort = fileName.substr(0, 25) + '_.' + fileName.split('.').pop();
            $(this).siblings(".custom-file-label2").addClass("selected").html(fileNamecort);
        });
    </script>


    <script>
        cargatabla(0, 0, 1)

        function cargatabla(id, idusuario, tipo) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdDevice = id;
            obj.vnidUsuario = idusuario;
            //  var f = new Date();
            //alert(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
            if (obj.vcIdEmpresa != '' && obj.vnIdArea != 0) {
                if (tipo == 1) {
                    $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                }
                $.ajax({
                    type: 'POST',
                    url: "../SerTI.asmx/List_Device",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    error: function () {
                        $('#activos').hide();
                    },
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (tipo == 1) {
                            $('#container-x').html('<div class="options"><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="DataGrid"></div>');
                            TbDataGrid(lst);
                        } else if (tipo == 2) {
                            cargarform(lst);
                        }
                    },
                    error: function (data) {
                        alert(JSON.stringify(data));
                    },
                    timeout: 50000
                });
            } else {
                toastr.error('error', 'SELECCIONE AREA', '')
            }
        }

        function TbDataGrid(data) {
            DevExpress.localization.locale('es');

            var dataGrid = $("#DataGrid").dxDataGrid({
                dataSource: data,
                scrolling: {
                    mode: "virtual"
                },
                grouping: {
                    autoExpandAll: false
                },
                groupPanel: {
                    visible: true,
                },
                allowColumnReordering: true,
                allowColumnResizing: true,
                columnMinWidth: 30,
                columnAutoWidth: true,
                showBorders: true,
                columnChooser: {
                    enabled: true
                },
                columnFixing: {
                    enabled: true
                },
                //wordWrapEnabled: true,
                showBorders: true,
                export: {
                    enabled: true,
                    fileName: "Reporte Rendimiento"
                },

                //filterRow: {
                //    visible: true,
                //    applyFilter: "auto"
                //},
                //filterRow: { visible: true },
                //filterPanel: { visible: true },
                //headerFilter: { visible: true },
                //filterValue: [["dia1", "<>", "0"]],
                //filterBuilderPopup: {
                //    position: { of: window, at: "top", my: "top", offset: { y: 10 } },
                //},
                //searchPanel: {
                //    visible: false,
                //    placeholder: "Search..."
                //},
                //headerFilter: {
                //    visible: false
                //},
                //  groupIndex: 0,
                columns: [
                    { caption: "Id", dataField: "nIdDevice", width: 30, visible: true }
                    , { caption: "Ubicacion", dataField: "cDescripcionUbi" }
                    , { caption: "Area", dataField: "cDescripcionAR" }
                    , { caption: "Nombres", dataField: "cNombres" }
                    , { caption: "Hostname", dataField: "cHostname" }
                    , { caption: "Codigo", dataField: "cCodigo" }
                    , { caption: "Serie", dataField: "cSerie" }
                    , { caption: "Marca", dataField: "cDescripcionMarca" }
                    , { caption: "Modelo", dataField: "cModelo" }
                    , { caption: "Propiedad", dataField: "Propiedad" }
                    , { caption: "S.O.", dataField: "cDescripcionSO" }
                    , { caption: "Ram", dataField: "nRam" }
                    , { caption: "Procesador", dataField: "cDescripcionProc" }
                    , { caption: "Office", dataField: "cDescripcionOff" }
                    , { caption: "Antivirus", dataField: "cDescripcionAnt" }
                    , { caption: "Ip", dataField: "cIp" }
                    , { caption: "Mac", dataField: "cMac" }
                    , { caption: "Teamviwer", dataField: "cTeamviwer" }
                    , { caption: "Anydesk", dataField: "cAnydesk" }
                    , { caption: "Observacion", dataField: "cObservacion" }
                    , { caption: "FechaAsignacion", dataField: "dFechaAsignacion", dataType: "date", format: 'dd/MM/yyyy HH:mm:ss' }
                    , {
                        type: "buttons",
                        buttons: [
                            {
                                icon: "edit",
                                hint: "Editar",
                                onClick: function (e) {
                                    $('#add-tittle').val();
                                    cargatabla(e.row.data.nIdDevice, 0, 2)
                                    e.event.preventDefault();
                                },
                                visible: function (e) {
                                    if (e.row.data.Hostname != '') {
                                        return true;
                                    } else {
                                        return false
                                    }
                                }
                            }
                        ]
                    }
                ],
                sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }]
            }).dxDataGrid("instance");

            $("#autoExpand").dxCheckBox({
                value: false,
                text: "Expandir",
                onValueChanged: function (data) {
                    dataGrid.option("grouping.autoExpandAll", data.value);
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

        }


        $('#checkAsignacion').on('change', function () {
            var checked = this.checked
            if (checked == true) {
                $('#Asignacion').show();

                $("#modallg").removeClass("modal-sm");
                $("#modallg").removeClass("modal-md");
                $("#modallg").addClass("modal-lg");
            } else {
                $('#Asignacion').hide();
                $("#modallg").removeClass("modal-sm");
                $("#modallg").removeClass("modal-lg");
                $("#modallg").addClass("modal-md");
            }
        });

        Load_TipoDevice(0);
        Load_Marca(0);
        Load_Ubicacion(0);
        Load_Office(0);
        Load_Procesador(0);
        Load_SO(0);
        Load_Area(0);
        Load_Antivirus(0);
        Load_Personal(0);
        Load_Propiedad();

        function ShowToast(tipo, titulo, mensaje) {
            toastr.options = {
                tapToDismiss: false
                , timeOut: 5000
                , extendedTimeOut: 0
                , allowHtml: true
                , preventDuplicates: false
                , preventOpenDuplicates: false
                , newestOnTop: true
                , closeButton: true
                //, closeHtml: '<button class="btn-sm" style="background-color: grey; padding: 5px;">X</button>'
            }
            toastr[tipo](mensaje, titulo);
        }

        
        $('body').on('click', '#Equipo', function () {
            $('#DispositivoNew').show();
        });



        $('body').on('change', '#<%=ddlTipoDevice.ClientID%>', function () {
            var id = $(this).val();
            var detail = $(this).find('option:selected').attr('detail');
            if (detail == 1) {
                $('#DetailEquipo').show();
                $('#DetailEquipo2').show();
                $('#DetailMobEquipo').hide();

                $("#modallg").removeClass("modal-sm");
                $("#modallg").removeClass("modal-md");
                $("#modallg").addClass("modal-lg");

                //$('#Asignacion').addClass("row");

            } else if (detail == 2) {
                $('#DetailEquipo').show();
                $('#DetailEquipo2').show();
                $('#DetailMobEquipo').show();

                $("#modallg").removeClass("modal-sm");
                $("#modallg").removeClass("modal-lg");
                $("#modallg").addClass("modal-lg");
            } else {
                $('#DetailEquipo').hide();
                $('#DetailEquipo2').hide();
                $('#DetailMobEquipo').hide();
                $("#modallg").removeClass("modal-lg");
                $("#modallg").addClass("modal-sm");
                $("#modallg").addClass("modal-lg");

                //$('#Asignacion').removeClass("row");
            }
        });

        $(document).on('click', '#CancelAddDevice', function (e) {
            e.preventDefault();

            limpiarForm()
        });

        $(document).on('click', '#Asignar', function (e) {
            e.preventDefault();
            
            limpiarForm()
        });

        $(document).on('click', '#AddDevice', function (e) {
            e.preventDefault();
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdDevice = $('#nIdDevice').val();
            obj.vnIdTipoDevice = $('#<%=ddlTipoDevice.ClientID%>').val();
            obj.vcHostname = $('#cHostname').val();
            alert(obj.vcHostname);
            obj.vcCodigo = $('#cCodigo').val();
            obj.vcSerie = $('#cSerie').val();
            obj.vnIdMarca = $('#<%=ddlMarca.ClientID%>').val();
            obj.vcModelo = $('#cModelo').val();
            obj.vnPropiedad = $('#<%=ddlPropiedad.ClientID%>').val();
            obj.vcObsDev = $('#cObservacion').val();

            if ($('#<%=ddlTipoDevice.ClientID%>').find('option:selected').attr('detail') == 1) {
                obj.vnDet = '1';
            } else {
                obj.vnDet = '0';
            }
            obj.vnIdSO = $('#<%=ddlSO.ClientID%>').val();
            obj.vnRam = $('#nRam').val();
            obj.vnIdProcesador = $('#<%=ddlProcesador.ClientID%>').val();
            obj.vnIdOffice = $('#<%=ddlOffice.ClientID%>').val();
            obj.vnIdAntivirus = $('#<%=ddlAntivirus.ClientID%>').val();
            obj.vcIp = $('#cIp').val();
            obj.vcMac = $('#cMac').val();
            obj.vcTeamviwer = $('#cTeamviwer').val();
            obj.vcAnydesk = $('#cAnydesk').val();

            if ($('#<%=ddlTipoDevice.ClientID%>').find('option:selected').attr('detail') == 2) {
                obj.vnDetMob = '1';
            } else {
                obj.vnDetMob = '0';
            }
            obj.vcIMEI = $('#cIMEI').val();
            obj.vcNumero = $('#cNumero').val();
            if ($('#bAudifonos').prop('checked')) {
                obj.vbAudifonos = '1';
            } else {
                obj.vbAudifonos = '0';
            }
            if ($('#bCargador ').prop('checked')) {
                obj.vbCargador = '1';
            } else {
                obj.vbCargador = '0';
            }
            if ($('#bCarcasa').prop('checked')) {
                obj.vbCarcasa = '1';
            } else {
                obj.vbCarcasa = '0';
            }

            if ($('#checkAsignacion').prop('checked')) {
                obj.vnAsig = '1';
            } else {
                obj.vnAsig = '0';
            }
            obj.vnIdUsuario = $('#<%=ddlAsignado.ClientID%>').val();
            obj.vnIdResponsable = $('#<%=ddlResponsable.ClientID%>').val();
            obj.vnIdUbicacion = $('#<%=ddlUbicacion.ClientID%>').val();
            obj.vnidArea = $('#<%=ddlArea.ClientID%>').val();

            if ($('#txtFechaAsig').val() != '') {
                obj.vcFechaAsignacion = $('#txtFechaAsig').val() + ' ' + $('#txtHoraAsig').val();
            } else {
                obj.vcFechaAsignacion = '';
            }

            obj.vcObservacion = $('#cObservacion').val();

            obj.vcImg = fp;
            obj.vcImg2 = fp2;
            obj.vcFile = $('#fileb64').val();
            obj.vExt = $("#fileext").val();
            alert(JSON.stringify(obj));
            if (obj.vcIdEmpresa != "" &&
                obj.vnIdTipoDevice != "0" &&
                obj.vcHostname != "" &&
                obj.vnPropiedad != "0"
            ) {
                $.ajax({
                    type: 'POST',
                    url: "../SerTI.asmx/Regi_Device",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        toastr.success(JSON.stringify(lst), 'Orden Registrado');
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

        function cargarform(data) {

            if (data[0].nDetail == 1) {
                $('#DetailEquipo').show();
                $('#DetailEquipo2').show();
                $('#DetailMobEquipo').hide();

                $("#modallg").removeClass("modal-sm");
                $("#modallg").removeClass("modal-md");
                $("#modallg").addClass("modal-lg");

                //$('#Asignacion').addClass("row");

            } else if (data[0].nDetail == 2) {
                $('#DetailEquipo').show();
                $('#DetailEquipo2').show();
                $('#DetailMobEquipo').show();

                $("#modallg").removeClass("modal-sm");
                $("#modallg").removeClass("modal-lg");
                $("#modallg").addClass("modal-lg");
            } else {
                $('#DetailEquipo').hide();
                $('#DetailEquipo2').hide();
                $('#DetailMobEquipo').hide();
                $("#modallg").removeClass("modal-lg");
                $("#modallg").addClass("modal-sm");
                $("#modallg").addClass("modal-lg");

                //$('#Asignacion').removeClass("row");
            }
            $('#nIdDevice').val(data[0].nIdDevice);
            $('#<%=ddlTipoDevice.ClientID%>').val(data[0].nIdTipoDevice);
            $('#cHostname').val(data[0].cHostname);
            $('#cCodigo').val(data[0].cCodigo);
            $('#cSerie').val(data[0].cSerie);
            $('#<%=ddlMarca.ClientID%>').val(data[0].nIdMarca);
            $('#cModelo').val(data[0].cModelo);
            $('#<%=ddlPropiedad.ClientID%>').val(data[0].nPropiedad);
            $('#cObservacion').val(data[0].cObservacion);

            $('#<%=ddlTipoDevice.ClientID%>').val(data[0].nIdTipoDevice).change();
            $('#<%=ddlSO.ClientID%>').val(data[0].nIdSO);
            $('#nRam').val(data[0].nRam);
            $('#<%=ddlProcesador.ClientID%>').val(data[0].nIdProcesador);
            $('#<%=ddlOffice.ClientID%>').val(data[0].nIdOffice);
            $('#<%=ddlAntivirus.ClientID%>').val(data[0].nIdAntivirus);
            $('#cIp').val(data[0].cIp);
            $('#cMac').val(data[0].cMac);
            $('#cTeamviwer').val(data[0].cTeamviwer);
            $('#cAnydesk').val(data[0].cAnydesk);

            $('#cIMEI').val(data[0].cIMEI);
            $('#cNumero').val(data[0].cNumero);
            if (data[0].bAudifonos == true) {
                $("#bAudifonos").prop('checked', 'true');
            } else {
                $("#bAudifonos").prop('checked', '');
            }
            if (data[0].bCargador == true) {
                $("#bCargador").prop('checked', 'true');
            } else {
                $("#bCargador").prop('checked', '');
            }
            if (data[0].bCarcasa == true) {
                $("#bCarcasa").prop('checked', 'true');
            } else {
                $("#bCarcasa").prop('checked', '');
            }

            //if ($('#checkAsignacion').prop('checked')) {
            //    obj.vnAsig = '1';
            //} else {
            //    obj.vnAsig = '0';
            //}
            if (data[0].nAsignacion == true) {
                $("#checkAsignacion").prop('checked', 'true');
                $('#Asignacion').show();
            } else {
                $("#checkAsignacion").prop('checked', '');
                $('#Asignacion').hide();
            }
            $('#<%=ddlAsignado.ClientID%>').val(data[0].nIdUsuario);
            $('#<%=ddlResponsable.ClientID%>').val(data[0].nIdResponsable);
            $('#<%=ddlUbicacion.ClientID%>').val(data[0].nIdUbicacion);
            $('#<%=ddlArea.ClientID%>').val(data[0].nIdArea);

            //if ($('#txtFechaAsig').val() != '') {
            //    obj.vcFechaAsignacion = $('#txtFechaAsig').val() + ' ' + $('#txtHoraAsig').val();
            //} else {
            //    obj.vcFechaAsignacion = '';
            //}	
            $('#txtFechaAsig').val(data[0].FechaAsig);
            $('#txtHoraAsig').val(data[0].HoraAsig);
            $('#cObservacion').val(data[0].cObservacion);



            //$('#ModEquipo').modal('show');
            $('#DispositivoNew').show();

        }
        ;

        function limpiarForm() {


            $('#nIdDevice').val(0);
            $('#<%=ddlTipoDevice.ClientID%>').val('');
            $('#cHostname').val('');
            $('#cCodigo').val('');
            $('#cSerie').val('');
            $('#<%=ddlMarca.ClientID%>').val('');
            $('#cModelo').val('');
            $('#<%=ddlPropiedad.ClientID%>').val('');
            $('#cObservacion').val('');

            $('#<%=ddlTipoDevice.ClientID%>').val('').change();
            $('#<%=ddlSO.ClientID%>').val('');
            $('#nRam').val(0);
            $('#<%=ddlProcesador.ClientID%>').val('');
            $('#<%=ddlOffice.ClientID%>').val('');
            $('#<%=ddlAntivirus.ClientID%>').val('');
            $('#cIp').val('');
            $('#cMac').val('');
            $('#cTeamviwer').val('');
            $('#cAnydesk').val('');

            $('#cIMEI').val('');
            $('#cNumero').val('');

            $("#bAudifonos").prop('checked', '');

            $("#bCargador").prop('checked', '');

            $("#bCarcasa").prop('checked', '');

            //if ($('#checkAsignacion').prop('checked')) {
            //    obj.vnAsig = '1';
            //} else {
            //    obj.vnAsig = '0';
            //}

            $("#checkAsignacion").prop('checked', '');
            $('#Asignacion').hide();
            $('#<%=ddlAsignado.ClientID%>').val('');
            $('#<%=ddlResponsable.ClientID%>').val('');
            $('#<%=ddlUbicacion.ClientID%>').val('');
            $('#<%=ddlArea.ClientID%>').val('');

            //if ($('#txtFechaAsig').val() != '') {
            //    obj.vcFechaAsignacion = $('#txtFechaAsig').val() + ' ' + $('#txtHoraAsig').val();
            //} else {
            //    obj.vcFechaAsignacion = '';
            //}	
            $('#txtFechaAsig').val('');
            $('#txtHoraAsig').val('');
            $('#cObservacion').val('');



            //$('#ModEquipo').modal('show');
            $('#DispositivoNew').hide();

        };


        function Load_TipoDevice(id) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdTipoDevice = id;
            $.ajax({
                type: 'POST',
                url: "../SerTI.asmx/List_TipoDevice",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    $('#<%=ddlTipoDevice.ClientID%>').html('');


                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0" selected>Seleccione</option>';
                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdTipoDevice + '" detail="' + lst[i].nDetail + '">' + lst[i].cDescripcion + '</option>';
                        }
                        $('#<%=ddlTipoDevice.ClientID%>').append(option);
                    } else {
                        $('#<%=ddlTipoDevice.ClientID%>').html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        function Load_Marca(id) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdMarca = id;
            $.ajax({
                type: 'POST',
                url: "../SerTI.asmx/List_Marca",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    $('#<%=ddlMarca.ClientID%>').html('');


                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0" selected>Seleccione</option>';
                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdMarca + '">' + lst[i].cDescripcion + '</option>';
                        }
                        $('#<%=ddlMarca.ClientID%>').append(option);
                    } else {
                        $('#<%=ddlMarca.ClientID%>').html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        function Load_Ubicacion(id) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdUbicacion = id;
            $.ajax({
                type: 'POST',
                url: "../SerTI.asmx/List_Ubicacion",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    $('#<%=ddlUbicacion.ClientID%>').html('');


                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0" selected>Seleccione</option>';
                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdUbicacion + '">' + lst[i].cDescripcion + '</option>';
                        }
                        $('#<%=ddlUbicacion.ClientID%>').append(option);
                    } else {
                        $('#<%=ddlUbicacion.ClientID%>').html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        function Load_Office(id) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdOffice = id;
            $.ajax({
                type: 'POST',
                url: "../SerTI.asmx/List_Office",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    $('#<%=ddlOffice.ClientID%>').html('');

                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0" selected>Seleccione</option>';
                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdOffice + '">' + lst[i].cDescripcion + '</option>';
                        }
                        $('#<%=ddlOffice.ClientID%>').append(option);
                    } else {
                        $('#<%=ddlOffice.ClientID%>').html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        function Load_Procesador(id) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdProcesador = id;
            $.ajax({
                type: 'POST',
                url: "../SerTI.asmx/List_Procesador",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    $('#<%=ddlProcesador.ClientID%>').html('');

                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0" selected="selected">Seleccione</option>';
                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdProcesador + '">' + lst[i].cDescripcion + '</option>';
                        }
                        $('#<%=ddlProcesador.ClientID%>').append(option);
                    } else {
                        $('#<%=ddlProcesador.ClientID%>').html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        function Load_SO(id) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdSO = id;
            $.ajax({
                type: 'POST',
                url: "../SerTI.asmx/List_SO",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    $('#<%=ddlSO.ClientID%>').html('');

                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0" selected="selected">Seleccione</option>';
                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdSO + '">' + lst[i].cDescripcion + '</option>';
                        }
                        $('#<%=ddlSO.ClientID%>').append(option);
                    } else {
                        $('#<%=ddlSO.ClientID%>').html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        function Load_Area(id) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdArea = id;
            $.ajax({
                type: 'POST',
                url: "../SerTI.asmx/List_Area",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    $('#<%=ddlArea.ClientID%>').html('');

                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0" selected="selected">Seleccione</option>';
                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdArea + '">' + lst[i].cDescripcion + '</option>';
                        }
                        $('#<%=ddlArea.ClientID%>').append(option);
                    } else {
                        $('#<%=ddlArea.ClientID%>').html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        function Load_Antivirus(id) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdAntivirus = id;
            $.ajax({
                type: 'POST',
                url: "../SerTI.asmx/List_Antivirus",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    $('#<%=ddlAntivirus.ClientID%>').html('');

                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0" selected="selected">Seleccione</option>';
                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdAntivirus + '">' + lst[i].cDescripcion + '</option>';
                        }
                        $('#<%=ddlAntivirus.ClientID%>').append(option);
                    } else {
                        $('#<%=ddlAntivirus.ClientID%>').html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        function Load_Personal(id) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdPersonal = id;
            obj.vcNroDocumento = '';
            obj.vcNombres = '';
            obj.vcIdPlanilla = '';
            obj.vcCodigoLabor = '';
            $.ajax({
                type: 'POST',
                url: "../SerRRHH.asmx/SearchUser",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    $('#<%=ddlAsignado.ClientID%>').html('');
                    $('#<%=ddlResponsable.ClientID%>').html('');
                    if (lst.length != '0') {
                        var option = "";
                        var option2 = "";
                        option += '<option value="0" selected="selected">Seleccione</option>';
                        option2 += '<option value="0" selected="selected">Seleccione</option>';
                        //option2 += option;
                        for (i = 0; i < lst.length; ++i) {
                            if (lst[i].cGrupoTrabajo == 'SISTEMAS - TI') {
                                option2 += '<option value="' + lst[i].nIdPersonal + '">' + lst[i].cNombres + '</option>';
                            }
                            option += '<option value="' + lst[i].nIdPersonal + '">' + lst[i].cNombres + '</option>';
                        }
                        $('#<%=ddlAsignado.ClientID%>').append(option);
                        $('#<%=ddlResponsable.ClientID%>').append(option2);
                    } else {
                        $('#<%=ddlAsignado.ClientID%>').html('');
                        $('#<%=ddlResponsable.ClientID%>').html('');
                    }
                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        function Load_Propiedad() {

            $('#<%=ddlAsignado.ClientID%>').html('');
            var option = "";
            option += '<option value="0" selected>Seleccione</option>';
            option += '<option value="1">PROPIA</option>';
            option += '<option value="2">ALQUILADA</option>';
            option += '<option value="3">DEMO</option>';
            option += '<option value="4">PRESTADA</option>';
            $('#<%=ddlPropiedad.ClientID%>').append(option);
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
