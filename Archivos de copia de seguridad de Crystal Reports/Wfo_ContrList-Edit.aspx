<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ContrList-Edit.aspx.cs" Inherits="SFC_WEB_APP.Mod_Cali.Wfo_ContrList_Edit" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .b {
        }

        .dvMargin {
        }

        .inputfile {
            width: 0.1px;
            height: 0.1px;
            opacity: 0;
            overflow: hidden;
            position: absolute;
            z-index: -1;
        }

            .inputfile + label {
                font-size: 14px;
                font-weight: 600;
                background-image: none;
                display: inline-block;
                transition: all .5s;
                cursor: pointer;
                padding: 6px 12px;
                !important;
                text-transform: uppercase;
                width: fit-content;
                text-align: center;
                border: 1px solid transparent;
                border-radius: 4px;
                color: #fff;
                background-color: #337ab7;
                border-color: #2e6da4;
            }

                .inputfile + label:focus,
                .inputfile + label.focus {
                    color: #fff;
                    background-color: #286090;
                    border-color: #122b40;
                }

                .inputfile + label:hover {
                    color: #fff;
                    background-color: #286090;
                    border-color: #204d74;
                }

        .wrapper {
            width: 50%;
        }

            .wrapper img {
                max-width: 280px;
            }

        .red {
            border: 2px solid red;
            border-radius: 4px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
    <li class="breadcrumb-item"><a href="<%= ResolveUrl("~/") %>">Home</a></li>
    <li class="breadcrumb-item"><a href="#">Calidad</a></li>
    <li class="breadcrumb-item"><a href="<%= ResolveUrl("~/Mod_Cali/Wfo_ContrList.aspx") %>">Formatos</a></li>
    <li class="breadcrumb-item active">Registro de Muestra</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <div class="container">
        <div id="DvMues" class="row">
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 col-xl-3">
                <div class="form-group">
                    <label for="txtFeMues">H. Inicio</label>
                    <div class='input-group input-append date' id='DivFeMues'>
                        <input type="text" id="txtFeMues" class="form-control" placeholder="HH:mm" autocomplete="off" />
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-time"></span>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div id="DvMast" class="row">
        </div>
        <br />
        <div id="DvFoto" class="row">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                <div id="1dvImg" class="wrapper"></div>
                <div class="input-group">
                    <span class="input-group-btn">
                        <span class="inputfile 1InpFile">
                            <input type="file" name="inputfile" class="Img" id="1InpFile" accept="image/*" />
                        </span>
                        <label for="1InpFile"><span id="1InpFileS">Imagen</span> <span class="glyphicon glyphicon-camera"></span></label>
                    </span>
                    <input type="text" id="1txtDesc" class="form-control" placeholder="Escribe algun comentario">
                    <asp:HiddenField ID="hidIdFoto1" runat="server" Value="0" />
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                <div id="2dvImg" class="wrapper"></div>
                <div class="input-group">
                    <span class="input-group-btn">
                        <span class="inputfile 2InpFile">
                            <input type="file" name="inputfile" class="Img" id="2InpFile" accept="image/*" />
                        </span>
                        <label for="2InpFile"><span id="2InpFileS">Imagen</span> <span class="glyphicon glyphicon-camera"></span></label>
                    </span>
                    <input type="text" id="2txtDesc" class="form-control" placeholder="Escribe algun comentario">

                    <asp:HiddenField ID="hidIdFoto2" runat="server" Value="0" />
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                <div id="3dvImg" class="wrapper"></div>
                <div class="input-group">
                    <span class="input-group-btn">
                        <span class="inputfile 3InpFile">
                            <input type="file" name="inputfile" class="Img" id="3InpFile" accept="image/*" />
                        </span>
                        <label for="3InpFile"><span id="3InpFileS">Imagen</span> <span class="glyphicon glyphicon-camera"></span></label>
                    </span>
                    <input type="text" id="3txtDesc" class="form-control" placeholder="Escribe algun comentario">

                    <asp:HiddenField ID="hidIdFoto3" runat="server" Value="0" />
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                <div id="4dvImg" class="wrapper"></div>
                <div class="input-group">
                    <span class="input-group-btn">
                        <span class="inputfile 4InpFile">
                            <input type="file" name="inputfile" class="Img" id="4InpFile" accept="image/*" />
                        </span>
                        <label for="4InpFile"><span id="4InpFileS">Imagen</span> <span class="glyphicon glyphicon-camera"></span></label>
                    </span>
                    <input type="text" id="4txtDesc" class="form-control" placeholder="Escribe algun comentario">

                    <asp:HiddenField ID="hidIdFoto4" runat="server" Value="0" />
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <label for="txtObseMuestra">Observación</label>
                <textarea id="txtObseMuestra" class="form-control noresize" rows="3"></textarea>
            </div>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <button type="button" class="btn btn-primary btn-lg" data-loading-text="Guardando..." id="btnSave">
                    Guardar
            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
                </button>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="hidIdForm" runat="server" />
    <asp:HiddenField ID="hidIdCont" runat="server" />
    <asp:HiddenField ID="hidIdMues" runat="server" />
    <asp:HiddenField ID="hidIdFoto" runat="server" />
    <script>
        var reader1 = new FileReader();
        var fileName1 = "";
        var reader2 = new FileReader();
        var fileName2 = "";
        var reader3 = new FileReader();
        var fileName3 = "";
        var reader4 = new FileReader();
        var fileName4 = "";
        var IdValid = 0;
        var bUnload = true;

        $(window).bind('beforeunload', function () {
            if (bUnload)
                return Unload();
        });
        function Unload() {
            var InEsta = 1;
            $("#DvMast input").each(function () {
                if ($(this).val().length > 1) {
                    InEsta = 1;
                    return false
                }
            });
            $("#DvImag input").each(function () {
                if ($(this).val().length > 1) {
                    InEsta = 1;
                    return false
                }
            });
            if ($('#txtObseMuestra').val().length)
                InEsta = 1;
            if (InEsta > 0) {
                return 'Si usted sale de la pagina no se guardaran los cambios';
            }
        }
        function Validar() {
            var css = "red";
            if ($("#txtFeMues").val().length > 0)
                $("#txtFeMues").removeClass(css)
            else {
                $("#txtFeMues").addClass(css).focus();
                IdValid += 1
                return false;
            }
            //($("#txtFeMues").val().length > 0) ? $("#txtFeMues").removeClass(css) : ;
            $("#DvMast input").each(function () {
                var CtrlId = $(this).attr('id');
                if (CtrlId.substring(0, 4) == "Part") {
                    if (CtrlId.substring(6, 7) == 1) {
                        if ($(this).val().length > 0) {
                            $(this).removeClass(css)
                        } else {
                            $(this).addClass(css).focus();
                            IdValid += 1
                            return false;
                        }
                    }
                }
            });
        }
        $("#btnSave").click(function () {
            var $btn = $(this).button('loading')
            IdValid = 0
            Validar();
            if (IdValid == 0)
                Guardar();
            $btn.button('reset')
            //alert($(this).attr('id') + "-" + $(this).val() + "-" + IdCont);
        });
        function Guardar() {
            var ObCtrlAll = new Array();
            var obMues = new Object();
            obMues.vnIdTiRow = 1;
            obMues.vcIdEmpresa = fuGetCdEmpre();
            obMues.vnIdFormato = fuIdForm();
            obMues.vnIdControl = fuIdCont();
            obMues.vnIdMuestra = fuIdMues();
            obMues.vnIdFoto = fuIdFoto();
            obMues.vcObseMuestra = $("#txtObseMuestra").val();
            obMues.vcModulo = "calidad";
            obMues.vcFecha = $("#txtFeMues").val();
            ObCtrlAll.push(obMues);
            $("#DvMast input").each(function () {
                var obMuesDeta = new Object();
                var CtrlId = $(this).attr('id');
                if (CtrlId.substring(0, 4) == "Part") {
                    obMuesDeta.vnIdTiRow = 2
                    obMuesDeta.vnIdParametro = CtrlId.substring(9, CtrlId.length) * 1;
                    obMuesDeta.vcValor = $(this).val();
                    obMuesDeta.vcObseDetalle = "";
                    if (CtrlId.substring(7, 8) == "1") {
                        obMuesDeta.vcObseDetalle = $("#Obs" + CtrlId.substring(3, CtrlId.lenght)).val();
                    }
                    ObCtrlAll.push(obMuesDeta);
                }
            });
            /*----------------------------------------------------------*/
            if (document.getElementById("1InpFile").files.length > 0) {
                var byteData = reader1.result;
                byteData = byteData.split(';')[1].replace("base64,", "");
                //modulo foto y observacion
                var obMuesFoto = new Object();
                obMuesFoto.vnIdTiRow = 3;
                obMuesFoto.vnIdFotoDeta = 1;
                obMuesFoto.FileString = byteData;
                obMuesFoto.vcObseFoto = $("#1txtDesc").val()
                ObCtrlAll.push(obMuesFoto);
            }
            if (document.getElementById("2InpFile").files.length > 0) {
                var byteData = reader2.result;
                byteData = byteData.split(';')[1].replace("base64,", "");
                //modulo foto y observacion
                var obMuesFoto = new Object();
                obMuesFoto.vnIdTiRow = 3;
                obMuesFoto.vnIdFotoDeta = 2;
                obMuesFoto.FileString = byteData;
                obMuesFoto.vcObseFoto = $("#2txtDesc").val()
                ObCtrlAll.push(obMuesFoto);
            }
            if (document.getElementById("3InpFile").files.length > 0) {
                var byteData = reader3.result;
                byteData = byteData.split(';')[1].replace("base64,", "");
                //modulo foto y observacion
                var obMuesFoto = new Object();
                obMuesFoto.vnIdTiRow = 3;
                obMuesFoto.vnIdFotoDeta = 3;
                obMuesFoto.FileString = byteData;
                obMuesFoto.vcObseFoto = $("#3txtDesc").val()
                ObCtrlAll.push(obMuesFoto);
            }
            if (document.getElementById("4InpFile").files.length > 0) {
                var byteData = reader4.result;
                byteData = byteData.split(';')[1].replace("base64,", "");
                //modulo foto y observacion
                var obMuesFoto = new Object();
                obMuesFoto.vnIdTiRow = 3;
                obMuesFoto.vnIdFotoDeta = 4;;
                obMuesFoto.FileString = byteData;
                obMuesFoto.vcObseFoto = $("#4txtDesc").val()
                ObCtrlAll.push(obMuesFoto);
            }
            $.ajax({
                type: "POST",
                url: "../SerCali.asmx/GuardarMuestra",
                data: JSON.stringify({ List: ObCtrlAll }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var DatFotoList = JSON.parse(data.d);
                    for (var i = 0; i < DatFotoList.length; i++) {
                        var rwList = DatFotoList[i];
                        $("#" + rwList.IdFoto + "dvImg").html("<img src='.." + rwList.RuFoto + "' alt='' class='img-thumbnail img-responsive'>");
                    }
                    bUnload = false;
                    window.location = "Wfo_ContrList.aspx?Cd=" + fuGetCdEmpre();
                },
                timeout: 20000,
                error: function (request, status, err) {
                    if (status == "timeout") {
                        alert("Su petición demoro mas de lo permitido");
                    } else {
                        // another error occured  
                        alert("error: " + request + status + err);
                        console.log(JSON.stringify(request))
                    }
                },
                failure: function (data) {
                    alert(data.responseText);
                }
            });
        };
        $(document).ready(function () {

            LoadControls();
            $(".decimal").on("input", function (evt) {
                var self = $(this);
                self.val(self.val().replace(/[^0-9\.]/g, ''));
                if ((evt.which != 46 || self.val().indexOf('.') != -1) && (evt.which < 48 || evt.which > 57)) {
                    evt.preventDefault();
                }
            });
            $(".entero").on("input", function (evt) {
                this.value = (this.value + '').replace(/[^0-9]/g, '');

            });
            $('input[type=file]').change(function () {
                var filename = $(this).val().split('\\').pop();
                var idname = $(this).attr('id');
                console.log($(this));
                console.log(filename);
                console.log(idname);
                $('span.' + idname).next().find('#' + idname + 'S').html(filename);
            });
            if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
                console.log('Esto es un dispositivo móvil');
                $('#txtFeMues').attr("type", "time");
            } else {
                $('#txtFeMues').attr("type", "text");
            }
        });

        $('#1InpFile').change(function () {
            var CtrlId = $(this).attr('id');
            var IdFile = CtrlId.substring(0, 1)
            if (typeof (FileReader) != "undefined") {
                var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                $($(this)[0].files).each(function () {
                    var file = $(this);
                    if (regex.test(file[0].name.toLowerCase())) {
                        fileName1 = file[0].name;
                        reader1.readAsDataURL(file[0]);
                    } else {
                        alert(file[0].name + " is not a valid image file.");
                        return false;
                    }
                });
            } else {
                alert("This browser does not support HTML5 FileReader.");
            }
        });
        $('#2InpFile').change(function () {
            var CtrlId = $(this).attr('id');
            var IdFile = CtrlId.substring(0, 1)
            if (typeof (FileReader) != "undefined") {
                var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                $($(this)[0].files).each(function () {
                    var file = $(this);
                    if (regex.test(file[0].name.toLowerCase())) {
                        fileName2 = file[0].name;
                        reader2.readAsDataURL(file[0]);
                    } else {
                        alert(file[0].name + " is not a valid image file.");
                        return false;
                    }
                });
            } else {
                alert("This browser does not support HTML5 FileReader.");
            }
        });
        $('#3InpFile').change(function () {
            var CtrlId = $(this).attr('id');
            var IdFile = CtrlId.substring(0, 1)
            if (typeof (FileReader) != "undefined") {
                var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                $($(this)[0].files).each(function () {
                    var file = $(this);
                    if (regex.test(file[0].name.toLowerCase())) {
                        fileName3 = file[0].name;
                        reader3.readAsDataURL(file[0]);
                    } else {
                        alert(file[0].name + " is not a valid image file.");
                        return false;
                    }
                });
            } else {
                alert("This browser does not support HTML5 FileReader.");
            }
        });
        $('#4InpFile').change(function () {
            var CtrlId = $(this).attr('id');
            var IdFile = CtrlId.substring(0, 1)
            if (typeof (FileReader) != "undefined") {
                var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                $($(this)[0].files).each(function () {
                    var file = $(this);
                    if (regex.test(file[0].name.toLowerCase())) {
                        fileName4 = file[0].name;
                        reader4.readAsDataURL(file[0]);
                    } else {
                        alert(file[0].name + " is not a valid image file.");
                        return false;
                    }
                });
            } else {
                alert("This browser does not support HTML5 FileReader.");
            }
        });
        function LoadControls() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdFormato = fuIdForm();
            obj.vnIdControl = fuIdCont();
            obj.vnIdMuestra = fuIdMues();
            $.ajax({
                type: 'POST',
                url: "../SerCali.asmx/ListMuestra",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var DatParaList = JSON.parse(data.d);
                    for (var i = 0; i < DatParaList.length; i++) {
                        var rwList = DatParaList[i];
                        MakeControls(rwList.nIdPara,
                            rwList.cDescri,
                            rwList.cUnMedi,
                            rwList.cTiDato,
                            rwList.bInObse,
                            rwList.bInObli);
                    }
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        };
        function MakeControls(IdPara, Descri, UnMedi, TiDato, InObse, InObli) {
            var vnObse = InObse ? 1 : 0
            var vnObli = InObli ? 1 : 0
            var NoPara = "Partxt" + vnObli + "" + vnObse + "P" + IdPara;
            var NoObse = "Obstxt" + vnObli + "" + vnObse + "P" + IdPara;
            var htObse = "";
            if (InObse) {
                htObse =
                    "<div class='b'" +
                    "<div class='form-group col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2'>" +
                    "<label for='" + NoObse + "'>" + Descri + " Obs </label>" +
                    "<input id='" + NoObse + "' type='text' class='form-control' placeholder='Observación...' /> " +
                    "</div>" +
                    "</div>"
            }
            switch (TiDato) {
                case "E":
                    $('#DvMast').append(
                        "<div class='dvMargin'>" +
                        "<div class='b'" +
                        "<div class='form-group col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2'>" +
                        "<label for='" + NoPara + "'>" + Descri + " " + UnMedi + "</label>" +
                        "<input id='" + NoPara + "' " + (InObli ? "Required" : "") + " type='number' maxlength='10' class='form-control entero' pattern='[0-9]*' inputmode='numeric' /> " +
                        "</div>" +
                        "</div>" +
                        htObse +
                        "</div>"
                    )
                    break;
                case "D":
                    $('#DvMast').append(
                        "<div class='dvMargin'>" +
                        "<div class='b'" +
                        "<div class='form-group col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2'>" +
                        "<label for='" + NoPara + "'>" + Descri + " " + UnMedi + "</label>" +
                        "<input id='" + NoPara + "' " + (InObli ? "Required" : "") + " type='text' maxlength='10' class='form-control decimal'> " +
                        "</div>" +
                        "</div>" +
                        htObse +
                        "</div>"
                    )
                    break;
                case "C":
                    $('#DvMast').append(
                        "<div class='dvMargin'>" +
                        "<div class=' b'" +
                        "<div class='form-group col-xs-6 col-sm-6 col-md-6 col-lg-4 col-xl-3 px-3'>" +
                        "<label for='" + NoPara + "'>" + Descri + " " + UnMedi + "</label>" +
                        "<input id='" + NoPara + "' " + (InObli ? "Required" : "") + " type='text' maxlength='10' class='form-control'> " +
                        "</div>" +
                        "</div>" +
                        htObse +
                        "</div>"
                    )
                    break;
                case "S":

                    break;
            }
        }
        $(function () {
            if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
                console.log('Esto es un dispositivo móvil');
            }
            else {
                $('#txtFeMues').datetimepicker({
                    format: 'HH:mm'

                });
                $(function () {
                    $('#DivFeMues').datetimepicker({
                        format: 'HH:mm'
                    });
                });
            }
        });
        function fuIdForm() {
            return $('#<%=hidIdForm.ClientID%>').val() * 1;
        }
        function fuIdCont() {
            return $('#<%=hidIdCont.ClientID%>').val() * 1;
        }
        function fuIdMues() {
            return $('#<%=hidIdMues.ClientID%>').val() * 1;
        }
        function fuSetIdMues(valor) {
            $('#<%=hidIdMues.ClientID%>').val(valor);
        }
        function fuIdFoto() {
            return $('#<%=hidIdFoto.ClientID%>').val() * 1;
        }
        function fuSetIdFoto(valor) {
            $('#<%=hidIdFoto.ClientID%>').val(valor);
        }
        function fuIdFoto1() {
            return $('#<%=hidIdFoto1.ClientID%>').val() * 1;
        }
        function fuIdFoto2() {
            return $('#<%=hidIdFoto2.ClientID%>').val() * 1;
        }
        function fuIdFoto3() {
            return $('#<%=hidIdFoto3.ClientID%>').val() * 1;
        }
        function fuIdFoto4() {
            return $('#<%=hidIdFoto4.ClientID%>').val() * 1;
        }
        function fuSetIdFoto1(valor) {
            return $('#<%=hidIdFoto1.ClientID%>').val(valor);
        }
        function fuSetIdFoto2(valor) {
            return $('#<%=hidIdFoto2.ClientID%>').val(valor);
        }
        function fuSetIdFoto3(valor) {
            return $('#<%=hidIdFoto3.ClientID%>').val(valor);
        }
        function fuSetIdFoto4(valor) {
            return $('#<%=hidIdFoto4.ClientID%>').val(valor);
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
