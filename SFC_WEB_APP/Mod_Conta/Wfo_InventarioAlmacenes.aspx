<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_InventarioAlmacenes.aspx.cs" Inherits="SFC_WEB_APP.Mod_Conta.Wfo_InventarioAlmacenes" %>

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
        .dx-freespace-row {
            height: 0px !important;
        }

        #DataGrid {
            width: 100%;
            font-size: 10px;
            max-height: 70vh
        }

        .long-title h3 {
            font-family: 'Segoe UI Light', 'Helvetica Neue Light', 'Segoe UI', 'Helvetica Neue', 'Trebuchet MS', Verdana;
            font-weight: 200;
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
        }

        #gridContainer {
            height: 70vh;
        }

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
        }

        ft calendar customization
        .fc-cal-date-normal-fusion {
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

        .dx-datagrid-rowsview {
            overflow: auto;
            width: 100%;
            min-height: 15vh !important;
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




        /*-------------Navbar fijo datagrid---------------*/
        .dx-scrollable-container {
            overflow: auto !important;
        }

        .dx-scrollbar-hoverable {
            display: none;
        }
        /*-------------Navbar fijo datagrid---------------*/
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
                        <h4 class="card-title pb-2">Inventarios
                        </h4>
                        <div class="row">

                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
                                <label for="btnBusc">Empresa</label>
                                <div id="cIdEmpresa" class="form-control"></div>
                            </div>
                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
                                <label for="btnBusc">Sucursal</label>
                                <div id="cIdSucursal" class="form-control"></div>
                            </div>
                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
                                <label for="btnBusc">Almacen</label>
                                <div id="cIdAlmacen" class="form-control"></div>
                            </div>
                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="DivFeIni">
                                <label for="txtFeCont">Recuperar Desde</label>
                                <input type="text" id="txtFechaIni" name="txtFechaIni" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy" />
                                <script type="text/javascript">
                                    $(function () {
                                        $('#txtFechaIni').datetimepicker({
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
                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="DivFeFin">
                                <label for="txtFeCont">Recuperar Hasta</label>
                                <input type="text" id="txtFechaFin" name="txtFechaFin" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy" />
                                <script type="text/javascript">
                                    $(function () {
                                        $('#txtFechaFin').datetimepicker({
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

                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
                                <label for="btnBusc">&nbsp;</label>
                                <button type="button" id="btnRead" class="btn btn-primary col-12">
                                    <i class="fas fa-search"></i>Consultar
                                </button>
                            </div>
                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="BtnNew" style="display: none">
                                <label for="btnBusc">&nbsp;</label>
                                <button type="button" id="btnNew" class="btn btn-blue col-12">
                                    <i class="fas fa-plus"></i>Nuevo
                                </button>
                            </div>
                            <input type="hidden"  id="cIdInventario" value="0"/>
                            <input type="hidden"  id="cSerie" value="0"/>
                            <input type="hidden"  id="cNumero" value="0"/>
                        </div>
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
                    <div class="card-header" style="background: gainsboro;">
                        <h4 class="card-title pb-2">Nuevo Documento </h4>
                        <div class="row">
                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
                                <label for="btnBusc">Empresa</label>
                                <div id="_cIdEmpresa" class="form-control"></div>
                            </div>
                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
                                <label for="btnBusc">Sucursal</label>
                                <div id="_cIdSucursal" class="form-control"></div>
                            </div>
                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
                                <label for="btnBusc">Almacen</label>
                                <div id="_cIdAlmacen" class="form-control"></div>
                            </div>
                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="DivFechaDoc">
                                <label for="txtFeCont">FECHA</label>
                                <input type="text" id="_cFechaDoc" name="_cFechaDoc" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy" />
                                <script type="text/javascript">
                                    $(function () {
                                        $('#_cFechaDoc').datetimepicker({
                                            format: 'DD/MM/YYYY',
                                            locale: 'es'
                                        });
                                        $(function () {
                                            $('#DivFechaDoc').datetimepicker({
                                                format: 'DD/MM/YYYY',
                                                locale: 'es'
                                            });
                                        });
                                    });
                                </script>
                            </div>
                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
                                <label for="btnBusc">RESPONSABLE</label>
                                <div id="_cIdResponsable" class="form-control"></div>
                            </div>
 
                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="BtnSavev" style="display: none">
                                <label for="btnBusc">&nbsp;</label>
                                <div id="saveChangesButton"></div>
                            </div>
                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="divLoad" style="display: none">
                                <label for="BtnEdit">&nbsp;</label>
                                <button type="button" id="BtnLoad" class="btn btn-success col-12">
                                    <img src="../img/loading.gif?v=2" height="20" /> Cargando...
                                </button>
                            </div>
                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="divEdit" style="display: none">
                                <label for="BtnEdit">&nbsp;</label>
                                <button type="button" id="BtnEdit" class="btn btn-warning col-12" >
                                    <i class="fas fa-edit"></i> Editar
                                </button>
                            </div>

                        </div>

                        <div class="row">

                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="divSearch">
                                <label for="BtnSearcht">&nbsp;</label>
                                <button type="button" id="BtnSearcht" class="btn btn-danger col-12">
                                    <i class="fas fa-arrow-left"></i> Volver
                                </button>
                            </div>
                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="DivSerie" style="display: none">
                                <label for="txtFeCont">Serie</label>
                                <input type="text" id="vSerie" name="txtFechaIni" autocomplete="off" class="form-control" placeholder="0000" />
                            </div>
                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" id="DivNumero" style="display: none">
                                <label for="txtFeCont">Numero</label>
                                <input type="text" id="vNumero" name="txtFechaIni" autocomplete="off" class="form-control" placeholder="000000" />
                            </div>

                        </div>

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
                        <div class="card-body card-dashboard" style="min-height: 30vh">
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


            var vcIdEmpresa = $("#cIdEmpresa").dxSelectBox('instance').option('selectedItem').cIniciales;

            var vcIdSucursal = $("#cIdSucursal").dxSelectBox('instance').option('selectedItem').IDSUCURSAL;

            var vcIdAlmacen = $("#cIdAlmacen").dxSelectBox('instance').option('selectedItem').IDALMACEN;


            $("#_cIdEmpresa").dxSelectBox("instance").option('value', vcIdEmpresa);
            $("#_cIdSucursal").dxSelectBox("instance").option('value', vcIdSucursal);
            $("#_cIdAlmacen").dxSelectBox("instance").option('value', vcIdAlmacen);

            $('#_cIdEmpresa').dxSelectBox({ disabled: true });
            $('#_cIdSucursal').dxSelectBox({ disabled: true });
            $('#_cIdAlmacen').dxSelectBox({ disabled: true });


            ViewReport();
        });

        $("#BtnSearcht").click(function () {
            $('#cell-background2').show();
            $('#cell-background').hide();
        });

        function LoadEmpresa() {

            var obj = new Object();
            obj.vcIdEmpresa = '';
            $.ajax({
                type: 'POST',
                url: "../SerConta.asmx/ListEmpresaNis",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    var searchBoxe = $("#cIdEmpresa").dxSelectBox({
                        dataSource: lst,
                        displayExpr: 'cRazonSocialEmpr',
                        valueExpr: 'cIniciales',
                        placeholder: "Seleccione",
                        noDataText: "Sin Datos",
                    }).dxSelectBox("instance");

                    var searchBoxe = $("#_cIdEmpresa").dxSelectBox({
                        dataSource: lst,
                        displayExpr: 'cRazonSocialEmpr',
                        valueExpr: 'cIniciales',
                        placeholder: "Seleccione",
                        noDataText: "Sin Datos",
                    }).dxSelectBox("instance");

                    $('#cIdEmpresa').dxSelectBox({
                        items: lst,
                        value: lst[0],
                        onValueChanged(frt) {
                            if (frt.value['cIniciales'] === undefined) {
                                clearhead();
                                LoadSucursal(frt.value, '', 0);
                            }
                            //$('.current-value > span').text(data.value);
                        },
                    });

                    $('#_cIdEmpresa').dxSelectBox({
                        items: lst,
                        value: lst[0],
                        onValueChanged(frt) {
                            if (frt.value['cIniciales'] === undefined) {
                                // LoadSucursal(frt.value, '', 1);
                                //LoadGrupo(frt.value);
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
        LoadEmpresa();

        function LoadSucursal(bd, suc, create) {

            var obj = new Object();
            obj.vcIdEmpresa = bd;
            obj.vcIdSucursal = suc;
            $.ajax({
                type: 'POST',
                url: "../SerConta.asmx/ListSucursalNis",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    if (create === 0) {
                        var searchBox = $("#cIdSucursal").dxSelectBox({
                            dataSource: lst,
                            displayExpr: 'DESCRIPCION',
                            valueExpr: 'IDSUCURSAL',
                            placeholder: "Seleccione",
                            noDataText: "Sin Datos",
                        }).dxSelectBox("instance");

                        $('#cIdSucursal').dxSelectBox({
                            items: lst,
                            value: lst[0],
                            onValueChanged(frt) {
                                if (frt.value['IDSUCURSAL'] === undefined) {
                                    clearhead();
                                    LoadAlmacen(frt.value, bd, 0);
                                }
                                //$('.current-value > span').text(data.value);
                            },
                        });

                        var searchBox = $("#_cIdSucursal").dxSelectBox({
                            dataSource: lst,
                            displayExpr: 'DESCRIPCION',
                            valueExpr: 'IDSUCURSAL',
                            placeholder: "Seleccione",
                            noDataText: "Sin Datos",
                        }).dxSelectBox("instance");
                    }

                    if (create === 1) {
                        var searchBox = $("#_cIdSucursal").dxSelectBox({
                            dataSource: lst,
                            displayExpr: 'DESCRIPCION',
                            valueExpr: 'IDSUCURSAL',
                            placeholder: "Seleccione",
                            noDataText: "Sin Datos",
                        }).dxSelectBox("instance");

                        $('#_cIdSucursal').dxSelectBox({
                            items: lst,
                            value: lst[0],
                            onValueChanged(frt) {
                                if (frt.value['IDSUCURSAL'] === undefined) {
                                    // LoadAlmacen(frt.value, bd, 1)
                                }
                                //$('.current-value > span').text(data.value);
                            },
                        });
                    }
                },
                error: function (error) {
                    alert(JSON.stringify(error));
                }
            });
        }
        LoadSucursal('SFE', 0, 0)

        function LoadAlmacen(suc, bd, create) {

            var obj = new Object();
            obj.vcIdEmpresa = bd;
            obj.vcIdSucursal = suc;
            obj.vcIdAlmacen = '';
            $.ajax({
                type: 'POST',
                url: "../SerConta.asmx/ListAlmacenNis",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    if (create === 0) {
                        var searchBox = $("#cIdAlmacen").dxSelectBox({
                            dataSource: lst,
                            displayExpr: 'DESCRIPCION',
                            valueExpr: 'IDALMACEN',
                            placeholder: "Seleccione",
                            noDataText: "Sin Datos",
                        }).dxSelectBox("instance");

                        var searchBox = $("#_cIdAlmacen").dxSelectBox({
                            dataSource: lst,
                            displayExpr: 'DESCRIPCION',
                            valueExpr: 'IDALMACEN',
                            placeholder: "Seleccione",
                            noDataText: "Sin Datos",
                        }).dxSelectBox("instance");

                        $('#cIdAlmacen').dxSelectBox({
                            items: lst,
                            value: lst[0],
                            onValueChanged(frt) {
                                if (frt.value['IDALMACEN'] === undefined) {
                                    clearhead();
                                    // LoadSubGrupo(frt.value, bd)
                                }
                                //$('.current-value > span').text(data.value);
                            },
                        });
                    }

                    if (create === 1) {
                        var searchBox = $("#_cIdAlmacen").dxSelectBox({
                            dataSource: lst,
                            displayExpr: 'DESCRIPCION',
                            valueExpr: 'IDALMACEN',
                            placeholder: "Seleccione",
                            noDataText: "Sin Datos",
                        }).dxSelectBox("instance");



                        $('#_cIdAlmacen').dxSelectBox({
                            items: lst,
                            value: lst[0],
                            onValueChanged(frt) {
                                if (frt.value['IDALMACEN'] === undefined) {
                                    // LoadSubGrupo(frt.value, bd)
                                }
                                //$('.current-value > span').text(data.value);
                            },
                        });
                    }

                },
                error: function (error) {
                    alert(JSON.stringify(error));
                }
            });
        }
        LoadAlmacen('0', 'SFE', 0);


        function LoadResponsable(bd) {

            var obj = new Object();
            obj.vcIdEmpresa = bd;
            obj.vcIdResponsable = '';
            $.ajax({
                type: 'POST',
                url: "../SerConta.asmx/ListResponsableNis",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    var searchBox = $("#_cIdResponsable").dxSelectBox({
                        dataSource: lst,
                        displayExpr: 'NOMBRE',
                        valueExpr: 'IDRESPONSABLE',
                        placeholder: "Seleccione",
                        noDataText: "Sin Datos",
                        searchEnabled: true,
                    }).dxSelectBox("instance");
                },
                error: function (error) {
                    alert(JSON.stringify(error));
                }
            });
        }
        LoadResponsable('SFE');


        function clearhead() {
            //$('#container-y').html('<div id="DataGrid"></div>');
            var objs = new Object();
            CargarCabecera(objs);
            $('#BtnNew').hide();
        }

       var dataGrid2;

        function Cargartabla(data) {

            //if (data[0].nImportado == 1) {
            //    var editx = 0;
            //    $('#BtnSave').hide();
            //} else {
            //    var editx = 1;
            //    $('#BtnSave').show();
            //}

            DevExpress.localization.locale('es');
            $('#container-x').html('<div id="DataGrid2"></div>');

             dataGrid2 = $("#DataGrid2").dxDataGrid({
                dataSource: data,
                showBorders: true,
                paging: {
                    enabled: false
                },
                keyboardNavigation: {
                    enterKeyAction: 'moveFocus',
                    enterKeyDirection: 'column',
                    editOnKeyPress: true,
                },
                editing: {
                    mode: 'batch',
                    allowUpdating: true,
                    startEditAction: 'dblClick',
                },
                onFocusedCellChanging(e) {
                    e.isHighlighted = true;
                },

                allowColumnReordering: true,
                allowColumnResizing: true,
                columnMinWidth: 20,
                columnAutoWidth: true,

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
                    fileName: "Reporte Productos"
                },
                filterRow: {
                    visible: true,
                    applyFilter: "auto"
                },
                headerFilter: { visible: true },
                columns: [
                    {
                        caption: '#',
                        cellTemplate: function (cellElement, cellInfo) {
                            cellElement.text(cellInfo.row.rowIndex + 1)
                        },
                        width: 50,
                    },
                    {
                        dataField: "IDPRODUCTO",
                        caption: "Codigo Producto",
                        width: 120,
                        allowEditing: false,
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
                    }, {
                        dataField: "DESCRIPCION",
                        caption: "Nombre Producto",
                        width: 250,
                        allowEditing: false,
                    }, {
                        dataField: "IDMEDIDA",
                        caption: "Unid Medida",
                        allowEditing: false,
                    }, {
                        dataField: "IDGRUPO",
                        caption: "IDGRUPO",
                        allowEditing: false,
                        visible: false
                    }, {
                        dataField: "GRUPO",
                        caption: "Grupo",
                        allowEditing: false,
                    }, {
                        dataField: "IDSUBGRUPO",
                        caption: "IDSUBGRUPO",
                        allowEditing: false,
                        visible: false
                    }, {
                        dataField: "SUBGRUPO",
                        caption: "Sub Grupo",
                        allowEditing: false,
                    }, {
                        dataField: "CANTIDAD",
                        caption: "Cantidad",
                        visible: true,
                        width: 120,
                        fomat: function (value) {
                            return formatNumber.new(value.toFixed(2));
                        },
                        dataType: "number",
                        setCellValue: function (rowData, value, columnFieldNameOrId) {
                            if (value < 0 || value === null) {
                                value = 0;
                                value = Math.abs(value);
                                toastr.warning('No se admiten valores Negativos', 'NUMERO NEGATIVO');
                            }
                            rowData.CANTIDAD = value;
                        },
                        allowEditing: 1,
                    }
                ],
                onToolbarPreparing: function (e) {
                    var toolbarItems = e.toolbarOptions.items;
                    $.each(toolbarItems, function (_, item) {
                        if (item.name == "saveButton" || item.name == "revertButton") {
                            item.visible = false;
                        }
                    });
                },
                onCellPrepared: function (e) {
                    if (e.rowType === 'header') {
                        e.cellElement.css("backgroundColor", "#52617b" /*"#2f394a"*/);
                        e.cellElement.css("color", "#fff");
                    }
                }
            }).dxDataGrid("instance");

            $("#saveChangesButton").dxButton({
                text: "Actualizar Productos",
                onClick: function () {
                    var dataGrid2 = $("#DataGrid2").dxDataGrid("instance");
                    if (dataGrid2.hasEditData()) {
                        dataGrid2.saveEditData().then(() => {
                            if (!dataGrid2.hasEditData()) {
                                updateProductos();
                            } else {
                                toastr.error('Error al guardar recargue pagina', '');
                            }
                        });
                    }
                },
                elementAttr: {
                    class: "btn btn-success col-md-12"
                }
            });

            $('#divLoad').hide();
            $('#BtnSavev').show();

        };



        function cleardetail() {
            $('#txtPeriodo').data("DateTimePicker").clear();
            $("#txtSemana").dxSelectBox("reset");
            $('#Fundos').dxSelectBox("reset");
        }

        function clearcabecera() {
            $('#txtPeriodoc').data("DateTimePicker").clear();
            $("#txtSemanac").dxSelectBox("reset");
            $('#Fundosc').dxSelectBox("reset");
        }



        function updateProductos() {
            var obj = new Object();

            if ($("#_cIdEmpresa").dxSelectBox('instance').option('selectedItem') != null) {
                obj.vcIdEmpresa = $("#_cIdEmpresa").dxSelectBox('instance').option('selectedItem').cIniciales;
            } else {
                toastr.error('', 'Seleccione Empresa');
                return;
            }
            if ($("#_cIdSucursal").dxSelectBox('instance').option('value') != null) {
                obj.vcIdSucursal = $("#_cIdSucursal").dxSelectBox('instance').option('selectedItem').IDSUCURSAL;
            } else {
                toastr.error('', 'Seleccione Sucursal');
                return;
            }
            if ($("#_cIdAlmacen").dxSelectBox('instance').option('value') != null) {
                obj.vcIdAlmacen = $("#_cIdAlmacen").dxSelectBox('instance').option('selectedItem').IDALMACEN;
            } else {
                toastr.error('', 'Seleccione Almacen');
                return;
            }

            obj.vcFecha = $("#_cFechaDoc").val();
            if (obj.vcFecha === '') {
                toastr.error('', 'Ingrese Fecha Documento');
                return;
            }

            if ($("#_cIdResponsable").dxSelectBox('instance').option('value') != null) {
                obj.vcIdResponsable = $("#_cIdResponsable").dxSelectBox('instance').option('selectedItem').IDRESPONSABLE;
            } else {
                toastr.error('', 'Seleccione Responable');
                return;
            }

            obj.vcIdInventario = $("#cIdInventario").val();
            obj.vcSerie = $("#cSerie").val();
            obj.vcNumero = $("#cNumero").val();

            var dataItems = dataGrid2.getDataSource().items()

            if (obj.vdFechaIni != "" && obj.vcSemana != '' && obj.vcValor != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerConta.asmx/RegiInventario",
                    data: JSON.stringify({ obj: obj, arrayTaa: dataItems }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst != '') {

                            toastr.success(JSON.stringify(lst), 'Registro Exitoso');
                        } else {
                            toastr.error(JSON.stringify(lst), 'ERROR');
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

        };

        function ListInventarioUpdate(cIdInventario, cSerie, cNumero, fecha, responsable) {
            
            var obj = new Object();
            obj.vcIdEmpresa = '';
            obj.vcIdInventario = cIdInventario;
            obj.vcSerie = cSerie;
            obj.vcNumero = cNumero;

            $('#cell-background2').hide();
            $('#cell-background').show();


            var vcIdEmpresa = $("#cIdEmpresa").dxSelectBox('instance').option('selectedItem').cIniciales;

            var vcIdSucursal = $("#cIdSucursal").dxSelectBox('instance').option('selectedItem').IDSUCURSAL;

            var vcIdAlmacen = $("#cIdAlmacen").dxSelectBox('instance').option('selectedItem').IDALMACEN;


            $("#_cIdEmpresa").dxSelectBox("instance").option('value', vcIdEmpresa);
            $("#_cIdSucursal").dxSelectBox("instance").option('value', vcIdSucursal);
            $("#_cIdAlmacen").dxSelectBox("instance").option('value', vcIdAlmacen);

            $('#_cIdEmpresa').dxSelectBox({ disabled: true });
            $('#_cIdSucursal').dxSelectBox({ disabled: true });
            $('#_cIdAlmacen').dxSelectBox({ disabled: true });


            obj.vcFecha = fecha;
            if (obj.vcFecha === '') {
                toastr.error('', 'Ingrese Fecha Documento');
                $('#divLoad').hide();
                return;
            }


            $("#_cIdResponsable").dxSelectBox("instance").option('value', responsable);

            if ($("#_cIdResponsable").dxSelectBox('instance').option('value') != null) {
                obj.vcIdResponsable = $("#_cIdResponsable").dxSelectBox('instance').option('selectedItem').IDRESPONSABLE;
            } else {
                toastr.error('', 'Seleccione Responable');
                $('#divLoad').hide();
                return;
            }


            ViewReport(cIdInventario);

            //console.log(JSON.stringify(obj));


            //$.ajax({
            //    type: 'POST',
            //    url: "../SerConta.asmx/List_Inventario_Update",
            //    data: JSON.stringify({ obj: obj }),
            //    dataType: 'json',
            //    contentType: 'application/json; charset=utf-8',
            //    success: function (data) {
            //        var lst = JSON.parse(data.d);
            //        if (lst != '') {
                        
            //            //Cargartabla(lst);
            //        } else {
            //            toastr.warning('No se encontraron productos con movimiento', 'Verificar Filtro');
            //            $('#container-x').html('<div class="text-center bold">No se encontraron productos con movimiento</div>');
            //        }

            //    },
            //    error: function (error) {
            //        toastr.error(JSON.stringify(error), '');
            //        $('#BtnSave').hide();
            //    }
            //});

   
        }




        $("#btnReadMov").click(function () {
            ViewReport('');
        });

        function ViewReport(vcIdInventario) {
            var obj = new Object();
            $('#divLoad').show();

            if ($("#_cIdEmpresa").dxSelectBox('instance').option('selectedItem') != null) {
                obj.vcIdEmpresa = $("#_cIdEmpresa").dxSelectBox('instance').option('selectedItem').cIniciales;
            } else {
                toastr.error('', 'Seleccione Empresa');
                return;
            }
            if ($("#_cIdSucursal").dxSelectBox('instance').option('value') != null) {
                obj.vcIdSucursal = $("#_cIdSucursal").dxSelectBox('instance').option('selectedItem').IDSUCURSAL;
            } else {
                toastr.error('', 'Seleccione Sucursal');
                return;
            }
            if ($("#_cIdAlmacen").dxSelectBox('instance').option('value') != null) {
                obj.vcIdAlmacen = $("#_cIdAlmacen").dxSelectBox('instance').option('selectedItem').IDALMACEN;
            } else {
                toastr.error('', 'Seleccione Almacen');
                return;
            }

            obj.vcIdGrupo = '';
            obj.vcIdSubGrupo = '';

            if (vcIdInventario == '') {
                obj.vcIdInventario = $("#cIdInventario").val();
            } else {
                obj.vcIdInventario = vcIdInventario
            }

            obj.vcFecha = ''; //$("#_cDescripcion").val();

            $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');

            if (obj.vcIdAlmacen != "") {
                $.ajax({
                    type: 'POST',
                    url: "../SerConta.asmx/ListProductosMovimientos",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst != '') {
                            //console.log(JSON.stringify(lst.d3));
                            Cargartabla(lst);
                        } else {
                            toastr.warning('No se encontraron productos con movimiento', 'Verificar Filtro');
                            $('#container-x').html('<div class="text-center bold">No se encontraron productos con movimiento</div>');
                        }

                    },
                    error: function (error) {
                        toastr.error(JSON.stringify(error), '');
                        $('#BtnSave').hide();
                        $('#divLoad').hide();
                    }
                });

            } else {
                $('#container-x').html('');
                toastr.error('Ingrese los datos correspondientes', 'Faltan datos');
                $('#divLoad').hide();
            }

        };

        function InventarioRegi(periodo, semana, fundo, planilla, concepto) {

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
            LoadIventarios()
        });

        function LoadIventarios() {

            var obj = new Object();

            if ($("#cIdEmpresa").dxSelectBox('instance').option('selectedItem') != null) {
                obj.vcIdEmpresa = $("#cIdEmpresa").dxSelectBox('instance').option('selectedItem').cIniciales;
            } else {
                toastr.error('', 'Seleccione Empresa');
                return;
            }
            if ($("#cIdSucursal").dxSelectBox('instance').option('selectedItem') != null) {
                obj.vcIdSucursal = $("#cIdSucursal").dxSelectBox('instance').option('selectedItem').IDSUCURSAL;
            } else {
                toastr.error('', 'Seleccione Sucursal');
                return;
            }
            if ($("#cIdAlmacen").dxSelectBox('instance').option('selectedItem') != null) {
                obj.vcIdAlmacen = $("#cIdAlmacen").dxSelectBox('instance').option('selectedItem').IDALMACEN;
            } else {
                toastr.error('', 'Seleccione Almacen');
                return;
            }

            if ($("#txtFechaIni").val() === '') {
                toastr.error('', 'Ingrese Fecha Inicio');
                return;
            } else {
                var str1 = $("#txtFechaIni").val();
                var res1 = str1.split("/", 3);
                obj.vcFecha = res1[2] + res1[1] + res1[0];
            }

            if ($("#txtFechaFin").val() === '') {
                toastr.error('', 'Ingrese Fecha Fin');
                return;
            } else {
                var str1 = $("#txtFechaFin").val();
                var res1 = str1.split("/", 3);
                obj.vcFechaFin = res1[2] + res1[1] + res1[0];
            }
            $('#container-y').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
            $.ajax({
                type: 'POST',
                url: "../SerConta.asmx/ListInventariosNis",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    if (lst != '') {

                        CargarCabecera(lst);
                    } else {
                        var objs = new Object();
                        CargarCabecera(objs);
                        // $('#container-y').html('<center>no se encontraron registros</center>');
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
                    fileName: "Reporte Resumen "
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
                    , { dataField: "IDUNICO", caption: "IDUNICO", visible: false }
                    , { dataField: "SERIE", caption: "SERIE", visible: false }
                    , { dataField: "NUMERO", caption: "NUMERO", visible: false }
                    , { dataField: "IDSUCURSAL", caption: "IDSUCURSAL", visible: false }
                    , { dataField: "IDALMACEN", caption: "IDALMACEN", visible: false }
                    , { dataField: "IDDOCUMENTO", caption: "IDDOCUMENTO", visible: false }
                    , { dataField: "FECHA", caption: "Fecha" }
                    , { dataField: "DOCUMENTO", caption: "Documento" }
                    , { dataField: "IDESTADO", caption: "IDESTADO", visible: false }
                    , { dataField: "SUC_DSC", caption: "SUC_DSC", visible: false }
                    , { dataField: "ALM_DSC", caption: "ALM_DSC", visible: false }
                    , { dataField: "EST_DSC", caption: "Estado" }
                    , { dataField: "IMPORTADO", caption: "IMPORTADO", visible: false }
                    , { dataField: "CIERRE", caption: "CIERRE", visible: false }
                    , { dataField: "GLOSA", caption: "Glosa" }
                    , { dataField: "DOC_INGRESO", caption: "DOC_INGRESO", visible: false }
                    , { dataField: "DOC_SALIDA", caption: "DOC_SALIDA", visible: false }
                    , { dataField: "RESPONSABLE", caption: "Responsable" }
                    , { dataField: "AREA", caption: "Area" }

                    //, {
                    //    dataField: "horas", caption: "total horas",
                    //    format: function (value) {
                    //        return formatNumber.new(value.toFixed(2));
                    //    }
                    //    , dataType: "number"
                    //    , alignment: "right"
                    //}
                    //, {
                    //    dataField: "total", caption: "total adicional",
                    //    fomat: function (value) {
                    //        return formatNumber.new(value.toFixed(2));
                    //    }
                    //    , dataType: "number"
                    //    , alignment: "right"
                    //}
                    , {
                        type: "buttons",
                        buttons: [
                            {
                                icon: "export",
                                hint: "Importar Nisira",
                                onClick: function (e) {
                                    SyncTareo(e.row.data.IDUNICO, e.row.data.SERIE, e.row.data.NUMERO, e.row.data.FECHA2, e.row.data.IDRESPONSABLE);
                                    e.event.preventDefault();
                                },
                                visible: function (e) {
                                    if (e.row.data.nImportado == 0) {
                                        return false;
                                    } else {
                                        return false;
                                    }
                                }
                            },
                            {
                                icon: "edit",
                                hint: "Editar",
                                onClick: function (e) {
                                    //var obj = new Object();
                                    //obj.vcPeriodo = e.row.data.cPeriodo;
                                    //obj.vcSemana = e.row.data.cSemana;
                                    //obj.vnIdPlanilla = e.row.data.cIdplanilla;
                                    //obj.vcValor = e.row.data.cIdFundo;

                                    ListInventarioUpdate(e.row.data.IDUNICO, e.row.data.SERIE, e.row.data.NUMERO, e.row.data.FECHA2, e.row.data.IDRESPONSABLE);
                                    
                                    $('#vSerie').html(e.row.data.SERIE);
                                    $("#vNumero").html(e.row.data.NUMERO);

                                    $('#DivSerie').html(e.row.data.SERIE);
                                    $("#DivNumero").html(e.row.data.NUMERO);
                                    
                                    //$("#Fundos").dxSelectBox("instance").option('value', e.row.data.cIdFundo);

                                    //$('#cell-background2').hide();
                                    //$('#cell-background').show();
                                    //ViewReport(obj);
                                    e.event.preventDefault();
                                }
                                ,
                                visible: function (e) {
                                    if (e.row.data.nImportado == 0) {
                                        return true;
                                    } else {
                                        return true
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
            });

            $('#BtnNew').show();
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
