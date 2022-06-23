<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ContrList.aspx.cs" Inherits="SFC_WEB_APP.Mod_Cali.Wfo_ContrList" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Untitled Page</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
    <li class="breadcrumb-item"><a href="<%= ResolveUrl("~/") %>">Home</a></li>
    <li class="breadcrumb-item"><a href="#">Calidad</a></li>
    <li class="breadcrumb-item active">Formatos</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivFeCont">
            <label for="txtFeCont">Fecha</label>
            <input type="text" id="txtFeCont" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
            <script type="text/javascript">
                $(function () {
                    $('#<%=txtFeCont.ClientID %>').datetimepicker({
                        format: 'DD/MM/YYYY',
                        locale: 'es'
                    });
                    $(function () {
                        $('#DivFeCont').datetimepicker({
                            format: 'DD/MM/YYYY',
                            locale: 'es'
                        });
                    });
                });
            </script>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-4">
            <label for="txtDescri">Formato</label>
            <input type="text" id="txtDescri" runat="server" autocomplete="off" class="form-control" placeholder="INSPECCIÓN DE...">
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-3">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnBusc" runat="server" class="btn btn-secondary col-12"
                onserverclick="btnBusc_ServerClick">
                <i class="fa fa-search"></i> Buscar
            </button>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-3">
            <label for="btnAdd">&nbsp;</label>
            <button type="button" id="btnAdd" class="btn btn-primary col-12">
                <i class="fa fa-plus"></i> Agregar Lista
            </button>
        </div>
    </div>
    <br />
    <asp:UpdatePanel ID="UpdGv" runat="server" >
        <ContentTemplate>
            <div class="row">
                <div class="table-responsive">
                    <asp:GridView ID="GvList" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered table-condensed bgtbl"
                        EmptyDataText="No se encontraron datos" 
                        ShowHeaderWhenEmpty="True" DataKeyNames="nIdFormato, nIdControl">
                        <Columns>
                            <asp:BoundField DataField="nIdFormato" Visible="false" />
                            <asp:BoundField DataField="nIdControl" HeaderText="Id" />
                            <asp:BoundField DataField="cCodigoFormato" HeaderText="Codigo" />
                            <asp:BoundField DataField="cDescFormato" HeaderText="Formato" />
                            <asp:BoundField DataField="nIdArea" HeaderText="Area" Visible="false" />
                            <asp:BoundField DataField="dFechaProc" HeaderText="Fecha" dataformatstring="{0:dd/MM/yyyy}" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <button type="button" id="btnGvRegi" class="mybtn btn"
                                        runat="server" onserverclick="btnGvRegi_ServerClick">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                    <button type="button" id="btnGvRepo" class="mybtn btn"
                                        runat="server" onserverclick="btnGvRepo_ServerClick">
                                        <i class="fa fa-search-plus"></i>
                                    </button>
                                    <asp:HiddenField ID="IdForm" runat="server" Value='<%#Eval("nIdFormato") %>' />
                                    <asp:HiddenField ID="IdCont" runat="server" Value='<%#Eval("nIdControl") %>' />
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
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
