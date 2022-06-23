<%@ Page Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ConFrio.aspx.cs" Inherits="SFC_WEB_APP.Mod_Frio.Wfo_ConFrio" %>

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
    
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">

    <div class="container text-center"> 
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h5>Consolidado por Cámaras</h5>
                        <img src="../Img/loading.gif" style="width:4%" class="img-responsive" /> &nbsp;
                        <label id="segundos_query"></label>
                    </div>
                </div>
                
            </div>
        </div>
    </div>

    <div class="container" id="mostrar_contenedor">
        <div class="row">
            <div class="col-sm-9">
                <div class="card">
                    <div class="card-header table-responsive" id="card_table" style="height:400px">

                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card">
                    <div class="card-header text-center">
                        <h5>% DE CÁMARAS OCUPADAS</h5>                       
                    </div>
                    <div class="card-body text-center">
                        <canvas id="cvs" width="100" height="300"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="container mt-4">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h3>Stock de paletas por productor</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-1">
                                <p>Fecha: </p>
                            </div>
                            <div class="col-sm-4">
                                <input type="date" readonly="true" style="cursor:pointer" class="form-control" name="txtfecha_" id="txtfecha_" autocomplete="off" />
                            </div>
                            <div class="col-sm-4">
                                <button type="button" class="btn btn-success" id="btnMostrarStock" name="btnMostrarStock">Mostrar Stock</button>
                            </div>
                        </div>       
                    </div>
                </div>
            </div>
            <div class="col-sm-12 mb-4" id="tbl_display" style="display:none">
                <table id="tabla_" class="table table-sm table-bordered" style="width:0%">
                    <thead style="background:#404E67" class="text-white">
                        <tr>
                            <th>Productor</th>
                            <th style='text-align:center'>Total Paleta</th>
                        </tr>
                    </thead>   
                    <tbody id="tb_x" style="background:white">

                    </tbody>
                </table>
                <button type="button" class="btn btn-info mt-2" name="btnexcel_stock" id="btnexcel_stock">Generar Excel</button>
            </div>
        </div>
    </div>

    
    <script src="../Content/RGraph.common.core.js"></script>
    <script src="../Content/RGraph.common.effects.js"></script>
    <script src="../Content/RGraph.thermometer.js"></script>
    <script src="../Content/RGraph.drawing.yaxis.js"></script>
    <script src="../Content/RGraph.bar.js"></script>
    <script src="../Content/RGraph.common.dynamic.js"></script>


    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="//cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.1.0/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>

    <script>

        $("document").ready(function () {
            
            var fechanow = new Date();
            var setfechaactual = fechanow.getFullYear() + "-" + fechanow.getMonth().toString() + 1+"-"+ fechanow.getDate();
            //dia
            //alert(setfechaactual);
            $("#txtfecha_").val(setfechaactual);
            F_Angel();

            Mostrar(true);

            var contar_segundos = 0;

            setInterval(function () {
              
                contar_segundos++;
                
                if (contar_segundos == 60) {
                    contar_segundos = 0;
                    F_Angel(); 
                }
                $("#segundos_query").text("Se actualizará en " + contar_segundos + " segundos.");
            }, 1000);
        });

        var t_posiciones = 0;
        var p_ocupadas = 0;
        var p_inhabilitadas = 0;
        var regla_tres = 0;

        $("#btnGenerar").on("click", function () {
            F_Angel();
        });


        function F_Angel() {
            $("#card_table").html('');
            Mostrar(true);
            var empresa_ = "001";
            var camara_ = ["C01", "C02", "C03", "C04"];

            var objeto = {
                objZonificacion: {
                    empresa: empresa_,
                    camara: "C01",
                    rack: "",
                    piso: "",
                    fila: "",
                    columna: ""
                }
            }

            $.ajax({
                type: "post",
                data: JSON.stringify(objeto),
                url: "../SerFrio.asmx/MostrarDataTable_Reporte",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    tmp = JSON.parse(r.d);
                    Mostrar(false);
                    
                    var tabla = '';
                    var span = '';

                    tabla = "<table class='table table-bordered text-center' style='font-size:15px;margin-top:20px'>";
                    tabla += "<thead style='background:#404E67;color:white;'>";
                    tabla += "<tr><th>CAMARA</th><th>POSICIONES LIBRES</th><th>POSICIONES OCUPADAS</th><th>POSICIONES INHABILITADAS</th><th>PORCENTAJE OCUPADO</th><th>TOTAL POSICIONES</th></tr>";
                    tabla += "</thead>";
                    tabla += "<tbody>";
                    for (var i = 0; i < tmp.df.length; i++) {
                        var div = (tmp.df[i].posiciones_ocupadas * 100) / tmp.df[i].total_posiciones;

                        if (div < 50) {
                            span = '<div id="circulo" style="height:20px;width:20px;background:green;-moz-border-radius:20px;-webkit-border-radius:20px;border-radius:20px;"></div>';
                        } else if (div > 50 && div < 75) {
                            span = '<div id="circulo" style="height:20px;width:20px;background:orange;-moz-border-radius:20px;-webkit-border-radius:20px;border-radius:20px;"></div>';
                        } else {
                            span = '<div id="circulo" style="height:20px;width:20px;background:red;-moz-border-radius:20px;-webkit-border-radius:20px;border-radius:20px;"></div>';
                        }

                        if (tmp.df.length - 1 == i) {
                            t_posiciones = tmp.df[i].total_posiciones;
                            p_ocupadas = tmp.df[i].posiciones_ocupadas; 
                            p_inhabilitadas = tmp.df[i].posiciones_inabilitadas;
                            tabla += "<tr><td style='font-weight:bold;background:#ededed;'>" + tmp.df[i].camara_tmp + "</td><td style = 'background:#ededed'>" + tmp.df[i].posiciones_libres + "</td><td style = 'background:#ededed'>" + tmp.df[i].posiciones_ocupadas + "</td><td style = 'background:#ededed'>" + tmp.df[i].posiciones_inabilitadas + "</td><td style = 'background:#ededed'><div class='row'><div class='col-sm-8'>" + div.toFixed(2) + " %" + "</div><div class='col-sm-4'>" + span + "</div></div>" + "</td><td style = 'background:#ededed'>" + tmp.df[i].total_posiciones + "</td></tr>";
                        } else {
                            tabla += "<tr><td style='font-weight:bold;'>" + tmp.df[i].camara_tmp + "</td><td>" + tmp.df[i].posiciones_libres + "</td><td>" + tmp.df[i].posiciones_ocupadas + "</td><td>" + tmp.df[i].posiciones_inabilitadas + "</td><td><div class='row'><div class='col-sm-8'>" + div.toFixed(2) + " %" + "</div><div class='col-sm-4'>" + span + "</div></td><td>" + tmp.df[i].total_posiciones + "</td></tr>";
                        }
                    }
                    tabla += "</tbody>";
                    tabla += "</table>";

                    $("#card_table").append(tabla);

                    //console.log(t_posiciones);
                    //console.log(p_ocupadas);

                    regla_tres = parseFloat((p_ocupadas * 100) / t_posiciones);
                    //console.log(regla_tres);

                    //console.log(regla_tres);

                    draw(regla_tres, t_posiciones);
                }
            });
        }

        function Mostrar(bool) {
            $("#mostrar_contenedor").attr("hidden", bool);
        }

        function draw(numero,MAX) {
            //var value = RGraph.random(0, 100)
            var aux = 0;
            aux = numero;
            //console.log(aux);
            var colors = ''

            if (parseFloat(numero) < 50) {
                    colors = 'green';
            } else if (parseFloat(numero) > 50 && parseFloat(numero) < 75) {
                    colors = 'orange';
            } else {
                    colors = 'red';
            }

            
                
                thermometer = new RGraph.Thermometer({
                    id: 'cvs',
                    min: 0,
                    max: 100,
                    value: aux,
                    options: {
                        textSize: '14',
                        colors: [colors],
                        scaleDecimals: 2,
                        colorsStroke:'red',
                        //scaleVisible: true,
                        //textAccessible: true, 
                        marginLeft: 25,
                        marginRight: 25,
                        marginTop: 10,
                        marginBottom: 10,
                    }
                }).grow();

                coords = thermometer.coords;

                yaxis = new RGraph.Drawing.YAxis({
                    id: 'cvs',
                    x: coords[0][0],
                    options: {
                        marginTop: thermometer.bulbTopCentery,
                        marginBottom: thermometer.canvas.height - (coords[0][1] + coords[0][3]),
                        yaxis: true,
                        textColor: 'blue',
                        yaxisScaleMax: 100,
                        yaxisScaleMin: 0    
                    }
                }).draw();


        }

        $("#btnMostrarStock").on("click", function () {

            var fecha = $("#txtfecha_").val();

            $("#tbl_display").css('display', 'none');

            if (fecha == "") {
                swal.fire({
                    title: "Ingresar Fecha",
                    text: "",
                    icon: "error",
                    timer: 1500
                });
            } else {
                $.ajax({
                    type: "post",
                    data: JSON.stringify({ "fecha": fecha }),
                    url: "../SerFrio.asmx/MostrarStock",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    beforeSend: function () {
                        swal.fire({
                            title: "Procesando...",
                            text: "",
                            imageUrl: '../Img/loading.gif',
                            showConfirmButton: false,
                            timerProgressBar: true,
                            showClass: {
                                popup: 'animate__animated animate__fadeInDown'
                            },
                            hideClass: {
                                popup: 'animate__animated animate__fadeOutUp'
                            }
                        });
                    }, success: function (r) {
                        //console.log(r.d);
                        swal.close();
                        $("#tbl_display").fadeIn('slow', 'swing');
                        reset();
                        Animar();
                        var parse = JSON.parse(r.d);
                        var suma = 0;
                        for (var i = 0; i < parse.length; i++) {
                            $("#tb_x").append("<tr><td>" + parse[i].cliente + "</td><td style='text-align:center'>" + parse[i].paleta + "</td></tr>");
                            suma = suma + parseInt(parse[i].paleta);
                        }
                        $("#tb_x").append("<tr style='background:#ededed'><td>Total: </td><td style='text-align:center'>" + suma + "</td></tr>");
                        destroy();
                    }
                });

            }
        });

        function destroy() {
            /*$("#tabla_").DataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
                },
                autoFill: true,
                responsive: true,
                dom: "Bfrtip",
                buttons: {
                    dom: {
                        button: {
                            className: 'btn'
                        }
                    },
                    buttons: [
                        {
                            extend: "excel",
                            text: "Exportar Excel",
                            className: "btn btn-success",
                            excelstyles: {
                                template: 'header_blue'
                            }
                        }
                    ]
                }
            });*/
        }

        function reset() {
            $("#tabla_").css('width', '0%');
            //$("#tabla_").DataTable().destroy();
            $("#tb_x").html('');
            
        }

        function Animar() {
            $("#tabla_").animate({ width: '100%' }, 'slow');
        }

        $("#btnexcel_stock").on("click", function () {
            window.open('data:application/vnd.ms-excel,' + encodeURIComponent($('#tbl_display').html()));
            e.preventDefault();
        });



           

    </script>
        
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">

</asp:Content>
