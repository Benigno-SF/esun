<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_TicketRegi.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_TicketRegi" %>

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
            font-size: 1.55rem;
            color: #aaa;
            font-style: italic;
        }

        .hiddeMouse {
            cursor: none;
        }

        .barra-iconos {
            position: absolute;
            top: 18px;
            right: 18px;
        }

        .btn {
            border: none !important;
        }

        .alto-Minimo {
            min-height: 90px;
        }

        .FuenteAviso {
            font-weight: bold;
            font-size: 40px;
        }
    </style>
</head>
<body class="hiddeMouse">
    <div class="barra-iconos">
        <button type="button" id="btnNetwork" class="btn btn-outline-success" data-valid="-1"><i class="fas fa-network-wired fa-lg"></i></button>
    </div>
    <div class="container">
        <div class="row justify-content-md-center pt-4">
            <div class="col-md-auto text-center">
                <h1 class="display-6">
                    <img src="../Img/e-sun_logo_l.png" alt="logo" /></h1>
            </div>
        </div>
        <div class="row justify-content-md-center p-4">
            <div class="col-md-auto text-white text-center">
                <p class="lead mb-10">PASE SU FOTOCHECK</p>
            </div>
        </div>
        <div class="row justify-content-md-center pt-6">
            <div class="col-md-auto text-center">
                <form id="PrintTicket" name="PrintTicket">
                    <div class="p-1 bg-light rounded rounded-pill shadow-sm mb-6">
                        <div class="input-group input-group-lg">
                            <div class="input-group-prepend">
                                <button id="button-addon2" type="submit" class="btn btn-link text-warning"><i class="fa fa-search"></i></button>
                            </div>
                            <input type="text" id="txtCodigo" class="form-control border-0 rounded-pill bg-light" placeholder="Identifiquese..." required="required" autocomplete="off" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="row justify-content-md-center pt-3 alto-Minimo">
            <div id="msg" class="col-md-auto text-center FuenteAviso">
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row py-5">
            <div class="col-lg-9 mx-auto text-white text-center">
                <p class="lead mb-0">esun</p>
            </div>
        </div>
    </div>
    <script>
        window.addEventListener("offline", function (e) {
            $("#btnNetwork").removeClass("btn-outline-success");
            $("#btnNetwork").addClass("btn-outline-danger");
            $('#msg').html('Revise su conexión');
        });

        // Add event listener online to detect network recovery.
        window.addEventListener("online", function (e) {
            $("#btnNetwork").removeClass("btn-outline-danger");
            $("#btnNetwork").addClass("btn-outline-success");
            $("#msg").html("");
        });
        var vnEstatus = -1;
        $('#PrintTicket').on('keyup keypress', function (e) {
            var keyCode = e.keyCode || e.which;
            if (keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        var result = new Array;
        var list = ['192.168.20.5'];
        $("#txtCodigo").keydown(function (e) {
            if (e.keyCode == 13) {
                ValidaURL();
            }
        });
        $(document).ready(function () {
            $("#txtCodigo").focus();
        });
        function ImprimirTickets() {
            var obj = new Object();
            obj.vcNroDocumento = $("#txtCodigo").val();
            if (obj.vcNroDocumento != '') {
                $.ajax({
                    type: 'POST',
                    url: "SerApp.asmx/RegiTicket",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    timeout: 2000,
                    statusCode: {
                        404: function () {
                            $("#btnNetwork").removeClass("btn-outline-success");
                            $("#btnNetwork").addClass("btn-outline-danger");
                        }
                    },
                    success: function (data) {
                        $('#PrintTicket')[0].reset();
                        var vnVal = data.d[0] * 1;
                        var vcNombres = data.d[1];
                        if (vnVal == 0 && vcNombres.length == 0) {
                            $("#msg").html("No Existe");

                        } else {
                            switch (vnVal) {
                                case -1:
                                    $("#msg").html(vcNombres + "<br /> ticket ya fue impreso");
                                    break;
                                case 0:
                                    $("#msg").html(vcNombres + "<br /> No Provisionado");
                                    break;
                                default:
                                    $("#msg").text("imprimiendo...");
                                    break;
                            }
                        }
                        clearTimeout(clear);
                        fclear(2000);
                        document.getElementById("txtCodigo").autofocus;
                    }
                });
            } else {
                document.getElementById("txtCodigo").autofocus;
            }
        }
        var clear;
        function fclear(seg) {
            clear = setTimeout("limpiar()", seg);
        }
        function limpiar() {
            $('#msg').html("");
            $("#txtCodigo").val("");
        };
        function ValidaURL() {
            var xhttp = new XMLHttpRequest();
            var url = window.location.href;
            try {
                xhttp.onreadystatechange = function () {
                    //console.log(xhttp);
                    //console.log(xhttp.readyState);
                    if (xhttp.readyState == 4 && xhttp.status == 0) {
                        $("#btnNetwork").removeClass("btn-outline-success");
                        $("#btnNetwork").addClass("btn-outline-danger");
                        $("#txtCodigo").val("");
                        $('#msg').html("Red No Disponible");
                        clearTimeout(clear);
                        fclear(6000);
                    } else if (xhttp.readyState == 2) {
                        $("#btnNetwork").removeClass("btn-outline-danger");
                        $("#btnNetwork").addClass("btn-outline-success");
                        ImprimirTickets();
                    }
                };
                xhttp.open("POST", url, true);
                xhttp.send();
            } catch (e) {
                console.log('catch', e);
            }
        };
        $("#txtCodigo").on("blur", function () {
            var blurEl = $(this);
            setTimeout(function () {
                blurEl.focus()
            }, 10);
        });
    </script>
</body>
</html>
