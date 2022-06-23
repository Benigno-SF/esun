<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_CambiarPsw.aspx.cs" Inherits="SFC_WEB_APP.Mod_Sis.Wfo_CambiarPsw" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
    <section class="content-header">
        <h4><i class="fa fa-lock"></i> Cambiar de contraseña</h4>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active">Perfil</li>
            </ol>
        </nav>
    </section>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
    <div class="col col-md-6" style="padding-left: 0px">
        <div class="form-group">
            <label for="psw1">Contraseña actual</label>
            <input type="password" class="form-control" id="psw1" name="psw1"/>
            <small id="help" class="form-text text-muted">Debe ingresar su contraseña actual.</small>
        </div>
        <div class="form-group">
            <label for="psw2">Nueva contraseña</label>
            <input type="password" class="form-control" id="psw2" name="psw2"/>
        </div>
        <div class="form-group">
            <label for="psw3">Confirmar su nueva contraseña</label>
            <input type="password" class="form-control" id="psw3" name="psw3"/>
        </div>
        <button id="cambiar" type="button" class="btn btn-primary">Cambiar</button>
    </div>
    
    <script>
        $(document).ready(function () {
            $('#cambiar').on('click', function (e) {
                e.preventDefault();

                var obj = new Object();
                obj.vcPswActual = $("#psw1").val();
                obj.vcPswNuevo = $("#psw2").val();
                obj.vcPswConfirma = $("#psw3").val();
                obj.vcUser = getCookie("cd_user");

                $.ajax({
                    type: "POST",
                    url: "../SerSis.asmx/Cambiarpsw",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (datos) {
                        var o = JSON.parse(datos['d']);
                        if (o.t == "1") {
                            toastr.success(o.msg, "Correcto");
                            $("#frmMain").trigger("reset");
                        } else {
                            toastr.warning(o.msg, "Error");
                        }
                    },
                    error: function () {
                        toastr.error("Hubo un error al cambiar la contraseña.", "Error");
                    }
                });
            });
        });

        function getCookie(cname) {
            var c2 = "";
            var decodedCookie = decodeURIComponent(document.cookie);
            var ca = decodedCookie.split('&');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                if (c.includes(cname)) {
                    c2 = c.split('=')[1];
                }
            }
            return c2;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
