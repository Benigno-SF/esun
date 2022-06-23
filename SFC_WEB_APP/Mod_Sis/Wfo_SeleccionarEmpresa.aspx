<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_SeleccionarEmpresa.aspx.cs" Inherits="SFC_WEB_APP.Mod_Sis.Wfo_SeleccionarEmpresa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
    <section class="content-header">
      <h4>
        <i class="far fa-building"></i> Cambiar de cliente
      </h4>
        <br/>
    </section>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
    <div class="col col-md-6" style="padding-left: 0px">
        <div class="form-group">
            <label for="txtCliente">Cliente seleccionado actualmente: </label>
            <input type="text" class="form-control" value="SUN FRUIT" id="txtClienteActual" runat="server" readonly="readonly" />
        </div>
        <div class="form-group">
            <label for="cboEmpresa">Cambiar a:</label>
            <asp:DropDownList id="ddlProveedor" name="ddlProveedor" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <button type="submit" runat="server" id="btnCambiar" class="btn btn-primary" onserverclick="btnCambiar_ServerClick"><i class="fa fa-check"></i> Aceptar</button>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
