<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_test.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link rel="icon" type="image/png" href="../Img/favicon.ico" />

    <title>INCRIPCION PERSONAL | SUNFRUITS</title>
    <%: Styles.Render("~/Content/css") %>
    <%: Scripts.Render("~/jquery") %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/20.1.7/css/dx.common.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/20.1.7/css/dx.light.css"/>
    <script src="https://cdn3.devexpress.com/jslib/20.1.7/js/dx.all.js"></script>


    <link rel="stylesheet" href="../scripts/croppie/croppie.min.css" />
    <script src="../scripts/croppie/croppie.min.js"></script>
    <script src="../scripts/croppie/bootstrap.min.js"></script>


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
        }


        .barra-iconos {
            position: absolute;
            top: 0px;
            right: 0px;
            text-align: right;
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


        .img-tbr {
            width: 25%;
            -webkit-filter: drop-shadow(0.1px 0.1px 3px #fff);
            filter: drop-shadow(0.1px 0.1px 3px #fff);
        }

        @media only screen and (max-width: 600px) {
            .img-tbr {
                width: 60%;
            }
        }




        .footer {
            position: fixed;
            left: 0px;
            bottom: 0px;
            height: 30px;
            width: 95%;
        }

        a:link {
            color: white;
            font-weight: bold;
        }

        .invalid-feedback {
            /* text-shadow: 5px 5px white;*/
            z-index: 5;
            display: none;
            max-width: 70%;
            padding: .5rem;
            margin-top: .1rem;
            font-size: .875rem;
            line-height: 1;
            color: #fff;
            background-color: rgba(220,53,69,.8);
            border-radius: .2rem;
        }

        .label-input {
            color: white;
            font-weight: bold;
        }

        .checkbox-border {
            height: 17px;
            width: 24px;
        }

        .label-dj {
            color: white;
        }

        .parpadea {
            animation-name: parpadeo;
            animation-duration: 1s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
            -webkit-animation-name: parpadeo;
            -webkit-animation-duration: 1s;
            -webkit-animation-timing-function: linear;
            -webkit-animation-iteration-count: infinite;
            background: red;
            box-shadow: 0 0px 10px 10px #ff0000;
        }

        @-moz-keyframes parpadeo {
            0% {
                opacity: 1.0;
            }

            50% {
                opacity: 0.0;
            }

            100% {
                opacity: 1.0;
            }
        }

        @-webkit-keyframes parpadeo {
            0% {
                opacity: 1.0;
            }

            50% {
                opacity: 0.0;
            }

            100% {
                opacity: 1.0;
            }
        }

        @keyframes parpadeo {
            0% {
                opacity: 1.0;
            }

            50% {
                opacity: 0.0;
            }

            100% {
                opacity: 1.0;
            }
        }
    </style>
    <link rel="stylesheet" href="custom-file.css">
  <style>
        .chosen-container {
        width: 100% !important;
        }
    </style>
</head>
<body>
    <div class="barra-iconos">
    </div>
    <div class="container">
        <div class="row justify-content-md-center">
            <div class="col-md-auto text-center">
                <h1 class="display-4">
                    <img src="../Img/sf-logo.png" alt="logo" class="img-mob" /></h1>
            </div>
        </div>
        <div id="" style="">
            <div id="titlex" class="row justify-content-md-center pt-2">
                <div class="col-md-6 text-white text-center">
                    <p class="lead mb-0" style="font-weight: bold">PRE INSCRIPCION DE PERSONAL</p>
                    <br />
                </div>
            </div>
            <form id="needs-validation" class="needs-validation" novalidate="novalidate">
                <div id="DivRpta" class="row justify-content-md-center pt-2 pb-4" style="display: none">
                    <div id="error" class="col-md-6">
                        <div class="col-md-auto text-white text-center">
                            <p class="lead mb-0" id="messageerror">GRACIAS POR INSCRIBIRTE</p>
                            <p class="lead mb-0"></p>
                            <div class="p-0 bg-light rounded rounded-pill shadow-sm mt-4">
                                <div class="input-group input-group-lg">
                                    <input type="button" id="btn-success" class="form-control border-0 rounded-pill bg-light btn-success" value="Aceptar" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" id="rowform">
                    <div class="col-md-4">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="message-text" class="label-input">Tipo Documento:</label>
                                <select class="form-control custom-select" id="td" name="td" required="required">
                                    <option value="" selected disabled>- Seleccione -</option>
                                    <option value="1">DNI </option>
                                    <option value="2">PASAPORTE </option>
                                    <option value="3">CARNET EXTRANJERIA</option>
                                </select>
                                <div class="invalid-tooltip">Seleccione opcion</div>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="message-text" class="label-input">Nro Documento:</label>
                                <input type="text" id="nd" name="nd" autocomplete="off" class="form-control i-n" placeholder="Nro Documento" required="required" />
                                <div class="invalid-tooltip">Ingrese Nro Documento</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label for="txtFeCont" class="label-input">Nombres:</label>
                                <input type="text" id="nm" name="nm" autocomplete="off" class="form-control" placeholder="Nombres" required="required" />
                                <div class="invalid-tooltip">Ingrese nombres</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label for="message-text" class="label-input">Apellido Paterno:</label>
                                <input type="text" id="ap" name="ap" autocomplete="off" class="form-control" placeholder="Apellido Paterno" required="required" />
                                <div class="invalid-tooltip">Ingrese apellido paterno</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label for="txtFeCont" class="label-input">Apellido Materno:</label>
                                <input type="text" id="am" name="am" autocomplete="off" class="form-control" placeholder="Apellido Materno" required="required" />
                                <div class="invalid-tooltip">Ingrese apellido materno</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-5">
                                <label for="message-text" class="label-input">Sexo:</label>
                                <select class="form-control custom-select" id="sx" name="sx" required="required">
                                    <option value="" selected disabled>- Seleccione -</option>
                                    <option value="M">MASCULINO </option>
                                    <option value="F">FEMENINO </option>
                                </select>
                                <div class="invalid-tooltip">Seleccione opcion</div>
                            </div>
                            <div class="form-group col-md-7">
                                <label for="txtFeCont" class="label-input">Fecha Nacimiento:</label>
                                <div class="row p-0 m-0">
                                    <div style="width: 25%">
                                        <select id="dfn" name="dfn" class="form-control" required="required">
                                            <option value="">Dia</option>
                                        </select>

                                        <div class="invalid-tooltip">Dia</div>
                                    </div>
                                    <div style="width: 45%">
                                        <select id="mfn" name="mfn" class="form-control" required="required">
                                            <option value="">Mes</option>
                                        </select>

                                        <div class="invalid-tooltip">Mes</div>
                                    </div>
                                    <div style="width: 30%">
                                        <select id="afn" name="afn" class="form-control" required="required">
                                            <option value="">Año</option>
                                        </select>

                                        <div class="invalid-tooltip">Año</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label for="txtFeCont" class="label-input">Nacionalidad:</label>
                                <select class="form-control" id="nc" name="nc" required="required">
                                    <option value="">- Seleccione -</option>
                                    <option value="Perú">Perú</option>
                                    <option value="Argentina">Argentina</option>
                                    <option value="Bolivia">Bolivia</option>
                                    <option value="Brasil">Brasil</option>
                                    <option value="Colombia">Colombia</option>
                                    <option value="Chile">Chile</option>
                                    <option value="Ecuador">Ecuador</option>
                                    <option value="Paraguay">Paraguay</option>
                                    <option value="Uruguay">Uruguay</option>
                                    <option value="Venezuela">Venezuela</option>
                                </select>
                                <div class="invalid-tooltip">Seleccione una Opcion</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label for="message-text" class="label-input">Direccion:</label>
                                <input type="text" id="dr" name="dr" autocomplete="off" class="form-control" placeholder="Direccion" required="required" />
                                <div class="invalid-tooltip">Ingrese Direccion</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="message-text" class="label-input">Distrito:</label>
                                <input type="text" id="ds" name="ds" autocomplete="off" class="form-control" placeholder="Distrito" required="required" />
                                <div class="invalid-tooltip">Ingrese Distrito</div>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="message-text" class="label-input">Departamento:</label>
                                <select name="dpt" id="dpt" class="form-control" required="">
                                <option value="" selected disabled>- Seleccione -</option>
                                <option value="Amazonas">Amazonas</option>
                                <option value="Ancash">Ancash</option>
                                <option value="Apurímac">Apurímac</option>
                                <option value="Arequipa">Arequipa</option>
                                <option value="Ayacucho">Ayacucho</option>
                                <option value="Cajamarca">Cajamarca</option>
                                <option value="Callao">Callao</option>
                                <option value="Cuzco">Cuzco </option>
                                <option value="Huancavelica">Huancavelica</option>
                                <option value="Huánuco">Huánuco</option>
                                <option value="Ica">Ica</option>
                                <option value="Junín">Junín</option>
                                <option value="La_Libertad">La Libertad</option>
                                <option value="Lambayeque">Lambayeque</option>
                                <option value="Lima">Lima</option>
                                <option value="Loreto">Loreto</option>
                                <option value="Madre_de_Dios">Madre de Dios</option>
                                <option value="Moquegua">Moquegua</option>
                                <option value="Pasco">Pasco</option>
                                <option value="Piura">Piura</option>
                                <option value="Puno">Puno</option>
                                <option value="San_Martín">San Martín</option>
                                <option value="Tacna">Tacna</option>
                                <option value="Tumbes">Tumbes</option>
                                <option value="Ucayali">Ucayali</option>
                                </select>
                                <div class="invalid-tooltip">Seleccione Departamento</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label for="txtFeCont" class="label-input">Celular/Telefono:</label>
                                <input type="tel" id="ce" name="ce" pattern=".{5,20}" title="" autocomplete="off" class="form-control i-nct" placeholder="Celular/Telefono" required="required" />
                                <div class="invalid-tooltip">Ingrese Nro Celular/Telefono correcto</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label for="message-text" class="label-input">Correo Electronico:</label>
                                <input type="text" id="em" name="em" autocomplete="off" class="form-control" placeholder="Correo Electronico email@example.com"/>
                                <div class="invalid-tooltip">Ingrese email valido : email@example.com</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label for="mes age-text" class="label-input">Agrega Foto:</label><br />
                                <span class="label-input col-md-12 custom-file" id="input-f" />
                                <input type="file" id="fp" name="fp" class="custom-file-input form-control" accept="image/*" />
                                <label class="custom-file-label" for="customFile" style="text-align: left">Seleccionar Imagen</label>
                                <div class="invalid-tooltip">Adjunte Foto</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12 text-center">
                                <div id="charged"></div>
                                <button class="btn btn-sm btn-danger" style="display: none; position: absolute; top: 20%; left: 65%; right: 0;" id="delete-img">X Eliminar</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label for="message-text" class="label-input">Grado de Intruccion:</label>
                                <select id="gi" name="gi" class="form-control ist">
                                    <option value="" disabled selected>- seleccion -</option>
                                    <option value="Primaria completa">Primaria completa</option>
                                    <option value="Secundaria completa">Secundaria completa</option>
                                    <option value="Estudio técnico completo">Estudio técnico completo</option>
                                    <option value="Estudio técnico incompleto">Estudio técnico incompleto</option>
                                    <option value="Estudio universitario completo">Estudio universitario completo</option>
                                    <option value="Estudio universitario incompleto">Estudio universitario incompleto</option>
                                    <option value="Otros Estudios">Otros Estudios</option>
                                </select>                                
                                <div class="invalid-tooltip">Seleccione </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label for="message-text" class="label-input">Cargo al que Postula:</label>
                                <select id="cqp" name="cqp" class="form-control" required="required">
                                </select>
                                <div class="invalid-tooltip">Seleccione </div>
                            </div>
                        </div>
                        <div class="row" id="del" style="display: none">
                            <div class="form-group col-md-12">
                                <label for="message-text" class="label-input">Especifique Labor:</label>
                                <input type="text" id="el" name="el" autocomplete="off" class="form-control" placeholder="Especifique Labor" />
                            </div>
                        </div>
                        <div class="row" id="icv" style="display: none">
                            <div class="form-group col-md-12">
                                <label for="message-text" class="label-input">Subir Curriculum Vitae:</label>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input form-control main-search" id="ar" name="ar" accept=".doc, .docx, .ppt, .pptx, .pdf" />
                                    <input type="hidden" id="fileb64" />
                                    <input type="hidden" id="fileext" />
                                    <label class="custom-file-label" id="customlabel" for="customFile" style="text-align: left">Seleccionar Archivo</label>
                                    <div class="invalid-tooltip">Suba su curriculum por favor</div>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="form-group mt-4 mb-3" style="padding: 2px;">
                            <label for="message-text" class="label-input">Trabajó en SUN FRUITS?:</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="trsf" id="trsf1" value="1" />
                                <label class="form-check-label label-input" for="trsf1">SI </label>
                                &nbsp;&nbsp;
                                <input class="form-check-input" type="radio" name="trsf" id="trsf2" value="0" />
                                <label class="form-check-label label-input" for="trsf2">NO</label>
                            </div>
                        </div> 
                        <div class="row" id="st" style="display: none">
                            

                            <div class="form-group col-md-12">
                                <label for="message-text" class="label-input">Años que laboró:</label>
                                <div id="sel-ac" class="form-control"></div>  
                                <input type="hidden" id="ac" name="ac" class="ist"/>
                                <div class="invalid-tooltip">Seleccione Años</div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="txtFeCont" class="label-input">Campañas que laboró:</label>
                                <div id="sel-cc" class="form-control"></div>  
                                <input type="hidden" id="cc" name="cc" class="ist"/>
                                <div class="invalid-tooltip">Seleccione uno o mas  Campañas</div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="message-text" class="label-input">Labores desempeñadas:</label>
                                <div id="sel-crc" class="form-control"></div>  
                                <input type="hidden" id="crc" name="crc" class="ist"/>
                                <div class="invalid-tooltip">Seleccione uno o mas Labores</div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="message-text" class="label-input">Otras Labores:</label>
                                <input type="text" id="rel" name="rel" autocomplete="off" class="form-control" placeholder="Especifique Labor" />
                            </div>
                        </div>
                        <div class="row"  id="xoe" style="display: none">
                            <div class="form-group col-md-12">
                                <label for="message-text" class="label-input">Labores que ejercio en otras Empresas:</label>
                                <div id="sel-xe" class="form-control"></div>  
                                <input type="hidden" id="xe" name="xe"/>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row" id="divfootr">
                    <div class="form-group col-md-8">
                        <p>
                            <b style="color: white">DECLARACIÓN JURADA</b><br>
                            <span class="" id="vc">
                                <input type="checkbox" name="chk-dj" id="chk-dj" value="1" aria-invalid="false" class="checkbox-border" required></span><span class="label-dj">Declaro bajo juramento que la información declarada es verdadera, así como,  no tener antecedentes penales ni judiciales, para lo cual doy fe con mi aprobación en esta ficha virtual.</span>
                        </p>
                    </div>
                    <div class="form-group col-md-4 text-center" id="rowbutton">
                        <button type="submit" id="AddTrb" class="btn btn-lg btn-success" style="top: 25%; position: relative;">Enviar Informacion</button>
                    </div>
                </div>
            </form>
            <div id="subtitle" class="row justify-content-md-center pt-4 pb-4">
                <div class="col-md-6 text-white text-center">
                    <p class=" mb-0">Para consultas llamar a :</p>
                    <p class=" mb-0">PLANTA - <a href="tel:+51902754909">902754909</a>  | |  FUNDOS - <a href="tel:+51902754877">902754877</a></p>
                    <p class=" mb-0">Escribenos a:</p>
                    <p class=" mb-0"><a href="mailto:RRHH@sunfruitscorp.com">RRHH@sunfruitscorp.com</a></p>
                </div>
            </div>
        </div>
    </div>
    <div id="uploadimageModal" class="modal" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Subir Imagen</h4>
                </div>
                <div class="modal-body" style="padding: 0px">
                    <div class="text-center">
                        <div id="image_demo" style="height: auto"></div>
                    </div>
                    <button style="margin-left: 20px" class="btn rotate float-lef" data-deg="90">
                        <i class="fa fa-undo"></i>
                    </button>
                    <button style="margin-right: 20px" class="btn rotate float-right" data-deg="-90">
                        <i class="fa fa-repeat"></i>
                    </button>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-success crop_image">Aceptar</button>
                    <button type="button" class="btn btn-default cancel_crop_image" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>

    <script src="custom-file.js?v=5"> </script>

</body>
</html>
