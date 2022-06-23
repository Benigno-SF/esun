<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_RepCaEst.aspx.cs" Inherits="SFC_WEB_APP.Mod_Cali.Wfo_RepCaEst" %>


<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.css" rel="stylesheet"/>

    <!--<link href="../Content/tableexport.css" rel="stylesheet" />-->
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

    <script src="../Content/DevExtreme/cldr.min.js"></script>
    <script src="../Content/DevExtreme/event.min.js"></script>
    <script src="../Content/DevExtreme/supplemental.min.js"></script>
    <script src="../Content/DevExtreme/unresolved.min.js"></script>
    <script src="../Content/DevExtreme/globalize.min.js"></script>
<%--    <script src="../Scripts/jspdf.min.js"></script>--%>

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
  

    <style>
        .ir-arriba {
	        display:none;
	        padding:20px;
	        background:#024959;
	        font-size:20px;
	        color:#fff;
	        cursor:pointer;
	        position: fixed;
	        bottom:40px;
	        right:20px;
            z-index:1000;
            border-radius:2000px;
        }
        #chart {
          height: 440px;
        }


        .highcharts-figure,
        .highcharts-data-table table {
          min-width: 310px;
          max-width: 800px;
          margin: 1em auto;
        }

        #container {
          height: 400px;
        }

        .highcharts-data-table table {
          font-family: Verdana, sans-serif;
          border-collapse: collapse;
          border: 1px solid #ebebeb;
          margin: 10px auto;
          text-align: center;
          width: 100%;
          max-width: 500px;
        }

        .highcharts-data-table caption {
          padding: 1em 0;
          font-size: 1.2em;
          color: #555;
        }

        .highcharts-data-table th {
          font-weight: 600;
          padding: 0.5em;
        }

        .highcharts-data-table td,
        .highcharts-data-table th,
        .highcharts-data-table caption {
          padding: 0.5em;
        }

        .highcharts-data-table thead tr,
        .highcharts-data-table tr:nth-child(even) {
          background: #f8f8f8;
        }

        .highcharts-data-table tr:hover {
          background: #f1f7ff;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">

    <span class="ir-arriba"><i class="fas fa-arrow-up"></i></span>
    
    

    <div class="container text-center card">
        <div class="row card-body">
            <div class="col-sm-12">
                <h5>REPORTE CALIDAD</h5>
            </div>
        </div>
    </div>
    
    <div class="container card" style="margin-top:-15px">
        <div class="row card-body">
            <div class="col-sm-4">
                <div class="input-group">
                    <span class="input-group-text">Producto</span>
                    <select class="form-control" id="cmbproducto" name="cmbproducto" style="cursor:pointer">
                    </select>
                </div>  
            </div>
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
            <div class="col-sm-4  mt-2">
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
                <button type="button" class="btn btn-success w-100" id="btnbuscar_cl" name="btnbuscar_cl">Buscar</button>
            </div>
            <div class="col-sm-4 mt-2">
                <button type="button" class="btn btn-warning w-100" id="btnconsultabd_cl" name="btnconsultabd_cl">Consultar     <img src="../Img/lupx.gif" class="img-fluid" style="width:25px" /></button>
            </div>
        </div>
    </div>

    <div id="BODY">
    <div class="container" id="card-principal" style="">
        <div class="row" id="exportar_excel_cal" name="exportar_excel_cal">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <div class="text-center">
                            <h5 id="titulo_reporte"></h5>
                        </div>
                        
                        <div class="table-repsonsive"  id="tb_x" name="tb_x">

                        </div>
                    </div>
                </div>      
            </div>
        </div>
    </div>

    <div id="defectos_res" style="margin-bottom:-15px;">

    </div>

    <div class="container mb-3 mt-2" id="div_respaldo_fotografico" style="margin-top:-15px;">   
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h5>1.1.- Respaldo Fotográfico en Recepción</h5>
                    </div>
                    <div class="card-body" style="margin-bottom:-20px">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="text-center">
                                            
                                        </div>  
                                        <input type="file" class="txtfoto1 form-control" accept="image/png, image/jpeg" name="txtfoto1" id="txtfoto1" />  
                                        <input type="text" class="form-control" name="txtfoto1_base64" id="txtfoto1_base64" hidden/>
                                    </div>
                                    <div class="card-body text-center" id="foto1-div">

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="text-center">
                                            
                                        </div>                  
                                        <input type="file" class="txtfoto2 form-control" name="txtfoto2" id="txtfoto2" />     
                                        <input type="text" class="form-control" name="txtfoto2_base64" id="txtfoto2_base64" hidden/>
                                    </div>
                                    <div class="card-body text-center" id="foto2-div">

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="text-center">
                                            
                                        </div>  
                                        <input type="file" class="txtfoto3 form-control" name="txtfoto3" id="txtfoto3" />    
                                        <input type="text" class="form-control" name="txtfoto3_base64" id="txtfoto3_base64" hidden/>
                                    </div>
                                    <div class="card-body text-center" id="foto3-div">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>  
            </div>
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
   
    <div class="container" id="div_t_llegada" style="break-after: page;">
        <div class="row">
            <div class="col-sm-12">
                <div class="card" style="break-after: page;">
                    <div class="card-header">
                        <h5>1.2.- Horario de llegada de camiones y temperatura</h5>
                    </div>
                    <div class="card-body">
                        <figure class="highcharts-figure">
                          <div id="container"></div>
                        </figure>
                    </div>
                    <div class="container mb-3">
                        <div class="row">
                            <div class="col-sm-3">
                                <textarea style="text-align:justify;height:100%" id="txtarea_editable" name="txtarea_editable" rows="7" class="form-control"></textarea>
                            </div>
                            <div class="col-sm-9">
                                <figure class="highcharts-figure">
                                    <div id="container_bar"></div>
                                    <div class="container text-center">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <p class="highcharts-description">
                                                        <span class="badge" style="background:yellow;color:black"><23°C</span>
                                                        <span class="badge" style="background:green;color:white">23,1°C/27,0°C</span>
                                                        <span class="badge" style="background:green;color:white">>27°C</span>
                                                    </p>
                                                </div>
                                            </div>
                                    </div>
                                </figure>
                            </div>
                        </div>
                    </div>      
                </div>
            </div>
        </div>
    </div>
   

    <div class="container" id="div_promedio" style="margin-top:-10px;">
        <div class="row">
            <div class="col-sm-12">
                <div class="card" >
                    <div class="card-header"> 
                        <h5>1.3.- Peso promedio de jabas</h5>
                    </div>
                    <div class="card-body">
                        <figure class="highcharts-figure">
                          <div id="container_promedio"></div>
                        </figure>
                        <div class="mt-1 mb-3">
                            <textarea style="text-align:center;height:100%;width:100%;" id="txtpromedio_editable" name="txtpromedio_editable" rows="3" class="form-control"></textarea>
                        </div>           
                    </div>
                </div>
            </div>
        </div>
    </div>

     
    <div class="container" id="div_resultado_fquimico" style="margin-top:-10px;">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h5>1.4.- Resultados de Análisis Fisico-Químico (Laboratorio)</h5>
                    </div>
                    <div class="card-body text-center">
                        <input type="file" class="txtfoto1 form-control" accept="image/png, image/jpeg" name="txtQuimico" id="txtQuimico" />  
                         <input type="text" class="form-control" name="txtfoto3_base64" id="txtQuimico_base64" hidden/>
                     <%--   <img src="../Img/rfquimico.png" class="img-fluid" alt="Análisis Fisico-Químico"/>  ------%>
                    </div>
                     <div class="card-body text-center" id="fotoQuimico-div">

                      </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container" id="div_resultado_evaluacion" style="margin-top:-10px;">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h5>2.- Resultados de la evaluacion en cajas de producto terminado.</h5>
                    </div>
                    <div class="card-body text-center" id="res_pres_figure">
                        <!--Aquí irán los resultados de todas las presentaciones.-->

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container" id="div_respaldo_foto" style="margin-top:-10px;break-after: page;">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h5>2.2.- Respaldo Fotográfico en Producto Terminado</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="card">
                                    <div class="card-header">
                                        <input type="file" class="form-control" id="txtfotor1" name="txtfotor1" />
                                    </div>
                                    <div class="card-body text-center" id="foto1-div_r1">

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="card">
                                    <div class="card-header">
                                        <input type="file" class="form-control" id="txtfotor2" name="txtfotor2" />
                                    </div>
                                    <div class="card-body text-center" id="foto1-div_r2">

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="card">
                                    <div class="card-header">
                                        <input type="file" class="form-control" id="txtfotor3" name="txtfotor3" />
                                    </div>
                                    <div class="card-body text-center" id="foto1-div_r3">

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 offset-sm-4">
                                <div class="card">
                                    <div class="card-header">
                                        <input type="file" class="form-control" id="txtfotor4" name="txtfotor4" />
                                    </div>
                                    <div class="card-body text-center" id="foto1-div_r4">

                                    </div>
                                </div>
                            </div>



                            <div class="container" id="div_firma">
                                <div class="row">
                                    <div class="col-sm-4 offset-sm-8 text-center">
                                        <div class="card">
                                            <div class="card-header">
                                                <div class="text-right">
                                                    <img src="../Img/icon.png" style="width:10%" class="img-fluid"/>
                                                </div>
                                                <img src="../Img/firma_calidad.png" style="width:20%" class="img-fluid" />
                                                <p style="font-weight:bold;">Elaborador por: Hernan Graziani Martinez</p>
                        
                        
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    

    </div>
    
    <div id="contenedor" ></div>
    
    <div class="container mb-3" id="muestra_btn_pdf">
        <div class="row">
            <div class="col-sm-6">
                <button type="button" class="btn btn-block" style="background:#3ce86a;color:white;" id="btnguardar_bus" name="btnguardar_bus">
                    <span>Guardar busqueda <i class="far fa-save"></i></span>
                </button>
            </div>
            <div class="col-sm-6">
                <button type="button" class="btn btn-dark btn-block" id="btnpdf_calidad" name="btnpdf_calidad">
                    <span class="ir-pdf">Generar PDF <i class="far fa-file-pdf"></i></span>
                </button>
            </div>
        </div>
    </div>

    <!--CHART BASIC-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <!--FIN CHART BASIC-->

    <!-- BEGIN: PageScripts/ Vendor JS -->
    <script src="../Scripts/dt/datatables.min.js"></script>
    <script src="../Scripts/dt/dataTables.buttons.min.js"></script>
    <script src="../Scripts/dt/buttons.bootstrap4.min.js"></script>
    <script src="../Scripts/dt/vfs_fonts.js"></script>
    <script src="../Scripts/dt/buttons.html5.min.js"></script>
    <!-- END: Page VScripts/endor JS-->

    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>

    <!--HIGHCHARTS-->
    <script src="../Content/highcharts.js"></script>
    <script src="../Content/accessibility.js"></script>
    <script src="../Content/export-data.js"></script>
    <script src="../Content/exporting.js"></script>
    <!--FIN HIGHCHARTS-->

    <!--SWEETALERT FOR ALERT-->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!--FIN SWEETALERT-->

    <!--LIBRERIA EXPORTAR PDF-->
    
    <script src="../Content/libpdf/printThis.js"></script>

   <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>
   <script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>-->

   <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>

    <!--FIN LIBRERIA EXPORTAR PDF-->

    <script>
        function Load_Cultivo(id) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdCultivo = id;
            $.ajax({
                type: 'POST',
                url: "../SerProd.asmx/CultivoList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    $("#cmbproducto").html('');
                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0">Seleccione Cultivo</option>';
                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].cCodigo + '">' + lst[i].cDesCultivo + '</option>';
                        }
                        $("#cmbproducto").append(option);
                        //$("#cmbproducto").val(idva);
                    } else {
                        $("#cmbproducto").html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }
        Load_Cultivo(0);
        //Button UP
        $('.ir-arriba').click(function () {
            $('body, html').animate({
                scrollTop: '0px'
            }, 300);
        });

        $("document").ready(function () {
            var date = new Date();
            var max = date.getFullYear() + "-" + date.getMonth() + 1 + "-" + date.getDate();
            
            $("#txtfecha").attr("max",max);
        });

        $(window).scroll(function () {
            if ($(this).scrollTop() > 0) {
                $('.ir-arriba').slideDown(300);
            } else {
                $('.ir-arriba').slideUp(300);
            }
        });
        //Fotos inicio
        var file = document.getElementById('txtfoto1');
        var foto_d = document.getElementById('txtfoto2');
        var foto_t = document.getElementById('txtfoto3');

        //Quimico
        var foto_quimico = document.getElementById('txtQuimico');

        //Fotos Pie de pagina
        var foto_cu = document.getElementById('txtfotor1');
        var foto_ci = document.getElementById('txtfotor2');
        var foto_se = document.getElementById('txtfotor3');
        var foto_si = document.getElementById('txtfotor4');
       

        (function () {
            'use strict'
            var srtRuta1 = "";
            var srtRuta2 = "";
            var srtRuta3 = "";
            //FOTO UNO
            file.addEventListener('change', function () {
                //$("#foto1-div").html('');

                var filex = file.files[0];
                var reader = new FileReader();

                reader.onloadend = function () {
                    $("#txtfoto1_base64").val(reader.result);
                }
                reader.readAsDataURL(filex);

                //$("#foto1-div").append('<img id="imguno" class="img-fluid" src="data:image/*;base64, " alt="uvita"  />');

                //var reader = new FileReader();

                //reader.onloadend = function () {
                //    $("#imguno").attr("src", reader.result);
                //}

                $("#foto1-div").html('');
                for (var i = 0; i < file.files.length; i++) {
                    var id = Math.floor(Math.random() * 30000) + '_' + Date.now();
                    createThum(file, i, id, "foto1-div", "txtfoto1", 1);
                }
                

                /*$.ajax({
                    type: "post",
                    data: JSON.stringify({ p: ruta, name: file.files[0].name}),
                    url: "../SerCali.asmx/CopiarArchivo",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        console.log(r.d);
                    }
                });*/

               //style="background-image: url(' + "'" + ruta + file.files[0].name + "'" + ');height:200px;width:100%"
                //Thumnail.classList.add('Thumnail', "foto_eeee");
                //Thumnail.setAttribute('id', "img" + $("#txtfoto1").val());
                //Thumnail.classList.add('img-fluid');
                //Thumnail.dataset.id = id;
               
                //Añado atributo src a mi etiqueta img
                
                //Thumnail.setAttribute('src', '' + ruta + '');
                //Thumnail.setAttribute('style', 'height:200px;width:100%');
            });

            //FOTO DOS
            foto_d.addEventListener('change', function () {

                var filex = foto_d.files[0];
                var reader = new FileReader();

                reader.onloadend = function () {
                    $("#txtfoto2_base64").val(reader.result);
                }
                reader.readAsDataURL(filex);

                $("#foto2-div").html('');
                for (var i = 0; i < foto_d.files.length; i++) {
                    var id = Math.floor(Math.random() * 30000) + '_' + Date.now();
                    createThum(foto_d, i, id, "foto2-div","txtfoto2",2);
                }
            });

            //FOTO TRES
            foto_t.addEventListener('change', function () {
                var filex = foto_t.files[0];
                var reader = new FileReader();

                reader.onloadend = function () {
                    $("#txtfoto3_base64").val(reader.result);
                }
                reader.readAsDataURL(filex);
                $("#foto3-div").html('');
                for (var i = 0; i < foto_t.files.length; i++) {
                    var id = Math.floor(Math.random() * 30000) + '_' + Date.now();
                    createThum(foto_t, i, id, "foto3-div", "txtfoto3",3);
                }
            });

            //FOTO LABORATORIO QUIMICO
            foto_quimico.addEventListener('change', function () {
                var filex = foto_quimico.files[0];
                var reader = new FileReader();

                reader.onloadend = function () {
                    $("#txtQuimico_base64").val(reader.result);
                }
                reader.readAsDataURL(filex);
                $("#fotoQuimico-div").html('');
                for (var i = 0; i < foto_quimico.files.length; i++) {
                    var id = Math.floor(Math.random() * 30000) + '_' + Date.now();
                    createThum(foto_quimico, i, id, "fotoQuimico-div", "txtQuimico", "Laboratorio");
                }
            });
            //FOTO UNO - PIE DE PAGINA
            foto_cu.addEventListener('change', function () {
                $("#foto1-div_r1").html('');
                for (var i = 0; i < foto_cu.files.length; i++) {
                    var id = Math.floor(Math.random() * 30000) + '_' + Date.now();
                    createThum(foto_cu, i, id, "foto1-div_r1", "txtfotor1", 4);
                }
            });

            //FOTO DOS - PIE DE PAGINA
            foto_ci.addEventListener('change', function () {
                $("#foto1-div_r2").html('');
                for (var i = 0; i < txtfotor2.files.length; i++) {
                    var id = Math.floor(Math.random() * 30000) + '_' + Date.now();
                    createThum(foto_ci, i, id, "foto1-div_r2", "txtfotor2", 5);
                }
            });

            //FOTO TRES - PIE DE PAGINA
            foto_se.addEventListener('change', function () {
                $("#foto1-div_r3").html('');
                for (var i = 0; i < txtfotor3.files.length; i++) {
                    var id = Math.floor(Math.random() * 30000) + '_' + Date.now();
                    createThum(foto_se, i, id, "foto1-div_r3", "txtfotor3", 6);
                }
            });

            //FOTO CUATRO - PIE DE PAGINA
            foto_si.addEventListener('change', function () {
                $("#foto1-div_r4").html('');
                for (var i = 0; i < txtfotor4.files.length; i++) {
                    var id = Math.floor(Math.random() * 30000) + '_' + Date.now();
                    createThum(foto_si, i, id, "foto1-div_r4", "txtfotor4", 7);
                }
            });

            var createThum = function (file, iterator, id,divtxt,textbox,numerphoto) {
                //Creo una etiqueta de tipo imagen
                var Thumnail = document.createElement('img');
                Thumnail.classList.add('Thumnail', id);
                Thumnail.setAttribute('id', "img"+id);
                Thumnail.classList.add('img-fluid');
                Thumnail.dataset.id = id;

                //Capturo imagen y creo una ruta local
                var object = URL.createObjectURL(file.files[iterator]);
                
                //Añado atributo src a mi etiqueta img
                Thumnail.setAttribute('src', '' + object + '');
                Thumnail.setAttribute('style','height:200px;width:100%');
                //Animacion ZoomIn
                $("#"+divtxt).addClass("animate__animated  animate__zoomInDown");
                //Añado imagen al div del card-body
                $("#"+divtxt).append(Thumnail);
                $("#" + divtxt).append("<input type='text' class='form-control form-control-sm mt-1' placeholder='Nombre a la foto " + numerphoto + "' autocomplete='off' id='txt" + textbox + "' name ='txt" + textbox + "'>");
                //Añadir boton eliminar foto
                closebutton(id, divtxt, textbox);

                //Limpio caja de texto file y lo deshabilito
                $("#"+textbox).val('');
                $("#"+textbox).attr('disabled', 'true');
            };

            var closebutton = function (id,divtxt,textbox) {
                var sp = id.toString().split("_");
                var uno = sp[0];
                var dos = sp[1];
                //console.log(divtxt, textbox);
                $("#" + divtxt).append('<button type="button" class="btn btn-warning mt-2 btn-block" id="' + id + '" onclick="eliminar(' + "'" + uno + "','" + dos + "','" + divtxt + "','" + textbox +"'"+ ')">Borrar Foto</button>');
            };

        })();

        function eliminar(a, b, txt, textbox) {
            //Concatenamos el codigo de las imagenes
            var concat = a.toString() + "_" + b.toString();
            //Eliminamos la clase de animacion
            $("#"+txt).removeClass("animate__animated  animate__zoomInDown");
            //Limpiamos div
            $("#"+txt).html('');
            $("#"+txt).val('');
            //Habilitamos el input file

            //$("#" + textbox).val('');
            //$("#txt" + textbox).val('');
            //$("#" + textbox+"_base64").val('');
            $("#"+textbox).removeAttr('disabled', 'true');  
        }

        $("#txtprovlote").on("change", function () {
            var fecha = $("#txtfecha").val();
            var ruc = $("#cmbproveedor").val();
            var lote = $("#txtprovlote").val();
            $("#txtvariedad").empty();
            $.ajax({
                type: "post",
                data: JSON.stringify({ "fecha": fecha, "productor": ruc,"lote":lote}),
                url: "../SerCali.asmx/MostrarVariedadp",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var convert = JSON.parse(r.d);
                    //console.log(p);
                    $("#txtvariedad").append("<option value='0' selected disabled>Seleccione Variedad</option>");
                    for (var i = 0; i < convert.length; i++) {
                        $("#txtvariedad").append("<option value='" + convert[i].IDVARIEDAD + "'>" + convert[i].DESCRIPCION + "</option>");
                    }
                }
            });
        });

        function Ocultar_Mostrar_Cards(bol) {
            $("#card-principal").attr("hidden", bol);
            $("#contenedor_dtdt").attr("hidden", bol);
            $("#muestra_btn_pdf").attr("hidden", bol);
            $("#div_respaldo_fotografico").attr("hidden", bol);
            $("#div_t_llegada").attr("hidden", bol);
            $("#defectos_res").attr("hidden", bol);
            $("#div_promedio").attr("hidden", bol);
            $("#div_resultado_fquimico").attr("hidden", bol);
            $("#div_resultado_evaluacion").attr("hidden", bol);
            $("#div_respaldo_foto").attr("hidden", bol);
            $("#div_firma").attr("hidden", bol);
            $("#defectos_res").html('');
            $("#res_pres_figure").html('');
        }

        $("document").ready(function () {
           

            //listar formatos
            $.ajax({
                data: JSON.stringify({ v: "" }),
                type: "post",
                url: "../SerCali.asmx/ListarFormatos_CALI",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var convert = JSON.parse(r.d);
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
                    var convert = JSON.parse(r.d);
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
            var fecha = $("#txtfecha").val();
            $.ajax({
                type: "post",
                data: JSON.stringify({ ruc: prov, fecha_: fecha }),
                url: "../SerCali.asmx/ListarLote_CALI",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var convert = JSON.parse(r.d);
                    $("#txtprovlote").append("<option value='0' selected disabled>Seleccione Lote</option>");
                    for (var i = 0; i < convert.length; i++) {
                        $("#txtprovlote").append("<option value='" + convert[i].DESCRIPCION + "'>" + convert[i].DESCRIPCION + "</option>");
                    }
                }
            });
        });


        $("#btnbuscar_cl").on("click", function () {

           
            BuscarReporte();
        });

        function    BuscarReporte() {
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

            //console.log(object);
            //alert(JSON.stringify({ ReporteCalidad: object }));
            if (object.Fecha == '' || object.Ruc == null || object.Lote == null || object.Variedad == null || object.Formato == null || object.Producto == '') {
                swal.fire({
                    title: "Faltan datos",
                    text: "",
                    icon: "error",
                    timer: 1500
                });
            } else {
                $.ajax({
                    type: "post",
                    data: JSON.stringify({ ReporteCalidad: object }),
                    url: "../SerCali.asmx/MostrarReporte_Cali",
                    dataType: "json",
                    contentType: "application/json;charset=utf-8",
                    beforeSend: function () {
                        swal.fire({
                            title: "Consultando...",
                            text: "Espere por favor.",
                            imageUrl: '../Img/loading.gif',
                            showConfirmButton: false,
                            backdrop: true,
                            showClass: {
                                popup: 'animate__animated animate__fadeInDown'
                            },
                            hideClass: {
                                popup: 'animate__animated animate__fadeOutUp'
                            }
                        });
                    },
                    success: function (r) {
                        swal.close();

                        Ocultar_Mostrar_Cards(false);

                        //console.log(r.d);

                        //Parsear data por cada tabla
                        var convert = JSON.parse(r.d);
                        var con_detalle = JSON.parse(r.d);
                        var con_dfinal = JSON.parse(r.d);
                        var d_sl = JSON.parse(r.d);
                        var tlleg = JSON.parse(r.d);
                        var promedio = JSON.parse(r.d);
                        var d_pre = JSON.parse(r.d);

                        var ctable = '';
                        var guias = [];
                        var presentacion = [];

                        //Llenamos guias detalle
                        for (var i = 0; i < convert.dd.length; i++) {
                            guias.push(convert.dd[i].Guia_de_productor);
                        }

                        for (var i = 0; i < d_pre.dp.length; i++) {
                            presentacion.push(d_pre.dp[i].resultado_oi);
                        }

                        //Eliminamos los duplicados
                        var guia_unica = [...new Set(guias)];

                        //Eliminamos presentaciones duplicadas
                        var presen_unica = [...new Set(presentacion)];



                        //INFORMACIÓN CABECERA - DINAMICO
                        //$("#titulo_reporte").text($("#cmbformato option:selected").text());
                        //INFORMACIÓN CABECERA - STATIC
                        $("#titulo_reporte").text("REPORTE DE INSPECCIÓN Y PRODUCTO TERMINADO DE UVA DE MESA");

                        for (var i = 0; i < convert.dc.length; i++) {

                            var xValues = [];
                            var yValues = [];


                            ctable = "<table class='table table-sm'><tbody>";
                            ctable += "<tr><td>FECHA: " + convert.dc[i].fecha + "</td><td>VARIEDAD: " + convert.dc[i].variedad + "</td><td style='text-align:right;'><img src='../Img/sf-logo.png' style='width:100px;' class='img-fluid'></td></tr>";
                            ctable += "<tr><td>PRODUCTOR: " + convert.dc[i].Productor + "</td><td>LOTE: " + convert.dc[i].Lote_de_campo + "</td><td></td></tr>";
                            ctable += "</tbody></table>";

                            //Limpiamos variable auxiliar para llenar table
                            ctable += "<div class='container'>";
                            ctable += "<div class='row'>";
                            ctable += "<div class='col-sm-5'>";
                            ctable += "<div class='card w-100 text-center'><h5>1.- RESULTADOS DE LA EVALUACION EN RECEPCION</h5></div>";
                            //INFORMACIÓN DETALLE
                            ctable += "<table class='table table-sm table-bordered'><tr style='color:white'><th style='background:#742A96'>Defectos</th><th style='background:#742A96'>Valor</th></tr><tbody>";
                            for (var p = 0; p < con_detalle.dd.length; p++) {
                                if (guia_unica[i] == convert.dd[p].Guia_de_productor) {
                                    if (parseInt(con_detalle.dd[p].Color) == 0) {
                                        xValues.push(con_detalle.dd[p].Defectos);
                                        yValues.push(con_detalle.dd[p].Valor);
                                    }

                                    ctable += "<tr><td>" + con_detalle.dd[p].Defectos + "</td><td>" + con_detalle.dd[p].Valor + " %</td></tr>";
                                }
                            }
                            ctable += "</tbody></table>";
                            ctable += "</div>";
                            ctable += "<div class='col-sm-7'>";
                            var name = "mychart" + i;
                            ctable += "<div>";
                            ctable += "<figure class='highcharts-figure' id='" + name + "' style='width:100%'></figure>";
                            ctable += "</div>";
                            ctable += "</div>";
                            ctable += "</div>";
                            ctable += "</div>";

                            $("#tb_x").append(ctable);

                            chartDefectos_(xValues, yValues, name);

                            /*
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
                            });*/

                            ctable = '';

                            $("#tb_x").append("<hr>");
                        }

                        //DEFECTOS MAS RESALTANTES
                        ctable = "<div class='container' style='margin-top:-10px'>";
                        ctable += "<div class='row'>";
                        ctable += "<div class='col-sm-12'>";
                        ctable += "<div class='card w-100'><div class='text-center card-header'><h5>DEFECTOS MAS RESALTANTES</h5></div>";
                        ctable += "<div class='card-body'>";
                        for (var i = 0; i < d_sl.dr.length; i++) {
                            if (i != 0) {
                                ctable += "<h6> * " + d_sl.dr[i].datos + "</h6>";
                            }
                        }
                        ctable += "</div>";
                        ctable += "</div>";
                        ctable += "</div>";
                        ctable += "</div>";
                        ctable += "</div>";
                        ctable += "</div>";
                        $("#defectos_res").append(ctable);
                        ctable = '';

                        //CHART T° LLEGADA
                        chartTllegada(tlleg.dt);

                        //INFORMACIÓN DETALLE DETALLE
                        var totaldtdt = con_dfinal.df.length;

                        //CREAMOS CABECERA THEAD DE TABLA FINAL
                        ctable = "<table class='table table-sm text-center'><thead><tr style='color:white;break-after: page;'>";
                        /*ctable += "<th style='background:#404E67'>";
                        ctable += "DESCRIPCION " + (i + 1);
                        ctable += "</th>";
                        ctable += "<th style='background:#404E67'>";
                        ctable += "RESULTADO " + (i + 1);
                        ctable += "</th>";*/
                        ctable += "<th style='background:#742A96;color:white;' rowspan=4>";
                        ctable += "CONDICIÓN DE LLEGADA DE CAMIONES";
                        ctable += "</th>";
                        ctable += "</tr></thead><tbody id='tbodydtdt'></tbody></table>";
                        $("#tb_dtdt").append(ctable);

                        ctable = '';

                        for (var i = 0; i < totaldtdt; i++) {
                            $("#tbodydtdt").append("<tr>");
                            $("#tbodydtdt").append("<td>" + con_dfinal.df[i].DESCRIPCION1 + "</td>" + "<td>" + con_dfinal.df[i].RESULTADO1 + " ✔️</td>" + "<td>" + con_dfinal.df[i].DESCRIPCION2 + "</td>" + "<td>" + con_dfinal.df[i].RESULTADO2 + " ✔️</td>");
                            $("#tbodydtdt").append("</tr>");
                        }

                        ctable = '';

                        //TextArea editable
                        $("#txtarea_editable").text("De acuerdo al muestreo de temperaturas recepcionadas, se ha encontrado los siguientes datos promedios: \n * El 80 % de las llegadas estan en el rango ideal de < 23°C. \n * El 20 % de las llegadas estan en el rango aceptable de 23.1 - 27.0C. \n * El 0 % de las llegadas están en el rango crítico > 27°C. \nRecomendamos que los camiones lleguen tempranos por evitar la elevación de la temperatura de la pulpa y disminuir la deshidratación.");

                        PromedioChart(promedio.dg);



                        //Chart Evaluación por presentacion
                        for (var i = 0; i < presen_unica.length; i++) {
                            var chartdefectos = [];
                            var chartvalor = [];

                            var mayorvalor = 0;
                            var mayordefecto = '';

                            var pudricion = 0;
                            var bayaor = '';

                            ctable = "<figure class='highcharts - figure w-100' id='ev" + (i + 1) + "'></figure>";
                            $("#res_pres_figure").append(ctable);

                            for (var j = 0; j < d_pre.dp.length; j++) {
                                if (d_pre.dp[j].resultado_oi == presen_unica[i]) {
                                    chartdefectos.push(d_pre.dp[j].defectos);
                                    chartvalor.push(d_pre.dp[j].valor);
                                    if (d_pre.dp[j].defectos == "PudricionNbayas") {
                                        pudricion = d_pre.dp[j].valor;
                                    }
                                }
                            }

                            ChartEvPre("ev" + (i + 1), chartdefectos, chartvalor, presen_unica[i]);
                            ctable = '';

                            //Obtenemos el maximo valor conjuntamente con su defecto
                            mayorvalor = chartvalor[0];
                            for (var m = 0; m < chartvalor.length; m++) {
                                if (mayorvalor < chartvalor[m]) {
                                    mayorvalor = chartvalor[m];
                                    mayordefecto = chartdefectos[m];
                                }
                            }

                            if (pudricion > 1) {
                                bayaor = 'Bayas';
                            } else {
                                bayaor = 'Baya';
                            }

                            $("#res_pres_figure").append("<h6>Observaciones:</h6>");
                            $("#res_pres_figure").append("<textarea style='hight:auto;' rows=4 class='form-control mb-2' id='txtarea_" + (i + 1) + "'>Defectos más resaltante\n-Se registró lo siguiente:\n* " + mayordefecto + ": " + mayorvalor + " %\n *Pudrición: " + pudricion + " " + bayaor + "</textarea>");

                        }

                    }
                });
            }

            //alert(object.Fecha);



            function chartDefectos_(x, y, div) {
                Highcharts.chart(div, {
                    chart: {
                        type: 'bar'
                    },
                    title: {
                        text: 'Defectos %'
                    },
                    xAxis: {
                        categories: (function () {
                            var data = [];
                            for (var i = 0; i < x.length; i++) {
                                data.push(x[i]);
                            }
                            return data;
                        })(),
                        title: {
                            text: null
                        }
                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: '',
                            align: 'high'
                        },
                        labels: {
                            overflow: 'justify'
                        }
                    },
                    tooltip: {
                        valueSuffix: '%'
                    },
                    plotOptions: {
                        bar: {
                            dataLabels: {
                                enabled: true
                            }
                        }
                    },
                    credits: {
                        enabled: false
                    },
                    series: [{
                        name: 'Valor',
                        color: '#f7b100',
                        data: (function () {
                            var data = [];
                            for (var i = 0; i < y.length; i++) {
                                data.push(y[i]);
                            }
                            return data;
                        })()
                    }]
                });
            }


            function chartTllegada(datasource) {
                //Variables Internas pero que pasan a funcion "PieChart"
                var sumtotal = 0;
                var sumaverde = 0;
                var sumaamarillo = 0;

                //var arr_base = '';

                for (var i = 0; i < datasource.length; i++) {
                    /*if (datasource.length - 1 == i) {
                        arr_base += datasource[i].Guia_de_productor ;
                        obj.push(datasource[i].Guia_de_productor);
                    } else {
                        arr_base += datasource[i].Guia_de_productor + ",";
                        obj.push(datasource[i].Guia_de_productor);
                    }*/
                    //Va sumando y almacenando todas las temperaturas en la variable suma
                    sumtotal = sumtotal + datasource[i].Tdellegada;
                    //Si: la termperatura es mayor a 23, verde, de lo contrario amarillo
                    if (parseFloat(datasource[i].Tdellegada) > 23) {
                        sumaverde = sumaverde + parseFloat(datasource[i].Tdellegada);
                    } else {
                        sumaamarillo = sumaamarillo + parseFloat(datasource[i].Tdellegada);
                    }
                }

                //Invocamos al piechart y pasamos 3 parametros
                PieChart(sumtotal, sumaverde, sumaamarillo);

                //CHART T° DE LLEGADA
                Highcharts.chart('container', {
                    chart: {
                        type: 'column',
                        /*backgroundColor: {
                            linearGradient: [0, 0, 500, 500],
                            stops: [
                                [0, 'rgb(255, 255, 255)'],
                                [1, 'rgb(200, 200, 255)']
                            ]},*/
                        animation: true
                    },
                    title: {
                        text: 'T° DE LLEGADA'
                    },
                    subtitle: {
                        text: 'Sunfruits Exports'
                    },
                    xAxis: {
                        categories:
                            (function () {
                                var p = [];
                                for (var i = 0; i < datasource.length; i++) {
                                    if (datasource.length - 1 == i) {
                                        p.push(datasource[i].Guia_de_productor);
                                    } else {
                                        p.push(datasource[i].Guia_de_productor);
                                    }
                                }
                                return p;
                            })()
                        ,
                        crosshair: true,
                        labels: {
                            rotation: -90
                        }
                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: 'T° de llegada',
                            align: 'high'
                        }, labels: {
                            rotation: -90
                        },
                        stackLabels: {
                            enabled: true,
                            style: {
                                fontWeight: 'bold',
                                color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                            }
                        }
                    },
                    tooltip: {
                        valueSuffix: ''
                    },
                    plotOptions: {
                        column: {
                            stacking: 'normal',
                            color: '#2aeba7'
                        },
                        bar: {
                            dataLabels: {
                                enabled: true
                            }
                        },
                        series: {
                            label: {
                                enabled: false
                            }
                        }, responsive: {
                            rules: [{
                                condition: {
                                    maxWidth: 500
                                },
                                chartOptions: {
                                    legend: {
                                        enabled: false
                                    }
                                }
                            }]
                        }
                    }, legend: {
                        enabled: false
                    },
                    credits: {
                        enabled: false
                    },
                    series: [{
                        data: (function () {
                            var data = [];
                            for (var i = 0; i < datasource.length; i++) {
                                if (datasource.length - 1 == i) {
                                    data.push(datasource[i].Tdellegada);
                                } else {
                                    data.push(datasource[i].Tdellegada);
                                }
                            }
                            return data;
                        })()
                    }]
                });
            }

            function PieChart(t, v, a) {
                //Obtengo el total dentro del rango en porcentaje
                var totalverde = (v * 100) / t;
                //Obtengo el total fuera del rango en porcentaje
                var totalam = (a * 100) / t;
                //PIE CHART
                Highcharts.chart('container_bar', {
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie'
                    },
                    title: {
                        text: 'T° DE PULPA'
                    },
                    tooltip: {
                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    accessibility: {
                        point: {
                            valueSuffix: '%'
                        }
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: true,
                                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                            }
                        }
                    },
                    credits: {
                        enabled: false
                    },
                    series: [{
                        name: 'Brands',
                        colorByPoint: true,
                        data: [{
                            name: 'In range',
                            y: totalverde,
                            sliced: true,
                            selected: true,
                            color: '#92D050'
                        }, {
                            name: 'Out Range',
                            y: totalam,
                            color: 'yellow'
                        }]
                    }]
                });
                //FIN PIE CHART
            }

            //Inicio de la función PromedioChart, para mostrar graficamente las barras por cada guía
            function PromedioChart(datasource) {

                Highcharts.chart('container_promedio', {
                    chart: {
                        type: 'column',
                        /*backgroundColor: {
                            linearGradient: [0, 0, 500, 500],
                            stops: [
                                [0, 'rgb(255, 255, 255)'],
                                [1, 'rgb(200, 200, 255)']
                            ]},*/
                        animation: true
                    },
                    title: {
                        text: 'Peso promedio de jabas cosecheras'
                    },
                    subtitle: {
                        text: 'Sunfruits Exports'
                    },
                    xAxis: {
                        categories:
                            (function () {
                                var p = [];
                                for (var i = 0; i < datasource.length; i++) {
                                    if (datasource.length - 1 == i) {
                                        p.push(datasource[i].Guia_de_productor);
                                    } else {
                                        p.push(datasource[i].Guia_de_productor);
                                    }
                                }
                                return p;
                            })()
                        ,
                        crosshair: true,
                        labels: {
                            rotation: -90
                        }
                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: 'Peso promedio de jabas cosecheras',
                            align: 'high'
                        },
                        stackLabels: {
                            enabled: true,
                            style: {
                                fontWeight: 'bold',
                                color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                            }
                        }
                    },
                    tooltip: {
                        valueSuffix: ''
                    },
                    plotOptions: {
                        column: {
                            stacking: 'normal',
                            color: '#9966FF'
                        },
                        bar: {
                            dataLabels: {
                                enabled: true
                            }
                        },
                        series: {
                            label: {
                                enabled: false
                            }
                        }
                    }, legend: {
                        enabled: false
                    },
                    credits: {
                        enabled: false
                    },
                    series: [{
                        data: (function () {
                            var data = [];
                            for (var i = 0; i < datasource.length; i++) {
                                if (datasource.length - 1 == i) {
                                    data.push(datasource[i].filas);
                                } else {
                                    data.push(datasource[i].filas);
                                }
                            }
                            return data;
                        })()
                    }]
                });

                $("#txtpromedio_editable").text("Recomendamos 8 kg en jabas cosecheras para las variedades seedless.\nDe acuerdo a la recepción de las jabas cosecheras, podemos observar que no se cumplió con el peso promedio \nde jabas.");

            }
            //Fin de la función PromedioChart

            function ChartEvPre(div, chartdefecto, chartvalor, presentacion) {
                Highcharts.chart(div, {
                    chart: {
                        type: 'bar'
                    },
                    title: {
                        text: 'Producto terminado - ' + presentacion
                    },
                    xAxis: {
                        categories: (function () {
                            var data = [];
                            for (var i = 0; i < chartdefecto.length; i++) {
                                data.push(chartdefecto[i]);
                            }
                            return data;
                        })(),
                        title: {
                            text: null
                        }
                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: '',
                            align: 'high'
                        },
                        labels: {
                            overflow: 'justify'
                        }
                    },
                    tooltip: {
                        valueSuffix: '%'
                    },
                    plotOptions: {
                        bar: {
                            dataLabels: {
                                enabled: true
                            }
                        }
                    },
                    credits: {
                        enabled: false
                    },
                    series: [{
                        name: 'Valor',
                        color: '#c0cf1d',
                        data: (function () {
                            var data = [];
                            for (var i = 0; i < chartvalor.length; i++) {
                                data.push(chartvalor[i]);
                            }
                            return data;
                        })()
                    }]
                });
            }


         
        };
        function LimpiarTables() {
            $("#tb_x").html('');
            //$("#tb_d").html('');
            $("#tb_dtdt").html('');
            $("#foto1-div").html('');
            $("#foto2-div").html('');
            $("#foto3-div").html('');
            $("#txtfoto1").prop("disabled", false);
            $("#txtfoto2").prop("disabled", false);
            $("#txtfoto3").prop("disabled", false);
        };

        $("#btnguardar_bus").on("click", function () {

            //Obtengo valores de todos los campos para concatenarlo como IDEREFERENCIA
            var fechag = $("#txtfecha").val();
            var proveedorg = $("#cmbproveedor").val();
            var loteg = $("#txtprovlote").val();
            var variedadg = $("#txtvariedad").val();
            var formatog = $("#cmbformato").val();
            var productog = $("#cmbproducto").val();

            //PRIMERAS FOTOS 
            var rutafotouno = $("#txtfoto1_base64").val();
            var rutafotodos = $("#txtfoto2_base64").val();
            var rutafototres = $("#txtfoto3_base64").val();

            console.log("AQUI P");
            console.log($("#txtfoto1_base64").val());
            console.log($("#txtfoto2_base64").val());
            console.log($("#txtfoto3_base64").val());

            //var rutafotouno = '';
            //var rutafotodos ='';
            //var rutafototres ='';

            var desfotouno = $("#txttxtfoto1").val();
            var desfotodos = $("#txttxtfoto2").val();
            var desfototres = $("#txttxtfoto3").val();

            

            //TEXTAREA
            var destpulpa = $("#txtarea_editable").val();
            var pesoprompulpa = $("#txtpromedio_editable").val();

            //RESPALDOS FOTOS
            var respfotouno = "respaldo uno";
            var respfotodos = "respaldo uno";
            var respfototres = "respaldo uno";
            var respfotocuatro = "respaldo uno";

            var obj = new Object();

            obj.fechag = fechag;
            obj.proveedorg = proveedorg;
            obj.loteg = loteg;
            obj.variedadg = variedadg;
            obj.formatog = formatog;
            obj.productog = productog;

            obj.rutafotouno = rutafotouno;
            obj.rutafotodos = rutafotodos;
            obj.rutafototres = rutafototres;
            obj.desfotouno = desfotouno;
            obj.desfotodos = desfotodos;
            obj.desfototres = desfototres;

            obj.destpulpa = destpulpa;
            obj.pesoprompulpa = pesoprompulpa;

            obj.respfotouno = respfotouno;
            obj.respfotodos = respfotodos;
            obj.respfototres = respfototres;
            obj.respfotocuatro = respfotocuatro;

            //subir

            $.ajax({
                type: "POST",
                data: JSON.stringify({ obj: obj }),
                url: "../SerCali.asmx/InsertarObservacionesCalidad",
                dataType: "json",
                contentType: "application/json;charset=utf-8",
                success: function (x) {
                    
                    var par = JSON.parse(x.d);
                    //console.log(par[0].IDPK);

                    if (parseInt(par[0].IDPK) > 0) {

                        /*swal.fire({
                            title: "Se guardo la busqueda con exito.",
                            text: "",
                            icon: "success",
                            timer: 2500
                        });*/


                        var objfo = new Object();
                        objfo.Ide = parseInt(par[0].IDPK);
                        objfo.IUnoCabName = desfotouno;
                        objfo.IUno64Cab = rutafotouno;
                        objfo.IDosCabName = desfotodos;
                        objfo.IDos64Cab = rutafotodos;
                        objfo.ITresCabname = desfototres;
                        objfo.ITres64Cab = rutafototres;

                        //CARGAR IMAGENES EL SERVIDOR
                        $.ajax({
                            type: "post",
                            data: JSON.stringify({ obj: objfo }),
                            url: "../SerCali.asmx/subir",
                            dataType: "json",
                            contentType: "application/json;charset=utf-8",
                            beforeSend: function () {
                                swal.fire({
                                    title: "Subiendo imagenes al servidor...",
                                    text: "",
                                    icon: "warning"
                                });
                            }, success: function (m) {
                                swal.close();
                                //console.log(m);
                                var p = JSON.parse(m.d);
                                
                                if (parseInt(p) > 0) {
                                    swal.fire({
                                        title: "Imagenes cargadas con exito.",
                                        text: "",
                                        icon: "success",
                                        timer: 4500
                                    });
                                } else {
                                    swal.fire({
                                        title: "Imagenes no cargadas",
                                        text: "",
                                        icon: "error",
                                        timer: 4500
                                    });
                                }
                            }
                        });

                    } else {
                        swal.fire({
                            title: "No se guardaron los datos, busqueda ya con data a nivel de base de datos.",
                            text: "",
                            icon: "error",
                            timer: 4500
                        });
                    }
                }
            });

        });

        $("#btnconsultabd_cl").on("click", function () {
            BuscarReporte();
            var object = new Object();

            swal.fire({
                title: "Consultando...",
                text: "Espere por favor.",
                imageUrl: '../Img/loading.gif',
                showConfirmButton: false,
                backdrop: true,
                showClass: {
                    popup: 'animate__animated animate__fadeInDown'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutUp'
                }
            });
          

            object.Fecha = $("#txtfecha").val();
            object.Ruc = $("#cmbproveedor").val();
            object.Lote = $("#txtprovlote").val();
            object.Variedad = $("#txtvariedad").val();
            object.Formato = $("#cmbformato").val();
            object.Producto = $("#cmbproducto").val();
            

            //console.log(object);

            if (object.Fecha == '' || object.Ruc == null || object.Lote == null || object.Variedad == null || object.Formato == null || object.Producto == '') {
                swal.fire({
                    title: "Faltan datos para realizar la busqueda.",
                    text: "",
                    icon: "error",
                    timer: 2500
                });
            } else {
                $.ajax({
                    type: "post",
                    data: JSON.stringify({ ReporteCalidad: object }),
                    url: "../SerCali.asmx/MostrarReporte_Cali_foto",
                    dataType: "json",
                    contentType: "application/json;charset=utf-8",
                    success: function (r) {
                        var par = JSON.parse(r.d);
               

                        var rutas = new Object();
                        rutas.ruta1 = par[0].RUTA_FOTO_1;
                        rutas.ruta2 = par[0].RUTA_FOTO_2;
                        rutas.ruta3 = par[0].RUTA_FOTO_3;

                        strRuta1 = par[0].RUTA_FOTO_1;
                        strRuta2 = par[0].RUTA_FOTO_2;
                        strRuta3 = par[0].RUTA_FOTO_3;


                        console.log('Rutas aqui ' + par[0].RUTA_FOTO_1 + ' ' + par[0].RUTA_FOTO_2 + ' ' + par[0].RUTA_FOTO_3);
                       
               
                        //for (var i = 0; i < rutas.length; i++) {
                         //   console.log(rutas[i]);
                        //}



                        $.ajax({
                            type: "Post",
                            data: JSON.stringify({obj : rutas}),
                            url: "../SerCali.asmx/ConvertirFotobase64",
                            dataType: "json",
                            contentType: "application/json;charset=utf-8",
                            success: function (m) {
                                swal.close();
                                if (par[0].RUTA_FOTO_1!="") {
                                    $("#foto1-div").append('<img class="img-responsive" src="data:image/jpeg;base64,' + m.d[0] + '" style="height:200px;width:100%;"/>');
                                    $("#foto1-div").append('<input type="text" placeholder="Nombre de foto 1" class="form-control form-control-sm" id="txtfotouno_recuperado" name="txtfotouno_recuperado" />');
                                    $("#foto1-div").append('<button type="button" class="btn btn-warning mt-2 btn-block" id="deletefoto_uno_recuperado" onclick="EliminaRecuperado(' + "'" + "deletefoto_uno_recuperado" + "'" + "," + "'" + par[0].RUTA_FOTO_1 + "'" + ')" name="deletefoto_uno_recuperado">BORRAR FOTO</button>');
                                    $("#txtfotouno_recuperado").val(par[0].OBS_FOTO_1);
                                    $("#txtfoto1").prop("disabled", true );
                                }
                               
                                if (par[0].RUTA_FOTO_2 != "") {
                                    $("#foto2-div").append('<img class="img-responsive" src="data:image/jpeg;base64,' + m.d[1] + '" style="height:200px;width:100%;"/>');
                                    $("#foto2-div").append('<input type="text" placeholder="Nombre de foto 2" class="form-control form-control-sm" id="txtfotodos_recuperado" name="txtfotodos_recuperado" />');
                                    $("#foto2-div").append('<button type="button" class="btn btn-warning mt-2 btn-block" id="deletefoto_dos_recuperado" onclick="EliminaRecuperado(' + "'" + "deletefoto_dos_recuperado" + "'" + "," + "'" + par[0].RUTA_FOTO_2 + "'" + ')" name="deletefoto_dos_recuperado">BORRAR FOTO</button>');
                                    $("#txtfotodos_recuperado").val(par[0].OBS_FOTO_2);
                                    $("#txtfoto2").prop("disabled", true);
                                }
                                if (par[0].RUTA_FOTO_3 != "") {
                                    $("#foto3-div").append('<img class="img-responsive" src="data:image/jpeg;base64,' + m.d[2] + '" style="height:200px;width:100%;"/>');
                                    $("#foto3-div").append('<input type="text" placeholder="Nombre de foto 3" class="form-control form-control-sm" id="txtfototres_recuperado" name="txtfototres_recuperado" />');
                                    $("#foto3-div").append('<button type="button" class="btn btn-warning mt-2 btn-block" id="deletefoto_tres_recuperado" onclick="EliminaRecuperado(' + "'" + "deletefoto_tres_recuperado" + "'" + "," + "'" + par[0].RUTA_FOTO_3 + "'" + ')" name="deletefoto_tres_recuperado">BORRAR FOTO</button>');
                                    $("#txtfototres_recuperado").val(par[0].OBS_FOTO_3);
                                    $("#txtfoto3").prop("disabled", true);
                                   
                               }
                               

                                
                                // LH 2022
                                $("#txtfoto1_base64").val(par[0].RUTA_FOTO_1);
                                $("#txttxtfoto1").val(par[0].OBS_FOTO_1);
                                $("#txtfoto2_base64").val(par[0].RUTA_FOTO_2);
                                $("#txttxtfoto2").val(par[0].OBS_FOTO_2);
                                $("#txtfoto3_base64").val(par[0].RUTA_FOTO_3);
                                console.log('rutaaaa ' + par[0].RUTA_FOTO_3);
                                $("#txttxtfoto3").val(par[0].OBS_FOTO_3);

                                // --------
                                $("#txtarea_editable").val("");
                                $("#txtarea_editable").val(par[0].DESCRIPCION_T_PULPA);

                                $("#txtpromedio_editable").val("");
                                $("#txtpromedio_editable").val(par[0].RECO_PESO_PROM);

                            }
                        });

                    
                    }
                });
            }
     

        });

        function EliminaRecuperado( boton, ruta) {
            var resultado = "";
            var strRuta;
         
            boton.includes("uno") ? strRuta = strRuta1 : 
                boton.includes("dos") ? strRuta = strRuta2 :
                    boton.includes("tres") ? strRuta = strRuta3 : ''
                ;
            var ob = new Object();
            ob.fecha = $("#txtfecha").val();
            ob.Ruc = $("#cmbproveedor").val();
            ob.Lote = $("#txtprovlote").val();
            ob.Variedad = $("#txtvariedad").val();
            ob.Formato = $("#cmbformato").val();
            ob.Producto = $("#cmbproducto").val();

            ob.ruta = strRuta;
            if (boton == "deletefoto_uno_recuperado") {
                resultado = "txtfotouno_recuperado";
                swal.fire({
                    title: "Desea eliminar la foto uno ?",
                    showCancelButton: true,
                    confirmButtonText: "Sí, eliminar.",
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    cancelButtonText:"No",
                    icon: "info"
                }).then((result) => {
                    if (result.isConfirmed) {
                        ob.idfoto = 1;
                        console.log(ob.ruta);
                        $.ajax({
                            type: "post",
                            data: JSON.stringify({ obj: ob}),
                            url: "../SerCali.asmx/BorrarFoto",
                            dataType: "json",
                            contentType: "application/json;charset=utf-8",
                            success: function (t) {
                                swal.fire({
                                    title: "Imagen eliminada con exito.",
                                    text: "",
                                    icon: "success",
                                    timer: 4500
                                });

                                $("#txtfoto1").prop("disabled", false);
                                $("#deletefoto_uno_recuperado").prop("disabled", true);
                            }
                        });
                    } 
                });
            }
            if (boton == "deletefoto_dos_recuperado") {
                resultado = "txtfotodos_recuperado";
                swal.fire({
                    title: "Desea eliminar la foto dos ?",
                    showCancelButton: true,
                    confirmButtonText: "Sí, eliminar.",
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    cancelButtonText: "No",
                    icon: "info"
                }).then((result) => {
                    if (result.isConfirmed) {
                        ob.idfoto = 2;
                        console.log(ob.ruta);
                        $.ajax({
                            type: "post",
                            data: JSON.stringify({ obj: ob }),
                            url: "../SerCali.asmx/BorrarFoto",
                            dataType: "json",
                            contentType: "application/json;charset=utf-8",
                            success: function (t) {

                                swal.fire({
                                    title: "Imagen eliminada con exito.",
                                    text: "",
                                    icon: "success",
                                    timer: 4500
                                });
                                $("#txtfoto2").prop("disabled", false);
                                $("#deletefoto_dos_recuperado").prop("disabled", true);
                            }
                        });
                    }
                });
            }
            if (boton == "deletefoto_tres_recuperado") {
                resultado = "txtfototres_recuperado";
                swal.fire({
                    title: "Desea eliminar la foto uno ?",
                    showCancelButton: true,
                    confirmButtonText: "Sí, eliminar.",
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    cancelButtonText: "No",
                    icon: "info"
                }).then((result) => {
                    if (result.isConfirmed) {
                        ob.idfoto = 3;
                        console.log(ob.ruta);
                        $.ajax({
                            type: "post",
                            data: JSON.stringify({ obj: ob }),
                            url: "../SerCali.asmx/BorrarFoto",
                            dataType: "json",
                            contentType: "application/json;charset=utf-8",
                            success: function (t) {

                                swal.fire({
                                    title: "Imagen eliminada con exito.",
                                    text: "",
                                    icon: "success",
                                    timer: 4500
                                });

                                $("#txtfoto3").prop("disabled", false);
                                $("#deletefoto_tres_recuperado").prop("disabled", true);
                            }
                        });
                    }
                });
            }
            console.log(resultado);

        }

        $("#btnpdf_calidad").on("click", function (e) {
           

            var headstr = "<html><head><title>Booking Details</title></head><body>";
            var footstr = "</body>";
            var newstr = document.getElementById("BODY").innerHTML; 
            var oldstr = document.body.innerHTML;
            document.body.innerHTML = headstr + newstr + footstr;
            window.print();
            swal.fire({
                title: "Descarga PDF completada",
                text: "",
                icon: "success",
                timer: 2500
            });
            location.reload();

            return true;
        });

    </script>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">

</asp:Content>


