<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ReportePiscinaK.aspx.cs" Inherits="SFC_WEB_APP.Mod_Agro.Wfo_ReportePiscinaK" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        form {
            height: 100%;
        }
    </style>
    
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/20.2.3/css/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/20.2.3/css/dx.light.css" />
    <script src="https://cdn3.devexpress.com/jslib/20.2.3/js/dx.all.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label>Piscina</label>
                <select id="IdPiscina" class="form-control">
                    <% foreach (var item in Piscinas) {%>
                    <option value="<%=item.nIdPiscina %>"><%=item.cUbicacion %></option>
                    <%} %>
                </select>
            </div>
            <div class="form-group">
                <label>Fecha y hora de inicio</label>
                <input id="Finicio" type="text" class="form-control" />
            </div>
            <div class="form-group">
                <label>Fecha y hora de finalización</label>
                <input id="Ffin" type="text" class="form-control" />
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <%--
                <button class="btn btn-warning" type="button"><i class="fas fa-arrow-left"></i>&nbsp;&nbsp;Atras</button>
                    --%>
                <button class="btn btn-primary" type="button" onclick="MostrarReporte()"><i class="fas fa-running"></i>&nbsp;&nbsp;Mostrar</button>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label>Total litros de entrada: </label>
                <input id="TLentrada" type="text" class="form-control" readonly="readonly" />
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <label>Total litros de salida: </label>
                <input id="TLsalida" type="text" class="form-control" readonly="readonly"/>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="demo-container">
                <div id="gridContainer"></div>
            </div>
        </div>
    </div>

        <script type="text/javascript">
            $(function () {
                $('#Finicio').datetimepicker({
                    format: 'DD/MM/YYYY HH:mm',
                    locale: 'es'
                });

                $('#Ffin').datetimepicker({
                    format: 'DD/MM/YYYY HH:mm',
                    locale: 'es'
                });
            });

            function MostrarReporte() {
                var idpiscina = $("#IdPiscina").val();
                var finicio = $("#Finicio").val();
                var ffin = $("#Ffin").val();

                $.ajax({
                    type: "POST",
                    url: "../SerAgro.asmx/ReportePorPiscina",
                    data: JSON.stringify({ nIdPiscina: idpiscina, dFechaInicio: finicio, dFechaFin: ffin  }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (datos) {
                        console.log(JSON.stringify(datos));
                        var o = JSON.parse(datos['d']);

                        $("#TLentrada").val(o.te);
                        $("#TLsalida").val(o.ts);

                        $("#gridContainer").dxDataGrid({
                            dataSource: o.re,
                            columns: [
                                {
                                    dataField: "fh",
                                    caption: "Registro"
                                },
                                {
                                    dataField: "qe",
                                    caption: "Caudal entrada"
                                },
                                {
                                    dataField: "qs",
                                    caption: "Caudal salida"
                                }],
                            showBorders: true
                        });

                        if (o.rs == 1) {
                            
                        } else {
                            toastr.error("Hubo un problema en la conectividad, intentalo más tarde.", "Error");
                        }
                    },
                    error: function () {
                        toastr.error("Existe un error de conectividad.", "Error");
                    }
                });
            }
        </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
