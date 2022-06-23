<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_RepPesoPaleta.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Wfo_RepPesoPaleta" %>

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
    <!-- END: Vendor CSS-->
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
            height: 70vh;
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
        
        #DataGrid {
            font-size: 15px;
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
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0" id="DivFeIni">
            <label for="txtFeCont">Fecha Inicio</label>
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
            <label for="txtFeCont">Fecha Fin</label>
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
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0" id="">
            <label for="txtFeCont">Numero</label>
            <input type="text" id="cNumero" name="cNumero" autocomplete="off" class="form-control" placeholder="">
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnBusc2" class="btn btn-secondary col-12">
                <i class="fas fa-search"></i> Recuperar
            </button>
        </div>

    </div>
    
    
    <br />
        <section id="cell-background" style="height:80vh;">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Reporte Avance Proceso Detallado </h4>
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
    
        $("#btnBusc2").click(function () {
            cargatabla();
        });


        function cargatabla() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcFecha = $("#txtFeIni").val();
            obj.vcFechaFin = $("#txtFeFin").val();
            obj.vcNumero = $("#cNumero").val();
            //  var f = new Date();
            //alert(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
            if (obj.vcFecha != '' && obj.vcFechaFin != '') {
                $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                $.ajax({
                    type: 'POST',
                    url: "../SerProd.asmx/RepPesoPalet",
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
            } else {
                toastr.error('error', 'Seleccione Fecha', '')
            }
        }

        function TbDataGrid(data) {
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
                    fileName: "Reporte Rendimiento"
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
                columns: [

                    //  { caption: "", dataField: "", width: 150, visible: false }
                    { caption: "NumeroSerie", dataField: "NumeroSerie" }
                    , { caption: "Proveedor", dataField: "Proveedor" }
                    , { caption: "Cultivo", dataField: "Cultivo" }
                    , { caption: "Variedad", dataField: "Variedad" }
                    , { caption: "Envase", dataField: "Envase" }
                    , { caption: "TipoPalet", dataField: "TipoPalet" }
                    , { caption: "nCantidad", dataField: "nCantidad" }
                    , { caption: "nPeso", dataField: "nPeso" }
                    , { caption: "FechaCreacion", dataField: "FechaCreacion", dataType: "date", format: 'dd/MM/yyyy HH:mm:ss' }
                    , { caption: "FechaPeso", dataField: "FechaPeso", dataType: "date", format: 'dd/MM/yyyy HH:mm:ss' }
                    // Id_ArticuloNumeroSerie	NumeroSerie	Proveedor	Cultivo	Variedad	Envase	TipoPalet	nCantidad	nPeso	FechaCreacion	FechaPeso
                   
                ],
                sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }],
                onCellPrepared: function (e) {
                    if (e.rowType === 'header') {
                        e.cellElement.css("backgroundColor", "#657790" /*"#2f394a"*/);
                        e.cellElement.css("color", "#fff");
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


        function clearProceso() {
            $('#msg').text('error al obtener proceso');
            var btn = document.getElementById("Read");
            var tipo = btn.getAttribute("data-tipo");
            $('#lector').hide();
            // $('#info').show();

            btn.setAttribute("data-tipo", 'add');
            $("#btnSave").html('<i class="fas fa-edit"></i> Iniciar Lectura');




            $('#proceso').val(0);
            $('#procesodetalle').val(0);

            window.location.reload();
            return false;
        }


        //function askConfirmation(evt) {
        //    var msg = 'Si recarga la página perdera todos los datos ingresados.\n¿Deseas recargar la página?';
        //    evt.returnValue = msg;
        //    return msg;
        //}
        //window.addEventListener('beforeunload', askConfirmation);

<%--        $('body').on('change', '#<%=ddlAProceso.ClientID%>', function () {
            var id = $(this).val();
            Load_Agrupo(id, 0, '');
        });--%>


    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
