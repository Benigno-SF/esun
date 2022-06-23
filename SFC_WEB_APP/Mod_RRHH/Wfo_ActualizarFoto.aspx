<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ActualizarFoto.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_ActualizarFoto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
          <div id="homepage">
            <div class="jumbo pd-jumbo">
                <div class="container">
                    <div><image src="img/e-sun_logo.png" class="img-fluid" alt="Responsive image"/></div>
                    <br>
                    <div id="search-v">
                            <div  class="input-group">
                                <input type="tel" class="form-control main-search" id="code" name="code" autofocus="" onblur="this.focus()" placeholder="Identifiquese..." value="" autocomplete="off" required>
                                <span class="input-group-btn">
                                    <button class="btn btn-default main-search-btn" id='btnsearch' type="button"><i class="fa fa-user" aria-hidden="true"></i></button>
                                </span>
                            </div>
                    </div>
                    <div id="charged" class="popular-tags" style="font-weight: 10"></div>
                    <div class="row">
                        <div class="col-md">
                            <div class="popular-tags" style="font-weight: 10; margin-top: 0px">
                                <h4 id="Nombre" name="Nombre">&nbsp;</h4>
                                <h4 id="Foto" name="Foto">&nbsp;</h4>
                                <div id="imagev" name="imagev"></div>
                                <p style="padding-top: 10px;"><a id="cambiar" name="cambiar" class="btn btn-warning text-white" style="display: none">Cambiar</a></p>
                                <button type="button" class="btn btn-danger" id="cancelview"  style="display: none">Cancelar</button>
                            </div>
                        </div>
                        <div class="col-md" id="upload_img" style="display: none" >
                            <form id="form_img" name="form_img" method="post" enctype="multipart/form-data">
                                <input type="hidden" id="code2" name="code2" >
                                <input type="hidden" id="newuser" name="newuser" value="0">

                                <div class="input-group" class="custom-file">
                                    <input type="file" class="custom-file-input form-control main-search" id="foto_personal" name="foto_personal" size="5120" haccept="image/*" required>
                                    <label class="custom-file-label" for="customFile" style="text-align: left">Seleccionar Imagen</label>
                                </div>
                                <button type="button" class="btn btn-danger" id="cancel">Cancelar</button>
                                <div id="output"></div>
                                <div id="img"></div>

                            </form>
                        </div>
                    </div>
                    <br>
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
                        <button style="margin-left: 20px" class="btn rotate float-lef" data-deg="90" > 
                    <i class="fa fa-undo"></i></button>
                    <button style="margin-right: 20px"  class="btn rotate float-right" data-deg="-90" > 
                    <i class="fa fa-repeat"></i></button>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-success crop_image">Subir Imagen</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/jquery.min.js"></script>
        <script src="assets/croppie.min.js"></script>
        <script src="assets/bootstrap.min.js" crossorigin="anonymous"></script>


        <script>

            function validar(e) {
                tecla = (document.all) ? e.keyCode : e.which;
                if (tecla == 13) {
                    $("#btnsearch").click();
                }
                return (tecla != 13);
            }
                                    $(document).ready(function () {

                                        $image_crop = $('#image_demo').croppie({
                                            enableExif: true,
                                            viewport: {
                                                width: 240,
                                                height: 320,
                                                type: 'square' //circle
                                            },
                                            boundary: {
                                                width: 250,
                                                height: 330
                                            },
                                            enableOrientation: true
                                        });
                                        
                                        $(".rotate").on("click", function() {
                                            $image_crop.croppie('rotate', parseInt($(this).data('deg')));
                                        });

                                        $('#foto_personal').on('change', function () {
                                            var reader = new FileReader();
                                            reader.onload = function (event) {
                                                $image_crop.croppie('bind', {
                                                    url: event.target.result
                                                }).then(function () {
                                                    console.log('jQuery bind complete');
                                                });
                                            }
                                            reader.readAsDataURL(this.files[0]);
                                            $('#uploadimageModal').modal('show');
                                        });

                                        $('.crop_image').click(function (event) {
                                            var code = $('#code2').val();
											var newuser = $('#newuser').val();
                                            if (code != '')
                                            {
                                                $image_crop.croppie('result', {
                                                    type: 'canvas',
                                                    size: 'viewport'
                                                }).then(function (response) {
                                                    htmlx = '<img id="fot" src="' + response + '" >';
				                    $("#charged").html(htmlx);
                                                    $('#charged').html('<img src="img/loader.gif" alt="loading" /><br/><h4>Subiendo Imagen...</h4>');
                                                  /* var fot = $("#fot").attr("src"); 
                                                    alert(fot);*/
                                                    $('#Nombre').text("");
                                                    $('#imagev').html("");
                                                    $('#upload_img').hide();
                                                    $('#uploadimageModal').modal('hide');
                                                    
                                                    $.ajax({
                                                        url: "class/save_foto.php",
                                                        type: "POST",
                                                        data: {"image": response, "code2": code, "newuser": newuser},
                                                        dataType: "json",
                                                        error: function(jqXHR, textStatus){
                                                    if(textStatus === 'timeout')
                                                    {   
                                                        $('#charged').fadeIn(1000).html('');
                                                         limpiarlabel();
                                                        $('#charged').html('<br><h4>ERROR, Sin respuesta del servidor</h4>');
                                                        fclear();
                                                    }
                                                    },
                                                        success: function (data)
                                                        {
                                                            $('#form_img')[0].reset();
                                                            limpiarlabel();
                                                            $('#upload_img').hide();
                                                            $('#charged').html('<p><h4>' + data.msg + '</h4><p>' + data.img);
                                                            fclear();
                                                        },
                                                        timeout:20000 
                                                    });
                                                })
                                            } else {
                                                $('#form_img')[0].reset();
                                                document.getElementById("code").autofocus;
                                                clearTimeout(clear);
                                                fclear();
                                            }
                                        });

                                    });

                                    $(function () {
                                        $('#code').on('input', function () {
                                            this.value = this.value.replace(/[^\d]/g, '')             // numbers and decimals only
                                        });
                                    });

                                    $(".custom-file-input").on("change", function () {
                                        var fileName = $(this).val().split("\\").pop();
                                        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
                                    });


                                    $(document).on('click', '#cancel', function () {
                                        limpiarlabel();
                                    });
                                    
                                    $(document).on('click', '#cancelview', function () {
                                        limpiarlabel();
                                    });


                                    document.getElementById("code").autofocus;

                                    var clear;
                                    function fclear() {
                                        clear = setTimeout("limpiarlabel()", 5000);
                                    }

                                    $(document).on('click', '#cambiar', function () {
                                        $('#upload_img').show();
                                        $('#cambiar').hide();
                                        $('#Foto').text("");
                                        $('#imagev').html("");
                                        $('#cancelview').hide();
                                        clearTimeout(clear);
                                    });

                                    function limpiarlabel() {
                                        $('#Codigo').text("");
                                        $('#Nombre').text("");
                                        $('#Foto').text("");
                                        $('#imagev').html("");
                                        $('#cambiar').hide();
                                        $('#upload_img').hide();
                                        $('#search-v').show();
                                        $('#charged').html('');
                                        $('#cancelview').hide();
                                        var output = document.getElementById('output');
                                        output.src = '';
                                        $('#output-size').text('');
                                        $('.selected').removeClass("selected");
                                        $(".custom-file-label").text('Seleccionar Imagen');
                                        $('#newuser').val('0');
                                        $('#form_img')[0].reset();
                                    }

            $("#btnsearch").click(function () {
                    var obj = new Object();
                    obj.vcIdEmpresa = fuGetCdEmpre();
                    obj.vcNroDocumento = $('#code').val();
                    if (obj.vcNroDocumento != '') {
                        $('#charged').html('<img src="img/loader.gif" alt="loading" /><br/><h4>Un momento, por favor...</h4>');
                        $.ajax({
                            type: 'POST',
                            url: "../SerRRHH.asmx/ListPersonalNisira",
                            data: JSON.stringify({ obj: obj }),
                            dataType: 'json',
                            contentType: 'application/json; charset=utf-8',
                            error: function (textStatus) {
                                console.log(JSON.stringify(textStatus));
                                if (textStatus === 'timeout') {
                                    $('#charged').fadeIn(1000).html('');
                                    limpiarlabel();
                                    $('#charged').html('<br><h4>ERROR, Sin respuesta del servidor</h4>');
                                    fclear();
                                }
                            },
                            success: function (data) {
                                var lst = JSON.parse(data.d);
                                //console.log(data);
                                $('#search-v').hide();
                                $('#charged').fadeIn(1000).html('');
                                //$('#Codigo').text(data.Codigo);
                                $('#code2').val(lst[0].Codigo);
                                $('#Nombre').text(lst[0].Nombre);
                                $('#Foto').text(lst[0].Foto + ' Cuenta con Imagen');
                                // $('#FotoRuta').attr("src", data.Ruta);
                                $('#imagev').html(lst[0].base64);

                                document.getElementById("code").autofocus;
                                if (lst[0].Foto == 'No') {
                                    $('#upload_img').show();
                                    $('#newuser').val('0');
                                } else if (lst[0].Foto == 'Si') {
                                    $('#upload_img').hide();
                                    $('#cambiar').text('Cambiar Foto');
                                    $('#cambiar').show();
                                    $('#cancelview').show();
                                    $('#newuser').val('0');
                                    clearTimeout(clear);
                                    fclear();
                                } else {
                                    $('#upload_img').hide();
                                    //limpiarlabel();
                                    $('#Foto').text("");
                                    $('#code2').val(code);
                                    $('#Nombre').text('DNI:' + code);
                                    $('#cancelview').show();
                                    $('#charged').html('<br><h4>Personal no existe en el sistema</h4>');
                                    $('#cambiar').text('Agregar Imagen Temporal en el sistema');
                                    $('#cambiar').show();
                                    $('#newuser').val('1');
                                    fclear();
                                }
                            },
                            timeout: 10000
                        });

                    } else {
                        document.getElementById("code").autofocus;
                        clearTimeout(clear);
                        fclear();
                    }
                
                });

        </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
