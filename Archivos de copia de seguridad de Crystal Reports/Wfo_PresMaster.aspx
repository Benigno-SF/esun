<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_PresMaster.aspx.cs" Inherits="SFC_WEB_APP.Mod_Pres.Wfo_PresMaster" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-4">
            <label for="txtDescri">Denominación</label>
            <input type="text" id="txtDescri" runat="server" autocomplete="off" class="form-control" placeholder="Ingrese texto a buscar">
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="txtDescri">Estado</label>
            <asp:DropDownList ID="ddlInEsta" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-3">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnBusc" runat="server" class="btn btn-secondary col-12" onserverclick="btnBusc_ServerClick">
                <i class="fa fa-search"></i> Buscar
            </button>
        </div>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-3">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnAgregar" runat="server" class="btn btn-secondary col-12">
                <i class="fa fa-plus"></i> Agregar
            </button>

        </div>
    </div>
    <br />
    <asp:UpdatePanel ID="UpdGv" runat="server">
        <ContentTemplate>
            <div id="dvGv" class="row center-block">
                <div class="table-responsive">
                    <asp:GridView ID="GvList" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-condensed bgtbl"
                        EmptyDataText="No se encontraron datos" ShowHeaderWhenEmpty="True" DataKeyNames="nIdPresupuesto">
                        <Columns>
                            <asp:BoundField DataField="nIdPresupuesto" Visible="false" />
                            <asp:BoundField DataField="cDenominacion" HeaderText="Denominación" />
                            <asp:BoundField DataField="dFechaInicio" DataFormatString="{0:yyyy}" HeaderText="Año Inicio" />
                            <asp:BoundField DataField="cSimbolo" HeaderText="Moneda" />
                            <asp:BoundField DataField="nTCambio" HeaderText="T.C" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <button type="button" id="btnGvEdit" class="mybtn btn btn-link"
                                        runat="server">
                                        <span class="fa fa-edit"></span>
                                    </button>
                                    <button type="button" id="btnGvRepo" class="mybtn btn btn-link"
                                        runat="server" onserverclick="btnGvRepo_ServerClick">
                                        <span class="fa fa-sticky-note"></span>
                                    </button>
                                    <button type="button" id="btnGvRepoCult" class="mybtn btn btn-link"
                                        runat="server">
                                        <span class="fa fa-file-pdf"></span>
                                    </button>
                                    <asp:HiddenField ID="hdfGvIdPres" runat="server" Value='<%#Eval("nIdPresupuesto") %>' />
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
    <!-- Modal -->
    <div class="modal fade" id="modCult" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Reporte por Cultivo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group col-12">
                        <label class="control-label" for="ddlCultivo">Cultivo</label>
                        <asp:DropDownList ID="ddlCultivo" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <asp:HiddenField ID="hdfIdPres" runat="server" Value="0" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" id="btnRepo" class="btn btn-primary">Mostrar</button>
                </div>
            </div>
        </div>
    </div>


    <script>
        $('#<%=UpdGv.ClientID%>').on('click', 'table[id*=GvList] [id*=btnGvRepoCult]', function () {
            $('#<%=hdfIdPres.ClientID%>').val($(this).closest("tr").find("input[type=hidden][id*=hdfGvIdPres]").val());
            $("#<%=ddlCultivo.ClientID%>").val("0");
            $('#modCult').modal('show');
        });
        $("#btnRepo").click(function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdPresupuesto = $("#<%=hdfIdPres.ClientID%>").val();
            obj.vnIdCultivo = $("#<%=ddlCultivo.ClientID%>").val();

            if (obj.vnIdCultivo > 0) {
                $.ajax({
                    async: false,
                    type: 'POST',
                    url: "../SerPres.asmx/RepoPresupCult",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = data.d;
                        if (lst.length > 0) {
                            myWindow = window.open("../Mod_Repo/Wfo_RepoView.aspx?Cd=" + fuGetCdEmpre() + "&wXml=" + lst + "&wCrt=Crt_PresCultivo&wExp=2&wCan=0", "popup_window",
                                "width=970, height=600 toolbar=no, scrollbars=no, resizable=no, top=20, left=200");
                        } else {
                            alert("No existen datos");
                        }
                    },
                    error: function (error) {
                        console.log(error);
                        alert(JSON.stringify(error))
                    }
                });
            } else {
                alert("Escoja un cultivo")
            }

            
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
