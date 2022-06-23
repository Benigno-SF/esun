<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_PrintGuia.aspx.cs" Inherits="SFC_WEB_APP.Mod_Agro.Wfo_PrintGuia" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%: Scripts.Render("~/jquery") %>
    <%--    <script src="../Scripts/qrcode.js"></script>--%>
    <script src="../Scripts/JsBarcode.code128.min.js"></script>
    <%--    <script src="https://parzibyte.github.io/ticket-js/3/script.js"></script>--%>

    <style type="text/css">
        .tabled {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 255px;
            font-size: 14px;
            margin-bottom: 8px;
            display:grid;
        }

            .tabled td, .tabled th {
                border: 0.1px solid black;
                padding: 4px;
            }

            .tabled tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .tabled tr:hover {
                background-color: #ddd;
            }

            .tabled th {
                padding-top: 6px;
                padding-bottom: 6px;
                text-align: left;
                /*background-color: #04AA6D;*/
                color: black;
            }

        /*head*/

        .tableth {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
            font-size: 14px;
            margin-bottom: 8px;
            border: 0.1px solid black;
        }

            .tableth td, .tableth th {
                border: 0.1px solid black;
                padding: 4px;
            }

            .tableth th {
                padding-top: 6px;
                padding-bottom: 0px;
                text-align: left;
                background-color: #04AA6D;
                color: white;
            }

        .centrado {
            text-align: center;
            align-content: center;
        }

        .ticket {
            width: 255px;
            max-width: 255px;
        }

        img {
            max-width: inherit;
            width: inherit;
        }

        @media print {
            .oculto-impresion,
            .oculto-impresion * {
                display: none !important;
            }

            #botones {
                display: none !important;
            }
        }

        .buttonimp {
              background-color: #4CAF50; /* Green */
              border: none;
              color: white;
              padding: 15px 32px;
              text-align: center;
              text-decoration: none;
              display: inline-block;
              font-size: 16px;
            }
        .buttonclose{
              background-color: #4CAF50; /* Green */
              border: none;
              color: white;
              padding: 15px 32px;
              text-align: center;
              text-decoration: none;
              display: inline-block;
              font-size: 16px;
            }
    </style>
</head>

<body>
    <div class="ticket" id="ticket" style="display: none">
        <center>
        <img src="http://esun.sunfruits.com.pe/IMG/sf-logo.PNG" style="width: 60%; text-align: center" alt="Logotipo">
            
        </center>

        <table class="tableth" style="width: 100%">
            <tbody>
                <tr>
                    <td colspan="2">
                        <center><span style="font-weight: bold; font-size: 11px">SUN FRUITS EXPORTS S.A.<br> <span id="RUC_EMISOR"></span></span></center>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center; font-weight: bold; font-size: 14px; width: 50%">GUÍA DE REMISIÓN
                        <br />
                        ELECTRÓNICA</td>
                    <td style="text-align: center; font-weight: bold; font-size: 16px; width: 50%"><span id="SERIE"></span>-<span id="NUMERO"></span> </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <center><svg id="barcode"></svg></center>
                    </td>
                </tr>
            </tbody>
        </table>

        <table class="tableth">
            <tbody>
                <tr>
                    <td style="text-align: left; font-weight: bold; width: 50%">Fecha de Emision: <span id="FECHAEMISION"></span></td>
                    <td style="text-align: right; font-weight: bold; width: 50%">Fecha de traslado: <span id="FECHATRASLADO"></span></td>
                </tr>
            </tbody>
        </table>

        <table class="tableth">
            <tbody>
                <tr>
                    <td style="text-align: left; font-weight: bold; width: 50%">Destinatario: </td>
                    <td style="text-align: right"><span id="DESTINATARIO"></span></td>
                </tr>
                <tr>
                    <td style="text-align: left; font-weight: bold; width: 50%">Ruc:</td>
                    <td style="text-align: right"><span id="IDCLIEPROVDEST"></span></td>
                </tr>
                <tr>
                    <td style="text-align: left; font-weight: bold; width: 50%">Localidad: </td>
                    <td style="text-align: right"><span id="LOCALIDAD"></span></td>
                </tr>
            </tbody>
        </table>

        <table class="tableth">
            <tbody>
                <tr>
                    <td style="text-align: left; width: 50%"><b>Punto de Partida: </b>
                        <br />
                        <span id="INICIO"></span></td>
                </tr>
                <tr>
                    <td style="text-align: left; width: 50%"><b>Punto de llegada: </b>
                        <br />
                        <span id="LLEGADA"></span></td>
                </tr>
            </tbody>
        </table>

        <table class="tableth">
            <tbody>
                <tr>
                    <td colspan="2" style="text-align: center; font-weight: bold; width: 50%">EMPRESA DE TRANSPORTE </td>
                </tr>
                <tr>
                    <td style="text-align: left; font-weight: bold; width: 50%">Razon Social:</td>
                    <td style="text-align: right"><span id="EMPRESADETRANSPORTE"></span></td>
                </tr>
                <tr>
                    <td style="text-align: left; font-weight: bold; width: 50%">Número de Ruc:</td>
                    <td style="text-align: right"><span id="RUCTRANSPORTE"></span></td>
                </tr>
            </tbody>
        </table>

        <table class="tableth">
            <tbody>
                <tr>
                    <td colspan="2" style="text-align: center; font-weight: bold">UNIDAD DE TRANSPORTE Y CONDUCTOR </td>
                </tr>
                <tr>
                    <td style="text-align: left; font-weight: bold; width: 50%">Número Placa:</td>
                    <td style="text-align: right; width: 50%"><span id="PLACA"></span></td>
                </tr>
                <tr>
                    <td style="text-align: left; font-weight: bold; width: 50%">Marca de Vehículo:</td>
                    <td style="text-align: right; width: 50%"><span id="VEHICULO"></span></td>
                </tr>
                <tr>
                    <td style="text-align: left; font-weight: bold; width: 50%">Certificado de Inscripción:</td>
                    <td style="text-align: right; width: 50%"><span id="CERTIFICADOTRANSPORTE"></span></td>
                </tr>
                <tr>
                    <td style="text-align: left; font-weight: bold; width: 50%">Conductor:</td>
                    <td style="text-align: right; width: 50%"><span id="CONDUCTOR"></span></td>
                </tr>
                <tr>
                    <td style="text-align: left; font-weight: bold; width: 50%">Licencia de Conducir:</td>
                    <td style="text-align: right; width: 50%"><span id="LICENCIA"></span></td>
                </tr>
            </tbody>
        </table>

        <table style="text-align: center" class="tabled" id="Productos">
            <tbody>
            </tbody>
        </table>

        <table class="tableth">
            <tbody>
                <tr>
                    <td style="text-align: left; font-weight: bold">Glosa:<br />
                        <span id="GLOSA"></span></td>
                </tr>
            </tbody>
        </table>

        <table class="tableth">
            <tbody>
                <tr>
                    <td style="text-align: left; font-weight: bold">Motivo del Traslado:  </td>
                    <td style="text-align: right"><span id="MOTIVOTRASLADO"></span></td>
                    <tr>
                <tr>
                    <td style="text-align: left; font-weight: bold">Peso Total: </td>
                    <td style="text-align: right"><span id="pesototal"></span></td>
                </tr>
                <tr>
                    <td style="text-align: left; font-weight: bold">N° Bultos:</td>
                    <td style="text-align: right"><span id="cantidadtotal"></span></td>
                </tr>
                <tr>
                    <td style="text-align: left; font-weight: bold">Modalidad Traslado:</td>
                    <td style="text-align: right"><span id="MODALIDADTRANSPORTE"></span></td>
                </tr>
                <tr>
                    <td style="text-align: left; font-weight: bold">DAM:</td>
                    <td style="text-align: right">0000-00-000-000000
                    </td>
                </tr>
<%--                <tr>
                    <td colspan="2" style="text-align: center;">
                        <br />
                        <div id="qrcode"></div>
                        <br />
                    </td>
                </tr>--%>
            </tbody>
        </table>
        <table class="tableth">
            <tbody>
                <tr>
                    <td>
                        Sello 1:<br />
                        <div style="width: 128px; height: 128px;"></div>
                        <br />
                    </td>
                <tr>
              </tbody>
         </table>
         <table class="tableth">
            <tbody>
                <tr>
                    <td>
                        Sello 2:<br />
                        <div style="width: 128px; height: 128px;"></div>
                        <br />
                    </td>
                <tr>
              </tbody>
         </table>
    </div>
    <br />
    <div class="ticket" id="botones">
        <center>
    <button class="oculto-impresion button" onclick="imprimir()">Imprimir</button> - <button class="close button" onclick="cerrar()">Cerrar</button>
        </center>
    </div>
    <br />
    <div id="msg">
    </div>

    <script>
        window.addEventListener("load", function () {

            // if (getParameterByName('Gre')) {
            var obj = new Object();
            obj.vcIdEmpresa = getParameterByName('Cd');
            obj.vcidingresosalidaalm = getParameterByName('Gre');
            obj.vcserie = '';
            obj.vcnumero = '';
            if (obj.vcIdEmpresa != "" && obj.vcidingresosalidaalm != '0') {

                $.ajax({
                    type: 'POST',
                    url: "../SerAgro.asmx/PrintGuiaRemision",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst.length != '0') {
                            $('#msg').html('');

                            $('#EMPRESA').text(lst[0].EMPRESA);
                            $('#RUC_EMISOR').text(lst[0].RUC_EMISOR);
                            $('#SERIE').text(lst[0].SERIE);
                            $('#NUMERO').text(lst[0].NUMERO);

                            $('#barcode').html('');
                            JsBarcode("#barcode", lst[0].SERIE + "-" + lst[0].NUMERO, {
                                width: 1.5,
                                height: 30,
                                displayValue: false
                            });

                            $('#FECHAEMISION').text(lst[0].FECHAEMISION);
                            $('#FECHATRASLADO').text(lst[0].FECHATRASLADO);

                            $('#IDCLIEPROVDEST').text(lst[0].IDCLIEPROVDEST);
                            $('#DESTINATARIO').text(lst[0].DESTINATARIO);
                            $('#LOCALIDAD').text(lst[0].LOCALIDAD);

                            $('#INICIO').text(lst[0].INICIO);
                            $('#LLEGADA').text(lst[0].LLEGADA);

                            $('#EMPRESADETRANSPORTE').text(lst[0].DES_TRANSPORTE);
                            $('#RUCTRANSPORTE').text(lst[0].RUC_TRANSPORTE);

                            $('#PLACA').text(lst[0].PLACA + '|' + lst[0].PLACA1);
                            $('#VEHICULO').text(lst[0].MARCA + '|' + lst[0].MARCA1);
                            $('#CERTIFICADOTRANSPORTE').text(lst[0].CERTIFTRANSPORTE + '|' + lst[0].CERTIFTRANSPORTE1);
                            $('#CONDUCTOR').text(lst[0].CHOFER);
                            $('#LICENCIA').text(lst[0].BREVETE);


                            var glosabook = '<span>';

                            if (lst[0].BOOKING != null) {
                                glosabook += 'BOOKING: ' + lst[0].BOOKING + '<br />';
                            }

                            if (lst[0].CONTENEDOR != null) {
                                glosabook += 'CONTENEDOR: ' + lst[0].CONTENEDOR + '<br />';
                            }

                            glosabook += lst[0].GLOSA + '</span>';


                            $('#GLOSA').html(glosabook);


                            $('#MODALIDADTRANSPORTE').text(lst[0].idmodalidad_transporte + ' - ' + lst[0].modalidad_transporte);
                            $('#MOTIVOTRASLADO').text(lst[0].IDMOTIVO_TRASLADO_SUNAT + ' - ' + lst[0].MOTIVOTRASLADO);


                            // Generate and Output QR Code
                            //var txtcd = lst[0].QR;
                            //$('#qrcode').qrcode({ width: 128, height: 128, text: txtcd });
                            //$('#txtcode').text(txtcd);

                            var pesototal = 0;
                            var cantidadtotal = 0;
                            var vrow = '';
                            vrow += '<tr><td><b>Descripcion</b></td> <td colspan="2"><b>Cant./ U.M./ Peso</b></td><tr>';
                            for (i = 0; i < lst.length; ++i) {

                                // += "";
                                //vrow += "<td class='vcitem'>" + lst[0].ITEM + "</td>";
                                vrow += "<tr><td rowspan='3'>" + lst[i].DESCRIPCION + "<hr><b>Lote:</b>" + lst[i].IDCONSUMIDOR+ "</td><td style=''>C:</td>";
                                vrow += "<td>" + (formatNumber.new(lst[i].CANTIDAD.toFixed(2))) + "</td></tr>";
                                vrow += "<tr><td style=''>U:</td><td>" + lst[i]['U.M'] + "</td></tr>";
                                vrow += "<tr><td style=''>P:</td><td>" + (formatNumber.new(lst[i].PESO.toFixed(2))) + "</td></tr>";
                                //vrow += "<td class='vcprecio'>" + vcprecio + "</td>";
                                //vrow += "<td class='vcimporte'>" + vcimporte + "</td>";
                                //vrow += "</tr>"

                                pesototal = pesototal + lst[i].PESO;
                                cantidadtotal = cantidadtotal + lst[i].CANTIDAD;
                            }

                            $("#pesototal").html(formatNumber.new(pesototal.toFixed(2)));
                            $("#cantidadtotal").html(formatNumber.new(cantidadtotal.toFixed(2)));
                            $("#Productos tbody").html(vrow);

                            $('.ticket').show();
                            imprimir();
                        } else {
                            $('.ticket').hide();
                        }
                    },
                    error: function (error) {
                        console.log(JSON.stringify(error));
                    }
                });

            } else {
                $('.ticket').hide();
                $('#msg').html('Guia no Encontrada');
                setTimeout('cerrar()', 5000);
            }
            // ....
        });
        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        function cerrar() {
            var ventana = window.self;
            ventana.opener = window.self;
            ventana.close();
        }

        function imprimir() {
            window.print();
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
<loom-container id="lo-engage-ext-container"><div></div><loom-shadow classname="resolved"></loom-shadow></loom-container>
</html>
