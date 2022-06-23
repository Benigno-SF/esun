<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ClienteProd.aspx.cs" Inherits="SFC_WEB_APP.Mod_Sis.Wfo_ClienteProd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
    <section class="content-header">
        <h4 style="margin-bottom: 25px;"><i class="fas fa-industry"></i> Productor</h4>
        <%--
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active">Perfil</li>
            </ol>
        </nav>--%>
    </section>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
    <div class="col col-md-6" style="padding-left: 0px">
        <div class="form-group">
            <label>RUC:</label>
            <input type="text" class="form-control" id="ruc" name="ruc"/>
        </div>
        <div class="form-group">
            <label>Productor:</label>
            <input type="text" class="form-control" id="productor" name="productor"/>
        </div>
        <button id="guardar" type="button" class="btn btn-primary">Guardar</button>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
