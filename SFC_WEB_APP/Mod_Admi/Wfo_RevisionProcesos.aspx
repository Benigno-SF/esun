<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_RevisionProcesos.aspx.cs" Inherits="SFC_WEB_APP.Mod_Admi.Wfo_RevisionProcesos" %>

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
             <asp:UpdatePanel runat="server" ID="UpdDLL1" style="width: -webkit-fill-available;" class="col-md-12">
            <ContentTemplate>
                <div class="row">
                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <label for="ddlAnio" class="col-form-label">Año</label>
                        <asp:DropDownList ID="ddlAnio" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAnio_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <label for="ddlAProceso" class="col-form-label">Periodo</label>
                        <asp:DropDownList ID="ddlPeriodo" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPeriodo_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <label for="message-text" class="col-form-label">Semana:</label>
                        <asp:DropDownList ID="ddlSemana" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
                        <label for="btnRec">&nbsp;</label>
                        <button type="button" id="btnRec" runat="server" class="btn btn-secondary col-12" onserverclick="btnRec_ServerClick">
                            <i class="fa fa-search"></i>Recuperar
                        </button>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlAnio" />
                <asp:AsyncPostBackTrigger ControlID="ddlPeriodo" />
            </Triggers>
        </asp:UpdatePanel>

    <asp:UpdatePanel ID="UpdGv" runat="server">
        <ContentTemplate>
            <div id="dvGv" class="row center-block">
                <div class="table table-responsive-sm">
                    <asp:GridView ID="GvList" runat="server" AutoGenerateColumns="false" CssClass="bgtbl"
                        EmptyDataText="No se encontraron datos" ShowHeaderWhenEmpty="True" DataKeyNames="id"
                        OnRowDataBound="GvList_RowDataBound" OnDataBound="GvList_DataBound">
                        <Columns>
                            <asp:BoundField DataField="id" Visible="false" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a class="mybtn btn-outline-primary" id="btn_<%# Eval("id") %>" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_<%# Eval("id") %>');"><i class="fa fa-plus"></i></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Modulo" HeaderText="Modulo" />
                            <asp:BoundField DataField="Detalle" HeaderText="Detalle" />
                            <asp:BoundField DataField="Estado" HeaderText="Estado" />
                            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" />
                            <asp:BoundField DataField="SEMANA" HeaderText="SEMANA" />
                            <asp:BoundField DataField="a_fecha" HeaderText="Fecha" />
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:HiddenField runat="server" ID="hdfValue" Value="0" />

                                    <div id="div_<%# Eval("id") %>" style="display: none;">
                                        <asp:GridView ID="grdViewOrdersOfCustomer" runat="server" AutoGenerateColumns="false"
                                            DataKeyNames="iddet" CssClass="table-sm ChildGrid">
                                            <Columns>
                                                <asp:BoundField DataField="iddet" Visible="false" />
                                                <asp:BoundField DataField="Ubicacion" HeaderText="Ubicacion" />
                                                <asp:BoundField DataField="Producto" HeaderText="Producto" />
                                                <asp:BoundField DataField="saldo" HeaderText="saldo" />
                                                <asp:BoundField DataField="ClienteProveedor" HeaderText="ClienteProveedor" />
                                                <asp:BoundField DataField="Documento" HeaderText="Documento" />
                                                <asp:BoundField DataField="fecha" HeaderText="fecha" />
                                                <asp:BoundField DataField="planilla" HeaderText="planilla" />
                                                <asp:BoundField DataField="perplanilla" HeaderText="perplanilla" />
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
            <asp:AsyncPostBackTrigger ControlID="btnRec" />
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
                ordering: false,
                info: false,
                colReorder: true
                //searching: false
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
