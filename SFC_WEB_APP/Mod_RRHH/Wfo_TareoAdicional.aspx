<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_TareoAdicional.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_TareoAdicional" %>

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

   <script src="../Content/DevExtreme/number.min.js"></script>

    <script src="../Content/DevExtreme/message.min.js"></script>
    <script src="../Content/DevExtreme/currency.min.js"></script>
    <script src="../Content/DevExtreme/date.min.js"></script>
    <script src="../Content/DevExtreme/jszip.min.js"></script>
    <script src="../Content/DevExtreme/dx.all.js"></script>
    <script src="../Content/DevExtreme/dx.messages.es.js"></script>
    <script src="../Content/DevExtreme/supplemental.js"></script>
    <script src="../Content/DevExtreme/es.js"></script>

<%--    <script src="https://cdn3.devexpress.com/jslib/21.1.4/js/dx.all.js"></script>--%>


    <style>
        /*.dx-freespace-row {
            height: 0px !important;
        }*/

        #DataGrid {
            width: 100%;
            font-size: 10px;
            max-height: 70vh
        }

        /*.long-title h3 {
            font-family: 'Segoe UI Light', 'Helvetica Neue Light', 'Segoe UI', 'Helvetica Neue', 'Trebuchet MS', Verdana;
            font-weight: 200;
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
        }

        #gridContainer {*/
            /* height: 70vh;*/
        /*}

        .options {
            padding: 0px;
            margin-top: 0px;
        }

        .caption {
            font-size: 15px;
            font-weight: 500;
        }

        .option {
            margin-top: 0px;
        }

        .dx-datagrid-rowsview .dx-row > .dx-master-detail-cell {
            padding: 15px;
        }*/

        /* ft calendar customization */
        /*.fc-cal-date-normal-fusion {
            color: #5F5F5F;
            font-family: 'Source Sans Pro';
            font-size: 11px;
        }

        .fc-cal-date-selected-fusion {
            color: #FEFEFE;
            font-family: 'Source Sans Pro SemiBold';
            font-size: 11px;
        }

        #chartdiv {
            width: 100%;
            height: 500px;
        }

        .dx-datagrid-rowsview {*/
            /*overflow: auto; width: 100%; min-height: 15vh !important;*/
        /*}

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
        }*/
        #data-grid-demo {
            min-height: 700px;
        }

        .options {
            margin-top: 20px;
            padding: 20px;
            background: #f5f5f5;
        }

        .options .caption {
            font-size: 18px;
            font-weight: 500;
        }

        .option {
            margin-top: 10px;
        }

        .option > span {
            width: 120px;
            display: inline-block;
        }

        .option > .dx-widget {
            display: inline-block;
            vertical-align: middle;
            width: 100%;
            max-width: 350px;
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
    <section id="cell-background2" class="section-cabecera" style="">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Tareas Adicionales
                                    <div class="row">
                                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="DivFeContc" style="display: none">
                                            <label for="txtFeCont">Periodo</label>
                                            <input type="text" id="txtPeriodoc" name="txtPeriodoc" autocomplete="off" class="form-control" placeholder="YYYYMM">
                                            <script type="text/javascript">
                                                $(function () {
                                                    $('#txtPeriodoc').datetimepicker({
                                                        format: 'YYYYMM',
                                                        locale: 'es'
                                                    });
                                                    $(function () {
                                                        $('#DivFeContc').datetimepicker({
                                                            format: 'YYYYMM',
                                                            locale: 'es'
                                                        });
                                                    });
                                                });
                                            </script>
                                        </div>
                                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                            <label for="btnBusc">Planilla</label>
                                            <select class="form-control" id="txtPlanillac" name="">
                                                <option value="" selected disabled>Seleccione</option>
<%--                                                <option value="EJE">EJECUTIVOS AL 9%</option>
                                                <option value="EMP">EJECUTIVOS AL 4%</option>
                                                <option value="EPF">EMPLEADOS REGIMEN AGRARIO</option>
                                                <option value="ERG">EMPLEADOS REGIMEN GENERAL</option>--%>
                                                <option value="HVG">OBREROS REG.GENERAL DE CAMPO</option>
                                                <option value="OAC">OBR.REG.AGRARIO DE CAMPO DIARIO</option>
                                                <option value="OAS">OBR.REG.AGRARIO DE CAMPO SEMESTRAL</option>
                                                <option value="OBR">OBREROS X CAMPAÑA</option>
<%--                                                <option value="OCG">** NO USAR ** OBREROS FUNDO HACIENDA GRANDE</option>
                                                <option value="OHV">** NO USAR ** OBREROS FUNDO SANTA ANA</option>--%>
                                                <option value="ORG">OBREROS X CAMPAÑA REG. GENERAL</option>
<%--                                                <option value="PRA">PRACTICAS PREPROFESIONAL</option>
                                                <option value="PRO">PRACTICAS PROFESIONAL</option>
                                                <option value="PSF">** NO USAR ** OBREROS FUNDO HUARANGAL</option>
                                                <option value="SNT">PRACTICANTE SENATI</option>--%>
                                            </select>
                                        </div>
                                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id=""  style="display: none">
                                            <label for="txtFeInicio">Semana</label>
                                            <div id="txtSemanac" class="form-control"></div>  
                                        </div>
                                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <label for="btnBusc">Fundo</label>
                                            <div id="Fundosc"></div>
                                        </div>
                                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
                                            <label for="btnBusc">&nbsp;</label>
                                            <button type="button" id="btnRead" class="btn btn-primary col-12">
                                                <i class="fas fa-note"></i> Cargar Tareos Adicionales
                                            </button>
                                        </div>
                                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="BtnNew">
                                            <label for="btnBusc">&nbsp;</label>
                                            <button type="button" id="btnNew" class="btn btn-secondary col-12">
                                                <i class="fas fa-plus"></i> Nuevo
                                            </button>
                                        </div>
                                    </div>
                        </h4>
                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li><a data-action="expand" class="maheight"><i class="ft-maximize"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body card-dashboard" style="min-height: 30vh">
                            <div id="container-y" class="device-mobile-tablet-container">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="cell-background" class="section-detail" style="display: none">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Nuevo Documento
                                    <div class="row">
                                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-1 pb-0 mb-0" id="DivFeCont">
                                            <label for="txtFeCont">Periodo</label>
                                            <input type="text" id="txtPeriodo" name="txtPeriodo" autocomplete="off" class="form-control" placeholder="YYYYMM">
                                             <script type="text/javascript">
                                                 $(function () {
                                                     $('#txtPeriodo').datetimepicker({
                                                         format: 'YYYYMM',
                                                         locale: 'es'
                                                     });
                                                     $(function () {
                                                         $('#DivFeCont').datetimepicker({
                                                             format: 'YYYYMM',
                                                             locale: 'es'
                                                         });
                                                     });
                                                 });
                                             </script>
                                        </div>
                                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivCampania">
                                            <label for="txtFeInicio">Semana</label>
                                            <div id="txtSemana" class="form-control"></div>  
                                        </div>
                                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <label for="btnBusc">Planilla</label>
                                            <select class="form-control" id="txtPlanilla" name="txtFundo">
                                                <option value="" selected disabled>Seleccione</option>
<%--                                                <option value="EJE">EJECUTIVOS AL 9%</option>
                                                <option value="EMP">EJECUTIVOS AL 4%</option>
                                                <option value="EPF">EMPLEADOS REGIMEN AGRARIO</option>
                                                <option value="ERG">EMPLEADOS REGIMEN GENERAL</option>--%>
                                                <option value="HVG">OBREROS REG.GENERAL DE CAMPO</option>
                                                <option value="OAC">OBR.REG.AGRARIO DE CAMPO DIARIO</option>
                                                <option value="OAS">OBR.REG.AGRARIO DE CAMPO SEMESTRAL</option>
                                        <option value="OBR">OBREROS X CAMPAÑA</option>
   <%--                                                     <option value="OCG">** NO USAR ** OBREROS FUNDO HACIENDA GRANDE</option>
                                                <option value="OHV">** NO USAR ** OBREROS FUNDO SANTA ANA</option>--%>
                                                <option value="ORG">OBREROS X CAMPAÑA REG. GENERAL</option>
<%--                                                <option value="PRA">PRACTICAS PREPROFESIONAL</option>
                                                <option value="PRO">PRACTICAS PROFESIONAL</option>
                                                <option value="PSF">** NO USAR ** OBREROS FUNDO HUARANGAL</option>
                                                <option value="SNT">PRACTICANTE SENATI</option>--%>
                                            </select>
                                        </div>
                                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <label for="btnBusc">Fundo</label>
                                            <div id="Fundos"></div>
                                        </div>
                                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-1 pb-0 mb-0">
                                            <label for="btnBusc">&nbsp;</label>
                                            <button type="button" id="btnRec" class="btn btn-primary col-12">
                                                <i class="fas fa-clipboard"></i> Cargar
                                            </button>
                                        </div>
                                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="BtnSave" style="display: none">
                                            <label for="btnBusc">&nbsp;</label>
                                            <button type="button" id="btnRec2" class="btn btn-success col-12">
                                                <i class="fas fa-save"></i> Guardar
                                            </button>
                                        </div>
                                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="divSearch">
                                            <label for="btnBusc">&nbsp;</label>
                                            <button type="button" id="BtnSearcht" class="btn btn-secondary col-12">
                                                <i class="fas fa-save"></i> Buscar Tareos
                                            </button>
                                        </div>
                                    </div>
                        </h4>
                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li id="btn-excel" style="display: none"><a id='excelExport' title="Exportar en Excel"><i class="fas fa-file-excel"></i></a></li>
                                <li id="btn-pdf" style="display: none"><a id='pdfExport' title="Exportar en Pdf"><i class="fas fa-file-pdf"></i></a></li>
                                <li id="btn-expand" style="display: none"><a id='expandall' title="Expandir Grupos"><i class="fas fa-angle-double-down"></i></a></li>
                                <li id="btn-collapse" style="display: none"><a id='collapseall' title="Collapsar Grupos"><i class="fas fa-angle-double-up"></i></a></li>
                                <li><a data-action="expand" id="xpand1" class="maheight"><i class="ft-maximize"></i></a></li>
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


        <script>

            $("#btnNew").click(function () {
                $('#cell-background2').hide();
                $('#cell-background').show();
            });

            $("#BtnSearcht").click(function () {
                $('#cell-background2').show();
                $('#cell-background').hide();
            });

            LoadFundo();

            function LoadFundo() {

                var obj = new Object();
                obj.vcType = 'FUN';
                obj.vcId = '';
                obj.vnIdc = '';
                $.ajax({
                    type: 'POST',
                    url: "../SerAgro.asmx/ListParametrosNis",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        var searchBox = $("#Fundos").dxSelectBox({
                            dataSource: lst,
                            displayExpr: 'FUNDO',
                            valueExpr: 'IDFUNDO',
                            placeholder: "Seleccione",
                            noDataText: "Sin Datos",
                        }).dxSelectBox("instance");

                        var searchBox = $("#Fundosc").dxSelectBox({
                            dataSource: lst,
                            displayExpr: 'FUNDO',
                            valueExpr: 'IDFUNDO',
                            placeholder: "Seleccione",
                            noDataText: "Sin Datos",
                        }).dxSelectBox("instance");
                    },
                    error: function (error) {
                        alert(JSON.stringify(error));
                    }
                });
            }

            function semanas(periodo, anio, sem) {

                var obj = new Object();
                obj.vcAnio = anio;
                obj.vcPeriodo = periodo;
                $.ajax({
                    type: 'POST',
                    url: "../SerAgro.asmx/ListSemana",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);


                        var searchBox = $("#txtSemana").dxSelectBox({
                            dataSource: lst,
                            displayExpr: 'SEMANADESC',
                            valueExpr: 'SEMANA',
                            placeholder: "Seleccione",
                            noDataText: "Sin Datos",
                        }).dxSelectBox("instance");
                    },
                    error: function (error) {
                        alert(JSON.stringify(error));
                    }, complete: function (d) {
                        if (sem != '') {
                            $("#txtSemana").dxSelectBox("instance").option('value', sem);
                        }
                    }
                });
            }

            function semanasc(periodo, anio) {

                var obj = new Object();
                obj.vcAnio = anio;
                obj.vcPeriodo = periodo;
                $.ajax({
                    type: 'POST',
                    url: "../SerAgro.asmx/ListSemana",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);


                        var searchBox = $("#txtSemanac").dxSelectBox({
                            dataSource: lst,
                            displayExpr: 'SEMANADESC',
                            valueExpr: 'SEMANA',
                            placeholder: "Seleccione",
                            noDataText: "Sin Datos",
                        }).dxSelectBox("instance");
                    },
                    error: function (error) {
                        alert(JSON.stringify(error));
                    }
                });
            }

            var dataGrid;

            function Cargartabla(data, personal, concepto, dias) {
                if (data[0].nImportado == 1) {
                    var editx = 0;
                    $('#BtnSave').hide();
                } else {
                    var editx = 1;
                    $('#BtnSave').show();
                }

                DevExpress.localization.locale('es');
                $('#container-x').html('<div id="DataGrid"></div>');

                dataGrid = $("#DataGrid").dxDataGrid({
                    dataSource: data,
                    keyExpr: "cCodigo",
                    showBorders: true,
                    paging: {
                        enabled: false
                    },
                    editing: {
                        mode: "cell",
                        allowUpdating: editx,
                        allowAdding: editx,
                        allowDeleting: editx,
                        //selectTextOnEditStart: true,
                        //startEditAction: "click"
                    },

                    allowColumnReordering: true,
                    allowColumnResizing: true,
                    columnMinWidth: 20,
                    columnAutoWidth: true,
                    columnChooser: {
                        enabled: true
                    },
                    columnFixing: {
                        enabled: true
                    },
                    //wordWrapEnabled: true,
                    showColumnLines: true,
                    showRowLines: true,
                    rowAlternationEnabled: true,
                    showBorders: true,
                    export: {
                        enabled: true,
                        fileName: "Reporte Tareo Adicional "
                    },
                    filterRow: {
                        visible: true,
                        applyFilter: "auto"
                    },
                    searchPanel: {
                        visible: true,
                        //width: 240,
                        placeholder: "Buscar..."
                    },
                    columns: [
                        {
                            caption: '#',
                            cellTemplate: function (cellElement, cellInfo) {
                                cellElement.text(cellInfo.row.rowIndex + 1)
                            },
                            width: 50,
                        },
                        {
                            dataField: "cCodigo",
                            caption: "DNI",
                            width: 90, 
                            //setCellValue: function (rowData, value) {
                            //    rowData.cNroDocumento = value;
                            //    rowData.cNombres = value;
                            //},
                            //lookup: {
                            //    dataSource: personal,
                            //    valueExpr: "cNroDocumento",
                            //    displayExpr: "codnombre",
                            //    searchExpr: 'codnombre',
                            //}
                        },
                        {
                            dataField: "cNombres",
                            caption: "Nombres",
                            width: 250, 
                        },
                        {
                            dataField: "nDia1",
                            caption: dias[0].dia1,
                            visible: dias[0].act1,
                            width: 70,
                            dataType: "number",
                            setCellValue: function (rowData, value, columnFieldNameOrId) {
                                rowData.nDia1 = value;
                                cant = sum(value, columnFieldNameOrId.nDia2, columnFieldNameOrId.nDia3, columnFieldNameOrId.nDia4, columnFieldNameOrId.nDia5, columnFieldNameOrId.nDia6, columnFieldNameOrId.nDia7);

                                rowData.nCantidad = cant;
                                if (typeof columnFieldNameOrId.nBasico === 'undefined' || columnFieldNameOrId.nBasico == null || columnFieldNameOrId.nBasico == '') {
                                    basic = 0;
                                    rowData.nMonto = 0;
                                } else {
                                    basic = columnFieldNameOrId.nBasico;
                                }
                                sumacant = parseFloat(cant) * parseFloat(basic)

                                rowData.nMonto = parseFloat(sumacant.toFixed(2));
                            },
                            cellTemplate: function (container, options) {
                                if (options.value > 0) {
                                    $("<div>")
                                        .append(options.value)
                                        .css("color", "red")
                                        .css("font-weight", "bold")
                                        .css("font-size", "12px")
                                        .appendTo(container);

                                } else {
                                    if (options.value < 0 || options.value === '') {
                                        var celc = '0';
                                    } else {
                                        var celc = '0';
                                    }
                                    $("<div>")
                                        .append(celc)
                                        .appendTo(container);
                                }
                            }                            
                        }, {
                            dataField: "nDia2",
                            caption: dias[0].dia2,
                            visible: dias[0].act2,
                            width: 70,
                            dataType: "number",
                            setCellValue: function (rowData, value, columnFieldNameOrId) {
                                if (value < 0 || value === null) {
                                    value = 0;
                                }
                                rowData.nDia2 = value;
                                cant = sum(columnFieldNameOrId.nDia1, value, columnFieldNameOrId.nDia3, columnFieldNameOrId.nDia4, columnFieldNameOrId.nDia5, columnFieldNameOrId.nDia6, columnFieldNameOrId.nDia7);
                                rowData.nCantidad = cant;
                                if (typeof columnFieldNameOrId.nBasico === 'undefined' || columnFieldNameOrId.nBasico == null || columnFieldNameOrId.nBasico == '') {
                                    basic = 0;
                                    rowData.nMonto = 0;
                                } else {
                                    basic = columnFieldNameOrId.nBasico;
                                }
                                sumacant = parseFloat(cant) * parseFloat(basic)

                                rowData.nMonto = parseFloat(sumacant.toFixed(2));
                            },
                            cellTemplate: function (container, options) {
                                if (options.value > 0) {
                                    $("<div>")
                                        .append(options.value)
                                        .css("color", "red")
                                        .css("font-weight", "bold")
                                        .css("font-size", "12px")
                                        .appendTo(container);

                                } else {
                                    if (options.value < 0 || options.value === '') {
                                        var celc = '0';
                                    } else {
                                        var celc = '0';
                                    }
                                    $("<div>")
                                        .append(celc)
                                        .appendTo(container);
                                }
                            }
                        }, {
                            dataField: "nDia3",
                            caption: dias[0].dia3,
                            visible: dias[0].act3,
                            width: 70,
                            dataType: "number",
                            setCellValue: function (rowData, value, columnFieldNameOrId) {
                                if (value < 0 || value === null) {
                                    value = 0;
                                }
                                rowData.nDia3 = value;
                                cant = sum(columnFieldNameOrId.nDia1, columnFieldNameOrId.nDia2, value, columnFieldNameOrId.nDia4, columnFieldNameOrId.nDia5, columnFieldNameOrId.nDia6, columnFieldNameOrId.nDia7);
                                rowData.nCantidad = cant;
                                if (typeof columnFieldNameOrId.nBasico === 'undefined' || columnFieldNameOrId.nBasico == null || columnFieldNameOrId.nBasico == '') {
                                    basic = 0;
                                    rowData.nMonto = 0;
                                } else {
                                    basic = columnFieldNameOrId.nBasico;
                                }
                                sumacant = parseFloat(cant) * parseFloat(basic)

                                rowData.nMonto = parseFloat(sumacant.toFixed(2));
                            },
                            cellTemplate: function (container, options) {
                                if (options.value > 0) {
                                    $("<div>")
                                        .append(options.value)
                                        .css("color", "red")
                                        .css("font-weight", "bold")
                                        .css("font-size", "12px")
                                        .appendTo(container);

                                } else {
                                    if (options.value < 0 || options.value === '') {
                                        var celc = '0';
                                    } else {
                                        var celc = '0';
                                    }
                                    $("<div>")
                                        .append(celc)
                                        .appendTo(container);
                                }
                            }
                        }, {
                            dataField: "nDia4",
                            caption: dias[0].dia4,
                            visible: dias[0].act4,
                            width: 70,
                            dataType: "number",
                            setCellValue: function (rowData, value, columnFieldNameOrId) {
                                if (value < 0 || value === null) {
                                    value = 0;
                                }
                                rowData.nDia4 = value;
                                cant = sum(columnFieldNameOrId.nDia1, columnFieldNameOrId.nDia2, columnFieldNameOrId.nDia3, value, columnFieldNameOrId.nDia5, columnFieldNameOrId.nDia6, columnFieldNameOrId.nDia7);
                                rowData.nCantidad = cant;
                                if (typeof columnFieldNameOrId.nBasico === 'undefined' || columnFieldNameOrId.nBasico == null || columnFieldNameOrId.nBasico == '') {
                                    basic = 0;
                                    rowData.nMonto = 0;
                                } else {
                                    basic = columnFieldNameOrId.nBasico;
                                }
                                sumacant = parseFloat(cant) * parseFloat(basic)

                                rowData.nMonto = parseFloat(sumacant.toFixed(2));
                            },
                            cellTemplate: function (container, options) {
                                if (options.value > 0) {
                                    $("<div>")
                                        .append(options.value)
                                        .css("color", "red")
                                        .css("font-weight", "bold")
                                        .css("font-size", "12px")
                                        .appendTo(container);

                                } else {
                                    if (options.value < 0 || options.value === '') {
                                        var celc = '0';
                                    } else {
                                        var celc = '0';
                                    }
                                    $("<div>")
                                        .append(celc)
                                        .appendTo(container);
                                }
                            }
                        }, {
                            dataField: "nDia5",
                            caption: dias[0].dia5,
                            visible: dias[0].act5,
                            width: 70,
                            dataType: "number",
                            setCellValue: function (rowData, value, columnFieldNameOrId) {
                                if (value < 0 || value === null) {
                                    value = 0;
                                }
                                rowData.nDia5 = value;
                                cant = sum(columnFieldNameOrId.nDia1, columnFieldNameOrId.nDia2, columnFieldNameOrId.nDia3, columnFieldNameOrId.nDia4, value, columnFieldNameOrId.nDia6, columnFieldNameOrId.nDia7);
                                rowData.nCantidad = cant;
                                if (typeof columnFieldNameOrId.nBasico === 'undefined' || columnFieldNameOrId.nBasico == null || columnFieldNameOrId.nBasico == '') {
                                    basic = 0;
                                    rowData.nMonto = 0;
                                } else {
                                    basic = columnFieldNameOrId.nBasico;
                                }
                                sumacant = parseFloat(cant) * parseFloat(basic)

                                rowData.nMonto = parseFloat(sumacant.toFixed(2));
                            },
                            onCellClick: function (e) {
                                alert(e.column.dataField);
                }  ,
                            cellTemplate: function (container, options) {
                                if (options.value > 0) {
                                    $("<div>")
                                        .append(options.value)
                                        .css("color", "red")
                                        .css("font-weight", "bold")
                                        .css("font-size", "12px")
                                        .appendTo(container);

                                } else {
                                    if (options.value < 0 || options.value === '') {
                                        var celc = '0';
                                    } else {
                                        var celc = '0';
                                    }
                                    $("<div>")
                                        .append(celc)
                                        .appendTo(container);
                                }
                            }
                        }, {
                            dataField: "nDia6",
                            caption: dias[0].dia6,
                            visible: dias[0].act6,
                            width: 70,
                            dataType: "number",
                            setCellValue: function (rowData, value, columnFieldNameOrId) {
                                if (value < 0 || value === null) {
                                    value = 0;
                                }
                                rowData.nDia6 = value;
                                cant = sum(columnFieldNameOrId.nDia1, columnFieldNameOrId.nDia2, columnFieldNameOrId.nDia3, columnFieldNameOrId.nDia4, columnFieldNameOrId.nDia5, value, columnFieldNameOrId.nDia7);
                                rowData.nCantidad = cant;
                                if (typeof columnFieldNameOrId.nBasico === 'undefined' || columnFieldNameOrId.nBasico == null || columnFieldNameOrId.nBasico == '') {
                                    basic = 0;
                                    rowData.nMonto = 0;
                                } else {
                                    basic = columnFieldNameOrId.nBasico;
                                }
                                sumacant = parseFloat(cant) * parseFloat(basic)

                                rowData.nMonto = parseFloat(sumacant.toFixed(2));
                            },
                            cellTemplate: function (container, options) {
                                if (options.value > 0) {
                                    $("<div>")
                                        .append(options.value)
                                        .css("color", "red")
                                        .css("font-weight", "bold")
                                        .css("font-size", "12px")
                                        .appendTo(container);

                                } else {
                                    if (options.value < 0 || options.value === '') {
                                        var celc = '0';
                                    } else {
                                        var celc = '0';
                                    }
                                    $("<div>")
                                        .append(celc)
                                        .appendTo(container);
                                }
                            }
                        }, {
                            dataField: "nDia7",
                            caption: dias[0].dia7,
                            visible: dias[0].act7,
                            width: 70,
                            dataType: "number",
                            setCellValue: function (rowData, value, columnFieldNameOrId) {
                                if (value < 0 || value === null) {
                                    value = 0;
                                }
                                rowData.nDia7 = value;
                                cant = sum(columnFieldNameOrId.nDia1, columnFieldNameOrId.nDia2, columnFieldNameOrId.nDia3, columnFieldNameOrId.nDia4, columnFieldNameOrId.nDia5, columnFieldNameOrId.DIA6, value);
                                rowData.nCantidad = cant;
                                if (typeof columnFieldNameOrId.nBasico === 'undefined' || columnFieldNameOrId.nBasico == null || columnFieldNameOrId.nBasico == '') {
                                    basic = 0;
                                    rowData.nMonto = 0;
                                } else {
                                    basic = columnFieldNameOrId.nBasico;
                                }
                                sumacant = parseFloat(cant) * parseFloat(basic)

                                rowData.nMonto = parseFloat(sumacant.toFixed(2));
                            },
                            cellTemplate: function (container, options) {
                                if (options.value > 0) {
                                    $("<div>")
                                        .append(options.value)
                                        .css("color", "red")
                                        .css("font-weight", "bold")
                                        .css("font-size", "12px")
                                        .appendTo(container);

                                } else {
                                    if (options.value < 0 || options.value === '') {
                                        var celc = '0';
                                    } else {
                                        var celc = '0';
                                    }
                                    $("<div>")
                                        .append(celc)
                                        .appendTo(container);
                                }
                            }
                        }, {
                            dataField: "nCantidad",
                            caption: "Cantidad",
                            width: 70,
                            dataType: "number",
                            allowEditing: false,
                            cellTemplate: function (container, options) {
                                $("<div>")
                                    .append(options.value)
                                    .css("color", "#66799a")
                                    .css("font-weight", "bold")
                                    .css("font-size", "12px")
                                    .appendTo(container);
                            }
                        },		
                        {
                            dataField: "nBasico",
                            dataType: "Basico",
                            dataType: "number",
                            width: 70,
                            setCellValue: function (rowData, value, columnFieldNameOrId) {
                                if (value < 0 || value === null) {
                                    value = 0;
                                }
                                rowData.nBasico = value;
                                if (typeof columnFieldNameOrId.nCantidad === 'undefined' || columnFieldNameOrId.nCantidad == null || columnFieldNameOrId.nCantidad == '') {
                                    cant = 0;
                                } else {
                                    cant = columnFieldNameOrId.nCantidad;
                                }

                                if (typeof value === 'undefined' || value == null || value == '') {
                                    basic = 0;
                                } else {
                                    basic = value;
                                }
                                sumacant = parseFloat(cant) * parseFloat(basic)

                                rowData.nMonto = parseFloat(sumacant.toFixed(2));
                            },
                            cellTemplate: function (container, options) {
                                if (options.value > 0) {
                                    $("<div>")
                                        .append(options.value)
                                        .css("color", "red")
                                        .css("font-weight", "bold")
                                        .css("font-size", "12px")
                                        .appendTo(container);

                                } else {
                                    if (options.value < 0 || options.value === '') {
                                        var celc = '0';
                                    } else {
                                        var celc = '0';
                                    }
                                    $("<div>")
                                        .append(celc)
                                        .appendTo(container);
                                }
                            }
                        }, {
                            dataField: "nMonto",
                            dataType: "nMonto",
                            allowEditing: false,
                            width: 70,
                            dataType: "number",
                            cellTemplate: function (container, options) {
                                $("<div>")
                                    .append(options.value)
                                    .css("color", "#66799a")
                                    .css("font-weight", "bold")
                                    .css("font-size", "12px")
                                    .appendTo(container);
                            }
                        },{
                            dataField: "cObservacion",
                            caption: "cObservacion",
                            width: 325,
                            //lookup: {
                            //    dataSource: states,
                            //    displayExpr: "Name",
                            //    valueExpr: "ID"
                            //}

                        }, {
                            dataField: "cIdConcepto",
                            caption: "cIdConcepto",
                            width: 325,
                            lookup: {
                                dataSource: concepto,
                                displayExpr: "NOMBRE",
                                valueExpr: "IDCONCEPTO"
                            }

                        }
                    ]
                }).dxDataGrid("instance");



            };



            function cleardetail (){
                $('#txtPeriodo').data("DateTimePicker").clear();
                $("#txtSemana").dxSelectBox("reset");
                $('#Fundos').dxSelectBox("reset");
            }

            function clearcabecera() {
                $('#txtPeriodoc').data("DateTimePicker").clear();
                $("#txtSemanac").dxSelectBox("reset");
                $('#Fundosc').dxSelectBox("reset");
            }



            $("#btnRec2").click(function () {
                var obj = new Object();
                obj.vcPeriodo = $('#txtPeriodo').val();
                if (obj.vcPeriodo == "") {
                    toastr.error('', 'Seleccione Periodo');
                    $('#container-x').html('');
                    return;
                }
                if ($("#txtSemana").dxSelectBox('instance').option('selectedItem') != null) {
                    obj.vcSemana = $("#txtSemana").dxSelectBox('instance').option('selectedItem').SEMANA;
                } else {
                    obj.vcSemana = ''
                }
                if ($("#Fundos").dxSelectBox('instance').option('value') != null) {
                    obj.vcValor = $("#Fundos").dxSelectBox('instance').option('value');
                } else {
                    obj.vcValor = ''
                }
                obj.vnIdPlanilla = $("#txtPlanilla option:selected").val();
                if (obj.vnIdPlanilla == "") {
                    toastr.error('', 'Seleccione Planilla');
                    $('#container-x').html('');
                    return;
                }
                var dataItems = dataGrid.getDataSource().items()
                
                if (obj.vcPeriodo != "" && obj.vcSemana != '' && obj.vcValor != '') {
                    $.ajax({
                        type: 'POST',
                        url: "../SerAgro.asmx/RegiTareoJornal",
                        data: JSON.stringify({ obj: obj, arrayTaa: dataItems}),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            if (lst != '') {

                                toastr.success(JSON.stringify(lst), 'Registro Exitoso');
                            } else {
                                toastr.error('Verifique los Datos', 'ERROR');
                            }

                        },
                        error: function (error) {
                            toastr.error(JSON.stringify(error), '');
                            $('#BtnSave').hide();
                        }
                    });

                } else {
                    $('#container-x').html('');
                    toastr.error('Ingrese los datos correspondientes', 'Faltan datos');
                    $('#BtnSave').hide();
                }

            });

            $("#btnRec").click(function () {
                var obj = new Object();
                obj.vcPeriodo = $('#txtPeriodo').val();
                if (obj.vcPeriodo == "") {
                    toastr.error('', 'Seleccione Periodo');
                    $('#container-x').html('');
                    return;
                }
                if ($("#txtSemana").dxSelectBox('instance').option('selectedItem') != null) {
                    obj.vcSemana = $("#txtSemana").dxSelectBox('instance').option('selectedItem').SEMANA;
                } else {
                    obj.vcSemana = ''
                }
                obj.vnIdPlanilla = $("#txtPlanilla option:selected").val();
                if (obj.vnIdPlanilla == "") {
                    toastr.error('', 'Seleccione Planilla');
                    $('#container-x').html('');
                    return;
                }
                if ($("#Fundos").dxSelectBox('instance').option('value') != null) {
                    obj.vcValor = $("#Fundos").dxSelectBox('instance').option('value');
                } else {
                    obj.vcValor = ''
                }

                ViewReport(obj);
            });

            function ViewReport(obj) {
                $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');

                if (obj.vcPeriodo != "" && obj.vcSemana != '' && obj.vcValor != '') {
                    $.ajax({
                        type: 'POST',
                        url: "../SerAgro.asmx/ListTareoJornal",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            if (lst != '') {
                                console.log(JSON.stringify(lst.d3));
                                Cargartabla(lst.d1, lst.d2, lst.d3, lst.d4);
                            } else {
                                toastr.success('Verifique los Datos', 'ERROR');
                            }

                        },
                        error: function (error) {
                            toastr.error(JSON.stringify(error), '');
                            $('#BtnSave').hide();
                        }
                    });

                } else {
                    $('#container-x').html('');
                    toastr.error('Ingrese los datos correspondientes', 'Faltan datos');
                }

            };

            function SyncTareo(periodo, semana, fundo, planilla, concepto) {

                $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                var obj = new Object();
                obj.vcPeriodo = periodo;
                obj.vcSemana = semana;
                obj.vcIdFundo = fundo;
                obj.vnIdPlanilla = planilla;
                obj.vcIdConcepto = concepto;

                if (obj.vcPeriodo != "" && obj.vcSemana != '' && obj.vcValor != '') {
                    $.ajax({
                        type: 'POST',
                        url: "../SerAgro.asmx/SyncTareasAdicionales",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            if (lst != '') {
                                toastr.success('sync', JSON.stringify(lst));
                            } else {
                                toastr.error('Verifique los Datos', 'ERROR');
                            }

                        },
                        error: function (error) {
                            toastr.error(JSON.stringify(error), '');
                            $('#BtnSave').hide();
                        }
                    });

                } else {
                    $('#container-x').html('');
                    toastr.error('Ingrese los datos correspondientes', 'Faltan datos');
                }

            };

            $("#btnRead").click(function () {
                LoadTareos()
            });

            function LoadTareos() {
                $('#container-y').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                var obj = new Object();
                obj.vcPeriodo = $('#txtPeriodoc').val();
                //if ($("#txtSemanac").dxSelectBox('instance').option('selectedItem') != null) {
                //    obj.vcSemana = $("#txtSemanac").dxSelectBox('instance').option('selectedItem').SEMANA;
                //} else {
                    obj.vcSemana = ''
                //}
                if ($("#Fundosc").dxSelectBox('instance').option('value') != null) {
                    obj.vcValor = $("#Fundosc").dxSelectBox('instance').option('value');
                } else {
                    obj.vcValor = ''
                }
                obj.vnIdPlanilla = $("#txtPlanillac option:selected").val();
                if (obj.vnIdPlanilla == "") {
                    toastr.error('', 'Seleccione Planilla');
                    $('#container-y').html('');
                    return;
                }
                //alert(JSON.stringify(obj));
                    $.ajax({
                        type: 'POST',
                        url: "../SerAgro.asmx/ListTareoAdicional",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            if (lst != '') {

                                CargarCabecera(lst);
                            } else {
                                $('#container-y').html('<center>no se encontraron registros</center>');
                                toastr.warning('Verifique los Datos', 'Sin Datos');
                            }

                        },
                        error: function (error) {
                            toastr.error(JSON.stringify(error), '');
                        }
                    });


            };

            function CargarCabecera(data) {

                DevExpress.localization.locale('es');
                $('#container-y').html('<div id="DataGridCabe"></div>');

                dataGrid = $("#DataGridCabe").dxDataGrid({
                    dataSource: data,
                    showBorders: true,
                    paging: {
                        enabled: false
                    },

                    allowColumnReordering: true,
                    allowColumnResizing: true,
                    columnMinWidth: 40,
                    columnAutoWidth: true,
                    columnChooser: {
                        enabled: true
                    },
                    columnFixing: {
                        enabled: true
                    },
                    //wordWrapEnabled: true,
                    showColumnLines: true,
                    showRowLines: true,
                    rowAlternationEnabled: true,
                    showBorders: true,
                    export: {
                        enabled: true,
                        fileName: "Reporte Resumen Tareos Adicional "
                    },
                    filterRow: {
                        visible: true,
                        applyFilter: "auto"
                    },
                    searchPanel: {
                        visible: true,
                        //width: 240,
                        placeholder: "Buscar..."
                    },
                    columns: [
                        {
                            caption: '#',
                            cellTemplate: function (cellElement, cellInfo) {
                                cellElement.text(cellInfo.row.rowIndex + 1)
                            },
                            width: 50,
                        }
                        , { dataField: "cPeriodo", caption: "Periodo" }
                        , { dataField: "cSemana", caption: "Semana" }
                        , { dataField: "cIdFundo", caption: "cIdFundo", visible: false }
                        , { dataField: "fundo", caption: "Fundo"}
                        , { dataField: "cIdplanilla", caption: "Idplanilla", visible: false }
                        , { dataField: "DESCRIPCION", caption: "Planilla" }
                        , { dataField: "cIdConcepto", caption: "cIdConcepto", visible: false }
                        , { dataField: "Concepto", caption: "Concepto"}
                        , { dataField: "trabajadores", caption: "N° trabajadores"}
                        , {
                            dataField: "horas", caption: "total horas",
                            format: function (value) {
                                return formatNumber.new(value.toFixed(2));
                            }
                            , dataType: "number"
                            , alignment: "right"
                        }
                        , {
                            dataField: "total", caption: "total adicional",
                            fomat: function (value) {
                                return formatNumber.new(value.toFixed(2));
                            }
                            , dataType: "number"
                            , alignment: "right"
                        }
                        , {
                            type: "buttons",
                            buttons: [
                                {
                                    icon: "export",
                                    hint: "Importar Nisira",
                                    onClick: function (e) {
                                        SyncTareo(e.row.data.cPeriodo, e.row.data.cSemana, e.row.data.cIdFundo, e.row.data.cIdplanilla, e.row.data.cIdConcepto);
                                        e.event.preventDefault();
                                    },
                                    visible: function (e) {
                                        if (e.row.data.nImportado == 0) {
                                            return true;
                                        } else {
                                            return false
                                        }
                                    }
                                },
                                {
                                    icon: "edit",
                                    hint: "Editar",
                                    onClick: function (e) {
                                        var obj = new Object();
                                        obj.vcPeriodo = e.row.data.cPeriodo;
                                        obj.vcSemana = e.row.data.cSemana;
                                        obj.vnIdPlanilla = e.row.data.cIdplanilla;
                                        obj.vcValor = e.row.data.cIdFundo;
                                         
                                        semanas(e.row.data.cPeriodo, e.row.data.cPeriodo.substr(0, 4), e.row.data.cSemana);

                                        $('#txtPeriodo').val(e.row.data.cPeriodo);
                                        $("#txtPlanilla").val(e.row.data.cIdplanilla).change();
                                        $("#Fundos").dxSelectBox("instance").option('value', e.row.data.cIdFundo);

                                        $('#cell-background2').hide();
                                        $('#cell-background').show();
                                        ViewReport(obj);
                                        e.event.preventDefault();
                                    }
                                    ,
                                    visible: function (e) {
                                        if (e.row.data.nImportado == 0) {
                                            return true;
                                        } else {
                                            return false
                                        }
                                    }
                                },
                                ,
                                {
                                    icon: "file",
                                    hint: "Ver Documento",
                                    onClick: function (e) {
                                        var obj = new Object();
                                        obj.vcPeriodo = e.row.data.cPeriodo;
                                        obj.vcSemana = e.row.data.cSemana;
                                        obj.vnIdPlanilla = e.row.data.cIdplanilla;
                                        obj.vcValor = e.row.data.cIdFundo;

                                        semanas(e.row.data.cPeriodo, e.row.data.cPeriodo.substr(0, 4), e.row.data.cSemana);

                                        $('#txtPeriodo').val(e.row.data.cPeriodo);
                                        $("#txtPlanilla").val(e.row.data.cIdplanilla).change();
                                        $("#Fundos").dxSelectBox("instance").option('value', e.row.data.cIdFundo);

                                        $('#cell-background2').hide();
                                        $('#cell-background').show();
                                        ViewReport(obj);
                                        e.event.preventDefault();
                                    }
                                    ,
                                    visible: function (e) {
                                        if (e.row.data.nImportado == 1) {
                                            return true;
                                        } else {
                                            return false
                                        }
                                    }
                                },
                                //,{
                                //icon: "trash",
                                //hint: "Delete",
                                //onClick: function (e) {
                                //    deleteReport(e.row.data.nIdOrdenEmbarque);
                                //    e.event.preventDefault();
                                //}
                                //}
                                //,{
                                //icon: "message",
                                //hint: "Enviar",
                                //onClick: function (e) {
                                //    SendReport(e.row.data.nIdOrdenEmbarque);
                                //    e.event.preventDefault();
                                //}
                                //}
                            ]
                        }

                    ]
                })
            };

            function simpleStringify(object) {
                var simpleObject = {};
                for (var prop in object) {
                    if (!object.hasOwnProperty(prop)) {
                        continue;
                    }
                    if (typeof (object[prop]) == 'object') {
                        continue;
                    }
                    if (typeof (object[prop]) == 'function') {
                        continue;
                    }
                    simpleObject[prop] = object[prop];
                }
                return JSON.stringify(simpleObject); // returns cleaned up JSON
            };





            function sum(d1, d2, d3, d4, d5, d6, d7) {
                if (typeof d1 === 'undefined' || d1 == null || d1 == '') {
                    di1 = 0;
                } else {
                    di1 = d1;
                }

                if (typeof d2 === 'undefined' || d2 == null || d2 == '') {
                    di2 = 0;
                } else {
                    di2 = d2;
                }

                if (typeof d3 === 'undefined' || d3 == null || d3 == '') {
                    di3 = 0;
                } else {
                    di3 = d3;
                }

                if (typeof d4 === 'undefined' || d4 == null || d4 == '') {
                    di4 = 0;
                } else {
                    di4 = d4;
                }

                if (typeof d5 === 'undefined' || d5 == null || d5 == '') {
                    di5 = 0;
                } else {
                    di5 = d5;
                }

                if (typeof d6 === 'undefined' || d6 == null || d6 == '') {
                    di6 = 0;
                } else {
                    di6 = d6;
                }

                if (typeof d7 === 'undefined' || d7 == null || d7 == '') {
                    di7 = 0;
                } else {
                    di7 = d7;
                }

                sumaic = parseFloat(di1) + parseFloat(di2) + parseFloat(di3) + parseFloat(di4) + parseFloat(di5) + parseFloat(di6) + parseFloat(di7)
                $('#BtnSave').show();
                return parseFloat(sumaic.toFixed(2));
            }


            $('#txtPeriodo').on('dp.change', function (e) {
                var formatedValue = e.date.format(e.date._f);

                //console.log($('#txtPeriodo').val().substr(0, 4));
                if ($('#txtPeriodo').val().length == 6) {
                    semanas($('#txtPeriodo').val(), $('#txtPeriodo').val().substr(0, 4));
                }
            })


            $('#txtPeriodoc').on('dp.change', function (e) {
                var formatedValue = e.date.format(e.date._f);

                //console.log($('#txtPeriodoc').val().substr(0, 4));
                if ($('#txtPeriodoc').val().length == 6) {
                    semanasc($('#txtPeriodoc').val(), $('#txtPeriodoc').val().substr(0, 4));
                }
            })

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
        </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
