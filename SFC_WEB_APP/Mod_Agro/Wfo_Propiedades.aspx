<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_Propiedades.aspx.cs" Inherits="SFC_WEB_APP.Mod_Agro.Wfo_Propiedades" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/datatables.min.css">
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/buttons.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/buttons.bootstrap4.min.css">
    <!-- END: Vendor CSS-->


    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>

    <style>
        .map {
            height: 80vh;
            width: 100%;
            margin: 0px;
            padding: 0px;
            font-weight: 400;
        }


        .controlsx {
            position: absolute;
            z-index: 999;
            top: 10px;
            right: 50px;
        }

        .spanx {
            color: red;
            background: white;
            padding: 10px;
            border-radius: 10px;
        }

        .map-label {
            background-color: #00968859;
            color: white !important;
            text-align: center;
            white-space: nowrap;
            border-radius: 8px;
            font-size: 12px !important;
            padding: 4px;
            box-shadow: 0 2px 7px 1px rgb(0 0 0 / 30%);
            font-weight: inherit !important;
        }
    </style>
    <script src="https://unpkg.com/travel-marker/dist/travel-marker.umd.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBaqQi4hFNet2FZQHDL4lakHJ4JRMAN7as"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="contdist-tab" data-toggle="tab" href="#contdist" role="tab" aria-controls="contdist" aria-selected="true">AGRO</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">LEGAL</a>
        </li>
    </ul>

    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="contdist" role="tabpanel" aria-labelledby="contdist-tab">
            <div class="row" style="display: flex;">

                <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2 pb-0 mb-0">
                    <label for="recuperar">&nbsp;</label>
                    <button type="button" id="recuperar" name="recuperar" class="btn btn-secondary col-12">
                        <i class="fa fa-search"></i>Recuperar
                    </button>
                </div>
            </div>
            <section id="cell-background">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Doc. Ubicaciones Agro</h4>
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
                                    <table id="data_prop_agro" class="table table-striped table-bordered dataex-html5-background" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th style="font-weight: bold;">Fundo</th>
                                                <th style="font-weight: bold;">Nombre</th>
                                                <th style="font-weight: bold;">Tipo</th>
                                                <th style="font-weight: bold;">Distrito</th>
                                                <th style="font-weight: bold;">Ubicacion</th>
                                                <th style="font-weight: bold;">Detalles</th>
                                                <th style="font-weight: bold;">Documentos</th>
                                                <th style="font-weight: bold;">N° Docs</th>
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

        </div>
        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
            <div class="row" style="display: flex;">

                <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2 pb-0 mb-0">
                    <label for="recuperar">&nbsp;</label>
                    <button type="button" id="recuperar" name="recuperar" class="btn btn-secondary col-12">
                        <i class="fa fa-search"></i>Recuperar
                    </button>
                </div>
            </div>
            <div class="canvas_div_pdf1">
                <section id="cell-background">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Doc. Ubicaciones Legal</h4>
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
                                        <table id="data_prop_legal" class="table table-striped table-bordered dataex-html5-background" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th style="font-weight: bold;">Fundo</th>
                                                    <th style="font-weight: bold;">Nombre</th>
                                                    <th style="font-weight: bold;">Tipo</th>
                                                    <th style="font-weight: bold;">Distrito</th>
                                                    <th style="font-weight: bold;">Ubicacion</th>
                                                    <th style="font-weight: bold;">Detalles</th>
                                                    <th style="font-weight: bold;">Documentos</th>
                                                    <th style="font-weight: bold;">N° Docs</th>
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
            </div>
        </div>
    </div>




    <!-- Excel - Cell background table -->


    <div class="modal pdf-modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-large">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close right" data-dismiss="modal" aria-hidden="true"><i class="material-icons">clear</i></button>
                    <h3 class="modal-title" id="title_doc">title</h3>
                </div>
                <div class="modal-body">
                    <span class="bodypdf"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="mapModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document" style="margin-top: 50px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="mapname">Map</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="margin-top: 0px; padding-top: 0px">
                    <div class="row">
                        <div class="col-md-12 modal_body_map">
                            <div class="location-map" id="location-map">
                                <div style="width: 600px; height: 400px;" id="map_canvas"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- small modal -->
    <div class="modal fade" id="propDetAgroModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-large ">
            <form id="prop_detagro_form" name="prop_detagro_form" method="post" enctype="multipart/form-data">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title modal-title_da"></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body text-center">
                        <div class="row">
                            <div class="col-md-6">


                                <div class="input-group">
                                    <span class="input-group-addon"></span>
                                    <div class="form-group">
                                        <label class="control-label">Patron</label>
                                        <input type="text" name="cPatron_da" id="cPatron_da" class="form-control" disabled placeholder="Patron">
                                    </div>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"></span>
                                    <div class="form-group">
                                        <label class="control-label">Hectareas</label>
                                        <input type="text" name="nHa_da" id="nHa_da" class="form-control" autocomplete="off" disabled placeholder="Hectareas">
                                    </div>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"></span>
                                    <div class="form-group label-floating is-focused">
                                        <label class="control-label">Fecha Siembra</label>
                                        <input type="Date" id="FSiembra_da" name="FSiembra_da" class="form-control datepicker" disabled>
                                    </div>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"></span>
                                    <div class="form-group">
                                        <label class="control-label">Densidad</label>
                                        <input type="text" name="Densidad_da" id="Densidad_da" class="form-control" disabled placeholder="Densidad">
                                    </div>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"></span>
                                    <div class="form-group">
                                        <label class="control-label">N° Plantas</label>
                                        <input type="text" name="NPlantas_da" id="NPlantas_da" class="form-control" disabled placeholder="N° Plantas">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="input-group">
                                    <span class="input-group-addon"></span>
                                    <div class="form-group">
                                        <label class="control-label">N° Valvulas</label>
                                        <input type="text" name="NValvulas_da" id="NValvulas_da" class="form-control" disabled placeholder="N° Valvulas">
                                    </div>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"></span>
                                    <div class="form-group">
                                        <label class="control-label">N° Pozos</label>
                                        <input type="text" name="NPozos_da" id="NPozos_da" class="form-control" disabled placeholder="N° Pozos">
                                    </div>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"></span>
                                    <div class="form-group">
                                        <label class="control-label">Estimacion Cosecha</label>
                                        <input type="text" name="ECosecha_da" id="ECosecha_da" class="form-control" disabled placeholder="Estimacion Cosecha">
                                    </div>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"></span>
                                    <div class="form-group">
                                        <label class="control-label">Responsable</label>
                                        <input type="text" name="Responsable_da" id="Responsable_da" class="form-control" disabled placeholder="Responsable">
                                    </div>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"></span>
                                    <div class="form-group">
                                        <label class="control-label">Uso de Agua</label>
                                        <input type="text" name="UAgua_da" id="UAgua_da" class="form-control" disabled placeholder="Uso de Agua">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer text-center">
                        <button type="button" class="btn btn-simple" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!--    end small modal -->


    <!-- small modal -->
    <div class="modal fade" id="propDetLegalModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-small " style="margin-top: 30px;">
            <form id="prop_detlegal_form" name="prop_detlegal_form" method="post" enctype="multipart/form-data">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title modal-title_dl">Agregar Detalles</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body text-center" style="margin-top: 0px;">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <span class="input-group-addon"></span>
                                    <div class="form-group label-floating is-focused">
                                        <label class="control-label">Unidad Catastral</label>
                                        <input type="text" name="nUCatastral_dl" id="nUCatastral_dl" disabled class="form-control">
                                    </div>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"></span>
                                    <div class="form-group label-floating is-focused">
                                        <label class="control-label">Partida</label>
                                        <input type="text" name="nPartida_dl" id="nPartida_dl" disabled class="form-control">
                                    </div>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"></span>
                                    <div class="form-group label-floating is-focused">
                                        <label class="control-label">Hectareas</label>
                                        <input type="text" name="nHa_dl" id="nHa_dl" disabled class="form-control">
                                    </div>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"></span>
                                    <div class="form-group label-floating is-focused">
                                        <label class="control-label">Sector</label>
                                        <input type="text" name="Sector_dl" id="Sector_dl" disabled class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="input-group">
                                    <span class="input-group-addon"></span>
                                    <div class="form-group label-floating is-focused">
                                        <label class="control-label">Propietario</label>
                                        <input type="text" name="Propietario_dl" id="Propietario_dl" disabled class="form-control">
                                    </div>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"></span>
                                    <div class="form-group label-floating is-focused">
                                        <label class="control-label">Denominacion</label>
                                        <input type="text" name="Denominacion_dl" id="Denominacion_dl" disabled class="form-control">
                                    </div>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"></span>
                                    <div class="form-group label-floating is-focused">
                                        <label class="control-label">Fecha</label>
                                        <input type="Date" id="Fecha_dl" name="Fecha_dl" disabled class="form-control datepicker">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer text-center">
                        <button type="button" class="btn btn-simple" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="modal fade" id="adddocModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div id="modaldc" class="modal-dialog modal-md" style="margin-top: 30px;">
            <form id="adddoc_form" name="adddoc_form" method="post" enctype="multipart/form-data">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title_a">DOCUMENTO DE UBICACION</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="margin: 0px; padding: 0px">
                        <div class="col-md-12">
                            <div class="tabladc material-datatables">
                                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer text-center">
                        <button type="button" class="btn btn-simple" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- BEGIN: PageScripts/ Vendor JS-->
    <script src="../Scripts/dt/datatables.min.js"></script>
    <script src="../Scripts/dt/dataTables.buttons.min.js"></script>
    <script src="../Scripts/dt/buttons.bootstrap4.min.js"></script>
    <script src="../Scripts/dt/vfs_fonts.js"></script>
    <script src="../Scripts/dt/buttons.html5.min.js"></script>
    <!-- END: Page VScripts/endor JS-->
    <script src="../Scripts/sweetalert2.js"></script>

    <script>
        $(document).on('click', '#recuperar', function (e) {
            cargatabla();
        });


        $.ajax({
            url: "http://204.199.164.92/sf/Propiedad/class_prop/list_tipoprop.php",
            method: "POST",
            dataType: "json",
            success: function (data) {
                $.each(data, function (k, v) {
                    var option = '<option value="' + v[0] + '">' + v[1] + '</option>';
                    $("#Tipox").append(option);
                });
            }, error: function (data) {
                alert('error');
            }
        });

        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });

        var parametro;
        function popup() {
            var latx = $('#Lat').val();
            var lngx = $('#Lng').val();
            parametro = window.open("http://204.199.164.92/sf/Propiedad/cargar_ubicacionsrv.php?lat=" + latx + "&lng=" + lngx, "", 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=900,height=600,left = 483,top = 184');
        }
        function popup_marcar2() {
            var lats = $('#Lat').val();
            var lngs = $('#Lng').val();
            var color = $('#Color').val();
            parametro = window.open("http://204.199.164.92/sf/Propiedad/cargar_poligonosrv.php?lats=" + lats + "&lngs=" + lngs + "&Color=" + color, "", 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=900,height=600,left = 483,top = 184');
        }

        function popup_marcar() {
            day = new Date();
            id = day.getTime();
            var lats = $('#Lat').val();
            var lngs = $('#Lng').val();
            var color = $('#Color').val();
            var url = "cargar_poligono.php?lats=" + lats + "&lngs=" + lngs + "&Color=" + color;
            eval("page" + id + " = window.open('" + url + "', '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=1,width=900,height=560,left = 233,top = 84');");
        }

        cargatabla();
        cargatablalegal();


        function cargatabla() {

            $('.dataex-html5-background tbody').html('<tr><td colspan="12" class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</td><tr>');

            //   $.noConflict();
            $('#data_prop_agro tbody').fadeIn(1000).html('');
            var table = $('#data_prop_agro').DataTable({

                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
                destroy: true,
                //dom: 'Bfrtip',
                //buttons: [
                //    'copyHtml5',
                //    'excelHtml5',
                //],
                ////responsive: true,
                "ajax": "http://204.199.164.92/sf/Propiedad/class_prop/read_prop_datasrv.php?id=1",
                "columnDefs": [
                    {
                        "targets": [0, 1, 2, 3, 4, 5, 6, 7],
                        "className": "text-center",
                        "targets": [3, 4, 5, 6, 7],
                        "orderable": true,
                    },
                ],
                // "order": [[8, "desc"]],
                language: {
                    "processing": "<img src='../img/loading.gif' /> cargando",
                    "decimal": "",
                    "emptyTable": "No hay datos",
                    "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                    "infoEmpty": "Mostrando 0 a 0 de 0 registros",
                    "infoFiltered": "(Filtro de _MAX_ total registros)",
                    "infoPostFix": "",
                    "thousands": ",",
                    "lengthMenu": "Mostrar _MENU_ registros",
                    "loadingRecords": "<img src='../img/loading.gif' /> Cargando...",
                    "search": "Buscar:",
                    "zeroRecords": "No se encontraron coincidencias",
                    "paginate": {
                        "first": "Primero",
                        "last": "Ultimo",
                        "next": "Próximo",
                        "previous": "Anterior"
                    },
                    "aria": {
                        "sortAscending": ": Activar orden de columna ascendente",
                        "sortDescending": ": Activar orden de columna desendente"
                    }
                },
            });

        }

        function cargatablalegal() {

            $('.dataex-html5-background tbody').html('<tr><td colspan="12" class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</td><tr>');

            //   $.noConflict();
            $('#data_prop_legal tbody').fadeIn(1000).html('');
            var table = $('#data_prop_legal').DataTable({

                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
                destroy: true,
                //dom: 'Bfrtip',
                //buttons: [
                //    'copyHtml5',
                //    'excelHtml5',
                //],
                ////responsive: true,
                "ajax": "http://204.199.164.92/sf/Propiedad/class_prop/read_prop_datasrv.php?id=2",
                "columnDefs": [
                    {
                        "targets": [0, 1, 2, 3, 4, 5, 6, 7],
                        "className": "text-center",
                        "targets": [3, 4, 5, 6, 7],
                        "orderable": true,
                    },
                ],
                // "order": [[8, "desc"]],
                language: {
                    "processing": "<img src='../img/loading.gif' /> cargando",
                    "decimal": "",
                    "emptyTable": "No hay datos",
                    "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                    "infoEmpty": "Mostrando 0 a 0 de 0 registros",
                    "infoFiltered": "(Filtro de _MAX_ total registros)",
                    "infoPostFix": "",
                    "thousands": ",",
                    "lengthMenu": "Mostrar _MENU_ registros",
                    "loadingRecords": "<img src='../img/loading.gif' /> Cargando...",
                    "search": "Buscar:",
                    "zeroRecords": "No se encontraron coincidencias",
                    "paginate": {
                        "first": "Primero",
                        "last": "Ultimo",
                        "next": "Próximo",
                        "previous": "Anterior"
                    },
                    "aria": {
                        "sortAscending": ": Activar orden de columna ascendente",
                        "sortDescending": ": Activar orden de columna desendente"
                    }
                },
            });

        }

        function carga_tabla_det(dats) {
            $('#data_docs').DataTable({
                "processing": true,
                "serverSide": true,
                "scrollY": "400px",
                "scrollCollapse": true,
                "paging": false,
                "ordering": false,
                "info": false,
                "ajax": {
                    url: "http://204.199.164.92/sf/Documento/class_doc/read_datasrv.php",
                    type: "POST",
                    data: dats
                },
                "columnDefs": [
                    {
                        "targets": [0, 1],
                        "orderable": false,
                    },
                ],
                responsive: false,
                language: {
                    processing: "<img src='../resources/img/loading.gif' style='width: 20px; height: 20px'> Loading...",
                }

            });
        }

        function carga_tabla_det(dats) {
            $.ajax({
                url: "http://204.199.164.92/sf/Documento/class_doc/read_detailsrv.php",
                type: "POST",
                data: dats,
                dataType: "json",
                success: function (data) {
                    //console.log(data);      
                    if (data != '') {
                        var html = "";
                        var lst = new Array();
                        for (var i = 0; i < data.length; i++) {
                            var Valida = false;
                            for (var x = 0; x < lst.length; x++) {
                                if (lst[x].nIdTipoDoc == data[i].nIdTipoDoc)
                                    Valida = true;
                            }
                            if (!Valida) {
                                var obj = new Object();
                                obj.nIdTipoDoc = data[i].nIdTipoDoc;
                                obj.cDescTipoDoc = data[i].cDescTipoDoc;
                                lst.push(obj);
                            }
                        }
                        for (var i = 0; i < lst.length; i++) {
                            html += "<div class='card accordion collapse-icon panel mb-0 box-shadow-0 border-0'>"
                            html += "<div class='card-header card-collapse-border' role='tab' id='DvHead" + lst[i].nIdTipoDoc + "'>"
                            html += "<a role='button' data-toggle='collapse' data-parent='#accordion' href='#DvBody" + lst[i].nIdTipoDoc + "' aria-expanded='false' aria-controls='DvBody" + lst[i].nIdTipoDoc + "' class='collapsed'>"
                            html += "<h6 class='panel-title'> " + lst[i].cDescTipoDoc + " </h6></a> </div>"
                            html += "<div id='DvBody" + lst[i].nIdTipoDoc + "' class='panel-collapse collapse' role='tabpanel' aria-labelledby='DvHead" + lst[i].nIdTipoDoc + "' aria-expanded='false' style='height: 0px;'>"
                            html += "<div class='panel-body' id='dvBodyC" + lst[i].nIdTipoDoc + "'><table id=Table" + lst[i].nIdTipoDoc + " style='width: 100%;'></table></div></div></div>"
                            $("#accordion").html(html)
                        }
                        for (var i = 0; i < data.length; i++) {
                            //$("#dvBodyC" + data[i].nIdTipoDoc).append(" "+ data[i].btn + "<br />");
                            $("#Table" + data[i].nIdTipoDoc).append("<tr style='border-bottom: 1px solid #e2c5c5; padding: 5px'><td style='width: 75%; text-align: left;'>" + data[i].cDescDoc + "</td><td style='width: 25%;text-align: right; padding: 2px'>" + data[i].btn + "</td></tr>");
                        }
                    } else {
                        $("#accordion").html('No contiene Documentos')
                    }
                }, error: function () {
                    $("#accordion").html('No contiene Documentos')
                }
            });
        }


        $(document).on('click', '.ver_pdf', function (e) {
            e.preventDefault();
            // $("#myModal2").modal('show');
            var title = $(this).attr('idnom');
            $("#title_doc").text(title);

            $.post('http://204.199.164.92/sf/Propiedad/hasilsrv.php',
                { id: $(this).attr('id') },
                function (html) {
                    if (html != 0) {
                        window.open(html, html, 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=900,height=600,left = 383,top = 184');
                    } else {
                        $.notify({
                            icon: "notifications",
                            message: "NO contiene archivo",
                        }, {
                            type: "danger",
                            timer: "3000",
                            placement: {
                                from: "top",
                                align: "right"
                            }
                        });
                    }
                }
            );
        });

        $(document).ready(function () {
            var map = null;
            var myMarker;
            var myLatlng;

            $(document).on('click', '.mapvv', function () {
                var id_prop = $(this).attr("id");
                var namemap = $(this).attr("name");
                $("#mapname").text(namemap);

                $.ajax({
                    type: "POST",
                    url: "http://204.199.164.92/sf/maps/read_marker_datasrv.php",
                    data: { id_prop: id_prop },
                    dataType: "json",
                    success: function (data) {
                        var storeArray = data;
                        myLatlng = new google.maps.LatLng(storeArray[0][0], storeArray[0][1]);
                        var myOptions = {
                            center: myLatlng,
                            zoom: 16,
                            mapTypeId: google.maps.MapTypeId.HYBRID,
                            scrollwheel: true,
                            disableDefaultUI: true,
                            zoomControl: true,
                        };

                        var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

                        for (i = 0; i < storeArray.length; i++) {
                            var icon = {
                                url: storeArray[i][3], // url
                                scaledSize: new google.maps.Size(30, 30), // size
                            };
                            myMarker = new google.maps.Marker({
                                position: new google.maps.LatLng(storeArray[i][0], storeArray[i][1]),
                                icon: icon,
                                url: storeArray[i][4],
                                name: storeArray[i][2],
                                map: map
                            });
                            if (storeArray[i][5] != "") {
                                // Construct the polygon.
                                var bermudaTriangle = new google.maps.Polygon({
                                    paths: storeArray[i][5],
                                    strokeColor: storeArray[i][6], //contorno
                                    strokeOpacity: 0.8,
                                    strokeWeight: 3,
                                    name: storeArray[i][2],
                                    url: storeArray[i][4],
                                    fillColor: storeArray[i][6], //relleno
                                    fillOpacity: 0.20
                                });
                                bermudaTriangle.setMap(map);
                            }
                            var infowindow = new google.maps.InfoWindow({
                                content: storeArray[i][2]
                            });
                            infowindow.open(map, myMarker);
                        }
                        myMarker.setMap(map);
                        $("#location-map").css("width", "100%");
                        $("#map_canvas").css("width", "100%");

                        google.maps.event.trigger(map, "resize");
                        map.setCenter(myLatlng);
                    }, error: function (request, status, error) {
                        alert(request.responseText);
                    }
                });
            });
        });



        $(document).on('click', '.AddDetAgro', function () {
            var id_ub = $(this).attr("id");
            $.ajax({
                url: "http://204.199.164.92/sf/Propiedad/class_prop/add_detsrv.php",
                method: "POST",
                data: { nIdPropiedad: id_ub, nAmbito: 1 },
                dataType: "json",
                success: function (data) {
                    $('#propDetAgroModal').modal('show');
                    $('.modal-title_da').text(data.title);

                    $('#nIdAgro_da').val(data.nIdAgro);
                    $('#nIdPropiedad_da').val(data.nIdPropiedad);
                    $('#nIdCultivo_da').val(data.nIdCultivo).change();
                    $('#nIdVariedad_da').val(data.nIdVariedad).change();
                    $('#cPatron_da').val(data.cPatron);
                    $('#nHa_da').val(data.nHa);
                    $('#FSiembra_da').val(data.FSiembra);
                    $('#Densidad_da').val(data.Densidad);
                    $('#NPlantas_da').val(data.NPlantas);
                    $('#NValvulas_da').val(data.NValvulas);
                    $('#NPozos_da').val(data.NPozos);
                    $('#ECosecha_da').val(data.ECosecha);
                    $('#Responsable_da').val(data.Responsable);
                    $('#UAgua_da').val(data.UAgua);

                    $('.fuction_da').text(data.fuction);
                    $('#action_da').val(data.exist_da);
                    $('#operation_da').val(data.exist_da);
                    $('.is-focused').removeClass('is-empty');
                }
            }).fail(function () {
                alert('Error!!');
            })
        })

        $(document).on('click', '.AddDetLegal', function () {
            var id_ub = $(this).attr("id");
            $.ajax({
                url: "http://204.199.164.92/sf/Propiedad/class_prop/add_detsrv.php",
                method: "POST",
                data: { nIdPropiedad: id_ub, nAmbito: 2 },
                dataType: "json",
                success: function (data) {
                    $('#nDLegal_dl').val(data.nDLegal_dl);
                    $('#nIdPropiedad_dl').val(data.nIdPropiedad);;
                    $('#nUCatastral_dl').val(data.nUCatastral);
                    $('#nPartida_dl').val(data.nPartida);
                    $('#nHa_dl').val(data.nHa);
                    $('#Sector_dl').val(data.Sector);
                    $('#Propietario_dl').val(data.Propietario);
                    $('#Denominacion_dl').val(data.Denominacion);
                    $('#Fecha_dl').val(data.Fecha);

                    $('.fuction_dl').text(data.fuction);
                    $('#action_dl').val(data.exist_dl);
                    $('#operation_dl').val(data.exist_dl);

                    $('.modal-title_dl').text(data.title);
                    $('#propDetLegalModal').modal('show');
                    $('.is-focused').removeClass('is-empty');
                }
            }).fail(function () {
                alert('Error!!');
            })
        })


        $(document).on('click', '.adddoc', function () {
            var id_ub = $(this).attr("id");
            $.ajax({
                method: "POST",
                url: "http://204.199.164.92/sf/Documento/class_doc/add_docsrv.php",
                data: { nIdPropiedad2: id_ub },
                dataType: "json",
                success: function (data) {
                    $('#adddocModal').modal('show');

                    $('.modal-title_a').text(data.title);
                    var id_u = { id_u: id_ub }
                    carga_tabla_det(id_u);
                }, error: function (dataerror) {
                    alert(JSON.stringify(dataerror));
                }
            })
        });
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
