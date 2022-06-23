<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_LecturaPacking.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_LecturaPacking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Tickets</title>
    <%: Styles.Render("~/Content/css") %>
    <%: Scripts.Render("~/jquery") %>
    <script src="../Scripts/toastr.js"></script>
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
            font-size: 20px;
        }




                .bodyx {
            color: lawngreen;
            background-color: #212529 !important;
        }
                .divt {
            padding: 0px;
            background-color: coral;
            color: white;
            padding: 3px;
        }

        .divc {
            border-left: solid;
            border-right: solid;
            border-color: coral;
            height: 80vh;
            padding: 0px;
        }

        .right {
            float: right;
        }

        .tbRend {
            font-size: 16px;
        }

        .tbRend td {
            border-bottom: 1px solid white;
            font-size: 14px;
        }

        .tittleth {
            color: grey;
        }
    </style>
</head>
<body class="hiddeMouse">
    <div class="barra-iconos">
        <button type="button" id="btnNetwork" class="btn btn-outline-success" data-valid="-1"><i class="fas fa-network-wired fa-lg"></i></button>
    </div>
    <div class="">
        <div class="row">
            <div class="col-3">
                <div class="row justify-content-md-center pt-4">
                    <div class="col-md-auto text-center">
                        <h1 class="display-6">
                            <img src="../Img/e-sun_logo_l.png" alt="logo" /></h1>
                    </div>
                </div>
                <div class="row justify-content-md-center p-4">
                    <div class="col-md-auto text-white text-center">
                        <p class="lead mb-10">leer </p>
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
                                    <input type="text" id="txtCodigo" class="form-control border-0 rounded-pill bg-light" placeholder="Identifiquese..." autocomplete="off" autofocus="" onblur="this.focus()" required="required" onkeypress="return validar(event)" />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row justify-content-md-center pt-3 alto-Minimo">
                    <div id="msg" class="col-md-auto text-center FuenteAviso">
                    </div>
                </div>
                <br />
                    C:<span id="correcto"></span>&nbsp;E:<span id="errores"></span>&nbsp;R:<span id="releidos"></span>
            </div>
            <div class="col-9">
                <div>
                    <div class="row bodyx">
                        <div class="col-6" style="font-size: 16px; display: none" id="divsel">
                            <div class="row m-2">
                                <div class="col-9">Selección</div>
                                <div class="col-3">Total: <span id="lblCaSeleccion" class="text-warning"></span></div>
                            </div>
                            <div class="m-2">
                                <table id="tblSeleccion" style="text-align: center; margin-bottom: 0px; width: 100%" class="tbRend">
                                    <thead class="tittleth">
                                        <tr>
                                            <th>#</th>
                                            <th style='text-align: left;'>Colaborador</th>
                                            <th>Cajas</th>
                                            <th>Clamshell</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody class="text-white">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-6" style="font-size: 16px; display: none" id="divemb">
                            <div class="row m-2">
                                <div class="col-9">Embalaje</div>
                                <div class="col-3">Total: <span id="lblCaEmbalaje" class="text-warning"></span></div>
                            </div>
                            <div class="m-2">
                                <table id="tblEmbalaje" style="text-align: center; margin-bottom: 0px; width: 100%;" class="tbRend">
                                    <thead class="tittleth">
                                        <tr>
                                            <th>#</th>
                                            <th style='text-align: left;'>Colaborador</th>
                                            <th>Cajas</th>
                                            <th>Clamshell</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody class="text-white">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-6" style="font-size: 16px; display: none" id="divcla">
                            <div class="row m-2">
                                <div class="col-9">Clamshell</div>
                                <div class="col-3">Total: <span id="lblCaClamshell" class="text-warning"></span></div>
                            </div>
                            <div class="m-2">
                                <table id="tblClamshell" style="text-align: center; margin-bottom: 0px; width: 100%;" class="tbRend">
                                    <thead class="tittleth">
                                        <tr>
                                            <th>#</th>
                                            <th style='text-align: left;'>Colaborador</th>
                                            <th>Cajas</th>
                                            <th>Clamshell</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody class="text-white">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
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
        var ss = 0
        var ee = 0


        var leidos = 0;
        var errorcode = 0;
        var releidos = 0;
        var codex = '';

        window.addEventListener("offline", function (e) {
            $("#btnNetwork").removeClass("btn-outline-success");
            $("#btnNetwork").addClass("btn-outline-danger");
            $('#msg2').html('Revise su conexión');
        });

        // Add event listener online to detect network recovery.
        window.addEventListener("online", function (e) {
            $("#btnNetwork").removeClass("btn-outline-danger");
            $("#btnNetwork").addClass("btn-outline-success");
            $("#msg2").html("");
        });
        var vnEstatus = -1;

        var result = new Array;
        var list = ['192.168.20.5'];

        $(document).ready(function () {
            $("#txtCodigo").focus();
        });
   


        $("#txtCodigo").on("blur", function () {
            var blurEl = $(this);
            setTimeout(function () {
                blurEl.focus()
            }, 10);
        });

        var clear;
        function fclear() {
            clear = setTimeout("limpiar()", 2000);
            $('#txtCodigo').focus();
        }

        function limpiar() {
            $('#msg').html("");
        }

        function LoadData() {
            var obj = new Object();
            obj.vnIdMonitor = 41;
             obj.vcFecha = '';
             if (obj.vnIdMonitor != -1) {
                 $.ajax({
                     //cache: false,
                     type: 'POST',
                     url: "SerApp.asmx/ListMonitorRendimiento_Mod",
                     data: JSON.stringify({ obj: obj }),
                     dataType: 'json',
                     contentType: 'application/json; charset=utf-8',
                     success: function (data) {
                         var lst = JSON.parse(data.d);
                         //alert(JSON.stringify(lst))
                         var vvEmb = "";
                         var vvSel = "";
                         var vvCla = "";
                         var vnEmb = 0;
                         var vnSel = 0;
                         var vnCla = 0;
                         var Emb = 1;
                         var Sel = 1;
                         var Cla = 1;
                         //lst[i].cLabor
                         for (i = 0; i < lst.length; ++i) {
                             if (lst[i].cLabor == "E") {
                                 var Embal = Emb++;
                                 vvEmb += "<tr><td>" + Embal + "</td><td style='text-align: left;'>" + lst[i].Nombre + "</td><td>" + lst[i].cajas + "</td><td>" + lst[i].clamshell + "</td><td><b>" + lst[i].total + "<b></td></tr>";
                                 vnEmb += lst[i].total
                             } else if (lst[i].cLabor == "S") {
                                 var Selec = Sel++;
                                 vvSel += "<tr><td>" + Selec + "</td><td style='text-align: left;'>" + lst[i].Nombre + "</td><td>" + lst[i].cajas + "</td><td>" + lst[i].clamshell + "</td><td><b>" + lst[i].total + "<b></td></tr>";
                                 vnSel += lst[i].total
                             } else if (lst[i].cLabor == "C") {
                                 var Clam = Cla++;
                                 vvCla += "<tr><td>" + Clam + "</td><td style='text-align: left;'>" + lst[i].Nombre + "</td><td>" + lst[i].cajas + "</td><td>" + lst[i].clamshell + "</td><td><b>" + lst[i].total + "<b></td></tr>";
                                 vnCla += lst[i].total
                             }
                         }
                         if (vnEmb != 0) {
                             $("#tblEmbalaje tbody").html(vvEmb);
                             $("#divemb").show();
                         } else {
                             $("#divemb").hide();
                         }

                         if (vnSel != 0) {
                             $("#tblSeleccion tbody").html(vvSel);
                             $("#divsel").show();
                         } else {
                             $("#divsel").hide();
                         }

                         if (vnCla != 0) {
                             $("#tblClamshell tbody").html(vvCla);
                             $("#divcla").show();
                         } else {
                             $("#divcla").hide();
                         }

                         $("#lblCaEmbalaje").html('<b>' + vnEmb + '</b>');
                         $("#lblCaSeleccion").html('<b>' + vnSel + '</b>');
                         $("#lblCaClamshell").html('<b>' + vnCla + '</b>');

                         Emb = null;
                         Sel = null;

                         vnEmb = null
                         vnSel = null
                         vvEmb = null
                         vvSel = null

                         lst = null
                     },
                     error: function (error) {
                         toastr.error(JSON.stringify(error), '');
                     }
                 });
             }
             obj = null
        }
        
        setInterval(LoadData, 2000);

        function validar(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 13) {
                $("#txtCodigo").click();
            }
            return (tecla != 13);
        }

        var labval = '';
        $("#txtCodigo").click(function () {
            var obj = new Object();
            CodeBar = $("#txtCodigo").val();
            
            if (CodeBar.length != 19) {
                $('#msg').html('Error en Codigo');
                $('#txtCodigo').val('');
                $('#txtCodigo').focus();
                errorcode = errorcode + 1;
                $('#txtCodigo').html(errorcode);
              
               // return false;
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
                        url: "SerApp.asmx/RegiRendProcRegistro_Mod",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            $('#txtCodigo').val('');
                            vnVal = lst[0].IdRendPack * 1;
                            if (lst[0].IdProceso != 0)
                                switch (vnVal) {
                                    case -3:
                                        ShowToast("error", "Proceso Cerrado");
                                        $(document).ready(function () {
                                            var snd = new Audio("../sound/error.mp3");
                                            snd.play();
                                        });
                                        clearProceso();
                                        clearTimeout(clear);
                                        fclear();
                                        break;
                                    case -2:
                                        ShowToast("error", "Error! " + lst[0].Colaborador);
                                        $(document).ready(function () {
                                            var snd = new Audio("../sound/error.mp3");
                                            snd.play();
                                        });
                                        errorcode = errorcode + 1;
                                        $('#errores').text(errorcode);
                                        clearTimeout(clear);
                                        fclear();
                                        break;
                                    case 0:
                                        ShowToast("warning", 'Error! Etiqueta Ya fue Leida', lst[0].Colaborador);
                                        $(document).ready(function () {
                                            var snd = new Audio("../sound/error.mp3");
                                            snd.play();
                                        });
                                        $('#msg').html('Error! Etiqueta Ya fue Leida de ' + lst[0].Colaborador);
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
                                        ShowToast("success", 'LECTURA CORRECTA', lst[0].Colaborador);
                                        $(document).ready(function () {
                                            var snd = new Audio("../sound/ok.mp3");
                                            snd.play();
                                        });
                                        leidos = leidos + 1;
                                        $('#correcto').text(leidos);
                                        $('#msg').html(lst[0].Colaborador + '- CORRECTO');

                                        if (lst[0].Labor == 'S') {
                                            ss = ss + 1;
                                        } else if (lst[0].Labor == 'E') {
                                            ee = ee + 1;
                                        }
                                        dif = ee - ss;
                                        if (dif != 0) {
                                            ShowToast("info", "Error...", "ETIQUETA FALTANTE SEL=" + ss + " - EMB=" + ee);
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
                            else {
                                ShowToast("error", "Error...", "No tiene un proceso aperturado");
                                document.getElementById("CodeBar").autofocus;
                            }
                        },
                        error: function (error) {
                            if (error.status == '401') {
                                //window.location.reload();
                            } else {
                                alert(JSON.stringify(error));
                            }
                        }
                    });
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
