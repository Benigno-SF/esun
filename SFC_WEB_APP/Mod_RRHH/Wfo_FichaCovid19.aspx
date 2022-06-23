<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_FichaCovid19.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_FichaCovid19" %>

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
            font-size: 10px
        }

        .table td {
            padding: 0.65rem 0.65rem !important;
            font-size: 10px
        }

        .bolded {
            font-weight: bold;
        }

        /* Círculos de colores numerados */
        .circulo_red {
            width: 1.7rem;
            height: 1.7rem;
            border-radius: 50%;
            background: red;
            display: flex;
            justify-content: center;
	        align-items: center;
	        text-align: center;
            margin: 0px auto;
            color: red;
        }

        .circulo_green {
            width: 1.7rem;
            height: 1.7rem;
            border-radius: 50%;
            background: #79e04e;
            display: flex;
            justify-content: center;
	        align-items: center;
	        text-align: center;
            margin: 0px auto;
            color: green;
        }

        .circulo_ambar {
            width: 1.7rem;
            height: 1.7rem;
            border-radius: 50%;
            background: #ffd800;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            margin: 0px auto;
            color: #ffd800;
        }

        .txt-circle {
            font-family: sans-serif;
            color: white;
            font-size: 0.8rem;
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
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" style="display: none">
            <label for="btnBusc">Ficha</label>
            <select class="form-control" id="ficha" name="ficha">
                <option value="0">Seleccione Ficha</option>
                <option value="4" selected="selected">Ficha Sint. Covid 19</option>
            </select>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
            <label for="anio">Año</label>
            <select class="form-control" id="anio" name="anio">
                <option value="0" selected="selected" disabled="disabled">Seleccione Año</option>
                <option value="2020">2020</option>
            </select>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
            <label for="mes">Mes de Llenado</label>
            <select class="form-control" id="mes" name="mes">
            </select>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2 pb-0 mb-0">
            <label for="recuperar">&nbsp;</label>
            <button type="button" id="recuperar" name="recuperar" class="btn btn-secondary col-12">
                <i class="fa fa-search"></i>Recuperar
            </button>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2 pb-0 mb-0">
            <label for="recuperar">&nbsp;</label>
            <button type="button" id="" idp="0" class="btn btn-secondary col-12 btnPrint">
                <i class="fa fa-search"></i>imprimir todos
            </button>
        </div>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2 pb-0 mb-0">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnInicProc" runat="server" class="btn btn-primary col-12 proceso">
                <i class="fa fa-play-circle"></i>Iniciar
            </button>
            <button type="button" id="btnFinProc" runat="server" class="btn btn-primary col-12 proceso">
                <i class="fa fa-stop-circle"></i>Terminar
            </button>
        </div>
        <div class="form-group col-6 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
            <label for="btnBusc">&nbsp;</label>
            <b>
                <p id="txtProc" runat="server"></p>
            </b>
        </div>
    </div>
    <!-- Excel - Cell background table -->
    <section id="cell-background">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">FICHAS DE PERSONAL</h4>
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
                                        <th>Nombres</th>
                                        <th>Fecha Nac.</th>
                                        <th>Edad</th>
                                        <th>Celular</th>
                                        <th>Direccion</th>
                                        <th>Lugar de trabajo</th>
                                        <th>fecha</th>
                                        <th>mes</th>
                                        <th>estado</th>
                                        <th>print</th>
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
    <script src="../Scripts/sweetalert2.js"></script>
    <script>
        $(document).on('click', '#recuperar', function (event) {
            event.preventDefault();
            cargatabla();
        });

        function LoaddllMes() {

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdFicha = 0;
            obj.vnIdFichaMes = -1;
            $.ajax({
                type: 'POST',
                url: "../SerRRHH.asmx/FichaMesList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    $("#organigrama").html('');
                    var lst = JSON.parse(data.d);
                    var option_m = "";
                    option_m += '<option value="0" selected="selected" disabled="disabled">Seleccione Mes</option>';

                    $("#mes").html('');
                    for (i = 0; i < lst.length; ++i) {
                        option_m += '<option value="' + lst[i].nMes + '" >' + namemes(lst[i].nMes) + '</option>';
                    }
                    $("#mes").html(option_m);
                }
            })
        }

        LoaddllMes();

        var cargatabla = function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdFicha = $('#ficha').val();
            obj.vnIdFichaPersonal = 0;
            obj.vcNroDocumento = '';
            obj.vcAnio = $('#anio').val();
            obj.vnMes = $('#mes').val();

            if (obj.vcIdEmpresa != null && obj.vnIdFicha != '0' && obj.vcAnio != '0' && obj.vnMes != '0' && obj.vcAnio != null && obj.vnMes != null) {
                $('.dataex-html5-background tbody').html('<tr><td colspan="12" class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</td><tr>');

                $.ajax({
                    type: 'POST',
                    url: "../SerRRHH.asmx/FichaPersonalList",
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
                                { data: 'nIdFichaPersonal' },
                                { data: 'cNroDocumento' },
                                { data: 'cNombre' },
                                { data: 'dFechaNac' },
                                { data: 'nEdad' },
                                { data: 'cCelular' },
                                { data: 'cDireccion' },
                                { data: 'Ubicacion' },
                                { data: 'dFecha' },
                                {
                                    data: 'nMes',
                                    render: function (nMes) {
                                        return namemes(nMes);
                                    }
                                }, {
                                    data: 'porcent',
                                    render: function (porcent) {
                                        if (porcent >= 60) {
                                            return '<div class="circulo_red"><span class="txt-circle">' + porcent + '%</span></div>';;
                                        } else if (porcent <= 60 && porcent >= 30) {
                                            return '<div class="circulo_ambar"><span class="txt-circle">' +porcent+'%</span></div>';
                                        } else if (porcent <= 30) {
                                            return '<div class="circulo_green"><span class="txt-circle">' + porcent + '%</span></div>';;
                                        }

                                    }


                                }, {
                                    data: 'nIdPersonal',
                                    render: function (nIdPersonal) {
                                        return '<button onclick="" id="" type="button" idp="' + nIdPersonal + '" class="mybtn btn btn-link btnPrint"><span class="fa fa-print"></span></button>';
                                    }
                                },
                            ],
                            "columnDefs": [
                                { targets: [0], visible: false },
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
                           // "order": [[8, "desc"]],
                            language: {
                                "processing": "<img src='../img/loading.gif' />",
                                "decimal": "",
                                "emptyTable": "No hay datos",
                                "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                                "infoEmpty": "Mostrando 0 a 0 de 0 registros",
                                "infoFiltered": "(Filtro de _MAX_ total registros)",
                                "infoPostFix": "",
                                "thousands": ",",
                                "lengthMenu": "Mostrar _MENU_ registros",
                                "loadingRecords": "Cargando...",
                                "processing": "Procesando...",
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
                });
            } else {
                toastr.error('FALTA EMPRESA', '');
            }
        }

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

        function namemes(mes) {
            var month = new Array();
            month[1] = "Enero";
            month[2] = "Febrero";
            month[3] = "Marzo";
            month[4] = "Abril";
            month[5] = "Mayo";
            month[6] = "Junio";
            month[7] = "Julio";
            month[8] = "Agosto";
            month[9] = "Septiembre";
            month[10] = "Octubre";
            month[11] = "Noviembre";
            month[12] = "Diciembre";
            return month[mes];
        };

        function IniFinProceso(obj) {
            $.ajax({
                async: false,
                type: 'POST',
                url: "../SerRRHH.asmx/InicFinMes",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    switch (lst[0].nIdFichaMes) {
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

        $(document).on('click', '.btnPrint', function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdPersonal = $(this).attr('idp');
            if (obj.vnIdPersonal != null && obj.vnIdPersonal != '') {
                $.ajax({
                    async: false,
                    type: 'POST',
                    url: "../SerRepo.asmx/RepFicha",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = data.d;
                        alert(lst[1]);
                        myWindow = window.open("../Mod_Repo/Wfo_RepoView.aspx?Cd=" + fuGetCdEmpre() + "&wXml=" + lst[1] + "&wCrt=Crt_FichaSC19&wExp=2&wCan=0", "popup_window",
                            "width=970, height=600 toolbar=no, scrollbars=no, resizable=no, top=20, left=200");

                    },
                    error: function (error) {
                        console.log(error);
                        alert(JSON.stringify(error))
                    }
                });
            } else {
                toastr.error('', 'ERROR NO SE ENCONTRO ID')
            }
        });

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
