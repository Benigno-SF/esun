<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_PresIndirecto.aspx.cs" Inherits="SFC_WEB_APP.Mod_Pres.Wfo_PresIndirecto" %>

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
    <div class="row">
        <div class="form-group col-12 col-sm-6 col-md-6 col-lg-3">
            <label class="control-label" for="ddlIdPresup">Presupuesto</label>
            <asp:DropDownList ID="ddlPresup" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-12 col-sm-6 col-md-6 col-lg-2">
            <label class="control-label" for="ddlCultivo">Formato</label>
            <asp:DropDownList ID="ddlFormato" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnBusc" runat="server" class="btn btn-secondary col-12" onserverclick="btnBusc_ServerClick" >
                <i class="fa fa-search"></i> Buscar
            </button>
        </div>
    </div>
    <asp:UpdatePanel ID="UpdGv" runat="server">
        <ContentTemplate>
            <div id="dvGv" class="row center-block">
                <div class="table-responsive">
                    <asp:GridView ID="GvList" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-condensed bgtbl"
                        EmptyDataText="No se encontraron datos" ShowHeaderWhenEmpty="True" DataKeyNames="nIdPresupuesto, nIdFormato">
                        <Columns>
                            <asp:BoundField DataField="nIdPresupuesto" Visible="false" />
                            <asp:BoundField DataField="nIdFormato" Visible="false" />
                            <asp:BoundField DataField="cDenominacion" HeaderText="Presupuesto" />
                            <asp:BoundField DataField="cDescFormato" HeaderText="Formato" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <button type="button" id="btnGvEdit" class="mybtn btn btn-link"
                                        runat="server" onserverclick="btnGvEdit_ServerClick" title="Editar" >
                                        <span class="fa fa-edit"></span>
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
