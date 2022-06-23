<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ActualizaPesoPalet.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Wfo_ActualizaPesoPalet" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <div class="container">
        <div class="input-group mb-3">
            <label for="">Código Palet</label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <button type="button" class="btn btn-warning" id="btnCodigo"><i class="fa fa-barcode"></i></button>
                </div>
                <input type="text" class="form-control" id="txtPaletCod" autocomplete="off">
            </div>
        </div>
        <div class="form-group">
            <label for="txtArtiDesc">Articulo</label>
            <input type="email" class="form-control" id="txtArtiDesc" autocomplete="off" disabled="disabled">
        </div>
        <div class="form-group">
            <label for="txtDescri">Dispositivo</label>
            <asp:DropDownList ID="ddlDispositivo" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="input-group mb-3">
            <label for="">Peso</label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <button type="button" class="btn btn-light"><i class="fas fa-weight-hanging"></i></button>
                </div>
                <input type="number" class="form-control" id="txtPeso" autocomplete="off">
            </div>
        </div>
        <button type="button" id="btnRegi" class="btn btn-lg btn-success" >Guardar</button>
    </div>
    <br />
    <br />
    <asp:HiddenField ID="hdfIdPalet" runat="server" Value="0" />
    <script>
        $("#btnRegi").click(function () {
            if ($("#txtPaletCod").val().length > 0 && $("#txtPeso").val().length > 0) {
                //
                var obj = new Object();
                obj.vnId = $("#<%=hdfIdPalet.ClientID%>").val();
                obj.vcValor = $("#txtPeso").val();
                $.ajax({
                    async: false,
                    type: 'POST',
                    url: "../SerProd.asmx/RegiPesoPalet",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        LimpiarControles();
                        var vnValue = data.d * 1;
                        if (vnValue == 0) {
                            toastr.success("", "Correcto");
                        } else {
                            toastr.error("Verifica tus datos", "Error");
                        }
                        LimpiarControles();
                        $("#txtPaletCod").focus();
                    },
                    error: function (error) {
                        console.log(error);
                        alert(JSON.stringify(error))
                    }
                });
            } else {
                toastr.error("Datos incompletos", "Error");
            }
        });
        function LimpiarControles() {
            $("#txtPaletCod").val("");
            $("#txtArtiDesc").val("");
            $("#txtPeso").val("");
        }



        function ConsultaPalet() {
            var obj = new Object();
                obj.vcCodigo = $("#txtPaletCod").val();
                $.ajax({
                    async: false,
                    type: 'POST',
                    url: "../SerProd.asmx/GetInfoPalt",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst.length > 0) {
                            $("#<%=hdfIdPalet.ClientID%>").val(lst[0].Id_ArticuloNumeroSerie);
                            $("#txtArtiDesc").val(lst[0].NombreArticulo);
                            $("#txtPeso").focus();
                        }
                    },
                    error: function (error) {
                        console.log(error);
                        alert(JSON.stringify(error))
                    }
                });

        }
        $("#txtPaletCod").focusout(function () {
            ConsultaPalet();
        });
        $("#txtPaletCod").on('keypress', function (e) {
            if (e.which == 13) {
                ConsultaPalet();
            }
        });
        $("#btnCodigo").click(function () {
            $("#txtPaletCod").focus();
        });
    </script>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
