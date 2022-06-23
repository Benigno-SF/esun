<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_CosteoMOSemanal.aspx.cs" Inherits="SFC_WEB_APP.Mod_Admi.Wfo_CosteoMOSemnal" %>

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

    <link rel="stylesheet" type="text/css" href="../Content/De<vExtreme/print.min.css" />
    <script src="../Content/DevExtreme/print.min.js"></script>

        <style>

        .dx-freespace-row {  
           height: 0px !important;  
        }  

        #DataGrid {
            height: 520px;
            width: 100%;
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
            height: 440px;
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
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
                   <asp:UpdatePanel runat="server" ID="UpdDLL1" style="width: -webkit-fill-available;" class="col-md-12">
            <ContentTemplate>
                <div class="row">
                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <label for="ddlAnio" class="col-form-label">Año</label>
                        <asp:DropDownList ID="ddlAnio" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAnio_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <label for="message-text" class="col-form-label">Semana:</label>
                        <asp:DropDownList ID="ddlSemana" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
                        <label for="btnRec">&nbsp;</label>
                        <button type="button" id="btnRec" runat="server" class="btn btn-secondary col-12">
                            <i class="fa fa-search"></i>Recuperar
                        </button>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlAnio" />
            </Triggers>
        </asp:UpdatePanel>

    <section id="cell-background" style="height: 700px;">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">reporte Costos de Mano de Obra por Semana</h4>
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
    <script type="text/javascript">

        $(document).on('click', '#<%=btnRec.ClientID%>', function () {
            cargatabla();
        });

        function cargatabla() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcAnio = $('#<%=ddlAnio.ClientID%>').val();
            obj.vcSemana = $('#<%=ddlSemana.ClientID%>').val();
            $('#btn-pdf').hide();
            $('#tccontainer').hide();

            if (obj.vcAnio != '0') {
                $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                $.ajax({
                    type: 'POST',
                    url: "../SerAdmi.asmx/ListCostosMOSemana",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        var datah = new Array();
                        for (var x = 0; x < lst.dh.length; x++) {
                            var row = {};					
                            row["cl1"] = lst.dh[x]['Clasificador 1: Clase de Costo'];
                            row["cl2"] = lst.dh[x]['Clasificador 2: Unidad'];
                            row["cl3"] = lst.dh[x]['Clasificador 3: Subunidad'];
                            row["cl4"] = lst.dh[x]['Clasificador 4: Tipo de M.Obra'];
                            row["nTrab"] = lst.dh[x].nTrab;
                            row["cst_real"] = lst.dh[x].cst_real;
                            row["cst_estimado"] = lst.dh[x].cst_estimado;
                            row["moda_dtrab"] = lst.dh[x].moda_dtrab;
                            row["id"] = lst.dh[x].id;

                            datah[x] = row;
                        }

                        var datad = new Array();
                        for (var x = 0; x < lst.dd.length; x++) {
                            var row = {};																			
                            row["tipo_trab"] = lst.dd[x].tipo_trab;
                            row["idcodigogeneral"] = lst.dd[x].idcodigogeneral;
                            row["apenom"] = lst.dd[x].apenom;
                            row["dsc_cargo"] = lst.dd[x].dsc_cargo;
                            row["regimen"] = lst.dd[x].regimen;
                            row["idplanilla"] = lst.dd[x].idplanilla;
                            row["tot_dtrabajados"] = lst.dd[x].tot_dtrabajados;
                            row["tothoras_real"] = lst.dd[x].tothoras_real;
                            row["cst_boleta"] = lst.dd[x].cst_boleta;
                            row["cst_estimado"] = lst.dd[x].cst_estimado;
                            row["grupo"] = lst.dd[x].grupo;
                            row["subunidad"] = lst.dd[x].subunidad;
                            row["cultivo"] = lst.dd[x].cultivo;
                            row["tipo_gasto"] = lst.dd[x].tipo_gasto;
                            row["c_costos"] = lst.dd[x].c_costos;
                            row["id"] = lst.dd[x].id;
                            row["iddet"] = lst.dd[x].iddet;
                            datad[x] = row;
                        }

                        
                            $('#container-x').html('<div class="options"><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="DataGrid"></div>');
                            TbDataGrid(datah, datad);
                    },
                    error: function (data) {
                        alert(JSON.stringify(data));
                    }
                });
            } else {
                ShowToast('error', 'SELECCIONE AÑO Y SEMANA', '')
            }
        }

        function TbDataGrid(datah, datad) {
            DevExpress.localization.locale('es');

            var dataGrid = $("#DataGrid").dxDataGrid({
                dataSource: datah,
                keyExpr: "id",
                showBorders: true,
                scrolling: {
                    mode: "virtual"
                },
                grouping: {
                    autoExpandAll: false
                },
                groupPanel: {
                    visible: true
                },
                wordWrapEnabled: true,
                showBorders: true,
                //export: {
                //    enabled: true,
                //    fileName: "Reporte Productos"
                //},

                filterRow: {
                    visible: false,
                    applyFilter: "auto"
                },
                searchPanel: {
                    visible: false,
                    width: 240,
                    placeholder: "Search..."
                },
                headerFilter: {
                    visible: false
                },
                columns: [{
                    dataField: "cl1",
                    caption: "Clase de Costo",
                    width: 120
                },{
                    dataField: "cl2",
                        caption: "Unidad",
                    width: 120
                }, {
                    dataField: "cl3",
                        caption: "Subunidad",
                    width: 150
                }, {
                    dataField: "cl4",
                        caption: "Tipo de M.Obra",
                    width: 280
                    }, {
                        dataField: "nTrab",
                        caption: "nTrab",
                        width: 100
                    }, {
                        dataField: "cst_real",
                        caption: "cst_real",
                        Format: function (value) {
                            return formatNumber.new(value.toFixed(0));
                        },
                        width: 100
                    }, {
                        dataField: "cst_estimado",
                        caption: "cst_estimado",
                        Format: function (value) {
                            return formatNumber.new(value.toFixed(0));
                        },
                        width: 100
                    }, {
                        dataField: "moda_dtrab",
                        caption: "moda_dtrab",
                        width: 120
                    }
                ], sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }],
                summary: {
                    groupItems: [{
                        column: "id",
                        summaryType: "count",
                        displayFormat: "{0} items",
                    }, {
                            column: "nTrab",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(0));
                        },
                        displayFormat: "{0}",
                        showInGroupFooter: false,
                        alignByColumn: true
                    }, {
                            column: "cst_real",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(2));
                        },
                        displayFormat: "{0}",
                        showInGroupFooter: false,
                        alignByColumn: true
                        }, {
                            column: "cst_estimado",
                            summaryType: "sum",
                            valueFormat: function (value) {
                                return formatNumber.new(value.toFixed(2));
                            },
                            displayFormat: "{0}",
                            showInGroupFooter: false,
                            alignByColumn: true
                        }],
                    totalItems: [{
                        column: "nTrab",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(0));
                        },
                        displayFormat: "{0}",
                    },{
                        column: "cst_real",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(2));
                        },
                        displayFormat: "{0}",
                    }, {
                            column: "cst_estimado",
                        summaryType: "sum",
                        valueFormat: function (value) {
                            return formatNumber.new(value.toFixed(2));
                        },
                        displayFormat: "{0}",
                    }
                        // ...
                    ]
                },
                masterDetail: {
                    enabled: true,
                    template: function (container, options) {
                        var currentData = options.data;

                        $("<div>")
                            .addClass("master-detail-caption")
                            .text(currentData.cl1 + " || " + currentData.cl4)
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
                                    dataField: "tipo_trab",
                                }, {
                                    dataField: "idcodigogeneral",
                                }, {
                                    dataField: "apenom",
                                }, {
                                    dataField: "dsc_cargo",
                                }, {
                                    dataField: "regimen",
                                }, {
                                    dataField: "idplanilla",
                                }, {
                                    dataField: "tot_dtrabajados",
                                }, {
                                    dataField: "tothoras_real",
                                }, {
                                        dataField: "cst_boleta",
                                        Format: function (value) {
                                            return formatNumber.new(value.toFixed(0));
                                        },
                                }, {
                                        dataField: "cst_estimado",
                                        Format: function (value) {
                                            return formatNumber.new(value.toFixed(0));
                                        },
                                }, {
                                    dataField: "grupo",
                                }, {
                                    dataField: "subunidad",
                                }, {
                                    dataField: "cultivo",
                                }, {
                                    dataField: "tipo_gasto",
                                }, {
                                    dataField: "c_costos",
                                }],
                                dataSource: new DevExpress.data.DataSource({
                                    store: new DevExpress.data.ArrayStore({
                                        key: "id",
                                        data: datad
                                    }),
                                    filter: ["id", "=", options.key]
                                })
                            }).appendTo(container);
                    }
                }
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

        };

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

        function DateConvert(datestring) {
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

        function print() {
            printJS({
                printable: 'sales',
                type: 'html',
                targetStyles: ['*']
            })
        }

        $(document).on('click', '#printButton', function (event) {
            event.preventDefault();
            print();
        });

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
