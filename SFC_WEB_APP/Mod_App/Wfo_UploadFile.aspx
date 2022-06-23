<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_UploadFile.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_UploadFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link rel="icon" type="image/png" href="../Img/favicon.ico" />

    <title>Subir Documento | SUN FRUITS</title>
    <%: Styles.Render("~/Content/css") %>
    <%: Scripts.Render("~/jquery") %>

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
                    <p class="lead mb-0" id="name" style="font-weight: bold"></p>
                    <br />
                </div>
            </div>
            <form id="needs-validation" class="needs-validation" novalidate="novalidate">
                <div id="DivRpta" class="row justify-content-md-center pt-2 pb-4" style="display: none">
                    <div id="error" class="col-md-6">
                        <div class="col-md-auto text-white text-center">
                            <p class="lead mb-0" id="messageerror">GRACIAS POR ENVIAR SU INFORMACION</p>
                            <p class="lead mb-0"></p>
                            <div class="p-0 bg-light rounded rounded-pill shadow-sm mt-4">
                                <div class="input-group input-group-lg">
                                    <input type="button" id="btn-success" class="form-control border-0 rounded-pill bg-light btn-success" value="Aceptar" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="rowform" class="row justify-content-md-center pt-2" style="display: none">
                    <div class="col-md-4 text-white text-center">
                        <div class="row" id="icv">
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
                    </div>
                </div>
                <hr />
                <div class="row justify-content-md-center" id="divfootr" style="display: none">
                    <div class="form-group col-md-4 text-center" id="rowbutton">
                        <button type="button" id="AddTrb" class="btn btn-lg btn-success" style="top: 25%; position: relative;">Enviar</button>
                    </div>
                </div>
            </form>
            <br />
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
    <div id="script">
        <script>
            $(document).ready(function () {
                var tk = window.location.search;
                tk = tk.replace("?", "");
                var obj = new Object();
                obj.vcIds = tk;
                $.ajax({
                    type: 'POST',
                    url: "SerApp.asmx/Verifytk",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst[0].Vu === undefined) {
                            $('#name').text('ERROR DE CODIGO');
                            $('#rowform').html('');
                            $('#divfootr').html('');
                            $('#script').html('');
                        } else {

                            if (lst[0].Vu == '') {
                                if (lst[0].nombres != "" && lst[0].Vu == 0) {
                                    $('#name').text('BIENVENID@ ' + lst[0].nombres);
                                    $('#rowform').show('');
                                    $('#divfootr').show('');
                                    $('#script').html('');
                                } else {
                                    $('#name').text('error');
                                    $('#script').html('');
                                }
                            } else {
                                $('#name').text('ESTE ENLACE YA FUE UTILIZADO, GRACIAS POR ENVIAR SU INFORMACION');
                                $('#rowform').html('');
                                $('#divfootr').html('');
                                $('#script').html('');
                            }
                        }
                    },
                    error: function (error) {
                        $('#name').text('ERROR DE CODIGO');
                        $('#rowform').html('');
                        $('#divfootr').html('');
                        $('#script').html('');
                    },
                });
            });
        </script>

    </div>
    <script>

        $("#ar").on("change", function () {
            var fileName = $(this).val().split("\\").pop();
            if (fileName.length >= 30) { var name = fileName.substr(0, 20) + '...' + fileName.split('.').slice(0, -1).join('.').substr(-10, 10) + '.' + fileName.split('.').pop() } else { var name =  fileName };
            fileNamecort =  name;
            $(this).siblings("#customlabel").addClass("selected").html(fileNamecort);

            //var file = document.querySelector('input[type=file]').files[0];
            //var file = $("#ar").files[0];
            var file = document.querySelector('input[name=ar]').files[0];
            if (['pdf', 'pptx', 'ppt', 'docx', 'doc'].contains(fileName.split('.').pop())) {
                var reader = new FileReader();
                reader.readAsDataURL(file);
                reader.onload = function () {
                    if (reader.result.split(',')[1] != undefined) {
                        console.log();
                        $('#fileb64').val(reader.result.split(',')[1]);
                        $('#fileext').val(fileName.split('.').pop());
                    } else {
                        console.log();
                        toastr.warning('Verifique el archivo y/o seleccione otro', 'ERROR CON ARCHIVO');
                        $("#customlabel").text('Seleccione Documento');
                    }
                }
            } else {
                toastr.error('La extension no esta permitido por favor seleccione otro archivo', 'Archivo No permitido');
                $("#customlabel").text('Seleccione Documento');
            }

        });
        $(document).on('click', '#AddTrb', function (event) {
            var tk = window.location.search;
            tk = tk.replace("?", "");
            var obj = new Object();
            obj.vcIds = tk;
            obj.vcFile = $('#fileb64').val();
            obj.vExt = $("#fileext").val();
            if (obj.vcFile != '') {
                $.ajax({
                    type: 'POST',
                    url: "SerApp.asmx/UpdateInfo",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst != "") {
                            if (lst.rpta != 0) {
                                $('#name').text('GRACIAS POR ENVIAR SU INFORMACION');
                                $('#rowform').html('');
                                $('#divfootr').html('');
                            } else {
                                alert('Ocurrio un error al guardar sus Datos');
                                // location.reload();
                                $('#rowbutton').html('<button type="submit" id="AddTrb" class="btn btn-lg btn-success" style="top: 25%; position: relative;">Enviar Informacion</button>');
                            }

                        } else {
                            alert('Ocurrio un error al guardar sus Datos, Ingrese nuevamente');
                            //  location.reload();
                        }
                    },
                    error: function (error) {
                        alert(JSON.stringify(error))
                    }
                });
            } else {
                alert('seleccione su curriculum vitae por favor');
            }
        });

        Array.prototype.contains = function (obj) {
            return this.indexOf(obj) > -1;
        };
    </script>

</body>
</html>
