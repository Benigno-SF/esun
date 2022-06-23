<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ViewAsistencia.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_Asistencia" %>
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
           <div id="DivFeNac" class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
            <label for="fConsulta" class="col-form-label p-0 m-0">Fecha:</label>
            <input type="text" id="cFecha" name="cFecha" autocomplete="off" class="form-control round" placeholder="dd/mm/yyyy">
            <script type="text/javascript">
                $(function () {
                    $('#cFecha').datetimepicker({
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
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
            <label for="recuperar">&nbsp;</label>
            <button type="button" id="recuperar" name="recuperar" class="btn btn-secondary col-12">
                <i class="fa fa-search"></i>Recuperar
            </button>
        </div>
    </div>
    <!-- Excel - Cell background table -->
    <section id="cell-background">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">ASISTENCIA</h4>
                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li id="btn-excel" style="display: none"><a id='excelExport' title="Exportar en Excel"><i class="fas fa-file-excel"></i></a></li>
                                <li id="btn-add-div" style="display: none"><a id='btn-add' title="Añadir nuevo" data-toggle="modal" data-target="#AddPersonal"><i class="fas fa-plus"></i></a></li>
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
                                        <th>dFechaRegistro</th>
                                        <th>Hora</th>
                                        <th>Dispositivo</th>
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

        <!-- BEGIN: PageScripts/ Vendor JS-->
    <script src="../Scripts/dt/datatables.min.js"></script>
    <script src="../Scripts/dt/dataTables.buttons.min.js"></script>
    <script src="../Scripts/dt/buttons.bootstrap4.min.js"></script>
    <script src="../Scripts/dt/vfs_fonts.js"></script>
    <script src="../Scripts/dt/buttons.html5.min.js"></script>
    <!-- END: Page VScripts/endor JS-->

    <script>
        $(document).on('click', '#recuperar', function (event) {
            event.preventDefault();
            cargatabla();
        });

        var cargatabla = function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcFecha = $('#cFecha').val();
            obj.vnIdDispositivo = '0';
            
            if (obj.vcFecha != '') {
                $('.dataex-html5-background tbody').html('<tr><td colspan="9" class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</td><tr>');

                $.ajax({
                    type: 'POST',
                    url: "../SerRRHH.asmx/AsistenciaList",
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
                            dom: 'Bfrtip',
                            buttons: [
                                'copyHtml5',
                                'excelHtml5',
                            ],
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
                                { data: 'dFechaRegistro' },
                                { data: 'Hora' },
                                { data: 'cDispositivo' },
                                {
                                    data: 'nIdPersonal',
                                    render: function (nIdPersonal) {
                                        return '<button id="' + nIdPersonal + '" class="deleterow">eliminar</button>';
                                    }
                                }
                            ],
                            "columnDefs": [
                                { targets: [0, 8], visible: false },
                                {
                                    "targets": [5, 6, 7, 8],
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
            } else {
                toastr.error('SELECCIONE FECHA VALIDA', '');
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
