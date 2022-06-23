<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subir.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Subir" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <input class="campo cm_imagens" id="cm_imagen" type="file" accept="image/png, image/jpeg" onchange="ImagenCambio(this)" />
    <input class="form-control campo" id="cm_imagenbase64" type="text" />
    
    <input type="button" id="btnGuardar"/>


    
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <script>
        function ImagenCambio(o) {
            var img = o.files[0];
            var reader = new FileReader();
            reader.onloadend = function () {
                $('#cm_imagenbase64').val(reader.result)
            };
            reader.readAsDataURL(img);
        }

        

        $("#btnGuardar").click(function () {
            var obj = new Object();
            obj.Imagen = $('#cm_imagen').val();
            obj.ImagenBase64 = $('#cm_imagenbase64').val();

            $.ajax({
                type: "POST",
                url: "SerApp.asmx/Subir",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (datos) {
                    console.log("Se ejecuto el post. OK.");
                    /*
                    var o = JSON.parse(datos['d']);
                    if (JSON.stringify(o) == "1") {
                        toastr.success("Los cambios se guardaron correctamente.", "Correcto");
                    } else {
                        toastr.error("Hubo un problema en la conectividad debes verificar otra vez.", "Error");
                    }*/
                },
                error: function () {
                    console.log("Errorr!!!!!");
                }
            });
        });
    </script>
</body>
</html>
