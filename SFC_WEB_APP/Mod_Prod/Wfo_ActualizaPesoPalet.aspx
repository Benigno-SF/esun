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
        <div class="input-group mb-1">
            <label for="">Código Palet</label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <button type="button" class="btn btn-warning" id="btnCodigo"><i class="fa fa-barcode"></i></button>
                </div>
                <input type="text" class="form-control" id="txtPaletCod" autocomplete="off" autofocus="" required="required" onkeypress="return validar(event)">
            </div>
        </div>
        <div class="form-group mb-0">
            <label for="txtArtiVariedad">Cultivo</label>
            <input  class="form-control round" id="txtArtiVariedad" disabled="disabled"></input>
        </div>
         <div class="form-group mb-0">
            <label for="txtArtiEnvase" class="rigth">Envase</label>
            <input  class="form-control round" id="txtArtiEnvase" disabled="disabled"></input>
        </div>
        <div class="form-group">
            <label for="txtArtiTipoPalet">Palet</label>
            <input  class="form-control round" id="txtArtiTipoPalet" disabled="disabled"></input>
        </div>
        <div class="input-group mb-3">
            <label style="font-size: 14px;">Esta Correcto ? </label> &nbsp; <input type="checkbox" name="checkok" class="checkok" value="1" style="width:20px; height:20px;" />
        </div>
        <div class="form-group" style="display: none">
            <label for="txtDescri">Ingreso</label>
            <asp:DropDownList ID="ddlDispositivo" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="input-group mb-3">
            <label for="">Peso</label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <button type="button" class="btn btn-light"><i class="fas fa-weight-hanging"></i></button>
                </div>
                <input type="number" class="form-control" id="txtPeso" autocomplete="off" />
            </div>
        </div>

        <button type="button" id="btnRegi" class="btn btn-lg btn-success" >Guardar</button>
    </div>
    <br />
    <br />
    <asp:HiddenField ID="hdfIdPalet" runat="server" Value="0" />
    <input  type="hidden" id="nCodigo" disabled="disabled" />
    <input  type="hidden" id="nCantidad" disabled="disabled" />
    <script>

        function validar(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 13) {
                ConsultaPalet()
            }
            return (tecla != 13);
        }

        $("#btnRegi").click(function () {
            if ($('.checkok').is(':checked')) {
                var check = true;
                $('html,body').animate({ scrollTop: $('#txtPeso').offset().top }, 'slow');
                $("#txtPeso").focus();
            } else{
               var check = false;
            }

            if (check != true) {
                toastr.error("", "Los datos son correctos?");
                return;
            }
            $(document).ready(function () {
                $("#txtPaletCod").focus();
            });

            if ($("#txtPaletCod").val().length > 0 && $("#txtPeso").val().length > 0 && check == true) {
                //
                var obj = new Object();
                obj.vnIdc = $("#<%=hdfIdPalet.ClientID%>").val();
                obj.vcValor = $("#txtPeso").val();
                obj.nCodigo = $("#nCodigo").val();
                obj.nCantidad = $("#nCantidad").val();
                obj.nIdIngreso = 12;
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
            $("#txtArtiVariedad").val("");
            $("#txtArtiEnvase").val("");
            $("#txtArtiTipoPalet").val("");
            $("#txtArtiDesc").val("");
            $("#txtPeso").val("");
            $(".checkok").prop("checked", false);

            $("#nCodigo").val(0);
            $("#nCantidad").val(0);
        }



        function ConsultaPalet() {
            var obj = new Object();
            obj.vcCodigo = $("#txtPaletCod").val();
            if (obj.vcCodigo != '') {
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
                            if (lst[0].nExist === 0) {
                                $("#<%=hdfIdPalet.ClientID%>").val(lst[0].Id_ArticuloNumeroSerie);
                                $("#txtArtiVariedad").val(lst[0].Variedad);
                                $("#txtArtiEnvase").val(lst[0].Envase);
                                $("#txtArtiTipoPalet").val(lst[0].TipoPalet);
                                $(".checkok").prop("checked", false);
                                $("#txtPeso").focus();

                                $("#nCodigo").val(lst[0].NumeroSerie);
                                $("#nCantidad").val(lst[0].nCantidad);

                                $('html,body').animate({ scrollTop: $('#txtPeso').offset().top }, 'slow');
                            } else {
                                toastr.error("Palet ya registrado", "Error");
                                $("#txtPaletCod").val('');
                                $("#txtPaletCod").focus();
                            }
                        } else {
                            toastr.error("Palet no encontrado", "Error");
                            $("#txtPaletCod").val('');
                            $("#txtPaletCod").focus();
                        }
                    },
                    error: function (error) {
                        console.log(error);
                        alert(JSON.stringify(error))
                    }
                });
            }

        }
        //$("#txtPaletCod").focusout(function () {
        //    ConsultaPalet();
        //});
        //$("#txtPaletCod").on('keypress', function (e) {
        //    if (e.which == 13) {
        //        ConsultaPalet();
        //    }
        //});
        $("#btnCodigo").click(function () {
            $("#txtPaletCod").focus();
        });
    </script>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
