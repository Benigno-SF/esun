<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_AprobRequ.aspx.cs" Inherits="SFC_WEB_APP.Mod_Logi.Wfo_AprobRequ" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    
    <link href="../Content/datatables.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <script src="../Scripts/datatables.js"></script>
    <style type="text/css">
        .bgtbl {
        }

        .table {
        }

        .table-sm th,
        .table-sm td {
            padding-top: 0.3rem !important;
            padding-bottom: 0.3rem !important;
            padding-left: 0.1rem !important;
            padding-right: 0.1rem !important;
        }


        .Grid td {
            background-color: White;
            color: Black;
            font-size: 10pt;
            line-height: 200%;
        }

        .Grid th {
            background-color: Navy;
            color: White;
            font-size: 10pt;
            line-height: 200%;
        }

        .ChildGrid td {
            color: black;
            font-size: 10pt;
            line-height: 200%;
        }

        .ChildGrid th {
            background-color: Black !important;
            color: black;
            font-size: 10pt;
            line-height: 200%;
        }

        .bgtbl {
            background: rgba(255,255,255,0.5) !important;
        }

            .bgtbl tr th {
                background-color: #d9edf7 !important;
            }

                    .dataTables_wrapper .dataTables_filter {
        float: right;
        text-align: right;
        visibility: hidden;
        display: none
        }
    </style>

    <script>
        function ActiveCheck(btnId) {
            var idRow = btnId.split("_")[1];

            var vvActive = $("#" + btnId).attr("data-active");
            if (vvActive == "false") {
                $("#" + btnId).addClass("btn btn-success");
                $("#" + btnId).attr("data-active", "true");
                $("#btnRe_" + idRow).removeClass("btn btn-danger");
                $("#btnRe_" + idRow).attr("data-active", "false");
                $("#" + btnId).closest("tr").find("input[type=hidden][id*=hdfValue]").val("1");
                $("#" + btnId).blur();
            } else {
                $("#" + btnId).removeClass("btn btn-success");
                $("#" + btnId).attr("data-active", "false");
                $("#" + btnId).closest("tr").find("input[type=hidden][id*=hdfValue]").val("0")
            }
        }
        function ActiveUnCheck(btnId) {
            var idRow = btnId.split("_")[1];
            var vvActive = $("#" + btnId).attr("data-active");
            if (vvActive == "false") {
                $("#" + btnId).addClass("btn btn-danger");
                $("#" + btnId).attr("data-active", "true");
                $("#btnAc_" + idRow).removeClass("btn btn-success");
                $("#btnAc_" + idRow).attr("data-active", "false");
                $("#" + btnId).closest("tr").find("input[type=hidden][id*=hdfValue]").val("2")
            } else {
                $("#" + btnId).removeClass("btn btn-danger");
                $("#" + btnId).attr("data-active", "false");
                $("#" + btnId).closest("tr").find("input[type=hidden][id*=hdfValue]").val("0")
            }
        }

        function divexpandcollapse(divname) {
            var btnId = "#btn_" + divname.split("_")[1];
            var atrr = $(btnId).attr("data-hide");
            var img = divname;
            if (atrr == "true") {
                $(btnId)
                    .closest("tr")
                    .after("<tr><td></td><td colspan = '150%'>" + $("#" + divname)
                        .html() + "</td></tr>");
                $(btnId).attr("data-hide", "false");
                $(btnId).html("<i class='fa fa-minus'></i>");
            } else {
                $(btnId).closest("tr").next().remove();
                $(btnId).attr("data-hide", "true");
                $(btnId).html("<i class='fa fa-plus'></i>");
            }
        }
    </script>
    <style>
        thead input {
        width: 100%;
    }
    </style>

    <div class="row">
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnBusc" runat="server" class="btn btn-secondary col-12">
                <i class="fa fa-search"></i>Buscar
            </button>
        </div>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnGuardar">&nbsp;</label>
            <button type="button" id="btnGuardar" runat="server" class="btn btn-secondary col-12" onserverclick="btnGuardar_ServerClick">
                <i class="fa fa-save"></i> Guardar
            </button>
        </div>
    </div>
    <asp:UpdatePanel ID="UpdGv" runat="server">
        <ContentTemplate>
            <div id="dvGv" class="row center-block">
                <div class="table table-responsive-sm">
                    <asp:GridView ID="GvList" runat="server" AutoGenerateColumns="false" CssClass="bgtbl"
                        EmptyDataText="No se encontraron datos" ShowHeaderWhenEmpty="True" DataKeyNames="IdPedidoVenta"
                        OnRowDataBound="GvList_RowDataBound" OnDataBound="GvList_DataBound">
                        <Columns>
                            <asp:BoundField DataField="IdPedidoVenta" Visible="false" />
                            <asp:BoundField DataField="Codigo" HeaderText="Centro" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a class="mybtn btn-outline-primary" id="btn_<%# Eval("IdPedidoVenta") %>" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_<%# Eval("IdPedidoVenta") %>');"><i class="fa fa-plus"></i></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Serie" HeaderText="Serie" />
                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                            <asp:BoundField DataField="Referencia" HeaderText="Referencia" />
                            <asp:BoundField DataField="NombreAlmacen" HeaderText="Almacen" />
                            <asp:BoundField DataField="FechaEntrega" HeaderText="F. Entrega" />
                            <asp:BoundField DataField="UsuarioCreacion" HeaderText="Usuario" />
                            <asp:BoundField DataField="Texto" HeaderText="Observación" />
                            <asp:BoundField DataField="UsuarioAprobador" HeaderText="U. Aprob" />
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <a class="mybtn btn-outline-primary" id="btnAc_<%# Eval("IdPedidoVenta") %>" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_<%# Eval("IdPedidoVenta") %>');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_<%# Eval("IdPedidoVenta") %>" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_<%# Eval("IdPedidoVenta") %>');"><i class="fa fa-times"></i></a>
                                    <asp:HiddenField runat="server" ID="hdfValue" Value="0" />

                                    <div id="div_<%# Eval("IdPedidoVenta") %>" style="display: none;">
                                        <asp:GridView ID="grdViewOrdersOfCustomer" runat="server" AutoGenerateColumns="false"
                                            DataKeyNames="IdPedidoVenta" CssClass="table-sm ChildGrid">
                                            <Columns>
                                                <asp:BoundField DataField="IdPedidoVenta" Visible="false" />
                                                <asp:BoundField DataField="Codigo" HeaderText="Codigo" />
                                                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                                                <asp:BoundField DataField="Abreviatura" HeaderText="U. M." />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnBusc" />
            <asp:AsyncPostBackTrigger ControlID="btnGuardar" />
        </Triggers>
    </asp:UpdatePanel>
    <script>
        $(document).ready(function () {
            // Setup - add a text input to each footer cell
            $('#<%=GvList.ClientID%> thead tr').clone(true).appendTo('#<%=GvList.ClientID%> thead');
            $('#<%=GvList.ClientID%> thead tr:eq(1) th').each(function (i) {
                var title = $(this).text();
                if (title.length > 1) {
                    $(this).html('<input type="text" placeholder=" ' + title + '" />');
                    $('input', this).on('keyup change', function () {
                    if (table.column(i).search() !== this.value) {
                        table
                            .column(i)
                            .search(this.value)
                            .draw();
                    }
                });
                }
            });

            var table = $('#<%=GvList.ClientID%>').DataTable({
                orderCellsTop: false,
                fixedHeader: true,
                paging: false,
              //  searching: false
            });
        });

    </script>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
