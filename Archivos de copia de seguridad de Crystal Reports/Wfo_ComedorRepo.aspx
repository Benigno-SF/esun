<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ComedorRepo.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_ComedorRepo" %>

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
           /*font-size: 7px*/
        }

        .table th {
            padding: 0.2rem 0.8rem;
            font-size: 8px
        }
        .table td {
            padding: 0.2rem 0.8rem !important;
            font-size: 8px
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
            <asp:DropDownList ID="ddlTipoEvento" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnBusc" class="btn btn-secondary col-12">
                <i class="fas fa-search"></i>Buscar
            </button>
        </div>
    </div>
    <br />
   
    <!-- Excel - Cell background table -->
    <section id="cell-background">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title" id="titulo">Reporte Comedor</h4>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body card-dashboard">
                            <table id="table-deta" class="table table-striped table-bordered dataex-html5-background table-responsive">
                                <thead>
                                    <tr>
                                        <th>DNI</th>
                                        <th>Fotocheck</th>
                                        <th>Nombre y apellidos</th>
                                        <th>Cargo</th>
                                        <th>Evento</th>
                                        <th id="ndia1">dia1</th>
                                        <th id="ndia2">dia2</th>
                                        <th id="ndia3">dia3</th>
                                        <th id="ndia4">dia4</th>
                                        <th id="ndia5">dia5</th>
                                        <th id="ndia6">dia6</th>
                                        <th id="ndia7">dia7</th>
                                        <th >total</th>
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

    <script src="../Scripts/dt/datatables.min.js"></script>
    <script src="../Scripts/dt/dataTables.buttons.min.js"></script>
    <script src="../Scripts/dt/buttons.bootstrap4.min.js"></script>
    <script src="../Scripts/dt/vfs_fonts.js"></script>
    <script src="../Scripts/dt/buttons.html5.min.js"></script>

    <script>

        $("#btnBusc").click(function () {
            cargatabla();
        });


        var cargatabla = function () {

            
            $('#ndia1').text(sumarDias($("#txtFeCont").val(), 0))
            $('#ndia2').text(sumarDias($("#txtFeCont").val(), 1))
            $('#ndia3').text(sumarDias($("#txtFeCont").val(), 2))
            $('#ndia4').text(sumarDias($("#txtFeCont").val(), 3))
            $('#ndia5').text(sumarDias($("#txtFeCont").val(), 4))
            $('#ndia6').text(sumarDias($("#txtFeCont").val(), 5))
            $('#ndia7').text(sumarDias($("#txtFeCont").val(), 6))


            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcFecha = $("#txtFeCont").val();
            obj.vnIdTipoEvento = $('#<%=ddlTipoEvento.ClientID%>').val();
            if ($("#txtFeCont").val() != '') {
                var title = 'Reporte Comedor de ' + $("#txtFeCont").val() + ' hasta ' + sumarDias($("#txtFeCont").val(), 6);
            } else {
                var title = 'Reporte Comedor de ' + sumarDias($("#txtFeCont").val(), 0) + ' hasta ' + sumarDias($("#txtFeCont").val(), 6);
            }
            $("#titulo").text(title);
            //  var f = new Date();
            //alert(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
            $('.dataex-html5-background tbody').html('<tr><td colspan="13" class="text-center bold" style="font-size: 16px"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</td><tr>');
            $.ajax({
                type: 'POST',
                url: "../SerRRHH.asmx/TicketAlimentosList",
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
                        //buttons: [
                        //    'copyHtml5',
                        //    'excelHtml5',
                        //],
                            buttons: [
                                {name: 'copy',  extend: 'copy',  exportOptions: {columns: ':gt(0)', orthogonal: 'export'}, filename: title, title: null},
                                {name: 'excel', extend: 'excel', exportOptions: {columns: ':gt(0)', orthogonal: 'export'}, filename: title, sheetName: 'Results', title: null},
                            ],
                        "paging": false,
                        "ordering": false,
                        "info": false,
                        responsive: true,
                        data: lst,
                        columns: [
                            { data: 'cNroDocumento' },
                            { data: 'cCodigoControl' },
                            { data: 'cNombres' },
                            { data: 'cGrupoTrabajo' },
                            { data: 'nIdTipoEvento' },
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
                }
            });

        }
        $(document).ready(function () {
            cargatabla();
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
