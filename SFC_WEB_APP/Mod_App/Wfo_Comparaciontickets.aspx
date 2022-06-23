<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_Comparaciontickets.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_Comparaciontickets" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    
    <title></title>
    <%--
    <%: Styles.Render("~/Content/css") %>
    <%: Scripts.Render("~/jquery") %>
        --%>
    <%: Scripts.Render("~/jquery") %>
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
</head>
<body>
    

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h2 style="margin-top: 10px">Control de tickets</h2>
                <hr/>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <form>
                    <div class="form-group">
                        <label>Fecha de proceso:</label>
                        <input type="date" id="fecha" class="form-control" value="<%=  DateTime.Today.ToString("yyyy-MM-dd") %>" />
                    </div>
                    <div class="form-group">
                        <label>DNI:</label>
                        <input type="text" id="dni" class="form-control" />
                    </div>
                    <button id="Calcular" type="button" class="btn btn-primary">Obtener</button>
                </form>
            </div>
            <hr/>
        </div>
        

        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label style="margin-top: 20px">Personal:</label>
                    <input type="text" id="persona" class="form-control" readonly="readonly" />
                </div>
            </div>
            <div class="col-md-6">
            </div>
        </div>
        <i class="fas fa-arrow-circle-left" style="padding-left: 10px; color: crimson;"></i> = Rollo usado en este proceso
        <div class="row">
            <div class="col-md-6">
                <h3>Tickets Impresos</h3>
                <table id="tblbloques"  class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <td>Fecha de emisión</td>
                            <td>Labor</td>
                            <td>Impresos</td>
                            <td>Usados</td>
                        </tr>
                    </thead>
                    <tbody></tbody>
                    <tfoot>
                        <tr>
                            <td><b>Sub total</b></td>
                            <td style="font-weight: bold;"></td>
                            <td id="ttotal1" style="font-weight: bold;"></td>
                            <td id="ttotal2" style="font-weight: bold;"></td>
                        </tr>
                        <tr>
                            <td><b>Diferencia</b></td>
                            <td></td>
                            <td id="diferencia" colspan="2" style="text-align: center; font-weight: bold;"></td>
                        </tr>
                    </tfoot>
                </table>
            </div>

            <div class="col-md-6">
                <h3>Tickets Leídos en este proceso</h3>
                <table id="origen_hoyleidos" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <td>Fecha de emisión</td>
                            <td>Labor</td>
                            <td>Cantidad</td>
                        </tr>
                    </thead>
                    <tbody></tbody>
                    <tfoot>
                        <tr>
                            <td><b>Total leídos: </b></td>
                            <td></td>
                            <td><b><span id="leido"></span></b></td>
                        </tr>
                    </tfoot>
                </table>

            </div>
        </div>
    </div>

    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script>

        $("#Calcular").click(function () {
            obj = new Object();
            obj.vcIdCodigoGeneral = $("#fecha").val();
            obj.vcNroDocumento = $("#dni").val();

            $.ajax({
                async: false,
                type: 'POST',
                url: "SerApp.asmx/Comparaciontickets",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    console.log(data['d']);
                    //console.log(data['d'].persona);
                    $("#persona").val(data['d'].persona);
                    $("#leido").html(data['d'].leidos);
                    var total = 0, total2 = 0;
                    var bloques = "", bloques2 = "";
                    for (var i = 0; i < data['d'].emitidos.length; i++) {
                        bloques += "<tr><td>" + data['d'].emitidos[i].dFechaImp + "</td><td>" + data['d'].emitidos[i].cLabor + "</td><td>" + data['d'].emitidos[i].cantidad + "</td><td>" + data['d'].emitidos2[i].cantidad + "</td></tr>";
                        //bloques += "<span style=\"border: 1px solid #000; padding-left: 5px; padding-right: 5px;\">" + data['d'].emitidos[i].cantidad + "</span>";
                        console.log(data['d'].emitidos[i].cantidad);
                        total += parseInt(data['d'].emitidos[i].cantidad);
                        total2 += parseInt(data['d'].emitidos2[i].cantidad);
                    }
                    $("#tblbloques tbody").html(bloques);

                    //alert(JSON.stringify(data['d'].hoyleidos));

                    for (var i = 0; i < data['d'].hoyleidos.length; i++) {
                        bloques2 += "<tr><td>" + data['d'].hoyleidos[i].dFechaImp + "</td><td>" + data['d'].emitidos[i].cLabor + "</td><td>" + data['d'].hoyleidos[i].cantidad + "</td></tr>";

                        //Pintamos las coincidencias
                        $('#tblbloques td').filter(function () {
                            return $(this).text() == data['d'].hoyleidos[i].dFechaImp;
                        }).append("<i class=\"fas fa-arrow-circle-left\" style=\"padding-left: 10px; color: crimson;\"></i>");//
                    }

                    console.log("Total: " + total);
                    $("#origen_hoyleidos tbody").html(bloques2);

                    //id="#ttotal1"

                    //$("#bloques2 table").html(bloques2);
                    $("#ttotal1").html(total);
                    $("#ttotal2").html(total2);
                    $("#diferencia").html(total-total2);
                    

                    $("#leido2").html(total - data['d'].leidos);


                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        })
    </script>


</body>
</html>
