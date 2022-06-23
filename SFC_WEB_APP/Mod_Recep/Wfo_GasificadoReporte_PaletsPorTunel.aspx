<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_GasificadoReporte_PaletsPorTunel.aspx.cs" Inherits="SFC_WEB_APP.Mod_Recep.Wfo_GasificadoReporte_PaletsPorTunel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        thead td, th {
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
                <li class="breadcrumb-item active">Palets de gasificado</li>
            </ol>
        </nav>
    </section>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
     <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <label>Filtrar por:</label>
                    <select  class="form-control" id="filtro">
                        <option value="1">CÁMARA</option>
                        <option value="2">PALET</option>
                    </select>
                </div>
            </div>
            <div class="col-md-3" id="opcion1">
                <div class="form-group">
                    <label>Cámara:</label>
                    <select  class="form-control" id="tunel">
                        <option value="TE0001">CÁMARA 1</option>
                        <option value="TE0002">CÁMARA 2</option>
                        <option value="TE0003">CÁMARA 3</option>
                        <option value="TE0004">CÁMARA 4</option>
                        <option value="TE0005">CÁMARA 5</option>
                        <option value="TE0006">CÁMARA 6</option>
                        <option value="TE0007">CÁMARA 7</option>
                    </select>
                </div>
            </div>
            <div class="col-md-3" id="opcion2" style="display:none">
                <div class="form-group">
                    <label>Palet:</label>
                    <input type="text" class="form-control" id="palet" />
                </div>
            </div>

            <div class="col-md-6" id="opcion3">
                <div class="form-group">
                    <label>Fecha de proceso:</label>
                    <input type="date" id="fecha" class="form-control" value="<%=  DateTime.Today.ToString("yyyy-MM-dd") %>" />
                </div>
            </div>
            
            <div class="col-md-12">
                <button id="Buscar" type="button" class="btn btn-primary">Buscar</button>
            </div>
            <hr/>
        </div>
        
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <table id="tblreporte1" class="table table-bordered table-striped" style="margin-top:20px;">
                        <thead>
                            <tr>
                                <th style="width:200px">Palet</th>
                                <th>Fecha y hora de registro</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>

                    <table id="tblreporte2" class="table table-bordered table-striped" style="margin-top:20px; display:none">
                        <thead>
                            <tr>
                                <th style="width:200px">Palet</th>
                                <th style="width:400px">Cámara</th>
                                <th>Fecha y hora de registro</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>

         <script>
            $(document).ready(function () {
                $("#filtro").trigger("change");
                $("#Buscar").trigger("click");
            });

            $("#filtro").change(function () {
                switch ($(this).val()) {
                    case "1":
                        $("#opcion1").show();
                        $("#opcion2").hide();
                        $("#opcion3").show();
                        $("#tblreporte1").show();
                        $("#tblreporte2").hide();
                        break;
                    case "2":
                        $("#opcion1").hide();
                        $("#opcion2").show();
                        $("#opcion3").hide();
                        $("#tblreporte1").hide();
                        $("#tblreporte2").show();
                        break;
                    default:
                        console.log("...");
                        break;
                }
            });

            $("#tunel").change(function () {
                FiltrarPorCamara();
            });

            $("#fecha").change(function () {
                if ($("#filtro").val() == 1) {
                    FiltrarPorCamara();
                } else if ($("#filtro").val() == 2) {
                    FiltrarPorPalet();
                }
            });

            function FiltrarPorPalet()
            {
                var obj = new Object();
                obj.vcApPaterno = "";
                obj.vcApMaterno = "";
                obj.vcNombres = $("#palet").val();
                $.ajax({
                    async: false,
                    type: 'POST',
                    url: "../Mod_App/SerApp.asmx/Reporte_PaletsPorTunelYPorDia",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var filas = "";
                        for (var i = 0; i < data['d'].length; i++) {
                            var valor = data['d'][i].tunel;
                            filas += "<tr><td>" + data['d'][i].palet + "</td><td><b>CÁMARA " + (valor).substring(valor.length - 1, valor.length) +"</b> ["+ data['d'][i].tunel + "]</td><td>" + data['d'][i].registro + "</td></tr>";
                        }
                        $("#tblreporte2 tbody").html(filas);
                    },
                    error: function (error) {
                        console.log(error);
                        alert(JSON.stringify(error))
                    }
                });
            }

            function FiltrarPorCamara(){
                var obj = new Object();
                obj.vcApPaterno = $("#fecha").val();
                obj.vcApMaterno = $("#tunel").val();
                obj.vcNombres = "";

                $.ajax({
                    async: false,
                    type: 'POST',
                    url: "../Mod_App/SerApp.asmx/Reporte_PaletsPorTunelYPorDia",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var filas = "";
                        for (var i = 0; i < data['d'].length; i++) {
                            filas += "<tr><td>" + data['d'][i].palet + "</td><td>" + data['d'][i].registro + "</td></tr>";
                        }
                        $("#tblreporte1 tbody").html(filas);
                    },
                    error: function (error) {
                        console.log(error);
                        alert(JSON.stringify(error))
                    }
                });
            }

            $("#Buscar").click(function () {
                switch ($("#filtro").val()) {
                    case "1":
                        FiltrarPorCamara();
                        break;
                    case "2":
                        FiltrarPorPalet();
                        break;
                    default:
                        console.log("...")
                        break;
                }
            });

            /*
            $(document).ready(function () {
                $('#tblreporte1').DataTable();
            });*/
         </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
