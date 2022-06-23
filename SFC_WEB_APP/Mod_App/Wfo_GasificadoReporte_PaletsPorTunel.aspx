<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_GasificadoReporte_PaletsPorTunel.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_GasificadoReporte_PaletsPorTunel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title></title>
    <%: Scripts.Render("~/jquery") %>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

    <!--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.23/datatables.min.css"/>-->
    
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h2 style="margin-top: 10px">PALETS DE GASIFICADO</h2>
                <hr/>
            </div>
        </div>

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
                                <td style="width:200px">Palet</td>
                                <td>Fecha y hora de registro</td>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>

                    <table id="tblreporte2" class="table table-bordered table-striped" style="margin-top:20px; display:none">
                        <thead>
                            <tr>
                                <td style="width:200px">Palet</td>
                                <td style="width:400px">Cámara</td>
                                <td>Fecha y hora de registro</td>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
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
                url: "SerApp.asmx/Reporte_PaletsPorTunelYPorDia",
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
                url: "SerApp.asmx/Reporte_PaletsPorTunelYPorDia",
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
</body>
</html>
