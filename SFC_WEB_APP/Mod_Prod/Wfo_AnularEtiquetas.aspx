<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_AnularEtiquetas.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Wfo_AnularEtiquetas" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/qrcode.js"></script>
    <style>
        .text-success {
            font-size: 18px;
            color: green;
            color: #5c901a;
            font-weight: 700;
            text-align: center;
        }

        .text-danger {
            font-size: 18px;
            color: red;
            color: #5c901a;
            font-weight: 700;
            text-align: center;
        }

        input:focus {
            background-color: yellow !important;
        }


        /*QR*/

        .qr-code-generator {
            width: 500px;
            margin: 0 auto;
        }

            .qr-code-generator * {
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }

        #qrcode {
            width: 128px;
            height: 128px;
            margin: 0 auto;
            text-align: center;
        }

            #qrcode a {
                font-size: 0.8em;
            }

        .qr-url, .qr-size {
            padding: 0.5em;
            border: 1px solid #ddd;
            border-radius: 2px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .qr-url {
            width: 79%;
        }

        .qr-size {
            width: 20%;
        }

        .generate-qr-code {
            display: block;
            width: 100%;
            margin: 0.5em 0 0;
            padding: 0.25em;
            font-size: 1.2em;
            border: none;
            cursor: pointer;
            background-color: #e5554e;
            color: #fff;
        }
        /* STYLE */

        /* this will set the toastr icon */
        #toast-container > .toast-custom {
            content: "\f00C";
        }

        /* this will set the toastr style */
        .toast-custom {
            background-color: purple;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
    <div class="container">
        <div class="row">

            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" id="lector">
                <div class="col-md-8 mx-auto pt-5">
                    <div class="form-group pt-3 center">
                        
                        <h1  style="font-size: 3rem; text-align: center;">ANULAR ETIQUETAS</h1>
                    </div>
               
                    <div class="p-1 bg-light rounded rounded-pill shadow-sm mb-4">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <button type="button" id="Read" data-tipo="add" class="btn btn-link text-warning"><i class="fa fa-barcode"></i></button>
                            </div>
                            <input type="text" id="CodeBar" name="CodeBar" class="form-control border-0 rounded-pill bg-light" style="height: 50px !important" placeholder="" autofocus="" onblur="this.focus()" required="required" onkeypress="return validar(event)" />
                        </div>
                    </div>

                        <h3 style="text-align: center">A:<span id="correcto"></span>&nbsp; E:<span id="errores"></span>&nbsp; R:<span id="releidos"></span></h3>
                    <br />
                    <span id="infolinea"></span>
                </div>
                <div class="row py-2">
                    <div class="col-lg-12 mx-auto text-center">
                        <h1 id="msg" style="font-size: 4rem;"></h1>
                    </div>
                </div>
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
            </div>
            <div class="qr-code-generator" style="text-align: center">
                <span id="txtcode" style="text-align: center; font-weight: bold; font-size: 2rem;"></span>
                <div id="qrcode"></div>
            </div>
        </div>
    </div>

    <script>

        //$('#CodeBar').on('keydown keypress', function (e) {
        //    if (e.key.length === 1) { // Evaluar si es un solo caracter
        //        if ($(this).val().length < 19) { /* Comprobar que
        //                                                             * son menos de 12
        //                                                             * catacteres y que
        //                                                             * es un número */
        //            $(this).val($(this).val() + e.key); // Muestra el valor en el input
        //            $("#Read").click();
        //        }
        //        return false;
        //    }
        //});
        var ss = 0
        var ee = 0


        var leidos = 0;
        var errorcode = 0;
        var releidos = 0;
        var codex = '';

        function validar(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 13) {
                $("#Read").click();
            }
            return (tecla != 13);
        }

        function validarhead(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 13) {
                $("#ReadHead").click();
            }
            return (tecla != 13);
        }
        $('#CodeBar').focus();


        var clear;
        function fclear() {
            clear = setTimeout("limpiar()", 2000);
            $('#CodeBar').focus();
        }

        function limpiar() {
            $('#msg').text("");
        }

        var labval = '';
        $("#Read").click(function () {
            var obj = new Object();
            CodeBar = $("#CodeBar").val();
            if ($('#proceso').val() == '' && $('#procesodetalle').val() == '') {
                clearProceso();
            } else if (CodeBar.length != 19) {
                $('#msg').text('Error en Codigo');
                $('#CodeBar').val('');
                clearTimeout(clear);
                fclear();
                $('#CodeBar').focus();
                errorcode = errorcode + 1;
                $('#errores').text(errorcode);
                return false;
            } else {
                obj.vcIdEmpresa = fuGetCdEmpre();
                obj.vnIdEmbalaje = 1;
                obj.vnIdGrupo = 1;
                obj.vnIdSupervisor = 1;
                if (CodeBar == '' || obj.vnIdCodPartida == '0' || obj.vnIdGrupo == '0' || obj.vnIdEmbalaje == '0' || obj.vnIdSupervisor == '0') {
                    toastr["error"]("Seleccione todos los parametros antes de iniciar");
                    $('#CodeBar').val('');
                    $('#CodeBar').focus();
                    document.getElementById("CodeBar").autofocus;
                } else {
                    obj.vcLabor = CodeBar.substring(0, 1);
                    obj.vcAnio = CodeBar.substring(1, 5);
                    obj.vcNroDocumento = CodeBar.substring(5, 13);
                    obj.vnIdRendPack = CodeBar.substring(13, 19);
                    obj.vnIdRendPack * 1;
                    obj.vnIdProceso = $('#proceso').val();
                    obj.vnIdProcesoDetalle = $('#procesodetalle').val();
<%--                    obj.vnIdClieProv = $("#<%=ddlCliente.ClientID%>").val();
                    obj.vnIdEmbalaje = $("#<%=ddlEmbalaje.ClientID%>").val();
                    obj.vnIdCultivo = $("#<%=ddlCultivo.ClientID%>").val();
                    obj.vnIdVariedad = $("#<%=ddlVariedad.ClientID%>").val();
                    obj.vnIdSupervisor = $("#<%=ddlSupervisor.ClientID%>").val();--%>

                    $.ajax({
                        type: 'POST',
                        url: "../SerProd.asmx/RegiAnularEtiqueta",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            $('#CodeBar').val('');
                            vnVal = lst[0].IdRendPack * 1;

                            switch (vnVal) {
                                case 0:
                                    ShowToast("warning", 'Error! Etiqueta Ya fue Anulada', lst[0].Colaborador);
                                    $(document).ready(function () {
                                        var snd = new Audio("../sound/error.mp3");
                                        snd.play();
                                    });
                                    $('#msg').text('Error! Etiqueta Ya fue Anulada de ' + lst[0].Colaborador);
                                    releidos = releidos + 1;
                                    $('#releidos').text(releidos);
                                    clearTimeout(clear);
                                    fclear();
                                    break;
                                case -1:
                                    ShowToast("error", 'ERROR...', 'Etiqueta No Existe');
                                    $(document).ready(function () {
                                        var snd = new Audio("../sound/error.mp3");
                                        snd.play();
                                    });
                                    $('#msg').text('Etiqueta No Existe');
                                    errorcode = errorcode + 1;
                                    $('#errores').text(errorcode);
                                    clearTimeout(clear);
                                    fclear();
                                    break;
                                case 1:
                                    ShowToast("success", 'ETIQUETA ANULADA CORRECTAMENTE  - ', lst[0].Colaborador);
                                    $(document).ready(function () {
                                        var snd = new Audio("../sound/ok.mp3");
                                        snd.play();
                                    });
                                    leidos = leidos + 1;
                                    $('#correcto').text(leidos);
                                    $('#msg').text('ETIQUETA ANULADA'+ lst[0].Colaborador);

                                    if (lst[0].Labor == 'S') {
                                        ss = ss + 1;
                                    } else if (lst[0].Labor == 'E') {
                                        ee = ee + 1;
                                    }

                                    labval = lst[0].Labor;
                                    clearTimeout(clear);
                                    fclear();
                                    break;
                                default:
                                    toastr["error"]('Error Desconocido', 'ERROR...');
                                    $(document).ready(function () {
                                        var snd = new Audio("../sound/error.mp3");
                                        snd.play();
                                    });
                                //$('#msg').text('ERROR...');
                                //clearTimeout(clear);
                                //fclear();
                            }

                        },
                        error: function (error) {
                            if (error.status == '401') {
                                window.location.reload();
                            } else {
                                alert(JSON.stringify(error));
                            }
                        }
                    });

                }
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
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
