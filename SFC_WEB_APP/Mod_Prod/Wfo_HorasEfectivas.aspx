<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_HorasEfectivas.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Wfo_HorasEfectivas" MaintainScrollPositionOnPostback="true" %>

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
        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12" id="Provisiones">
        </div>

        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-3">
            <label for="txtFeCont">Fecha</label>
            <input type="text" id="Text1" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
            <script type="text/javascript">
                $(function () {
                  <%--  $('#<%=txtFeCont.ClientID %>').datetimepicker({
                        format: 'DD/MM/YYYY',
                        locale: 'es'
                    });--%>
                    $(function () {
                        $('#DivFeCont').datetimepicker({
                            format: 'DD/MM/YYYY',
                            locale: 'es'
                        });
                    });
                });
            </script>
        </div>

        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
<%--            <button type="button" id="btnBusc" runat="server" class="btn btn-secondary col-12" onserverclick="btnBusc_ServerClick">
                <i class="fa fa-search"></i>Buscar
            </button>--%>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="AddHE" class="btn btn-secondary col-12" data-toggle="modal" data-target="#AddHoraEfectiva">
                <i class="fa fa-plus"></i>Agregar Horas efectivas
            </button>
        </div>
    </div>
    <br />
    <asp:UpdatePanel ID="UpdGv" runat="server">
        <ContentTemplate>
            <div id="DvList" class="row center-block">
                <div class="table-responsive">
<%--                    <asp:GridView ID="Gvlist" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-condensed bgtbl"
                        EmptyDataText="No se encontraron datos" ShowHeaderWhenEmpty="True" DataKeyNames="nIdPersonal,cNroDocumento" OnRowDataBound="GvList_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="nid" HeaderText="Id" Visible="false" />
                            <asp:BoundField DataField="cNroDocumento" HeaderText="DNI" />
                            <asp:BoundField DataField="cCodigoControl" HeaderText="Tarjeta" />
                            <asp:BoundField DataField="cNombres" HeaderText="Nombres" />
                            <asp:BoundField DataField="bEstado" HeaderText="Estado" />
                            <asp:TemplateField HeaderText="Labor">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlLabor" AutoPostBack="true" runat="server" CssClass="custom-select myform-control" OnSelectedIndexChanged="myListDropDown_Change">
                                    </asp:DropDownList>
                                    <asp:HiddenField ID="hdfcNroDocumento" runat="server" Value='<%#Eval("cNroDocumento") %>' />
                                    <asp:HiddenField ID="hdfcCodigoLabor" runat="server" Value='<%#Eval("cCodigoLabor") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>--%>
                </div>
            </div>
        </ContentTemplate>
<%--        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnBusc" />
        </Triggers>--%>
    </asp:UpdatePanel>

    <div class="modal fade" id="AddHoraEfectiva" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Nuevo Colaborador</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivFeIni">
                        <label for="txtFeCont">Fecha</label>
                        <input type="text" id="txtFeIni" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
                        <script type="text/javascript">
                            $(function () {
                                $('#<%=txtFeIni.ClientID %>').datetimepicker({
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
                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivFeFin">
                        <label for="txtFeCont">Fecha</label>
                        <input type="text" id="txtFeFin" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
                        <script type="text/javascript">
                            $(function () {
                                $('#<%=txtFeFin.ClientID %>').datetimepicker({
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
                <div class="modal-footer">
                    <input type="hidden" id="IdEventoProg" value="0">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" id="btnAdd" class="btn btn-primary">Agregar</button>
                </div>
            </div>
        </div>
    </div>

    </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>