<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_InfPartCampActSimple.aspx.cs" Inherits="SFC_WEB_APP.Mod_Agro.Wfo_InfPartCampActSimple" %>

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
        <style>
            .options {
                padding: 10px;
                margin-top: 0px;
            }

            .caption {
                font-size: 10px;
                font-weight: 500;
            }

            .option {
                margin-top: 0px;
            }

            .dx-datagrid-rowsview .dx-row > .dx-master-detail-cell {
                padding: 12px;
            }

            #DataGrid {
                font-size: 10px;
                font-weight: bold;
                width: 100%;
            }

/*            #gridContainer {
                height: 440px;
            }

            #DataGrid {
                height: 520px;
                width: 100%;
            }*/
            .dx-datagrid-content .dx-datagrid-table .dx-row > td, .dx-datagrid-content .dx-datagrid-table .dx-row > tr > td {
            font-size: 10px;
            }
        </style>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
    </asp:Content>
    <asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
    </asp:Content>
    <asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
        <div class="row">
            <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2" id="DivFeInicio">
                <label for="txtFeInicio">Fecha</label>
                <input type="text" id="txtFeInicio" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
                <script type="text/javascript">
                    $(function () {
                        $('#<%=txtFeInicio.ClientID %>').datetimepicker({
                        format: 'DD/MM/YYYY',
                        locale: 'es'
                    });
                    $(function () {
                        $('#DivFeInicio').datetimepicker({
                            format: 'DD/MM/YYYY',
                            locale: 'es'
                        });
                    });
                });
                </script>
            </div>
            <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
                <label for="btnBusc">&nbsp;</label>
                <button type="button" id="btnBusc" runat="server" class="btn btn-secondary col-12">
                    <i class="fa fa-search"></i> Recuperar
                </button>
            </div>
            <div id="Div_close_part" class="form-group col-6 col-sm-6 col-md-5 col-lg-2" style="display: none">
                <label for="btnBusc">&nbsp;</label>
                <button type="button" id="close_part" runat="server" class="btn btn-secondary col-12">
                    <i class="fa fa-save"></i> Cerrar Partes
                </button>
            </div>
        </div>
        <section id="cell-background" style="height: 100%">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Partes de Campo Pendientes de Aprobacion</h4>
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
        <script>
            $(document).ready(function () {
                removeTag("footer");
                ObtieneInformacion();
            });
            $("#<%=btnBusc.ClientID%>").click(function () {
                ObtieneInformacion();
            });

            function ObtieneInformacion() {
                $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                var obj = new Object();
                obj.vcFecha = $("#<%=txtFeInicio.ClientID%>").val();

                var tmp = null;
                $.ajax({
                    type: 'POST',
                    url: "../SerAgro.asmx/InfPartCampActSimple",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        lst = JSON.parse(data.d);
                        $('#container-x').html('<div class="options"><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="DataGrid"></div>');
                        var data = new Array();
                        for (var x = 0; x < lst.dh.length; x++) {
                            var row = {};
                            row["Id"] = lst.dh[x].Id;
                            row["Serie"] = lst.dh[x].Serie;
                            row["Numero"] = lst.dh[x].Numero;
                            row["Fecha"] = DateConvert(lst.dh[x].Fecha);
                            row["Descripción Cultivo"] = lst.dh[x]['Descripción Cultivo'];
                            row["Nombre Actividad Producción"] = lst.dh[x]['Nombre Actividad Producción']; 
                            if (lst.dh[x]['Tarea Serie Numero'] == null) {
                                row["Tarea Serie Numero"] = '0';
                            } else {
                                row["Tarea Serie Numero"] = lst.dh[x]['Tarea Serie Numero'];
                            }
                            
                            data[x] = row;
                        }
                        							

                        var datad = new Array();
                        for (var x = 0; x < lst.dd.length; x++) {
                            var row = {};
                            row["Id"] = lst.dd[x].Id;
                            row["TipoRegistro"] = lst.dd[x].TipoRegistro;
                            row["Trabajador"] = lst.dd[x].Trabajador;
                            row["Nombre Trabajador"] = lst.dd[x]['Nombre Trabajador'];
                            row["Total Horas"] = lst.dd[x]['Total Horas'];
                            row["Nombre Artículo"] = lst.dd[x]['Nombre Artículo'];
                            row["Cantidad"] = lst.dd[x].Cantidad;
                            row["Hora Inicio"] = DateTimeConvert(lst.dd[x]['Hora Inicio']);
                            row["Hora Fin"] = DateTimeConvert(lst.dd[x]['Hora Fin']);
                            datad[x] = row;
                        }
                        TbDataGrid(data, datad);
                    }
                });
            }
            var cad_id = '';

            function TbDataGrid(datah, datad) {
                DevExpress.localization.locale('es');
                cad_id = '';
                $("#Div_close_part").hide();
                var dataGrid = $("#DataGrid").dxDataGrid({
                    dataSource: datah,
                    keyExpr: "Id",
                    selection: {
                        mode: "multiple",
                    },
                    showBorders: true,
                    paging: {
                        enabled: false
                    },
                    allowColumnReordering: true,
                    allowColumnResizing: true,
                    columnMinWidth: 30,
                    columnAutoWidth: true,
                    showBorders: true,
                    columnFixing: {
                        enabled: true
                    },
                    bindingOptions: {
                        headerFilter: "headerFilter"
                    },
                    columnChooser: {
                        enabled: true
                    },
                    groupPanel: {
                        visible: true
                    },
                    //wordWrapEnabled: true,
                    //export: {
                    //    enabled: true,
                    //    fileName: "Reporte"
                    //},

                    filterRow: {
                        visible: false,
                        applyFilter: "auto"
                    },
                    searchPanel: {
                        visible: false,
                        placeholder: "Buscar..."
                    },
                    headerFilter: {
                        visible: false
                    },					
                    columns: [{
                            caption: "Numero",
                            dataField: "Numero",
                            width: 80
                    }, {
                            caption: "Serie",
                            dataField: "Serie",
                            visible: false
                    }, {
                            caption: "Fecha",
                            dataField: "Fecha",
                            width: 80
                    }, {
                            caption: "Lote",
                            dataField: "Descripción Cultivo",
                            width: 80
                    }, {
                            caption: "Nombre Actividad Producción",
                            dataField: "Nombre Actividad Producción",
                          //  groupIndex: 1
                        }, {
                            caption: "Tarea Serie Numero",
                            dataField: "Tarea Serie Numero",
                            //  groupIndex: 1Tarea Serie Numero
                            groupIndex: 0,
                            visible: false
                        }],
                    onSelectionChanged: function (selectedItems) {
                        changedBySelectBox = false;
                        var data = selectedItems.selectedRowsData;
                        if (data.length > 0)
                            cad_id = $.map(data, function (value) {
                                return value.Id;
                            }).join(";")
                        else
                            cad_id = '';
                            $("#Div_close_part").hide();
                        if (!changedBySelectBox)
                            changedBySelectBox = false;
                        if (cad_id != '') {
                            $("#Div_close_part").show();
                        } else {
                            $("#Div_close_part").hide();
                        }
                    },
                    masterDetail: {
                        enabled: true,
                        //autoExpandAll: true,
                        template: function (container, options) {
                           // var currentData = options.data;
                            $("<div>")
                                .addClass("master-detail-caption")
                                .text('')
                                .appendTo(container);

                            $("<div>")
                                .dxDataGrid({
                                    columnAutoWidth: true,
                                    showBorders: true,
                                    scrolling: {
                                        mode: "virtual"
                                    },
                                    columns: [
                                        {
                                            caption: "Tipo",
                                            dataField: "TipoRegistro",
                                        },{
                                            caption: "Nombre Trabajador",
                                            dataField: "Nombre Trabajador",
                                        },{
                                            caption: "Total Horas",
                                            dataField: "Total Horas",
                                        }, {
                                            caption: "Nombre Artículo",
                                            dataField: "Nombre Artículo",
                                        },{
                                            caption: "Cantidad",
                                            dataField: "Cantidad",
                                        },{
                                            caption: "Hora Inicio",
                                            dataField: "Hora Inicio",
                                        },{
                                            caption: "Hora Fin",
                                            dataField: "Hora Fin",
                                        }],
                                    dataSource: new DevExpress.data.DataSource({
                                        store: new DevExpress.data.ArrayStore({
                                            key: "Id",
                                            data: datad
                                        }),
                                        filter: ["Id", "=", options.key]
                                    })
                                }).appendTo(container);
                        }
                    }
                }).dxDataGrid("instance");

                $("#autoExpand").dxCheckBox({
                    value: false,
                    text: "Expandir Todo",
                    onValueChanged: function (data) {

                        var dataGrid = $('#DataGrid').dxDataGrid('instance');
                        if (data.value == 1) {
                            dataGrid.expandAll(-1);
                        } else {
                            dataGrid.collapseAll(-1) ;
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

                var clearButton = $("#gridClearSelection").dxButton({
                    text: "Clear Selection",
                    disabled: true,
                    onClick: function () {
                        dataGrid.clearSelection();
                    }
                }).dxButton("instance");

            };

            $("#<%=close_part.ClientID%>").click(function () {
                var obj = new Object();
                obj.vcValor = cad_id;
                $.ajax({
                    type: 'POST',
                    url: "../SerAgro.asmx/FinalizarPartesCampo",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        if (data.d >= 0) {
                            ShowToast('success', 'Partes Cerrados', '')
                            ObtieneInformacion();
                        } else {
                            ShowToast('error', 'Ocurrio un Error', 'uno o varios partes no se cerraron')
                        }
                    }
                });
            });



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

            function DateConvert2(datestring) {
                if (datestring != null) {
                    var fullDate = new Date(parseInt(datestring.substr(6)));

                    var twoDigitMonth = (fullDate.getMonth() + 1) + ""; if (twoDigitMonth.length == 1) twoDigitMonth = "0" + twoDigitMonth;
                    var twoDigitDate = fullDate.getDate() + ""; if (twoDigitDate.length == 1) twoDigitDate = "0" + twoDigitDate;
                    var currentDate = twoDigitDate + "/" + twoDigitMonth + "/" + fullDate.getFullYear();

                    var twoDigitHour = fullDate.getHours() + ""; if (twoDigitHour.length == 1) twoDigitHour = "0" + twoDigitHour;
                    var twoDigitMinutes = fullDate.getHours() + ""; if (twoDigitMinutes.length == 1) twoDigitMinutes = "0" + twoDigitMinutes;
                    var currentHour = twoDigitHour + ':' + twoDigitMinutes;
                    if (currentHour != '00:00') {
                        return currentDate + ' ' + currentHour;
                    } else {
                        return currentDate;
                    }

                } else {
                    return '';
                }
            }

            function DateConvert(dateStr) {
                if (dateStr != null) {
                    var m, day;
                    jsonDate = dateStr;
                    var d = new Date(parseInt(jsonDate.substr(6)));
                    m = d.getMonth() + 1;
                    if (m < 10)
                        m = '0' + m
                    if (d.getDate() < 10)
                        day = '0' + d.getDate()
                    else
                        day = d.getDate();
                    return (day + '/' + m + '/' + d.getFullYear())
                } else {
                    return '';
                }
            }

            function DateTimeConvert(dateStr) {
                if (dateStr != null) {
                        jsonDate = dateStr;
                        var d = new Date(parseInt(jsonDate.substr(6)));
                        var m, day;
                        m = d.getMonth() + 1;
                        if (m < 10)
                            m = '0' + m
                        if (d.getDate() < 10)
                            day = '0' + d.getDate()
                        else
                            day = d.getDate();
                        var formattedDate = day + "/" + m + "/" + d.getFullYear();
                        var hours = (d.getHours() < 10) ? "0" + d.getHours() : d.getHours();
                        var minutes = (d.getMinutes() < 10) ? "0" + d.getMinutes() : d.getMinutes();
                        var formattedTime = hours + ":" + minutes + ":" + d.getSeconds();
                        formattedDate = formattedDate + " " + formattedTime;
                        return formattedDate;
                } else {
                    return '';
                }
            }

            function ShowToast(tipo, titulo, mensaje) {
                toastr.options = {
                    tapToDismiss: false
                    , timeOut: 5000
                    , extendedTimeOut: 0
                    , allowHtml: true
                    , preventDuplicates: false
                    , preventOpenDuplicates: false
                    , newestOnTop: true
                    , closeButton: true
                    //, closeHtml: '<button class="btn-sm" style="background-color: grey; padding: 5px;">X</button>'
                }
                toastr[tipo](mensaje, titulo);
            }

        </script>
    </asp:Content>
    <asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
    </asp:Content>
