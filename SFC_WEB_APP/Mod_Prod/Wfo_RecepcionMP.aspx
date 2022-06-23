<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_RecepcionMP.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Wfo_RecepcionMP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%: Styles.Render("~/Content/JQWidgets/css") %>

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
            padding: 0px;
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
            padding: 10px;
        }
        
        #DataGrid {
            font-size: 10px;
            font-weight: bold;
        }

        .dx-widget {
    color: #333;
    font-weight: 400;
    font-size: 10px;
    font-family: 'Helvetica Neue','Segoe UI',Helvetica,Verdana,sans-serif;
    line-height: 1.35715;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivFeInicio">
            <label for="txtFeInicio">Desde</label>
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
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivFeFin">
            <label for="txtFechaFin">Hasta</label>
            <input type="text" id="txtFeFin" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
            <script type="text/javascript">
                $(function () {
                    $('#<%=txtFeFin.ClientID %>').datetimepicker({
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
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnBusc" runat="server" class="btn btn-secondary col-12">
                <i class="fa fa-search"></i>Buscar
            </button>
        </div>
    </div>
    <section id="cell-background" style="min-height: 30vh">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">reporte Ingreso Materia prima</h4><br />
                                <p><b>- Almacén de cajas:</b> fruta para venta local</p>
                                <p><b>- Almacén materia prima:</b> fruta para proceso en packing</p>
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
           // ObtieneInformacion();
        });
        $("#<%=btnBusc.ClientID%>").click(function () {
            ObtieneInformacion();
        });
        function ObtieneInformacion() {
            $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
            var obj = new Object();
            if ($("#<%=txtFeInicio.ClientID%>").val() === '') {
                toastr.error('', 'Ingrese Fecha Inicio');
                $('#container-x').html('');
                return;
            } else {
                var str1 = $("#<%=txtFeInicio.ClientID%>").val();
                var res1 = str1.split("/", 3);
                obj.vcFecha = res1[2] + res1[1] + res1[0];
            }

            if ($("#<%=txtFeFin.ClientID%>").val() === '') {
                toastr.error('', 'Ingrese Fecha Fin');
                $('#container-x').html('');
                return;
            } else {
                var str1 = $("#<%=txtFeFin.ClientID%>").val();
                var res1 = str1.split("/", 3);
                obj.vcFechaFin = res1[2] + res1[1] + res1[0];;
            }
            var tmp = null;
            $.ajax({
                type: 'POST',
                url: "../SerProd.asmx/ResumenRecepcion_nis",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                async: true,
                success: function (data) {
                   tmp = JSON.parse(data.d);
                        $('#container-x').html('<div id="PivotGrid"></div>');
                    TbPivotGrid(tmp);
                }
            });
        }
        function TbPivotGrid(data) {
            DevExpress.localization.locale('es');

            $("#PivotGrid").dxPivotGrid({
                allowSortingBySummary: true,
                allowSorting: true,
                allowFiltering: true,
                //  allowExpandAll: false,
               // height: 440,
                showBorders: true,
                bindingOptions: {
                    headerFilter: "headerFilter"
                },
                fieldPanel: {
                    visible: true
                },
                fieldChooser: {
                    allowSearch: true,
                     enabled: true
                },
                headerFilter: {
                    allowSearch: true,
                    showRelevantValues: true,
                    width: 300,
                    height: 400
                },
                fieldChooser: {
                    allowSearch: true
                },
                fieldPanel: {
                    visible: true
                },
                export: {
                    enabled: true,
                    fileName: "Reporte Ingreso Materia Prima"
                },
                //printingEnabled: true,
                dataSource: {
                    fields: [
                        // 	DOC_RECEPCION	DOC_REMISION	PESO_GUIA	IDCLIENTE	
                        //IDPRODUCTOR	PRODUCTOR	IDCONSUMIDOR		IDRESPONSABLE	RESPONSABLE	IDPRODUCTO		
                        //IDMEDIDA		PESO_PROM_JABA	PESO_BRUTO	TARA		DIF_PESO	PORC_DIF_PESO	IDCULTIVO	IDVARIEDAD	VARIEDAD	IDINGRESOSALIDAALM	HORAS	IDLOTEP	IDTRANSPORTISTA	TRANSPORTISTA	SEM_PROD	F_COSECHA	PLACA	CHOFER	VENTANA	IDSUCURSAL	DSC_SUCURSAL	IDALMACEN	DSC_ALMACEN	fecha_ingreso	hora_ingreso	diferencia_horas	cant_items	nropresintocampo	Nro_Parte	GLN	IDGG	cc_cpf	nmeses_expiracion		dpr_direccion	GGN	LDP	growercode
                        {
                            caption: "Fecha",
                            width: 120,
                            dataField: "FECHA_CAST",
                            area: "row",
                            //dataType: 'date',
                            expanded: true
                        },
                        {
                            caption: "Cliente",
                            dataField: "CLIENTE",
                            width: 150,
                            area: "row",
                        },
                        {
                            caption: "Cultivo",
                            dataField: "IDCULTIVO",
                            width: 150,
                            area: "row",
                        },
                        {
                            caption: "Variedad",
                            dataField: "DESCRIPCION",
                            width: 150,
                            area: "row",
                        },
                        {
                            caption: "Fundo",
                            dataField: "dpr_fundo",
                            width: 150,
                            area: "row",
                        },
                        {
                            caption: "Lote",
                            dataField: "CONSUMIDOR",
                            width: 150,
                            area: "row",
                        },
                        {
                            caption: "Guia Recepcion Planta",
                            dataField: "DOC_RECEPCION",
                            width: 150,
                            area: "row",
                        },
                        {
                            caption: "Guia Remision Cliente",
                            dataField: "DOC_REMISION",
                            width: 150,
                            area: "row",
                        },
                        {
                            caption: "fechaproceso",
                            width: 120,
                            dataField: "fechaproceso",
                            area: "row",
                            expanded: true,
                            visible: false
                        },
                        {
                            caption: "hora",
                            width: 120,
                            dataField: "hora",
                            area: "row",
                            expanded: true,
                            visible: false
                        },
                        {
                            caption: "Almacenes",
                            dataField: "DSC_ALMACEN",
                            area: "column"
                        },
                        {
                            caption: "Nro Jabas",
                            dataField: "NRO_JABAS",
                            dataType: "number",
                            summaryType: "sum",
                            format: function (value) {
                                return formatNumber.new(value.toFixed(2));
                            },
                            area: "data"
                        },
                        {
                            caption: "Peso Neto",
                            dataField: "PESO_NETO",
                            dataType: "number",
                            summaryType: "sum",
                            format: function (value) {
                                return formatNumber.new(value.toFixed(2));
                            },
                            area: "data"
                        }
                    ],
                    store: data
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
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
