<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_OrdCarga.aspx.cs" Inherits="SFC_WEB_APP.Mod_Frio.Wfo_OrdCarga" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
    <li class="breadcrumb-item"><a href="<%= ResolveUrl("~/") %>">Home</a></li>
    <li class="breadcrumb-item"><a href="#">Frio</a></li>
    <li class="breadcrumb-item"><a href="<%= ResolveUrl("~/Mod_Frio/Wfo_OrdCarga.aspx") %>">Orden de Carga</a></li>
    <li class="breadcrumb-item active">Registro de Orden de Carga</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivFeCont">
            <label for="txtFeCont">Fecha</label>
            <input type="text" id="txtFeRegi" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
            <script type="text/javascript">
                $(function () {
                    $('#<%=txtFeRegi.ClientID %>').datetimepicker({
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
            <label for="txtDescri">Orden Carga</label>
            <input type="text" id="txtDescri" runat="server" autocomplete="off" class="form-control" placeholder="..." >
        </div>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-3">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnBusc" runat="server" class="btn btn-secondary col-12" onserverclick="btnBusc_ServerClick" >
                <i class="fas fa-search"></i> Buscar
            </button>
        </div>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-3">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnAgregar" runat="server" class="btn btn-secondary col-12"
                onserverclick="btnAgregar_ServerClick" >
                <i class="fas fa-plus"></i> Agregar
            </button>
        </div>
    </div>
    <br />
    <asp:UpdatePanel ID="UpdGv" runat="server" >
        <ContentTemplate>
            <div id=dvGv class="row center-block">
                <div class="table-responsive">
                    <asp:GridView ID="GvList" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-condensed bgtbl"
                        EmptyDataText="No se encontraron datos" ShowHeaderWhenEmpty="True" DataKeyNames="nIdOrdCarga">
                        <Columns>
                            <asp:BoundField DataField="nIdOrdCarga" Visible="false" />
                            <asp:BoundField DataField="nNoCarga" HeaderText="No. Carga" />
                            <asp:BoundField DataField="cRazonSocia" HeaderText="Cliente" />
                            <asp:BoundField DataField="cDescCult" HeaderText="Variedad" />
                            <asp:BoundField DataField="cDesDest" HeaderText="Destino" />
                            <asp:BoundField DataField="dFechaCarga" HeaderText="Fecha" />
                            <asp:BoundField DataField="dHoraCarga" HeaderText="Hora" />
                            <asp:BoundField DataField="cBooking" HeaderText="No Booking" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <button type="button" id="btnGvEdit" class="mybtn btn btn-link"
                                        runat="server" onserverclick="btnGvEdit_ServerClick">
                                        <span class="fa fa-edit"></span>
                                    </button>
                                    <button type="button" id="btnGvRepo" class="mybtn btn btn-link"
                                        runat="server" >
                                        <span class="fab fa-wpforms"></span>
                                    </button>
                                    <asp:HiddenField ID="hdfGvIdOrdc" runat="server" Value='<%#Eval("nIdOrdCarga") %>' />
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
    <div></div>
    <script>
         
        $('#<%=UpdGv.ClientID%>').on('click', 'table[id*=GvList] [id*=btnGvRepo]', function () {
            var params = new Object();
            params.IdOrdc = $(this).closest("tr").find("input[type=hidden][id*=hdfIdOrdc]").val()
            params.vcFecha = "";
            params = JSON.stringify(params);
            $.ajax({
                type: "POST",
                url: "../SerRepo.asmx/RepOrdc",
                data: params,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var val = data.d * 1
                    if (val = 1)
                        myWindow = window.open("../Mod_Report/Wfo_RepoView.aspx?wXml=RepOrdeCarg&wCrt=Crt_OrdeCarga&wExp=1", "popup_window",
                            "width=970, height=600 toolbar=no, scrollbars=no, resizable=no, top=20, left=200");
                    //RepoDocuList
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus + ": " + XMLHttpRequest.responseText);
                }
            });
        });
        
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
