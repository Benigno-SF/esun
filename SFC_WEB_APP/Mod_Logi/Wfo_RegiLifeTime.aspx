<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_RegiLifeTime.aspx.cs" Inherits="SFC_WEB_APP.Mod_Logi.Wfo_RegiLifeTime" %>

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
    <%--<script src="../Content/DevExtreme/currency.min.js"></script>
    <script src="../Content/DevExtreme/date.min.js"></script>--%>
    <script src="../Content/DevExtreme/jszip.min.js"></script>
    <script src="../Content/DevExtreme/dx.all.js"></script>
    <script src="../Content/DevExtreme/dx.messages.es.js"></script>
    <script src="../Content/DevExtreme/supplemental.js"></script>
    <script src="../Content/DevExtreme/es.js"></script>

    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/print.min.css" />
    <script src="../Content/DevExtreme/print.min.js"></script>



    <style>
        /*.dx-freespace-row {
            height: 0px !important;
        }*/

        #DataGrid {
            width: 100%;
            font-size: 14px;
            font-weight: bold;
            max-height: 65vh
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
/*        #data-grid-demo {
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
        }*/


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

        .options {
            padding: 0px;
            margin-top: 0px;
        }



        .option {
            margin-top: 0px;
        }





        .dx-editor-cell .dx-texteditor .dx-texteditor-input {
            background: rgba(255,255,255,0);
            font-size: 14px;
            height: 48px;
            line-height: 48px;
            padding: 0 10px;
            margin-top: 0;
        }


        .options {
            padding: 0px;
            margin-top: 0px;
        }

        .caption {
            font-size: 14px;
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

        .dx-toolbar-before{
            font-size: 18px;
            font-weight: bold;
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
                        <h4 class="card-title">Productos</h4>
                        <br />
                                    <div class="row">
                                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <label for="btnBusc">Base Datos</label>
                                            <select class="form-control" id="nIdBaseDatos" name="">
                                                <option value="" selected disabled>Seleccione</option>
                                                <option value="SFE">SUN FRUITS EXPORTS</option>
                                                <option value="SFP">SUN FRUITS PACKS</option>
                                                <option value="SYA">SANTUARIO YAUCA</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <label>Grupo</label>
                                            <div id="nIdGrupo" class="form-control"></div>  
                                        </div>
                                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <label>Sub Grupo</label>
                                            <div id="nIdSubGrupo" class="form-control"></div>
                                        </div>
                                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <label>Descripcion</label>
                                            <input id="cDescripcion" class="form-control">
                                        </div>
                                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
                                            <label for="btnBusc">&nbsp;</label>
                                            <button type="button" id="btnRead" class="btn btn-primary col-12">
                                                <i class="fas fa-note"></i> Cargar Productos
                                            </button>
                                        </div>
                                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0" style="display:none" id="Update">
                                            <label for="btnBusc">&nbsp;</label>
                                            <div id="saveChangesButton"></div>
                                        </div>
                                    </div>
                    </div>

                    <div class="card-content collapse show" style="/*overflow: auto*/">
                        <div class="card-body card-dashboard" style="min-height: 30vh; /*width: 1500px; */ overflow: auto" id="divdatagrid">
                            <div id="container-x" class="device-mobile-tablet-container" style="min-height: 30vh; /* width: 1600px; overflow: auto; */">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


        <script>
            $('body').on('change', '#nIdBaseDatos', function () {
                var id = $(this).val();
                LoadGrupo(id);
                $('#Update').hide();
                //Load_Agrupo(id, 0);
                $('#container-x').html('<div style="text-align: center; font-size: 20px; font-weight: bold;"></div>');
            });


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
            var searchBox2 = $("#nIdGrupo").dxSelectBox({
                placeholder: "Seleccione",
                noDataText: "Sin Datos",
            }).dxSelectBox("instance");

            var searchBox2 = $("#nIdSubGrupo").dxSelectBox({
                placeholder: "Seleccione",
                noDataText: "Sin Datos",
            }).dxSelectBox("instance");

            function LoadSubGrupo(grupo, bd) {

                if (grupo != '') {
                    var obj = new Object();
                    obj.vcBaseDatos = bd;
                    obj.vnIdGrupo = grupo;
                    obj.vnIdSubGrupo = '';
                    obj.vcDescripcion = '';
                    $.ajax({
                        type: 'POST',
                        url: "../SerLogi.asmx/ListSubGrupoNis",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);

                            var searchBox = $("#nIdSubGrupo").dxSelectBox({
                                dataSource: lst,
                                displayExpr: 'sub_grupo',
                                valueExpr: 'IDSUBGRUPO',
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
            }


            function Cargartabla(data, bd) {
                if (data[0].nPermiso == 1) {
                    var perms = 1;
                    $('#Update').show();
                } else {
                    var perms = 0;
                    $('#Update').hide();
                }

                DevExpress.localization.locale('es');
                $('#container-x').html('<div id="DataGrid"></div>');

                dataGrid = $("#DataGrid").dxDataGrid({
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
                    //IDPRODUCTO	DESCRIPCION	IDGRUPO	GRUPO_DSC	IDSUBGRUPO	SUBGRUPO_DSC	ESTADO	IDMEDIDA	MRPDIASPLANEACION	MRPDIASREPOSICION	MRPSTOCKMINIMO	MRPSTOCKSEGURIDAD
                    columns: [
                        {
                            caption: '#',
                            cellTemplate: function (cellElement, cellInfo) {
                                cellElement.text(cellInfo.row.rowIndex + 1)
                            },
                            width: 50,
                            allowEditing: false,
                            fixed: true,
                            fixedPosition: "left"
                        },
                        {
                            dataField: "IDPRODUCTO",
                            caption: "Codigo",
                            width: 120,
                            allowEditing: false,
                            cellTemplate: function (container, options) {
                                $("<div>")
                                    .append(options.value)
                                    .css("color", "#0b1044")
                                    .css("font-weight", "bold")
                                    .css("font-size", "12px")
                                    .appendTo(container);
                            },
                            fixed: true,
                            fixedPosition: "left"

                        },
                        {
                            dataField: "DESCRIPCION",
                            caption: "Descripcion Producto",
                            width: 330,
                            allowEditing: false,
                            cellTemplate: function (container, options) {
                                $("<div>")
                                    .append(options.value)
                                    .css("color", "#0b1044")
                                    .css("font-weight", "bold")
                                    .css("font-size", "12px")
                                    .appendTo(container);
                            },
                            fixed: true,
                            fixedPosition: "left"
                        },
                        //{
                        //    dataField: "IDGRUPO",
                        //    caption: "IDGRUPO",
                        //    width: 250,
                        //},
                        {
                            dataField: "GRUPO_DSC",
                            caption: "Grupo",
                            width: 230,
                            allowEditing: false,
                            cellTemplate: function (container, options) {
                                $("<div>")
                                    .append(options.value)
                                    .css("color", "#0b1044")
                                    .css("font-weight", "bold")
                                    .css("font-size", "12px")
                                    .appendTo(container);
                            },
                            fixed: true,
                            fixedPosition: "left"
                        },
                        //{
                        //    dataField: "IDSUBGRUPO",
                        //    caption: "IDSUBGRUPO",
                        //    width: 250,
                        //},
                        {
                            dataField: "SUBGRUPO_DSC",
                            caption: "Sub Grupo",
                            width: 230,
                            allowEditing: false,
                            cellTemplate: function (container, options) {
                                $("<div>")
                                    .append(options.value)
                                    .css("color", "#0b1044")
                                    .css("font-weight", "bold")
                                    .css("font-size", "12px")
                                    .appendTo(container);
                            }
                        },
                        {
                            dataField: "IDMEDIDA",
                            caption: "U.M.",
                            width: 70,
                            allowEditing: false,
                            cellTemplate: function (container, options) {
                                $("<div>")
                                    .append(options.value)
                                    .css("color", "#0b1044")
                                    .css("font-weight", "bold")
                                    .css("font-size", "12px")
                                    .appendTo(container);
                            }
                        },
                        {
                            dataField: "MRPDIASPLANEACION",
                            caption: "Dias Planeación",
                            visible: true,
                            width: 140,
                            dataType: "number",
                            setCellValue: function (rowData, value, columnFieldNameOrId) {
                                if (value < 0 || value === null) {
                                    value = 0;
                                    toastr.warning('No se admiten valores Negativos', 'NUMERO NEGATIVO');
                                }
                                if (value == Math.floor(value)) {
                                } else {
                                    value = Math.floor(value);
                                    toastr.warning('No se admiten Decimales en este campo', 'SOLO NUMEROS ENTEROS');
                                }
                                rowData.MRPDIASPLANEACION = value;
                            },
                            allowEditing: perms,
                        }, {
                            dataField: "MRPDIASREPOSICION",
                            caption: "Dias Reposición",
                            visible: true,
                            width: 140,
                            dataType: "number",
                            setCellValue: function (rowData, value, columnFieldNameOrId) {
                                if (value < 0 || value === null) {
                                    value = 0;
                                    toastr.warning('No se admiten valores Negativos', 'NUMERO NEGATIVO');
                                }
                                if (value == Math.floor(value)) {
                                } else {
                                    value = Math.floor(value);
                                    toastr.warning('No se admiten Decimales en este campo', 'SOLO NUMEROS ENTEROS');
                                }
                                rowData.MRPDIASREPOSICION = value;
                            },
                            allowEditing: perms,
                        }, {
                            dataField: "MRPSTOCKMINIMO",
                            caption: "Stock Minímo",
                            visible: true,
                            width: 120,
                            dataType: "number",
                            setCellValue: function (rowData, value, columnFieldNameOrId) {
                                if (value < 0 || value === null) {
                                    value = 0;
                                    toastr.warning('No se admiten valores Negativos', 'NUMERO NEGATIVO');
                                }
                                rowData.MRPSTOCKMINIMO = value;
                            },
                            allowEditing: perms,
                        }, {
                            dataField: "MRPSTOCKSEGURIDAD",
                            caption: "Stock Seguridad",
                            visible: true,
                            width: 120,
                            dataType: "number",
                            setCellValue: function (rowData, value, columnFieldNameOrId) {
                                if (value < 0 || value === null) {
                                    value = 0;
                                    value = Math.abs(value);
                                    toastr.warning('No se admiten valores Negativos', 'NUMERO NEGATIVO');
                                }
                                rowData.MRPSTOCKSEGURIDAD = value;
                            },
                            allowEditing: perms,
                        }
                    ],
                    //onContentReady: function (e) {
                    //    var buttons = e.element.find(".dx-button");

                    //    if (buttons.length) {
                    //        buttons.eq(0).dxButton("instance").on("click", function () {
                    //            //updateProductos();
                    //        });
                    //    }
                    //},
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
                        var dataGrid = $("#DataGrid").dxDataGrid("instance");
                        if (dataGrid.hasEditData()) {
                            dataGrid.saveEditData().then(() => {
                                if (!dataGrid.hasEditData()) {
                                    updateProductos()
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

                if (bd == 'SFE') {
                    var emp = 'SUN FRUITS EXPORTS';
                } else if (bd == 'SFP') {
                    var emp = 'SUN FRUITS PACKS';
                } else if (bd == 'SYA') {
                    var emp = 'SANTUARIO YAUCA';
                }
                $('.dx-toolbar-before').html(emp);
            };



            function ListProductos(obj) {
                $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');

                if (obj.vcBaseDatos != "") {
                    $.ajax({
                        type: 'POST',
                        url: "../SerLogi.asmx/ListProductosNis",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            
                            if (lst != '') {
                                Cargartabla(lst, obj.vcBaseDatos);
                            } else {
                                toastr.error('No Se Encontraron Datos', '');
                                $('#container-x').html('<div style="text-align: center; font-size: 20px; font-weight: bold;">No Se Encontraron Datos</div>');
                            }

                        },
                        error: function (error) {
                            toastr.error(JSON.stringify(error), '');
                            $('#BtnSave').hide();
                        }
                    });

                } else {
                    $('#container-x').html('');
                    toastr.error('Seleccione Base de datos', 'Faltan datos');
                }

            };


            $("#btnRead").click(function () {
                var obj = new Object();
                obj.vcBaseDatos = $('#nIdBaseDatos').val();
                if (obj.vcPeriodo == "") {
                    toastr.error('', 'Seleccione Base Datos');
                    $('#container-x').html('');
                    return;
                }
                obj.vcDescripcion = $('#cDescripcion').val();

                if (obj.vcDescripcion === '') {
                    if ($("#nIdGrupo").dxSelectBox('instance').option('selectedItem') != null) {
                        obj.vnIdGrupo = $("#nIdGrupo").dxSelectBox('instance').option('selectedItem').IDGRUPO;
                    } else {
                        toastr.error('', 'Seleccione Grupo de Productos');
                        return;
                    }
                } else {
                    if ($("#nIdGrupo").dxSelectBox('instance').option('selectedItem') != null) {
                        obj.vnIdGrupo = $("#nIdGrupo").dxSelectBox('instance').option('selectedItem').IDGRUPO;
                    } else {
                        obj.vnIdGrupo = ''
                    }
                }

                if ($("#nIdSubGrupo").dxSelectBox('instance').option('selectedItem') != null) {
                    obj.vnIdSubGrupo = $("#nIdSubGrupo").dxSelectBox('instance').option('selectedItem').IDSUBGRUPO;
                } else {
                    obj.vnIdSubGrupo = ''
                }
                

                ListProductos(obj)
            });

      
            function updateProductos() {
                var obj = new Object();
                obj.vcBaseDatos = $('#nIdBaseDatos').val();
                var dataItems = dataGrid.getDataSource().items()

                if (obj.vcBaseDatos != "") {
                
                    $.ajax({
                        type: 'POST',
                        url: "../SerLogi.asmx/ProductosNisUpdate",
                        data: JSON.stringify({ obj: obj, arrayTaa: dataItems }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            if (lst != '') {

                                toastr.success('', 'Productos Actualizados');
                                obj.vcBaseDatos = $('#nIdBaseDatos').val();
                                if (obj.vcPeriodo == "") {
                                    toastr.error('', 'Seleccione Base Datos');
                                    $('#container-x').html('');
                                    return;
                                }
                                obj.vcDescripcion = $('#cDescripcion').val();

                                if (obj.vcDescripcion === '') {
                                    if ($("#nIdGrupo").dxSelectBox('instance').option('selectedItem') != null) {
                                        obj.vnIdGrupo = $("#nIdGrupo").dxSelectBox('instance').option('selectedItem').IDGRUPO;
                                    } else {
                                        toastr.error('', 'Seleccione Grupo de Productos');
                                        return;
                                    }
                                } else {
                                    if ($("#nIdGrupo").dxSelectBox('instance').option('selectedItem') != null) {
                                        obj.vnIdGrupo = $("#nIdGrupo").dxSelectBox('instance').option('selectedItem').IDGRUPO;
                                    } else {
                                        obj.vnIdGrupo = ''
                                    }
                                }

                                if ($("#nIdSubGrupo").dxSelectBox('instance').option('selectedItem') != null) {
                                    obj.vnIdSubGrupo = $("#nIdSubGrupo").dxSelectBox('instance').option('selectedItem').IDSUBGRUPO;
                                } else {
                                    obj.vnIdSubGrupo = ''
                                }


                                ListProductos(obj)
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
                    toastr.error('Base de Datos no Seleccionada', 'Error');
                    $('#BtnSave').hide();
                }

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
