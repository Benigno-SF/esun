<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WfoRepPalta.aspx.cs" Inherits="SFC_WEB_APP.Mod_Cali.WfoRepPalta" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
        <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/20.1.7/css/dx.common.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/20.1.7/css/dx.light.css"/>
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
    

    <script src="https://cdn.amcharts.com/lib/4/core.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
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

        .dx-texteditor-input {
        min-height: 0px;
        }

        #sel-guias{
            margin:0px;
            padding:0px;
        }

        .highcharts-figure,
        .highcharts-data-table table {
          min-width: 310px;
          /*max-width: 800px;*/
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

        @media print
{    
    .no-print, .no-print *
    {
        display: none !important;
    }
}

        .table.table-sm td, .table.table-sm th {
    padding: 0.4rem 1rem;
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
            <div class="col-sm-3" style="display: none">
                <div class="input-group">
                    <span class="input-group-text">Formato</span>
                    <select class="form-control" id="cmbproducto" name="cmbproducto" style="cursor:pointer">
                    </select>
                </div>  
            </div>
            <div class="col-sm-3">
                <div class="input-group">
                    <span class="input-group-text">Formato</span>
                    <select class="form-control" id="cmbformato" name="cmbformato" style="cursor:pointer"></select>
                </div>  
            </div>
            <div class="col-sm-3">
                <div class="input-group">
                    <span class="input-group-text">Fecha Recepcion</span>
                    <input type="date" class="form-control" id="txtfecha" name="txtfecha" style="cursor:pointer" />
                </div>
            </div>
            <div class="col-sm-3">
                <div class="input-group">
                    <span class="input-group-text">Fecha Proceso</span>
                    <input type="date" class="form-control" id="txtfechaproceso" name="txtfechaproceso" style="cursor:pointer" />
                </div>
            </div>
            <div class="col-sm-3">
                <div class="input-group">
                    <span class="input-group-text">Cliente</span>
                    <select class="form-control" id="cmbproveedor" name="cmbproveedor" style="cursor:pointer">

                    </select>
                </div>   
            </div>
            <div class="col-sm-3  mt-2">
                <div class="input-group">
                    <span class="input-group-text">Lote</span>
                    <select class="form-control" id="txtprovlote" name="txtprovlote" style="cursor:pointer"></select>
                </div>  
            </div>
            <div class="col-sm-4  mt-2">
                <div class="input-group">
                <span class="input-group-text">Guias</span>
                <div id="sel-guias" class="form-control"></div>  
                <input type="hidden" id="txtnroguia" name="txtnroguia" class="ist"/>
                <div class="invalid-tooltip">Seleccione...</div>
                    </div>
            </div>
            <div class="col-sm-3 mt-2">
                <div class="input-group">
                    <span class="input-group-text">Variedad</span>
                    <select class="form-control" id="txtvariedad" name="txtvariedad" style="cursor:pointer"></select>
                </div>  
            </div>


            <div class="col-sm-4 mt-2" style="display: none">
                <button type="button" class="btn btn-success w-100" id="btnbuscar_cl" name="btnbuscar_cl">Buscar</button>
            </div>
            <div class="col-sm-4 mt-2">
                <button type="button" class="btn btn-success w-100" id="btnconsultabd_cl" name="btnconsultabd_cl">Consultar     <img src="../Img/lupx.gif" class="img-fluid" style="width:25px; display: none" /></button>
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

    
    
    <div class="container" id="div_resultado_fquimico" style="margin-top:-10px;">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h5>2. Resultados de % materia seca</h5>
                    </div>
                    <div class="card-body text-center no-print">
                        <input type="file" class="txtfoto1 form-control" accept="image/png, image/jpeg" name="txtQuimico" id="txtQuimico" />  
                         <input type="text" class="form-control" name="txtfoto3_base64" id="txtQuimico_base64" hidden/>
                     <%--   <img src="../Img/rfquimico.png" class="img-fluid" alt="Análisis Fisico-Químico"/>  ------%>
                    </div>
                     <div class="card-body text-center" id="fotoQuimico-div">

                      </div>
                    <div class="card-body text-center no-print">
                        <input type="file" class="txtfoto1 form-control" accept="image/png, image/jpeg" name="txtQuimico_2" id="txtQuimico_2" />  
                         <input type="text" class="form-control" name="txtfoto3_base64_2" id="txtQuimico_base64_2" hidden/>
                     <%--   <img src="../Img/rfquimico.png" class="img-fluid" alt="Análisis Fisico-Químico"/>  ------%>
                    </div>
                    <br />
                    <div class="card-body text-center" id="fotoQuimico-div_2">

                     </div>
                    <div class="card-body text-center no-print">
                        <input type="file" class="txtfoto1 form-control" accept="image/png, image/jpeg" name="txtQuimico_3" id="txtQuimico_3" />  
                         <input type="text" class="form-control" name="txtfoto3_base64_3" id="txtQuimico_base64_3" hidden/>
                     <%--   <img src="../Img/rfquimico.png" class="img-fluid" alt="Análisis Fisico-Químico"/>  ------%>
                    </div>
                    <br />
                    <div class="card-body text-center" id="fotoQuimico-div_3">

                     </div>
                    <div class="card-body text-center no-print">
                        <input type="file" class="txtfoto1 form-control" accept="image/png, image/jpeg" name="txtQuimico_4" id="txtQuimico_4" />  
                         <input type="text" class="form-control" name="txtfoto3_base64_4" id="txtQuimico_base64_4" hidden/>
                     <%--   <img src="../Img/rfquimico.png" class="img-fluid" alt="Análisis Fisico-Químico"/>  ------%>
                    </div>
                    <br />
                    <div class="card-body text-center" id="fotoQuimico-div_4">

                     </div>
                    <div class="card-body text-center no-print">
                        <input type="file" class="txtfoto1 form-control" accept="image/png, image/jpeg" name="txtQuimico_5" id="txtQuimico_5" />  
                         <input type="text" class="form-control" name="txtfoto3_base64_5" id="txtQuimico_base64_5" hidden/>
                     <%--   <img src="../Img/rfquimico.png" class="img-fluid" alt="Análisis Fisico-Químico"/>  ------%>
                    </div>
                    <br />
                    <div class="card-body text-center" id="fotoQuimico-div_5">

                     </div>
                </div>
            </div>
        </div>
    </div>


    <div class="container" id="contenedor_descarte" tyle="margin-top:-10px;">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h5>3. Evaluación del descarte</h5>
                    </div>
                    <div class="card-body text-center" id="tb_descarte">
                            <figure class='highcharts-figure' id='chartdescarte' style='width:100%'></figure>
                    </div>
                </div> 
            </div>
        </div>
    </div>
   
   
    <div id="defectos_res2" style="margin-bottom:-15px;">

    </div>
     



    <div class="container" id="div_respaldo_foto" style="margin-top:-10px;break-after: page;">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h5>Respaldo Fotográfico</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="card">
                                    <div class="card-header no-print">
                                        <input type="file" class="form-control" id="txtfotor1" name="txtfotor1" />
                                    </div>
                                    <div class="card-body text-center" id="foto1-div_r1">

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="card">
                                    <div class="card-header no-print">
                                        <input type="file" class="form-control" id="txtfotor2" name="txtfotor2" />
                                    </div>
                                    <div class="card-body text-center" id="foto1-div_r2">

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="card">
                                    <div class="card-header no-print">
                                        <input type="file" class="form-control" id="txtfotor3" name="txtfotor3" />
                                    </div>
                                    <div class="card-body text-center" id="foto1-div_r3">

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 offset-sm-4">
                                <div class="card">
                                    <div class="card-header no-print">
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
            <div class="col-sm-6" style="display:none">
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

        $(document).on('input', '.subtitlec', function () {
            var idx = $(this).attr('id');
            var valuex = $(this).val();
            $('#sub' + idx).html(valuex);
        });

        var makeAsyncDataSource = function (jsonFile, id) {
            return new DevExpress.data.CustomStore({
                loadMode: "raw",
                key: id,
                load: function () {
                    return jsonFile;
                }
            });

        };

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
        //Load_Cultivo(0);
        //Button UP
        $('.ir-arriba').click(function () {
            $('body, html').animate({
                scrollTop: '0px'
            }, 300);
        });

        $("document").ready(function () {
            var date = new Date();
            var max = date.getFullYear() + "-" + date.getMonth() + 1 + "-" + date.getDate();

            $("#txtfecha").attr("max", max);
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
        var foto_quimico_2 = document.getElementById('txtQuimico_2');
        var foto_quimico_3 = document.getElementById('txtQuimico_3');
        var foto_quimico_4 = document.getElementById('txtQuimico_4');
        var foto_quimico_5 = document.getElementById('txtQuimico_5');

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
                    createThumheight(foto_quimico, i, id, "fotoQuimico-div", "txtQuimico", "Laboratorio");
                }
            });
            foto_quimico_2.addEventListener('change', function () {
                var filex = foto_quimico_2.files[0];
                var reader = new FileReader();

                reader.onloadend = function () {
                    $("#txtQuimico_base64_2").val(reader.result);
                }
                reader.readAsDataURL(filex);
                $("#fotoQuimico-div_2").html('');
                for (var i = 0; i < foto_quimico_2.files.length; i++) {
                    var id = Math.floor(Math.random() * 30000) + '_' + Date.now();
                    createThumheight(foto_quimico_2, i, id, "fotoQuimico-div_2", "txtQuimico_2", "Laboratorio_2");
                }
            });
            foto_quimico_3.addEventListener('change', function () {
                var filex = foto_quimico_3.files[0];
                var reader = new FileReader();

                reader.onloadend = function () {
                    $("#txtQuimico_base64_3").val(reader.result);
                }
                reader.readAsDataURL(filex);
                $("#fotoQuimico-div_3").html('');
                for (var i = 0; i < foto_quimico_3.files.length; i++) {
                    var id = Math.floor(Math.random() * 30000) + '_' + Date.now();
                    createThumheight(foto_quimico_3, i, id, "fotoQuimico-div_3", "txtQuimico_3", "Laboratorio_3");
                }
            });
            foto_quimico_4.addEventListener('change', function () {
                var filex = foto_quimico_4.files[0];
                var reader = new FileReader();

                reader.onloadend = function () {
                    $("#txtQuimico_base64_4").val(reader.result);
                }
                reader.readAsDataURL(filex);
                $("#fotoQuimico-div_4").html('');
                for (var i = 0; i < foto_quimico_4.files.length; i++) {
                    var id = Math.floor(Math.random() * 30000) + '_' + Date.now();
                    createThumheight(foto_quimico_4, i, id, "fotoQuimico-div_4", "txtQuimico_4", "Laboratorio_4");
                }
            });
            foto_quimico_5.addEventListener('change', function () {
                var filex = foto_quimico_5.files[0];
                var reader = new FileReader();

                reader.onloadend = function () {
                    $("#txtQuimico_base64_5").val(reader.result);
                }
                reader.readAsDataURL(filex);
                $("#fotoQuimico-div_5").html('');
                for (var i = 0; i < foto_quimico_5.files.length; i++) {
                    var id = Math.floor(Math.random() * 30000) + '_' + Date.now();
                    createThumheight(foto_quimico_5, i, id, "fotoQuimico-div_5", "txtQuimico_5", "Laboratorio_5");
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
            var createThumheight = function (file, iterator, id, divtxt, textbox, numerphoto) {
                //Creo una etiqueta de tipo imagen
                var Thumnail = document.createElement('img');
                Thumnail.classList.add('Thumnail', id);
                Thumnail.setAttribute('id', "img" + id);
                Thumnail.classList.add('img-fluid');
                Thumnail.dataset.id = id;

                //Capturo imagen y creo una ruta local
                var object = URL.createObjectURL(file.files[iterator]);

                //Añado atributo src a mi etiqueta img
                Thumnail.setAttribute('src', '' + object + '');
                Thumnail.setAttribute('style', 'width:100%');
                //Animacion ZoomIn
                $("#" + divtxt).addClass("animate__animated  animate__zoomInDown");
                //Añado imagen al div del card-body
                var logov = '<span class="sYin"><img class="logg" src="sf-logo.png"></span>';
                $("#" + divtxt).append(Thumnail);
                //$("#" + divtxt).append("<div id='img" + divtxt + "'>");

                // $("#img" + divtxt).css('background-image', object);
                //$("#" + divtxt).append("<input type='text' class='form-control form-control-sm mt-1' placeholder='Nombre a la foto " + numerphoto + "' autocomplete='off' id='txt" + textbox + "' name ='txt" + textbox + "'>");
                //Añadir boton eliminar foto
                closebutton(id, divtxt, textbox);

                //Limpio caja de texto file y lo deshabilito
                $("#" + textbox).val('');
                $("#" + textbox).attr('disabled', 'true');
            };

            var createThum = function (file, iterator, id, divtxt, textbox, numerphoto) {
                //Creo una etiqueta de tipo imagen
                var Thumnail = document.createElement('img');
                Thumnail.classList.add('Thumnail', id);
                Thumnail.setAttribute('id', "img" + id);
                Thumnail.classList.add('img-fluid');
                Thumnail.dataset.id = id;

                //Capturo imagen y creo una ruta local
                var object = URL.createObjectURL(file.files[iterator]);

                //Añado atributo src a mi etiqueta img
                Thumnail.setAttribute('src', '' + object + '');
                Thumnail.setAttribute('style', 'height:200px; width:100%');
                //Animacion ZoomIn
                $("#" + divtxt).addClass("animate__animated  animate__zoomInDown");
                //Añado imagen al div del card-body
                var logov = '<span class="sYin"><img class="logg" src="sf-logo.png"></span>';
                $("#" + divtxt).append(Thumnail);
                //$("#" + divtxt).append("<div id='img" + divtxt + "'>");

                // $("#img" + divtxt).css('background-image', object);
                $("#" + divtxt).append("<span id='subtxt" + textbox + "'></span><br><input type='text' class='form-control form-control-sm mt-1 subtitlec no-print' placeholder='Nombre a la foto " + numerphoto + "' autocomplete='off' id='txt" + textbox + "' name ='txt" + textbox + "'>");
                //Añadir boton eliminar foto
                closebutton(id, divtxt, textbox);

                //Limpio caja de texto file y lo deshabilito
                $("#" + textbox).val('');
                $("#" + textbox).attr('disabled', 'true');
            };

            var closebutton = function (id, divtxt, textbox) {
                var sp = id.toString().split("_");
                var uno = sp[0];
                var dos = sp[1];
                //console.log(divtxt, textbox);
                $("#" + divtxt).append('<button type="button" class="btn btn-warning mt-2 btn-block no-print" id="' + id + '" onclick="eliminar(' + "'" + uno + "','" + dos + "','" + divtxt + "','" + textbox + "'" + ')">Borrar Foto</button>');
            };

        })();

        function eliminar(a, b, txt, textbox) {
            //Concatenamos el codigo de las imagenes
            var concat = a.toString() + "_" + b.toString();
            //Eliminamos la clase de animacion
            $("#" + txt).removeClass("animate__animated  animate__zoomInDown");
            //Limpiamos div
            $("#" + txt).html('');
            $("#" + txt).val('');
            //Habilitamos el input file

            //$("#" + textbox).val('');
            //$("#txt" + textbox).val('');
            //$("#" + textbox+"_base64").val('');
            $("#" + textbox).removeAttr('disabled', 'true');
        }

        $("#txtprovlote").on("change", function () {
            var fecha = $("#txtfecha").val();
            var ruc = $("#cmbproveedor").val();
            var lote = $("#txtprovlote").val();
            $("#txtvariedad").empty();
            $.ajax({
                type: "post",
                data: JSON.stringify({ "fecha": fecha, "productor": ruc, "lote": lote }),
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
            $("#contenedor_descarte").attr("hidden", bol);
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
                data: JSON.stringify({ fecha_: fecha }),
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

        $("#sel-guias").dxDropDownBox();

        $("#txtprovlote").change(function () {
            $("#txtnroguia").empty();
            $("#sel-guias").dxDropDownBox("reset");
            var prov = $("#cmbproveedor").val();
            var fecha = $("#txtfecha").val();
            var lote = $("#txtprovlote").val();
            $.ajax({
                type: "post",
                data: JSON.stringify({ ruc: prov, fecha_: fecha, lote_: lote }),
                url: "../SerCali.asmx/MostrargUIAXProveedor",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var convert = JSON.parse(r.d);
                    $("#txtnroguia").append("<option value='0' selected disabled>Seleccione Guia</option>");
                    for (var i = 0; i < convert.length; i++) {
                        $("#txtnroguia").append("<option value='" + convert[i].GuiaRecep + "'>" + convert[i].GuiaRemi + "</option>");
                    }


                    $("#sel-guias").dxDropDownBox({
                        valueExpr: "GuiaRecep",
                        placeholder: "Seleccione Guias...",
                        displayExpr: "GuiaRemi",
                        showClearButton: true,
                        dataSource: makeAsyncDataSource(convert, 'GuiaRecep'),
                        contentTemplate: function (e) {
                            var value = e.component.option("GuiaRecep"),
                                $dataGrid = $("<div>").dxDataGrid({
                                    dataSource: e.component.getDataSource(),
                                    columns: [{ caption: "Guias", dataField: "GuiaRemi" }],
                                    selection: { mode: "multiple" },
                                    hoverStateEnabled: true,
                                    height: "100%",
                                    selectedRowKeys: value,
                                    onSelectionChanged: function (selectedItems) {
                                        var keys = selectedItems.selectedRowKeys;
                                        e.component.option("value", keys);

                                        $('#txtnroguia').val(keys);
                                    }
                                });


                            dataGrid = $dataGrid.dxDataGrid("instance");

                            e.component.on("valueChanged", function (args) {
                                var value = args.value;
                                dataGrid.selectRows(value, false);
                            });

                            return $dataGrid;
                        }
                    });
                }
            });
        });



        $("#btnbuscar_cl").on("click", function () {


            BuscarReporte();
        });

        function BuscarReporte() {
            LimpiarTables();
            Ocultar_Mostrar_Cards(true);

            var object = {
                vcFecha_proceso: $("#txtfechaproceso").val(),
                vcFecha_recepcion: $("#txtfecha").val(),
                vcRuc: $("#cmbproveedor").val(),
                vcLote: $("#txtprovlote").val(),
                vcVariedad: $("#txtvariedad").val(),
                vcFormato: $("#cmbformato").val(),
                vcCultivo: '',//$("#cmbproducto").val(),
                vcGuia: $("#txtnroguia").val()
            };

            //console.log(object);
            //alert(JSON.stringify({ ReporteCalidad: object }));
            if (
                object.vcFecha_proceso == '' ||
                object.vcFecha_recepcion == '' ||
                object.vcRuc == null ||
                object.vcLote == null ||
                object.vcVariedad == null ||
                object.vcFormato == null ||
                //object.vcCultivo == '' ||
                object.vcGuia == ''
            ) {
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
                    url: "../SerCali.asmx/MostrarReporte_Cali_Palta",
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

                        //d_cab = rows,
                        //d_guia = rows2,
                        //d_def = rows3,
                        //d_obs_def = rows4


                        var ctable = '';
                        var idcertificadox = [];

                        //Llenamos guias detalle

                        for (var i = 0; i < con_detalle.d_guia.length; i++) {
                            idcertificadox.push(con_detalle.d_guia[i].idcertificado);
                        }

                        //Eliminamos presentaciones duplicadas
                        var idcertificado_unica = [...new Set(idcertificadox)];



                        //INFORMACIÓN CABECERA - DINAMICO
                        //$("#titulo_reporte").text($("#cmbformato option:selected").text());
                        //INFORMACIÓN CABECERA - STATIC
                        $("#titulo_reporte").text("Informe de Proceso SFE -2022");
                        //Chart Evaluación por presentacion


                        var recep = object.vcFecha_recepcion;
                        var vrecep = recep.split("-", 3);;
                        var nrecep = vrecep[2] + "-" + vrecep[1] + "-" + vrecep[0];

                        var fnac = object.vcFecha_proceso;
                        var fec = fnac.split("-", 3);;
                        var nfproc = fec[2] + "-" + fec[1] + "-" + fec[0];
                        var cab = '';
                        cab += "<table class='table table-sm'><tbody>";
                        cab += "<tr><td>FECHA RECEPCION: " + nrecep + "</td><td>VARIEDAD: " + convert.d_cab[0].Variedad + "</td><td style='text-align:right;'><img src='../Img/sf-logo.png' style='width:100px;' class='img-fluid'></td></tr>";
                        cab += "<tr><td>FECHA PROCESO:   " + nfproc + "</td><td>LOTE: " + object.vcLote + "</td><td></td></tr>";
                        cab += "<tr><td>CLIENTE: " + convert.d_cab[0].Productor + "</td><td></td><td></td></tr>";
                        cab += "</tbody></table>";
                        cab += "<div class='container'>";
                        cab += "<div class='card w-100'><h5>1.- Defectos de calidad en recepción:</h5></div>";
                        cab += "<div class='row' id='tb_x2'></div></div>";

                        $("#tb_x").html(cab);
                        for (var i = 0; i < idcertificado_unica.length; i++) {

                            var guia = '';
                            var zdescripcion = '';
                            if (idcertificado_unica[i] != '' && idcertificado_unica[i] != null) {
                                var xValues = [];
                                var yValues = [];

                                ctable += "<div class='col-sm-4'>";
                                ctable += "<div class='card w-100 '><h5 id='guia" + i + "'></h5></div>";
                                //INFORMACIÓN DETALLE  ---1
                                ctable += "<table class='table table-sm table-bordered'><tr style='color:white'><th style='background:#742A96'>Defectos</th><th style='background:#742A96'>Valor</th></tr><tbody>";
                                // INFORMACION DETALLE
                               
                                //FIN
                            
                                for (var p = 0; p < con_detalle.d_guia.length; p++) {

                                    if (idcertificado_unica[i] == con_detalle.d_guia[p].idcertificado) {
                                        // capturamos nuestra variable ----2
                                        if (con_detalle.d_guia[p].etiqueta == 'zdescripcion') {
                                            zdescripcion += "<h6>* " + con_detalle.d_guia[p].resultado_oi + "</h6>";
                                        }
                                        //fin

                                        if (con_detalle.d_guia[p].etiqueta != '.Guía de productor' && con_detalle.d_guia[p].etiqueta != 'zdescripcion') {
                                            if (con_detalle.d_guia[p].etiqueta != 'z%FRUTOS CON DEFECTOS' && con_detalle.d_guia[p].etiqueta != 'z%FRUTOS SIN DEFECTOS' && con_detalle.d_guia[p].etiqueta != 'z%TOTAL FRUTOS') {
                                                xValues.push(con_detalle.d_guia[p].etiqueta);

                                                if (con_detalle.d_guia[p].resultado_oi != null && con_detalle.d_guia[p].resultado_oi != '') {
                                                    var rest = parseFloat(con_detalle.d_guia[p].resultado_oi);
                                                } else {
                                                    var rest = 0;
                                                }
                                                yValues.push(rest);
                                            }

                                            if (con_detalle.d_guia[p].resultado_oi != null) {
                                                ctable += "<tr><td>" + con_detalle.d_guia[p].etiqueta + "</td><td>" + con_detalle.d_guia[p].resultado_oi + " %</td></tr>";
                                            }

                                        }



                                        if (con_detalle.d_guia[p].etiqueta == '.Guía de productor') {
                                            guia = con_detalle.d_guia[p].resultado_oi;
                                        }

                                    }
                                }
                                ctable += "</tbody></table>";
                                ctable += "</div>";
                                ctable += "<div class='col-sm-8'>";
                                var name = "mychart" + i;
                                var nameguia = "guia" + i;
                                ctable += "<div>";
                                ctable += "<figure class='highcharts-figure' id='" + name + "' style='width:100%'></figure>";
                                ctable += "</div>";
                                ctable += "</div>";
                                //  obsrvacion
                                ctable += "<div class='col-sm-12'>";
                                ctable += "<div class='card w-100'><div class='card-header'><h5>Observacion:</h5>1.-Principales defectos encontrados</div>";
                                ctable += "<div class='card-body'>";
                                ctable += zdescripcion;
                                ctable += "</div>";
                                ctable += "</div>";
                                ctable += "</div>";
                                ctable += "</div>";

                                // fin
                                $("#tb_x2").append(ctable);
                                $("#" + nameguia).append(guia);
                                chartDefectos_(xValues, yValues, name);

                                ctable = '';
                                xValues = [];
                                yValues = [];
                                name = '';
                                zdescripcion = '';
                                guia = '';
                            }

                        }

                        ////DEFECTOS MAS RESALTANTES
                        //ctable = "<div class='container' style='margin-top:-10px'>";
                        //ctable += "<div class='row'>";
                        //ctable += "<div class='col-sm-12'>";
                        //ctable += "<div class='card w-100'><div class='card-header'><h5>Observacion:</h5>1.-Principales defectos encontrados</div>";
                        //ctable += "<div class='card-body'>";
                        //for (var i = 0; i < d_sl.df.length; i++) {
                        //    if (i != 0) {
                        //        if (d_sl.dr[i].datos != 'DEFECTOS MAS RESALTANTES:') {
                        //            ctable += "<h6> * " + d_sl.df[i].datos + "</h6>";
                        //        }
                        //    }
                        //}
                        //ctable += "</div>";
                        //ctable += "</div>";
                        //ctable += "</div>";
                        //ctable += "</div>";
                        //ctable += "</div>";
                        //ctable += "</div>";
                        //$("#defectos_res").append(ctable);
                        //ctable = '';



                        //DEFECTOS MAS RESALTANTES
                        ctable2 = "<div class='container' style='margin-top:-10px'>";
                        ctable2 += "<div class='row'>";
                        ctable2 += "<div class='col-sm-12'>";
                        ctable2 += "<div class='card w-100'><div class='card-header'><h5>Observacion:</h5>1.-En la inspección de descarte se observó como defectos de incidencia significativa:</div>";
                        ctable2 += "<div class='card-body'>";
                        for (var i = 0; i < d_sl.d_obs_def.length; i++) {
                            if (i != 0) {
                                if (d_sl.d_obs_def[i].datos != 'DEFECTOS MAS RESALTANTES:') {
                                    ctable2 += "<h6> * " + d_sl.d_obs_def[i].datos + "</h6>";
                                }
                            }
                        }
                        ctable2 += "</div>";
                        ctable2 += "</div>";
                        ctable2 += "</div>";
                        ctable2 += "</div>";
                        ctable2 += "</div>";
                        ctable2 += "</div>";
                        $("#defectos_res2").append(ctable2);
                        ctable2 = '';


                        var xValues2 = [];
                        var yValues2 = [];

                        for (var df = 0; df < con_detalle.d_def.length; df++) {

                            xValues2.push(con_detalle.d_def[df].etiqueta);
                            yValues2.push(con_detalle.d_def[df].porcentajemuestra);
                        }

                        chartDefectosDescarte_(xValues2, yValues2, 'chartdescarte');


                        //INFORMACIÓN DETALLE DETALLE
                        var totaldtdt = con_dfinal.d_obs_def.length;

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
                            $("#tbodydtdt").append("<td>" + con_dfinal.d_obs_def[i].DESCRIPCION1 + "</td>" + "<td>" + con_dfinal.d_obs_def[i].RESULTADO1 + " ✔️</td>" + "<td>" + con_dfinal.d_obs_def[i].DESCRIPCION2 + "</td>" + "<td>" + con_dfinal.d_obs_def[i].RESULTADO2 + " ✔️</td>");
                            $("#tbodydtdt").append("</tr>");
                        }

                        ctable = '';

                        //TextArea editable
                        $("#txtarea_editable").text("De acuerdo al muestreo de temperaturas recepcionadas, se ha encontrado los siguientes datos promedios: \n * El 80 % de las llegadas estan en el rango ideal de < 23°C. \n * El 20 % de las llegadas estan en el rango aceptable de 23.1 - 27.0C. \n * El 0 % de las llegadas están en el rango crítico > 27°C. \nRecomendamos que los camiones lleguen tempranos por evitar la elevación de la temperatura de la pulpa y disminuir la deshidratación.");






                    }
                });
            }

            //alert(object.Fecha);
            function chartDefectos_1(x, y, div) {
                Highcharts.chart(div, {
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: 'World\'s largest cities per 2017'
                    },
                    subtitle: {
                        text: 'Source: <a href="https://en.wikipedia.org/wiki/List_of_cities_proper_by_population">Wikipedia</a>'
                    },
                    xAxis: {
                        categories: (function () {
                            var data = [];
                            for (var i = 0; i < x.length; i++) {
                                data.push(x[i]);
                            }
                            return data;
                        })(),
                        type: 'category',
                        labels: {
                            rotation: -75,
                            style: {
                                fontSize: '13px',
                                fontFamily: 'Verdana, sans-serif'
                            }
                        }
                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: 'Population (millions)'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        pointFormat: 'Population in 2017: <b>{point.y:.1f} millions</b>'
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
                        })(),
                        dataLabels: {
                            enabled: true,
                            rotation: -90,
                            color: '#FFFFFF',
                            align: 'right',
                            format: '{point.y:.1f}', // one decimal
                            y: 10, // 10 pixels down from the top
                            style: {
                                fontSize: '13px',
                                fontFamily: 'Verdana, sans-serif'
                            }
                        }
                    }]
                });
            };

            function chartDefectos_(x, y, div) {
                Highcharts.chart(div, {
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: 'Porcentajes %'
                    },
                    xAxis: {
                        categories: (function () {
                            var data = [];
                            for (var i = 0; i < x.length; i++) {
                                data.push(x[i]);
                            }
                            return data;
                        })(),
                        type: 'category',
                        //title: {
                        //    text: null
                        //},
                        labels: {
                            rotation: -75,
                            style: {
                                fontSize: '10px',
                                fontFamily: 'Verdana, sans-serif'
                            }
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
                        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
                    },
                    plotOptions: {
                        series: {
                            borderWidth: 0,
                            dataLabels: {
                                enabled: true,
                                format: '{y:.3f}%'
                            }
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    credits: {
                        enabled: false
                    },
                    series: [{
                        name: 'Valor',
                        color: '#1CB531',
                        data: (function () {
                            var data = [];
                            for (var i = 0; i < y.length; i++) {
                                data.push(y[i]);
                            }
                            return data;
                        })()
                    }],
                    dataLabels: {
                        enabled: true,
                        rotation: -90,
                        color: '#FFFFFF',
                        align: 'right',
                        format: '{point.y:.1f}', // one decimal
                        y: 10, // 10 pixels down from the top
                        style: {
                            fontSize: '13px',
                            fontFamily: 'Verdana, sans-serif'
                        }
                    }
                });
            }

            function chartDefectosDescarte_(x, y, div) {
                Highcharts.chart(div, {
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: 'Principales Defectos en el Descarte'
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
                        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
                    },
                    plotOptions: {
                        series: {
                            borderWidth: 0,
                            dataLabels: {
                                enabled: true,
                                format: '{point.y:.1f}%'
                            }
                        }
                    },
                    credits: {
                        enabled: false
                    },
                    series: [{
                        name: 'Valor',
                        color: '#1CB531',
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








        };
        function LimpiarTables() {
            $("#tb_x").html('');
            //$("#tb_d").html('');
            $("#tb_dtdt").html('');
            $("#defectos_res2").html('');
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


            var object = {
                vcFecha_proceso: $("#txtfechaproceso").val(),
                vcFecha_recepcion: $("#txtfecha").val(),
                vcRuc: $("#cmbproveedor").val(),
                vcLote: $("#txtprovlote").val(),
                vcVariedad: $("#txtvariedad").val(),
                vcFormato: $("#cmbformato").val(),
                vcCultivo: '',//$("#cmbproducto").val(),
                vcGuia: $("#txtnroguia").val()
            };

            //console.log(object);
            //alert(JSON.stringify({ ReporteCalidad: object }));
            if (
                object.vcFecha_proceso == '' ||
                object.vcFecha_recepcion == '' ||
                object.vcRuc == null ||
                object.vcLote == null ||
                object.vcVariedad == null ||
                object.vcFormato == null ||
                //object.vcCultivo == '' ||
                object.vcGuia == ''
            ) {
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
                    url: "../SerCali.asmx/MostrarReporte_Cali_foto_Palta",
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
                            data: JSON.stringify({ obj: rutas }),
                            url: "../SerCali.asmx/ConvertirFotobase64",
                            dataType: "json",
                            contentType: "application/json;charset=utf-8",
                            success: function (m) {
                                swal.close();
                                if (par[0].RUTA_FOTO_1 != "") {
                                    $("#foto1-div").append('<img class="img-responsive" src="data:image/jpeg;base64,' + m.d[0] + '" style="height:200px;width:100%;"/>');
                                    $("#foto1-div").append('<input type="text" placeholder="Nombre de foto 1" class="form-control form-control-sm" id="txtfotouno_recuperado" name="txtfotouno_recuperado" />');
                                    $("#foto1-div").append('<button type="button" class="btn btn-warning mt-2 btn-block" id="deletefoto_uno_recuperado" onclick="EliminaRecuperado(' + "'" + "deletefoto_uno_recuperado" + "'" + "," + "'" + par[0].RUTA_FOTO_1 + "'" + ')" name="deletefoto_uno_recuperado">BORRAR FOTO</button>');
                                    $("#txtfotouno_recuperado").val(par[0].OBS_FOTO_1);
                                    $("#txtfoto1").prop("disabled", true);
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

        function EliminaRecuperado(boton, ruta) {
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
                    cancelButtonText: "No",
                    icon: "info"
                }).then((result) => {
                    if (result.isConfirmed) {
                        ob.idfoto = 1;
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
            //location.reload();

            return true;
        });


    </script>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">

</asp:Content>


