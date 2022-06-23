<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_FichaSC19.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_FichaSC19" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link rel="icon" type="image/png" href="../Img/favicon.ico" />

    <title>FICHA C19 | SUNFRUITS</title>
    <%: Styles.Render("~/Content/css") %>
    <%: Scripts.Render("~/jquery") %>
    <link rel="stylesheet" type="text/css" href="../Content/toastr.css" />
    <script type="text/javascript" src="../Scripts/toastr.js"></script>
    <script type="text/javascript" src="../Scripts/toastr.min.js"></script>
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
            height: 100%;
            background: radial-gradient(at right,#bacad0 -100%,#9d9e54);
            /*background: #ffd89b;
            background: -webkit-linear-gradient(to right, #ffd89b, #19547b);
            background: linear-gradient(to right, #ffd89b, #19547b);
            min-height: 100vh;*/
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

        .alto-Minimo {
            min-height: 70px;
        }

        .FuenteAviso {
            font-weight: bold;
            font-size: 24px;
        }

        .img-mob {
            width: 300px;
            -webkit-filter: drop-shadow(0.1px 0.1px 3px #fff);
            filter: drop-shadow(0.1px 0.1px 3px #fff);
        }

        @media only screen and (max-width: 600px) {
            .img-mob {
                width: 200px;
            }
        }

        table {
            font-weight: bold
        }

        .switch-field {
            display: flex;
            /*margin-bottom: 36px;*/
            overflow: hidden;
        }

            .switch-field input {
                position: absolute !important;
                clip: rect(0, 0, 0, 0);
                height: 1px;
                width: 1px;
                border: 0;
                overflow: hidden;
            }

            .switch-field label {
                background-color: #e4e4e4;
                color: rgba(0, 0, 0, 0.6);
                font-size: 14px;
                line-height: 1;
                text-align: center;
                padding: 8px 16px;
                margin-right: -1px;
                border: 1px solid rgba(0, 0, 0, 0.2);
                box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.3), 0 1px rgba(255, 255, 255, 0.1);
                transition: all 0.1s ease-in-out;
            }

                .switch-field label:hover {
                    cursor: pointer;
                }

            .switch-field input:checked + label {
                background-color: #a5dc86;
                box-shadow: none;
            }

            .switch-field label:first-of-type {
                border-radius: 4px 0 0 4px;
            }

            .switch-field label:last-of-type {
                border-radius: 0 4px 4px 0;
            }

        /* This is just for CodePen. */

        .form {
            max-width: 600px;
            font-family: "Lucida Grande", Tahoma, Verdana, sans-serif;
            font-weight: normal;
            line-height: 1.625;
            margin: 8px auto;
            padding: 16px;
        }

        h2 {
            font-size: 18px;
            margin-bottom: 8px;
        }

        .tablex {
        }

            .tablex th, .tablex td {
                padding: 0.75rem;
                border-top: 1px solid #dee2e6;
                border-bottom: 1px solid #e3ebf3;
                vertical-align: middle;
            }

        .rpta {
            border-color: darkcyan;
            border: solid 1px #ffff;
            vertical-align: middle;
            background: #a7ac7b;
            font-size: 1.5rem;
            width: 10%;
            text-align: center;
        }

        .error_i {
              color: #ff0000;
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
        <button type="button" id="btnNetwork" class="btn btn-outline-success" style="right: 8px" data-valid="-1"><i class="fas fa-network-wired fa-lg"></i></button>
    </div>
    <div class="container">
        <div class="row justify-content-md-center">
            <div class="col-md-auto text-center">
                <h1 class="display-4">
                    <img src="../Img/sf-logo.png" alt="logo" class="img-mob" /></h1>
            </div>
        </div>
        <div id="DivVerificar" style="/*display: none*/">
            <div id="titlex" class="row justify-content-md-center pt-2">
                <div class="col-md-6 text-white text-center">
                    <p class="lead mb-0">IDENTIFICACION DE SINTOMATOLOGIA COVID – 19 PREVIO AL INGRESO AL CENTRO DE TRABAJO</p>
                    <br />
                </div>
            </div>
            <div class="row justify-content-md-center pt-2 pb-4">
                <div id="verificar" class="col-md-auto text-center">
                    <form id="VP" name="VP" method="post">
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
                                    <select id="diafn" name="diafn" class="form-control border-0 bg-light text-center" style="font-size: 1.3rem;">
                                        <option value="00">Dia</option>
                                    </select>
                                </div>
                                <div style="width: 45%">
                                    <select id="mesfn" name="mesfn" class="form-control border-0 bg-light text-center" style="font-size: 1.3rem;">
                                        <option value="00">Mes</option>
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
                                <input type="button" id="btnIngresar" class="form-control border-0 rounded-pill bg-light btn-success" value="Ingresar" />
                            </div>
                        </div>
                    </form>
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
            </div>
            <div id="subtitle" class="row justify-content-md-center pt-4">
                <div class="col-md-6 text-white text-center">
                    <p class=" mb-0">Para consultas llamar a :</p>
                    <p class=" mb-0">PLANTA - 902754909  | |  FUNDOS - 902754877</p>
                </div>
            </div>
        </div>
        <div id="DivFicha" style="display: none">
            <div class="row justify-content-md-center pt-2">
                <div class="col-md-7 order-md-1">
                    <div class="row">
                        <div class="col-md-8 text-left" style="display: block">
                            <span id="NamePersonal" style="font-weight: bold"></span>
                        </div>
                        <div class="col-md-4 text-right" style="display: block">
                            <label>Ficha del mes de,  <b id="mesficha"></b></label>
                            <input type="hidden" id="AnioFicha" />
                            <input type="hidden" id="MesFicha" />
                            <input type="hidden" id="idPersonal" value="0" />
                            <input type="hidden" id="nIdFichaMes" value="0" />
                            <input type="hidden" id="fnac" value="" />
                            <input type="hidden" id="edad" value="0" />
                        </div>
                    </div>
                    <div class="row">
                           <div id="DivFe" class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-4">
                                <input type="text" id="cDireccion" name="cDireccion" autocomplete="off" class="form-control" placeholder="Direccion" />
                            </div>
                            <div id="DivFeNac" class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-4">
                                <input type="text" id="cCelular" name="cCelular" autocomplete="off" onkeypress="return soloNumeros(event)" class="form-control" placeholder="Celular" />
                            </div>
                            <div class="form-group col-6 col-sm-6 col-md-5 col-lg-4">
                                <button type="button" id="btnficha" runat="server" class="btn btn-secondary col-12" >
                                    <i class="fas fa-notes-medical"></i> Cargar Ficha
                                </button>
                            </div>
                    </div>

                </div>
            </div>
            <div id="viewficha" style="display: none">
            <div class="row justify-content-md-center pt-2">
                <div class="col-md-6 text-white text-center">
                    <p class="small mb-0">IDENTIFICACION E SINTOMATOLOGIA COVID – 19 PREVIO AL INGRESO AL CENTRO DE TRABAJO</p>
                    <br />
                    <p class="lead mb-0">FICHA DE SINTOMATOLOGIA COVID – 19</p>
                    <br />
                    <p class="small mb-0">HE RECIBIDO EXPLICACION DE OBJETO DE ESTA SITUACION Y ME COMPROMETO A RESPONDER CON LA VERDAD, TAMBIEN HE TENIDO INFORMADO QUE DE OMITIR O FALSEAR INFORMACION ESTARE PERJUDICANDO LA SALUD DE MIS COMPAÑEROS, LO CUAL ES UNA FALTA GRAVE.</p>

                </div>
            </div>
            <div class="row justify-content-md-center pt-4">
                <div class="col-md-7 order-md-1 mb-4">
                    <h6 class="mb-3">EN LOS ULTIMOS 14 DIAS HA TENIDO ALGUNO DE LOS SINTOMAS SIGUIENTES:</h6>
                    <form id="SendFicha" name="SendFicha" class="needs-validation was-validated" novalidate="">

                        <div class="row">

                            <table style="width: -webkit-fill-available;" class="tablex border">
                                <tr>
                                    <td>1.- Sensación de alza térmica o fiebre (Especificar)</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-1" class="radiox" name="1" value="1" />
                                            <label for="radio-1">SI</label>
                                            <input type="radio" id="radio-2" class="radiox" name="1" value="0" />
                                            <label for="radio-2">No</label>
                                        </div>
                                    </td>
                                    <td id="1s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>2.- Tos, estornudos o dificultades para respirar</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-3" class="radiox" name="2" value="1" />
                                            <label for="radio-3">SI</label>
                                            <input type="radio" id="radio-4" class="radiox" name="2" value="0" />
                                            <label for="radio-4">No</label>
                                        </div>
                                    </td>
                                    <td id="2s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>3.- Dolor de garganta</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-5" class="radiox" name="3" value="1" />
                                            <label for="radio-5">SI</label>
                                            <input type="radio" id="radio-6" class="radiox" name="3" value="0" />
                                            <label for="radio-6">No</label>
                                        </div>
                                    </td>
                                    <td id="3s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>4.- Congestión o secreción nasal</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-7" class="radiox" name="4" value="1" />
                                            <label for="radio-7">SI</label>
                                            <input type="radio" id="radio-8" class="radiox" name="4" value="0" />
                                            <label for="radio-8">No</label>
                                        </div>
                                    </td>
                                    <td id="4s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>5.- Expectoración o flema amarillo o verdosa</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-9" class="radiox" name="5" value="1" />
                                            <label for="radio-9">SI</label>
                                            <input type="radio" id="radio-10" class="radiox" name="5" value="0" />
                                            <label for="radio-10">No</label>
                                        </div>
                                    </td>
                                    <td id="5s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>6.- Perdida de olfato o perdida del gusto</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-11" class="radiox" name="6" value="1" />
                                            <label for="radio-11">SI</label>
                                            <input type="radio" id="radio-12" class="radiox" name="6" value="0" />
                                            <label for="radio-12">No</label>
                                        </div>
                                    </td>
                                    <td id="6s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>7.- Dolor abdominal, nauseas o diarrea</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-13" class="radiox" name="7" value="1" />
                                            <label for="radio-13">SI</label>
                                            <input type="radio" id="radio-14" class="radiox" name="7" value="0" />
                                            <label for="radio-14">No</label>
                                        </div>
                                    </td>
                                    <td id="7s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>8.- Dolor en el pecho</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-15" class="radiox" name="8" value="1" />
                                            <label for="radio-15">SI</label>
                                            <input type="radio" id="radio-16" class="radiox" name="8" value="0" />
                                            <label for="radio-16">No</label>
                                        </div>
                                    </td>
                                    <td id="8s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>9.- Desorientación o contusión</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-17" class="radiox" name="9" value="1" />
                                            <label for="radio-17">SI</label>
                                            <input type="radio" id="radio-18" class="radiox" name="9" value="0" />
                                            <label for="radio-18">No</label>
                                        </div>
                                    </td>
                                    <td id="9s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>10.- Coloración azul en los labios</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-19" class="radiox" name="10" value="1" />
                                            <label for="radio-19">SI</label>
                                            <input type="radio" id="radio-20" class="radiox" name="10" value="0" />
                                            <label for="radio-20">No</label>
                                        </div>
                                    </td>
                                    <td id="10s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>11.- Está tomando alguna medicación (Detalle):<br /><div id="11obst" class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-8" style="display: none">
                                <input type="text" id="11obstx" name="11obs" autocomplete="off" class="form-control" placeholder="detalle" />
                            </div></td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-21" class="radiox" name="11" value="1" />
                                            <label for="radio-21">SI</label>
                                            <input type="radio" id="radio-22" class="radiox" name="11" value="0" />
                                            <label for="radio-22">No</label>
                                        </div>
                                    </td>
                                    <td id="11s" class="rpta">&nbsp;</td>
                                </tr>
                                </table>

                        </div>
                        <hr class="mb-4">

                        <h6 class="mb-3">TIENE LOS SIGUIENTES FACTORES DE SALUD:</h6>

                        <div class="row">

                            <table style="width: -webkit-fill-available;" class="tablex border">
                                <tr>
                                    <td>1.- ha tenido contacto con personas con casos sospechosos o confirmados de COVID – 19</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-23" class="radiox" name="12" value="1" />
                                            <label for="radio-23">SI</label>
                                            <input type="radio" id="radio-24" class="radiox" name="12" value="0" />
                                            <label for="radio-24">No</label>
                                        </div>
                                    </td>
                                    <td id="12s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>2.-Ha viajado el exterior:</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-25" class="radiox" name="13" value="1" />
                                            <label for="radio-25">SI</label>
                                            <input type="radio" id="radio-26" class="radiox" name="13" value="0" />
                                            <label for="radio-26">No</label>
                                        </div>
                                    </td>
                                    <td id="13s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>3.- Ha visitado un establecimiento de salud</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-27" class="radiox" name="14" value="1" />
                                            <label for="radio-27">SI</label>
                                            <input type="radio" id="radio-28" class="radiox" name="14" value="0" />
                                            <label for="radio-28">No</label>
                                        </div>
                                    </td>
                                    <td id="14s" class="rpta">&nbsp;</td>
                                </tr>
                            </table>

                        </div>
                        <hr class="mb-4">

                        <h6 class="mb-3">TIENE LOS SIGUIENTES FACTORES DE SALUD:</h6>

                        <div class="row">

                            <table style="width: -webkit-fill-available;" class="tablex border">
                                <tr>
                                    <td>1.- Edad mayor de 65 años</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-29" class="radiox" name="15" value="1" />
                                            <label for="radio-29">SI</label>
                                            <input type="radio" id="radio-30" class="radiox" name="15" value="0" />
                                            <label for="radio-30">No</label>
                                        </div>
                                    </td>
                                    <td id="15s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>2.- Hipertensión arterial</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-31" class="radiox" name="16" value="1" />
                                            <label for="radio-31">SI</label>
                                            <input type="radio" id="radio-32" class="radiox" name="16" value="0" />
                                            <label for="radio-32">No</label>
                                        </div>
                                    </td>
                                    <td id="16s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>3.- Enfermedad cardiovascular</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-33" class="radiox" name="18" value="1" />
                                            <label for="radio-33">SI</label>
                                            <input type="radio" id="radio-34" class="radiox" name="18" value="0" />
                                            <label for="radio-34">No</label>
                                        </div>
                                    </td>
                                    <td id="18s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>4.- Cáncer</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-35" class="radiox" name="20" value="1" />
                                            <label for="radio-35">SI</label>
                                            <input type="radio" id="radio-36" class="radiox" name="20" value="0" />
                                            <label for="radio-36">No</label>
                                        </div>
                                    </td>
                                    <td id="20s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>5.- Diabetes mellitus</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-37" class="radiox" name="21" value="1" />
                                            <label for="radio-37">SI</label>
                                            <input type="radio" id="radio-38" class="radiox" name="21" value="0" />
                                            <label for="radio-38">No</label>
                                        </div>
                                    </td>
                                    <td id="21s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>6.- Obesidad con IMC de 40 a mas</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-39" class="radiox" name="22" value="1" />
                                            <label for="radio-39">SI</label>
                                            <input type="radio" id="radio-40" class="radiox" name="22" value="0" />
                                            <label for="radio-40">No</label>
                                        </div>
                                    </td>
                                    <td id="22s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>7.- Asma Moderada o Grave</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-41" class="radiox" name="23" value="1" />
                                            <label for="radio-41">SI</label>
                                            <input type="radio" id="radio-42" class="radiox" name="23" value="0" />
                                            <label for="radio-42">No</label>
                                        </div>
                                    </td>
                                    <td id="23s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>8.- Enfermedad pulmonar crónica</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-43" class="radiox" name="24" value="1" />
                                            <label for="radio-43">SI</label>
                                            <input type="radio" id="radio-44" class="radiox" name="24" value="0" />
                                            <label for="radio-44">No</label>
                                        </div>
                                    </td>
                                    <td id="24s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>9.- Insuficiencia renal crónica en tratamiento con hemodiálisis</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-45" class="radiox" name="25" value="1" />
                                            <label for="radio-45">SI</label>
                                            <input type="radio" id="radio-46" class="radiox" name="25" value="0" />
                                            <label for="radio-46">No</label>
                                        </div>
                                    </td>
                                    <td id="25s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>10.- Enfermedad o tratamiento inmunosupresor</td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-47" class="radiox" name="26" value="1" />
                                            <label for="radio-47">SI</label>
                                            <input type="radio" id="radio-48" class="radiox" name="26" value="0" />
                                            <label for="radio-48">No</label>
                                        </div>
                                    </td>
                                    <td id="26s" class="rpta">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>11.- Otros (DETALLAR)<br /><div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-8" id="27obst" style="display: none">
                                <input type="text" id="27obstx" name="27obs" autocomplete="off" class="form-control" placeholder="detalle" />
                            </div></td>
                                    <td>
                                        <div class="switch-field">
                                            <input type="radio" id="radio-49" class="radiox" name="27" value="1" />
                                            <label for="radio-49">SI</label>
                                            <input type="radio" id="radio-50" class="radiox" name="27" value="0" />
                                            <label for="radio-50">No</label>
                                        </div>
                                    </td>
                                    <td id="27s" class="rpta">&nbsp;</td>
                                </tr>
                            </table>


                        </div>

                    </form>
                    <hr class="mb-4" />
                    <button class="btn btn-primary btn-lg btn-block mb-4" id="btnaceptar" type="submit">Enviar Informacion</button>
                    <div id="send"></div>
                </div>
            </div>
                </div>
        </div>
                <div class="text-right footer">
            © Area TI - Sun Fruits Exports
        </div>
    </div>
</body>
<script>
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
    $("#btnficha").click(function () {
        if ($("#cDireccion").val() == '' && $("#cDireccion").val().length() >= 4) {
            if ($("#cCelular").val() == '') {

                toastr.warning('', 'Ingrese Direccion y Numero celular')
            } else {
                toastr.warning('', 'Ingrese Direccion')
            }
        } else if ($("#cCelular").val() == '' && $("#cCelular").val().length() >= 6) {
            toastr.warning('', 'Ingrese Direccion')
        } else {
            $('#cDireccion').removeClass('is-valid');
            $('#cCelular').removeClass('is-valid');
            $('#btnficha').hide();
            $('#cCelular').attr('disabled', 'disabled');
            $('#cDireccion').attr('disabled', 'disabled');
            $('#viewficha').show();
        }

    });

    function NameMes(intmes) {
        var month = new Array();
        month[1] = "Enero";
        month[2] = "Febrero";
        month[3] = "Marzo";
        month[4] = "Abril";
        month[5] = "Mayo";
        month[6] = "Junio";
        month[7] = "Julio";
        month[8] = "Agosto";
        month[9] = "Septiembre";
        month[10] = "Octubre";
        month[11] = "Noviembre";
        month[12] = "Diciembre";

        return month[intmes];
    }

    function ComboDate() {
        var aniofn = document.getElementById("aniofn");
        for (var i = 2003; i >= 1960; i--)aniofn.options.add(new Option(i, i));

        var mesfn = document.getElementById("mesfn");
    
        for (var i = 12; i >= 1; i--)mesfn.options.add(new Option(NameMes(i) , i));

        var diafn = document.getElementById("diafn");
        for (var i = 31; i >= 1; i--)diafn.options.add(new Option(i, i));
    };
    ComboDate();
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
        $('#cCelular').removeAttr('disabled', 'disabled');
        $('#cDireccion').removeAttr('disabled', 'disabled');
        $('#cDireccion').val('');
        $('#cCelular').val('');
        $('#btnficha').show();
        $('#titlex').show();
        $('#viewficha').hide();
    };

    $(document).ready(function () {
        $(".radiox").click(function () {
            var name = $(this).attr("name");
            var id = $(this).attr("id");
            var label = $("label[for='" + id + "']").text();
            $('#' + name + 's').text(label);
            if ($(this).val() == 0) {
                $('#' + name + 'obst').hide();
            } else {
                $('#' + name + 'obst').show();
            }
        });
    });

    function go_hash(hash) {
        console.log('go_hash: ' + hash)
        if (hash.indexOf('#') == -1)
            hash = '#' + hash
        if (document.location.hash) {
            document.location.hash = hash
            return
        }
        if (window.location.hash) {
            window.location.hash = hash
            return
        }
        if (document.location.href) {
            document.location.href = hash
            return
        }
        window.location.href = hash
    }

    var removeItem = function (object, key, value) {
        if (value == undefined)
            return;

        for (var i in object) {
            if (object[i][key] == value) {
                object.splice(i, 1);
            }
        }
        return object
    };


    $(document).on('click', '#btnaceptar', function (event) {
        event.preventDefault();

        var idp = $('#idPersonal').val();
        var idfm = $('#nIdFichaMes').val();
        var dir = $('#cDireccion').val();
        var cel = $('#cCelular').val();
        var fnac = $('#fnac').val();
        var edad = $('#edad').val();
        var _formId = document.getElementById('SendFicha'),

            formData = Array.prototype.slice.call(_formId.elements).reduce(function (acc, cur, indx, arr) {
                var i, o = {
                    vnIdPersonal: idp,
                    vnIdFichaMes: idfm,
                    vnEdad: edad,
                    vcFechaNac: fnac,
                    vcDireccion: dir,
                    vcCelular: cel,
                    vnIdFichaPregunta: cur.name,
                    vcRespuesta: cur.value,
                    type: cur.type
                };
                if (['checkbox', 'radio'].indexOf(cur.type) !== -1) {
                    o.checked = cur.checked;
                } 

                if (cur.name == '11') {
                    o.vcObs = $('#11obstx').val();
                } else if(cur.name == '27') {
                    o.vcObs = $('#27obstx').val();
                } else {
                    o.vcObs = '';
                }
                acc.push(o);
                var h = removeItem(acc, "checked", false);
                return removeItem(h, "type", "text");
            }, []);

        if (idp == '0') {
            toastr.error('error al validar personal', 'ERROR')
        }else if ((_formId.elements.length / 2) -1 == formData.length) {

            $.ajax({
                type: 'POST',
                url: "SerApp.asmx/RegiFichaSC",
                data: "{'array':" + JSON.stringify(formData) + "}",
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                beforeSend: function () {
                    
                    $("#btnaceptar").hide();
                    $('#send').html("<img src='../Img/sendficha.gif' style='width: 400px' />");
                },
                success: function (data) {
                    $('#VP')[0].reset();
                    $("#btnaceptar").show();
                    $('#send').html('');
                    $('#SendFicha')[0].reset();
                    $("#idPersonal").val('0');
                    $("#NamePersonal").text('');
                    $('#fnac').val('');
                    $('#edad').val('');
                    $("#DivFicha").hide();
                    $(".rpta").text('');
                    $('#titlex').hide();
                    $("#DivVerificar").show();
                    $("#verificar").hide();
                    $('#messageerror').text('FICHA ENVIADA');
                    $("#error").show();
                    limpiarform();
                    mclear(10000); 
                }, error: function (data) {
                    alert(JSON.stringify(data));
                }
            })
        } else {
            toastr.error('FALTAN COMPLETAR EL FORMULARIO', 'VERIFICAR')
        }
    });

 
    function verifimes() {
        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "SerApp.asmx/VerifyMes",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);
                if (lst != '') {
                    if (lst[0].nMes != 0 || lst[0].nMes != 'undefined') {
                        $('#mesficha').text(NameMes(lst[0].nMes));
                        $('#nIdFichaMes').val(lst[0].nIdFichaMes);
                        $('#AnioFicha').val(lst[0].anio);
                        $('#MesFicha').val(lst[0].nMes);
                    } else {
                        $('#VP')[0].reset();
                        $('#SendFicha')[0].reset();
                        $("#idPersonal").val('0');
                        $("#NamePersonal").text('');
                        $("#DivFicha").hide();
                        $(".rpta").text('');
                        $('#titlex').hide();
                        $("#DivVerificar").hide();
                        $("#verificar").hide();
                        $('#messageerror').text('ESTIMADO NO SE A APERTURADO LA FICHA')
                        $("#error").show();
                    }
                } else {
                    $('#VP')[0].reset();
                    $('#SendFicha')[0].reset();
                    $("#idPersonal").val('0');
                    $("#NamePersonal").text('');
                    $("#DivFicha").hide();
                    $(".rpta").text('');
                    $('#titlex').hide();
                    $("#DivVerificar").show();
                    $("#verificar").hide();
                    $('#messageerror').text('ESTIMADO NO SE A APERTURADO LA FICHA')
                    $("#error").show();
                    $(".volver").hide();
                }
            }, error: function (data) {
                alert(JSON.stringify(data));
            }
        })
    }
    verifimes();
 
    function limpiarmsg() {
        $("#DivVerificar").show();
        $("#verificar").show();
        $('#messageerror').text('');

        $('#titlex').show();

        $("#messageerror").show();
        $("#success").hide();
        $("#error").hide();
    }
    $("#btnIngresar").click(function () {
        var obj = new Object();
        obj.vcNroDocumento = $("#NroDocumento").val();

        if ($("#diafn").val() != '00' && $("#mesfn").val() != '00' && $("#aniofn").val() != '0000') {
            obj.vdFechaNacimiento = $("#aniofn").val() + '-' + $("#mesfn").val() + '-' + $("#diafn").val();
        } else {
            obj.vdFechaNacimiento = ''
        }

        if (obj.vcNroDocumento != '' && obj.vdFechaNacimiento != "") {
            $.ajax({
                type: 'POST',
                url: "SerApp.asmx/vp_sf",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    if (lst != "") {
                        switch (lst[0].rpta) {
                            case 0:
                                $('#VP')[0].reset();
                                $("#idPersonal").val('0');
                                $("#NamePersonal").text('PERSONAL VALIDADO ERROR, FICHA INVALIDA');
                                $("#DivFicha").hide();
                                $('#titlex').hide();
                                $("#DivVerificar").show();
                                $("#verificar").hide();
                                $('#messageerror').text('USTED NO PUEDE RELLENAR ESTA FICHA, GRACIAS', 'ERROR')
                                $("#error").show();
                                limpiarform();
                                break;
                            case 1:
                                if (lst[0].fm != 0) {
                                    toastr.warning('USTED YA ENTREGO SU FICHA DEL MES ACTIVO', 'Aviso');
                                    $('#VP')[0].reset();
                                    $("#idPersonal").val('0');
                                    $("#NamePersonal").text('PERSONAL VALIDADO ERROR, FICHA INVALIDA');
                                    $("#DivFicha").hide();
                                    $('#titlex').hide();
                                    $("#DivVerificar").show();
                                    $("#verificar").hide();
                                    $('#messageerror').text('usted ya lleno el formulario de este mes')
                                    $("#error").show();
                                    fclear(10000);
                                    mclear(10000);
                                } else {
                                    $('#VP')[0].reset();
                                    $("#idPersonal").val(lst[0].i);
                                    $("#NamePersonal").text(lst[0].t + ' - Edad: ' + lst[0].e + ' años');
                                    $('#fnac').val(lst[0].f);
                                    $('#edad').val(lst[0].e);
                                    $("#DivVerificar").hide();
                                    $("#DivFicha").show();
                                }

                                limpiarform();
                                break;
                            case 2:
                                // $('#VP')[0].reset();
                                $("#idPersonal").val('0');
                                $("#NamePersonal").text('VERIFIQUE DATOS');
                                $("#DivFicha").hide();

                                toastr.error('VERIFIQUE SUS DATOS, PORFAVOR', 'ERROR');
                                //limpiarform();
                                break;
                            default:
                                $('#VP')[0].reset();
                                $("#idPersonal").val('0');
                                $("#NamePersonal").text('PERSONAL VALIDADO ERROR, FICHA INVALIDA');
                                $("#DivFicha").hide();
                                $('#titlex').hide();
                                $("#DivVerificar").show();
                                $("#verificar").hide();
                                $('#messageerror').text('USTED NO PUEDE RELLENAR ESTA FICHA, GRACIAS', 'ERROR')
                                $("#error").show();
                                limpiarform();
                                break;
                        }
                    } else {
                        $('#VP')[0].reset();
                        $("#idPersonal").val('0');
                        $("#NamePersonal").text('PERSONAL VALIDADO ERROR, FICHA INVALIDA');
                        $("#DivFicha").hide();
                        $('#titlex').hide();
                        $("#DivVerificar").show();
                        $("#verificar").hide();
                        $('#messageerror').text('ERROR')
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
</script>
</html>
