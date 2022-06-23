<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_GasificadoReporte_PaletsPorTunel.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_GasificadoReporte_PaletsPorTunel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title></title>
    <%: Scripts.Render("~/jquery") %>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/icheck-bootstrap/3.0.1/icheck-bootstrap.min.css" integrity="sha512-8vq2g5nHE062j3xor4XxPeZiPjmRDh6wlufQlfC6pdQ/9urJkU07NM0tEREeymP++NczacJ/Q59ul+/K2eYvcg==" crossorigin="anonymous" />
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <style>

        .table td, .table th {
    padding: .45rem;
    vertical-align: top;
    border-top: 1px solid #dee2e6;
    text-align: center
}

        .table {
             width:100%;
            overflow-x:scroll;
            overflow-y:hidden;
            border:1px solid red;
            -webkit-overflow-scrolling: touch;
        }

        td, th {
            
        }
        th {
            text-transform: uppercase;
        }
        .icheck-inline {
            margin: 0px !important; 
        }
        .bode {
            border-right: 3px solid #dee2e6 !important;
        }
        .resaltadofila{
            /*background-color: aliceblue;*/
            border-bottom: 5px solid !important;
            color: red !important;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h4 style="margin-top: 15px; text-align:center;">CONTROL DE TIEMPOS DE RECEPCIÓN</h4>
                <hr/>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">Fecha:</span>
                        </div>
                        <input type="date" id="fecha" class="form-control" style="margin-bottom: 0px;" value="<%=  DateTime.Today.ToString("yyyy-MM-dd") %>" />
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="form-control" style="border:0px; padding: 0px">
                        <button type="button" class="btn btn-info" id="BtnProductores"><i class="fas fa-truck"></i></button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row" style="margin-top: -20px">
            <div class="col-md-12">
                <div id="TblCamionesPorProductor"></div>
            </div>
        </div>
    </div>

    <div class="modal" id="fh" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <label style="font-weight: bold; margin-bottom: 0px;"><span class="titProductor"></span></label>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="text-center" style="width: 100%"><b><span class="titActividad"></span> - [CAMIÓN <span class="titCamion">4</span>]</b><br/><span class="badge badge-secondary titCondicion" style="padding: 5px 10px; font-size: 15px; margin-top: 5px;" >INICIO</span></label>
                        <input id="campofecha" type="text" style="font-size: larger; text-align:center;" class="form-control" readonly="readonly" />

                    </div>
                    <div class="btn-group">
                        <button onclick="FnModificarCampo(2)" type="button" class="btn btn-success float-left" style="" data-dismiss="modal"><i class="fas fa-clock"></i>&nbsp;&nbsp;Registrar</button>
                        <button onclick="FnModificarCampo(3)" type="button" class="btn btn-primary float-left" style="" data-dismiss="modal"><i class="fas fa-minus-circle"></i>&nbsp;&nbsp;No aplica (N/A)</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="ph" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <label style="font-weight: bold; margin-bottom: 0px;"><span class="titProductor"></span></label>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="text-center" style="width: 100%"><b><span class="titActividad"></span> - [CAMIÓN <span class="titCamion">4</span>]</b><br/><span class="badge badge-secondary titCondicion" style="padding: 5px 10px; font-size: 15px; margin-top: 5px;" >INICIO</span></label>
                        <input id="camponumerico" type="number" value="1" min="1" style="font-size: larger; text-align:center;" class="form-control"  />
                    </div>
                    <div class="btn-group">
                        <button onclick="FnModificarCampo(1)" type="button" class="btn btn-info float-left" style="width: 50px;" data-dismiss="modal"><i class="fas fa-check"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="sp" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Productores</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="input-group mb-3">
                        <select id="cboproductores" class="form-control" style="width: 100%; "></select>
                    </div>
                    <div class="form-group">
                        <div class="btn-group">
                            <button id="BtnRecepciontiempoInsert" type="button" class="btn btn-info btn-sm"><i class="fas fa-plus-circle"></i></button>
                        </div>
                        <div class="btn-group">
                            <button id="BtnRecepciontiempoEliminar" type="button" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></button>
                        </div>
                        <label style="float:right" class="text-danger" id="msg_eliminar_productor"></label>
                    </div>
                    
                    <div class="table-responsive">
                        <table id="TblProductores" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th style="width:30px"></th>
                                    <th style="min-width:265px">Nombre</th>
                                    <th style="width:140px">RUC</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
    
    <script>
        var productorseleccionado_id;
        var today = new Date();
        var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();

        $(document).ready(function () {
            $('select').select2({
                theme: "classic",
                dropdownParent: $('#sp')
            });

            $('select option:eq(0)').prop('selected', true);
            productorseleccionado_id = $('select option:eq(0)').val();
        });

        $("#fecha").change(function () {
            FnRecepciontiempoListado();
        });

        $("#BtnProductores").click(function () {
            $('#sp').modal('show');
        });

        $('.frm_fh').on('click', function () {
            $('#fh').modal('show');
        });

        $('.frm_ph').on('click', function () {
            $('#ph').modal('show');
        });

        function FnHoraactual() {
            var date = new Date();
            var hour = date.getHours();
            var min = date.getMinutes();
            var sec = date.getSeconds();
            hour = FnCompletarceros(hour);
            min = FnCompletarceros(min);
            sec = FnCompletarceros(sec);
            $("#campofecha").val(hour + ":" + min + ":" + sec);
            setTimeout(function () { FnHoraactual() }, 1000);
        }

        function FnCompletarceros(k) {
            if (k < 10) { return "0" + k; }
            else { return k; }
        }

        $("#BtnRecepciontiempoEliminar").click(function () {
            $('#TblProductores tbody tr input:checked').each(function (i) {
                FnRecepciontiempoEliminar($(this).attr('id'));
            });
        });


        function FnRecepciontiempoEliminar(id) {
            var obj = new Object();
            obj.nIdRecepciontiempo = id.replace("chb_", "");
            $.ajax({
                async: false,
                type: 'POST',
                url: "SerApp.asmx/RecepciontiempoDelete",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    FnRecepciontiempoListado();
                },
                error: function (error) {
                    var msg = error.responseText;
                    if (msg.includes("REFERENCE constraint")) {
                        $("#msg_eliminar_productor").html("No se puede eliminar este registro. Ya tiene camiones asociados.");
                    } else {
                        $("#msg_eliminar_productor").html("No se puede completar la eliminación.");
                    }
                    setTimeout(function () {
                        $('#msg_eliminar_productor').html("");
                    }, 4000);
                }
            });
        }

        function FnRecepciontiempoListado() {
            $("#TblProductores tbody").empty();
            var obj = new Object();
            obj.dFecha = $("#fecha").val();
            console.log("Fecha: " + obj.dFecha);
            $.ajax({
                async: false,
                type: 'POST',
                url: "SerApp.asmx/SeleccionarPorFecha",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var datos = JSON.parse(data['d']);
                    for (var i = 0; i < datos.length; i++) {
                        $("#TblProductores tbody").append('<tr><td><div class="icheck-primary icheck-inline" style=""><input type="checkbox" id="chb_' + datos[i].Id + '" /><label for="chb_' + datos[i].Id + '"></label></div></td><td class="frm_ph" style="text-align:left">' + datos[i].cDescClieProv + '</td><td>' + datos[i].cRuc + '</td></tr>');
                    }
                    aryProductores = datos;
                    FnCamionesPorProductor();
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        }

        function seleccionafila() {
        }
        
        function FnCamionesPorProductor() {
            var tplproductores = '';
            for (var i = 0; i < aryProductores.length; i++) {
                tplproductores += '<label style="margin-top:20px; font-weight:bold"><button type="button" class="btn btn-info btn-sm" style="margin-right:7px" onclick="FnRecepciontiempodetalleInsert(' + aryProductores[i].Id + ')"><i class="fas fa-plus-circle"></i></button>' + aryProductores[i].cDescClieProv +'</label>';
                tplproductores += '<div class="table-responsive"><table id="TblProductor_' + aryProductores[i].Id + '" class="table table-bordered table-striped " style="margin-top:0px;">';
                tplproductores += '    <thead>';
                tplproductores += '            <th></th>';
                tplproductores += '            <th class="bode">CAMIONES</th>';
                tplproductores += '            <th style="text-align: center; width: 120px" class="bode">Parihuelas</th>';
                tplproductores += '            <th colspan="2" style="text-align: center; width: 120px;" class="bode">Descarga</th>';
                tplproductores += '            <th colspan="2" style="text-align: center; width: 120px;" class="bode">Pesado y etiquetado</th>';
                tplproductores += '            <th colspan="2" style="text-align: center; width: 120px;" class="bode">Ingreso a gasificado</th>';
                tplproductores += '            <th colspan="2" style="text-align: center; width: 120px;" class="bode">Carga de Jabas</th>';
                tplproductores += '            <th></th>';
                tplproductores += '        </tr>';
                tplproductores += '    </thead>';
                tplproductores += '    <tbody></tbody>';
                tplproductores += '</table></div>';
            }
            $("#TblCamionesPorProductor").empty();
            $("#TblCamionesPorProductor").append(tplproductores);
            for (var i = 0; i < aryProductores.length; i++) {
                FnRecepciontiempodetalleActualizarlista(aryProductores[i].Id);
            }
        }

        function FnRecepciontiempoInsert() {
            var obj = new Object();
            obj.cRuc = productorseleccionado_id;
            obj.dFecha = $("#fecha").val();
            $.ajax({
                async: false,
                type: 'POST',
                url: "SerApp.asmx/RecepciontiempoInsert",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    FnRecepciontiempoListado();
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        }

        $("#BtnRecepciontiempoInsert").click(function () {
            FnRecepciontiempoInsert();
        });

        function FnRecepciontiempodetalleInsert(Id) {
            //Agrear un detalle a la recepcion
            var obj = new Object();
            obj.nIdRecepciontiempo = Id;
            $.ajax({
                async: false,
                type: 'POST',
                url: "SerApp.asmx/RecepciontiempodetalleInsert",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var datos = JSON.parse(data['d']);
                    FnRecepciontiempoListado();
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        }
        

        function FnRecepciontiempodetalleDelete(Id) {
            var obj = new Object();
            obj.nIdRecepciontiempodetalle = Id;
            $.ajax({
                async: false,
                type: 'POST',
                url: "SerApp.asmx/RecepciontiempodetalleDelete",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    console.log("Eliminado: " + Id);
                    FnRecepciontiempoListado(Id);
                },
                error: function (error) {
                }
            });
        }

        function FnConvertirNumeroAFecha(formatonumero) {
            var fecha = "";
            if (formatonumero != null) {
                var valuze = new Date(parseInt(formatonumero.substr(6)));
                if (valuze.getFullYear() == '1990') {
                    fecha = "N/A";
                } else {
                    fecha = FnCompletarceros(valuze.getHours()) + ":" + FnCompletarceros(valuze.getMinutes()) + ":" + FnCompletarceros(valuze.getSeconds());
                }
            } else {
                fecha = "00:00:00";
            }
            return fecha;
        }

        function FnRecepciontiempodetalleActualizarlista(Id) {
            var obj = new Object();
            obj.nIdRecepciontiempo = Id;
            $.ajax({
                async: false,
                type: 'POST',
                url: "SerApp.asmx/RecepciontiempodetalleListadoPorCabeceraId",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var ultimacadena = "";
                    var datos = JSON.parse(data['d']);
                    for (var i = 0; i < datos.length; i++) {
                        if (datos[i].bEstado == 0) {
                            ultimacadena = '<tr><td style="width:56px; text-align: center;"></td><td class="bode2" onclick="seleccionafila()">CAMIÓN ' + (i + 1) + '</td><td class="bode">' + datos[i].nParihuelas + '</td><td>' + FnConvertirNumeroAFecha(datos[i].dIniDescarga) + '</td><td class="bode">' + FnConvertirNumeroAFecha(datos[i].dFinDescarga) + '</td><td>' + FnConvertirNumeroAFecha(datos[i].dIniPesadoetiquetado) + '</td><td class="bode">' + FnConvertirNumeroAFecha(datos[i].dFinPesadoetiquetado) + '</td><td>' + FnConvertirNumeroAFecha(datos[i].dIniCamaragasificado) + '</td><td class="bode">' + FnConvertirNumeroAFecha(datos[i].dFinCamaragasificado) + '</td><td>' + FnConvertirNumeroAFecha(datos[i].dIniCargajabas) + '</td><td class="bode">' + FnConvertirNumeroAFecha(datos[i].dFinCargajabas) + '</td><td style="width:56px;"><span class="btn btn-success btn-sm"><i class="fas fa-lock"></i></span></td></tr>';
                        } else {
                            ultimacadena = '<tr><td style="width:56px; text-align: center;"><span onclick="FnRecepciontiempodetalleDelete(' + datos[i].nIdRecepciontiempodetalle + ')" class="text-danger"><i class="fas fa-times-circle"></i></span></td><td class="bode2" onclick="seleccionafila()">CAMIÓN ' + (i + 1) + '</td><td onclick="FnRecepciontiempodetalleCamponumericoseleccionado(' + datos[i].nIdRecepciontiempodetalle + ', 8, ' + (i + 1) + ', ' + Id + ')" class="bode">' + datos[i].nParihuelas + '</td><td onclick="FnRecepciontiempodetalleCampofechaseleccionado(' + datos[i].nIdRecepciontiempodetalle + ', 9, ' + (i + 1) + ', ' + Id + ')">' + FnConvertirNumeroAFecha(datos[i].dIniDescarga) + '</td><td onclick="FnRecepciontiempodetalleCampofechaseleccionado(' + datos[i].nIdRecepciontiempodetalle + ', 10, ' + (i + 1) + ', ' + Id + ')" class="bode">' + FnConvertirNumeroAFecha(datos[i].dFinDescarga) + '</td><td onclick="FnRecepciontiempodetalleCampofechaseleccionado(' + datos[i].nIdRecepciontiempodetalle + ', 11, ' + (i + 1) + ', ' + Id + ')">' + FnConvertirNumeroAFecha(datos[i].dIniPesadoetiquetado) + '</td><td onclick="FnRecepciontiempodetalleCampofechaseleccionado(' + datos[i].nIdRecepciontiempodetalle + ', 12, ' + (i + 1) + ', ' + Id + ')" class="bode">' + FnConvertirNumeroAFecha(datos[i].dFinPesadoetiquetado) + '</td><td onclick="FnRecepciontiempodetalleCampofechaseleccionado(' + datos[i].nIdRecepciontiempodetalle + ', 13, ' + (i + 1) + ', ' + Id + ')">' + FnConvertirNumeroAFecha(datos[i].dIniCamaragasificado) + '</td><td onclick="FnRecepciontiempodetalleCampofechaseleccionado(' + datos[i].nIdRecepciontiempodetalle + ', 14, ' + (i + 1) + ', ' + Id + ')" class="bode">' + FnConvertirNumeroAFecha(datos[i].dFinCamaragasificado) + '</td><td onclick="FnRecepciontiempodetalleCampofechaseleccionado(' + datos[i].nIdRecepciontiempodetalle + ', 15, ' + (i + 1) + ', ' + Id + ')">' + FnConvertirNumeroAFecha(datos[i].dIniCargajabas) + '</td><td onclick="FnRecepciontiempodetalleCampofechaseleccionado(' + datos[i].nIdRecepciontiempodetalle + ', 16, ' + (i + 1) + ', ' + Id + ')" class="bode">' + FnConvertirNumeroAFecha(datos[i].dFinCargajabas) + '</td><td style="width:56px;">' + '<button class="btn btn-info btn-sm" onclick="FnRecepciontiempodetalleBloquear(' + datos[i].nIdRecepciontiempodetalle + ', 17, ' + (i + 1) + ', ' + Id + ')"><i class="fas fa-lock-open"></i></button>' + '</td></tr>';
                        }
                        $("#TblProductor_" + Id).append(ultimacadena);
                    }
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        }

        var Recepciontiempodetalle_id = "";
        var Recepciontiempodetalle_tipo = "";
        var Recepciontiempodetalle_valor = "";

        function FnRecepciontiempodetalleCamponumericoseleccionado(id, tipo, idx, idproductor) {
            Recepciontiempodetalle_id = id;
            Recepciontiempodetalle_tipo = tipo;

            for (var i = 0; i < aryProductores.length; i++) {
                if (aryProductores[i].Id == idproductor) {
                    $(".titProductor").html(aryProductores[i].cDescClieProv);
                    break;
                }
            }

            switch (tipo) {
                case 8:
                    $(".titActividad").html("NRO. DE PARIHUELAS");
                    $(".titCondicion").html("CANTIDAD");
                    $(".titCamion").html(idx);
                    break;
            }
            $("#camionnumero").html(idx);
            $('#ph').modal('show');
        }


        function FnRecepciontiempodetalleCampofechaseleccionado(id, tipo, idx, idproductor) {
            Recepciontiempodetalle_id = id;
            Recepciontiempodetalle_tipo = tipo;
            for (var i = 0; i < aryProductores.length; i++) {
                if (aryProductores[i].Id == idproductor) {
                    $(".titProductor").html(aryProductores[i].cDescClieProv);
                    break;
                }
            }
            switch (tipo) {
                case 9:
                    $(".titActividad").html("DESCARGA DE CAMIÓN");
                    $(".titCondicion").html("INICIA");
                    $(".titCamion").html(idx);
                    break;
                case 10:
                    $(".titActividad").html("DESCARGA DE CAMIÓN");
                    $(".titCondicion").html("FINALIZA");
                    $(".titCamion").html(idx);
                    break;
                case 11:
                    $(".titActividad").html("PESADO Y ETIQUETADO");
                    $(".titCondicion").html("INICIA");
                    $(".titCamion").html(idx);
                    break;
                case 12:
                    $(".titActividad").html("PESADO Y ETIQUETADO");
                    $(".titCondicion").html("FINALIZA");
                    $(".titCamion").html(idx);
                    break;
                case 13:
                    $(".titActividad").html("GASIFICADO");
                    $(".titCondicion").html("INICIA");
                    $(".titCamion").html(idx);
                    break;
                case 14:
                    $(".titActividad").html("GASIFICADO");
                    $(".titCondicion").html("FINALIZA");
                    $(".titCamion").html(idx);
                    break;
                case 15:
                    $(".titActividad").html("CARGAJABAS");
                    $(".titCondicion").html("INICIA");
                    $(".titCamion").html(idx);
                    break;
                case 16:
                    $(".titActividad").html("CARGAJABAS");
                    $(".titCondicion").html("FINALIZA");
                    $(".titCamion").html(idx);
                    break;
            }
            $("#camionnumero").html(idx);
            $('#fh').modal('show');
        }

        function FnRecepciontiempodetalleBloquear(id, tipo, idx) {
            Recepciontiempodetalle_id = id;
            Recepciontiempodetalle_tipo = tipo;
            FnModificarCampo(17);
        }

        function FnModificarCampo(tipocampo) {
            var valor = "";
            if (tipocampo == 1) { //Campo numérico
                valor = $("#camponumerico").val();
            } else if (tipocampo == 2) { //Campo cadena / fecha
                var date = new Date(new Date().getTime());
                var hour = date.getHours();
                var min = date.getMinutes();
                var sec = date.getSeconds();
                valor = moment().format('YYYY-MM-DD') + " " + FnCompletarceros(hour) + ":" + FnCompletarceros(min) + ":" + FnCompletarceros(sec) + "." + date.getMilliseconds();
            } else if (tipocampo == 3) { //Asignar vacío a fecha
                valor = '1990-01-01 00:00:00.000';
            } else if (tipocampo == 4) { //Asignar bloqueo
                valor = 0;
            }

            var obj = new Object();
            obj.nIdRecepciontiempodetalle = Recepciontiempodetalle_id;
            obj.nTipo = Recepciontiempodetalle_tipo;

            switch (obj.nTipo) {
                case 8:
                    obj.nParihuelas = valor;
                    break;
                case 9:
                    obj.dIniDescarga = valor;
                    break;
                case 10:
                    obj.dFinDescarga = valor;
                    break;
                case 11:
                    obj.dIniPesadoetiquetado = valor;
                    break;
                case 12:
                    obj.dFinPesadoetiquetado = valor;
                    break;
                case 13:
                    obj.dIniCamaragasificado = valor;
                    break;
                case 14:
                    obj.dFinCamaragasificado = valor;
                    break;
                case 15:
                    obj.dIniCargajabas = valor;
                    break;
                case 16:
                    obj.dFinCargajabas = valor;
                    break;
                case 17:
                    if (valor == "1") {
                        valor = true;
                    } else {
                        valor = false;
                    }

                    obj.bEstado = valor;
                    break;
            }

            $.ajax({
                async: false,
                type: 'POST',
                url: "SerApp.asmx/RecepciontiempodetalleActualizarCampoHora",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    console.log("actualización");
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });

            FnCamionesPorProductor();
        }

        var aryProductores = null;
        FnHoraactual(); /* calling FnHoraactual() function to initiate the process */
        FnCargarProductores();
        FnRecepciontiempoListado();


        function FnCargarProductores() {
            $.ajax({
                async: false,
                type: 'POST',
                url: "SerApp.asmx/ClientesYProductoresList",
                data: JSON.stringify({ obj: '' }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var datos = JSON.parse(data['d']);
                    var $cboProductores = $("#cboproductores");
                    $.each(datos, function () {
                        $cboProductores.append($("<option />").val(this.nIdentClieProv).text(this.cDescClieProv));
                    });
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        }



        $('#cboproductores').on('select2:select', function (e) {
            var data = e.params.data;
            productorseleccionado_id = data.id
        });

        $('#btnProductoresinsertar').on('select2:select', function (e) {
            FnRecepciontiempoProductorInsert();
        });

    </script>
</body>
</html>

