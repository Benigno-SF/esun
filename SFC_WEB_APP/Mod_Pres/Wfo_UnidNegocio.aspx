<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_UnidNegocio.aspx.cs" Inherits="SFC_WEB_APP.Mod_Pres.Wfo_UnidNegocio" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
    <li class="nav-item">
        <button type="button" id="btnAgregar" runat="server" class="btn btn-primary col-12" onserverclick="btnAgregar_ServerClick">
            <i class="fa fa-plus"></i> Nuevo
        </button>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdHead">
        <ContentTemplate>
            <div class="row">
                <div class="form-group col-12 col-sm-6 col-md-6 col-lg-3">
                    <label class="control-label" for="ddlIdPresup">Presupuesto</label>
                    <asp:DropDownList ID="ddlPresup" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group col-12 col-sm-6 col-md-6 col-lg-3">
                    <label class="control-label" for="ddlFundo">Fundo</label>
                    <asp:DropDownList ID="ddlFundo" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlFundo_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="form-group col-12 col-sm-6 col-md-6 col-lg-2">
                    <label class="control-label" for="ddlCultivo">Cultivo</label>
                    <asp:DropDownList ID="ddlCultivo" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCultivo_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="form-group col-12 col-sm-6 col-md-6 col-lg-2">
                    <label class="control-label" for="ddlCultivo">Formato</label>
                    <asp:DropDownList ID="ddlFormato" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
                    <label for="btnBusc">&nbsp;</label>
                    <button type="button" id="btnBusc" runat="server" class="btn btn-secondary col-12" onserverclick="btnBusc_ServerClick">
                        <i class="fa fa-search"></i> Buscar
                    </button>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <asp:UpdatePanel ID="UpdGv" runat="server">
        <ContentTemplate>
            <div id="dvGv" class="row center-block">
                <div class="table-responsive">
                    <asp:GridView ID="GvList" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-condensed bgtbl"
                        EmptyDataText="No se encontraron datos" ShowHeaderWhenEmpty="True" DataKeyNames="nIdPresupuesto, nIdUnidadNeg, nIdFormato">
                        <Columns>
                            <asp:BoundField DataField="nIdPresupuesto" Visible="false" />
                            <asp:BoundField DataField="nIdUnidadNeg" Visible="false" />
                            <asp:BoundField DataField="cDenominacion" HeaderText="Presupuesto" Visible="false" />
                            <asp:BoundField DataField="cFundo" HeaderText="Fundo" />
                            <asp:BoundField DataField="cDescUnidadNeg" HeaderText="Lote" />
                            <asp:BoundField DataField="cDescFormato" HeaderText="Formato" />
                            <asp:BoundField DataField="nHa" HeaderText="Ha" ItemStyle-HorizontalAlign="Right" />
                            <asp:BoundField DataField="nImportexHa" HeaderText="Total U$S" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:###,###,###,##0.00}" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <button type="button" id="btnGvEdit" class="mybtn btn btn-link"
                                        runat="server" onserverclick="btnGvEdit_ServerClick" title="Editar" >
                                        <span class="fa fa-edit"></span>
                                    </button>
                                    <button type="button" id="btnRepo" class="mybtn btn btn-link"
                                        runat="server" onserverclick="btnRepo_ServerClick" title="Reporte">
                                        <span class="fa fa-sticky-note"></span>
                                    </button>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnBusc" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
