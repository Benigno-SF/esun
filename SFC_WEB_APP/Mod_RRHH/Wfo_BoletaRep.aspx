<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_BoletaRep.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_BoletaRep" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <h1>Impresión de Boletas </h1>
    <br />
    <div class="row">
        <div class="col-12 col-sm-3">
            <h3>Periodo Desde:
                <label id="lblPeriodo"></label>
            </h3>
        </div>
        <div class="col-12 col-sm-3" id="vper2" style="display: none">
            <h3>Periodo Hasta:
                <label id="lblPeriodo2"></label>
            </h3>
        </div>
        <div class="col-12 col-sm-3">
            <h3>Semana Desde:
                <label id="lblSemana"></label>
            </h3>
        </div>
        <div class="col-12 col-sm-3"  id="vsem2" style="display: none">
            <h3>Semana Hasta:
                <label id="lblSemana2"></label>
            </h3>
        </div>
        <div class="col-12 col-sm-4">
            <h3>Impresora:
                <label id="lblImpresora"></label>
            </h3>
        </div>
        <div class="col-12 col-sm-2">
            <asp:LinkButton ID="lkbCambio" runat="server" data-toggle="modal" data-target="#ModBoleta"><h3>Cambiar</h3></asp:LinkButton>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="input-group mb-3 col-12 col-sm-5">
            <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroup-sizing-default">Codigo</span>
            </div>
            <input type="text" id="txtCdEmpleado" class="form-control fc" placeholder="Ingrese o escanee el Código">
            <span class="form-clear d-none"><i class="fas fa-times"></i></span>
            <p>
                <br />
                * Escanea o Ingresa el Codigo y Presiona la tecla <kbd class="bg-dark">enter</kbd>
            </p>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-sm-4">
            <h4>Codigo:
                <label id="lblCdEmpl"></label>
            </h4>
        </div>
        <div class="col-12 col-sm-8">
            <h4>Trabajador:
                <label id="lblNoEmpl"></label>
            </h4>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="ModBoleta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Configuracion Periodos</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container">
                        
                        <div class="form-group">
                            <label for="ddlImpresoras">semana partida? <input type="checkbox" id="semanapartida" name="semanapartida" value="1"/></label>
                        </div>
                        <div class="form-group row">
                            <div class="col">
                                    <label for="txtCdPeriodo">Periodo Desde</label>
                                    <input type="text" class="form-control" id="txtCdPeriodo" placeholder="Ingrese Periodo Inicio">
                            </div>
                            <div class="col" style="display: none" id="per2">
                                    <label for="txtCdPeriodo">Periodo Hasta</label>
                                    <input type="text" class="form-control" id="txtCdPeriodo2" placeholder="Ingrese Periodo Fin">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col">
                                    <label for="txtCdSemana">Semana Desde</label>
                                    <input type="text" class="form-control" id="txtCdSemana" placeholder="Ingrese Semana Inicio">
                            </div>
                            <div class="col" style="display: none" id="sem2">
                                    <label for="txtCdSemana">Semana Hasta</label>
                                    <input type="text" class="form-control" id="txtCdSemana2" placeholder="Ingrese Semana Fin">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="ddlImpresoras">Impresora</label>
                            <asp:DropDownList runat="server" ID="ddlImpresoras" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="txtCaPrint">Cantidad de Impresiones</label>
                            <input type="number" class="form-control" id="txtCaPrint" value="2" min="1" max="3">
                        </div>
                    </div>
                    <div class="checkbox mb-3">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" id="btnSave" class="btn btn-primary">Guardar</button>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hdfCdPeriodo" runat="server" Value="" />
    <asp:HiddenField ID="hdfCdSemana" runat="server" Value="" />
    <asp:HiddenField ID="hdfCdPeriodo2" runat="server" Value="" />
    <asp:HiddenField ID="hdfCdSemana2" runat="server" Value="" />
    <asp:HiddenField ID="hdfIdDispositivo" runat="server" Value="0" />
    <script>
        $("#semanapartida").change(function () {
            if ($(this).is(':checked')) {
                $('#per2').show();
                $('#sem2').show();

                $('#vper2').show();
                $('#vsem2').show();

                $('#txtCdPeriodo2').val('');
                $('#txtCdSemana2').val('');
            } else {
                $('#per2').hide();
                $('#sem2').hide();

                $('#vper2').hide();
                $('#vsem2').hide();

                $('#txtCdPeriodo2').val('');
                $('#txtCdSemana2').val('');
            }
        });

        $("#txtCdEmpleado").on('keyup', function (e) {
            if (e.keyCode == 13) {
                $("#txtCdEmpleado").attr('disabled', true);
                var Cd = fuGetCdEmpre();
                $.ajax({
                    async: false,
                    type: 'POST',
                    url: "../SerRepo.asmx/BoleReport",
                    data: "{'CdEmpr': '" + Cd +
                        "','vcPeriodo': '" + fuGetPeriodo() +
                        "','vcPeriodo2': '" + fuGetPeriodo2() +
                        "','vcSemana': '" + fuGetSemana() +
                        "','vcSemana2': '" + fuGetSemana2() +
                        "','vcCodigo': '" + $("#txtCdEmpleado").val() +
                        "','CaPrint': '" + $("#txtCaPrint").val() +
                        "','IdDisp': " + fuGetIdDispositivo() +
                        " }",
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = data.d;
                        if (lst[3] == "ok") {
                            $("#lblCdEmpl").text($("#txtCdEmpleado").val());
                            $("#lblNoEmpl").text(lst[2]);
                            if ((lst[1].length > 1) && (lst[0] == "False")) {
                                alert("se imprimio la boleta el " + lst[1])
                            }
                            else {
                                var Imp = fuGetIdDispositivo() * 1;
                                if (Imp == 0) {
                                    myWindow = window.open("../Mod_Repo/Wfo_RepoView.aspx?Cd=" + fuGetCdEmpre() + "&wXml=" + lst[4] + "&wCrt=Crt_BoletaTick&wExp=2&wCan=0", "popup_window",
                                        "width=970, height=600 toolbar=no, scrollbars=no, resizable=no, top=20, left=200");
                                } else {
                                    // myWindow = window.open("../Mod_Repo/Wfo_RepoView.aspx?Cd="+fuGetCdEmpre() +"&wXml="+ lst[4]  +"&wCrt=Crt_BoletaTick&wExp=1&wCan=" + + $("#txtCaPrint").val(), "popup_window",
                                    //    "width=970, height=600 toolbar=no, scrollbars=no, resizable=no, top=20, left=200");
                                }
                            }
                        } else {
                            alert("No existen datos");
                        }
                        $("#txtCdEmpleado").attr('disabled', false);
                        $("#txtCdEmpleado").val("");
                        $("#txtCdEmpleado").focus();
                    },
                    error: function (error) {
                        console.log(error);
                        alert(JSON.stringify(error))
                    }
                });
            }
            $("#txtCdEmpleado").attr('disabled', false);
        });
        $(document).ready(function () {
            $("#txtCdEmpleado").focus();
        });
        $('#ModBoleta').on('shown.bs.modal', function () {
            $("#txtCdPeriodo").val(fuGetPeriodo());
            $("#txtCdPeriodo2").val(fuGetPeriodo2());
            $("#txtCdSemana").val(fuGetSemana());
            $("#txtCdSemana2").val(fuGetSemana2());
            $('#txtCdPeriodo').trigger('focus')
        });
        $('#ModBoleta').on('hidden.bs.modal', function (e) {
            var MaxPrint = $("#txtCaPrint").val();
            if (MaxPrint > 3) {
                $("#txtCaPrint").val("3");
            } else if (MaxPrint < 1) {
                $("#txtCaPrint").val("1");
            }
        });
        $("#btnSave").click(function () {
            fuSetPeriodo($("#txtCdPeriodo").val());
            fuSetPeriodo2($("#txtCdPeriodo2").val());
            fuSetSemana($("#txtCdSemana").val());
            fuSetSemana2($("#txtCdSemana2").val());
            fuSetIdDispositivo($("#<%=ddlImpresoras.ClientID%>").val());
            $("#lblPeriodo").text($("#txtCdPeriodo").val())
            $("#lblPeriodo2").text($("#txtCdPeriodo2").val())
            $("#lblSemana").text($("#txtCdSemana").val())
            $("#lblSemana2").text($("#txtCdSemana2").val())
            $("#lblImpresora").text($("#<%=ddlImpresoras.ClientID%> option:selected").text())
            $('#ModBoleta').modal('hide');
        });
        function fuSetIdDispositivo(valor) {
            return $("#<%=hdfIdDispositivo.ClientID%>").val(valor);
        }
        function fuSetPeriodo(valor) {
            $('#<%=hdfCdPeriodo.ClientID%>').val(valor);
        }
        function fuSetSemana(valor) {
            $('#<%=hdfCdSemana.ClientID%>').val(valor);
        }
        function fuSetPeriodo2(valor) {
            $('#<%=hdfCdPeriodo2.ClientID%>').val(valor);
        }
        function fuSetSemana2(valor) {
            $('#<%=hdfCdSemana2.ClientID%>').val(valor);
        }
        function fuGetIdDispositivo() {
            return $('#<%=hdfIdDispositivo.ClientID%>').val();
        }
        function fuGetPeriodo() {
            return $('#<%=hdfCdPeriodo.ClientID%>').val();
        }
        function fuGetSemana() {
            return $('#<%=hdfCdSemana.ClientID%>').val();
        }
        function fuGetPeriodo2() {
            return $('#<%=hdfCdPeriodo2.ClientID%>').val();
        }
        function fuGetSemana2() {
            return $('#<%=hdfCdSemana2.ClientID%>').val();
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
