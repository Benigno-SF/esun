<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ReadLineas.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Wfo_ReadLineas" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/qrcode.js"></script>
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


        /*QR*/

        .qr-code-generator {
            width: 500px;
            margin: 0 auto;
        }

            .qr-code-generator * {
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }

        #qrcode {
            width: 128px;
            height: 128px;
            margin: 0 auto;
            text-align: center;
        }

            #qrcode a {
                font-size: 0.8em;
            }

        .qr-url, .qr-size {
            padding: 0.5em;
            border: 1px solid #ddd;
            border-radius: 2px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .qr-url {
            width: 79%;
        }

        .qr-size {
            width: 20%;
        }

        .generate-qr-code {
            display: block;
            width: 100%;
            margin: 0.5em 0 0;
            padding: 0.25em;
            font-size: 1.2em;
            border: none;
            cursor: pointer;
            background-color: #e5554e;
            color: #fff;
        }
        /* STYLE */

        /* this will set the toastr icon */
        #toast-container > .toast-custom {
            content: "\f00C";
        }

        /* this will set the toastr style */
        .toast-custom {
            background-color: purple;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 p-0 m-0">
                <div class="col-md-12 mx-auto pt-5">
                    <div class="p-1 bg-light rounded rounded-pill shadow-sm mb-4">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <button type="button" id="ReadHead" class="btn btn-link text-warning"><i class="fa fa-check"></i></button>
                            </div>
                            <input type="text" id="CodeHead" name="CodeHead" class="form-control border-0 rounded-pill bg-light" placeholder="" autofocus="" onkeypress="return validarhead(event)" />
                        </div>
                    </div>
                </div>
                <div id="info" style="display: initial">
                    <div class="form-group p-0 m-0">
                        <label for="ddlAProceso" class="col-form-label">Area de Proceso</label>
                        <asp:DropDownList ID="ddlAProceso" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Linea:</label>
                        <asp:DropDownList ID="ddlAreaGrupo" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Cliente:</label>
                        <asp:DropDownList ID="ddlCliente" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Cultivo:</label>
                        <asp:DropDownList ID="ddlCultivo" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Variedad:</label>
                        <asp:DropDownList ID="ddlVariedad" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Embalaje:</label>
                        <asp:DropDownList ID="ddlEmbalaje" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
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
                    <br />
                    C:<span id="correcto"></span>&nbsp;E:<span id="errores"></span>&nbsp;R:<span id="releidos"></span>

                </div>

            </div>
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" style="display: none" id="lector">
                <div class="col-md-8 mx-auto pt-5">
                    <div class="p-1 bg-light rounded rounded-pill shadow-sm mb-4">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <button type="button" id="Read" data-tipo="add" class="btn btn-link text-warning"><i class="fa fa-barcode"></i></button>
                            </div>
                            <input type="text" id="CodeBar" name="CodeBar" class="form-control border-0 rounded-pill bg-light" style="height: 50px !important" placeholder="" autofocus="" onblur="this.focus()" required="required" onkeypress="return validar(event)" />
                        </div>
                    </div>
                    <span id="infolinea"></span>
                </div>
                <div class="row py-2">
                    <div class="col-lg-12 mx-auto text-center">
                        <h1 id="msg" style="font-size: 6rem;"></h1>
                    </div>
                </div>
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
            </div>
            <div class="qr-code-generator" style="text-align: center">
                <span id="txtcode" style="text-align: center; font-weight: bold; font-size: 2rem;"></span>
                <div id="qrcode"></div>
            </div>
        </div>
    </div>
    <script>

        //$('#CodeBar').on('keydown keypress', function (e) {
        //    if (e.key.length === 1) { // Evaluar si es un solo caracter
        //        if ($(this).val().length < 19) { /* Comprobar que
        //                                                             * son menos de 12
        //                                                             * catacteres y que
        //                                                             * es un número */
        //            $(this).val($(this).val() + e.key); // Muestra el valor en el input
        //            $("#Read").click();
        //        }
        //        return false;
        //    }
        //});
        var ss = 0
        var ee = 0


        var leidos = 0;
        var errorcode = 0;
        var releidos = 0;
        var codex = '';

        function validar(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 13) {
                $("#Read").click();
            }
            return (tecla != 13);
        }

        function validarhead(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 13) {
                $("#ReadHead").click();
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
                    if (error.status == '401') {
                        window.location.reload();
                    } else {
                        alert(JSON.stringify(error));
                    }
                }
            });
        };
        $("#btnSave").click(function () {
            var btn = document.getElementById("Read");
            var tipo = btn.getAttribute("data-tipo");
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdAreaProceso = $("#<%=ddlAProceso.ClientID%>").val();
            obj.vnIdArea = $("#<%=ddlAreaGrupo.ClientID%>").val();
            obj.vnIdGrupo = $("#<%=ddlAreaGrupo.ClientID%>").val();
            obj.vNameLinea = $("#<%=ddlAreaGrupo.ClientID%> option:selected").text();
            obj.vnIdClieProv = $("#<%=ddlCliente.ClientID%>").val();
            obj.vnIdEmbalaje = $("#<%=ddlEmbalaje.ClientID%>").val();
            obj.vnIdCultivo = $("#<%=ddlCultivo.ClientID%>").val();
            obj.vnIdVariedad = $("#<%=ddlVariedad.ClientID%>").val();
            obj.vnIdSupervisor = $("#<%=ddlSupervisor.ClientID%>").val();
            if (tipo == 'add') {
                if (obj.vnIdClieProv == '0' || obj.vnIdGrupo == '0' || obj.vnIdEmbalaje == '0' || obj.vnIdCultivo == '0' || obj.vnIdVariedad == '0' || obj.vnIdSupervisor == '0') {
                    toastr["warning"]('', "Seleccione todos los campos")
                } else {
                    obj.vbEstado = true;
                    bloqueolinea(obj)
                    if ($('#proceso').val() == 0) {
                        toastr["error"]('', "No se ha Iniciado Proceso")
                    } else {
                        $('#lector').show();
                        //$('#info').hide();
                        toastr["success"]('', "Inicie Lectura")
                        $("#<%=ddlAProceso.ClientID%>").attr('disabled', 'disabled');
                        $("#<%=ddlAreaGrupo.ClientID%>").attr('disabled', 'disabled');
                        $("#<%=ddlEmbalaje.ClientID%>").attr('disabled', 'disabled');
                        $("#<%=ddlCliente.ClientID%>").attr('disabled', 'disabled');
                        $("#<%=ddlCultivo.ClientID%>").attr('disabled', 'disabled');
                        $("#<%=ddlVariedad.ClientID%>").attr('disabled', 'disabled');
                        $("#<%=ddlSupervisor.ClientID%>").attr('disabled', 'disabled');

                        btn.setAttribute("data-tipo", 'edit');
                        $("#btnSave").html('<i class="fas fa-edit"></i> Modificar Datos');
                        $('#CodeBar').focus();

                        setCookie("area", obj.vnIdAreaProceso, 1);
                        setCookie("linea", obj.vnIdArea, 1);
                        setCookie("namelinea", obj.vNameLinea, 1);
                        setCookie("cliente", obj.vnIdClieProv, 1);
                        setCookie("embalaje", obj.vnIdEmbalaje, 1);
                        setCookie("cultivo", obj.vnIdCultivo, 1);
                        setCookie("variedad", obj.vnIdVariedad, 1);
                        setCookie("supervisor", obj.vnIdSupervisor, 1);

                        $.ajax({
                            type: 'POST',
                            url: "../SerProd.asmx/RegiRendimientoProcesoDetalle",
                            data: JSON.stringify({ obj: obj }),
                            dataType: 'json',
                            contentType: 'application/json; charset=utf-8',
                            success: function (data) {
                                $('#proceso').val(data.d[0]);
                                $('#procesodetalle').val(data.d[1]);
                                $("#CodeHead").val(data.d[1]);

                                $('#infolinea').text(obj.vNameLinea + ' - ' + $("#<%=ddlSupervisor.ClientID%> :selected").text());

                                setCookie("proceso", data.d[0], 1);
                                setCookie("procesodetalle", data.d[1], 1);

                                // Clear Previous QR Code
                                $('#qrcode').empty();

                                // Set Size to Match User Input
                                $('#qrcode').css({
                                    'width': 128,
                                    'height': 128
                                })

                                // Generate and Output QR Code
                                var txtcd = data.d[1];
                                $('#qrcode').qrcode({ width: 128, height: 128, text: txtcd });
                                $('#txtcode').text(txtcd);

                                $('#CodeHead').val('');
                            }, error: function (error) {
                                if (error.status == '401') {
                                    window.location.reload();
                                } else {
                                    alert(JSON.stringify(error));
                                }
                            }
                        });


                    }
                };
            } else {

                obj.vbEstado = false;
                bloqueolinea(obj);

                $('#lector').hide();
                // $('#info').show();
                $("#<%=ddlAProceso.ClientID%>").removeAttr('disabled');
                $("#<%=ddlAreaGrupo.ClientID%>").removeAttr('disabled');
                $("#<%=ddlEmbalaje.ClientID%>").removeAttr('disabled');
                $("#<%=ddlCliente.ClientID%>").removeAttr('disabled');
                $("#<%=ddlCultivo.ClientID%>").removeAttr('disabled');
                $("#<%=ddlVariedad.ClientID%>").removeAttr('disabled');
                $("#<%=ddlSupervisor.ClientID%>").removeAttr('disabled');

                btn.setAttribute("data-tipo", 'add');
                $("#btnSave").html('<i class="fas fa-edit"></i> Iniciar Lectura');

                deleteCookie("area", obj.vnIdAreaProceso);
                deleteCookie("linea", obj.vnIdArea);
                deleteCookie("namelinea", obj.vNameLinea);
                deleteCookie("cliente", obj.vnIdClieProv);
                deleteCookie("embalaje", obj.vnIdEmbalaje);
                deleteCookie("cultivo", obj.vnIdCultivo);
                deleteCookie("variedad", obj.vnIdVariedad);
                deleteCookie("supervisor", obj.vnIdSupervisor);

                $.ajax({
                    type: 'POST',
                    url: "../SerProd.asmx/RegiRendimientoProcesoDetalle",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        $('#proceso').val(0);
                        $('#procesodetalle').val(0);

                        $('#qrcode').empty();
                        $('#txtcode').text('');
                        $('#CodeHead').val('');

                        $('#infolinea').text(obj.vNameLinea + ' - ' + $("#<%=ddlSupervisor.ClientID%> :selected").text()),

                            deleteCookie("proceso", data.d[0]);
                        deleteCookie("procesodetalle", data.d[1]);
                    }, error: function (error) {
                        if (error.status == '401') {
                            window.location.reload();
                        } else {
                            alert(JSON.stringify(error));
                        }
                    }
                });


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

        $("#ReadHead").click(function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            CodeHead = $("#CodeHead").val();
            if (CodeHead != '' && obj.vcIdEmpresa != '') {
                obj.vnIdProceso = $('#proceso').val();
                obj.vnIdProcesoDetalle = CodeHead;
                obj.vnIdArea = 1;
                obj.vnIdGrupo = 0;
                obj.vcFecha = '';
                $.ajax({
                    type: 'POST',
                    url: "../SerProd.asmx/ListRendimientoProcesoDetalle",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst != '') {
                            // $('#CodeHead').val('');
                            // $('#CodeHead').hide();
                            var area = lst[0].nIdArea;
                            var linea = lst[0].nIdGrupo;
                            var proceso = lst[0].nIdProceso;
                            var procesodetalle = lst[0].nIdProcesoDetalle;
                            var linea = lst[0].nIdGrupo;
                            var namelinea = lst[0].cDescAGrupo;
                            var cliente = lst[0].nIdClieProv;
                            var embalaje = lst[0].nIdEmbalaje;
                            var cultivo = lst[0].nIdCultivo;
                            var variedad = lst[0].nIdVariedad;
                            var supervisor = lst[0].nIdsupervisor;
                            if (area != "" && linea != "" && cliente != "" && embalaje != "" && cultivo != "" && variedad != "" && supervisor != "") {
                                $("#<%=ddlAProceso.ClientID%>").val(area);
                                Load_Agrupo(area, linea, namelinea);
                                $("#<%=ddlCliente.ClientID%>").val(cliente);
                                $("#<%=ddlCultivo.ClientID%>").val(cultivo);
                                $("#<%=ddlSupervisor.ClientID%>").val(supervisor);
                                Load_Variedad(cultivo, variedad);
                                Load_Embalaje(cultivo, embalaje);
                                $('#lector').show();
                                // $('#info').hide();
                                $("#<%=ddlAProceso.ClientID%>").attr('disabled', 'disabled');
                                $("#<%=ddlAreaGrupo.ClientID%>").attr('disabled', 'disabled');
                                $("#<%=ddlEmbalaje.ClientID%>").attr('disabled', 'disabled');
                                $("#<%=ddlCliente.ClientID%>").attr('disabled', 'disabled');
                                $("#<%=ddlCultivo.ClientID%>").attr('disabled', 'disabled');
                                $("#<%=ddlVariedad.ClientID%>").attr('disabled', 'disabled');
                                $("#<%=ddlSupervisor.ClientID%>").attr('disabled', 'disabled');

                                setCookie("area", area, 1);
                                setCookie("linea", linea, 1);
                                setCookie("namelinea", namelinea, 1);
                                setCookie("cliente", cliente, 1);
                                setCookie("embalaje", embalaje, 1);
                                setCookie("cultivo", cultivo, 1);
                                setCookie("variedad", variedad, 1);
                                setCookie("supervisor", supervisor, 1);
                                setCookie("proceso", proceso, 1);
                                setCookie("procesodetalle", procesodetalle, 1);

                                $('#proceso').val(proceso);
                                $('#procesodetalle').val(procesodetalle);

                                $('#infolinea').text(namelinea + ' - ' + $("#<%=ddlSupervisor.ClientID%> :selected").text());

                                var btn = document.getElementById("Read");
                                var tipo = btn.getAttribute("data-tipo");
                                btn.setAttribute("data-tipo", 'edit');
                                $("#btnSave").html('<i class="fas fa-edit"></i> Modificar Datos');
                                $('#CodeBar').focus();
                                $('#CodeHead').val('');
                                $('#qrcode').empty();

                                // Set Size to Match User Input
                                $('#qrcode').css({
                                    'width': 128,
                                    'height': 128
                                })
                                // Generate and Output QR Code
                                var txtcd = procesodetalle;
                                $('#qrcode').qrcode({ width: 128, height: 128, text: txtcd });
                                $('#txtcode').text(txtcd);

                            }
                            else {
                                ShowToast("error", "Error...", "Detalle no contiene todos los parametros");
                                document.getElementById("CodeBar").autofocus;
                                $('#qrcode').empty();
                                $('#txtcode').text('');
                            }
                        } else {
                            toastr["error"]('', "No se ha Iniciado Proceso")
                            $('#qrcode').empty();
                            $('#txtcode').text('');
                        }
                    },
                    error: function (error) {
                        if (error.status == '401') {
                            window.location.reload();
                        } else {
                            alert(JSON.stringify(error));
                        }
                    }
                });
            } else {
                ShowToast("error", "Error...", "Empresa no activo");
            }
        });
        var labval = '';
        $("#Read").click(function () {
            var obj = new Object();
            CodeBar = $("#CodeBar").val();
            if ($('#proceso').val() == '' && $('#procesodetalle').val() == '') {
                clearProceso();
            } else if (CodeBar.length != 19) {
                $('#msg').text('Error en Codigo');
                $('#CodeBar').val('');
                clearTimeout(clear);
                fclear();
                $('#CodeBar').focus();
                errorcode = errorcode + 1;
                $('#errores').text(errorcode);
                return false;
            } else {
                obj.vcIdEmpresa = fuGetCdEmpre();
                obj.vnIdEmbalaje = $("#<%=ddlEmbalaje.ClientID%>").val();
                obj.vnIdGrupo = $("#<%=ddlAreaGrupo.ClientID%>").val();
                obj.vnIdSupervisor = $("#<%=ddlSupervisor.ClientID%>").val();
                if (CodeBar == '' || obj.vnIdCodPartida == '0' || obj.vnIdGrupo == '0' || obj.vnIdEmbalaje == '0' || obj.vnIdSupervisor == '0') {
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
                    obj.vnIdProceso = $('#proceso').val();
                    obj.vnIdProcesoDetalle = $('#procesodetalle').val();
<%--                    obj.vnIdClieProv = $("#<%=ddlCliente.ClientID%>").val();
                    obj.vnIdEmbalaje = $("#<%=ddlEmbalaje.ClientID%>").val();
                    obj.vnIdCultivo = $("#<%=ddlCultivo.ClientID%>").val();
                    obj.vnIdVariedad = $("#<%=ddlVariedad.ClientID%>").val();
                    obj.vnIdSupervisor = $("#<%=ddlSupervisor.ClientID%>").val();--%>
                    $.ajax({
                        type: 'POST',
                        url: "../SerProd.asmx/RegiRendProcRegistro",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            $('#CodeBar').val('');
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
                                        $('#msg').text('Error! Etiqueta Ya fue Leida de ' + lst[0].Colaborador);
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
                                        $('#msg').text(lst[0].Colaborador + '- CORRECTO');

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
                                window.location.reload();
                            } else {
                                alert(JSON.stringify(error));
                            }
                        }
                    });
                }
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


        function setCookie(cname, cvalue, exdays) {
            var d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            var expires = "expires=" + d.toGMTString();
            document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
        }

        function deleteCookie(cname, cvalue) {
            document.cookie = cname + "=" + cvalue + "; expires=Thu, 01 Jan 1970 00:00:00 UTC;path=/";
            document.cookie = cname + '=; path=/; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
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


        function clearProceso() {
            $('#msg').text('error al obtener proceso');
            var btn = document.getElementById("Read");
            var tipo = btn.getAttribute("data-tipo");
            $('#lector').hide();
            // $('#info').show();
            $("#<%=ddlAProceso.ClientID%>").removeAttr('disabled');
            $("#<%=ddlAreaGrupo.ClientID%>").removeAttr('disabled');
            $("#<%=ddlEmbalaje.ClientID%>").removeAttr('disabled');
            $("#<%=ddlCliente.ClientID%>").removeAttr('disabled');
            $("#<%=ddlCultivo.ClientID%>").removeAttr('disabled');
            $("#<%=ddlVariedad.ClientID%>").removeAttr('disabled');
            $("#<%=ddlSupervisor.ClientID%>").removeAttr('disabled');

            btn.setAttribute("data-tipo", 'add');
            $("#btnSave").html('<i class="fas fa-edit"></i> Iniciar Lectura');

            deleteCookie("area", $("#<%=ddlAProceso.ClientID%>").val());
            deleteCookie("linea", $("#<%=ddlAreaGrupo.ClientID%>").val());
            deleteCookie("namelinea", $("#<%=ddlAreaGrupo.ClientID%> option:selected").text());
            deleteCookie("cliente", $("#<%=ddlCliente.ClientID%>").val());
            deleteCookie("embalaje", $("#<%=ddlEmbalaje.ClientID%>").val());
            deleteCookie("cultivo", $("#<%=ddlCultivo.ClientID%>").val());
            deleteCookie("variedad", $("#<%=ddlVariedad.ClientID%>").val());
            deleteCookie("supervisor", $("#<%=ddlSupervisor.ClientID%>").val());

            $("#<%=ddlAProceso.ClientID%>").val('0');
            $("#<%=ddlAreaGrupo.ClientID%>").val('0');
            $("#<%=ddlEmbalaje.ClientID%>").val('0');
            $("#<%=ddlCliente.ClientID%>").val('0');
            $("#<%=ddlCultivo.ClientID%>").val('0');
            $("#<%=ddlVariedad.ClientID%>").val('0');
            $("#<%=ddlSupervisor.ClientID%>").val('0');

            $('#proceso').val(0);
            $('#procesodetalle').val(0);

            window.location.reload();
            return false;
        }

        function checkCookie() {
            var btn = document.getElementById("Read");
            var tipo = btn.getAttribute("data-tipo");
            var area = getCookie("area");
            var linea = getCookie("linea");
            var namelinea = getCookie("namelinea");
            var cliente = getCookie("cliente");
            var embalaje = getCookie("embalaje");
            var cultivo = getCookie("cultivo");
            var variedad = getCookie("variedad");
            var supervisor = getCookie("supervisor");
            var proceso = getCookie("proceso");
            var procesodetalle = getCookie("procesodetalle");
            var validarproc = 0;
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdArea = 1;
            $.ajax({
                type: 'POST',
                url: "../SerProd.asmx/ValidarProceso",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    if (lst[0].nIdProceso != 0) {

                        validarproc = lst[0].nIdProceso

                        if (validarproc = proceso) {

                            if (area != "" && linea != "" && cliente != "" && embalaje != "" && cultivo != "" && variedad != "" && supervisor != "" && procesodetalle != "" && proceso != "") {
                                $("#<%=ddlAProceso.ClientID%>").val(area);
                                Load_Agrupo(area, linea, namelinea);
                                $("#<%=ddlCliente.ClientID%>").val(cliente);
                                $("#<%=ddlCultivo.ClientID%>").val(cultivo);

                                $("#<%=ddlSupervisor.ClientID%>").val(supervisor);
                                Load_Variedad(cultivo, variedad);
                                Load_Embalaje(cultivo, embalaje);
                                $('#proceso').val(proceso);
                                $('#procesodetalle').val(procesodetalle);
                                $('#lector').show();
                                // $('#info').hide();
                                $("#<%=ddlAProceso.ClientID%>").attr('disabled', 'disabled');
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

                                $('#infolinea').text(namelinea + ' - ' + $("#<%=ddlSupervisor.ClientID%> :selected").text());

                                // Clear Previous QR Code
                                $('#qrcode').empty();

                                // Set Size to Match User Input
                                $('#qrcode').css({
                                    'width': 128,
                                    'height': 128
                                })

                                // Generate and Output QR Code
                                var txtcd = procesodetalle;
                                $('#qrcode').qrcode({ width: 128, height: 128, text: txtcd });
                                $('#txtcode').text(txtcd);

                                $('#CodeHead').val('');
                            } else {
                                $('#lector').hide();
                                // $('#info').show();
                                $("#<%=ddlAProceso.ClientID%>").removeAttr('disabled');
                                $("#<%=ddlAreaGrupo.ClientID%>").removeAttr('disabled');
                                $("#<%=ddlEmbalaje.ClientID%>").removeAttr('disabled');
                                $("#<%=ddlCliente.ClientID%>").removeAttr('disabled');
                                $("#<%=ddlCultivo.ClientID%>").removeAttr('disabled');
                                $("#<%=ddlVariedad.ClientID%>").removeAttr('disabled');
                                $("#<%=ddlSupervisor.ClientID%>").removeAttr('disabled');
                                var btn = document.getElementById("Read");
                                var tipo = btn.getAttribute("data-tipo");
                                btn.setAttribute("data-tipo", 'add');
                                $("#btnSave").html('<i class="fas fa-edit"></i> Iniciar Lectura');

                                deleteCookie("area", obj.vnIdAreaProceso);
                                deleteCookie("linea", obj.vnIdArea);
                                deleteCookie("namelinea", obj.vNameLinea);
                                deleteCookie("cliente", obj.vnIdClieProv);
                                deleteCookie("embalaje", obj.vnIdEmbalaje);
                                deleteCookie("cultivo", obj.vnIdCultivo);
                                deleteCookie("variedad", obj.vnIdVariedad);
                                deleteCookie("supervisor", obj.vnIdSupervisor);

                                $("#<%=ddlAProceso.ClientID%>").val('0');
                                $("#<%=ddlAreaGrupo.ClientID%>").val('0');
                                $("#<%=ddlEmbalaje.ClientID%>").val('0');
                                $("#<%=ddlCliente.ClientID%>").val('0');
                                $("#<%=ddlCultivo.ClientID%>").val('0');
                                $("#<%=ddlVariedad.ClientID%>").val('0');
                                $("#<%=ddlSupervisor.ClientID%>").val('0');

                            
                            }
                        } else {
                            $('#lector').hide();
                            // $('#info').show();
                            $("#<%=ddlAProceso.ClientID%>").removeAttr('disabled');
                            $("#<%=ddlAreaGrupo.ClientID%>").removeAttr('disabled');
                            $("#<%=ddlEmbalaje.ClientID%>").removeAttr('disabled');
                            $("#<%=ddlCliente.ClientID%>").removeAttr('disabled');
                            $("#<%=ddlCultivo.ClientID%>").removeAttr('disabled');
                            $("#<%=ddlVariedad.ClientID%>").removeAttr('disabled');
                            $("#<%=ddlSupervisor.ClientID%>").removeAttr('disabled');
                            var btn = document.getElementById("Read");
                            var tipo = btn.getAttribute("data-tipo");
                            btn.setAttribute("data-tipo", 'add');
                            $("#btnSave").html('<i class="fas fa-edit"></i> Iniciar Lectura');

                            deleteCookie("area", obj.vnIdAreaProceso);
                            deleteCookie("linea", obj.vnIdArea);
                            deleteCookie("namelinea", obj.vNameLinea);
                            deleteCookie("cliente", obj.vnIdClieProv);
                            deleteCookie("embalaje", obj.vnIdEmbalaje);
                            deleteCookie("cultivo", obj.vnIdCultivo);
                            deleteCookie("variedad", obj.vnIdVariedad);
                            deleteCookie("supervisor", obj.vnIdSupervisor);

                            $("#<%=ddlAProceso.ClientID%>").val('0');
                            $("#<%=ddlAreaGrupo.ClientID%>").val('0');
                            $("#<%=ddlEmbalaje.ClientID%>").val('0');
                            $("#<%=ddlCliente.ClientID%>").val('0');
                            $("#<%=ddlCultivo.ClientID%>").val('0');
                            $("#<%=ddlVariedad.ClientID%>").val('0');
                            $("#<%=ddlSupervisor.ClientID%>").val('0');

                          
                        };
                    }
                }, error: function (error) {
                    if (error.status == '401') {
                        window.location.reload();
                    } else {
                        alert(JSON.stringify(error));
                    }
                }
            });


        }

        checkCookie();

        //function askConfirmation(evt) {
        //    var msg = 'Si recarga la página perdera todos los datos ingresados.\n¿Deseas recargar la página?';
        //    evt.returnValue = msg;
        //    return msg;
        //}
        //window.addEventListener('beforeunload', askConfirmation);

        $('body').on('change', '#<%=ddlAProceso.ClientID%>', function () {
            var id = $(this).val();
            Load_Agrupo(id, 0);
        });

        function Load_Agrupo(id, idgru, namegru) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdArea = id;
            $.ajax({
                type: 'POST',
                url: "../SerProd.asmx/AGrupoList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    $("#<%=ddlAreaGrupo.ClientID%>").html('');
                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0">Seleccione Linea</option>';

                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdGrupo + '">' + lst[i].cDescAGrupo + '</option>';
                        }
                        if (idgru != 0) {
                            $("#<%=ddlAreaGrupo.ClientID%>").append($('<option />', {
                                text: namegru,
                                value: idgru,
                            }));
                        }
                        $("#<%=ddlAreaGrupo.ClientID%>").append(option);
                        $("#<%=ddlAreaGrupo.ClientID%>").val(idgru);
                    } else {
                        $("#<%=ddlAreaGrupo.ClientID%>").html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        $('body').on('change', '#<%=ddlCultivo.ClientID%>', function () {
            var id = $(this).val();
            Load_Variedad(id, 0);
            Load_Embalaje(id, 0);
        });

        function Load_Variedad(id, idva) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdCultivo = id;
            obj.vnIdVariedad = '0';
            $.ajax({
                type: 'POST',
                url: "../SerComex.asmx/VariedadList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    $("#<%=ddlVariedad.ClientID%>").html('');
                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0">Seleccione Variedad</option>';
                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdVariedad + '">' + lst[i].cDescVariedad + '</option>';
                        }
                        $("#<%=ddlVariedad.ClientID%>").append(option);
                        $("#<%=ddlVariedad.ClientID%>").val(idva);
                    } else {
                        $("#<%=ddlVariedad.ClientID%>").html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        function Load_Embalaje(id, idem) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdCultivo = id;
            obj.vnIdEmbalaje = '0';
            $.ajax({
                type: 'POST',
                url: "../SerComex.asmx/EmbalajeList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    $("#<%=ddlEmbalaje.ClientID%>").html('');
                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0">Seleccione Embalaje</option>';
                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdEmbalaje + '">' + lst[i].cDesEmbalaje + '</option>';
                        }
                        $("#<%=ddlEmbalaje.ClientID%>").append(option);
                        $("#<%=ddlEmbalaje.ClientID%>").val(idem);
                    } else {
                        $("#<%=ddlEmbalaje.ClientID%>").html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }



    </script>



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
