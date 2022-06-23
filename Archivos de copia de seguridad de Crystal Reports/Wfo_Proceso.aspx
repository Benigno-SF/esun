<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_Proceso.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Wfo_Proceso" MaintainScrollPositionOnPostback="true" %>

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

        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-3">
            <label for="txtFeCont">Fecha</label>
            <input type="text" id="Text1" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
            <script type="text/javascript">
                $(function () {
                  <%--  $('#<%=txtFeCont.ClientID %>').datetimepicker({
                        format: 'DD/MM/YYYY',
                        locale: 'es'
                    });--%>
                    $(function () {
                        $('#DivFeCont').datetimepicker({
                            format: 'DD/MM/YYYY',
                            locale: 'es'
                        });
                    });
                });
            </script>
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
                            <asp:BoundField DataField="nid" HeaderText="Id" Visible="false" />
                            <asp:BoundField DataField="cNroDocumento" HeaderText="DNI" />
                            <asp:BoundField DataField="cCodigoControl" HeaderText="Tarjeta" />
                            <asp:BoundField DataField="cNombres" HeaderText="Nombres" />
                            <asp:BoundField DataField="bEstado" HeaderText="Estado" />
                            <asp:TemplateField HeaderText="Labor">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlLabor" AutoPostBack="true" runat="server" CssClass="custom-select myform-control" OnSelectedIndexChanged="myListDropDown_Change">
                                    </asp:DropDownList>
                                    <asp:HiddenField ID="hdfcNroDocumento" runat="server" Value='<%#Eval("cNroDocumento") %>' />
                                    <asp:HiddenField ID="hdfcCodigoLabor" runat="server" Value='<%#Eval("cCodigoLabor") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnBusc" />
        </Triggers>
    </asp:UpdatePanel>

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
                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivFeIni">
                        <label for="txtFeCont">Fecha</label>
                        <input type="text" id="txtFeIni" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
                        <script type="text/javascript">
                            $(function () {
                                $('#<%=txtFeIni.ClientID %>').datetimepicker({
                                    format: 'DD/MM/YYYY',
                                    locale: 'es'
                                });
                                $(function () {
                                    $('#DivFeIni').datetimepicker({
                                        format: 'DD/MM/YYYY',
                                        locale: 'es'
                                    });
                                });
                            });
                        </script>
                    </div>
                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivFeFin">
                        <label for="txtFeCont">Fecha</label>
                        <input type="text" id="txtFeFin" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
                        <script type="text/javascript">
                            $(function () {
                                $('#<%=txtFeFin.ClientID %>').datetimepicker({
                                    format: 'DD/MM/YYYY',
                                    locale: 'es'
                                });
                                $(function () {
                                    $('#DivFeFin').datetimepicker({
                                        format: 'DD/MM/YYYY',
                                        locale: 'es'
                                    });
                                });
                            });
                        </script>
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


    <script>
        function clear() {
            $("#form-group col-xs-12 col-sm-6 col-md-6 col-lg-3").val('');
            $('#txtFeIni').val('');
            $('#txtFeFin').val('');
        }

        $("#Add").click(function () {
            clear();
        })

        $("#btnAdd").click(function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcApPaterno = $('#a_paterno').val();
            obj.vcApMaterno = $('#a_materno').val();
            if (obj.vcNroDocumento != '' && obj.vcnombres != '' && obj.vca_paterno != '' && obj.vca_materno != '' && obj.vcLabor != -1) {
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

                            var labels = '<p><b>TRABAJADOR YA EXISTE</b></p>';
                            labels += '<p class="m-0 p-0">Dni: <b>' + lst[0].cNroDocumento + '</b></p>';
                            labels += '<p class="m-0 p-0">Nombre: <b>' + lst[0].cNombres + '</b></p>';
                            labels += '<p class="m-0 p-0">Grupo: <b>' + lst[0].cGrupoTrabajo + '</b></p>';

                            toastr.warning(labels)
                            clear();

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
                                        toastr.error('Informacion no Agregada', 'INFORMACION NO ENCONTRADA');
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
