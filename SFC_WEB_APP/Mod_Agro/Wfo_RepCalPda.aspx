<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_RepCalPda.aspx.cs" Inherits="SFC_WEB_APP.Mod_Agro.Wfo_RepCalPda" %>

    <%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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

    <style>
       .dx-freespace-row {
            height: 0px !important;
        }

        #DataGrid {
            width: 100%;
            height: 70vh;
        }

        .long-title h3 {
            font-family: 'Segoe UI Light', 'Helvetica Neue Light', 'Segoe UI', 'Helvetica Neue', 'Trebuchet MS', Verdana;
            font-weight: 200;
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
        }

        #gridContainer {
            height: 100vh;
        }

        .options {
            padding: 0px;
            margin-top: 0px;
        }

        .caption {
            /*font-size: 10px;*/
            font-weight: 500;
        }

        .option {
            margin-top: 0px;
        }

        .dx-datagrid-rowsview .dx-row > .dx-master-detail-cell {
            padding: 15px;
        }

        .dx-datagrid .dx-row > td {
            padding-top: 10px;
            padding-bottom: 10px;
            /*font-size: 10px;*/
            line-height: 20px;
        }

        #gridTopScroll {
            width: 1000px;
            height: 20px;
            overflow-x: scroll;
            overflow-y: hidden;
        }

        .dx-scrollable-container {
            overflow: auto !important;
        }

        .dx-scrollbar-hoverable {
            display: none;
        }


        /*        .dx-datagrid-drag-action {
            background-color: #667ca5 !important;
            color: white !important;
        }

        .dx-datagrid-headers {
            background-color: #667ca5 !important;
        }*/

        .table th {
            padding: 0.8rem 0.4rem !important;
            /*font-size: 10px*/
        }

        .table td {
            padding: 0.8rem 0.4rem !important;
            /*font-size: 10px;*/
            font-weight: 600;
        }

        .highcharts-credits {
            display: none !important;
        }

        #tbOperaciones {
            height: auto;
            width: 100%;
            color: black;
            font-weight: bold;
            font-size: 10px !important;
            min-height: 30vh;
            max-height: 70vh;
        }

        .dx-datagrid-headers .dx-datagrid-table .dx-row > td {
            border-bottom: 1px solid #e0e0e0;
            padding-top: 10px;
            padding-bottom: 10px;
            line-height: 16px;
            font-weight: 500;
           /* font-size: 10px;*/
        }

        .dx-editor-cell .dx-texteditor .dx-texteditor-input {
            background: rgba(255,255,255,0);
            /*font-size: 10px;*/
            height: 48px;
            line-height: 48px;
            padding: 0 10px;
            margin-top: 0;
        }

        #table-sfe{
            height: 300px;
        }

        #table-adl{
            height: 300px;
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

        <div class="row">
                       <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <label>Formato</label>
                            <div id="cFormato" class="form-control"></div>  
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <label>Fundo</label>
                            <div id="cIdAlmacen" class="form-control"></div>  
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0" id="DivFeIni">
                            <label for="txtFeCont">Desde</label>
                            <input type="text" id="txtFeIni" name="txtFeIni" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
                            <script type="text/javascript">
                                $(function () {
                                    $('#txtFeIni').datetimepicker({
                                        format: 'DD/MM/YYYY',
                                        locale: 'es'
                                    });
                                    $(function () {
                                        $('#DivFeIni').datetimepicker({
                                            format: 'DD/MM/YYYY',
                                            locale: 'es'
                                        });
                                    });
                                });
                            </script>
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0" id="DivFeFin">
                            <label for="txtFeCont">Hasta</label>
                            <input type="text" id="txtFeFin" name="txtFeFin" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
                            <script type="text/javascript">
                                $(function () {
                                    $('#txtFeFin').datetimepicker({
                                        format: 'DD/MM/YYYY',
                                        locale: 'es'
                                    });
                                    $(function () {
                                        $('#DivFeFin').datetimepicker({
                                            format: 'DD/MM/YYYY',
                                            locale: 'es'
                                        });
                                    });
                                });
                            </script>
                        </div>


                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0">
                            <label for="btnBusc">&nbsp;</label>
                            <button type="button" id="btnBusc" class="btn btn-secondary col-12">
                                <i class="fas fa-search"></i> Recuperar
                            </button>
                        </div>
    </div>
    
    
    <br />
        <section id="cell-background" style="">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Reporte Agro Calidad</h4>
                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li id="btn-excel" style="display: none"><a id='excelExport' title="Exportar en Excel"><i class="fas fa-file-excel"></i></a></li>
                                <li id="btn-pdf" style="display: none"><a id='pdfExport' title="Exportar en Pdf"><i class="fas fa-file-pdf"></i></a></li>
                                <li id="btn-expand" style="display: none"><a id='expandall' title="Expandir Grupos"><i class="fas fa-angle-double-down"></i></a></li>
                                <li id="btn-collapse" style="display: none"><a id='collapseall' title="Collapsar Grupos"><i class="fas fa-angle-double-up"></i></a></li>
                                <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body card-dashboard">
                            <div id="container-x" class="device-mobile-tablet-container">
                                   
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
         <script src="../Scripts/sweetalert2.js"></script>
        <script>

            function LoadAlmacen(id) {

                var obj = new Object();
                obj.vcFormato = id;
                $.ajax({
                    type: 'POST',
                    url: "../SerCali.asmx/ListAlmacenesCalidad",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        var searchBox = $("#cIdAlmacen").dxSelectBox({
                            dataSource: lst,
                            displayExpr: 'descripcion',
                            valueExpr: 'codigo',
                            placeholder: "Seleccione",
                            noDataText: "Sin Datos",
                            searchEnabled: true,
                        }).dxSelectBox("instance");


                        $('#cIdAlmacen').dxSelectBox({
                            items: lst,
                            value: lst[0],
                            onValueChanged(frt) {
                                if (frt.value['codigo'] === undefined) {
                                    //LoadSubGrupo(frt.value, bd)
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
            LoadAlmacen('');

            function LoadFormato(bd) {

                var obj = new Object();

                $.ajax({
                    type: 'POST',
                    url: "../SerCali.asmx/ListFormatosCalidad",
                    // data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        var searchBox = $("#cFormato").dxSelectBox({
                            dataSource: lst,
                            displayExpr: 'descripcion',
                            valueExpr: 'idvariable',
                            placeholder: "Seleccione",
                            noDataText: "Sin Datos",
                            searchEnabled: true,
                        }).dxSelectBox("instance");

                        $('#cFormato').dxSelectBox({
                            items: lst,
                            value: lst[0],
                            onValueChanged(frt) {
                                if (frt.value['idvariable'] === undefined) {
                                    LoadAlmacen(frt.value)
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
            LoadFormato();
            //var searchBox2 = $("#cIdAlmacen").dxSelectBox({
            //    placeholder: "Seleccione",
            //    noDataText: "Sin Datos",
            //}).dxSelectBox("instance");

            $("#btnBusc").click(function () {
                cargatabla();
            });


            function cargatabla() {
                var obj = new Object();
                if ($("#cFormato").dxSelectBox('instance').option('selectedItem') != null) {
                    obj.vcFormato = $("#cFormato").dxSelectBox('instance').option('selectedItem').idvariable;
                } else {
                    toastr.error('', 'Seleccione Formato');
                    return;
                }

                if ($("#cIdAlmacen").dxSelectBox('instance').option('selectedItem') != null) {
                    obj.vcIdAlmacen = $("#cIdAlmacen").dxSelectBox('instance').option('selectedItem').codigo;
                } else {
                    toastr.error('', 'Seleccione Fundo');
                    return;
                }
                obj.vcFechaIni = $("#txtFeIni").val();
                if (obj.vcFechaIni == null) {
                    toastr.error('', 'Seleccione Rango de Fecha Inicio');
                    return;
                } else {
                    var str1 = $('#txtFeIni').val();
                    var res1 = str1.split("/", 3);
                    obj.vcFechaIni = res1[2] + res1[1] + res1[0];
                }
                obj.vcFechaFin = $("#txtFeFin").val();
                if (obj.vcFechaFin == null) {
                    toastr.error('', 'Seleccione Rango de Fecha Fin');
                    return;
                } else {
                    var str2 = $('#txtFeFin').val();
                    var res2 = str2.split("/", 3);
                    obj.vcFechaFin = res2[2] + res2[1] + res2[0];
                }

                obj.vcAppxCultivo = '';
                obj.vcPorcentajes = '0';


                //  var f = new Date();
                //alert(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
                        $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                        $.ajax({
                            type: 'POST',
                            url: "../SerCali.asmx/Rep_Certificado_Calidad",
                            data: JSON.stringify({ obj: obj }),
                            dataType: 'json',
                            contentType: 'application/json; charset=utf-8',
                            error: function () {
                                $('#activos').hide();
                            },
                            success: function (data) {
                                var lst = JSON.parse(data.d);
                                $('#container-x').html('<div class="options"><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="DataGrid"></div>');
                                TbDataGrid(lst);
                            },
                            error: function (data) {
                                alert(JSON.stringify(data));
                            },
                            timeout: 50000
                        });

            }

            function TbDataGrid(data, vfecha) {
                DevExpress.localization.locale('es');

                var dataGrid = $("#DataGrid").dxDataGrid({
                    dataSource: data,
                    scrolling: {
                        mode: "virtual"
                    },
                    grouping: {
                        autoExpandAll: false
                    },
                    groupPanel: {
                        visible: true,
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
                    export: {
                        enabled: true,
                        fileName: "Reporte "
                    },

                    filterRow: {
                        visible: true,
                        applyFilter: "auto"
                    },
                    filterRow: { visible: true },
                    filterPanel: { visible: true },
                    headerFilter: { visible: true },
                    //filterValue: [["dia1", "<>", "0"]],
                    //filterBuilderPopup: {
                    //    position: { of: window, at: "top", my: "top", offset: { y: 10 } },
                    //},
                    searchPanel: {
                        visible: false,
                        placeholder: "Search..."
                    },
                    headerFilter: {
                        visible: false
                    },
                    //  groupIndex: 0,
                    //columns: [
                    //      { caption: 'Fecha', dataField: 'Fecha'}
                    //    , { caption: 'Serie', dataField: 'cab_serie'}
                    //    , { caption: 'Numero', dataField: 'cab_numero'}
                    //    , { caption: 'Supervisor', dataField: 'Supervisor'}
                    //    , { caption: 'Evaluador', dataField: 'Evaluador_agrp'}
                    //    , { caption: 'Fundo', dataField: 'Fundo'}
                    //    , { caption: 'Lote', dataField: 'Lote' }
                    //    , { caption: 'Variedad', dataField: 'Variedad'}
                    //    , { caption: 'Cosechador', dataField: 'Cosechador'}
                    //    , { caption: 'Calibre_cosechar', dataField: 'Calibre_cosechar'}
                    //    , { caption: 'Frutos_Revisados', dataField: 'Frutos_Revisados'}
                    //    , { caption: 'Fuera_Calibre', dataField: 'Fuera_Calibre'}
                    //    , { caption: 'Sin_Pedunculo', dataField: 'Sin_Pedunculo'}
                    //    , { caption: 'Ped_Largo', dataField: 'Ped_Largo'}
                    //    , { caption: 'Danio_Tijera', dataField: 'Danio_Tijera',  }
                    //    , { caption: 'Golpe', dataField: 'Golpe'}
                    //    , { caption: 'Lentecelosis', dataField: 'Lentecelosis'}
                    //    , { caption: 'Danio_Sol', dataField: 'Danio_Sol'}
                    //    , { caption: 'Virado', dataField: 'Virado'}
                    //    , { caption: 'Queresa', dataField: 'Queresa'}
                    //    , { caption: 'Chanchito', dataField: 'Chanchito'}
                    //    , { caption: 'Pinnaspis', dataField: 'Pinnaspis'}
                    //    , { caption: 'Observación_1', dataField: 'Observación_1'}
                    //    , { caption: 'Observación_2', dataField: 'Observación_2'}
                    //    , { caption: 'Observación_3', dataField: 'Observación_3' }
                    //    , { caption: 'cab_idcertificado', dataField: 'cab_idcertificado', visible: false }

                    //],
                    sortByGroupSummaryInfo: [{
                        summaryItem: "count"
                    }],
                }).dxDataGrid("instance");

                $("#autoExpand").dxCheckBox({
                    value: false,
                    text: "Expandir todos los grupos",
                    onValueChanged: function (data) {
                        dataGrid.option("grouping.autoExpandAll", data.value);
                    }
                });

                $("#filterRow").dxCheckBox({
                    text: "Filtro de filas",
                    value: false,
                    onValueChanged: function (data) {
                        dataGrid.clearFilter();
                        dataGrid.option("filterRow.visible", data.value);
                        // applyFilterModeEditor.option("disabled", !data.value);
                    }
                });

                $("#headerFilter").dxCheckBox({
                    text: "Filtro de encabezado",
                    value: false,
                    onValueChanged: function (data) {
                        dataGrid.clearFilter();
                        dataGrid.option("headerFilter.visible", data.value);
                    }
                });

            }


            var formatNumber = {
                separador: ",", // separador para los miles
                sepDecimal: '.', // separador para los decimales
                formatear: function (num) {
                    num += '';
                    var splitStr = num.split('.');
                    var splitLeft = splitStr[0];
                    var splitRight = splitStr.length > 1 ? this.sepDecimal + splitStr[1] : '';
                    var regx = /(\d+)(\d{3})/;
                    while (regx.test(splitLeft)) {
                        splitLeft = splitLeft.replace(regx, '$1' + this.separador + '$2');
                    }
                    return this.simbol + splitLeft + splitRight;
                },
                new: function (num, simbol) {
                    this.simbol = simbol || '';
                    return this.formatear(num);
                }
            }

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
                return ('0' + fecha.getDate()).slice(-2) + "/" + ('0' + (fecha.getMonth() + 1)).slice(-2) + "/" + fecha.getFullYear();
            }
        </script>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
