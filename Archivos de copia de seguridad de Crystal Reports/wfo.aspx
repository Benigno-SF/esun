<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wfo.aspx.cs" Inherits="SFC_WEB_APP.wfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="../Scripts/excel-bootstrap-table-filter-bundle.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" />


    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css" />
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>

    <style>
        thead input {
        width: 100%;
    }
    </style>
    
    <link href="Content/excel-bootstrap-table-filter-style.css" rel="stylesheet" />
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
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div>

            <asp:UpdatePanel ID="UpdGv" runat="server">
                <ContentTemplate>
                    <div id="dvGv" class="row center-block">
                        <div class="table table-responsive-sm">
                            <asp:GridView ID="GvList" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-intel"
                                EmptyDataText="No se encontraron datos" ShowHeaderWhenEmpty="True" DataKeyNames="IdPedidoVenta"
                                OnRowDataBound="GvList_RowDataBound" OnDataBound="GvList_DataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="1">
                                        <ItemTemplate>
                                            <a class="mybtn btn-outline-primary" id="btn_<%# Eval("IdPedidoVenta") %>" role="button" data-hide="true"
                                                href="JavaScript:divexpandcollapse('div_<%# Eval("IdPedidoVenta") %>');"><i class="fa fa-plus"></i></a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="IdPedidoVenta" Visible="false" />
                                    <asp:BoundField DataField="Codigo" HeaderText="Centro" />
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
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <script>
            $(document).ready(function () {
                // Setup - add a text input to each footer cell
                $('#<%=GvList.ClientID%> thead tr').clone(true).appendTo('#<%=GvList.ClientID%> thead');
                $('#<%=GvList.ClientID%> thead tr:eq(1) th').each(function (i) {
                    var title = $(this).text();
                    $(this).html('<input type="text" placeholder="Search ' + title + '" />');

                    $('input', this).on('keyup change', function () {
                        if (table.column(i).search() !== this.value) {
                            table
                                .column(i)
                                .search(this.value)
                                .draw();
                        }
                    });
                });

                var table = $('#<%=GvList.ClientID%>').DataTable({
                    orderCellsTop: true,
                    fixedHeader: true
                });
            });

        </script>
    </form>
</body>
</html>
