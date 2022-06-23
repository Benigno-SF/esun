<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_Gasificado.aspx.cs" Inherits="SFC_WEB_APP.ModRecep.Wfo_Gasificado" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server"></asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <input id="CodPalet" type="text" style="display:none;"/>
    <button id="disparar" type="button" class="btn btn-primary" style="display:none;">Disparar</button>

    <div class="form-group">
        <input type="text" class="form-control" id="entrada" autocomplete="off" autofocus="autofocus" style="padding: 10px !important; border: 1px solid #000; border-radius: 0px; text-align: center; background-color: #EA3700; color: #EA3700" />
    </div>

    <div class="form-group">
        <label style="font-size:large">Cámara</label>
        <div class="form-control" id="v_tunel"></div>
    </div>

    <div class="form-group">
        <label style="font-size:large">Palet</label>
        <div class="form-control" id="v_palet"></div>
    </div>

    <%--
    <div id="Pruebas">Pruebas</div>
    --%>

    <div id="blqMensaje" style="width:100%; text-align: center; height: 36px; padding: 10px;"></div>

    <script>
        <%--
        $("#Pruebas").click(function () {
            Actualizar("TS001", "P001");
        });
        --%>

        function Actualizar(tunel, palet) {
            var obj = new Object();
            obj.CodPalet = palet;
            obj.CodTunel = tunel;
            $.ajax({
                type: "POST",
                url: "../SerSis.asmx/RegPalet",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (datos) {
                    var o = JSON.parse(datos['d']);
                    $("#blqMensaje").empty();
                    $("#blqMensaje").html("<b style=\"color: " + Color(parseInt(o.t)) + "; \">" + o.msg + "</b>");
                    setTimeout(function () { $('#blqMensaje').empty(); }, tiempo);
                },
                error: function () {
                    toastr.error("Existe un error de conectividad.", "Error");
                }
            });
        }

        function Color(prm) {
            var color = "#000";
            switch (prm) {
                case 0:
                    color = "#F35325";
                    break;
                case 1:
                    color = "#81BC06";
                    break;
                case 2:
                    color = "#05A6F0";
                    break;
            }
            return color;
        }

        var tiempo = 1800;
        $(document).ready(function () {    
            var tunel = "";
            var palet = "";
            $("#entrada").change(function (event) {
                var p = $("#entrada").val();
                $("#entrada").val("");
                if (tunel == "") {
                    if (p.includes("TE")) {
                        tunel = p;
                        $("#v_tunel").html(tunel);
                        $("#blqMensaje").empty();
                    } else {
                        tunel = "";
                        $("#blqMensaje").html("<b style=\"color: ##35325; \">Debe seleccionar un tunel válido.</b>");
                        setTimeout(function () { $('#blqMensaje').empty(); }, tiempo);
                    }
                } else {
                    $("#v_palet").empty();
                    if (p.includes("TE")) {
                        palet = "";
                        tunel = p;
                        $("#v_tunel").empty();
                        $("#v_tunel").html(tunel);
                        $("#blqMensaje").empty();
                    } else {
                        palet = p;
                        Actualizar(tunel, palet);
                        $("#v_palet").html(palet);
                        setTimeout(function () { $('#blqMensaje').empty(); }, tiempo);
                    }
                }
                $("#entrada").focusin();
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
    <style>
        #entrada:focus, #entrada:active {
            background-color: #7DC800 !important;
            color: #7DC800 !important;
        }
    </style>
</asp:Content>
