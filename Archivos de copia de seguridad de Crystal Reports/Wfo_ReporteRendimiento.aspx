<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ReporteRendimiento.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Wfo_ReporteRendimiento" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #chart-container {
            width: 100%;
            height: auto;
        }
    </style>
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
            font-size: 9px
        }
        .table td {
            padding: 0rem 0rem !important;
            font-size: 9px
        }
    </style>


    <!-- <script type="text/javascript" src="http://192.168.20.20/ch/js/Chart.min.js"></script>-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">

    <div class="row">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivFeCont">
            <label for="txtFeCont">Fecha Inicio</label>
            <input type="text" id="txtFeCont" name="txtFeCont" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
            <script type="text/javascript">
                $(function () {
                    $('#txtFeCont').datetimepicker({
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
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="message-text">Linea:</label>
            <asp:DropDownList ID="ddlAreaGrupoSearch" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="message-text">Labor:</label>
            <asp:DropDownList ID="ddlLabor" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="message-text">Presentacion:</label>
            <asp:DropDownList ID="ddlEmbalaje" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="message-text">Supervisor:</label>
            <asp:DropDownList ID="ddlSupervisor" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnBusc" class="btn btn-secondary col-12">
                <i class="fas fa-search"></i>Buscar
            </button>
        </div>
<%--        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="btnAdd">&nbsp;</label>
            <button type="button" id="btnAdd" class="btn btn-warning col-12" data-toggle="modal" data-target="#modalAdd">
                <i class="fa fa-plus"></i>Castigar Cajas
            </button>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="btnAdd">&nbsp;</label>
            <button type="button" id="btnRep" class="btn btn-primary col-12" data-toggle="modal" data-target="#modalRepo">
                <i class="fas fa-plus"></i>Generar Reporte
            </button>
        </div>--%>
    </div>
    <br />
    <div class="modal fade" id="modalAdd" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Agregar Excepciones</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="input-group mb-3">
                        <input type="text" id="CodeUser" name="CodeUser" class="form-control has-icon-left" placeholder="Ingrese su número de  Dni" required="required" onkeypress="validar(event)" />
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" id="btnSearch" type="button">Buscar</button>
                        </div>
                    </div>
                    <div id="labels" class="form-group">
                    </div>
                    <div id="det">
                        <div class="form-group p-0 m-0">
                            <label for="message-text" class="col-form-label">Linea:</label>
                            <asp:DropDownList ID="ddlAreaGrupo_c" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="form-group p-0 m-0" id="DivFechaProc">
                            <label for="txtFecha">Fecha</label>
                            <input type="text" id="txtFechaProc" name="txtFechaProc" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
                            <script type="text/javascript">
                                $(function () {
                                    $('#txtFechaProc').datetimepicker({
                                        format: 'DD/MM/YYYY',
                                        locale: 'es'
                                    });
                                    $(function () {
                                        $('#DivFechaProc').datetimepicker({
                                            format: 'DD/MM/YYYY',
                                            locale: 'es'
                                        });
                                    });
                                });
                            </script>
                        </div>

                        <div class="form-group p-0 m-0">
                            <label for="recipient-name" class="col-form-label">Cajas de Calidad:</label>
                            <input type="number" id="ncajas" class="form-control round" value="" autocomplete="off">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="cNroDocumento" value="">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" id="btnaddCastigo" class="btn btn-success" style="display: none">Aplicar</button>
                </div>
            </div>
        </div>
    </div>



    <!-- Excel - Cell background table -->
    <section id="cell-background">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Reporte Rendimiento</h4>
                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                                <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                <li><a data-action="close"><i class="ft-x"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body card-dashboard">
                            <table id="table-deta" class="table table-striped table-bordered dataex-html5-background table-responsive">
                                <thead>
                                    <tr>
                                        <th>Linea</th>
                                        <th>DNI</th>
                                        <th>Nombre y apellidos</th>
                                        <th>Labor</th>
                                        <th>Presentacion</th>
                                        <th>Supervisor</th>
                                        <th id="tdia1">dia1</th>
                                        <th id="tdia2">dia2</th>
                                        <th id="tdia3">dia3</th>
                                        <th id="tdia4">dia4</th>
                                        <th id="tdia5">dia5</th>
                                        <th id="tdia6">dia6</th>
                                        <th id="tdia7">dia7</th>
                                        <th>total</th>
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

        function calc_dias(fechaini) {
                $('#tdia1').text(sumarDias(fechaini, 0));
                $('#tdia2').text(sumarDias(fechaini, 1));
                $('#tdia3').text(sumarDias(fechaini, 2));
                $('#tdia4').text(sumarDias(fechaini, 3));
                $('#tdia5').text(sumarDias(fechaini, 4));
                $('#tdia6').text(sumarDias(fechaini, 5));
                $('#tdia7').text(sumarDias(fechaini, 6));
        }

        $(document).on('click', '#btnaddCastigo', function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcIdCodigoGeneral = $('#cNroDocumento').val();
            obj.vnIdGrupo = $('#<%=ddlAreaGrupo_c.ClientID%>').val();
            obj.vcFecha = $('#txtFechaProc').val();
            obj.vnCastigo = $('#ncajas').val();
            if (obj.vcNroDocumento != '' && obj.vnIdGrupo != '' && obj.vcFecha != '' && obj.vnCastigo != '') {
                $.ajax({
                    async: false,
                    type: 'POST',
                    url: "../SerProd.asmx/RendimientoCastigo_Regi",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        if (lst != "") {
                            toastr["success"]('Se ha Aplicado ' + lst[0].cajas + ' cajas de castigo a ' + lst[0].Personal + ' del proceso del dia ' + lst[0].Fecha, "Castigo Aplicado");
                            $('#labels').html('');
                        }
                        else {
                            toastr["error"]("No hay proceso del dia " + obj.vcFecha + ", y/o los datos son incorrectos", 'Fecha y/o Datos Incorrectos');
                            $('#txtFechaProc').val('');
                            $('#<%=ddlAreaGrupo_c.ClientID%>').val('');
                            $('#ncajas').val('');
                            $('#labels').html('');
                        }
                    },
                    error: function (error) {
                        console.log(error);
                        alert(JSON.stringify(error))
                    }
                });
            } else {
                toastr['error']('', 'SELECCIONE TODOS LOS CAMPOS');
            }

        });

        $("#btnBusc").click(function () {
            cargatabla();
        });


        var cargatabla = function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcFecha = $("#txtFeCont").val();
            obj.vnIdGrupo = $('#<%=ddlAreaGrupoSearch.ClientID%>').val();
            obj.vcLabor = $('#<%=ddlLabor.ClientID%>').val();
            obj.vnIdEmbalaje = $('#<%=ddlEmbalaje.ClientID%>').val();
            obj.vnIdPersonal = $('#<%=ddlSupervisor.ClientID%>').val();
            //  var f = new Date();
            //alert(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
            $('.dataex-html5-background tbody').html('<tr><td colspan="14" class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</td><tr>');
            calc_dias(obj.vcFecha);
            $.ajax({
                type: 'POST',
                url: "../SerProd.asmx/RendimientoProcesoRegistroList",
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
                        responsive: true,
                        data: lst,
                        columns: [
                            { data: 'cDescAGrupo' },
                            { data: 'cIdCodigoGeneral' },
                            { data: 'Nombre' },
                            { data: 'clabor' },
                            { data: 'cDesEmbalaje' },
                            { data: 'supervisor' },
                            { data: 'dia1' },
                            { data: 'dia2' },
                            { data: 'dia3' },
                            { data: 'dia4' },
                            { data: 'dia5' },
                            { data: 'dia6' },
                            { data: 'dia7' },
                            { data: 'total' },
                            /*{
                                 data: 'Falta',
                            render: function (Falta) {
                                if (Falta == "0 Segundos") {
                                    return '<B style="color: red" class="parpadea text">CULMINO<B>';
                                } else {
                                    return Falta;
                                }

                            }
                            }*/
                        ],
                        language: {
                            "processing": "<img src='../img/loading.gif' />"
                        },
                    });
                    //  var t = $('.dataex-html5-background tbody').prepend('<tr role="row" class="odd"><td tabindex="0"></td><td></td><td></td><td></td><td>' + d1 + '</td><td>' + d2 + '</td><td>' + d3 + '</td><td>' + d4 + '</td><td>' + d5 + '</td><td>' + d6 + '</td><td>' + d7 + '</td><td></td></tr>');
                }
            });

        }
        $(document).ready(function () {
            cargatabla();
            // var intervalo = setInterval(cargatabla, 1000);
        });
        function sumarDias(fecha, dias) {
            if (fecha != '') {
                var dat = fecha.split('/');
                var fech = dat[1] + '/' + dat[0] + '/' + dat[2];
                var fecha = new Date(fech);
            } else {
                var fecha = new Date();
                fecha.setDate(fecha.getDate() - 6);
            }
            fecha.setDate(fecha.getDate() + dias);
            return ('0' + fecha.getDate()).slice(-2)+ "/" + ('0' + (fecha.getMonth() + 1)).slice(-2) + "/" + fecha.getFullYear();
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
