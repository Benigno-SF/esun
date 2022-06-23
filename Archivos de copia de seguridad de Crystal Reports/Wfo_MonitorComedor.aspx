<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_MonitorComedor.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_MonitorComedor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="../assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>COMEDOR | SUNFRUITS</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--  css     -->
    <%: Styles.Render("~/Content/css") %>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

    <!-- js -->
    <%: Scripts.Render("~/jquery") %>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
    <style>
        .body {
            background-color: #0e0c07;
            height: 100vh
        }
    </style>
</head>

<body class="body">




    <div class="container-fluid text-white mt-5">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <img src="../img/e-sun_logo_l.png" style="vertical-align: auto; margin: auto; padding: initial" />
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="card card-stats bg-dark">
                    <div class="card-header card-header-warning card-header-icon  m-3">
                        <div class="card-icon">
                            <i class="fas fa-utensils"></i>
                        </div>
                        <h3 class="card-title" style="font-size: 37px; font-weight: bold; margin: 0px">
                            <marquee style="color: white"><b>MENU : </b><span id="txtMenu">&nbsp;</span></marquee>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="card card-stats bg-dark">
                    <div class="card-header card-header-success card-header-icon  m-3">
                        <div class="card-icon">
                            <i class="fas fa-utensil-spoon"></i>
                        </div>
                        <h3 class="card-title" style="font-size: 37px; font-weight: bold; margin: 0px">
                            <marquee style="color: white"><b>DIETA : </b><span id="txtDieta">&nbsp;</span></marquee>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="card card-stats bg-dark">
                    <div class="card-header card-header-info card-header-icon mt-3 mb-3">
                        <div class="card-icon">
                            <i class="fas fa-clock"></i>
                        </div>
                        <h3 class="card-title  text-center" style="font-size: 40px; font-weight: bold; margin: 0px"><span id="horas" class="horas"></span>
                            <span>:</span>
                            <span id="minutos" class="minutos"></span>
                            <span>:</span>
                            <span id="segundos" class="segundos"></span>
                            <span id="ampm" class="ampm"></span></h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">

            <div class="col-lg-6 col-md-12">
                <div class="card bg-dark">
                    <div class="card-header card-header-tabs card-header-primary  mt-3">
                        <h3 class="card-title" style="font-weight: bold;">VIDEOS</h3>
                    </div>
                    <div class="card-body mb-5">
                        <iframe width="100%" src="" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="min-height: 33vh "></iframe>
       <%--                  <label style="color:#000;" id="info"></label>
    <video id="reproductor" width='100%' controls="control" autoplay="">https://www.youtube.com/embed/wi-oG3nnPdI?autoplay=0&loop=1&rel=0

</video> --%>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-12">
                <div class="card  bg-dark">
                    <div class="card-header card-header-warning  mt-3">
                        <h3 class="card-title" style="font-weight: bold;">HORARIO COMEDOR</h3>
                    </div>
                    <div class="card-body table-responsive">
                        <table id="tablexx" class="table table-dark mb-5" style="font-size: 30px; font-weight: bold; min-height: 33vh">
                            <thead class="text-warning">
                                <tr>
                                    <th><b>Linea&nbsp;&nbsp;&nbsp;&nbsp;</b></th>
                                    <th><b>Inicio&nbsp;&nbsp;&nbsp;&nbsp;</b></th>
                                    <th><b>Final&nbsp;&nbsp;&nbsp;&nbsp;</b></th>
                                    <th><b>&nbsp;&nbsp;&nbsp;&nbsp;Restante&nbsp;&nbsp;&nbsp;&nbsp;</b></th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card card-stats bg-dark">
                    <div class="card-header card-header-danger card-header-icon  m-3">
                        <div class="card-icon">
                             <i class="fas fa-sms"></i>
                        </div>
                        <h3 class="card-title" style="font-size: 37px; font-weight: bold; margin: 0px">
                            <marquee style="color: white"><span id="txtMensaje">BIENVENIDO A SUNFRUITS</span></marquee>
                        </h3>
                    </div>
                </div>
            </div>
        </div>


        <footer class="footer">
            <div class="container-fluid">

                <div class="copyright float-right" style="font-size: 20px">
                    <b>&copy;
            <script>
                document.write(new Date().getFullYear())
            </script>
                        ,
             Area TI </b>
                    <img src="../img/ti.png" height="40" />
                </div>
            </div>
        </footer>
    </div>

    <script>
        var obj = new Object();
        obj.vnIdEmpresa = 1;
        obj.vnIdEventoProg = 0;

        var cargatablaxx = function () {
            $.ajax({
                type: 'POST',
                url: "SerApp.asmx/EventoProgDetalleList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                error: function () {
                    $('#activos').hide();
                },
                success: function (datax) {
                    var lst = JSON.parse(datax.d);

                    sonar(lst);

                    $('#tablexx').DataTable({
                        paging: false,
                        destroy: true,
                        searching: false,
                        info: false,
                        data: lst,
                        columns: [
                            { data: 'cDescAGrupo' },
                            { data: 'Hinicio' },
                            { data: 'Hfin' },
                            {
                                data: 'Falta',
                                render: function (Falta) {
                                    if (Falta == "0 Segundos") {
                                        return '<B style="color: red" class="parpadea text">CULMINO<B>';
                                    } else {
                                        return Falta;
                                    }

                                }
                            },
                        ],
                        language: {
                            "sEmptyTable": "<center>EL COMEDOR SE ENCUENTRA LIBRE POR EL MOMENTO</center>",
                        }
                    });
                }
            });
        };
        var intervalo = setInterval(cargatablaxx, 1000);
        
        function sonar(lst) {
            for (var x = 0; x < lst.length; x++) {
                if (lst[x].Falta == "1 Segundos") {
                    var audio = new Audio("../sounds/sonido_almuerzo.ogg");
                    audio.play();
                }
            }
        }
        $(function () {
            var actualizarHora = function () {
                var fecha = new Date(),
                    hora = fecha.getHours(),
                    minutos = fecha.getMinutes(),
                    segundos = fecha.getSeconds(),
                    diaSemana = fecha.getDay(),
                    dia = fecha.getDate(),
                    mes = fecha.getMonth(),
                    anio = fecha.getFullYear(),
                    ampm;

                var $pHoras = $("#horas"),
                    $pSegundos = $("#segundos"),
                    $pMinutos = $("#minutos"),
                    $pAMPM = $("#ampm"),
                    $pDiaSemana = $("#diaSemana"),
                    $pDia = $("#dia"),
                    $pMes = $("#mes"),
                    $pAnio = $("#anio");
                var semana = ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'];
                var meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];

                $pDiaSemana.text(semana[diaSemana]);
                $pDia.text(dia);
                $pMes.text(meses[mes]);
                $pAnio.text(anio);
                if (hora >= 12) {
                    hora = hora - 12;
                    ampm = "PM";
                } else {
                    ampm = "AM";
                }
                if (hora == 0) {
                    hora = 12;
                }
                if (hora < 10) {
                    $pHoras.text("0" + hora)
                } else {
                    $pHoras.text(hora)
                }
                ;
                if (minutos < 10) {
                    $pMinutos.text("0" + minutos)
                } else {
                    $pMinutos.text(minutos)
                }
                ;
                if (segundos < 10) {
                    $pSegundos.text("0" + segundos)
                } else {
                    $pSegundos.text(segundos)
                }
                ;
                $pAMPM.text(ampm);
            };
            actualizarHora();
            var intervalo2 = setInterval(actualizarHora, 1000);
        });
        
        var obj = new Object();
        obj.vnIdEmpresa = 0;
        obj.vnIdEventoProg = 0;
        obj.vcFecha = "";

        function cargadetalles() {
            $.ajax({
                type: 'POST',
                url: "SerApp.asmx/EventoProgList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                error: function () {
                    $('#activo2s').hide();
                },
                success: function (datax) {
                    var lst = JSON.parse(datax.d);
                    $('#txtDieta').text(lst[0].cDieta);
                    $('#txtMenu').text(lst[0].cMenu);
                    $('#txtMensaje').text(lst[0].cMensaje);
                }
            });
        }
        cargadetalles();
        var intervalo3 = setInterval(cargadetalles, 1000);
        ///
        var elem = document.documentElement;

        /* View in fullscreen */
        function openFullscreen() {
            if (elem.requestFullscreen) {
                elem.requestFullscreen();
            } else if (elem.mozRequestFullScreen) { /* Firefox */
                elem.mozRequestFullScreen();
            } else if (elem.webkitRequestFullscreen) { /* Chrome, Safari and Opera */
                elem.webkitRequestFullscreen();
            } else if (elem.msRequestFullscreen) { /* IE/Edge */
                elem.msRequestFullscreen();
            }
        }
        $(document).ready(function () {
            openFullscreen()
        });
    </script>

</body>
</html>

