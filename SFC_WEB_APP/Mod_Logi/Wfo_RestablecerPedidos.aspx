<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_RestablecerPedidos.aspx.cs" Inherits="SFC_WEB_APP.Mod_Logi.Wfo_RestablecerPedidos" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="../Content/datatables.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
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
                $("#" + btnId).closest("tr").find("input[type=hidden][id*=hdfValue]").val("1")
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
        <div class="col-6 col-sm-6 col-md-5 col-lg-12">
            <span style="font-size: 2rem"><b>CAMBIAR ESTADO DE DOCUMENTOS A PENDIENTE (DESAPROBAR)</b></span>
        </div>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnActualizar" runat="server" class="btn btn-secondary col-12" onserverclick="btnActualizar_ServerClick">
                <i class="fa fa-search"></i>Actualizar
            </button>
        </div>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnGuardar">&nbsp;</label>
            <button type="button" id="btnGuardar" runat="server" class="btn btn-secondary col-12" onserverclick="btnGuardar_ServerClick">
                <i class="fa fa-save"></i> Cambiar Estado Pendiente
            </button>
        </div>
    </div>
    <asp:UpdatePanel ID="UpdGv" runat="server">
        <ContentTemplate>
            <div id="dvGv" class="row center-block">
                <div class="table table-responsive-sm">
                    <asp:GridView ID="GvList" runat="server" AutoGenerateColumns="false" CssClass="bgtbl"
                        EmptyDataText="No se encontraron datos" ShowHeaderWhenEmpty="True" DataKeyNames="IDDOCX, IDDOCUMENTO, IDEMPRESA, APROBACION"
                        OnRowDataBound="GvList_RowDataBound" OnDataBound="GvList_DataBound">
                        <Columns>
                            <asp:BoundField DataField="IDDOCX" Visible="false" />
                            <asp:BoundField DataField="IDDOCUMENTO"  Visible="false" />
                            <asp:BoundField DataField="IDEMPRESA" HeaderText="EMPRESA" />
                            <asp:BoundField DataField="APROBACION"  Visible="false" />
                            <asp:BoundField DataField="TIPO" HeaderText="Doc" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a class="mybtn btn-outline-primary" id="btn<%# Eval("IDDOCX") %>" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div<%# Eval("IDDOCX") %>');"><i class="fa fa-plus"></i></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CODIGO" HeaderText="Serie" />
                            <asp:BoundField DataField="FECHA" HeaderText="Fecha" />
                            <asp:BoundField DataField="ALMACEN" HeaderText="Almacen" />
                            <asp:BoundField DataField="FECHA" HeaderText="F. Entrega" />
                            <asp:BoundField DataField="NOMBRE" HeaderText="Usuario" />
                            <asp:BoundField DataField="OBSERVACION" HeaderText="Observación" />
                            <asp:BoundField DataField="MONTO" HeaderText="Monto" />
                            <asp:BoundField DataField="USUARIOAPROBADOR" HeaderText="U. Aprob" />
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <a class="mybtn btn-outline-primary" id="btnRe<%# Eval("IDDOCX") %>" role="button"
                                        data-value="1" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe<%# Eval("IDDOCX") %>');"><i class="fa fa-times"></i></a>
                                    <asp:HiddenField runat="server" ID="hdfValue" Value="0" />
                                    <div id="div<%# Eval("IDDOCX") %>" style="display: none;">
                                        <asp:GridView ID="grdViewOrdersOfCustomer" runat="server" AutoGenerateColumns="false"
                                            DataKeyNames="IDDOCX" CssClass="table-sm ChildGrid">
                                            <Columns>
                                                <asp:BoundField DataField="IDDOCX" Visible="false" />
                                                <asp:BoundField DataField="IDPRODUCTO" HeaderText="Codigo" />
                                                <asp:BoundField DataField="DESCRIPCION" HeaderText="Descripcion" />
                                                <asp:BoundField DataField="CANTIDAD" HeaderText="Cantidad" />
                                                <asp:BoundField DataField="IDMEDIDA" HeaderText="U. M." />
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
            <asp:AsyncPostBackTrigger ControlID="btnActualizar" />
            <asp:AsyncPostBackTrigger ControlID="btnGuardar" />
        </Triggers>
    </asp:UpdatePanel>
    <script>

        $("#<%=btnActualizar.ClientID%>").click(function () {
            
            setTimeout(function () { cargatabla(); }, 2000);
        });

        cargatabla();

       function cargatabla() {
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
               destroy: true,
                orderCellsTop: false,
                fixedHeader: true,
                paging: false,
              //  searching: false
            });
        };

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
