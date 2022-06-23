<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ReporteAnalisisCompras.aspx.cs" Inherits="SFC_WEB_APP.Mod_Logi.Wfo_ReporteAnalisisCompras" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    

    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <!--LIBRERIA DE BOOSTRAP 5 -->
    <%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    <!-- js databales -->
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.light.css" />

    <script src="../Content/DevExtreme/cldr.min.js"></script>
    <script src="../Content/DevExtreme/event.min.js"></script>
    <script src="../Content/DevExtreme/supplemental.min.js"></script>
    <script src="../Content/DevExtreme/unresolved.min.js"></script>
    <script src="../Content/DevExtreme/globalize.min.js"></script>
    <%--<script src="../Content/DevExtreme/number.min.js"></script>--%>
    <script src="../Content/DevExtreme/message.min.js"></script>
    <%--   <script src="../Content/DevExtreme/currency.min.js"></script>
    <script src="../Content/DevExtreme/date.min.js"></script>--%>
    <script src="../Content/DevExtreme/jszip.min.js"></script>
    <script src="../Content/DevExtreme/dx.all.js"></script>
    <script src="../Content/DevExtreme/dx.messages.es.js"></script>
    <script src="../Content/DevExtreme/supplemental.js"></script>
    <script src="../Content/DevExtreme/es.js"></script>

    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/print.min.css" />
    <script src="../Content/DevExtreme/print.min.js"></script>

     <script src="../Scripts/sweetalert2.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- fin js databales -->

    <!-- linreria de select 2 -->
    <%--<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>--%>
    <style>
        .dx-freespace-row {
            height: 0px !important;
        }

        .long-title h3 {
            font-family: 'Segoe UI Light', 'Helvetica Neue Light', 'Segoe UI', 'Helvetica Neue', 'Trebuchet MS', Verdana;
            font-weight: 200;
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
        }

        @media print {
            body, .printjsa, .dx-scrollable-content {
                display: block !important;
                position: relative !important;
                width: auto !important;
                height: auto !important;
                overflow: visible !important;
                margin-left: 0 !important;
                display: block !important; /* Not really needed in all cases */
                position: relative !important;
                width: auto !important;
                height: auto !important;
                overflow: visible !important;
            }
        }

        #gridContainer {
            height: 60vh;
        }

        #DataGrid {
            height: auto;
            width: 100%;
            color: black;
            font-weight: bold;
            font-size: 10px;
            height: 60vh;
        }

        .options {
            padding: 0px;
            margin-top: 0px;
        }

        .caption {
            font-size: 18px;
            font-weight: 500;
        }

        .option {
            margin-top: 0px;
        }

        .dx-datagrid-rowsview .dx-row > .dx-master-detail-cell {
            padding: 15px;
        }

        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
<!-- Inicio   del font -->
    <div class="shadow p-3 mb-5 bg-body rounded bg-white">
<div class=" mb-12">
  <div class="card-header border border-3 border-success text-center"> <h5>Reporte y Análisis de Compras - Servicios</h5> </div>
  <div class="card-body border border-1">
        <div class="row">
            <div class="col-md-5">
                <div class="row">
                    <div class="col-sm-6">
                        <label for="" class="form-label">Fecha Inicio (*)</label>
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text bg-success"><i class="fa fa-calendar text-white"></i></span>
                          </div>
                            <input type="text" name="fecha_ini_reg" id="fecha_ini" class="form-control"/>
                            <script type="text/javascript">
                                $(function () {
                                    $('#fecha_ini').datetimepicker({
                                        format: 'DD/MM/YYYY',
                                        locale: 'es'
                                    });
                                });
                            </script>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <label for="" class="form-label">Fecha Fin (*)</label>
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text bg-success" ><i class="fa fa-calendar text-white"></i></span>
                          </div>
                          <input type="text" name="fecha_fin_reg" id="fecha_fin" class="form-control"/>
                            <script type="text/javascript">
                                $(function () {
                                    $('#fecha_fin').datetimepicker({
                                        format: 'DD/MM/YYYY',
                                        locale: 'es'
                                    });
                                });
                            </script>
                        </div>
                    </div>
                </div> 
            </div>
            <div class="col-md-3 mt-2">
                <button type="button" class="btn btn-info mt-4" onclick="reporte_analisis_compras();">Consultar  |   <i class="fa fa-search"></i></button>
            </div>
        </div>
      <hr />
      <!--  datagrid mostrar datos-->
      <div class="col-md-12">
                <div class="card">
                    <div class="card-content collapse show">
                        <div class="card-body card-dashboard" id="container-tbdist">
                            <div id="tbOperaciones">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
<!-- datagrid mostrar datos -->
  </div>
</div>
        </div>
<!-- fin   del font -->
<script>
    window.addEventListener('load', function () {
        // fecha actual
        asignar_dia_actual_mes();

    });

    //  funcion asignar dia actual del mes actual
    function asignar_dia_actual_mes() {
        var fecha_actual_sistema = new Date();
        var mes = fecha_actual_sistema.getMonth() + 1; //obteniendo mes
        var dia = fecha_actual_sistema.getDate(); //obteniendo dia
        if (dia < 10) {
            dia = "0" + dia;
        } else {
            dia = dia;
        }

        if (mes < 10) {
            mes = "0" + mes;
        } else {
            mes = mes;
        }
        var anio = fecha_actual_sistema.getFullYear(); //obteniendo año
        var fecha_actual = dia + "/" + mes + "/" + anio;

        $("#fecha_ini").val(fecha_actual);
        $("#fecha_fin").val(fecha_actual);
    }

    // funcion para mostrar el reporte.
    function reporte_analisis_compras() {
        var fecha_inicio = document.getElementById("fecha_ini").value;
        var fecha_fin = document.getElementById("fecha_fin").value;

        // valdimos la fecha.
        var fecha_corte_ini = fecha_inicio.split("/");
        var dia_1 = fecha_corte_ini[0];
        var mes_1 = fecha_corte_ini[1];
        var anio_1 = fecha_corte_ini[2];

        fecha_inicio = dia_1 + "-" + mes_1 + "-" + anio_1;

        var fecha_corte_fin = fecha_fin.split("/");
        var dia_2 = fecha_corte_fin[0];
        var mes_2 = fecha_corte_fin[1];
        var anio_2 = fecha_corte_fin[2];

        fecha_fin = dia_2 + "-" + mes_2 + "-" + anio_2;

        // validamos  las fechas de inicio y fecha fin 
        if (fecha_inicio.length) {
            if (fecha_fin.length) {
                var fecha_inicio_val = new Date(fecha_inicio);
                var fecha_fin_val = new Date(fecha_fin);
                
                if (fecha_inicio_val < fecha_fin_val || fecha_inicio_val.getTime() == fecha_fin_val.getTime() || isNaN(fecha_inicio_val) || isNaN(fecha_fin_val)) {
                    $('#tbOperaciones').html('<div class="text-center bold"><img src="../img/loading3.gif" width="200px" alt="loading" /><br/>Un momento, por favor...</div>');

                    var obj = new Object();
                    obj.REPORTE_FECHA_INICIO = fecha_inicio;
                    obj.REPORTE_FECHA_FIN = fecha_fin;
                    $.ajax({
                        type: 'POST',
                        url: "../SerLogi.asmx/SER_reporte_analisis_compra",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            $('#tbOperaciones').html('<div id="data_grid"></div>');
                            TbDataGrid(lst);
                        },
                        error: function (data) {
                            alert(JSON.stringify(data));
                        }
                    });

                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un problema ...',
                        text: 'La FECHA INICIO debe de ser menor o igual a la FECHA FIN !',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'La FECHA FIN esta vacío !',
                })
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'La FECHA INICIO esta vacío  !',
            })
        }

        function TbDataGrid(data) {
            DevExpress.localization.locale('es');

            var dataGrid = $("#data_grid").dxDataGrid({
                dataSource: data,
                scrolling: {
                    mode: "virtual"
                },
                grouping: {
                    autoExpandAll: true
                },
                selection: {
                    mode: "single" // or "multiple" | "none"
                },
                onCellPrepared: function (e) {
                    if (e.rowType === 'header') {
                        e.cellElement.css("backgroundColor", "#2f394a" /*"#2f394a"*/);
                        e.cellElement.css("color", "#fff");
                    }
                },
                groupPanel: {
                    visible: true
                },
                allowColumnReordering: true,
                allowColumnResizing: true,
                columnMinWidth: 30,
                columnAutoWidth: true,
                showBorders: true,
                columnChooser: {
                    enabled: true
                },
                columnFixing: {
                    enabled: true
                },


                //wordWrapEnabled: true,
                showBorders: true,

                //editing: {
                //    mode: "row",
                //    allowDeleting: true,
                //    useIcons: true,
                //    width: 50
                //},

                export: {
                    enabled: true,
                    fileName: "Reporte de Análisis de Compras - Servicios"
                },

                filterRow: {
                    visible: false,
                    applyFilter: "auto"
                },
                searchPanel: {
                    visible: false,
                    placeholder: "Buscar..."
                },
                filterRow: {
                    visible: true
                },
                headerFilter: {
                    visible: true
                },
                sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }]

            }).dxDataGrid("instance");

        };
    }
</script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
