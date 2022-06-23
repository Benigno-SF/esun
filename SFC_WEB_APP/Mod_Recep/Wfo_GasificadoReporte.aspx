<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_GasificadoReporte.aspx.cs" Inherits="SFC_WEB_APP.Mod_Recep.Wfo_GasificadoReporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        thead td {
            border-color: #c4c1c1 !important;
        }

        tfoot td {
            border-color: #c4c1c1 !important;
            border-top: 2px solid #c4c1c1 !important;
        }

        .table td{
            border-color: #c4c1c1 !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
    <section class="content-header">
        <h4><i class="fa fa-file"></i>&nbsp;&nbsp;Reporte de gasificado</h4>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active">Reporte</li>
            </ol>
        </nav>
    </section>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
        <div class="row">
            <div class="col-md-12">
                <button class="btn btn-primary" type="button" onclick="Refrescar()"><i class="fas fa-redo"></i> Refrescar</button>
            </div>
        </div>    

        <div class="row">
            <div class="col-md-6">
                <br/>
                <h5 style="padding-bottom: 5px;">Registro de palets: </h5>
                
                <table id="tabla1"  class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <td><b>Fecha</b></td>
                            <td><b>Cantidad</b></td>
                        </tr>
                    </thead>
                    <tbody></tbody>
                    <tfoot>
                        <tr>
                            <td><b>Total</b></td>
                            <td id="subtotal1" style="font-weight: bold;"></td>
                        </tr>
                    </tfoot>
                </table>
            </div>

            <div class="col-md-6">
                <br/>
                <h5 style="padding-bottom: 5px;">Total por cámara: </h5>
                <table id="tabla2" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <td><b>Cámara</b></td>
                            <td><b>Cantidad</b></td>
                        </tr>
                    </thead>
                    <tbody></tbody>
                    <tfoot>
                        <tr>
                            <td><b>Total</b></td>
                            <td id="subtotal2" style="font-weight: bold;"></td>
                        </tr>
                    </tfoot>
                </table>

            </div>
        </div>

    <div class="modal fade" id="detalle" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Palets por cámara</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                         <label for="exampleInputEmail1">Fecha:</label>
                         <input type="text" class="form-control" id="fecha" readonly="readonly"/>
                     </div>
                    
                    <table id="tabla3" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <td><b>Cámara</b></td>
                                <td><b>Cantidad</b></td>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot>
                            <tr>
                                <td><b>Total</b></td>
                                <td id="subtotal3" style="font-weight: bold;"></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>

        Refrescar();

        function Refrescar() {
            Reporte1();
            Reporte2();
        }

        function Reporte1() {
            $.ajax({
                async: false,
                type: 'POST',
                url: "../SerSis.asmx/Reporte_PaletsPorDia",
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var resultado = JSON.parse(data['d']);
                    var bloques = "";
                    var subtotal1 = 0;
                    for (var i = 0; i < resultado.length; i++) {
                        bloques += "<tr><td style=\"width:50%; font-weight:bold; color:steelblue;\"><span onclick=\"Detalle('" + resultado[i].fecha.split(' ')[0].toString() + "')\">" + resultado[i].fecha.split(' ')[0] + "</span></td><td>" + resultado[i].cantidad + "</td></tr>";
                        subtotal1 += parseInt(resultado[i].cantidad);
                    }
                    $("#tabla1 tbody").html(bloques);
                    $("#subtotal1").html(subtotal1);
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        }

        function Reporte2() {
            $.ajax({
                async: false,
                type: 'POST',
                url: "../SerSis.asmx/Reporte_PaletsPorTunel",
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var resultado = JSON.parse(data['d']);
                    var bloques = "";
                    var subtotal2 = 0;
                    for (var i = 0; i < resultado.length; i++) {
                        bloques += "<tr><td>" + (resultado[i].tunel).replace("TE00", "Cámara ") + "</td><td>" + resultado[i].cantidad + "</td></tr>";
                        subtotal2 += parseInt(resultado[i].cantidad);
                    }
                    $("#tabla2 tbody").html(bloques);
                    $("#subtotal2").html(subtotal2);
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        }

        function Detalle(fecha) {
            Reporte1();
            Reporte2();
            $.ajax({
                async: false,
                type: 'POST',
                url: "../SerSis.asmx/Reporte_PaletsPorTunelYPorDia",
                data: JSON.stringify({ fecha: fecha }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    $("#fecha").val(fecha);
                    var resultado = JSON.parse(data['d']);
                    var bloques = "";
                    var subtotal3 = 0;
                    for (var i = 0; i < resultado.length; i++) {
                        bloques += "<tr><td style=\"width:50%\">" + (resultado[i].tunel).replace("TE00", "Cámara ") + "</td><td>" + resultado[i].cantidad + "</td></tr>";
                        subtotal3 += parseInt(resultado[i].cantidad);
                    }
                    $("#tabla3 tbody").html(bloques);
                    $("#subtotal3").html(subtotal3);
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });

            $("#detalle").modal('show');
            
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
