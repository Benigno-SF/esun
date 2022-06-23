
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_PreInscripcionPersonal.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_PreIncripcionPersonal" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.light.css" />

    <script src="../Content/DevExtreme/cldr.min.js"></script>
    <script src="../Content/DevExtreme/event.min.js"></script>
    <script src="../Content/DevExtreme/supplemental.min.js"></script>
    <script src="../Content/DevExtreme/unresolved.min.js"></script>
    <script src="../Content/DevExtreme/globalize.min.js"></script>
    <%--<script src="../Content/DevExtreme/number.min.js"></script>--%>
    <script src="../Content/DevExtreme/message.min.js"></script>
    <%--   <script src="../Content/DevExtreme/currency.min.js"></script>
    <script src="../Content/DevExtreme/date.min.js"></script>--%>
    <script src="../Content/DevExtreme/jszip.min.js"></script>
    <script src="../Content/DevExtreme/dx.all.js"></script>
    <script src="../Content/DevExtreme/dx.messages.es.js"></script>
    <script src="../Content/DevExtreme/supplemental.js"></script>
    <script src="../Content/DevExtreme/es.js"></script>

    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/print.min.css" />
    <script src="../Content/DevExtreme/print.min.js"></script>

    <!-- END: Vendor CSS-->
    <style>
        .dx-freespace-row {
            height: 0px !important;
        }



        .long-title h3 {
            font-family: 'Segoe UI Light', 'Helvetica Neue Light', 'Segoe UI', 'Helvetica Neue', 'Trebuchet MS', Verdana;
            font-weight: 200;
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
        }

        @media print {
            body, .printjsa, .dx-scrollable-content {
                display: block !important;
                position: relative !important;
                width: auto !important;
                height: auto !important;
                overflow: visible !important;
                margin-left: 0 !important;
                display: block !important; /* Not really needed in all cases */
                position: relative !important;
                width: auto !important;
                height: auto !important;
                overflow: visible !important;
            }
        }

        #gridContainer {
            height: 60vh;
        }

        #DataGrid {
            height: auto;
            width: 100%;
            color: black;
            font-weight: bold;
            font-size: 10px;
            height: 60vh;
        }

        .options {
            padding: 0px;
            margin-top: 0px;
        }

        .caption {
            font-size: 18px;
            font-weight: 500;
        }

        .option {
            margin-top: 0px;
        }

        .dx-datagrid-rowsview .dx-row > .dx-master-detail-cell {
            padding: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <%--        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
            <label for="anio">Año</label>
            <select class="form-control" id="anio" name="anio">
                <option value="0" selected="selected" disabled="disabled">Seleccione Año</option>
                <option value="2020">2020</option>
            </select>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
            <label for="btnBusc">campaña</label>
            <select class="form-control" id="campania" name="campania">
                <option value="0">Seleccione Campaña</option>
            </select>
        </div>--%>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
            <label for="btnBusc">ESTADO</label>
            <select class="form-control" id="nEstado" name="nEstado">
                <option value=""> - Seleccione - </option>
                <option value="0">Inscrito</option>
                <option value="1">Pre Seleccionado</option>
                <option value="2">Seleccionado</option>
                <option value="3">Registrado</option>
                <option value="4">Resumen Inscripcion</option>
            </select>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2 pb-0 mb-0">
            <label for="recuperar">&nbsp;</label>
            <button type="button" id="recuperar" name="recuperar" class="btn btn-secondary col-12">
                <i class="fa fa-search"></i>Recuperar
            </button>
        </div>
        <div id="Div_close_part" class="form-group col-6 col-sm-6 col-md-5 col-lg-2" style="display: none">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="selec_persona" class="btn btn-secondary col-12">
                <i class="fa fa-save"></i> <span id="btn-sel">Selecc. Personal </span>- <span id="selx"></span>
            </button>
        </div>
        <div id="" class="form-group col-6 col-sm-6 col-md-5 col-lg-2" style="display: none">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="resumen" class="btn btn-secondary col-12">
                <i class="fa fa-save"></i> Resumen
            </button>
        </div>
         <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2 pb-0 mb-0">
            <label for="recuperar">&nbsp;</label>
        </div>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2 pb-0 mb-0" style="display: none">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnInicProc" runat="server" class="btn btn-primary col-12 proceso">
                <i class="fa fa-play-circle"></i>Iniciar
            </button>
            <button type="button" id="btnFinProc" runat="server" class="btn btn-primary col-12 proceso">
                <i class="fa fa-stop-circle"></i>Terminar
            </button>
            <label for="btnBusc">&nbsp;</label>
            <b>
                <p id="txtProc" runat="server"></p>
            </b>
        </div>
        <div class="row" style="text-align: right">
            <div class="form-group col-xs-12 col-sm-4 pb-0 mb-0 pl-0">
                <label for="btnBusc">Inscritos</label>
                <b>
                    <label id="inscritos" class="col-12 p-0" style="font-size: large;"></label>
                </b>
            </div>
            <div class="form-group col-xs-12 col-sm-4 pb-0 mb-0 pl-0">
                <label for="btnBusc">Preseleccionados</label>
                <b>
                    <label id="preseleccionados" class="col-12 p-0" style="font-size: large;"></label>
                </b>
            </div>
            <div class="form-group col-xs-12 col-sm-4 pb-0 mb-0 pl-0" id="tccontainer">
                <label for="btnBusc">Seleccionados</label>
                <b>
                    <label id="seleccionados" class="col-12 p-0" style="font-size: large;"></label>
                </b>
            </div>
        </div>
    </div>
    <!-- Excel - Cell background table -->
    <section id="cell-background" style="/*height: 300px; */">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title" id="title-card"></h4>
                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li id="btn-addOE" style="display: none"><a id='btn-add' title="Exportar en Excel"><i class="fas fa-plus"></i></a></li>
                                <li id="btn-pdf" style="display: none"><a id='pdfExport' title="Exportar en Pdf"><i class="fas fa-file-pdf"></i></a></li>
                                <li id="btn-expand" style="display: none"><a id='expandall' title="Expandir Grupos"><i class="fas fa-angle-double-down"></i></a></li>
                                <li id="btn-collapse" style="display: none"><a id='collapseall' title="Collapsar Grupos"><i class="fas fa-angle-double-up"></i></a></li>
                                <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body card-dashboard">
                            <div id="container-x" class="device-mobile-tablet-container">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="modal fade" id="ModalViewDoc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-sm" role="document" id="modview">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="titleDoc">#</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12" id="embed">
                           
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12" id="down" style="text-align: center">

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- END: Page VScripts/endor JS-->
    <script src="../Scripts/sweetalert2.js"></script>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.min.js">--%>
    <script>
        function loaddetail() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            if (obj.vcIdEmpresa != null && obj.vcIdEmpresa != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerRRHH.asmx/ListPreInscripcion",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        $('#inscritos').text(lst[0].inscritos);
                        $('#preseleccionados').text(lst[0].presel);
                        $('#seleccionados').text(lst[0].sel);
                    }, complete: function () {
                        setTimeout(loaddetail, 10000);
                    }
                });
            } else {

            }
        };

        loaddetail();

        $(document).on('click', '#recuperar', function (event) {
            event.preventDefault();
            var est = $('#nEstado option:selected').val();
            if (est === 4) {
                cargaresumen();
            } else {
                cargatabla(est);
            }
        });

        $(document).on('click', '#resumen', function (event) {
            event.preventDefault();
            cargaresumen();
        });


        $(document).on('click', '.proceso', function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdFicha = 4;
            obj.vnIdFichaMes = 0;
            var title = $("#<%=txtProc.ClientID%>").text();
            if (title != 'Mes de llenado de Ficha No Iniciado') {
                Swal.fire({
                    title: '¿Esta seguro que desea finalizar el ' + title + ' ?',
                    text: "Cuidado, verificar que haya finalizado las lecturas de las lineas",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Si, eliminar!',
                    cancelButtonText: 'Cancelar'
                }).then((result) => {
                    if (result.value) {
                        IniFinProceso(obj);
                    }
                });
            } else {
                (async () => {

                    const { value: mesf } = await Swal.fire({
                        title: '¿Iniciara Un nuevo Mes de Llenado de Ficha?',
                        text: "Desea continuar",
                        icon: 'success',
                        input: 'select',
                        inputOptions: {
                            '1': 'Enero',
                            '2': 'Febrero',
                            '3': 'Marzo',
                            '4': 'Abril',
                            '5': 'Mayo',
                            '6': 'Junio',
                            '7': 'Julio',
                            '8': 'Agosto',
                            '9': 'Setiembre',
                            '10': 'Octubre',
                            '11': 'Noviembre',
                            '12': 'Diciembre',
                        },
                        inputPlaceholder: 'Selecciona Mes',
                        showCancelButton: true,
                        inputValidator: (value) => {
                            return new Promise((resolve) => {
                                if (value != '') {
                                    resolve()
                                } else {
                                    resolve('Necesitas Seleccionar el Mes :)')
                                }
                            })
                        },
                        confirmButtonColor: '#008000',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Si, Iniciar!',
                        cancelButtonText: 'Cancelar'
                    })

                    if (mesf) {
                        obj.vnMes = mesf;
                        IniFinProceso(obj);
                    }

                })()
            }
        });



        function IniFinTemporada(obj) {
            $.ajax({
                async: false,
                type: 'POST',
                url: "../SerRRHH.asmx/InicFinTemporada",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    switch (lst[0].nIdFicha) {
                        case -1:
                            toastr["error"]("No se guardo correctamente", "Error");
                            $('#btnInicProc').hide();
                            $('#btnFinProc').show();
                            break;
                        case 0:
                            toastr["warning"]("Ficha Finalizada", "");
                            $(".proceso").html('<i class="fa fa-stop-circle"></i> Iniciar');
                            $("#<%=txtProc.ClientID%>").text('Mes de llenado de Ficha No Iniciado');
                            break;
                        default:
                            toastr["success"]("", "Ficha de " + namemes(lst[0].nMes) + " Iniciado correctamente");
                            $("#<%=txtProc.ClientID%>").text("Ficha de " + namemes(lst[0].nMes) + " Habilitado");
                            $(".proceso").html('<i class="fa fa-stop-circle"></i> Terminar');
                            break;
                        // code block
                    }
                    //toastr["success"]('subtitulo', "titulo")
                    //succes warning error toastr["success"]('subtitulo', "titulo")
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        };

        function DeleteSeleccion(nId, nEstado) {

            var obj = new Object();
            obj.vnIdPersona = nId;
            obj.vnEstado = nEstado;
            $.ajax({
                type: 'POST',
                url: "../SerRRHH.asmx/DeleteSeleccion",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    if (data.d >= 0) {
                        ShowToast('success', 'Eliminado de Seleccionados', '');
                        loaddetail();
                    } else {
                        ShowToast('error', 'Ocurrio un Error al Eliminar', '')
                    }
                    //succes warning error toastr["success"]('subtitulo', "titulo")
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        };



        function cargatabla(est) {

            if (est == '') {
                $("#title-card").text('');
            } else if (est == 0) {
                $("#title-card").text('PERSONAL INSCRITO');
                $("#btn-sel").text('pre selec personal');
            } else if (est == 1) {
                $("#title-card").text('PERSONAL PRE - SELECCIONADO');
                $("#btn-sel").text('selec personal');
            } else if (est == 2) {
                $("#title-card").text('PERSONAL SELECCIONADO');
                $("#btn-sel").text('Registrar');
            } else if (est == 3) {
                $("#title-card").text('PERSONAL REGISTRADO');
            } else {
                $("#title-card").text('');
            }

            $("#Div_close_part").hide();
            cad_id = '';
            $('#selx').text('');

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdPersona = 0;
            obj.vcNombres = '';
            obj.vcNroDocumento = '';
            obj.vnEstado = est;

            obj.vnIdTemprada = $('#ficha').val();
            obj.vcAnio = $('#anio').val();
            obj.vnMes = $('#mes').val();
            //  var f = new Date();
            //alert(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
            if (obj.vcIdEmpresa != '' && obj.vcIdEmpresa != null && est != null && est != '') {
                $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                $.ajax({
                    type: 'POST',
                    url: "../SerRRHH.asmx/PersonaList",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    error: function () {
                        $('#activos').hide();
                    },
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        var data = new Array();
                        if (lst != '') {
                            var checkf = lst[0].checkform;
                            console.log(checkf);
                        }

                        $('#container-x').html('<div class="options"><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="gridDeleteSelected"></div><div id="DataGrid"></div>');
                        TbDataGrid(lst, checkf);
                    },
                    error: function (data) {
                        alert(JSON.stringify(data));
                    }
                });
            } else {
                toastr.error('error', 'Seleccione Estado', '')
            }
        }

        function cargaresumen() {

            $("#title-card").text('');

            $("#Div_close_part").hide();
            cad_id = '';
            $('#selx').text('');

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdPersona = 0;
            obj.vcNombres = '';
            obj.vcNroDocumento = '';
            obj.vnEstado = 9;

            obj.vnIdTemprada = $('#ficha').val();
            obj.vcAnio = $('#anio').val();
            obj.vnMes = $('#mes').val();
            //  var f = new Date();
            //alert(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
            if (obj.vcIdEmpresa != '' && obj.vcIdEmpresa != null) {
                $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                $.ajax({
                    type: 'POST',
                    url: "../SerRRHH.asmx/PersonaList",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    error: function () {
                        $('#activos').hide();
                    },
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        var data = new Array();
                            $('#container-x').html('<div id="pivotgrid-chart"></div><div id="PivotGrid"></div>');
                            TbPivotGrid(lst);
                    },
                    error: function (data) {
                        alert(JSON.stringify(data));
                    }
                });
            } else {
                toastr.error('error', 'Seleccione Estado', '')
            }
        }

        var pathArray = window.location.pathname.split('/');
        var origin = window.location.origin;

        var url = origin + '/' + pathArray[1];
        //var url = 'http://esun.sunfruits.com.pe/Mod_RRHH';

        var cad_id = '';

        function TbDataGrid(data, checkf) {
            DevExpress.localization.locale('es');
            cad_id = '';

            var dataGrid = $("#DataGrid").dxDataGrid({
                dataSource: data,
                scrolling: {
                    mode: 'virtual'
                },
                //sorting: {
                //    mode: "none"
                //},
                selection: {
                    mode: "multiple"
                },
                grouping: {
                    autoExpandAll: false
                },
                groupPanel: {
                    visible: true
                },
                allowColumnReordering: true,
                allowColumnResizing: true,
                columnMinWidth: 30,
                columnAutoWidth: true,
                showBorders: true,
                columnChooser: {
                    enabled: true
                },
                columnFixing: {
                    enabled: true
                },
                showRowLines: true,
                showColumnLines: true,
                rowAlternationEnabled: true,
                RowAutoHeight: true,

                //wordWrapEnabled: true,
                showBorders: true,
                export: {
                    enabled: true,
                    fileName: "Reporte Personal Preinscrito"
                },

                filterRow: {
                    visible: false,
                    applyFilter: "auto"
                },
                searchPanel: {
                    visible: false,
                    placeholder: "Search..."
                },
                headerFilter: {
                    visible: false
                },
                editing: {
                    mode: "row",
                    allowDeleting: true,
                    useIcons: true,
                    width: 50
                },
                //  groupIndex: 0,
                columns: [

                    //  { caption: "", dataField: "", width: 150, visible: false }

                    //{ caption: "Fecha Registro", dataField: "FechaRegistro", visible: true }
                    , { caption: "nIdPersona", dataField: "nIdPersona", visible: false }
                    , {
                        caption: "Imagen",
                        dataField: "cImg",
                        width: 100,
                        allowFiltering: false,
                        allowSorting: false,
                        //cellTemplate: $("#gridPhoto"),
                        cellTemplate: function (container, options) {
                            if (options.value != '' && options.value != null) {
                                $("<div>")
                                    .append($("<img>", { "src": url + '/ImgPersonal/' + options.value, "style": "width:70% " }))
                                    .appendTo(container);
                            }
                        },
                        visible: false 
                    },
                    // , { caption: "Tipo DOc", dataField: "cTipoDocumento", width: 70 }

                    , { caption: "DNI", dataField: "cNroDocumento", width: 70 }
                    , { caption: "Nombres", dataField: "cNombres" }
                    , { caption: "Ap Paterno", dataField: "cApPaterno" }
                    , { caption: "Ap Materno", dataField: "cApMaterno" }
                    , { caption: "Sexo", dataField: "cSexo", width: 40, visible: false }
                    , { caption: "Edad", dataField: "cEdad", width: 40, visible: false }
                    , { caption: "Fecha Nac", dataField: "dFechaNac", visible: false }
                    , { caption: "Nacionalidad", dataField: "cNacionalidad", visible: false }
                    , { caption: "Direccion", dataField: "cDireccion", visible: false }
                    , { caption: "Distrito", dataField: "cDistrito", visible: false }
                    , { caption: "Departamento", dataField: "cDepartamento", visible: false }
                    , { caption: "Celular", dataField: "cCelular", visible: true }
                    , { caption: "Email", dataField: "cEmail", visible: true }
                    , { caption: "Turno Preferido", dataField: "cTurno", visible: true }
                    , { caption: "Cargo que postula", dataField: "CargoPost" }
                    , { caption: "Trabajo en SF?", dataField: "bReingresante", width: 80 }
                    , { caption: "Cargo q realizó ", dataField: "cReCargos", width: 150 }
                    , { caption: "Campaña q trabajó", dataField: "cReCapanias", width: 150 }
                    , { caption: "Año q trabajó", dataField: "cReAnios", width: 150 }
                    , { caption: "GradoInstruccion", dataField: "cGradoInstruccion", visible: false }
                    , { caption: "Otras Labores:", dataField: "cReOtroCargo", visible: false }
                    , { caption: "FechaRegistro:", dataField: "FechaRegistro"}
                    , {
                        type: "buttons",
                        buttons: ["delete",
                            //{
                            //    icon: "image",
                            //    hint: "Ver Foto",
                            //    onClick: function (e) {
                            //        var name = e.row.data.cNombres + ' ' + e.row.data.cApPaterno + ' ' + e.row.data.cApMaterno;
                            //        ViewDoc(e.row.data.cImg, 1, name);
                            //        e.event.preventDefault();
                            //    },
                            //    visible: function (e) {
                            //        if (e.row.data.cImg != '' && e.row.data.cImg != null) {
                            //            return false
                            //        } else {
                            //            return false
                            //        }
                            //    }
                            //},
                            {
                                icon: "doc",
                                hint: "Curriculum",
                                onClick: function (e) {
                                    var name = e.row.data.cNombres + ' ' + e.row.data.cApPaterno + ' ' + e.row.data.cApMaterno;
                                    ViewDoc(e.row.data.cFile, 2, name);
                                    e.event.preventDefault();
                                },
                                visible: function (e) {
                                    if (e.row.data.cFile != '' && e.row.data.cFile != null) {
                                        return true
                                    } else {
                                        return false
                                    }
                                }
                            }
                        ]
                    }
                ],
                sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }],
                summary: {
                    groupItems: [{
                        column: "nIdPersona",
                        summaryType: "count",
                        displayFormat: "{0} Postulantes",
                    }]
                },
                onSelectionChanged: function (selectedItems) {
                    changedBySelectBox = false;
                    var data = selectedItems.selectedRowsData;
                    if (data.length > 0)

                        cad_id = $.map(data, function (value) {
                            return value.nIdPersona;
                        }).join(";")
                    else
                        cad_id = '';
                    $("#Div_close_part").hide();
                    var elements = cad_id.split(';');
                    $('#selx').text(elements.length);
                    if (!changedBySelectBox)
                        changedBySelectBox = false;
                    if (cad_id != '') {
                        $("#Div_close_part").show();
                    } else {
                        $("#Div_close_part").hide();
                    }
                },
                onRowRemoving: function (e) {
                    DeleteSeleccion(e.key.nIdPersona, '0');
                },
                onRowRemoved: function (e) {
                }
            }).dxDataGrid("instance");

            if (checkf != 0 && checkf != '') {
                $("#DataGrid").dxDataGrid({
                    selection: {
                        mode: "multiple",
                    },
                });

                var clearButton = $("#gridClearSelection").dxButton({
                    text: "Clear Selection",
                    disabled: true,
                    onClick: function () {
                        dataGrid.clearSelection();
                    }
                }).dxButton("instance");

            }

            $("#autoExpand").dxCheckBox({
                value: false,
                text: "Expandir",
                onValueChanged: function (data) {
                    dataGrid.option("grouping.autoExpandAll", data.value);
                }
            });

            $("#filterRow").dxCheckBox({
                text: "Buscar",
                value: false,
                onValueChanged: function (data) {
                    dataGrid.clearFilter();
                    dataGrid.option("filterRow.visible", data.value);
                    // applyFilterModeEditor.option("disabled", !data.value);
                }
            });

            $("#headerFilter").dxCheckBox({
                text: "Filtro",
                value: false,
                onValueChanged: function (data) {
                    dataGrid.clearFilter();
                    dataGrid.option("headerFilter.visible", data.value);
                }
            });

            
        }


        function TbPivotGrid(data) {
            DevExpress.localization.locale('es');

            var pivotGridChart = $("#pivotgrid-chart").dxChart({
                commonSeriesSettings: {
                    type: "bar"
                },
                tooltip: {
                    enabled: true,
                    customizeTooltip: function (args) {
                        return {
                            html: args.seriesName + " | Total " + args.value + " Inscritos"
                        };
                    }
                },
                size: {
                    height: 200
                },
                adaptiveLayout: {
                    width: 450
                }
            }).dxChart("instance");


            var pivotGrid = $("#PivotGrid").dxPivotGrid({
                rowHeaderLayout: "tree",
                allowSortingBySummary: true,
                allowSorting: true,
                allowFiltering: true,
                showColumnTotals: false,
                showRowTotals: false,
                //  allowExpandAll: false,
                // height: 440,
                showBorders: true,
                bindingOptions: {
                    headerFilter: "headerFilter"
                },
                //fieldPanel: {
                //    visible: true
                //},
                fieldChooser: {
                    allowSearch: true,
                    enabled: true
                },
                headerFilter: {
                    allowSearch: true,
                    showRelevantValues: true,
                },
                fieldChooser: {
                    allowSearch: true
                },
                fieldPanel: {
                    visible: true
                },
                export: {
                    enabled: true,
                    fileName: "Resumen Incripciom"
                },
                printingEnabled: true,
                dataSource: {
                    fields: [
                        { caption: "Cargo que postula", dataField: "CargoPost", visible: true, area: "row", width: 300, }
                        , { caption: "Turno Preferido", dataField: "cTurno", width: 40, visible: true, area: "column" }
                        , { caption: "Trabajo en SF?", dataField: "bReingresante", width: 80, visible: true, area: "column" }
                        , { caption: "Sexo", dataField: "cSexoCom", width: 40, visible: true, area: "column" }
                        , {
                            caption: "Inscritos", dataField: "Inscritos", visible: true, area: "data", dataType: "number",
                            summaryType: "sum",
                            format: function (value) {
                                return formatNumber.new(value);
                            },
                        }
                    ],
                    store: data
                }
            }).dxPivotGrid("instance");

            pivotGrid.bindChart(pivotGridChart, {
                dataFieldsDisplayMode: "splitPanes",
                alternateDataFields: false
            });

            //function expand() {
            //    var dataSource = pivotGrid.getDataSource();
            //    dataSource.expandHeaderItem("row", ["North America"]);
            //    dataSource.expandHeaderItem("column", [2013]);
            //}

            //setTimeout(expand, 0);
        }

        $("#selec_persona").click(function () {
            var obj = new Object();
            obj.vcIds = cad_id;
            obj.vnEstado = parseInt($('#nEstado').val()) + 1;
            if (obj.vcIds != '' && obj.vcIds != null) {
                $.ajax({
                    type: 'POST',
                    url: "../SerRRHH.asmx/SeleccionarPersonal",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        if (data.d >= 0) {
                            ShowToast('success', 'Personal Seleccionado', '');

                            $("#Div_close_part").hide();

                            cargatabla($('#nEstado').val());
                            loaddetail();
                            cad_id = '';
                            $('#selx').text('');
                        } else {
                            ShowToast('error', 'Ocurrio un Error', 'no se pudo seleccionar')
                        }
                    }
                });
            }
        });

        Array.prototype.contains = function (obj) {
            return this.indexOf(obj) > -1;
        };

        function ViewDoc(file, type, name) {
            $('#DocView').html('');

            if (file != null) {
                var fileext = file.split('.').pop();
            } else {
                var fileext = 'none';
            }

            $('#titleDoc').text(name);

            if (type == 1) {
                fileurl = url + '/ImgPersonal/' + file;
            } else if (type == 2) {
                fileurl = url + '/DocPersonal/' + file;
            }

           
            $('#embed').html('<div class="embed-responsive" id="DocView" style=""></div>');
            $('#down').html('');

            exist = fileExists(fileurl);

            if (exist == true && ['pdf', 'jpeg', 'jpg', 'png', 'svg', 'txt'].contains(fileext)) {
                $('#modview').attr('class', 'modal-dialog modal-lg');
                $('#data').attr('class', 'col-md-3');
                $('#embed').show();
                $("#DocView").animate({
                    height: "65vh"
                }, 100);

                var embed = '<embed src="' + fileurl + '#toolbar=0&navpanes=0&scrollbar=0" type="application/pdf" width="100%"/>';
                var desc = '<div style="text-align: center"><br><a href="' + fileurl + '" download="' + name + '_' + file + '" class="show-data btn btn-link blue m-0 p-0"> ' + name + '_' + file + ' <i class="fas fa-download"></i></a>';

                $('#DocView').html(embed);
                $('#down').html(desc);

                $("#ModalViewDoc").modal('show');
            } else if (exist == true && ['doc', 'docx'].contains(fileext)) {
                $('#modview').attr('class', 'modal-dialog modal-sm');
                $('#data').attr('class', 'col-md-3');
                $('#embed').show();

                $("#DocView").animate({
                    height: "5vh"
                }, 100);
              //  var embed2 = '<embed src="' + fileurl + '#toolbar=0&navpanes=0&scrollbar=0" /><br />'
                var embed = '<div style="text-align: center">No se puede visualizar, Click para Descargar ';
                var desc = '<a href="' + fileurl + '" download="' + name + '_' + file + '" class="show-data btn btn-link blue m-0 p-0"> ' + name + '_' + file + ' <i class="fas fa-download"></i></a>';
                $('#DocView').html(embed);
                $('#down').html(desc);
                $("#ModalViewDoc").modal('show');
                //$('#DocView').hide();
              //  setTimeout(function () { $("#ModalViewDoc").modal('hide'); }, 3000);
            } else {
                toastr.error('Archivo No existe', 'ERROR AL ABRIR');

                $('#modview').attr('class', 'modal-dialog modal-xs');
                $('#data').attr('class', 'col-md-12');
                $('#embed').hide();

                $('#DocView').html('');
                $('#down').html('');

                $("#ModalViewDoc").modal('hide');
            }

        }

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

        function fileExists(urlToFile) {
            var xhr = new XMLHttpRequest();
            xhr.open('HEAD', urlToFile, false);
            xhr.send();

            if (xhr.status == "404") {
                return false;
            } else {
                return true;
            }
        }

        var formatNumber = {
            separador: ",", // separador para los miles
            sepDecimal: '.', // separador para los decimales
            formatear: function (num) {
                num += '';
                var splitStr = num.split('.');
                var splitLeft = splitStr[0];
                var splitRight = splitStr.length > 1 ? this.sepDecimal + splitStr[1] : '';
                var regx = /(\d+)(\d{3})/;
                while (regx.test(splitLeft)) {
                    splitLeft = splitLeft.replace(regx, '$1' + this.separador + '$2');
                }
                return this.simbol + splitLeft + splitRight;
            },
            new: function (num, simbol) {
                this.simbol = simbol || '';
                return this.formatear(num);
            }
        }

        function download(namefile) {
            axios({
                url: namefile,
                method: 'GET',
                responseType: 'blob'
            })
                .then((response) => {
                    const url = window.URL
                        .createObjectURL(new Blob([response.data]));
                    const link = document.createElement('a');
                    link.href = url;
                    link.setAttribute('download', 'image.jpg');
                    document.body.appendChild(link);
                    link.click();
                    document.body.removeChild(link);
                })
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
