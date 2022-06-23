<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_VerificarImagen.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_VerificarImagen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <div class="container">
        <div class="row">
            <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
                <label for="btnBusc">&nbsp;</label>
                <button type="button" id="btntest" class="btn btn-secondary col-12" data-toggle="modal" data-target="#sda">
                    <i class="fa fa-plus"></i>Iniciar Verificacion
                </button>
            </div>
            <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
                <label id="usuarios">0</label> USUARIOS LEIDOS
            </div>
            <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-3">
                <label id="na">0</label> USUARIOS ACTUALIZADOS
            </div>
        </div>
        <br />
        <div class="col-md-12">
            <div class="card">
                <div class="card-content">
                    <div class="card-body">
                        <h4 class="card-title info">FOTOS DE USUARIOS VERIFICADOS</h4>
                        <div id="verify"></div>
                        <div id="verifyFoto"></div>
                        <div class="row">
                            <div class="col-md-12" id="console"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        var lista;
        $(document).on('click', '#btntest', function (event) {
            event.preventDefault();
            $('#console').html(''); 
            $('#usuarios').text('0');
            $('#na').text('0');
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcNroDocumento = '';
            $.ajax({
                type: 'POST',
                url: "../SerRRHH.asmx/ListPersonalNisira",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                beforeSend: function () {
                    $('#verify').html('<span>Verificanco ... <img src="../Img/loading.gif" style="width: 15px;" /></span>');
                },
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    var usuarios = 0;
                    for (i = 0; i < lst.length; ++i) {
                        verifiimg(lst[i].IDCODIGOGENERAL, lst[i].apenom, lst[i].PERSONAL_FOTO);
                        usuarios = usuarios + 1;
                    }
                    $('#usuarios').text(usuarios);
                },
                complete: function () {
                    $('#verify').html('');
                }
            });
        });

        function verifiimg(doc, nombre, ruta) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcNroDocumento = doc;
            obj.vcRutaImg = ruta;

            var num = $('#na').text();
            if (num != '') {
                count = parseInt(num, 10);
            } else {
                count = 0;
            }
            $.ajax({
                type: 'POST',
                url: "../SerRRHH.asmx/VerifiImage",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                beforeSend: function () {
                    $('#verifyFoto').html('<span>Verificanco Foto de ' + nombre+' ... <img src="../Img/loading.gif" style="width: 15px;" /></span>');
                },
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    
                    if (lst[0].updat == 'ACTUALIZADO') {
                        count = count + 1;
                        $('#na').text(count);
                        $('#console').append('<p>' + doc + '-' + nombre + '-' + lst[0].updat + '<p>');

                    }
                },
                complete: function () {
                    $('#verifyFoto').html('');
                }
            });
        }

    </script>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
