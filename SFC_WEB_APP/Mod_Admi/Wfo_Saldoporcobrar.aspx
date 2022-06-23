<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_Saldoporcobrar.aspx.cs" Inherits="SFC_WEB_APP.Mod_Admi.Wfo_Saldoporcobrar" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.common.css" />
    <%--   <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.light.css" />--%>
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.1.3/css/dx.material.orange.light.css" />

    <script src="../Content/DevExtreme/cldr.min.js"></script>
    <script src="../Content/DevExtreme/event.min.js"></script>
    <script src="../Content/DevExtreme/supplemental.min.js"></script>
    <script src="../Content/DevExtreme/unresolved.min.js"></script>
    <script src="../Content/DevExtreme/globalize.min.js"></script>
    <%--<script src="../Content/DevExtreme/number.min.js"></script>--%>
    <script src="../Content/DevExtreme/message.min.js"></script>
    <%-- <script src="../Content/DevExtreme/currency.min.js"></script>--%>
    <script src="../Content/DevExtreme/date.min.js"></script>
    <script src="../Content/DevExtreme/jszip.min.js"></script>
    <script src="../Content/DevExtreme/dx.all.js"></script>
    <script src="../Content/DevExtreme/dx.messages.es.js"></script>
    <script src="../Content/DevExtreme/supplemental.js"></script>
    <script src="../Content/DevExtreme/es.js"></script>

    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/print.min.css" />
    <script src="../Content/DevExtreme/print.min.js"></script>
    <!-- END: Vendor CSS-->
    
        <style>
        .frame iframe {
            min-height:500px;
            width: 100% !important;
            height: 85vh !important;
        }
        .frame {
            min-height:500px;
            height: 85vh !important;
            width: 100% !important;
        }
        .content-body{
            height: 85vh !important;
            width: 100% !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
        <div class="frame">
        <iframe title="Tablero Consolidado Planta V8 - Rendimiento Proceso" src="https://app.powerbi.com/view?r=eyJrIjoiOTY4MGQwOTItZjU5ZC00ZWJlLWE3NjMtMjE0MTA1YjQ3N2VhIiwidCI6IjM1OTEzN2RmLTZjM2ItNDAyNS1iYThhLTczMjYwODhmNjExYiIsImMiOjR9" frameborder="0" allowfullscreen="true">
        </iframe>
    </div>
    <form id="form_saldoxcobrar" style="display:none">
            <div class="row" style="display:none">
                <div class="col-sm-3" style="display:none">
                    <label>Ambito de Documentos</label>
                    <select style="cursor:pointer" class="form-control slcadocumentos" id="cmbambito_documentos" name="cmbambito_documentos">
                        
                    </select>
                </div>
                <div class="col-sm-3">
                    <label>Vendedor</label>
                    <select style="cursor:pointer" class="form-control slcvendedor" id="cmbVendedor" name="cmbVendedor">
                        
                    </select>
                </div>
                <div class="col-sm-3">
                    <label>Destino</label>
                    <select style="cursor:pointer" class="form-control slcdestino" id="cmbDestino" name="cmbDestino">
                        <option value="" selected disabled>Seleccione Destino</option>
                        <option value="N">Nacional</option>
                        <option value="E">Exportacion</option>
                    </select>
                </div>
                <div class="col-sm-3 mb-2">
                    <label>Cliente</label>
                    <select style="cursor:pointer" class="form-control slcliente" id="cmbCliente" name="cmbCliente">
                        
                    </select>
                </div>
                <div class="col-sm-3">
                    <label>Campaña</label>
                    <select style="cursor:pointer" class="form-control slcampana" id="cmbCampana" name="cmbCampana">
                                
                    </select>
                </div>
            </div>
    </form>
    <div class="container mt-2" style="display:none">
        <div class="row">
            <div class="col-sm-12">
                <button type="button" id="btnSaldoxcobrar" class="btn btn-secondary">GENERAR DOCUMENTO</button>
            </div>
        </div>
    </div>

    <div class=" row" style="display:none">
          <section id="cell-background" style="width: 100%">
            <div class="row mt-3">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Consolidado Saldos por cobrar
                           <a class="heading-elements-toggle"  id="DIVORDREP" style="top: 0px; padding-top: 4px; display: block">
                            </a>

                            </h4>
                        </div>
                        <div class="card-content collapse show" style="overflow: auto">
                            <div class="card-body card-dashboard" style="min-height: 30vh; max-height: 90vh; /*width: 1500px;*/ overflow: auto" id="divdatagrid">
                                <div id="container-x" class="device-mobile-tablet-container" style="min-height: 30vh;/* width: 1600px;overflow: auto;*/">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

     <!-- BEGIN: PageScripts/ Vendor JS -->
    <script src="../Scripts/dt/datatables.min.js"></script>
    <script src="../Scripts/dt/dataTables.buttons.min.js"></script>
    <script src="../Scripts/dt/buttons.bootstrap4.min.js"></script>
    <script src="../Scripts/dt/vfs_fonts.js"></script>
    <script src="../Scripts/dt/buttons.html5.min.js"></script>



    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/no-data-to-display.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>
    <script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
    <!-- END: Page VScripts/endor JS-->


    <!--SCRIPTS PARA LLENAR DATA-->
    <script>


        $("document").ready(function () {
            startslc();
        });

        function startslc() {
            /*PLUGIN SELECT2*/
            $('.slcvendedor').select2();
            $('.slcadocumentos').select2();
            $('.slcdestino').select2();
            $('.slcliente').select2();
            $('.slcampana').select2();
            /*FIN PLUGIN*/
        }

        function LoadGrupo(bd) {

            var obj = new Object();
            obj.vcBaseDatos = bd;
            obj.vnIdGrupo = '';
            obj.vcDescripcion = '';
            $.ajax({
                type: 'POST',
                url: "../SerLogi.asmx/ListGrupoNis",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    var searchBox = $("#nIdGrupo").dxSelectBox({
                        dataSource: lst,
                        displayExpr: 'DESCRIPCION',
                        valueExpr: 'IDGRUPO',
                        placeholder: "Seleccione",
                        noDataText: "Sin Datos",
                        searchEnabled: true,
                    }).dxSelectBox("instance");


                    $('#nIdGrupo').dxSelectBox({
                        items: lst,
                        value: lst[0],
                        onValueChanged(frt) {
                            if (frt.value['IDGRUPO'] === undefined) {
                                LoadSubGrupo(frt.value, bd)
                            }
                            //$('.current-value > span').text(data.value);
                        },
                    });

                },
                error: function (error) {
                    alert(JSON.stringify(error));
                }
            });
        }
        //COMBO - AMBITO DE DOCUMENTOS
        $.ajax({
            url: "../SerAdmi.asmx/mostrarambitos_WBS",
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (a) {

                var total = parseInt(a.d.length);
                
                $("#cmbambito_documentos").append("<option value='' selected disabled>Seleccione documento</option>");
                for (var i = 0; i < total; i++) {
                    var p = a.d[i].split("-");
                    $("#cmbambito_documentos").append("<option value='" + p[0] + "'>" + p[1] + "</option>");
                }
                
            }
        });
        //COMBO VENDEDOR
        $.ajax({
            url: "../SerAdmi.asmx/mostrarvendedor_WBS",
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                var total = parseInt(r.d.length);

                $("#cmbVendedor").append("<option value='' selected disabled>Seleccione Vendedor</option>");
                for (var i = 0; i < total; i++) {
                    var p = r.d[i].split("-");
                    $("#cmbVendedor").append("<option value='" + p[0] + "'>" + p[1] + "</option>");
                }
            }
        });
        //COMBO CLIENTE
        $.ajax({
            url: "../SerAdmi.asmx/mostrarcliente_WBS",
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                var total = parseInt(r.d.length);

                $("#cmbCliente").append("<option value='' selected disabled>Seleccione Cliente</option>");
                for (var i = 0; i < total; i++) {
                    var p = r.d[i].split("-");
                    $("#cmbCliente").append("<option value='" + p[0] + "'>" + p[1] + "</option>");
                }
            }
        });
        //COMBO CAMPAÑA
        $.ajax({
            url: "../SerAdmi.asmx/mostrarcampanaSXC_WBS",
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                var total = parseInt(r.d.length);

                $("#cmbCampana").append("<option value='' selected disabled>Seleccione Campaña</option>");
                $("#cmbCampana").append("<option value=''>TODOS</option>");
                for (var i = 0; i < total; i++) {
                    var p = r.d[i].split("-");
                    $("#cmbCampana").append("<option value='" + p[0] + "'>" + p[1] + "</option>");
                }
            }
        });

        $("#btnSaldoxcobrar").on("click", function () {
            $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');

            //ambitodocumento
            var ambitodocumento = $("#cmbambito_documentos").val();
            //vendedor
            var vendedor = $("#cmbVendedor").val();
            //destino
            var destino = $("#cmbDestino").val();
            //Cliente
            var cliente = $("#cmbCliente").val();
            //Campana
            var campana = $("#cmbCampana").val();
            //CREO UN OBJETO PARA PAGARLO POR AJAX
            var obj = new Object();
            obj.ambito = $("#cmbambito_documentos").val();
            obj.vendedor = $("#cmbVendedor").val();
            obj.destino = $("#cmbDestino").val();
            obj.clie_prov = $("#cmbCliente").val();
            obj.campana = $("#cmbCampana").val();

            //Llenar Tabla
            $.ajax({
                type: "post",
                data: JSON.stringify({ objtable: obj }),
                url: "../SerAdmi.asmx/PivotTablaSXCobrar",
                dataType: "json",
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    console.log(lst.d1);
                    $('#container-x').html('<div id="PivotGrid"></div>');
                    TbPivotGrid(lst.d1);
                }
            });



            
            
            //alert("ambitodocumento: " + ambitodocumento+"\n"+"vendedor: "+vendedor+"\n"+"destino: "+destino+"\n"+"cliente: "+cliente+"\n"+"campaña: "+campana);
        });

        //TABLA PIVOT
        function TbPivotGrid(data) {
            DevExpress.localization.locale('es');
            DevExpress.config({ forceIsoDateParsing: true });
            $("#PivotGrid").dxPivotGrid({
                allowSortingBySummary: true,
                //allowSorting: true,
                allowFiltering: true,
                //allowExpandAll: true,
                //height: 440,
                showBorders: true,
                scrolling: {
                    mode: "virtual",
                },
                bindingOptions: {
                    headerFilter: "headerFilter"
                },
                fieldPanel: {
                    visible: true
                },
                fieldChooser: {
                    allowSearch: true,
                    enabled: true
                },
                export: {
                    enabled: true,
                    fileName: "Reporte Saldo por cobrar"
                },
                dataSource: {
                    fields: [
                        {
                            caption: "Razón Social",
                            dataField: "RAZON_SOCIAL",
                            area: "row"
                        }, {
                            caption: "Cliente",
                            dataField: "IDCLIEPROV",
                            area: "filter",
                        }, {
                            caption: "Campaña",
                            width: 50,
                            dataField: "DESCCAMPANA",
                            area: "row",
                        }, {
                            caption: "Forma de Pago",
                            dataField: "FORMAPAGO",
                            width: 30,
                            area: "filter"
                        }, {
                            caption: "Documento",
                            dataField: "DOCUMENTO",
                            area: "row",
                        }, {
                            caption: "Glosa",
                            dataField: "GLOSA",
                            area: "row",
                        }, {
                            caption: "T. de Cambio",
                            dataField: "tcambio",
                            area: "filter",
                        }, {
                            caption: "Moneda",
                            dataField: "MONEDA",
                            area: "filter",
                        }, {
                            caption: "Fecha",
                            dataField: "Fecha",
                            area: "filter",
                        }, {
                            caption: "Fecha de Vencimiento",
                            dataField: "Vencimiento",
                            area: "filter",
                        }, {
                            caption: "Días Vencidos",
                            dataField: "VENCIDO",
                            area: "filter",
                        }, {
                            caption: "Importe Final",
                            dataField: "Importe",
                            dataType: "number",
                            summaryType: "sum",
                            format: {
                                type: "fixedPoint",
                                precision: 2
                            },
                            area: "data",
                        }, {
                            caption: "Importe",
                            dataField: "Importe",
                            dataType: "number",
                            summaryType: "sum",
                            format: {
                                type: "fixedPoint",
                                precision: 2
                            },
                            area: "data",
                        }, {
                            caption: "IMPORTEMOFN",
                            dataField: "IMPORTEMOFN",
                            dataType: "number",
                            summaryType: "sum",
                            format: {
                                type: "fixedPoint",
                                precision: 2
                            },
                            area: "data",
                        }, {
                            caption: "ImporteMEX",
                            dataField: "IMPORTEMEX",
                            dataType: "number",
                            summaryType: "sum",
                            format: {
                                type: "fixedPoint",
                                precision: 2
                            },
                            area: "data",
                        }, {
                            caption: "PAGOSMOF",
                            dataField: "PAGOSMOF",
                            dataType: "number",
                            summaryType: "sum",
                            format: {
                                type: "fixedPoint",
                                precision: 2
                            },
                            area: "data",
                        }, {
                            caption: "PAGOSMEX",
                            dataField: "PAGOSMEX",
                            dataType: "number",
                            summaryType: "sum",
                            format: {
                                type: "fixedPoint",
                                precision: 2
                            },
                            area: "data",
                        }, {
                            caption: "SaldoMOF",
                            dataField: "SALDOMOF",
                            dataType: "number",
                            summaryType: "sum",
                            format: {
                                type: "fixedPoint",
                                precision: 2
                            },
                            area: "data",
                        }, {
                            caption: "SaldoMEX",
                            dataField: "SALDOMEX",
                            dataType: "number",
                            summaryType: "sum",
                            format: {
                                type: "fixedPoint",
                                precision: 2
                            },
                            area: "data",
                        }, {
                            caption: "Tipo de Venta",
                            dataField: "tipo_venta",
                            area: "filter",
                        }, {
                            caption: "Detalle Documento",
                            dataField: "detalle",
                            area: "filter",
                        }
                    ],
                    store: data
                }
            });

            $("#reset").dxButton({
                text: "Reset the PivotGrid's State",
                onClick: function () {
                    pivotgrid.getDataSource().state({});
                }
            });

        }
    </script>
</asp:Content>

