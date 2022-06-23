<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_VerificaPersonal.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_VerificaPersonal" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/datatables.min.css">
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/buttons.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/buttons.bootstrap4.min.css">
    <!-- END: Vendor CSS-->
    <style>
        table {
            border-spacing: 0;
            border-collapse: collapse;
            width: 100%;
            margin: 0 auto;
        }

        .table th {
            padding: 0.65rem 1rem;
            font-size: 12px
        }

        .table td {
            padding: 0.65rem 0.65rem !important;
            font-size: 12px
        }

        .bolded {
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12" id="Provisiones" style="padding: 0px; margin: 0px">
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="recuperar" name="recuperar" class="btn btn-secondary col-12">
                <i class="fa fa-search"></i>Recuperar
            </button>
        </div>
        <%--        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnAdd">&nbsp;</label>
            <button type="button" id="btnAdd" class="btn btn-warning col-12" data-toggle="modal" data-target="#modalAdd">
                <i class="fa fa-plus"></i>Excepciones
            </button>
        </div>--%>
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnAdd">&nbsp;</label>
            <button type="button" id="btnSend" class="btn btn-success col-12" data-toggle="modal" data-target="#modalSend">
                <i class="fa fa-send"></i>Enviar Personal
            </button>
        </div>
        <%--        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
            <asp:Image ID="loaddata" runat="server" ImageUrl="~/Img/loading.gif" AlternateText="kyocode" />
        </div>--%>
    </div>
    <!-- Excel - Cell background table -->
    <section id="cell-background">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">TRANFERENCIA PERSONAL</h4>
                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li id="btn-excel" style="display: none"><a id='excelExport' title="Exportar en Excel"><i class="fas fa-file-excel"></i></a></li>
                                <li id="btn-add-div" style="/*display: none*/"><a id='btn-add' title="Añadir nuevo" data-toggle="modal" data-target="#AddPersonal"><i class="fas fa-plus"></i></a></li>
                                <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body card-dashboard">
                            <table id="table-deta" class="table table-striped table-bordered dataex-html5-background" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>id</th>
                                        <th>DNI</th>
                                        <th>Ap Paterno</th>
                                        <th>Ap Materno</th>
                                        <th>Nombres</th>
                                        <th>Sexo</th>
                                        <th>FechaNac</th>
                                        <th>dFechaRegistro</th>
                                        <th>bEstado</th>
                                        <th>nEstado</th>
                                        <th>##</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/ Excel - Cell background table -->

    <div class="modal fade" id="AddPersonal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Nuevo Personal</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label p-0 m-0">DNI:</label>
                        <div class="input-group">
                            <input type="text" id="cNroDocumento" name="cNroDocumento" class="form-control round" placeholder="Ingrese su número de  Dni" required="required" onkeypress="return validar(event)">
                            <div class="input-group-prepend">
                                <button type="button" id="btnSearch" data-tipo="add" class="btn btn-link text-warning"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label p-0 m-0">Nombres:</label>
                        <input type="text" id="nombres" class="form-control round" autocomplete="off">
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label p-0 m-0">Apellido Paterno:</label>
                        <input type="text" id="a_paterno" class="form-control round" autocomplete="off">
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label p-0 m-0">Apellido Materno:</label>
                        <input type="text" id="a_materno" class="form-control round" autocomplete="off">
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label p-0 m-0">Sexo:</label>
                        <select name="sexo" id="sexo" class="form-control myform-control">
                            <option selected="selected" value="0">Selecciona</option>
                            <option value="M">MASCULINO</option>
                            <option value="F">FEMENINO</option>
                        </select>
                    </div>
                    <div class="form-group mb-1" id="DivFeCont">
                        <label for="txtFeCont" class="col-form-label p-0 m-0">Fecha Nacimiento:</label>
                        <input type="text" id="fNacimiento" name="fNacimiento" autocomplete="off" class="form-control round" placeholder="dd/mm/yyyy">
                        <script type="text/javascript">
                            $(function () {
                                $('#fNacimiento').datetimepicker({
                                    format: 'DD/MM/YYYY',
                                    locale: 'es'
                                });
                                $(function () {
                                    $('#DivFeCont').datetimepicker({
                                        format: 'DD/MM/YYYY',
                                        locale: 'es'
                                    });
                                });
                            });
                        </script>
                    </div>
                    <div class="form-group mb-1" id="DivFeNac">
                        <label for="txtFeCont" class="col-form-label p-0 m-0">Fecha Ingreso:</label>
                        <input type="text" id="fRegistro" name="fRegistro" autocomplete="off" class="form-control round" placeholder="dd/mm/yyyy">
                        <script type="text/javascript">
                            $(function () {
                                $('#fRegistro').datetimepicker({
                                    format: 'DD/MM/YYYY',
                                    locale: 'es'
                                });
                                $(function () {
                                    $('#DivFeNac').datetimepicker({
                                        format: 'DD/MM/YYYY',
                                        locale: 'es'
                                    });
                                });
                            });
                        </script>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="IdPersonal" value="0">
                    <input type="hidden" id="nEstado" value="0">
                    <input type="hidden" id="bEstado" value="0">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" id="btnAdd" class="btn btn-primary">Agregar</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="modalSend" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Enviar Personal Nuevo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="modalSend-body">
                    esta seguro?
                </div>
                <div class="modal-footer" id="modalSend-btn">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" id="SendPersonal" class="btn btn-primary">Enviar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- BEGIN: PageScripts/ Vendor JS-->
    <script src="../Scripts/dt/datatables.min.js"></script>
    <script src="../Scripts/dt/dataTables.buttons.min.js"></script>
    <script src="../Scripts/dt/buttons.bootstrap4.min.js"></script>
    <script src="../Scripts/dt/vfs_fonts.js"></script>
    <script src="../Scripts/dt/buttons.html5.min.js"></script>
    <!-- END: Page VScripts/endor JS-->

    <script>

        $("#btnAdd").click(function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            if ($('#IdPersonal').val() != '0') {
                obj.vnIdPersonal = $('#IdPersonal').val();
            } else {
                obj.vnIdPersonal = '0';
            }
            obj.vcNroDocumento = $("#cNroDocumento").val();
            obj.vcApPaterno = $('#a_paterno').val();
            obj.vcApMaterno = $('#a_materno').val();
            obj.vcNombres = $("#nombres").val();
            obj.vcCodigoControl = '';
            obj.vcIdPlanilla = '';
            obj.vcGrupoTrabajo = '';
            obj.vcIdCodigoGeneral = $("#cNroDocumento").val();
            obj.vcCodigoLabor = '';
            obj.vbEstado = true;
            if ($('#nEstado').val() != '0' && $('#nEstado').val() != '') {
                obj.vnEstado = $('#nEstado').val();
            } else {
                obj.vnEstado = '0';
            }
            obj.vcSexo = $('#sexo').val();
            obj.vcFechaNacimiento = $('#fNacimiento').val();
            obj.vcFechaRegistro = $('#fRegistro').val();
            if (obj.vcNroDocumento != '' && obj.vcNombres != '' && obj.vcApPaterno != '' && obj.vcApMaterno != '' && obj.vcSexo != '' && obj.vcFechaNacimiento != '') {


                //var myTable = $('.dataex-html5-background').DataTable();

                //myTable.row.add({
                //    "nIdPersonal": obj.vnIdPersonal,
                //    "cNroDocumento": obj.vcNroDocumento,
                //    "cApPaterno": obj.vcApPaterno,
                //    "cApMaterno": obj.vcApMaterno,
                //    "cNombres": obj.vcNombres,
                //    "cSexo": obj.vcSexo,
                //    "dFechaNac": obj.vcFechaNacimiento,
                //    "dFechaRegistro": obj.vcFechaRegistro,
                //    "bEstado": obj.vbEstado,
                //    "nEstado": obj.vnEstado,
                //    "nIdPersonal": obj.vnIdPersonal
                //}).draw(false);

                $.ajax({
                    type: 'POST',
                    url: "../SerProd.asmx/RegiPersonal",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        //toastr.success(data.d, '');
                        clear();
                        //toastr.success('Nuevo Personal', 'PERSONAL AGREGADO');
                        toastr.success(data.d, 'Personal Agregado');
                        //$('#AddPersonal').modal('hide');
                        cargatabla();
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
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcNroDocumento = $("#cNroDocumento").val();
            obj.vcNombres = '';
            obj.vcIdPlanilla = '';
            obj.vcCodigoLabor = '';
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
                            if (lst[0].bEstado == true && lst[0].nEstado == null) {
                                toastr.warning('', 'Personal se encuentra activo');
                                clear();
                            } else if (lst[0].bEstado == true && lst[0].nEstado == '0') {
                                toastr.warning('recuperando info ....', 'Ya se encuentra Agregado en la lista');
                                clear();
                                cargatabla();
                            } else if (lst[0].bEstado == true && lst[0].nEstado == '3') {
                                toastr.error('recuperando info ....', 'Ya se encuentra Agregado - Cuidado Lista Negra');
                                clear();
                                cargatabla();
                            } else if (lst[0].bEstado == true && lst[0].nEstado == '4') {
                                toastr.warning('recuperando info ....', 'Ya se encuentra Agregado es Reingresante');
                                clear();
                                cargatabla();
                            } else {
                                toastr.remove();
                                toastr.clear();
                                if (lst[0].bEstado == false && lst[0].nEstado == '3') {
                                    toastr.error('informar a Jefe de Recursos Humanos', 'Cuidado Pertenece a la Lista Negra');
                                }
                                $('#nombres').val(lst[0].cNombre);
                                $('#a_paterno').val(lst[0].cApPaterno);
                                $('#a_materno').val(lst[0].cApMaterno);

                                $('#IdPersonal').val(lst[0].nIdPersonal);
                                $('#nEstado').val(lst[0].nEstado);
                                $('#bEstado').val(lst[0].bEstado);
                                var fullDate = new Date();
                                var twoDigitMonth = (fullDate.getMonth() + 1) + ""; if (twoDigitMonth.length == 1) twoDigitMonth = "0" + twoDigitMonth;
                                var twoDigitDate = fullDate.getDate() + ""; if (twoDigitDate.length == 1) twoDigitDate = "0" + twoDigitDate;
                                var currentDate = twoDigitDate + "/" + twoDigitMonth + "/" + fullDate.getFullYear();
                                $('#fRegistro').val(currentDate);
                                $.ajax({
                                    type: 'POST',
                                    url: "../SerProd.asmx/GetPersonExt",
                                    data: JSON.stringify({ obj: obj }),
                                    dataType: 'json',
                                    contentType: 'application/json; charset=utf-8',
                                    success: function (data) {
                                        var lstMast = JSON.parse(data.d);
                                        var lst = lstMast.DatosPerson;
                                        $('#nombres').val(lst[0].Nombres);
                                        $('#a_paterno').val(lst[0].ApellidoPaterno);
                                        $('#a_materno').val(lst[0].ApellidoMaterno);
                                        $('#fNacimiento').val(lst[0].FechaNacimiento);
                                        $('#sexo').val(lst[0].Sexo).change();
                                    }
                                })

                                toastr.warning('en Servidor', 'INFORMACION ENCONTRADA');
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
                                    toastr.warning('En fuentes externas', 'BUSCANDO INFORMACION  ....');
                                },
                                success: function (data) {
                                    toastr.remove();
                                    var lstMast = JSON.parse(data.d);
                                    var lst = lstMast.DatosPerson;
                                    $('#nombres').val(lst[0].Nombres);
                                    $('#a_paterno').val(lst[0].ApellidoPaterno);
                                    $('#a_materno').val(lst[0].ApellidoMaterno);
                                    $('#fNacimiento').val(lst[0].FechaNacimiento);
                                    var fullDate = new Date();
                                    var twoDigitMonth = (fullDate.getMonth() + 1) + ""; if (twoDigitMonth.length == 1) twoDigitMonth = "0" + twoDigitMonth;
                                    var twoDigitDate = fullDate.getDate() + ""; if (twoDigitDate.length == 1) twoDigitDate = "0" + twoDigitDate;
                                    var currentDate = twoDigitDate + "/" + twoDigitMonth + "/" + fullDate.getFullYear();
                                    $('#fRegistro').val(currentDate);
                                    if (lst[0].Sexo == 2) {
                                        $('#sexo').val('M').change();
                                    } else if (lst[0].Sexo == 3) {
                                        $('#sexo').val('F').change();
                                    }
                                    $('#IdPersonal').val('0');
                                    $('#bEstado').val(true);
                                    $('#nEstado').val('0');
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

        $("#btnAdd").click(function () {
            $("#CodeUser").val('');
            $('#labels').html('');

            $("#CodeUser").autofocus;
        });

        $("#btnSend").click(function () {
           <%-- $('#<%=SendMarcas.ClientID%>').attr('disabled', 'disabled');--%>
        });

        function clear() {
            $("#cNroDocumento").val('');
            $('#nombres').val('');
            $('#a_paterno').val('');
            $('#a_materno').val('');
            $('#sexo').val('0').change();
            $('#fNacimiento').val('');
            $('#fRegistro').val('');
            $('#IdPersonal').val('0');
            $('#nEstado').val('0');
            $('#bEstado').val('0');
            $("#cNroDocumento").autofocus;
        }

        $("#btn-add").click(function () {
            $('#modalSend-body').html('Esta Seguro');
            $('#modalSend-btn').show();
            clear();
        })

        var cargatabla = function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcNroDocumento = '';
            //  var f = new Date();
            //alert(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
            $('.dataex-html5-background tbody').html('<tr><td colspan="14" class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</td><tr>');

            $.ajax({
                type: 'POST',
                url: "../SerRRHH.asmx/ListPersonalNuevo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                error: function () {
                    $('#activos').hide();
                },
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    //   $.noConflict();
                    $('.dataex-html5-background tbody').fadeIn(1000).html('');
                    var table = $('.dataex-html5-background').DataTable({

                        destroy: true,
                        //dom: 'Bfrtip',
                        //buttons: [
                        //    'copyHtml5',
                        //    'excelHtml5',
                        //],
                        "paging": false,
                        "ordering": false,
                        "info": false,
                        //responsive: true,
                        data: lst,
                        columns: [
                            { data: 'nIdPersonal' },
                            { data: 'cNroDocumento' },
                            { data: 'cApPaterno' },
                            { data: 'cApMaterno' },
                            { data: 'cNombres' },
                            { data: 'cSexo' },
                            {
                                data: 'dFechaNac',
                                render: function (dFechaNac) {
                                    return DateConvert(dFechaNac)
                                }
                            },
                            {
                                data: 'dFechaRegistro',
                                render: function (dFechaRegistro) {
                                    return DateConvert(dFechaRegistro)
                                }
                            },
                            { data: 'bEstado', },
                            {
                                data: 'nEstado',
                                render: function (nEstado) {
                                    if (nEstado == "0") {
                                        return '<B style="color: green" class="parpadea text">NUEVO<B>';
                                    } else if (nEstado == "3") {
                                        return '<B style="color: red" class="parpadea text">LISTA NEGRA<B>';
                                    } else if (nEstado == "4") {
                                        return '<B style="color: red" class="parpadea text">REINGRESANTE<B>';
                                    } else {
                                        return nEstado;
                                    }
                                }
                            },
                            {
                                data: 'nIdPersonal',
                                render: function (nIdPersonal) {
                                    vvIng = "<button class='addrow btn btn-link yellow m-0 p-0 ' value='" + nIdPersonal+ "'><i class='fas fa-edit'></i></button> -"
                                    vvIng += " <button class='deleterow btn btn-link red m-0 p-0' value='" + nIdPersonal + "'><i class='fas fa-remove'></i></button>"
                                    return vvIng;
                                }
                            }
                        ],
                        "columnDefs": [
                            { targets: [0, 8], visible: false },
                            {
                                "targets": [5, 6, 7, 8, 9],
                                "className": "text-center",
                                //"width": "4%"
                            },
                            {
                                "targets": [1],
                                "className": 'bolded'
                            }

                        ],
                        language: {
                            "processing": "<img src='../img/loading.gif' />"
                        },
                    });
                    //  var t = $('.dataex-html5-background tbody').prepend('<tr role="row" class="odd"><td tabindex="0"></td><td></td><td></td><td></td><td>' + d1 + '</td><td>' + d2 + '</td><td>' + d3 + '</td><td>' + d4 + '</td><td>' + d5 + '</td><td>' + d6 + '</td><td>' + d7 + '</td><td></td></tr>');
                }
            });

        }
        $(document).on('click', '#SendPersonal', function (event) {
            event.preventDefault();
            $('#modalSend-body').html('<span colspan="14" class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>ENVIANDO INFROMACION...</span>');
            $('#modalSend-btn').hide();
            var table = $('.dataex-html5-background').DataTable();
            var data = table.rows().data();
            var len = data.length;
            data.each(function (value, index) {
                if (value.cNroDocumento != '' && value.cNombres != '' && value.cApPaterno != '' && value.cApMaterno != '' && value.cSexo != '' && value.dFechaNac != '' && value.dFechaRegistro != '' && value.cNombres != null && value.cApPaterno != null && value.cApMaterno != null && value.cSexo != null && value.dFechaNac != null && value.dFechaRegistro != null) {
                    var obj = new Object();
                    obj.vcIdEmpresa = fuGetCdEmpre();
                    obj.vnIdPersonal = value.nIdPersonal;
                    obj.vcNroDocumento = value.cNroDocumento;
                    obj.vcApPaterno = value.cApPaterno;
                    obj.vcApMaterno = value.cApMaterno;
                    obj.vcNombres = value.cNombres;
                    obj.vcSexo = value.cSexo;
                    obj.vcFechaNacimiento = DateConvert(value.dFechaNac);
                    obj.vcFechaRegistro = DateConvert(value.dFechaRegistro);
                    obj.vbEstado = value.bEstado;
                    obj.vnEstado = value.nEstado;
                    $.ajax({
                        type: 'POST',
                        url: "../SerRRHH.asmx/RegiPersonalNuevo",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            toastr.success(lst[0].dni+' - CORRECTO');
                            if (index === (len - 1)) {
                                var t = setTimeout(function () { toastr.success('', 'ENVIO COMPLETADO'); }, 3000);
                                var tt = setTimeout(function () { cargatabla() }, 3000);
                                $('#modalSend').modal('hide')
                            };
                        }, error: function (data) {
                           // alert(JSON.stringify(data));
                            if (index === (len - 1)) {
                                var t = setTimeout(function () { toastr.success('', 'ENVIO COMPLETADO'); }, 2000);
                                var tt = setTimeout(function () { cargatabla() }, 2000);
                                $('#modalSend').modal('hide')
                                $('#modalSend-btn').show();
                            };
                        },
                        complete: function (data) {
                            if (index === (len - 1)) {
                                var t = setTimeout(function () { toastr.success('', 'ENVIO COMPLETADO'); }, 2000);
                                var tt = setTimeout(function () { cargatabla() }, 2000);
                                $('#modalSend').modal('hide');
                                $('#modalSend-btn').show();
                            };
                        }
                    });
                } else {
                    toastr.warning('verificar', 'INFORMACION INCOMPLETA');
                    if (index === (len - 1)) {
                        var tx = setTimeout(function () { toastr.success('', 'ENVIO TERMINADO'); }, 2000);
                        var ttx = setTimeout(function () { cargatabla() }, 2000);
                        $('#modalSend').modal('hide')
                    };
                }

            });
        });

        $(document).on('click', '.deleterow', function (event) {
            event.preventDefault();
            //var myTable = $('.dataex-html5-background').DataTable();
            //var tableRow = myTable.row($(this).parents('tr'));
            //myTable.row(tableRow).remove().draw();
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdPersonal = $(this).attr('value');
            if (obj.vnIdPersonal != '' && obj.vnIdPersonal != 0) {
                $.ajax({
                    type: 'POST',
                    url: "../SerRRHH.asmx/DeletePersonalNuevo",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        toastr.success('', 'ELIMINADO');
                        cargatabla();
                    }
                });
            } else {
                alert('error');
            }
            
        });

        $(document).on('click', '.addrow', function (event) {
            event.preventDefault();
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdPersonal = $(this).attr('value');
            obj.vcNroDocumento = '';
            obj.vcNombres = '';
            obj.vcIdPlanilla = '';
            obj.vcCodigoLabor = '';
            if (obj.vnIdPersonal != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerRRHH.asmx/SearchUser",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst != "") {
                            $('#IdPersonal').val(lst[0].nIdPersonal);
                            $('#cNroDocumento').val(lst[0].cNroDocumento);
                            $('#cNroDocumento').attr('disabled', 'disabled');
                            $('#nombres').val(lst[0].cNombre);
                            $('#a_paterno').val(lst[0].cApPaterno);
                            $('#a_materno').val(lst[0].cApMaterno);
                            $('#fNacimiento').val(lst[0].dFechaNac);
                            $('#fRegistro').val(lst[0].dFechaRegistro);
                            if (lst[0].cSexo == 2) {
                                $('#sexo').val('M').change();
                            } else if (lst[0].cSexo == 3) {
                                $('#sexo').val('F').change();
                            } 
                            $('#AddPersonal').modal('show');
                        }
                    }
                });
             } else {
                alert('error')
            }
        });
        
        $(document).on('click', '#btn-add-div', function (event) {
            event.preventDefault();
            $('#cNroDocumento').removeAttr('disabled');
            $('#IdPersonal').val('0');
        });

        $(document).on('click', '#recuperar', function (event) {
            event.preventDefault();
            cargatabla();
        });

        $(document).ready(function () {
            $('.dataex-html5-background').DataTable({
                "paging": false,
                "ordering": false,
                "info": false,
                columns: [
                    { data: 'nIdPersonal' },
                    { data: 'cNroDocumento' },
                    { data: 'cApPaterno' },
                    { data: 'cApMaterno' },
                    { data: 'cNombres' },
                    { data: 'cSexo' },
                    { data: 'dFechaNac' },
                    { data: 'dFechaRegistro' },
                    { data: 'bEstado', },
                    {
                        data: 'nEstado',
                        render: function (nEstado) {
                            if (nEstado == "0") {
                                return '<B style="color: green" class="parpadea text">NUEVO<B>';
                            } else if (nEstado == "3") {
                                return '<B style="color: red" class="parpadea text">LISTA NEGRA<B>';
                            } else if (nEstado == "4") {
                                return '<B style="color: red" class="parpadea text">REINGRESANTE<B>';
                            } else {
                                return nEstado + 'des';
                            }
                        }
                    },
                    {
                        data: 'nIdPersonal',
                        render: function (nIdPersonal) {
                            return '<button id="' + nIdPersonal + '" class="deleterow">eliminar</button>';
                        }
                    }
                ],
                "columnDefs": [
                    { targets: [0, 8], visible: false },
                ]
            });
            // var intervalo = setInterval(cargatabla, 1000);
        });

        function DateConvert(datestring) {
            if (datestring != null) {
                var fullDate = new Date(parseInt(datestring.substr(6)));

                var twoDigitMonth = (fullDate.getMonth() + 1) + ""; if (twoDigitMonth.length == 1) twoDigitMonth = "0" + twoDigitMonth;
                var twoDigitDate = fullDate.getDate() + ""; if (twoDigitDate.length == 1) twoDigitDate = "0" + twoDigitDate;
                var currentDate = twoDigitDate + "/" + twoDigitMonth + "/" + fullDate.getFullYear();

                var twoDigitHour = fullDate.getHours() + ""; if (twoDigitHour.length == 1) twoDigitHour = "0" + twoDigitHour;
                var twoDigitMinutes = fullDate.getHours() + ""; if (twoDigitMinutes.length == 1) twoDigitMinutes = "0" + twoDigitMinutes;
                var currentHour = twoDigitHour + ':' + twoDigitMinutes;
                if (currentHour != '00:00') {
                    return currentDate;
                } else {
                    return currentDate;
                }

            } else {
                return '';
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
