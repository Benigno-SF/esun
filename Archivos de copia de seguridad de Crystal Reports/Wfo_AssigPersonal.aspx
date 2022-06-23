<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_AssigPersonal.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Wfo_AssigPersonal" MaintainScrollPositionOnPostback="true" %>

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
    <button type="button" id="btnEliminar" runat="server" onserverclick="btnEliminar_ServerClick"  class="btn btn-secondary col-12" style="display:none;" />
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
            <button type="button" id="btnBusc" runat="server" class="btn btn-secondary col-12" onserverclick="btnBusc_ServerClick">
                <i class="fa fa-search"></i>Buscar
            </button>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="Add" class="btn btn-secondary col-12" data-toggle="modal" data-target="#AddPersonal">
                <i class="fa fa-plus"></i>Agregar Nuevo
            </button>
        </div>
    </div>
    <br />
    <asp:UpdatePanel ID="UpdGv" runat="server">
        <ContentTemplate>
            <div id="DvList" class="row center-block">
                <div class="table-responsive">
                    <asp:GridView ID="GvList" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-condensed bgtbl"
                        EmptyDataText="No se encontraron datos" ShowHeaderWhenEmpty="True" DataKeyNames="nIdPersonal,cNroDocumento" OnRowDataBound="GvList_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="nIdPersonal" HeaderText="Id" Visible="false" />
                            <asp:BoundField DataField="cNroDocumento" HeaderText="DNI" />
                            <asp:BoundField DataField="cCodigoControl" HeaderText="Tarjeta" />
                            <asp:BoundField DataField="cNombres" HeaderText="Nombres" />
                            <asp:BoundField DataField="bEstado" HeaderText="Estado" Visible="false" />
                            <asp:BoundField DataField="CaPendiente" HeaderText="T. Pendiente" />
                            <asp:TemplateField HeaderText="Labor" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlLabor" AutoPostBack="true" runat="server" CssClass="custom-select myform-control" OnSelectedIndexChanged="myListDropDown_Change">
                                    </asp:DropDownList>
                                    <asp:LinkButton ID="btnGvLimpia" runat="server" class="mybtn btn btn btn-outline-danger">
                                        <span class="fa fa-trash"></span>
                                    </asp:LinkButton>
                                    <asp:HiddenField ID="hdfcNroDocumento" runat="server" Value='<%#Eval("cNroDocumento") %>' />
                                    <asp:HiddenField ID="hdfcCodigoLabor" runat="server" Value='<%#Eval("cCodigoLabor") %>' />
                                    <asp:HiddenField ID="hdfIdPersonal" runat="server" Value='<%#Eval("nIdPersonal") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnBusc" />
            <asp:AsyncPostBackTrigger ControlID="btnEliminar" />
        </Triggers>
    </asp:UpdatePanel>
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
                            <input type="text" id="cNroDocumento" name="cNroDocumento" class="form-control round" placeholder="Ingrese su número de  Dni" required="required" onkeypress="return validar(event)">
                            <div class="input-group-prepend">
                                <button type="button" id="btnSearch" data-tipo="add" class="btn btn-link text-warning"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Nombres:</label>
                        <input type="text" id="nombres" class="form-control round" autocomplete="off">
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Apellido Paterno:</label>
                        <input type="text" id="a_paterno" class="form-control round" autocomplete="off">
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Apellido Materno:</label>
                        <input type="text" id="a_materno" class="form-control round" autocomplete="off">
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Labor:</label>
                        <select name="cLabor" id="cLabor" class="form-control myform-control">
                            <option selected="selected" value="0">Selecciona</option>
                            <option value="S">SELECCION</option>
                            <option value="E">EMBALAJE</option>
                        </select>
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
        $('#<%=UpdGv.ClientID%>').on('click', 'table[id*=GvList] [id*=btnGvLimpia]', function () {
            $('#<%=hdfIdElimina.ClientID%>').val($(this).closest("tr").find("input[type=hidden][id*=hdfIdPersonal]").val());
            Swal.fire({
                title: '¿Esta seguro que desea eliminar los registros sin leer?',
                text: "No podras revertir esto!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si, eliminar!',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.value) {
                    $('#<%=btnEliminar.ClientID%>').trigger("click");
                }
            });
        });
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

        $("#btnAdd").click(function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdPersonal = 0;
            obj.vcNroDocumento = $("#cNroDocumento").val();
            obj.vcApPaterno = $('#a_paterno').val();
            obj.vcApMaterno = $('#a_materno').val();
            obj.vcNombres = $("#nombres").val();
            obj.vcCodigoControl = '';
            obj.vcIdPlanilla = 'OBR';
            obj.vcGrupoTrabajo = '';
            obj.vcIdCodigoGeneral = $("#cNroDocumento").val();
            obj.vcCodigoLabor = $('#cLabor').val();
            obj.vbEstado = true;
            obj.vcCodHisp = '';
            obj.vbEstadoRegi = true;
            if (obj.vcNroDocumento != '' && obj.vcNombres != '' && obj.vcApPaterno != '' && obj.vcApMaterno != '' && obj.vcCodigoLabor != 0) {

                $.ajax({
                    type: 'POST',
                    url: "../SerProd.asmx/RegiPersonal",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        toastr.success(data.d);

                        $('#AddPersonal').modal('hide');

                    },
                    error: function (error) {
                        alert(JSON.stringify(error))
                        $.toaster({
                            title: 'ERROR',
                            message: error,
                            priority: 'danger'
                        });
                    }
                });
            } else {
                toastr.error('Rellene y seleccione todos los campos', 'FALTA INFORMACION');
            }
        });

        $("#btnSearch").click(function () {
            var obj = new Object();
            obj.vcNroDocumento = $("#cNroDocumento").val();
            if (obj.vcNroDocumento != '' || obj.vcNroDocumento.length == 8) {
                $.ajax({
                    type: 'POST',
                    url: "../SerRRHH.asmx/SearchUser",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        if (lst != "") {
                            if (lst[0].cIdPlanilla == 'OAC') {
                                toastr.remove();
                                toastr.clear();
                                $('#nombres').val(lst[0].cNombre);
                                $('#a_paterno').val(lst[0].cApPaterno);
                                $('#a_materno').val(lst[0].cApMaterno);

                                toastr.warning('Agregara un Personal de Campo', 'INFORMACION ENCONTRADA');

                            } else {
                                var labels = '<p><b>TRABAJADOR YA EXISTE</b></p>';
                                labels += '<p class="m-0 p-0">Dni: <b>' + lst[0].cNroDocumento + '</b></p>';
                                labels += '<p class="m-0 p-0">Nombre: <b>' + lst[0].cNombres + '</b></p>';
                                labels += '<p class="m-0 p-0">Grupo: <b>' + lst[0].cGrupoTrabajo + '</b></p>';

                                toastr.warning(labels)
                                clear();
                            }

                        } else {
                            $.ajax({
                                type: 'POST',
                                url: "../SerProd.asmx/GetPersonExt",
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
                                    var lstMast = JSON.parse(data.d);
                                    var lst = lstMast.DatosPerson;
                                    $('#nombres').val(lst[0].Nombres);
                                    $('#a_paterno').val(lst[0].ApellidoPaterno);
                                    $('#a_materno').val(lst[0].ApellidoMaterno);
                                    if (lst[0].Nombres == '') {
                                        toastr.error('Agregue la Informacion Manualmente', 'INFORMACION NO ENCONTRADA');
                                    } else {
                                        toastr.success('Informacion Agregada al formulario', 'INFORMACION ENCONTRADA');
                                    }
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

                        }

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

            } else {
                toastr.error('Ingrese un Numero de DNI valido', 'Error en N° de DNI');
                clear();
            }

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
