<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_Presentacion.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_Presentacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%; width:100%">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <%: Styles.Render("~/Content/css") %>
    <%: Scripts.Render("~/jquery") %>
</head>
<body style="padding:0px; margin: 0px; height: 100%;">
    <iframe id="presentacion" src="#" style="width:100%; height:100%; border: 0px;"></iframe>
    <table id="inicio" style="width: 100%; height: 100%;">
        <tr>
            <td>
                <div style="text-align: center; vertical-align: middle;">
                    <img src="/Img/sf-logo.png" style="width: 25%; height: auto;" />
                </div>
            </td>
        </tr>
    </table>

    <script>
        var canal = <%=canal%>;
        var presentacion = 0;
        var presentacion_memoria = -1;

        Mostrar(false);

        <%-- Verifica si el canal esta asociado a una presentacion, si está asociado, devolver el Id de la presentacion --%>
        function Verificar(parm) {
            $.ajax({
                type: "POST",
                url: "../SerProd.asmx/MostrarPresentacion",
                data: JSON.stringify({ canal: parm }),
                contentType: 'application/json; charset=utf-8',
                success: function (datos) {
                    presentacion = JSON.parse(datos['d']);
                },
                error: function () {
                    console.log("error");
                }
            });
        }

        $(document).ready(function () {
            setInterval(function () {
                <%-- Si el Id de la presentación cambia, entonces cargar la nueva presentacion --%>
                Verificar(canal);
                if (presentacion != 0) {
                    if (presentacion != presentacion_memoria) {
                        presentacion_memoria = presentacion;
                        Mostrar(true);
                        $("#presentacion").attr("src", "Wfo_EspEmbalaje?p=" + presentacion);
                    }
                }
            }, 3000);

            //Enviar señal 
        });

        function Mostrar(mostrar) {
            if (mostrar == false) {
                $("#presentacion").css("display", "none");
                $("#inicio").css("display", "table");
            } else {
                $("#presentacion").css("display", "table");
                $("#inicio").css("display", "none");
            }
        }
    </script>
</body>
</html>
