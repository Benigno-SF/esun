<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_AsistenciaRegi.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_AsistenciaRegi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link rel="icon" type="image/png" href="../Img/favicon.ico" />

    <title>ASISTENCIA | SUNFRUITS</title>
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

        .hiddeMouse {
            cursor: none;
        }

        .barra-iconos {
            top: 8px;
            padding: 15px;
        }

        .btn {
            border: none !important;
        }

        .alto-Minimo {
            min-height: 70px;
        }

        .FuenteAviso {
            font-weight: bold;
            font-size: 24px;
        }
        
		.btn-circle.btn-md { 
            width: 50px;
            height: 50px;
            padding: 5px 5px;
            border-radius: 25px;
            font-size: 10px;
            text-align: center;
		} 
    </style>
</head>
<body>
    <div class="barra-iconos">
        <span ><i class="fas fa-archway pl-2 pt-2" style="left: 8px"></i> <b id="NomDisp"></b> <button id="btnchange" class="btn btn-sm btn-success border-1 small shadow ml-2" title="cambiar ubicacion" style="display: none"><i class="fa fa-refresh" aria-hidden="true"></i></button></span>
        <button type="button" id="btnNetwork" class="btn btn-outline-success" style="position: fixed; right: 8px" data-valid="-1"><i class="fas fa-network-wired fa-lg"></i></button>
    </div>

    <div class="container">
        <div class="row justify-content-md-center">
            <div class="col-md-auto text-center">
                <h1 class="display-4">
                    <img src="../Img/e-sun_logo_l.png" alt="logo" /></h1>
            </div>
        </div>
        <div id="DivDispositivo" style="display: none">
            <div class="form-group p-0 m-0">
                      <div class="row justify-content-md-center pt-4">
                        <div class="col-md-3 text-center">
                                <div class="p-1 bg-lightshadow-sm mb-4">
                                        <label for="country">Dispositivo:</label>
                                        <select class="custom-select d-block w-100" id="ddlDispositivo" name="ddlDispositivo" required="">
                                        </select>
                                </div>   
                        </div>
                    </div>
                    <div class="row justify-content-md-center">
                      <div class="col-md-3 text-center">
                                <div class="p-1 bg-lightshadow-sm mb-4">
                            <button id="btnDispositivo" class="btn btn-success btn-lg border-1 shadow" >aceptar</button>
                                </div>   
                        </div>
                    </div>
            </div>
        </div>
        <div id="DivAsistencia" style="display: none">
            <div class="row justify-content-md-center pt-2">
                <div class="col-md-auto text-white text-center">
                    <span id="TipoMarcaText" style="font-size: 2rem"></span> - <span id="thora" style="font-size: 2rem"></span>
                </div>
            </div>
            <div class="row justify-content-md-center pt-2">
                <div class="col-md-auto text-center">
                    <form id="form-asis" name="form-asis">
                        <div class="p-1 bg-light rounded rounded-pill shadow-sm mb-4">
                            <div class="input-group input-group-lg">
                                <div class="input-group-prepend">
                                    <button id="button-addon2" type="submit" class="btn btn-link text-warning"><i class="fa fa-search"></i></button>
                                </div>
                                <input type="text" id="txtCodigo" class="form-control border-0 rounded-pill bg-light num" placeholder="PASE SU FOTOCHECK..." required="required" autocomplete="off" />
                                <input type="hidden" id="Dispositivo" value="0"/>
                                <input type="hidden" id="TipoMarca" value="0"/>
                             </div>

                        </div>   
                    </form>
                    <button type="button" class="btn btn-lg btn-success border-1 large shadow ml-2 ingreso">INGRESO</button> <button type="button" class="btn btn-lg btn-danger border-1 large shadow ml-2 salida">SALIDA</button>
                </div>

            </div>
            <div class="row justify-content-md-center pt-3 alto-Minimo">
                <div id="msg" class="col-md-auto text-center FuenteAviso">
                </div>
            </div>
        </div>
        <div class="row justify-content-md-center">
                <button id="btnaceptar" class="btn btn-success btn-lg border-1 shadow" style="display: none">aceptar</button>
        </div>
    </div>
    <div class="container">
        <div class="row py-5">
            <div class="col-lg-4 mx-auto text-white text-center">
                <br />
                <p class="lead mb-0">esun</p>
                <br />
                <div id="dats">

                </div>
            </div>
        </div>
    </div>
    <script>

        let myVar = setInterval(myTimer, 1000);

        function myTimer() {
            const date = new Date();
            const time_locale = date.toLocaleTimeString('en-US');

            const formatted = `${time_locale}`;
            document.getElementById("thora").innerHTML = formatted;
           // document.getElementById("tfecha").innerHTML = String(d.getDate()).padStart(2, '0') + '/' + String(d.getMonth() + 1).padStart(2, '0') + '/' + d.getFullYear();
        }


        function LoadDispositivo() {
            var obj = new Object();
            obj.vnIdDispositivo = '0';
            $.ajax({
                type: 'POST',
                url: "SerApp.asmx/DispositivoList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    var option = "";
                    $("#ddlDispositivo").html('');
                    option += '<option value="0">Seleccione Dispositivo</option>';
                    for (i = 0; i < lst.length; ++i) {
                        option += '<option value="' + lst[i].nIdDispositivo + '">' + lst[i].cNombre + '</option>';
                    }
                    $("#ddlDispositivo").html(option);
                }, error: function (data) {
                    alert(JSON.stringify(data));
                }
            })
        }

        window.addEventListener("offline", function (e) {
            $("#btnNetwork").removeClass("btn-outline-success");
            $("#btnNetwork").addClass("btn-outline-danger");
            $('#msg').html('Revise su conexión');
            $("#txtCodigo").focus();
        });

        // Add event listener online to detect network recovery.
        window.addEventListener("online", function (e) {
            $("#btnNetwork").removeClass("btn-outline-danger");
            $("#btnNetwork").addClass("btn-outline-success");
            $("#msg").html("");
            $("#txtCodigo").focus();
        });
        var vnEstatus = -1;
        $('#form-asis').on('keyup keypress', function (e) {
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
            document.getElementById("txtCodigo").autofocus;
        });

        var clear;
        function fclear(seg) {
            clear = setTimeout("limpiar()", seg);
        }
        function limpiar() {
            $('#msg').html("");
            $("#btnaceptar").hide();
            $('#form-asis').show();
            document.getElementById("txtCodigo").autofocus;
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
                       // AsisteciaSend();

                       SearchUser();
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

        $(document).on('click', '#btnaceptar', function (event) {
            event.preventDefault();
            document.getElementById("txtCodigo").autofocus;
            clearTimeout(clear);
            fclear(0);
        });

        
        $(document).on('click', '#btnchange', function (event) {
            event.preventDefault();
            var id = getCookie("IdDisp");
            var name = getCookie("NomDisp");
            deleteCookie("IdDisp", id);
            deleteCookie("NomDisp", name);
            $('#NomDisp').text('');
            $('#Dispositivo').val('0');
            $('#DivDispositivo').show();
            $('#DivAsistencia').hide();
            $('#btnchange').hide();
            LoadDispositivo();
        });

        $(document).on('click', '#btnDispositivo', function (event) {
            event.preventDefault();
            id = $("#ddlDispositivo option:selected").val();
            name = $("#ddlDispositivo option:selected").html();
            if (id != '0' && name != 'Seleccione Dispositivo') {
                setCookie("IdDisp", id, 1);
                setCookie("NomDisp", name, 1);
                checkCookie();
                $('#btnchange').show();
            } else {
                alert('SELECCIONE UBICACION')
            }
        });

        $(document).on('click', '.ingreso', function (event) {
            event.preventDefault();
            $('#TipoMarca').val(1);
            $('#TipoMarcaText').text('INGRESO');
        });

        $(document).on('click', '.salida', function (event) {
            event.preventDefault();
            $('#TipoMarca').val(2);
            $('#TipoMarcaText').text('SALIDA');
        });

        function SearchUser() {
            var obj = new Object();
            obj.vcIdEmpresa = 'iOSoj9CXOnnbgHw5p9jlfQ==';
            obj.vnIdPersonal = 0;
            obj.vcNroDocumento = $("#txtCodigo").val();
            obj.vcNombres = '';
            obj.vcIdPlanilla = '';
            obj.vcCodigoLabor = '';
            if (obj.vcNroDocumento != '' && obj.vcNroDocumento.length == 8) {
                $.ajax({
                    type: 'POST',
                    url: "SerApp.asmx/SearchUser",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        if (lst != "") {
                            AsisteciaSend();

                        } else {


                            var urlphp = "http://204.199.164.92/reniec/index.php?dni=" + obj.vcNroDocumento;
                            $.ajax({
                                type: 'POST',
                                url: urlphp,
                                // data: { obj: query2, urlrv: urlsag },
                                dataType: 'json',
                                beforeSend: function () {
                                    $("#msg").html('<img src="lupx.gif" width="100" alt="loading" /><br /> ACCEDIENDO RENIEC, BUSCANDO INFORMACION');
                                },
                                success: function (data1) {
                                    if (data1 != '') {
                                        if (data1[0].success == true) {

                                            $('#nombres').val();
                                            $('#a_paterno').val();
                                            $('#a_materno').val();
                                            if (data1[0].data.nombres == '') {
                                                alert('Agregue la Informacion Manualmente', 'INFORMACION NO ENCONTRADA');
                                            } else {

                                                var obj = new Object();
                                                obj.vcIdEmpresa = 'iOSoj9CXOnnbgHw5p9jlfQ==';
                                                obj.vnIdPersonal = 0;
                                                obj.vcNroDocumento = data1[0].data.numero;
                                                obj.vcApPaterno = data1[0].data.apellido_paterno;
                                                obj.vcApMaterno = data1[0].data.apellido_materno;
                                                obj.vcNombres = data1[0].data.nombres;
                                                obj.vcCodigoControl = '';
                                                obj.vcIdPlanilla = 'OAC';
                                                obj.vcGrupoTrabajo = 'E';
                                                obj.vcIdCodigoGeneral = data1[0].data.numero;
                                                obj.vcCodigoLabor = 'E';
                                                obj.vbEstado = true;
                                                obj.vcCodHisp = '';
                                                obj.vbEstadoRegi = true;
                                                if (data1[0].data.sexo === 'Femenino') {
                                                    obj.vcSexo = 'F';
                                                } else if (data1[0].data.sexo === 'Masculino') {
                                                    obj.vcSexo = 'M';
                                                }
                                                var fnac = data1[0].data.fecha_nacimiento;
                                                var nuevaStr = fnac.replaceAll("-", "/");
                                                var f = new Date();
                                                var hoy = zeroFill(f.getDate(), 2) + "/" + zeroFill((f.getMonth() + 1), 2) + "/" + f.getFullYear();
                                                obj.vcFechaNacimiento = nuevaStr;
                                                obj.vcFechaRegistro = hoy;

                                                $.ajax({
                                                    type: 'POST',
                                                    url: "SerApp.asmx/RegiPersonal",
                                                    data: JSON.stringify({ obj: obj }),
                                                    dataType: 'json',
                                                    contentType: 'application/json; charset=utf-8',
                                                    success: function (data) {
                                                        AsisteciaSend();
                                                        $("#msg").html('');
                                                    },
                                                    error: function (error) {
                                                        alert(JSON.stringify(error))
                                                    }
                                                });
           
                                            }
                                        } else {
                                            alert('error');
                                        }
                                    }
                                },
                                error: function (error) {
                                    alert(JSON.stringify(error));
                                }
                            });

                        }

                    },
                    error: function (error) {
                        alert(JSON.stringify(error));
                    }
                });

            } else {
                alert('Ingrese un Numero de DNI valido', 'Error en N° de DNI');
                //clear();
            }

        };

        function AsisteciaSend(dni = null, disp = null, tmarca = null) {
            var obj = new Object();
            if (dni == null) {
                dni = $("#txtCodigo").val();
            }
            if (disp == null) {
                disp = $("#Dispositivo").val();
            }
            if (tmarca == null) {
                tmarca = $("#TipoMarca").val();
            }
            obj.vcNroDocumento = dni;
            obj.vnIdDispositivo = disp;
            obj.vnTipoMarca = tmarca;

            if (obj.vnTipoMarca == '0' && obj.vnIdDispositivo != '58') {
                $("#txtCodigo").val('');
                alert('SELECCIONE TIPO DE MARCA, INGRESO O SALIDA');
                return
            }

            if (obj.vcNroDocumento != '' && obj.vcNroDocumento.length >= 8) {
                $.ajax({
                    type: 'POST',
                    url: "SerApp.asmx/RegitrarAsistencia",
                    //url: "SerApp.asmx/GetPersonExt",
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
                        var lst = JSON.parse(data.d)
                        var marc = '';
                       // alert(JSON.stringify(lst));
                        $('#form-asis')[0].reset();
                        var vdFecha = lst[0].dFechaRegistro;
                        if (lst[0].cNombresApellidos != null) {
                            var vcNombres = lst[0].cNombresApellidos;
                        } else {
                            var vcNombres = '';
                            //var vcNombres = "POR FAVOR ACERCARSE A RRHH PARA COMPLETAR SUS DATOS";
                        }
                        var vnVal = lst[0].nEstado * 1;

                        switch (vnVal) {
                            case -1:
                                $("#msg").html(vcNombres + "<br />" + vdFecha + "<br /> YA REGISTRO INGRESO");
                                $(document).ready(function () {
                                    var snd = new Audio("../sound/ok.mp3");
                                    snd.play();
                                });

                                clearTimeout(clear);
                                fclear(3000);

                                //marc += '<div class="card text-white bg-success mb-1" style="max-width: 30rem;padding: 5px;border-radius: 20px;"><table style="width: 100 %;"><tr>';
                                //marc += '<td style="width: 20%;"><button type="button" class="btn btn-secondary btn-circle btn-md"><i class="fa fa-user" style="font-size: 3rem"></i></button> </td>';
                                //marc += '<td style="width: 80%;"><span><b>' + vcNombres + '</b></span><br /><span><b>' + vdFecha + '</b></span></td></tr></table</div>';
                                //$('#dats').prepend(marc);

                                break;
                            case 0:
                                //$("#msg").html("Fue Registrado <br /> " + vdFecha + "<br />BIENVENIDO ACERCARSE A RRHH A COMPLETAR EL PROCESO");
                                $("#msg").html(vcNombres+" <br />Fue Registrado <br /> " + vdFecha + "<br />BIENVENIDO");
                                $(document).ready(function () {
                                    var snd = new Audio("../sound/ok.mp3");
                                    snd.play();
                                });
                                clearTimeout(clear);
                                fclear(3000);
                                //$('#btnaceptar').show();
                                //$('#form-asis').hide();

                                marc += '<div class="card text-white bg-success mb-1" style="max-width: 30rem;padding: 5px;border-radius: 20px;"><table style="width: 100 %;"><tr>';
                                marc += '<td style="width: 20%;"><button type="button" class="btn btn-secondary btn-circle btn-md"><i class="fa fa-user" style="font-size: 3rem"></i></button> </td>';
                                marc += '<td style="width: 80%;"><span><b>' + vcNombres + '</b></span><br /><span><b>' + vdFecha + '</b></span></td></tr></table</div>';
                                $('#dats').prepend(marc);

                                break;
                            case 1:
                                $("#msg").html(vcNombres + "<br /> " + vdFecha + "<br />BIENVENIDO");
                                $(document).ready(function () {
                                    var snd = new Audio("../sound/ok.mp3");
                                    snd.play();
                                });
                                clearTimeout(clear);
                                fclear(3000);

                                marc += '<div class="card text-white bg-success mb-1" style="max-width: 30rem;padding: 5px;border-radius: 20px;"><table style="width: 100 %;"><tr>';
                                marc += '<td style="width: 20%;"><button type="button" class="btn btn-secondary btn-circle btn-md"><i class="fa fa-user" style="font-size: 3rem"></i></button> </td>';
                                marc += '<td style="width: 80%;"><span><b>' + vcNombres + '</b></span><br /><span><b>' + vdFecha + '</b></span></td></tr></table</div>';
                                $('#dats').prepend(marc);

                                break;
                            case 3:
                                $("#msg").html(vcNombres + "<br /> " + vdFecha + "<br /> USTED NO PUEDE INGRESAR");
                                $(document).ready(function () {
                                    /*var snd = new Audio("../sound/alerta.mp3");*/
                                    var snd = new Audio("../sound/ok.mp3");
                                    snd.loop = true;
                                    snd.play();
                                    var ttx = setTimeout(function () { snd.pause(); }, 4000);
                                });
                                //$('#btnaceptar').show();
                                //$('#form-asis').hide();
                                //break;
                                clearTimeout(clear);
                                fclear(3000);

                                break;
                            case 4:
                                $("#msg").html(vcNombres + "<br /> " + vdFecha + "<br />BIENVENIDO REINGRESANTE");
                                $(document).ready(function () {
                                    var snd = new Audio("../sound/ok.mp3");
                                    snd.play();
                                });
                                //$('#btnaceptar').show();
                                //$('#form-asis').hide();
                                //break;
                                clearTimeout(clear);
                                fclear(3000);

                                marc += '<div class="card text-white bg-success mb-1" style="max-width: 30rem;padding: 5px;border-radius: 20px;"><table style="width: 100 %;"><tr>';
                                marc += '<td style="width: 20%;"><button type="button" class="btn btn-secondary btn-circle btn-md"><i class="fa fa-user" style="font-size: 3rem"></i></button> </td>';
                                marc += '<td style="width: 80%;"><span><b>' + vcNombres + '</b></span><br /><span><b>' + vdFecha + '</b></span></td></tr></table</div>';
                                $('#dats').prepend(marc);

                                break;
                            case 5:
                                $("#msg").html("ERROR EN DOCUMENTO Y O TARJETA,POR FAVOR ACERQUESE A RRHH");
                                $(document).ready(function () {
                                    var snd = new Audio("../sound/error.mp3");
                                    snd.play();
                                });
                                //$('#btnaceptar').show();
                                //$('#form-asis').hide();
                                //break;
                                clearTimeout(clear);
                                fclear(3000);
                                break;
                            default:
                                $("#msg").text("ERROR...");
                                break;


                        }

                        document.getElementById("txtCodigo").autofocus;

                    }, error: function (xhr) { // if error occured
                        var lest = JSON.stringify(xhr);
                        alert('error');
                        //alert(lest[0]["readyState"]);
                    }, complete: function (xhr) { // if error occured
                        var lest = JSON.stringify(xhr);
                        //alert('alert');
                        document.getElementById("txtCodigo").autofocus;
                        //alert(lest[0]["readyState"]);
                    }
                });
            } else {
                $("#txtCodigo").val('');
                document.getElementById("txtCodigo").autofocus;
            }
        }

        //$(document).ready(function () {
        //    $('.num').keyup(function () {
        //        if (isNaN(this.value) == true) {
        //            ShowToast('error', '', 'Solo se permiten numeros');
        //        }
        //        this.value = (this.value + '').replace(/[^0-9^-]/g, '');

        //    });
        //});

        function setCookie(cname, cvalue, exdays) {
            var d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            var expires = "expires=" + d.toGMTString();
            document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
        }

        function deleteCookie(cname, cvalue) {
            document.cookie = cname + "=" + cvalue + "; expires=Thu, 01 Jan 1970 00:00:00 UTC;path=/";
        }

        function getCookie(cname) {
            var name = cname + "=";
            var decodedCookie = decodeURIComponent(document.cookie);
            var ca = decodedCookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }

        function checkCookie() {
            var id = getCookie("IdDisp");
            var name = getCookie("NomDisp");
            if (id != "" && name != "") {
                $('#NomDisp').text(name);
                $('#Dispositivo').val(id);
                $('#DivDispositivo').hide();
                $('#DivAsistencia').show();
                $('#btnchange').show();
                $("#txtCodigo").focus();
            } else {
                $('#NomDisp').text('');
                $('#Dispositivo').val('0');
                $('#DivDispositivo').show();
                $('#DivAsistencia').hide();
                $('#btnchange').hide();
                LoadDispositivo();
            }
        }
        checkCookie();

        function zeroFill(number, width) {
            width -= number.toString().length;
            if (width > 0) {
                return new Array(width + (/\./.test(number) ? 2 : 1)).join('0') + number;
            }
            return number + ""; // siempre devuelve tipo cadena
        }
    </script>
</body>
</html>
