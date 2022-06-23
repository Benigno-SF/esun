<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_KdxPaleta.aspx.cs" Inherits="SFC_WEB_APP.Mod_TI.Wfo_KdxPaleta" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.css" rel="stylesheet"/>



    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.light.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.2.4/css/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.2.4/css/dx.light.css" />

    <link href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/buttons/2.1.0/css/buttons.dataTables.min.css" rel="stylesheet" />

    <script src="https://cdn.amcharts.com/lib/4/core.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
  
    <style>
        /*Flecha para hacer la pagina hacia arriba*/
        .ir-arriba{
          display:none;
          background-repeat:no-repeat;
          font-size:20px;
          color:black;
          cursor:pointer;
          position:fixed;
          bottom:10px;
          right:10px;
          z-index:2;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">


    <!-- INICIO BOTON HACIA ARRIBA -->
    <a class="ir-arriba" style="margin-bottom:40px" title="Volver arriba">
      <span class="fa-stack">
        <i class="fa fa-circle fa-stack-2x"></i>
        <i class="fa fa-arrow-up fa-stack-1x fa-inverse"></i>
      </span>
    </a>
    <!--FIN BOTON HACIA ARRIBA-->

    <div class="container">
        <div class="row">
            <div class="col-sm-12 py-2 text-white text-center" style="background:#404E67">
                <h4>Kardex de paletas (Movimientos).</h4>
            </div>
        </div>
    </div>
    <div class="container mt-2">
        <div class="row">
            <div class="col-sm-2 mt-2">
                Nro de Paleta
            </div>
            <div class="col-sm-4">
                <input type="text" id="txtpaleta" name="txtpaleta" class="form-control" autocomplete="off" placeholder="Numero de Paleta" />
            </div>
            <div class="col-sm-4">
                <button type="button" class="btn btn-success" id="btnbuscarkardex" name="btnbuscarkardex">Buscar Movimientos</button>
            </div>
        </div>
    </div>



    <!--TABLA MOVUBICACION-->
    <!--<div class="container mt-2" style="display:none" id="contenedor_uno">
        <div class="row">
            <div class="col-sm-12">
                <div style="background:white" class="text-center py-1">
                    <h5>Tabla MovUbicación</h5>
                </div> 
                <table class="table table-sm table-bordered text-center table-responsive" id="tb_uno"  style="width:0%">
                    <thead style="background:#404E67" class="text-white">
                        <tr>
                            <th>ID</th>
                            <th>NUMERO DE PALETA</th>
                            <th>UBICACION</th>
                            <th>UBICACION PALETA</th>
                            <th>FECHA DE REGISTRO</th>
                            <th>MOVIMIENTO</th>
                            <th>FACTOR</th>
                            <th>STOCK</th>
                        </tr>
                    </thead>
                    <tbody id="body_mov" style="background:white">

                    </tbody>
                </table>
            </div>
        </div>
    </div>-->
    <!--FIN TABLA MOVUBICACION-->


    <!--TABLA MOVUBICACIONPALETA-->
    <div class="container mt-2" style="display:none" id="contenedor_dos">
        <div class="row">
            <div class="col-sm-12">
                <div style="background:white" class="text-center py-1">
                    <h5>Movimientos de paletas</h5>
                </div> 
                <table class="table table-sm table-bordered text-center table-responsive" id="tb_dos" style="width:0%">
                    <thead style="background:#404E67" class="text-white">
                        <tr>
                            <th>ID</th>
                            <th>NUMERO DE PALETA</th>
                            <th>UBICACION</th>
                            <th>UBICACION PALETA</th>
                            <th>FECHA DE REGISTRO</th>
                            <th>MOVIMIENTO</th>
                            <th>FACTOR</th>
                            <th>STOCK</th>
                        </tr>
                    </thead>
                    <tbody id="body_mov_paleta" style="background:white">

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!--FIN TABLA MOVUBICACIONPALETA-->


    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        $("document").ready(function () {
            $("#txtpaleta").focus();
            irArriba();
        });


        function irArriba() {
            $('.ir-arriba').click(function () {
                $('body,html').animate({ scrollTop: '0px' }, 100);
            });
            $(window).scroll(function () {
                if ($(this).scrollTop() > 0) {
                    $('.ir-arriba').slideDown(100);
                } else {
                    $('.ir-arriba').slideUp(100);
                }
            });
            $('.ir-abajo').click(function () {
                $('body,html').animate({ scrollTop: '1000px' }, 100);
            });
        }

        $("#btnbuscarkardex").on("click", function () {

            Limpiar();
            displaynone();

            var paleta = $.trim($("#txtpaleta").val());


            if (paleta == "") {
                swal.fire({
                    title: "Ingresar numero de paleta",
                    text: "",
                    icon:"error",
                    showConfirmButton: false,
                    timerProgressBar: true,
                    timer: 1000,
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    }
                });
            } else {
                $.ajax({
                    type: "post",
                    data: JSON.stringify({ "paleta": paleta }),
                    url: "../SerTI.asmx/ConsultarPaleta",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    beforeSend: function () {
                        swal.fire({
                            title: "Procesando...",
                            text: "",
                            imageUrl: '../Img/loading.gif',
                            showConfirmButton: false,
                            timerProgressBar: true,
                            timer: 300,
                            showClass: {
                                popup: 'animate__animated animate__fadeInDown'
                            },
                            hideClass: {
                                popup: 'animate__animated animate__fadeOutUp'
                            }
                        });
                    }, success: function (r) {
                        FadeIN();
                        var parsear = JSON.parse(r.d);
                        for (var i = 0; i < parsear.a.length; i++) {
                            $("#body_mov").append("<tr><td>" + parsear.a[i].ID + "</td><td>" + parsear.a[i].NROPALETA + "</td><td>" + parsear.a[i].UBICACION + "</td><td>" + parsear.a[i].UBICACION_PALETA + "</td><td>" + parsear.a[i].FECHA + "</td><td>" + parsear.a[i].MOVIMIENTO + "</td><td>" + parsear.a[i].FACTOR + "</td><td>" + parsear.a[i].STOCK + "</td></tr>");
                        }
                        for (var i = 0; i < parsear.b.length; i++) {
                            $("#body_mov_paleta").append("<tr><td>" + parsear.b[i].ID + "</td><td>" + parsear.a[i].NROPALETA + "</td><td>" + parsear.a[i].UBICACION + "</td><td>" + parsear.a[i].UBICACION_PALETA + "</td><td>" + parsear.a[i].FECHA + "</td><td>" + parsear.a[i].MOVIMIENTO + "</td><td>" + parsear.a[i].FACTOR + "</td><td>" + parsear.a[i].STOCK + "</td></tr>");
                        }
                    }

                });
            }

            
        });

        function displaynone() {
            $("#contenedor_uno").css('display', 'none');
            $("#contenedor_dos").css('display', 'none');
        }
        function FadeIN() {
            $("#contenedor_uno").fadeIn('slow', 'swing');
            $("#tb_uno").animate({ width: '100%' }, 'slow');
            $("#tb_dos").animate({ width: '100%' }, 'slow');
            $("#contenedor_dos").fadeIn('slow', 'swing');
        }
        function Limpiar() {
            $("#body_mov").html('');
            $("#body_mov_paleta").html('');
            $("#tb_uno").css('width', '0%');
            $("#tb_dos").css('width', '0%');
        }

    </script>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>

