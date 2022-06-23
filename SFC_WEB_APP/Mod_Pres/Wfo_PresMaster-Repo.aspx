<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_PresMaster-Repo.aspx.cs" Inherits="SFC_WEB_APP.Mod_Pres.Wfo_PresMaster_Repo" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%: Styles.Render("~/Content/JQWidgets/css") %>
    <%: Scripts.Render("~/js/jqx") %>
    <link href="../Content/JQWidgets/jqx.energyblue.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div id="divPivotGrid" style="height: 500px; width: auto; background-color: white;"></div>
    <div id="drillThroughWindow" style="display: none;">
        <div id="windowHeader">
            Detalle de Suma
        </div>
        <div style="overflow: hidden;" id="windowContent">
            <div id="tableSrcRecords" style="width: 100%; height: 100%;"></div>
        </div>
    </div>
    <asp:HiddenField ID="hdfIdPres" runat="server" />
    <script>
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
        var obPresup = function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdPresupuesto = $("#<%=hdfIdPres.ClientID%>").val();
            var tmp = null;
            $.ajax({
                type: 'POST',
                url: "../SerPres.asmx/RepoPresAll",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                async: false,
                success: function (data) {
                    tmp = JSON.parse(data.d);
                }
            });
            return tmp;
        }();
        $(document).ready(function () {
            removeTag("footer");
            LoadPivot();
        });
        function LoadPivot() {
            var lst = obPresup;
            var source =
            {
                localdata: lst,
                datatype: "json",
                datafields:
                    [
                        { name: 'nIdFundo', type: 'number' },
                        { name: 'cDescFundo', type: 'string' },
                        { name: 'nIdCultivo', type: 'number' },
                        { name: 'cDesCultivo', type: 'string' },
                        { name: 'cCosto', type: 'string' },
                        { name: 'cIdPeriodo', type: 'string' },
                        { name: 'cTrimestre', type: 'string' },
                        { name: 'cPeriodo', type: 'string' },
                        { name: 'cGrupo', type: 'string' },
                        { name: 'Item', type: 'string' },
                        { name: 'nIdParametro', type: 'string' },
                        { name: 'nImpPres', type: 'number' },
                        { name: 'nImpEjec', type: 'number' },
                        { name: 'cVariacion', type: 'number' },
                        { name: 'cPeso', type: 'number' }
                    ]
            };
            var dataAdapter = new $.jqx.dataAdapter(source);
            dataAdapter.dataBind();
            // create a pivot data source from the dataAdapter
            var pivotDataSource = new $.jqx.pivot(
                dataAdapter,
                {
                    customAggregationFunctions: {
                        'var': function (values) {
                            if (values.length <= 1)
                                return 0;
                            var ssum = 0;
                            for (var i = 0; i < values.length; i++)
                                ssum += values[i];
                            return ssum;
                        }
                    },
                    totals: { rows: { grandtotals: true }, columns: { subtotals: false, grandtotals: true } },
                    pivotValuesOnRows: false,
                    rows: [{ dataField: 'cDescFundo' }
                        , { dataField: 'cDesCultivo' }
                        , { dataField: 'cCosto' }
                        , { dataField: 'cGrupo' }
                        , { dataField: 'Item' }
                    ],
                    columns: [
                        { dataField: 'cTrimestre' }
                        , { dataField: 'cPeriodo' }

                    ],
                    filters: [
                        {

                        }
                    ],
                    values: [
                        { dataField: 'nImpPres', 'function': 'sum', text: 'Presupuestado', formatSettings: { decimalPlaces: 2, thousandsSeparator: "," } }
                        , { dataField: 'nImpEjec', 'function': 'sum', text: 'Ejecutado', formatSettings: { decimalPlaces: 2, thousandsSeparator: "," } }
                        , { dataField: 'cVariacion', text: 'Variacion', formatSettings: { prefix: '% ', decimalPlaces: 2, thousandsSeparator: "," } }
                    ]
                });
            $("#divPivotGrid").jqxPivotGrid({
                source: pivotDataSource,
                treeStyleRows: true,
                autoResize: false,
                multipleSelectionEnabled: false,
                theme: 'energyblue',
                cellsRenderer: function (pivotCell) {
                    var getSpecificColumn = function (columnsArray, key, tittle) {
                        var column = null;
                        for (var i = 0; i < columnsArray.length; i++) {
                            if (myPivotGridColumns.visibleLeafItems[i].text == tittle) {
                                var currentColumn = columnsArray[i];
                                var currentColumnKey = currentColumn.parentItem.text;
                                if (currentColumnKey == key) {
                                    column = myPivotGridColumns.visibleLeafItems[i];
                                    break;
                                }
                            }
                        }
                        return column;
                    };
                    var myPivotGridCells = $('#divPivotGrid').jqxPivotGrid('getPivotCells');
                    var myPivotGridColumns = $('#divPivotGrid').jqxPivotGrid('getPivotColumns');
                    //var cellText = pivotCell.value
                    var cellText = pivotCell.value == 0 ? '0.00' : pivotCell.formattedValue;
                    var myPivotGridCells = $('#divPivotGrid').jqxPivotGrid('getPivotCells');
                    if (pivotCell.pivotColumn.text == "Variacion") {
                        var cellParentColumnKey = pivotCell.pivotColumn.parentItem.text;
                        // GetSpecific Column
                        var precolumn = getSpecificColumn(myPivotGridColumns.visibleLeafItems, cellParentColumnKey, "Presupuestado");
                        var ejecolumn = getSpecificColumn(myPivotGridColumns.visibleLeafItems, cellParentColumnKey, "Ejecutado");
                        //
                        var preitem = myPivotGridCells.getCellValue(pivotCell.pivotRow, precolumn);
                        var ejeitem = myPivotGridCells.getCellValue(pivotCell.pivotRow, ejecolumn);
                        var preitemvalue = preitem.value;
                        var ejeitemvalue = ejeitem.value;
                        var calc = Math.round((ejeitemvalue * 100) / preitemvalue);
                        cellText = "% " + ((isNaN(calc)) ? "0" : calc);
                    }
                    if (pivotCell.pivotColumn.text == "Peso") {
                        var cellParentColumnKey = pivotCell.pivotColumn.parentItem.text;
                        console.log(simpleStringify(pivotCell.pivotRow.parentPivotGrid.rows))


                        var ejecolumn = getSpecificColumn(myPivotGridColumns.visibleLeafItems, cellParentColumnKey, "Ejecutado");
                        var itemvalue = myPivotGridCells.getCellValue(pivotCell.pivotRow, ejecolumn);
                        var calc = Math.round(itemvalue.value / pivotCell.value);
                        cellText = "% " + ((isNaN(calc)) ? "0" : calc);
                    }
                    return "<div style='width: calc(100%-8px); height: 100%; padding: 4px; margin: 0px;'>" + cellText + "</div>";
                }
            });
            var pivotGridInstance = $('#divPivotGrid').jqxPivotGrid('getInstance');
            pivotGridInstance.getPivotRows().items[0].expand();
            pivotGridInstance.refresh();
            //
            $('#divPivotGrid').on('pivotcelldblclick', function (event) {
                if ((event.args.pivotColumn.itemColumn == 2) &&
                    (event.args.pivotColumn.text == "Ejecutado") &&
                    (event.args.pivotRow.itemColumn == "4")) {
                    var pivotGridInstance = $('#divPivotGrid').jqxPivotGrid('getInstance');
                    var rows = pivotGridInstance.getPivotCells().drillThroughCell(event.args.pivotRow, event.args.pivotColumn);
                    var drillThroughRows = [];
                    for (var i = 0; i < rows.length; i++)
                        drillThroughRows[i] = obPresup[rows[i]];
                    if (drillThroughRows.length > 0) {
                        var obj = new Object();
                        obj.vcIdEmpresa = fuGetCdEmpre();
                        obj.vnIdPresupuesto = $("#<%=hdfIdPres.ClientID%>").val();
                        obj.vnIdFundo = drillThroughRows[0].nIdFundo;
                        obj.vnIdCultivo = drillThroughRows[0].nIdCultivo;
                        obj.vcIdPeriodo = drillThroughRows[0].cIdPeriodo;
                        obj.vnIdParametro = drillThroughRows[0].nIdParametro;
                        $.ajax({
                            type: 'POST',
                            url: "../SerPres.asmx/ListPresResuDeta",
                            data: JSON.stringify({ obj: obj }),
                            dataType: 'json',
                            contentType: 'application/json; charset=utf-8',
                            async: false,
                            success: function (data) {
                                var lst = JSON.parse(data.d)
                                LoadTbl(lst);
                            }
                        });
                    }
                };
            });
        }

        function LoadTbl(lst) {
            var drillThroughSrc =
            {
                localData: lst,
                dataType: "JSON",
                dataFields:
                    [
                        { name: 'cCuenta', type: 'string' },
                        { name: 'cCcosto', type: 'string' },
                        { name: 'nimporte', type: 'number' },
                        { name: 'cCcosto_origen', type: 'string' },
                        { name: 'cvoucher', type: 'string' },
                        { name: 'cglosa', type: 'string' },
                        
                    ]
            };
            var drillThroughDataAdapter = new $.jqx.dataAdapter(drillThroughSrc);

            $("#tableSrcRecords").jqxDataTable({
                theme: 'energyblue',
                pageable: true,
                width: '100%',
                height: '100%',
                pagerButtonsCount: 20,
                 pageSize: 20 ,
                source: drillThroughDataAdapter,
                columnsResize: true,
                columns: [
                    { text: 'Cuneta', dataField: 'cCuenta', width: 400 },
                    { text: 'C. Costo', dataField: 'cCcosto', width: 500 },
                    { text: 'Importe', dataField: 'nimporte', width: 80, cellsAlign: 'right', align: 'right' },
                    { text: 'C. Costo Origen', dataField: 'cCcosto_origen', width: 500 },
                    { text: 'Voucher', dataField: 'cvoucher', width: 300 },
                    { text: 'Glosa', dataField: 'cglosa', width: 300 },
                ]
            });
            $("#tableSrcRecords").jqxDataTable('refresh');
            $('#drillThroughWindow').jqxWindow('open');
            var offset = $('#divPivotGrid').position();
            // create popup window
            $('#drillThroughWindow').jqxWindow({
                theme: 'energyblue',
                isModal: true,
                modalOpacity: 0.3,
                autoOpen: false,
                position: { x: offset.left + 200, y: offset.top + 90 },
                showCollapseButton: true, maxHeight: 550, maxWidth: 940, minHeight: 550, minWidth: 940, height: 550, width: 940,
                initContent: function () {
                    $('#tableSrcRecords').jqxDataTable({width: '100%', height: '100%'});
                }
            });
            //drillThrough(pivotGridInstance.getPivotRows().items[0], pivotGridInstance.getPivotColumns().items[0].valueItems[0]);
        }
    </script>
    <div id="eventText"></div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
