<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_MonitoreoDispositivos.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_MonitoreoDispositivos" %>

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
    <style>
        #dispositivos {
            border: 1px solid;
            border-spacing: 0px;
        }

        #dispositivos th{
            padding: 5px;
            border: 1px solid #000;
        }

        #dispositivos td{
            padding: 5px;
            border: 1px solid #000;
        }
    </style>
</head>
<body>
    CONTENIDO

    <table id="dispositivos" class="table table-bordered table-striped">
        <thead>
            <tr><th style="width: 150px;">Dispositivo</th><th style="width: 150px;">Ip</th><th style="width: 150px;">Estado</th><th style="width: 150px;">Bateria</th></tr>
        </thead>
        <tbody>
            
        </tbody>
    </table>
    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function Actualizar() {
            console.log("mensajew")
            var estado = "";
            var html = "";
            $.get("/Mod_App/SerApp.asmx/DispositivosMonitoreo_Listado", function (data) {
                
                for (var i = 0; i < data.length; i++) {
                    html += "<tr><td>" + data[i].cDescripcion + "</td><td>" + data[i].cIp + "</td><td>" + (data[i].bEstado).toString() + "</td><td>" + (data[i].nBateria).toString() + "</td></tr>";
                    $("#dispositivos tbody").html(html);
                }
                console.log("mensajes")
            }, "json");
        }

        setInterval(Actualizar, 2000);
    </script>
</body>
</html>
