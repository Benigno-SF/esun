<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_Cuenta.aspx.cs" Inherits="SFC_WEB_APP.Mod_Sis.Wfo_Perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
    <section class="content-header">
      <h4>
        <i class="fa fa-user"></i> Cuenta de usuario
      </h4>
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
            <label>Nombres</label>
            <input type="text" class="form-control" id="nombres" runat="server" readonly="readonly" value="" />
        </div>    
        <div class="form-group">
            <label>Apellidos</label>
            <input type="text" class="form-control" id="apellidos" runat="server" value="" readonly="readonly" />
        </div>
        <div class="form-group">
            <label>Teléfono</label>
            <input type="text" class="form-control" id="telefono" runat="server" value="" />
        </div>
        <div class="form-group">
            <button type="button" id="btnActualizar" class="btn btn-primary">
                <i class="fa fa-save"></i> Actualizar
            </button>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('#btnActualizar').on('click', function (e) {
                e.preventDefault();
                var obj = new Object();
                obj.vcUsuario = getCookie("cd_user");
                obj.vcMovil = $("#Body_telefono").val();
                $.ajax({
                    type: "POST",
                    url: "../SerSis.asmx/UpdInfo",
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
                        location.reload();
                    },
                    error: function () {
                        toastr.error("Hubo un error al actualizar el registro, intente más tarde.", "Error");
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
