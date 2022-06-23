<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_SendSms.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_SendSms" MaintainScrollPositionOnPostback="true" %>

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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
 <div class="row">
        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12" id="Provisiones">
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-3" id="DivFeIni">
            <label for="txtDni">DNI:</label>
            <input type="text" id="txtDni" runat="server" autocomplete="off" class="form-control" placeholder="Ingrese su DNI">
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-3" id="DivFeFin">
            <label for="txtNomApe">Apellidos y Nombres</label>
            <input type="text" id="txtNomApe" runat="server" autocomplete="off" class="form-control" placeholder="Apellido Paterno...">
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="Add" class="btn btn-secondary col-12" data-toggle="modal" data-target="#AddPersonal">
                <i class="fa fa-plus"></i>Agregar Nuevo
            </button>
        </div>
    </div>
    <br />

    <asp:HiddenField ID="hdfIdElimina" runat="server" Value="0" />
    <div class="modal fade" id="AddPersonal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Nuevo Colaborador</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">DNI:</label>
                        <div class="input-group">
                            <input type="text" id="numcel" name="numcel" class="form-control round" placeholder="Ingrese su número de  Dni" required="required" onkeypress="return validar(event)">
                            <div class="input-group-prepend">
                                <button type="button" id="btnSearch" data-tipo="add" class="btn btn-link text-warning"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Nombres:</label>
                        <input type="text" id="msmcel" class="form-control round" autocomplete="off">
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="IdEventoProg" value="0">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" id="btnAdd" class="btn btn-primary">Agregar</button>
                </div>
            </div>
        </div>
    </div>
    <script src="../Scripts/sweetalert2.js"></script>

    <script>

        function clear() {
            $("#cNroDocumento").val('');
            $('#nombres').val('');
            $('#a_paterno').val('');
            $('#a_materno').val('');
            $("#cNroDocumento").autofocus;
        }

        $("#Add").click(function () {
            clear();
        })


        $("#btnSearch").click(function () {
            var obj = new Object();
            obj.cNumCel = $("#numcel").val();
            obj.cDescSms = $("#msmcel").val();
                            $.ajax({
                                type: 'POST',
                                url: "../SerProd.asmx/SendSms",
                                data: JSON.stringify({ obj: obj }),
                                dataType: 'json',
                                contentType: 'application/json; charset=utf-8',
                                beforeSend: function () {
                                    toastr.remove();
                                    toastr.clear();
                                    toastr.warning('', 'BUSCANDO INFORMACION ....');
                                },
                                success: function (data) {
                                    toastr.remove();
                                    toastr.clear();
                                    var lst = JSON.parse(data.d);
                                    alert(lst);
                                },
                                error: function (error) {
                                    $.toaster({
                                        title: 'ERROR',
                                        message: error,
                                        priority: 'danger'
                                    });
                                    clear();
                                }
                            });

        });
        function validar(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 13) {
                $("#btnSearch").click();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
