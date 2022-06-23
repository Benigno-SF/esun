<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_TicketComedor.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_TicketComedor" %>


<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .text-success {
            font-size: 18px;
            color: green;
            color: #5c901a;
            font-weight: 700;
            text-align: center;
        }

        .text-danger {
            font-size: 18px;
            color: red;
            color: #5c901a;
            font-weight: 700;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12" id="Provisiones" style="padding: 0px; margin: 0px">
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-3" id="DivFeIni">
            <label for="txtFeIni">Fecha final</label>
            <input type="text" id="txtFeIni" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
            <script type="text/javascript">
                $(function () {
                    $('#<%=txtFeIni.ClientID %>').datetimepicker({
                        format: 'DD/MM/YYYY HH:mm',
                    });
                    $(function () {
                        $('#DivFeIni').datetimepicker({
                            format: 'DD/MM/YYYY HH:mm',
                        });
                    });
                });
            </script>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-3" id="DivFeFin">
            <label for="txtFeFin">Fecha final</label>
            <input type="text" id="txtFeFin" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
            <script type="text/javascript">
                $(function () {
                    $('#<%=txtFeFin.ClientID %>').datetimepicker({
                        format: 'DD/MM/YYYY HH:mm',
                        locale: 'es'
                    });
                    $(function () {
                        $('#DivFeFin').datetimepicker({
                            format: 'DD/MM/YYYY HH:mm',
                            locale: 'es'
                        });
                    });
                });
            </script>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnBusc" runat="server" class="btn btn-secondary col-12"
                onserverclick="btnBusc_ServerClick">
                <i class="fa fa-search"></i>Recuperar
            </button>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnAdd">&nbsp;</label>
            <button type="button" id="btnAdd" class="btn btn-warning col-12" data-toggle="modal" data-target="#modalAdd">
                <i class="fa fa-plus"></i>Excepciones
            </button>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnAdd">&nbsp;</label>
            <button type="button" id="btnSend" class="btn btn-success col-12" data-toggle="modal" data-target="#modalSend">
                <i class="fa fa-send"></i>Enviar Tickets
            </button>
        </div>
    </div>
    <br />
    <asp:UpdatePanel ID="UpdGv" runat="server">
        <ContentTemplate>
            <div id="DvList" class="row center-block">
                <div class="table-responsive" style="height: 100vh;">
                    <asp:GridView ID="GvList" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-condensed bgtbl"
                        EmptyDataText="No se encontraron datos" ShowHeaderWhenEmpty="True" DataKeyNames="cIdCodigoGeneral">
                        <Columns>
                            <asp:BoundField DataField="cIdCodigoGeneral" HeaderText="DNI" />
                            <asp:BoundField DataField="cCodigoControl" HeaderText="Tarjeta" />
                            <asp:BoundField DataField="cNombres" HeaderText="Nombres" />
                            <asp:BoundField DataField="Checktime" HeaderText="Ingreso" />
                            <asp:BoundField DataField="cGrupoTrabajo" HeaderText="Grupo" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <button type="button" id="btnGvDelete" class="mybtn btn btn-link"
                                        runat="server" onserverclick="btnGvDelete_ServerClick">
                                        <span class="fa fa-trash"></span>
                                    </button>
                                    <asp:HiddenField ID="hdfcIdcodigogeneral" runat="server" Value='<%#Eval("cIdCodigoGeneral") %>' />
                                    <asp:HiddenField ID="hdfcCodigo_control" runat="server" Value='<%#Eval("cCodigoControl") %>' />
                                    <asp:HiddenField ID="hdfcNombres" runat="server" Value='<%#Eval("cNombres") %>' />
                                    <asp:HiddenField ID="hdfChecktime" runat="server" Value='<%#Eval("Checktime") %>' />
                                    <asp:HiddenField ID="hdfcGrupo" runat="server" Value='<%#Eval("cGrupoTrabajo") %>' />

                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnBusc" />
            <asp:AsyncPostBackTrigger ControlID="btnaddExecep" />
        </Triggers>
    </asp:UpdatePanel>




    <div class="modal fade" id="modalAdd" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Agregar Excepciones</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="input-group mb-3">
                        <input type="text" id="CodeUser" name="CodeUser" class="form-control has-icon-left" placeholder="Ingrese su número de  Dni" required="required" onkeypress="validar(event)" />
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" id="btnSearch" type="button">Buscar</button>
                        </div>
                    </div>
                    <div id="labels" class="form-group">
                    </div>
                    <asp:HiddenField ID="hdfCodigo" runat="server" />
                    <asp:HiddenField ID="hdfTarjeta" runat="server" />
                    <asp:HiddenField ID="hdfcNombres" runat="server" />
                    <asp:HiddenField ID="hdfcGrupo" runat="server" />
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="idEvento" value="">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" runat="server" onserverclick="btnaddExecep_ServerClick" id="btnaddExecep" class="btn btn-success" style="display: none">Agregar trabajador</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalSend" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Enviar Tickets</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Tipo Evento:</label>
                        <asp:DropDownList ID="ddlTipoEvento" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group" id="DivFeSend">
                        <label for="txtFeFin">Fecha </label>
                        <input type="text" id="FechaEnvio" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
                        <script type="text/javascript">
                            $(function () {
                                $('#<%=FechaEnvio.ClientID %>').datetimepicker({
                                    format: 'DD/MM/YYYY HH:mm',
                                    locale: 'es'
                                });
                                $(function () {
                                    $('#DivFeSend').datetimepicker({
                                        format: 'DD/MM/YYYY HH:mm',
                                        locale: 'es'
                                    });
                                });
                            });
                        </script>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" runat="server" onserverclick="SendMarcas_ServerClick" id="SendMarcas" class="btn btn-primary">Enviar</button>
                </div>
            </div>
        </div>
    </div>


    <script>

        $('#<%=btnaddExecep.ClientID%>').click(function () {
            $('#labels').html('<p class="text-success">Trabajador Agregado</p>');
            $('#<%=btnaddExecep.ClientID%>').hide();
          $("#CodeUser").val('');
      });


        $("#btnAdd").click(function () {
            $("#CodeUser").val('');
            $('#labels').html('');
            $('#<%=btnaddExecep.ClientID%>').hide();
            $("#CodeUser").autofocus;
        });

        $("#btnSend").click(function () {
            $('#<%=SendMarcas.ClientID%>').attr('disabled', 'disabled');
        });

        $('#<%=ddlTipoEvento.ClientID%>').change(function () {
            var tipo = $('#<%=ddlTipoEvento.ClientID%>').val();
            if (tipo != 0) {
                $('#<%=SendMarcas.ClientID%>').removeAttr('disabled');
                $('#<%=FechaEnvio.ClientID %>').datetimepicker({
                    format: 'DD/MM/YYYY HH:mm',
                    locale: 'es'
                });
                $('#DivFeSend').datetimepicker({
                    format: 'DD/MM/YYYY HH:mm',
                    locale: 'es'
                });
            } else {
                $('#<%=SendMarcas.ClientID%>').attr('disabled', 'disabled');
            }
        });

        $("#btnSearch").click(function () {
            var obj = new Object();
            obj.vcNroDocumento = $("#CodeUser").val();
            if (obj.vcNroDocumento != "") {
                $.ajax({
                    type: 'POST',
                    url: "../SerRRHH.asmx/SearchUser",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        if (lst != "") {
                            var dni = lst[0].cNroDocumento;
                            var tarjeta = lst[0].cCodigoControl;
                            var name = lst[0].cNombres;
                            var grupo = lst[0].cGrupoTrabajo;

                            $('#<%=hdfCodigo.ClientID%>').val(dni);
                            $('#<%=hdfTarjeta.ClientID%>').val(tarjeta);
                            $('#<%=hdfcNombres.ClientID%>').val(name);
                            $('#<%=hdfcGrupo.ClientID%>').val(grupo);

                            var labels = '<p>Dni: <b>' + dni + '</b></p>';
                            labels += '<p>Tarjeta: <b>' + tarjeta + '</b></p>';
                            labels += '<p>Nombre: <b>' + name + '</b></p>';
                            labels += '<p>Grupo: <b>' + grupo + '</b></p>';

                            $('#labels').html(labels);
                            $('#<%=btnaddExecep.ClientID%>').show();
                            $("#CodeUser").val('');
                        } else {
                            $('#labels').html('<p class="text-danger">Trabajador no Existe</p>');
                            $('#<%=btnaddExecep.ClientID%>').hide();
                            $("#CodeUser").val('');
                        }

                    },
                    error: function (error) {
                        alert(JSON.stringify(error));

                        $('#labels').html('<p class="text-danger">Error</p>');
                        $('#<%=btnaddExecep.ClientID%>').hide();
                    }
                });
            } else {
                $('#labels').html('<p class="text-danger">Ingrese un Numero de Dni</p>');
                $('#<%=btnaddExecep.ClientID%>').hide();
              toastr.warning("Ingrese un Numero de DNI");
          }
      });


        function crg() {
            var obj = new Object();
            $.ajax({
                type: 'POST',
                url: "../SerRRHH.asmx/CountProv",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    var prov = 'Ticket Generados Hoy: ';

                    if (lst[0] != null && lst[0].nIdTipoEvento == 1) {
                        prov += '<b>almuerzos:' + lst[0].cantidad + '</b>';
                    } else {
                        prov += '<b>almuerzos: 0</b>'
                    }

                    if (lst[1] != null && lst[1].nIdTipoEvento == 2) {
                        prov += ';  <b>cenas:' + lst[1].cantidad + '</b>';
                    } else {
                        prov += ';  <b>cenas: 0</b>';
                    }

                    $('#Provisiones').html('<p style="text-align: right; padding: 0px; margin: 0px">' + prov + '</p>');
                },
                error: function (error) {
                    alert(JSON.stringify(error));
                }
            });
        }

        crg();

        function validar(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 13) {
                $("#btnSearch").click();
            }
        }

    </script>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
