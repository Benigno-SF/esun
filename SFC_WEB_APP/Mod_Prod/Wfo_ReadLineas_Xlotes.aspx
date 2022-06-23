<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ReadLineas_Xlotes.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Wfo_ReadLineas_Xlotes" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 p-0 m-0">
                <div id="info" style="display: initial">
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Linea:</label>
                        <asp:DropDownList ID="ddlAreaGrupo" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Cliente:</label>
                        <asp:DropDownList ID="ddlCliente" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Embalaje:</label>
                        <asp:DropDownList ID="ddlEmbalaje" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <asp:UpdatePanel runat="server" ID="UpdDDL">
                        <ContentTemplate>
                            <div class="form-group p-0 m-0">
                                <label for="message-text" class="col-form-label">Cultivo:</label>
                                <asp:DropDownList ID="ddlCultivo" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCultivo_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="form-group p-0 m-0">
                                <label for="message-text" class="col-form-label">Variedad:</label>
                                <asp:DropDownList ID="ddlVariedad" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlCultivo" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Supervisor:</label>
                        <asp:DropDownList ID="ddlSupervisor" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group pt-3 center">
                    <label for="btnAdd">&nbsp;</label>
                    <input type="hidden" id="proceso" value="0" />
                    <input type="hidden" id="procesodetalle" value="0" />
                    <button type="button" id="btnSave" class="btn btn-primary" data-toggle="modal" data-target="#modalevento">
                        <i class="fas fa-plus"></i>Iniciar Lectura
                    </button>
                </div>

            </div>
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" style="display: none" id="lector">
                <div class="col-md-8 mx-auto pt-5">
                    <div class="p-1 bg-light rounded rounded-pill shadow-sm mb-4">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <button type="button" id="Read" data-tipo="add" class="btn btn-link text-warning"><i class="fa fa-barcode"></i></button>
                            </div>
                            <textarea id="CodeBar" name="CodeBar" class="form-control border-0 rounded-pill bg-light" style="height: 50px !important" placeholder="" autofocus="" onblur="this.focus()" required="required" ></textarea>
                        </div>
                    </div>
                </div>
                <div class="row py-2">
                    <div class="col-lg-12 mx-auto text-center">
                        <h1 id="msg" style="font-size: 6rem;"></h1>
                    </div>
                </div>
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
            </div>
        </div>
    </div>

    <script>


        function validar(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 13) {
                $("#Read").click();
            }
            return (tecla != 13);
        }

        function bloqueolinea(obj) {
            $.ajax({
                async: false,
                type: 'POST',
                url: "../SerProd.asmx/BloqueoLinea",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.stringify(data.d);
                    $('#CodeBar').val('');
                    // toastr["success"](JSON.stringify(data.d));
                    $('#proceso').val(lst);
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        };
        $("#btnSave").click(function () {
            var btn = document.getElementById("Read");
            var tipo = btn.getAttribute("data-tipo");
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdArea = $("#<%=ddlAreaGrupo.ClientID%>").val();
            obj.vnIdClieProv = $("#<%=ddlCliente.ClientID%>").val();
            obj.vnIdEmbalaje = $("#<%=ddlEmbalaje.ClientID%>").val();
            obj.vnIdCultivo = $("#<%=ddlCultivo.ClientID%>").val();
            obj.vnIdVariedad = $("#<%=ddlVariedad.ClientID%>").val();
            obj.vnIdSupervisor = $("#<%=ddlSupervisor.ClientID%>").val();
            if (tipo == 'add') {
                if (obj.vnIdClieProv == '00' || obj.vnIdGrupo == '00' || obj.vnIdEmbalaje == '00' || obj.vnIdCultivo == '00' || obj.vnIdVariedad == '00' || obj.vnIdSupervisor == '00') {
                    toastr["warning"]('', "Seleccione todos los campos")
                } else {
                    obj.vbEstado = true;
                    bloqueolinea(obj)
                    if ($('#proceso').val() == 0) {
                        toastr["error"]('', "No se ha Iniciado Proceso")
                    } else {
                        $('#lector').show();
                        $('#info').hide();
                        toastr["success"]('', "Inicie Lectura")
                        $("#<%=ddlAreaGrupo.ClientID%>").attr('disabled', 'disabled');
                        $("#<%=ddlEmbalaje.ClientID%>").attr('disabled', 'disabled');
                        $("#<%=ddlCliente.ClientID%>").attr('disabled', 'disabled');
                        $("#<%=ddlCultivo.ClientID%>").attr('disabled', 'disabled');
                        $("#<%=ddlVariedad.ClientID%>").attr('disabled', 'disabled');
                        $("#<%=ddlSupervisor.ClientID%>").attr('disabled', 'disabled');

                        btn.setAttribute("data-tipo", 'edit');
                        $("#btnSave").html('<i class="fas fa-edit"></i> Modificar Datos');
                        $('#CodeBar').focus();

                        setCookie("linea", obj.vnIdArea, 1);
                        setCookie("cliente", obj.vnIdClieProv, 1);
                        setCookie("embalaje", obj.vnIdEmbalaje, 1);
                        setCookie("cultivo", obj.vnIdCultivo, 1);
                        setCookie("variedad", obj.vnIdVariedad, 1);
                        setCookie("supervisor", obj.vnIdSupervisor, 1);
                    }
                };

            } else {

                obj.vbEstado = false;
                bloqueolinea(obj);

                $('#lector').hide();
                $('#info').show();
                $("#<%=ddlAreaGrupo.ClientID%>").removeAttr('disabled');
                $("#<%=ddlEmbalaje.ClientID%>").removeAttr('disabled');
                $("#<%=ddlCliente.ClientID%>").removeAttr('disabled');
                $("#<%=ddlCultivo.ClientID%>").removeAttr('disabled');
                $("#<%=ddlVariedad.ClientID%>").removeAttr('disabled');
                $("#<%=ddlSupervisor.ClientID%>").removeAttr('disabled');

                btn.setAttribute("data-tipo", 'add');
                $("#btnSave").html('<i class="fas fa-edit"></i> Iniciar Lectura');

                deleteCookie("linea", obj.vnIdArea);
                deleteCookie("cliente", obj.vnIdClieProv);
                deleteCookie("embalaje", obj.vnIdEmbalaje);
                deleteCookie("cultivo", obj.vnIdCultivo);
                deleteCookie("variedad", obj.vnIdVariedad);
                deleteCookie("supervisor", obj.vnIdSupervisor);

            }
        });

        var clear;
        function fclear() {
            clear = setTimeout("limpiar()", 2000);
            $('#CodeBar').focus();
        }

        function limpiar() {
            $('#msg').text("");
        }





        $("#Read").click(function () {
          var ks = CodeBar = $("#CodeBar").val().split("\n");
           $.each(ks, function(k){
               if (ks[k] != '') {
                   leer(ks[k])
               }
           });

        });


            function leer(CodeBar) {
                
            var obj = new Object();
           // CodeBar = $("#CodeBar").val();

            if (CodeBar.length != 19) {
                $('#msg').text('Error en Codigo');
                $('#CodeBar').val('');
                clearTimeout(clear);
                fclear();
                $('#CodeBar').focus();
                return false;
            } else {
                obj.vcIdEmpresa = fuGetCdEmpre();
                obj.vnIdEmbalaje = $("#<%=ddlEmbalaje.ClientID%>").val();
                obj.vnIdGrupo = $("#<%=ddlAreaGrupo.ClientID%>").val();
                obj.vnIdSupervisor = $("#<%=ddlSupervisor.ClientID%>").val();
                if (CodeBar == '' || obj.vnIdCodPartida == '00' || obj.vnIdGrupo == '00' || obj.vnIdEmbalaje == '00') {
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
                    obj.vnIdClieProv = $("#<%=ddlCliente.ClientID%>").val();
                    obj.vnIdEmbalaje = $("#<%=ddlEmbalaje.ClientID%>").val();
                    obj.vnIdCultivo = $("#<%=ddlCultivo.ClientID%>").val();
                    obj.vnIdVariedad = $("#<%=ddlVariedad.ClientID%>").val();
                    obj.vnIdSupervisor = $("#<%=ddlSupervisor.ClientID%>").val();
                    
                    $.ajax({
                        type: 'POST',
                        url: "../SerProd.asmx/LecturaCode",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            $('#CodeBar').val('');
                            vnVal = lst[0].IdRendPack * 1;
                            if (lst[0].IdProceso != 0)
                                switch (vnVal) {
                                    case 0:
                                        ShowToast("warning", 'Error! Etiqueta Ya fue Leida', lst[0].Colaborador);
                                        $(document).ready(function () {
                                            var snd = new Audio("../sound/error.mp3");
                                            snd.play();
                                        });
                                        $('#msg').text('Error! Etiqueta Ya fue Leida de ' + lst[0].Colaborador);
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
                                        clearTimeout(clear);
                                        fclear();
                                        break;
                                    case 1:
                                        ShowToast("success", 'LECTURA CORRECTA', lst[0].Colaborador);
                                        $(document).ready(function () {
                                            var snd = new Audio("../sound/ok.mp3");
                                            snd.play();
                                        });
                                        $('#msg').text(lst[0].Colaborador + '- CORRECTO');
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
                            else
                                ShowToast("error", "Error...", "No tiene un proceso aperturado");
                            document.getElementById("CodeBar").autofocus;
                        },
                        error: function (error) {
                            console.log(error);
                            alert(JSON.stringify(error))
                        }
                    });
                }
            }
        };
        function ShowToast(tipo, titulo, mensaje ) {
            toastr.options = {
                tapToDismiss: false
                , timeOut: 0
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
            var linea = getCookie("linea");
            var cliente = getCookie("cliente");
            var embalaje = getCookie("embalaje");
            var cultivo = getCookie("cultivo");
            var variedad = getCookie("variedad");
            var supervisor = getCookie("supervisor");
            if (linea != "" && cliente != "" && embalaje != "" && cultivo != "" && variedad != "" && supervisor != "") {
                $("#<%=ddlAreaGrupo.ClientID%>").append($('<option />', {
                    text: 'Linea ' + linea,
                    value: linea,
                }));
                $("#<%=ddlAreaGrupo.ClientID%>").val(linea);
                $("#<%=ddlCliente.ClientID%>").val(cliente);
                $("#<%=ddlEmbalaje.ClientID%>").val(embalaje);
                $("#<%=ddlCultivo.ClientID%>").val(cultivo);
                $("#<%=ddlVariedad.ClientID%>").append($('<option />', {
                    text: 'Variedad ' + variedad,
                    value: variedad,
                }));
                $("#<%=ddlVariedad.ClientID%>").val(variedad);
                $("#<%=ddlSupervisor.ClientID%>").val(supervisor);

                $('#lector').show();
                $('#info').hide();
                $("#<%=ddlAreaGrupo.ClientID%>").attr('disabled', 'disabled');
                $("#<%=ddlEmbalaje.ClientID%>").attr('disabled', 'disabled');
                $("#<%=ddlCliente.ClientID%>").attr('disabled', 'disabled');
                $("#<%=ddlCultivo.ClientID%>").attr('disabled', 'disabled');
                $("#<%=ddlVariedad.ClientID%>").attr('disabled', 'disabled');
                $("#<%=ddlSupervisor.ClientID%>").attr('disabled', 'disabled');
                var btn = document.getElementById("Read");
                var tipo = btn.getAttribute("data-tipo");
                btn.setAttribute("data-tipo", 'edit');
                $("#btnSave").html('<i class="fas fa-edit"></i> Modificar Datos');
                $('#CodeBar').focus();
            }
        }
        checkCookie();

        function askConfirmation(evt) {
            var msg = 'Si recarga la página perdera todos los datos ingresados.\n¿Deseas recargar la página?';
            evt.returnValue = msg;
            return msg;
        }
        window.addEventListener('beforeunload', askConfirmation);

    </script>



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>