<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_CostosDistribuidos.aspx.cs" Inherits="SFC_WEB_APP.Mod_Admi.Wfo_CostosDistribuidos" %>

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
    <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />

    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap4.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>



    <style>
        .dx-freespace-row {
            height: 0px !important;
        }

        #DataGrid {
            height: 70vh;
            width: 100%;
        }

        .long-title h3 {
            font-family: 'Segoe UI Light', 'Helvetica Neue Light', 'Segoe UI', 'Helvetica Neue', 'Trebuchet MS', Verdana;
            font-weight: 200;
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
        }
/*
        #gridContainer {
            height: 440px;
        }*/

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
            <div class="row">
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2" style="display: none" id="">
            <label for="txtFeCont">Reporte Por</label>
            <select id="typerep" name="typerep" class="form-control" >
                <option value="0" selected="selected">Seleccione</option>
                <option value="1">por Campaña</option>
                <option value="2">por Fechas</option>
            </select>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-1" id="DivFeIni">
            <label for="txtFeCont">Periodo Ini</label>
            <input type="text" id="txtFeIni" name="txtFeIni" autocomplete="off" class="form-control date_field" placeholder="YYYYMM">
            <script type="text/javascript">
                $(function () {
                    $('#txtFeIni').datetimepicker({
                        format: 'YYYYMM',
                        locale: 'es'
                    });
                    $(function () {
                        $('#DivFeIni').datetimepicker({
                            format: 'YYYYMM',
                            locale: 'es'
                        });
                    });
                });
            </script>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-1" id="DivFeFin">
            <label for="txtFeCont">Periodo Fin</label>
            <input type="text" id="txtFeFin" name="txtFeFin" autocomplete="off" class="form-control date_field" placeholder="YYYYMM">
            <script type="text/javascript">
                $(function () {
                    $('#txtFeFin').datetimepicker({
                        format: 'YYYYMM',
                        locale: 'es'
                    });
                    $(function () {
                        $('#DivFeFin').datetimepicker({
                            format: 'YYYYMM',
                            locale: 'es'
                        });
                    });
                });
            </script>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-1">
            <label for="" class="label-input">Parametros:</label>
            <select id="tipopar" name="tipo" class="form-control">
                <option value="0" selected="selected">seleccione</option>
                <option value="1">POR GRUPOS</option>
                <option value="2">INDIVIDUAL</option>
            </select>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2" style="display: none" id="igrcco">
            <label for="txtFeCont" class="label-input">Grupo Centros de Costo:</label>
            <div class="row pl-3">
                <div id="gr_cco" class="form-control" style="width: 85%;"></div>  
                <div class="input-group-append">
                    <button class="btn btn-outline-primary" id="btnGruposCeco" type="button"><i class="fas fa-plus"></i></button>
                </div>
            </div>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2" style="display: none" id="igrcta">
            <label for="txtFeCont" class="label-input">Grupo Cuentas:</label>
            <div class="row pl-3">
                <div id="gr_cta" class="form-control" style="width: 85%;"></div>  
                <div class="input-group-append">
                    <button class="btn btn-outline-primary" id="btnGruposCuenta" type="button"><i class="fas fa-plus"></i></button>
                </div>
            </div>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-4" style="display: none" id="iicco">
            <label for="txtFeCont" class="label-input">Centros de Costo:</label>
            <div id="sel-cco" class="form-control"></div>  
            <input type="hidden" id="cc" name="cc" class="ist"/>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-4" style="display: none" id="iicta">
            <label for="txtFeCont" class="label-input">Cuentas:</label>
            <div id="sel-cta" class="form-control"></div>  
            <input type="hidden" id="cta" name="mcta" class="ist"/>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-1" id="DivBoton">
            <label for="btnRec">&nbsp;</label>
            <button type="button" id="btnRec" class="btn btn-secondary col-12">
                <i class="fa fa-search"></i>Recuperar
            </button>
        </div>
    </div>

    <section id="cell-background" style="min-height: 30vh">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">COSTOS DISTRIBUIDOS</h4>
                    <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements">
                        <ul class="list-inline mb-0">
                            <li id="btn-excel" style="display: none"><a id='excelExport' title="Exportar en Excel"><i class="fas fa-file-excel"></i></a></li>
                            <li id="btn-pdf" style="display: none"><a id='pdfExport' title="Exportar en Pdf"><i class="fas fa-file-pdf"></i></a></li>
                            <li id="btn-expand" style="display: none"><a id='expandall' title="Expandir Grupos"><i class="fas fa-angle-double-down"></i></a></li>
                            <li id="btn-collapse" style="display: none"><a id='collapseall' title="Collapsar Grupos"><i class="fas fa-angle-double-up"></i></a></li>
                            <li style="display: none"><a data-action="expand"><i class="ft-maximize"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content collapse show">
                    <div class="card-body card-dashboard">
                        <div id="container-x" class="device-mobile-tablet-container" style="min-height: 30vh">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


     <div class="modal fade  modal-child" id="ModGrupoCeco" data-backdrop-limit="1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-modal-parent="#ModOrden">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Grupo CeCos</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group p-0 m-0">
                        <div class="form-group pb-0 m-0">
                            <label for="message-text" class="col-form-label">Nombre:</label>
                            <input type="text" id="vcGrupoCeco" name="vcGrupo" autocomplete="off" class="form-control" placeholder="Nombre Grupo" />
                        </div>
                        <div class="form-group">
                            <label for="txtFeCont" class="label-input" id="mt-cc">Centro Costo:</label>
                            <div id="msel-cco" class="form-control"></div>  
                            <input type="hidden" id="mcc" name="cc" class="ist"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="button" id="addGrupoCeco" class="btn btn-primary">Agregar</button>
                    </div>
                </div>
            </div>
        </div>
     </div>

     <div class="modal fade  modal-child" id="ModGrupoCuenta" data-backdrop-limit="1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-modal-parent="#ModOrden">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Grupo Cuentas</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group p-0 m-0">
                        <div class="form-group pb-0 m-0">
                            <label for="message-text" class="col-form-label">Nombre:</label>
                            <input type="text" id="vcGrupoCuenta" name="vcGrupo" autocomplete="off" class="form-control" placeholder="Nombre Grupo" />
                        </div>
                        <div class="form-group">
                            <label for="txtFeCont" class="label-input" id="mt-cta">Cuentas:</label>
                            <div id="msel-cta" class="form-control"></div>  
                            <input type="hidden" id="mcta" name="mcta" class="ist"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" id="nIdCajasOE" value="0" />
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="button" id="addGrupoCuenta" class="btn btn-primary">Agregar</button>
                    </div>
                </div>
            </div>
        </div>
        </div>
    <script>
        DevExpress.localization.locale('es');
        $('#tipopar').on('change', function () {
            if (this.value == '1') {
                $('#iicco').hide();
                $('#iicta').hide();
                $('#igrcco').show();
                $('#igrcta').show();
            } else if (this.value == '2') {
                $('#iicco').show();
                $('#iicta').show();
                $('#igrcco').hide();
                $('#igrcta').hide();
            } else {
                $('#iicco').hide();
                $('#iicta').hide();
                $('#igrcco').hide();
                $('#igrcta').hide();
            }
        });

        $("#btnGruposCeco").click(function () {
            $('#ModGrupoCeco').modal('show');
        });

        $("#btnGruposCuenta").click(function () {
            $('#ModGrupoCuenta').modal('show');
        });



        $("#addGrupoCeco").click(function () {

            var obj = new Object();
            obj.vcId = 0;
            obj.vcType = 'CCO';
            obj.vcNombre = $('#vcGrupoCeco').val();

            if ($("#msel-cco").dxDropDownBox('instance').option('value') != null) {
                cCecos = $("#msel-cco").dxDropDownBox('instance').option('value');
                var datax = '';
                for (var x = 0; x < cCecos.length; x++) {
                    datax += cCecos[x] + ',';
                }
                obj.vcCecos = removeLastComma(datax);
            } else {
                obj.vcCecos = ''
            }
            obj.vcCuenta = ''
            if (obj.vcNombre != '' && obj.vcCecos != '') {

                $.ajax({
                    type: 'POST',
                    url: "../SerAdmi.asmx/GrupoCecoCuenta_Regi",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        grcco();
                        $('#vcGrupoCeco').val('');
                        $("#msel-cco").dxDropDownBox('instance').option('value', '');
                        $('#ModGrupoCeco').modal('hide');
                    }, error: function (dat) {
                        alert(JSON.stringify(dat));
                    }

                });
            }

        });

        $("#addGrupoCuenta").click(function () {

            var obj = new Object();
            obj.vcId = 0;
            obj.vcType = 'CTA';
            obj.vcNombre = $('#vcGrupoCuenta').val();
            obj.vcCecos = '';
            if ($("#msel-cta").dxDropDownBox('instance').option('value') != null) {
                cCuenta = $("#msel-cta").dxDropDownBox('instance').option('value');
                var datax = '';
                for (var x = 0; x < cCuenta.length; x++) {
                    datax += cCuenta[x]+',';
                }
                obj.vcCuenta = removeLastComma(datax);
            } else {
                obj.vcCuenta = ''
            }
            if (obj.vcNombre != '' && obj.vcCuenta != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerAdmi.asmx/GrupoCecoCuenta_Regi",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        grcta();
                        $('#vcGrupoCuenta').val('');
                        $("#msel-cta").dxDropDownBox('instance').option('value', '');
                        $('#ModGrupoCuenta').modal('hide');
                    }
                });
            }

        });





        var treeView, dataGrid;

        var syncTreeViewSelection = function (treeView, value) {
            if (!value) {
                treeView.unselectAll();
                return;
            }

            value.forEach(function (key) {
                treeView.selectItem(key);
            });
        };

        var makeAsyncDataSource = function (jsonFile, id) {
            return new DevExpress.data.CustomStore({
                loadMode: "raw",
                key: id,
                load: function () {
                    return jsonFile;
                }
            });

        };

        listcc();
        listcta();


        function listcc() {

            var obj = new Object();
            obj.vcType = 'CCO';
            obj.vcEmpresa = '001';
            obj.vcSucursal = '';
            $.ajax({
                type: 'POST',
                url: "../SerAdmi.asmx/DateNisira_list",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    $("#sel-cco").dxDropDownBox({
                        //value: [3],
                        valueExpr: "IDCCOSTO",
                        placeholder: "Seleccione Valores...",
                        displayExpr: "CompanyName",
                        showClearButton: true,
                        searchEnabled: true,
                        searchExpr: 'IDCCOSTO',
                        searchMode: 'startswith',
                        dataSource: makeAsyncDataSource(lst, 'IDCCOSTO'),
                        contentTemplate: function (e) {
                            var value = e.component.option("value"),
                                $dataGrid = $("<div>").dxDataGrid({
                                    dataSource: e.component.getDataSource(),
                                    columns: [{ caption: "IDCCOSTO", dataField: "IDCCOSTO", width: 130 }, { caption: "DESCRIPCION", dataField: "DESCRIPCION" }],
                                    hoverStateEnabled: true,
                                    paging: { enabled: true, pageSize: 10 },
                                    filterRow: { visible: true },
                                    scrolling: { mode: "virtual" },
                                    height: 445,
                                    selection: { mode: "multiple" },
                                    selectedRowKeys: value,
                                    onSelectionChanged: function (selectedItems) {
                                        var keys = selectedItems.selectedRowKeys;
                                        e.component.option("value", keys);
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

                    $("#msel-cco").dxDropDownBox({
                        //value: [3],
                        valueExpr: "IDCCOSTO",
                        placeholder: "Seleccione Valores...",
                        displayExpr: "CompanyName",
                        showClearButton: true,
                        searchEnabled: true,
                        searchExpr: 'IDCCOSTO',
                        searchMode: 'startswith',
                        dataSource: makeAsyncDataSource(lst, 'IDCCOSTO'),
                        contentTemplate: function (e) {
                            var value = e.component.option("value"),
                                $dataGrid = $("<div>").dxDataGrid({
                                    dataSource: e.component.getDataSource(),
                                    columns: [{ caption: "IDCCOSTO", dataField: "IDCCOSTO", width: 130 }, { caption: "DESCRIPCION", dataField: "DESCRIPCION" }],
                                    hoverStateEnabled: true,
                                    paging: { enabled: true, pageSize: 10 },
                                    filterRow: { visible: true },
                                    scrolling: { mode: "virtual" },
                                    height: 445,
                                    selection: { mode: "multiple" },
                                    selectedRowKeys: value,
                                    onSelectionChanged: function (selectedItems) {
                                        var keys = selectedItems.selectedRowKeys;
                                        e.component.option("value", keys);
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

                },
                error: function (error) {
                    alert(JSON.stringify(error));
                }
            });
        }


        function listcta() {

            var obj = new Object();
            obj.vcType = 'CTA';
            obj.vcEmpresa = '001';
            obj.vcSucursal = '';
            $.ajax({
                type: 'POST',
                url: "../SerAdmi.asmx/DateNisira_list",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);


                    $("#sel-cta").dxDropDownBox({
                        //value: [3],
                        valueExpr: "IDCUENTA",
                        placeholder: "Select a value...",
                        displayExpr: "CompanyName",
                        showClearButton: true,
                        //searchEnabled: true,
                        //searchExpr: 'IDCUENTA',
                        //searchMode: 'startswith',
                        dataSource: makeAsyncDataSource(lst, 'IDCUENTA'),
                        contentTemplate: function (e) {
                            var value = e.component.option("value"),
                                $dataGrid = $("<div>").dxDataGrid({
                                    dataSource: e.component.getDataSource(),
                                    columns: [{ caption: "IDCUENTA", dataField: "IDCUENTA", width: 100 }, { caption: "DESCRIPCION", dataField: "DESCRIPCION" }],
                                    hoverStateEnabled: true,
                                    paging: { enabled: true, pageSize: 10 },
                                    filterRow: { visible: true },
                                    scrolling: { mode: "virtual" },
                                    height: 445,
                                    selection: { mode: "multiple" },
                                    selectedRowKeys: value,
                                    onSelectionChanged: function (selectedItems) {
                                        var keys = selectedItems.selectedRowKeys;
                                        e.component.option("value", keys);
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

                    $("#msel-cta").dxDropDownBox({
                        //value: [3],
                        valueExpr: "IDCUENTA",
                        placeholder: "Select a value...",
                        displayExpr: "CompanyName",
                        showClearButton: true,
                        //searchEnabled: true,
                        //searchExpr: 'IDCUENTA',
                        //searchMode: 'startswith',
                        dataSource: makeAsyncDataSource(lst, 'IDCUENTA'),
                        contentTemplate: function (e) {
                            var value = e.component.option("value"),
                                $dataGrid = $("<div>").dxDataGrid({
                                    dataSource: e.component.getDataSource(),
                                    columns: [{ caption: "IDCUENTA", dataField: "IDCUENTA", width: 100 }, { caption: "DESCRIPCION", dataField: "DESCRIPCION" }],
                                    hoverStateEnabled: true,
                                    paging: { enabled: true, pageSize: 10 },
                                    filterRow: { visible: true },
                                    scrolling: { mode: "virtual" },
                                    height: 445,
                                    selection: { mode: "multiple" },
                                    selectedRowKeys: value,
                                    onSelectionChanged: function (selectedItems) {
                                        var keys = selectedItems.selectedRowKeys;
                                        e.component.option("value", keys);
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
                },
                error: function (error) {
                    alert(JSON.stringify(error));
                }
            });
        }
        grcco();
        grcta();
        function grcco() {

            var obj = new Object();
            obj.vnId = 0;
            obj.vcType = 'CCO';
            obj.vcNombre = '';
            $.ajax({
                type: 'POST',
                url: "../SerAdmi.asmx/GrupoCecoCuenta_List",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    var searchBox = $("#gr_cco").dxSelectBox({
                        dataSource: lst,
                        displayExpr: 'cNombre',
                        valueExpr: 'cCeco',
                        placeholder: "Seleccione",
                        noDataText: "Sin Datos",
                        //searchEnabled: true,
                        //searchExpr: 'cCeco',
                        //searchMode: 'startswith',
                        acceptCustomValue: true,
                        onValueChanged: function (data) {
                            //var selectedItem = data.component.option('selectedItem');
                            //alert(simpleStringify(selectedItem))
                        },
                    }).dxSelectBox("instance");
                },
                error: function (error) {
                    alert(JSON.stringify(error));
                }
            });
        }

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

        function grcta() {

            var obj = new Object();
            obj.vnId = 0;
            obj.vcType = 'CTA';
            obj.vcNombre = '';
            $.ajax({
                type: 'POST',
                url: "../SerAdmi.asmx/GrupoCecoCuenta_List",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);


                        var searchBox = $("#gr_cta").dxSelectBox({
                            dataSource: lst,
                            displayExpr: 'cNombre',
                            valueExpr: 'cCuenta',
                            placeholder: "Seleccione",
                            noDataText: "Sin Datos",
                            //searchEnabled: true,
                            //searchExpr: 'cCuenta',
                            //searchMode: 'startswith',
                            acceptCustomValue: true,
                            onValueChanged: function (data) {
                                //var selectedItem = data.component.option('selectedItem');
                                //alert(simpleStringify(selectedItem))
                            },
                        }).dxSelectBox("instance");
                },
                error: function (error) {
                    alert(JSON.stringify(error));
                }
            });
        }

        $(document).on('click', '#btnRec', function (e) {
            e.preventDefault();
            var obj = new Object();

            obj.vcIdEmpresa = '001';
            if ($('#txtFeIni').val() != '') {
                obj.vcfecha = $('#txtFeIni').val();
            } else {
                obj.vcfecha = '';
            }
            if ($('#txtFeFin').val() != '') {
                obj.vcFechaFin = $('#txtFeIni').val();
            } else {
                obj.vcFechaFin = '';
            } 
                if ($('#tipopar').val() == '1') {
                    if ($("#gr_cco").dxSelectBox('instance').option('selectedItem') != null) {
                        cCeco = $("#gr_cco").dxSelectBox('instance').option('selectedItem').cCeco;
                        var cCecoSplit = cCeco.split(",");
                        var datax = new Array();
                        for (var x = 0; x < cCecoSplit.length; x++) {
                            var row = {};
                            row['vcId'] = cCecoSplit[x];
                            datax[x] = row;
                        }
                        vcXMLCC = datax;
                    } else {
                        vcXMLCC = [];
                    }


                    if ($("#gr_cta").dxSelectBox('instance').option('selectedItem') != null) {
                        cCuenta = $("#gr_cta").dxSelectBox('instance').option('selectedItem').cCuenta;
                        var cCuentaSplit = cCuenta.split(",");
                        var datay = new Array();
                        for (var y = 0; y < cCuentaSplit.length; y++) {
                            var rowf = {};
                            rowf['vcId'] = cCuentaSplit[y];
                            datay[y] = rowf;
                        }
                        vcXMLPC = datay;
                    } else {
                        vcXMLPC = [];
                    }
                } else if ($('#tipopar').val()  == '2') {
                    if ($("#sel-cco").dxDropDownBox('instance').option('value') != null) {
                        cCecoarray = $("#sel-cco").dxDropDownBox('instance').option('value');
                        var datax = new Array();
                        for (var x = 0; x < cCecoarray.length; x++) {
                            var row = {};
                            row['vcId'] = cCecoarray[x];
                            datax[x] = row;
                        }
                        vcXMLCC = datax;
                    } else {
                        vcXMLCC = [];
                    }

                    if ($("#sel-cta").dxDropDownBox('instance').option('value') != null) {
                        cCuentaarray = $("#sel-cta").dxDropDownBox('instance').option('value');
                        var datay = new Array();
                        for (var y = 0; y < cCuentaarray.length; y++) {
                            var rowf = {};
                            rowf['vcId'] = cCuentaarray[y];
                            datay[y] = rowf;
                        }
                        vcXMLPC = datay;
                    } else {
                        vcXMLPC = [];
                    }
                } else {
                    vcXMLCC = [];
                    vcXMLPC = [];
                }

            obj.vcXMLCCO = '';
            obj.vcAGRUP_CC = '0002';
            obj.vcAGRUP_CTA = '';
            obj.vcC_TIPO_CC = 'T';
            $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
            if (obj.vcfecha != '' && obj.vcfecha != '' && vcXMLCC.length != 0 && vcXMLCC.length != 0) {
                $.ajax({
                    type: 'POST',
                    url: "../SerAdmi.asmx/CostosDistribuidos_List",
                    data: JSON.stringify({ obj: obj, arrayXMLCC: vcXMLCC, arrayXMLPC: vcXMLPC }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        if (lst.length != 0) {

                            $('#container-x').html('<div class="options"><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="DataGrid"></div>');

                            var dataGridhh = $("#DataGrid").dxDataGrid({
                                dataSource: lst,
                                scrolling: {
                                    mode: "virtual"
                                },
                                grouping: {
                                    autoExpandAll: false
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
                                export: {
                                    enabled: true,
                                    fileName: "Reporte"
                                },

                                filterRow: {
                                    visible: false,
                                    applyFilter: "auto"
                                },
                                searchPanel: {
                                    visible: false,
                                    placeholder: "Search..."
                                },
                                headerFilter: {
                                    visible: false
                                },
                                columns: [
                                    { caption: "ID", dataField: "ID" }
                                    , { caption: "ITEM", dataField: "ITEM" }
                                    , { caption: "PERIODO", dataField: "PERIODO" }
                                    , { caption: "CTA", dataField: "CTA" }
                                    , { caption: "DSC_CTA	", dataField: "DSC_CTA" }
                                    , { caption: "CONSUMIDOR", dataField: "CONSUMIDOR" }
                                    , { caption: "DSC_CONSUMIDOR", dataField: "DSC_CONSUMIDOR" }
                                    , { caption: "Fundo", dataField: "Fundo" }
                                    , { caption: "Cultivo", dataField: "Cultivo" }
                                    , { caption: "Etapa", dataField: "Etapa" }
                                    , { caption: "Kg_proy", dataField: "Kg_proy" }
                                    , { caption: "Campana", dataField: "Campana" }
                                    , { caption: "ha", dataField: "ha" }
                                    , { caption: "Costo_x_ha_sol", dataField: "Costo_x_ha_sol" }
                                    , { caption: "Costo_x_ha_dol", dataField: "Costo_x_ha_dol" }
                                    , { caption: "tcambio	FECHA_REF", dataField: "tcambio	FECHA_REF" }
                                    , { caption: "CLASECOSTO_DESTINO", dataField: "CLASECOSTO_DESTINO" }
                                    , { caption: "DSC_CLASECOSTO_DESTINO", dataField: "DSC_CLASECOSTO_DESTINO" }
                                    , { caption: "IMPORTE_SOLES", dataField: "IMPORTE_SOLES" }
                                    , { caption: "IMPORTE_DOLARES", dataField: "IMPORTE_DOLARES" }
                                    , { caption: "CONSUMIDOR_ORIGEN", dataField: "CONSUMIDOR_ORIGEN" }
                                    , { caption: "DSC_CONS_ORIGEN	", dataField: "DSC_CONS_ORIGEN" }
                                    , { caption: "TIPO_CONS_ORIGEN", dataField: "TIPO_CONS_ORIGEN" }
                                    , { caption: "ACTIVIDAD", dataField: "ACTIVIDAD" }
                                    , { caption: "DSC_ACTIVIDAD", dataField: "DSC_ACTIVIDAD" }
                                    , { caption: "LABOR", dataField: "LABOR" }
                                    , { caption: "DSC_LABOR", dataField: "DSC_LABOR" }
                                    , { caption: "PRODUCTO", dataField: "PRODUCTO" }
                                    , { caption: "DSC_PRODUCTO", dataField: "DSC_PRODUCTO" }
                                    , { caption: "CANTIDAD", dataField: "CANTIDAD" }
                                    , { caption: "GLOSA", dataField: "GLOSA" }
                                    , { caption: "DIMENSION", dataField: "DIMENSION" }
                                    , { caption: "CLASECOSTO", dataField: "CLASECOSTO" }
                                    , { caption: "DSC_CLASECOSTO", dataField: "DSC_CLASECOSTO" }
                                    , { caption: "IDFUNCION", dataField: "IDFUNCION" }
                                    , { caption: "FUNCION", dataField: "FUNCION" }
                                    , { caption: "IDORDENPRO", dataField: "IDORDENPRO" }
                                    , { caption: "DOC_ORDENPRODUCCION", dataField: "DOC_ORDENPRODUCCION" }
                                    , { caption: "FECHA", dataField: "FECHA" }
                                    , { caption: "FECHACIERRE", dataField: "FECHACIERRE" }
                                    , { caption: "ESTADO_OP", dataField: "ESTADO_OP" }
                                    , { caption: "ITEM_GASTO", dataField: "ITEM_GASTO" }
                                    , { caption: "TIPO_GASTO", dataField: "TIPO_GASTO" }
                                    , { caption: "IDUCOSTO", dataField: "IDUCOSTO" }
                                    , { caption: "DSC_UCOSTO", dataField: "DSC_UCOSTO" }
                                    , { caption: "ccNivel1", dataField: "ccNivel1" }
                                    , { caption: "ccNivel2", dataField: "ccNivel2" }
                                    , { caption: "ccNivel3", dataField: "ccNivel3" }
                                    , { caption: "ccNivel4", dataField: "ccNivel4" }
                                    , { caption: "ccNivel5", dataField: "ccNivel5" }
                                    , { caption: "ctaNivel1", dataField: "ctaNivel1" }
                                    , { caption: "ctaNivel2", dataField: "ctaNivel2" }
                                    , { caption: "ctaNivel3", dataField: "ctaNivel3" }
                                    , { caption: "ctaNivel4", dataField: "ctaNivel4" }
                                    , { caption: "ctaNivel5", dataField: "ctaNivel5" }
                                    , { caption: "TOTAL_HORAS", dataField: "TOTAL_HORAS" }
                                    , { caption: "TOTAL_HORAS_REND", dataField: "TOTAL_HORAS_REND" }
                                    , { caption: "VOLUMEN_AGUA", dataField: "VOLUMEN_AGUA" }
                                ]
                            }).dxDataGrid("instance");

                            $("#autoExpand").dxCheckBox({
                                value: false,
                                text: "Expandir Todo",
                                onValueChanged: function (data) {

                                    var dataGrid = $('#DataGrid').dxDataGrid('instance');
                                    if (data.value == 1) {
                                        dataGrid.expandAll(-1);
                                    } else {
                                        dataGrid.collapseAll(-1);
                                    }
                                }
                            });

                            $("#filterRow").dxCheckBox({
                                text: "Buscar",
                                value: false,
                                onValueChanged: function (data) {
                                    dataGrid.clearFilter();
                                    dataGrid.option("filterRow.visible", data.value);
                                    // applyFilterModeEditor.option("disabled", !data.value);
                                }
                            });

                            $("#headerFilter").dxCheckBox({
                                text: "Filtro",
                                value: false,
                                onValueChanged: function (data) {
                                    dataGrid.clearFilter();
                                    dataGrid.option("headerFilter.visible", data.value);
                                }
                            });
                        }
                    },
                    error: function (error) {
                        toastr.error(JSON.stringify(error), '');
                    }
                });
            } else {
                toastr.error('', 'Seleccione los Parametros y/0 Periodos');
            }

        });


        function removeLastComma(str) {
            return str.replace(/,(\s+)?$/, '');
        }
    </script>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
