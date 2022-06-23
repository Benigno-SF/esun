<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_RepIPT.aspx.cs" Inherits="SFC_WEB_APP.Mod_Cali.Wfo_RepIPT" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.css" rel="stylesheet"/>

    
     <script src="../Content/DevExtreme/cldr.min.js"></script>
    <script src="../Content/DevExtreme/event.min.js"></script>
    <script src="../Content/DevExtreme/supplemental.min.js"></script>
    <script src="../Content/DevExtreme/unresolved.min.js"></script>
    <script src="../Content/DevExtreme/globalize.min.js"></script>

    <%--<script src="../Content/DevExtreme/number.min.js"></script>--%>

    <script src="../Content/DevExtreme/message.min.js"></script>
    <script src="../Content/DevExtreme/currency.min.js"></script>
    <script src="../Content/DevExtreme/date.min.js"></script>
    <script src="../Content/DevExtreme/jszip.min.js"></script>
    <script src="../Content/DevExtreme/dx.all.js"></script>
    <script src="../Content/DevExtreme/dx.messages.es.js"></script>
    <script src="../Content/DevExtreme/supplemental.js"></script>
    <script src="../Content/DevExtreme/es.js"></script>
    


   <script src="http://cdn.amcharts.com/lib/4/core.js"></script>
    <script src="http://cdn.amcharts.com/lib/4/charts.js"></script>
    <script src="http://cdn.amcharts.com/lib/4/themes/animated.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">

    <div class="container text-center card">
        <div class="row card-body">
            <div class="col-sm-12">
                <h5>REPORTE DE INSPECCIÓN Y PRODUCTO TERMINADO DE UVA DE MESA</h5>
            </div>
        </div>
    </div>
    
    <div class="container card" style="margin-top:-15px">
        <div class="row card-body">
            <div class="col-sm-4">
                <div class="input-group">
                    <span class="input-group-text">Fecha</span>
                    <input type="date" class="form-control" id="txtfecha" name="txtfecha" style="cursor:pointer" />
                </div>
            </div>
            <div class="col-sm-4">
                <div class="input-group">
                    <span class="input-group-text">Proveedor</span>
                    <select class="form-control" id="cmbproveedor" name="cmbproveedor" style="cursor:pointer">

                    </select>
                </div>   
            </div>
            <div class="col-sm-4">
                <div class="input-group">
                    <span class="input-group-text">Lote</span>
                    <select class="form-control" id="txtprovlote" name="txtprovlote" style="cursor:pointer"></select>
                </div>  
            </div>
            <div class="col-sm-4 mt-2">
                <div class="input-group">
                    <span class="input-group-text">Variedad</span>
                    <select class="form-control" id="txtvariedad" name="txtvariedad" style="cursor:pointer"></select>
                </div>  
            </div>
            <div class="col-sm-4 mt-2">
                <div class="input-group">
                    <span class="input-group-text">Formato</span>
                    <select class="form-control" id="cmbformato" name="cmbformato" style="cursor:pointer"></select>
                </div>  
            </div>
            <div class="col-sm-4 mt-2">
                <div class="input-group">
                    <span class="input-group-text">Producto</span>
                    <select class="form-control" id="cmbproducto" name="cmbproducto" style="cursor:pointer">
                        <option value="UVA">UVA</option>
                    </select>
                </div>  
            </div><div class="col-sm-4 mt-2">
                <button type="button" class="btn btn-success w-100" id="btnbuscar_cl" name="btnbuscar_cl">Buscar</button>
            </div>
        </div>
    </div>
        
    <div class="container" id="card-principal">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <div class="text-center">
                            <h5 id="titulo_reporte"></h5>
                        </div>
                        
                        <div class="table-repsonsive" id="tb_x">

                        </div>
                    </div>
                </div>      
            </div>

            <!--
            <div class="col-sm-5">
                <div class="card">
                    <div class="card-header">
                        <div class="table-responsive" id="tb_d">

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-7">
                <div class="card">
                    <div class="card-header" id="card_charts">
                        
                    </div>
                </div>
            </div>-->

        </div>
    </div>

    <div class="container" id="contenedor_dtdt">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <div class="table-responsive" id="tb_dtdt">

                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>


    <script>

        function Ocultar_Mostrar_Cards(bol) {
            $("#card-principal").attr("hidden", bol);
            $("#contenedor_dtdt").attr("hidden",bol);
        }

        $("document").ready(function () {
            //listar variedades
            $.ajax({
                data: JSON.stringify({v:""}),
                type:"post",
                url: "../SerCali.asmx/ListarVariedad_CALI",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    
                    //console.log(r);
                    var convert = JSON.parse(r.d);
                    //console.log(convert.length);
                    $("#txtvariedad").append("<option value='0' selected disabled>Seleccione Variedad</option>");
                    for (var i = 0; i < convert.length; i++) {
                        $("#txtvariedad").append("<option value='" + convert[i].IDVARIEDAD + "'>" + convert[i].DESCRIPCION + "</option>");
                    }
                }
            });

            //listar formatos
            $.ajax({
                data: JSON.stringify({ v: "" }),
                type: "post",
                url: "../SerCali.asmx/ListarFormatos_CALI",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    //console.log(r);
                    var convert = JSON.parse(r.d);
                    //console.log(convert.length);
                    $("#cmbformato").append("<option value='0' selected disabled>Seleccione Formato Calidad</option>");
                    for (var i = 0; i < convert.length; i++) {
                        $("#cmbformato").append("<option value='" + convert[i].idvariable + "'>" + convert[i].descripcion + "</option>");
                    }
                }
            });

            Ocultar_Mostrar_Cards(true);

        });

        $("#txtfecha").change(function () {
            $("#cmbproveedor").empty();
            var fecha = $("#txtfecha").val();
            $.ajax({
                type: "post",
                data: JSON.stringify({fecha_:fecha}),
                url: "../SerCali.asmx/ListarProveedor_CALI",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    //console.log(r.d);
                    var convert = JSON.parse(r.d);
                    //console.log(convert.length);
                    $("#cmbproveedor").append("<option value='0' selected disabled>Seleccione Proveedor</option>");
                    for (var i = 0; i < convert.length; i++) {
                        $("#cmbproveedor").append("<option value='" + convert[i].IDCLIEPROV + "'>" + convert[i].RAZON_SOCIAL + "</option>");
                    }
                    
                }
            });
        });
        $("#cmbproveedor").change(function () {
            $("#txtprovlote").empty();
            var prov = $("#cmbproveedor").val();
            //console.log(prov);
            $.ajax({
                type: "post",
                data: JSON.stringify({ ruc: prov }),
                url: "../SerCali.asmx/ListarLote_CALI",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (r) {
                    //console.log(r.d);
                    var convert = JSON.parse(r.d);
                    //console.log(convert);
                    $("#txtprovlote").append("<option value='0' selected disabled>Seleccione Lote</option>");
                    for (var i = 0; i < convert.length; i++) {
                        $("#txtprovlote").append("<option value='" + convert[i].DESCRIPCION + "'>" + convert[i].DESCRIPCION + "</option>");
                    }
                }
            });
        });


        $("#btnbuscar_cl").on("click", function () {

            LimpiarTables();
            Ocultar_Mostrar_Cards(true);

            var object = {
                
                Fecha: $("#txtfecha").val(),
                Ruc: $("#cmbproveedor").val(),
                Lote: $("#txtprovlote").val(),
                Variedad: $("#txtvariedad").val(),
                Formato: $("#cmbformato").val(),
                Producto: $("#cmbproducto").val()

            };

            //console.log(JSON.stringify(object.Fecha));
            
            $.ajax({
                type: "post",
                data: JSON.stringify({ ReporteCalidad: object }),
                url: "../SerCali.asmx/MostrarReporte_Cali",
                dataType: "json",
                contentType: "application/json;charset=utf-8",
                success: function (r) {
                    Ocultar_Mostrar_Cards(false);
                    
                    var convert = JSON.parse(r.d);
                    var con_detalle = JSON.parse(r.d);
                    var con_dfinal = JSON.parse(r.d);
                    var ctable = '';
                    var guias = [];

                    //console.log(convert.dc);
                    //console.log(convert.dd);
                    //console.log(con_dfinal.df);

                    //Llenamos guias detalle
                    for (var i = 0; i < convert.dd.length; i++) {
                        guias.push(convert.dd[i].Guia_de_productor);
                    }

                    //Eliminamos los duplicados
                    var guia_unica = [...new Set(guias)];
                    
                    //INFORMACIÓN CABECERA
                    $("#titulo_reporte").text($("#cmbformato option:selected").text());

                    for (var i = 0; i < convert.dc.length; i++) {

                        var xValues = [];
                        var yValues = [];
                        var barColors = [];

                        ctable = "<table class='table table-sm'><tbody>";
                        ctable += "<tr><td>FECHA: " + convert.dc[i].fecha + "</td><td>VARIEDAD: " + convert.dc[i].variedad + "</td><td>GUIA: " + convert.dc[i].Guia_de_productor +"</td></tr>";
                        ctable += "<tr><td>PRODUCTOR: " + convert.dc[i].Productor + "</td><td>LOTE: " + convert.dc[i].Lote_de_campo + "</td><td></td></tr>";
                        ctable += "</tbody></table>";
                        //$("#tb_x").append(ctable);


                        //Limpiamos variable auxiliar para llenar table
                        
                        ctable += "<div class='container'>";
                            ctable += "<div class='row'>";
                                ctable += "<div class='col-sm-4'>";
                                        //INFORMACIÓN DETALLE
                                        ctable += "<table class='table table-sm' style='font-size:10px'><tr style='color:white'><th style='background:#353ea1'>Defectos</th><th style='background:#353ea1'>Valor</th></tr><tbody>";
                                        for (var p = 0; p < con_detalle.dd.length; p++) {
                                            if (guia_unica[i] == convert.dd[p].Guia_de_productor) {

                                                xValues.push(con_detalle.dd[p].Defectos);
                                                yValues.push(con_detalle.dd[p].Valor);
                                                barColors.push("green");

                                                ctable += "<tr><td>" + con_detalle.dd[p].Defectos + "</td><td>" + con_detalle.dd[p].Valor + " %</td></tr>";

                                            }
                                
                                        }
                                        ctable += "</tbody></table>";
                                    ctable += "</div>";
                               
                                
                                ctable += "<div class='col-sm-8'>";

                        //console.log(xValues);
                        //console.log(yValues);
                        //console.log(barColors);
                                        
                                        var name = "mychart" + i;

                                        
                                        //$("#tb_x").append("<canvas id='" + name + "' style='width:100%'></canvas>");
                                        ctable += "<div>";
                                        ctable += "<canvas id='" + name + "' style='width:100%'></canvas>";
                                        ctable += "</div>";

                                        /*$("#card_charts").append("<div id='" + name + (i) + "'>");
                                        $("#card_charts").append("<canvas id='" + name + "' style='width:100%'></canvas>");
                                        $("#card_charts").append("</div>");*/

                                        

                                        //$("#tb_d").append(ctable);

                                        
                                    
                                ctable += "</div>";
                            ctable += "</div>";
                        ctable += "</div>";

                        $("#tb_x").append(ctable);

                        new Chart(name, {
                            type: "horizontalBar",
                            data: {
                                labels: xValues,
                                datasets: [{
                                    backgroundColor: barColors,
                                    data: yValues
                                }]
                            },
                            options: {
                                legend: { display: false },
                                title: {
                                    display: true,
                                    text: "Defectos %"
                                }
                            }
                        });

                        ctable = '';
                        $("#tb_x").append("<hr>");
                        
                    }



                    //INFORMACIÓN DETALLE DETALLE
                    var totaldtdt = con_dfinal.df.length;

                    //CREAMOS CABECERA THEAD DE TABLA FINAL
                    ctable = "<table class='table table-sm'><thead><tr style='color:white'>";
                    for (var i = 0; i < totaldtdt; i++) {
                        ctable += "<th style='background:#353ea1'>";
                        ctable += "DESCRIPCION " + (i + 1);
                        ctable += "</th>";
                        ctable += "<th style='background:#353ea1'>";
                        ctable += "RESULTADO " + (i + 1);
                        ctable += "</th>";
                    }
                    ctable += "</tr></thead><tbody id='tbodydtdt'></tbody></table>";
                    $("#tb_dtdt").append(ctable);

                    ctable = '';

                    for (var i = 0; i < totaldtdt; i++) {
                        $("#tbodydtdt").append("<tr>");
                            $("#tbodydtdt").append("<td>" + con_dfinal.df[i].DESCRIPCION1 + "</td>" + "<td>" + con_dfinal.df[i].RESULTADO1 + "</td>" + "<td>" + con_dfinal.df[i].DESCRIPCION2 + "</td>" + "<td>" + con_dfinal.df[i].RESULTADO2 + "</td>");
                        $("#tbodydtdt").append("</tr>");
                    }

                    ctable = '';


                }
            });


            function LimpiarTables() {
                $("#tb_x").html('');
                //$("#tb_d").html('');
                $("#tb_dtdt").html('');
            }

            
            function PassData(data) {

                /*var datax = "[";
                for (var i = 0; i < data.dd.length; i++) {
                    datax += "{state:";
                    datax += '"';
                    datax += data.dd[i].Defectos;
                    datax += '"';
                    datax += ",";
                    datax += "valor:";
                    datax += data.dd[i].Valor;
                    datax += ",";
                    datax += "}";
                    if (i == data.dd.length - 1) {
                        datax += "";
                    } else {
                        datax += ",";
                    }
                }
                datax += "]";*/

                //console.log(datax);

                

                

            }

        });

    </script>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">

</asp:Content>


