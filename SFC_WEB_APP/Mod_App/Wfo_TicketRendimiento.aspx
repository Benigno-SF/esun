<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_TicketRendimiento.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_TicketRendimiento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Tickets</title>
    <%: Styles.Render("~/Content/css") %>
    <%: Scripts.Render("~/jquery") %>
    <style>
        .form-control:focus {
            box-shadow: none;
        }

        .form-control-underlined {
            border-width: 0;
            border-bottom-width: 1px;
            border-radius: 0;
            padding-left: 0;
        }

        body {
            background: radial-gradient(at bottom,#bacad0 12%,#9d9e54);
            /*background: #ffd89b;
            background: -webkit-linear-gradient(to right, #ffd89b, #19547b);
            background: linear-gradient(to right, #ffd89b, #19547b);*/
            min-height: 100vh;
        }

        .form-control::placeholder {
            font-size: 0.95rem;
            color: #aaa;
            font-style: italic;
        }
    </style>
            <link rel="stylesheet" type="text/css" href="../Content/toastr.css" />
    <script type="text/javascript" src="../Scripts/toastr.js"></script>
    <script type="text/javascript" src="../Scripts/toastr.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row py-5">
            <div class="col-lg-9 mx-auto text-white text-center">
                <h1 class="display-4">
                    <img src="../Img/e-sun_logo_l.png" /></h1>
                <br />
                <p class="lead mb-0">PASE SU FOTOCHECK PARA IMPRIMIR SU TICKET</p>
            </div>
        </div>
        <div class="row mb-5">
            <div class="col-lg-6 mx-auto">
                <div class="">
                    <form id="PrintTicket" name="PrintTicket" runat="server">
                        <div class="p-1 bg-light rounded rounded-pill shadow-sm mb-4">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <button id="btnRegi" type="submit" class="btn btn-link text-warning"><i class="fa fa-search"></i></button>
                                </div>
                                <input type="text" runat="server" id="txtCodigo" name="Codigo" class="form-control border-0 rounded-pill bg-light" aria-describedby="button-addon2" autofocus="" onblur="this.focus()" placeholder="Identifiquese..." value="" autocomplete="off" required="required" />
                            </div>
                        </div>
                        <div class="col-6 align-middle">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <button class="btn btn-success" type="button" id="btnDel"><i class="fa fa-minus-square"></i></button>
                                </div>
                                <input type="text" id="txtCantidad" class="form-control" value="297" />
                                <div class="input-group-append">
                                    <button class="btn btn-success" type="button" id="btnAdd"><i class="fa fa-plus-square"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-6 align-middle">
                                            <label for="message-text">Labor:</label>
                                            <asp:DropDownList ID="ddlLabor" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <asp:HiddenField runat="server" ID="hdfPrintIp"></asp:HiddenField>
                    </form>
                </div>
            </div>
        </div>
        <div class="row py-2">
            <div class="col-lg-4 mx-auto text-center">
                <h1 id="msg">
                </h1>
                <h1><asp:Label ID="lblError" runat="server" Text=""></asp:Label></h1>
                <br />
                <h1><span id="lab" style="font-size: 80px;
    color: darkblue;"></span></h1>
            </div>
        </div>
    </div>

    <script>
        $('body').on('change', '#<%=ddlLabor.ClientID%>', function () {
            namelab = this.value;
            if (namelab == 'C') {
                $('#lab').text('CLAMSHELL');
            } else if (namelab == 'E   ') {
                $('#lab').text('EMBALAJE');
            } else if (namelab == 'S   ') {
                $('#lab').text('SELECCION');
            } else {
                $('#lab').text('');
            }
         });

        $("#btnAdd").click(function () {
            var vvCant = $("#txtCantidad").val() * 1;
            if (vvCant < 330) {
                vvCant += 33
            }
            $("#txtCantidad").val(vvCant);
        });
        $("#btnDel").click(function () {
            var vvCant = $("#txtCantidad").val() * 1;
            if (vvCant > 0) {
                vvCant -= 33
            }
            $("#txtCantidad").val(vvCant);
        });

        var clear;
        function fclear() {
            clear = setTimeout("limpiar()", 5000);
        }

        function limpiar() {
            $('#msg').text("");
            $("#<%=txtCodigo.ClientID%>").val("");
        }

        $(document).on('submit', '#PrintTicket', function (event) {
            event.preventDefault();
            var obj = new Object();
            obj.vcNroDocumento = $("#<%=txtCodigo.ClientID%>").val();
            obj.vnIdTiRow = $("#txtCantidad").val() * 1;
            obj.vcCodigoLabor = $('#<%=ddlLabor.ClientID%>').val();
            obj.vcIpLocal = $("#<%=hdfPrintIp.ClientID%>").val();
            if ((obj.vcNroDocumento != '') && (obj.vcIpLocal != "") && (obj.vcCodigoLabor != ' ')) {
                $.ajax({
                    type: 'POST',
                    url: "SerApp.asmx/PrintRendimiento",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        //$('#PrintTicket')[0].reset();
                        var lst = data.d;
                        var vnVal = lst[0] * 1
                        switch (vnVal) {
                            case -2:
                                $('#msg').text("No tiene configurado ningun dispositivo");
                                clearTimeout(clear);
                                fclear();
                                break;
                            case -1:
                                $('#msg').text("No Registrado");
                                clearTimeout(clear);
                                fclear();
                                break;
                            case 0:
                                $('#msg').text(lst[2] +"Tiene pendiente " + lst[1] + " Etiquetas");
                                clearTimeout(clear);
                                fclear();
                                break;
                            case 2:
                                $('#msg').text(lst[2]+" no estas registrado como " + $('#<%=ddlLabor.ClientID%> :selected').text());
                                clearTimeout(clear);
                                fclear();
                                break;
                            default:
                                $('#msg').text(lst[2] +' imprimiendo...');
                                $(document).ready(function () {
                                    var snd = new Audio("../sound/ok.mp3");
                                    snd.play();
                                });
                                clearTimeout(clear);
                                fclear();
                                break;
                        }
                        document.getElementById("<%=txtCodigo.ClientID%>").autofocus;
                    }
                });
            } else {
                toastr["error"]('', "falta seleccionar DNI o labor")
            }
        });

        function ShowToast(tipo, titulo, mensaje) {
            toastr.options = {
                tapToDismiss: false
                , timeOut: 5000
                , extendedTimeOut: 0
                , allowHtml: true
                , preventDuplicates: false
                , preventOpenDuplicates: false
                , newestOnTop: true
                , closeButton: true
                //, closeHtml: '<button class="btn-sm" style="background-color: grey; padding: 5px;">X</button>'
            }
            toastr[tipo](mensaje, titulo);
        }
    </script>

</body>
</html>
