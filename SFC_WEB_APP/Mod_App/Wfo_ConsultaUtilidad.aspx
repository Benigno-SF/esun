<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_ConsultaUtilidad.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_ConsultaUtilidad" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="../Img/favicon.ico" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <title>UTILIDAD SF | SUNFRUITS</title>
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
            min-height: 50vh;
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
            position: absolute;
            top: 0px;
            right: 0px;
            text-align: right;
        }

        .btn {
            border: none !important;
        }

        .footer {
            position: fixed;
            left: 0px;
            bottom: 0px;
            height: 30px;
            width: 95%;
        }
    </style>
  
</head>
<body>
    <div class="barra-iconos">
        <img src="../Img/e-sun_logo-min.png" style="width: 50%; opacity: 0.5;" alt="logo" />
    </div>
    <div class="container">
        <div class="row justify-content-md-center">
            <div class="col-md-auto text-center pt-4">
                <h1 class="display-4">
                    <img src="../Img/sf-logo.png" alt="logo" height="100" /></h1>
            </div>
        </div>
        <div class="row justify-content-md-center pt-2">
            <div class="col-md-auto text-center">
                <form id="ConsultUtility" name="ConsultUtility" method="post">
                    <div class="col-md-auto text-white text-center">
                        <p class="lead mb-0">Numero de Documento (DNI,CX)</p>
                    </div>
                    <div class="p-0 bg-light rounded rounded-pill shadow-sm mb-2">
                        <div class="input-group input-group-lg">
                            <input type="text" id="NroDocumento" class="form-control border-0 rounded-pill bg-light text-center p-0" required="required" autocomplete="off" onkeypress="return soloNumeros(event)" style="font-size: 1.5rem" />
                        </div>
                    </div>
                    <div class="col-md-auto text-white text-center">
                        <p class="lead mb-0">Fecha de Nacimiento</p>
                    </div>
                    <div class="p-1 bg-light shadow-sm mb-2">
                        <div class="row p-0 m-0">
                            <div style="width: 30%">
                                <select id="diafn" name="dia" class="form-control border-0 bg-light text-center" style="font-size: 1.3rem;">
                                    <option value="00">Dia</option>
                                    <option value="01">01</option>
                                    <option value="02">02</option>
                                    <option value="03">03</option>
                                    <option value="04">04</option>
                                    <option value="05">05</option>
                                    <option value="06">06</option>
                                    <option value="07">07</option>
                                    <option value="08">08</option>
                                    <option value="09">09</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                </select>
                            </div>
                            <div style="width: 45%">
                                <select id="mesfn" name="mesfn" class="form-control border-0 bg-light text-center" style="font-size: 1.3rem;">
                                    <option value="00">Mes</option>
                                    <option value="01">Enero</option>
                                    <option value="02">Febrero</option>
                                    <option value="03">Marzo</option>
                                    <option value="04">Abril</option>
                                    <option value="05">Mayo</option>
                                    <option value="06">Junio</option>
                                    <option value="07">Julio</option>
                                    <option value="08">Agosto</option>
                                    <option value="09">Setiembre</option>
                                    <option value="10">Octubre</option>
                                    <option value="11">Noviembre</option>
                                    <option value="12">Diciembre</option>
                                </select>
                            </div>
                            <div style="width: 25%">
                                <select id="aniofn" name="aniofn" class="form-control border-0  bg-light text-center" style="font-size: 1.3rem;">
                                    <option value="0000">Año</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="p-0 bg-light rounded rounded-pill shadow-sm mt-4">
                        <div class="input-group input-group-lg">
                            <input type="button" id="btnConsultar" class="form-control border-0 rounded-pill bg-light btn-success" value="consultar" />
                        </div>
                    </div>
                </form>
            </div>
            <div id="success" style="display: none" class="col-md-6">
                <div class="col-md-auto text-center mt-4">
<%--                    <p class="lead mb-3 font-weight-bold text-white" id="name"></p>
                    <p class="lead mb-3 font-weight-bold" id="message"></p>
                    <p class="lead mb-3 font-weight-bold">BANCO: <span id="banco" class="text-white"></span></p>
                    <p class="lead mb-3 font-weight-bold" id="cc">CUENTA: <span id="cuenta" class="text-white"></span></p>
                    <p class="lead mb-3 font-weight-bold" id="mm">MONTO: <span id="monto" class="text-white"></span></p>
                    <div class="p-0 bg-light rounded rounded-pill shadow-sm mt-4">
                        <div class="input-group input-group-lg">
                            <input type="button" class="form-control border-0 rounded-pill bg-light btn-danger volver" value="volver" />
                        </div>
                    </div>--%>
                </div>
            </div>
            <div id="error" style="display: none" class="col-md-6">
                <div class="col-md-auto text-white text-center">
                    <p class="lead mb-0" id="messageerror"></p>
                    <p class="lead mb-0">GRACIAS</p>
                    <div class="p-0 bg-light rounded rounded-pill shadow-sm mt-4">
                        <div class="input-group input-group-lg">
                            <input type="button" class="form-control border-0 rounded-pill bg-light btn-danger volver" value="volver" />
                        </div>
                    </div>
                </div>
            </div>
            <div id="mdes" class="col-md-6" style="display: none">
                <div class="col-md-auto text-white text-center">
                    <p class="lead mb-0">ESTE SERVICIO ESTARA ACTIVO DESDE EL 25 DE ABRIL DEL 2021</p>
                </div>
            </div>
            <div id="repx" class="col-md-12" style="display: none">
                <div class="row col-md-8 justify-content-md-center  pb-5" style="margin: auto">
                    <div class="col-md-4" id="div-boton">
                        <div class="p-0 bg-light rounded rounded-pill shadow-sm">
                            <div class="input-group input-group-lg">
                                <input type="button" id="btn-Send" class="form-control border-0 rounded-pill bg-light btn-success" value="Enviar Correo" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8" style="font-size: 1.5rem; text-align: -webkit-center;">
                        <span id="mail" style="font-size: 1.2rem;font-weight: bold;"></span><br />
                            <input type="button" id="btn-No-Email" class="form-control border-0 rounded-pill bg-light btn-danger m-1 p-1" style="width: 150px; font-size: 0.8rem; display: none;" value="No es tu correo? Click Aqui" />
                            <input type="text" id="Email_New" class="form-control border-0 rounded-pill bg-light text-center p-0" placeholder="INGRESE CORREO ELECRONICO" />
                    </div>
                </div>
                <div class="row col-md-8 pb-5" style="margin: auto">
                        <p class="lead mb-2 font-weight-bold text-white" id="name"></p><br />
                        <p class="lead mb-2 font-weight-bold" id="message"></p><br />
                        <p class="lead mb-2 font-weight-bold">BANCO: <span id="banco" class="text-white"></span></p>&nbsp;<br />
                        <p class="lead mb-2 font-weight-bold" id="cc">CUENTA: <span id="cuenta" class="text-white"></span></p>
                </div>
                <div style="height: 100vh; display: block; margin: auto" class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                    <table style="width: 100%; background-color: white; margin: auto; /*width:670px; height: 921px*/">
                        <tbody>
                            <tr>
                                <td style="padding: 0px 20px 0px 20px">
                                    <br />
                                    <table style="width: 100%; font-size: 0.8rem;">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <span style="font-weight: bold; font-size: 0.8rem">SUN FRUITS EXPORTS S.A.</span>
                                                    <br />
                                                    0494586810
                                                    <br />
                                                    CALLE CONTRALMIRANTE MONTERO NRO. 411 - INT. 404 - URB. CAMPO DE POLO - 
                                                </td>
                                                <td style="text-align: right">
                                                    <img src="../Img/sf-logo.png" alt="logo" style="width: 150px" />
                                                </td>
                                            </tr>
                                            <tr class="text-center">
                                                <td colspan="2">
                                                    <br />
                                                    <span style="font-weight: bold; font-size: 1rem; font-family: 'PRVPIC+CIDFont+F2'">PARTICIPACIÓN EN LAS UTILIDADES POR EL EJERCICIO GRAVABLE<br />
                                                        AÑO 2021</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 0px 20px 0px 20px">
                                                    <br />
                                                    <table>
                                                        <tr>
                                                            <td>APELLIDOS Y NOMBRES</td>
                                                            <td>&nbsp;</td>
                                                            <td id="vc1"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>D.N.I. Nº</td>
                                                            <td>&nbsp;</td>
                                                            <td id="vc2"></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding: 0px 20px 0px 20px">
                                                    <br />
                                                    El presente documento contiene el detalle del cálculo de la participación de Utilidades de acuerdo DL Nº 892
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding: 0px 20px 0px 20px">
                                                    <br />
                                                    <table style="width: 100%; border: 1px; border-color: black; border-style: outset; padding: 0px 20px 0px 20px; font-size: 0.7rem">
                                                        <tbody style="padding: 20px; display: block">
                                                            <tr style="width: 100%; display: table;">
                                                                <td style="width: 80%">1. Renta anual de la empresa entes de impuestos </td>
                                                                <td style="width: 10%">S/.</td>
                                                                <td id="vc3" style="width: 20%; text-align: right;"></td>
                                                            </tr>
                                                            <tr style="width: 100%; display: table;">
                                                                <td style="width: 80%">2. Participación a distribuir 5% de la Renta Neta </td>
                                                                <td style="width: 10%">S/.</td>
                                                                <td id="vc4" style="width: 20%; text-align: right"></td>
                                                            </tr>
                                                            <tr style="width: 100%; display: table;">
                                                                <td style="width: 80%">3. Días laborados por todos los trabajadores en el año 2021 (enero - diciembre)  </td>
                                                                <td style="width: 10%">S/.</td>
                                                                <td id="vc5" style="width: 20%; text-align: right;"></td>
                                                            </tr>
                                                            <tr style="width: 100%; display: table;">
                                                                <td style="width: 80%">4. Días laborados por el trabajador en el año 2021 (enero - diciembre) </td>
                                                                <td style="width: 10%">S/.</td>
                                                                <td id="vc6" style="width: 20%; text-align: right"></td>
                                                            </tr>
                                                            <tr style="width: 100%; display: table;">
                                                                <td style="width: 80%">5. Remuneraciones percibidas por todos los trabajadores en el año 2021 (enero - diciembre)</td>
                                                                <td style="width: 10%">S/.</td>
                                                                <td id="vc7" style="width: 20%; text-align: right"></td>
                                                            </tr>
                                                            <tr style="width: 100%; display: table;">
                                                                <td style="width: 80%">6. Remuneraciones percibidas por el trabajador en el año 2021 (enero - diciembre)</td>
                                                                <td style="width: 10%">S/.</td>
                                                                <td id="vc8" style="width: 20%; text-align: right"></td>
                                                            </tr>
                                                            <tr style="width: 100%; display: table;">
                                                                <td style="width: 80%">7. A distribuir por los dias laborados en el año 2021 (enero - diciembre)</td>
                                                                <td style="width: 10%">S/.</td>
                                                                <td id="vc9" style="width: 20%; text-align: right"></td>
                                                            </tr>
                                                            <tr style="width: 100%; display: table;">
                                                                <td style="width: 80%">8. A distribuir por las remuneraciones percibidas en el año 2021 (enero - diciembre)</td>
                                                                <td style="width: 10%">S/.</td>
                                                                <td id="vc10" style="width: 20%; text-align: right"></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding: 0px 20px 0px 20px">
                                                    <br />
                                                    <table style="width: 100%; border: 1px; border-color: black; border-style: outset; padding: 0px 20px 0px 20px; font-size: 0.7rem">
                                                        <tbody style="padding: 20px; display: block">
                                                            <tr style="width: 100%; display: table;">
                                                                <td style="width: 80%; font-size: 1rem; font-weight: bold; font-family: 'PRVPIC+CIDFont+F2'">LIQUIDACIÓN DE LA PARTICIPACIÓN DE UTILIDADES
                                                                    <br />
                                                                </td>
                                                                <td style="width: 10%"></td>
                                                                <td id="" style="width: 20%; text-align: right;"></td>
                                                            </tr>
                                                            <tr style="width: 100%; display: table;">
                                                                <td style="width: 80%"><span id="calc1"></span></td>
                                                                <td style="width: 10%">S/.</td>
                                                                <td id="vc11" style="width: 20%; text-align: right"></td>
                                                            </tr>
                                                            <tr style="width: 100%; display: table;">
                                                                <td style="width: 80%"><span id="calc2"></span></td>
                                                                <td style="width: 10%">S/.</td>
                                                                <td id="vc12" style="width: 20%; text-align: right;"></td>
                                                            </tr>
                                                            <tr style="width: 100%; display: table;">
                                                                <td style="width: 80%">3. Por S/. Retención de Renta de Quinta Categoría</td>
                                                                <td style="width: 10%">S/.</td>
                                                                <td id="vc13" style="width: 20%; text-align: right"></td>
                                                            </tr>
                                                            <tr style="width: 100%; display: table;">
                                                                <td style="width: 80%">4. Por S/. Otros descuentos</td>
                                                                <td style="width: 10%">S/.</td>
                                                                <td id="vc14" style="width: 20%; text-align: right"></td>
                                                            </tr>
                                                            <tr style="width: 100%; display: table;">
                                                                <td style="width: 80%; font-size: 0.9rem; font-weight: bold; font-family: 'PRVPIC+CIDFont+F2'; text-align: center">TOTAL A PAGAR</td>
                                                                <td style="width: 10%; border-top: outset;">S/.</td>
                                                                <td id="vc15" style="width: 20%; text-align: right; border-top: outset;"></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <table style="width: 100%; border: 1px; border-color: black; border-bottom: outset; border-left: outset; border-right: outset; padding: 0px 20px 0px 20px; font-size: 0.7rem">
                                                        <tbody style="padding: 20px; display: block">
                                                            <tr style="width: 100%; display: table;">
                                                                <td style="font-size: 0.8rem;">Por el presente declaro estar conforme con la presente liquidación de participación de utilidades del periodo 2021 la misma que suscribo en señal de aceptación y plena conformidad, ya que la misma ha sido revisada por mi persona, no teniendo motivo o concepto por el cual reclamar.
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding: 20px 20px 20px 20px; text-align: right" id="vc16"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <br />
                                                    <table style="width: 100%; border: 1px; border-color: black; padding: 0px 20px 0px 20px; font-size: 0.7rem">
                                                        <tbody style="padding: 20px;">
                                                            <tr style="width: 100%; display: table; text-align: center">
                                                                <td style="width: 50%">
                                                                    <img src="pdf/firmaacc.png" width="100" />
                                                                </td>
                                                                <td style="width: 50%">&nbsp;</td>
                                                            </tr>
                                                            <tr style="width: 100%; display: table; text-align: center; font-size: 0.9rem">
                                                                <td style="width: 50%;">
                                                                    <hr style="width: 50%;">
                                                                    SUN FRUITS EXPORTS S.A
                                                                </td>
                                                                <td style="width: 50%;">&nbsp;<hr style="width: 50%;">
                                                                    <span id="vc17"></span>
                                                                    <br />
                                                                    <span id="vc18"></span>&nbsp<br />
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td>&nbsp;
                                                    <input type="hidden" id="EmName"/>
                                                    <input type="hidden" id="EmCodigo"/>
                                                    <input type="hidden" id="EmEmail"/>
                                                    <input type="hidden" id="EmDetalle" value="1"/>
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                   <div class="col-md-4 bg-light rounded rounded-pill shadow-sm mt-4 mb-5" style="margin-left:auto; margin-right: auto">
                        <div class="input-group input-group-lg">
                            <input type="button" class="form-control border-0 rounded-pill bg-light btn-danger volver" value="volver" />
                        </div>
                    </div>
            </div>
            <div class="text-right footer">
                © Area TI - Sun Fruits Exports
            </div>
        </div>
    </div>

    

    <script type="text/javascript">


        emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;

        function sendemail(tip) {
            var obj = new Object();
            obj.vcNombre = $("#EmName").val();
            obj.vcCodigo = $("#EmCodigo").val();
            obj.vcEmail = $("#EmEmail").val();
            obj.vnDetalle = $("#EmDetalle").val();
            obj.vcAsuntoEmail = 'ACTUALIZACION CORREO PERSONAL ' + $("#EmName").val() + ' ' + obj.vcCodigo.substr(-8, 8);
            obj.vcMensaje = '<span style="font-size: 16px; font-wigth: bold">Nombre:' + ' ' + $("#EmName").val() + '<br>DNI: ' + obj.vcCodigo.substr(-8, 8) + ' <br /> Nuevo Correo a Actualizar : ' + $("#Email_New").val() + '</span>';
            if ($("#Email_New").val() == '') {
                var mailn = obj.vcEmail;
            } else {
                var mailn = $("#Email_New").val();
            }
            if (emailRegex.test(mailn)) {
                $.ajax({
                    type: 'POST',
                    url: "SerApp.asmx/SendMail",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        if (tip == 2) {
                            $('#btn-Send').hide();
                            $('#mail').text('MENSAJE ENVIADO');
                            $("#EmEmail").hide();
                            $('#Email_New').hide();
                        }
                        alert(JSON.stringify(data));
                    }, error: function (data) {
                        alert(JSON.stringify(data));
                    }
                });
            } else {
                $('#Email_New').show();
                $('#btn-No-Email').hide();
                alert('CORREO INVALIDO, POR FAVOR COUNICARSE CON RECURSOS HUMANOS');
            };
        }

        $("#btn-Send").on('click', function () {
            if ($("#Email_New").val() != '') {
                sendemail(2);
            } else {
                alert('INGRESE UN CORREO VALIDO')
            }
        })


        $("#btn-No-Email").on('click', function () {
            $('#Email_New').show();
            $('#btn-No-Email').hide();
            $('#mail').text('INGRESE CORREO PARA ACTUALIZAR');
            $("#EmEmail").val('recursoshumanos@sunfruits.com.pe');
            $("#btn-Send").val('Enviar a RRHH');
            $("#EmDetalle").val('2');
        })




        function fileExists(url) {
            if (url) {
                var req = new XMLHttpRequest();
                req.open('GET', url, false);
                req.send();
                return req.status == 200;
            } else {
                return false;
            }
        }


        $('#NroDocumento').on('keydown keypress', function (e) {
            if (e.key.length === 1) { // Evaluar si es un solo caracter
                if ($(this).val().length < 9 && !isNaN(parseFloat(e.key))) {
                    $(this).val($(this).val() + e.key);
                }
                return false;
            }
        });
        function soloNumeros(e) {
            var key = window.Event ? e.which : e.keyCode
            return (key >= 48 && key <= 57)
        }
        $(".volver").click(function () {
            limpiarmsg();
        });
        $("#btnConsultar").click(function () {
            var obj = new Object();
            obj.vcNroDocumento = $("#NroDocumento").val();

            if ($("#diafn").val() != '00' && $("#mesfn").val() != '00' && $("#aniofn").val() != '0000') {
                obj.vcFechaNacimiento = $("#diafn").val() + '/' + $("#mesfn").val() + '/' + $("#aniofn").val();
            } else {
                obj.vcFechaNacimiento = ''
            }

            obj.vnEstado = 1;
            if (obj.vcNroDocumento != '' && obj.vcFechaNacimiento != "") {
                $.ajax({
                    type: 'POST',
                    url: "SerApp.asmx/ConsultaUtilidad",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        if (lst != "") {
                            switch (lst[0].rpta) {
                                case 0:
                                    $('#ConsultUtility')[0].reset();
                                    $("#messageerror").text(lst[0].msj);

                                    $("#ConsultUtility").hide();
                                    $("#success").hide();
                                    $("#error").show();
                                    limpiarform();
                                    break;
                                case 1:
                                    //$('#ConsultUtility')[0].reset();
                                    $("#name").text(lst[0].trabajador);
                                    $("#message").text(lst[0].msj);
                                    $("#banco").text(lst[0].banco);
                                    if (lst[0].cuenta != "") {
                                        $("#cc").show();
                                        $("#cuenta").text(lst[0].cuenta);
                                    } else {
                                        $("#cc").hide();
                                    }
                                    //$("#monto").text(lst[0].monto);

                                    //$("#ConsultUtility").hide();
                                    //$("#success").show();
                                    //$("#error").hide();
                                    //limpiarform();

                                    $("#EmName").val(lst[0].trabajador);
                                    if (lst[0].email != '' & lst[0].email != 'rrhh@sunfruits.com.pe' & lst[0].email != 'sferrhh@gmail.com') {
                                        $("#mail").text(lst[0].email);
                                        $('#div-boton').show();
                                        $('#btn-No-Email').show();
                                        $('#Email_New').hide();
                                        $("#btn-Send").val('Enviar Correo');

                                        $("#EmEmail").val(lst[0].email);
                                        $("#EmDetalle").val(1);
                                    } else {
                                        $("#mail").text('USTED NO TIENE CORREO REGISTRADO, POR FAVOR INGRESE SU CORREO PARA PORDER ACTUALIZARLO');
                                        $('#div-boton').show();
                                        $('#btn-No-Email').hide();
                                        $('#Email_New').show();
                                        $("#btn-Send").val('Enviar a RRHH');

                                        $("#EmEmail").val('recursoshumanos@sunfruits.com.pe');
                                        $("#EmDetalle").val(2);
                                    }

                                    cargaplantilla(lst[0].dni, lst[0].email);
                                    $('#ConsultUtility')[0].reset();
                                    $("#ConsultUtility").hide();
                                    $("#success").hide();
                                    $("#error").hide();
                                    $("#repx").show();
                                    break;
                                default:
                                    $("#ConsultUtility").hide();
                                    $("#messageerror").text('ERROR');
                                    $("#success").hide();
                                    $("#error").show();
                                    limpiarform();
                                    break;
                            }
                        } else {
                            $("#ConsultUtility").hide();
                            $("#success").hide();
                            $("#error").show();
                            limpiarform();
                        }
                    },
                    error: function (error) {
                        alert(JSON.stringify(error))
                    }
                });
            } else {
                alert('Complete los Datos, Por Favor');
            }
        });


        function cargaplantilla(dni, email) {
            var obj = new Object();
            obj.vcCodigo = dni;

            if (obj.vcCodigo != null) {
                $.ajax({
                    type: 'POST',
                    url: "SerApp.asmx/RepUtilidad",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var tmp = JSON.parse(data.d);
                        if (tmp != '') {

                            $("#vc1").html(tmp[0].APENOM);
                            $("#vc2").html(tmp[0].DNI);
                            $("#vc3").html(formatNumber.new(tmp[0].RENTA.toFixed(2)));
                            $("#vc4").html(formatNumber.new(tmp[0].IMPORTE_REPARTIR.toFixed(2)));
                            $("#vc5").html(formatNumber.new(tmp[0].DIAS_TODOS));
                            $("#vc6").html(tmp[0].DIAS_TRABAJADOR);
                            $("#vc7").html(formatNumber.new(tmp[0].REMUNERACION_TODOS.toFixed(2)));
                            $("#vc8").html(formatNumber.new(tmp[0].REMUNERACION_TRABAJADOR.toFixed(2)));
                            $("#vc9").html(formatNumber.new(tmp[0].DISTRIBUIR_DIAS.toFixed(2)));
                            $("#vc10").html(formatNumber.new(tmp[0].DISTRIBUIR_REMUNERACION.toFixed(2)));
                            $("#vc11").html(formatNumber.new(tmp[0].INGRESO_XDIA.toFixed(2)));
                            $("#vc12").html(formatNumber.new(tmp[0].INGRESO_XREMUNE.toFixed(2)));
                            $("#vc13").html(formatNumber.new(tmp[0].RENTA.toFixed(2)));
                            $("#vc14").html(formatNumber.new(tmp[0].DESCUENTOS.toFixed(2)));
                            $("#vc15").html(formatNumber.new(tmp[0].UTILIDAD_NETA.toFixed(2)));
                            var meses = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
                            var f = new Date();
                            // $("#vc16").html('Ica,' + ' ' + f.getDate() + " de " + meses[f.getMonth()] + " de " + f.getFullYear());
                            $("#vc16").html('Ica, 08 de Abril de 2022');
                            $("#vc17").html(tmp[0].APENOM);
                            $("#vc18").html(tmp[0].DNI);

                            //calculo
                            $("#calc1").html('1. Por ' + tmp[0].DIAS_TRABAJADOR + ' dia(s) laborados (' + formatNumber.new(tmp[0].DISTRIBUIR_DIAS.toFixed(2)) + ' x ' + tmp[0].DIAS_TRABAJADOR + ' / ' + formatNumber.new(tmp[0].DIAS_TODOS) + ')');
                            $("#calc2").html('2. Por S/. ' + formatNumber.new(tmp[0].DIAS_TODOS) + ' de remuneraciones percibidas (' + formatNumber.new(tmp[0].DISTRIBUIR_REMUNERACION.toFixed(2)) + ' x ' + formatNumber.new(tmp[0].REMUNERACION_TRABAJADOR.toFixed(2)) + ' / ' + formatNumber.new(tmp[0].REMUNERACION_TODOS.toFixed(2)) + ' ') + ')';

                            $("#EmCodigo").val(tmp[1].pdf);
                            $("#repx").show();
                            if (email != '' && email != null) {
                                sendemail(1);
                            }
                        } else {
                            $('#ConsultUtility')[0].reset();
                            $("#messageerror").text('USTED NO ACCEDE AL PAGO DE UTILIDADES, CASO CONTRARIO VERIFIQUE LOS DATOS INGRESADOS');

                            $("#ConsultUtility").hide();
                            $("#success").hide();
                            $("#error").show();
                            limpiarform();
                        }

                    },
                    error: function (error) {
                        alert(JSON.stringify(error))
                    }
                });
            } else {
                alert('Complete los Datos, Por Favor');
            }
        };





        function ComboAno() {
            var selectfn = document.getElementById("aniofn");
            for (var i = 2003; i >= 1940; i--)selectfn.options.add(new Option(i, i));
        };
        ComboAno();
        var clearform;
        var clear;
        function fclear(seg) {
            clearform = setTimeout("limpiarform()", seg);
        }
        function mclear(seg) {
            clear = setTimeout("limpiarmsg()", seg);
        }

        function limpiarform() {
            $("#NroDocumento").val("");
            $("#diafn").val("00");
            $("#mesfn").val("00");
            $("#aniofn").val("0000");
        };

        function limpiarmsg() {
            $("#name").text("");
            $("#message").text("");
            $("#messgeerror").text("");
            $("#banco").text("");
            $("#cuenta").text("");

            $("#ConsultUtility").show();
            $("#success").hide();
            $("#error").hide();


            $('#btn-No-Email').hide();
            $('#Email_New').hide();
            $("#btn-Send").val('Enviar Correo');

            $("#EmEmail").val('');
            $("#EmDetalle").val(2);
            $("#EmCodigo").val('');
            $("#repx").hide();

            $("#vc1").html('');
            $("#vc2").html('');
            $("#vc3").html('');
            $("#vc4").html('');
            $("#vc5").html('');
            $("#vc6").html('');
            $("#vc7").html('');
            $("#vc8").html('');
            $("#vc9").html('');
            $("#vc10").html('');
            $("#vc11").html('');
            $("#vc12").html('');
            $("#vc13").html('');
            $("#vc14").html('');
            $("#vc15").html('');
            $("#vc16").html('');
            $("#vc17").html('');
            $("#vc18").html('');

            //calculo
            $("#calc1").html('');
            $("#calc2").html('');

        }

        function JSONDate(dateStr) {
            var m, day;
            jsonDate = dateStr;
            var d = new Date(parseInt(jsonDate.substr(6)));
            m = d.getMonth() + 1;
            if (m < 10)
                m = '0' + m
            if (d.getDate() < 10)
                day = '0' + d.getDate()
            else
                day = d.getDate();
            return (day + '/' + m + '/' + d.getFullYear())
        }

        function JSONDateWithTime(dateStr) {
            jsonDate = dateStr;
            var d = new Date(parseInt(jsonDate.substr(6)));
            var m, day;
            m = d.getMonth() + 1;
            if (m < 10)
                m = '0' + m
            if (d.getDate() < 10)
                day = '0' + d.getDate()
            else
                day = d.getDate();
            var formattedDate = day + "/" + m + "/" + d.getFullYear();
            var hours = (d.getHours() < 10) ? "0" + d.getHours() : d.getHours();
            var minutes = (d.getMinutes() < 10) ? "0" + d.getMinutes() : d.getMinutes();
            var formattedTime = hours + ":" + minutes + ":" + d.getSeconds();
            formattedDate = formattedDate + " " + formattedTime;
            return formattedDate;
        }

        var formatNumber = {
            separador: ",", // separador para los miles
            sepDecimal: '.', // separador para los decimales
            formatear: function (num) {
                num += '';
                var splitStr = num.split('.');
                var splitLeft = splitStr[0];
                var splitRight = splitStr.length > 1 ? this.sepDecimal + splitStr[1] : '';
                var regx = /(\d+)(\d{3})/;
                while (regx.test(splitLeft)) {
                    splitLeft = splitLeft.replace(regx, '$1' + this.separador + '$2');
                }
                return this.simbol + splitLeft + splitRight;
            },
            new: function (num, simbol) {
                this.simbol = simbol || '';
                return this.formatear(num);
            }
        }

    </script>
</body>
</html>

