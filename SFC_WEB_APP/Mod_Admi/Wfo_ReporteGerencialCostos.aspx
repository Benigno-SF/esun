<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ReporteGerencialCostos.aspx.cs" Inherits="SFC_WEB_APP.Mod_Admi.Wfo_ReporteGerencialCostos" %>

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

    <script type="text/javascript">
        var theme = '';
        try {
            if (jQuery) {
                $(document).ready(function () {
                    $(".example-description").css('margin-bottom', 15);

                    if (document.getElementById('chartContainer')) {
                        InitResponse();
                        var response = new $.jqx.response();

                        if (response.device.type === "Phone") {
                            var chart = document.getElementById('chartContainer');

                            if (chart) {
                                chart.style.marginLeft = '5%';
                                chart.style.width = '90%';
                            }
                        }
                    }
                });
                theme = getDemoTheme();
                if (window.location.toString().indexOf('file://') >= 0) {
                    var loc = window.location.toString();
                    var addMessage = false;
                    if (loc.indexOf('grid') >= 0 || loc.indexOf('chart') >= 0 || loc.indexOf('tree') >= 0 || loc.indexOf('list') >= 0 || loc.indexOf('combobox') >= 0 || loc.indexOf('php') >= 0 || loc.indexOf('adapter') >= 0 || loc.indexOf('datatable') >= 0 || loc.indexOf('ajax') >= 0) {
                        addMessage = true;
                    }

                    if (addMessage) {
                        $(document).ready(function () {
                            setTimeout(function () {
                                $(document.body).prepend($('<div style="font-size: 12px; font-family: Verdana;">Note: To run a sample that includes data binding, you must open it via "http://..." protocol since Ajax makes http requests.</div><br/>'));
                            }
                                , 50);
                        });
                    }
                }
            }
            else {
                $(document).ready(function () {
                    theme = getDemoTheme();
                });
            }
        }
        catch (error) {
            var er = error;
        }
    </script>
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


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
           <asp:UpdatePanel runat="server" ID="UpdDLL1" style="width: -webkit-fill-available;" class="col-md-12 p-0 m-0">
            <ContentTemplate>
                <div class="row">
                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 m-0">
                        <label for="ddlAnio" class="col-form-label">Año</label>
                        <asp:DropDownList ID="ddlAnio" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAnio_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 m-0">
                        <label for="ddlAProceso" class="col-form-label">Periodo</label>
                        <asp:DropDownList ID="ddlPeriodo" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPeriodo_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 m-0" style="display: none">
                        <label for="message-text" class="col-form-label">Semana:</label>
                        <asp:DropDownList ID="ddlSemana" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 m-0">
                        <label for="message-text" class="col-form-label">Ambito:</label>
                        <asp:DropDownList ID="ddlAmbito" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 pb-0 mb-0">
                        <label for="ttabla" class="col-form-label">Tipo Rep</label>
                        <select class="form-control" id="ttabla" name="ttabla">
                            <option value="0" selected disabled>Seleccione</option>
                            <option value="P">Pivot</option>
                            <option value="T">Tabla</option>
                        </select>
                    </div>
                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2 m-0">
                        <label for="btnRec" class="col-form-label">&nbsp;</label>
                        <button type="button" id="btnRec" name="btnRec" runat="server" class="btn btn-secondary col-12">
                            <i class="fa fa-search"></i>Recuperar
                        </button>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlAnio" />
                <asp:AsyncPostBackTrigger ControlID="ddlPeriodo" />
            </Triggers>
        </asp:UpdatePanel>
        <div class="row">
                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-12 m-0">
                        <b><label class="col-form-label" id="title"></label></b>
                    </div>
            </div>
            <section id="cell-background" style="height: 700px;">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title" id="titlet">Reporte Gerencial de Costeo</h4>
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
              //$('#cell-background').hide();
              cargatabla();
          });

          function cargatabla() {
              var obj = new Object();
              obj.vcIdEmpresa = fuGetCdEmpre();
              obj.vcPeriodo = $("#<%=ddlPeriodo.ClientID%>").val();
              obj.vcAmbito = $("#<%=ddlAmbito.ClientID%>").val();
              obj.vcTRep = $("#ttabla option:selected").val();
              obj.vcAnio = $("#<%=ddlAnio.ClientID%>").val();
              //$('#btn-pdf').hide();
              //$('#tccontainer').hide();

              if (obj.vcPeriodo != '0' && obj.vcAmbito != '0' && obj.vcTRep != '0') {
                  $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                  $.ajax({
                      type: 'POST',
                      url: "../SerAdmi.asmx/ListGerCostos",
                      data: JSON.stringify({ obj: obj }),
                      dataType: 'json',
                      contentType: 'application/json; charset=utf-8',
                      error: function () {
                          $('#activos').hide();
                      },
                      success: function (data) {
                          var lst = JSON.parse(data.d);
                          console.log(JSON.stringify(lst));
                          var data = new Array();
                          for (var x = 0; x < lst.length; x++) {
                              var row = {};
                              row["tipo"]  = lst[x].tipo;
                              row["Nivel1"] = lst[x].Nivel1;
                              row["Nivel2"] = lst[x].Nivel2;
                              row["Nivel3"] = lst[x].Nivel3;
                              row["idccosto"] = lst[x].idccosto;
                              row["dsc_ccosto"] = lst[x].dsc_ccosto;
                              row["idproducto"] = lst[x].idproducto;
                              row["dsc_producto"] = lst[x].dsc_producto;
                              row["Cst_Mes"] = lst[x].Cst_Mes;
                              row["cantidad_kg"] = lst[x].cantidad_kg;
                              row["Kg_acumulado"] = lst[x].Kg_acumulado;
                              row["UnidCost"] = lst[x].UnidCost;
                              row["Costo_S_UnidCost"] = lst[x].Costo_S_UnidCost;
                              row["Costo_$_UnidCost"] = lst[x].Costo_$_UnidCost;
                              row["tcambio"] = lst[x].tcambio;
                              row["Campaña"] = lst[x].Campaña;
                              row["desde"] = DateConvert(lst[x].desde);
                              row["hasta"] = DateConvert(lst[x].hasta);
                              row["Cst_Acum_Mantenimiento"] = lst[x].Cst_Acum_Mantenimiento;
                              row["Cst_Acum_Cosecha"] = lst[x].Cst_Acum_Cosecha;
                              row["Cst_Tot_Acumulado"] = lst[x].Cst_Tot_Acumulado;
                              row["Cst_Aplicado"] = lst[x].Cst_Aplicado;
                              row["Kg_proyectado"] = lst[x].Kg_proyectado;
                              row["Peso_Normalizado"] = lst[x].Peso_Normalizado;
                              row["cantidad_prod"] = lst[x].cantidad_prod;
                              row["UnidProd"] = lst[x].UnidProd;
                              row["Costo_S_UnidProd"] = lst[x].Costo_S_UnidProd;
                              row["Costo_$_UnidProd"] = lst[x].Costo_$_UnidProd;



                              //row["ULTFECHACOMPRA   "] = DateConvert(lst[x].ULTFECHACOMPRA);

                              //if (lst[x].NDIASCOM != null) {
                              //    row["NDIASCOM"] = lst[x].NDIASCOM;
                              //} else {
                              //    row["NDIASCOM"] = 0;
                              //}

                              //row["ULTFECHASALIDA"] = DateConvert(lst[x].ULTFECHASALIDA);

                              //if (lst[x].NDIASSAL != null) {
                              //    row["NDIASSAL"] = lst[x].NDIASSAL;
                              //} else {
                              //    row["NDIASSAL"] = 0;
                              //}

                              data[x] = row;
                          }

                          if (obj.vcAmbito == 'A') {
                              $('#titlet').text('Costeo del periodo ' + obj.vcPeriodo + ' - AGRO')
                          } else if (obj.vcAmbito == 'P') {
                              $('#titlet').text('Costeo del periodo ' + obj.vcPeriodo + ' - PLANTA')
                          } else if (obj.vcAmbito == '_') {
                              $('#titlet').text('Costeo del periodo ' + obj.vcPeriodo + ' - AGRO Y PLANTA')
                          }

                          if (obj.vcTRep == 'P') {
                              $('#container-x').html('<div id="PivotGrid"></div>');
                              TbPivotGrid(data, obj.vcAmbito);
                          } else if (obj.vcTRep == 'T') {
                              var tblgrid = '';
                              $('#container-x').html('<div class="options"><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="DataGrid"></div>');
                              TbDataGrid(data, obj.vcAmbito);
                          }
                      },
                      error: function (data) {
                          alert(JSON.stringify(data));
                      }
                  });
              } else {
                  ShowToast('error', 'SELECCIONE UNA FECHA Y TIPO REPORTE', '')
              }
          }

          $(document).ready(function () {
              var MyDate = new Date();
              var MyDateString; MyDate.setDate(MyDate.getDate() + 20);
              MyDateString = ('0' + MyDate.getDate()).slice(-2) + '/' + ('0' + (MyDate.getMonth() + 1)).slice(-2) + '/' + MyDate.getFullYear();

          });


          function TbPivotGrid(data, amb) {
              DevExpress.localization.locale('es');
              if (amb == 'A') {
                  var niv1 = 'Fundo';
                  var niv2 = 'Cultivo';
                  var niv3 = 'Lote';
              } else if (amb == 'P') {
                  var niv1 = 'Cultivo';
                  var niv2 = 'Variedad';
                  var niv3 = 'Presentacion';
              } else if (amb == '_') {
                  var niv1 = 'Nivel 1';
                  var niv2 = 'Nivel 2';
                  var niv3 = 'Nivel 3';
              }

              $("#PivotGrid").dxPivotGrid({
                  allowSortingBySummary: true,
                  allowSorting: true,
                  allowFiltering: true,
                  //  allowExpandAll: false,
                  height: 440,
                  showBorders: true,
                  bindingOptions: {
                      headerFilter: "headerFilter"
                  },
                  //fieldPanel: {
                  //    visible: true
                  //},
                  fieldChooser: {
                      allowSearch: true,
                      // enabled: true
                  },
                  export: {
                      enabled: true,
                      fileName: "Reporte Costos"
                  },
                  printingEnabled: true,
                  dataSource: {
                      fields: [
                          {
                              caption: niv1,
                              width: 120,
                              dataField: "Nivel1",
                              area: "row"
                          },
                          {
                              caption: niv2,
                              dataField: "Nivel2",
                              width: 150,
                              area: "row",
                          },
                          {
                              caption: niv3,
                              dataField: "Nivel3",
                              width: 150,
                              area: "row",
                              //selector: function (data) {
                              //    return data.PRODUCTO + " (" + data.GRUPO + ")";
                              //}
                          },
                          {
                              dataField: "dsc_ccosto",
                              area: "3"
                          },
                          {
                              caption: "Cst_Acum_Mantenimiento",
                              dataField: "Cst_Acum_Mantenimiento",
                              dataType: "number",
                              summaryType: "sum",
                              format: function (value) {
                                  return formatNumber.new(value.toFixed(2));
                              },
                              area: "data"
                          }, {
                              caption: "Cst_Acum_Cosecha", 
                              dataField: "Cst_Acum_Cosecha",
                              dataType: "number",
                              summaryType: "sum",
                              format: function (value) {
                                  return formatNumber.new(value.toFixed(2));
                              },
                              area: "data"
                          }, {
                              caption: "Cst_Tot_Acumulado",
                              dataField: "Cst_Tot_Acumulado",
                              dataType: "number",
                              summaryType: "sum",
                              format: function (value) {
                                  return formatNumber.new(value.toFixed(2));
                              },
                              area: "data"
                          }],
                      store: data
                  }
              });

          }

          function TbDataGrid(data, amb) {
              DevExpress.localization.locale('es');

              if (amb == 'A') {
                  var niv1 = 'Fundo';
                  var niv2 = 'Cultivo';
                  var niv3 = 'Lote';
              } else if (amb == 'P') {
                  var niv1 = 'Cultivo';
                  var niv2 = 'Variedad';
                  var niv3 = 'Presentacion';
              } else if (amb == '_') {
                  var niv1 = 'Nivel 1';
                  var niv2 = 'Nivel 2';
                  var niv3 = 'Nivel 3';
              }

              var dataGrid = $("#DataGrid").dxDataGrid({
                  dataSource: data,
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
                  export: {
                      enabled: true,
                      fileName: "Reporte Productos"
                  },

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
              //  groupIndex: 0,
                  columns: [
                    { caption: "tipo", dataField: "tipo", width: 150, visible: false }
                  , { caption: niv1, dataField: "Nivel1", width: 150 }
                  , { caption: niv2, dataField: "Nivel2", width: 100 }
                  , { caption: niv3, dataField: "Nivel3", width: 150 }
                  , { caption: "Centro de Costo", dataField: "idccosto", width: 100 }
                  , { caption: "Descripcion Costo", dataField: "dsc_ccosto", width: 350 }
                  , { caption: "ID Producto", dataField: "idproducto", width: 150 }
                  , { caption: "Descripcion Producto", dataField: "dsc_producto", width: 350 }
                      , { caption: "Cst_Mes", dataField: "Cst_Mes", format: function (value) { return formatNumber.new(value.toFixed(2)); }, width: 120 }
                  , { caption: "Cantidad kg", dataField: "cantidad_kg", format: function (value) { return formatNumber.new(value.toFixed(3)); }, width: 120 }
                  , { caption: "Kg Acumulado", dataField: "Kg_acumulado", format: function (value) { return formatNumber.new(value.toFixed(3)); }, width: 120 }
                  , { caption: "Unidad Costo", dataField: "UnidCost", width: 80 }
                  , { caption: "Costo Und Soles", dataField: "Costo_S_UnidCost", format: function (value) { return formatNumber.new(value.toFixed(6)); }, width: 120 }
                  , { caption: "Costo Und Dolares", dataField: "Costo_$_UnidCost", format: function (value) { return formatNumber.new(value.toFixed(6)); }, width: 120 }
                      , { caption: "Tipo Cambio", dataField: "tcambio", format: function (value) { return formatNumber.new(value.toFixed(3)); }, width: 100 }
                  , { caption: "Campaña", dataField: "Campaña", width: 100 }
                  , { caption: "Desde", dataField: "desde", width: 100 }
                  , { caption: "Hasta", dataField: "hasta", width: 100 }
                  , { caption: "Cst Acum Mantenimiento", dataField: "Cst_Acum_Mantenimiento", format: function (value) { return formatNumber.new(value.toFixed(2)); }, width: 150 }
                  , { caption: "Cst Acum Cosecha", dataField: "Cst_Acum_Cosecha", format: function (value) { return formatNumber.new(value.toFixed(2)); }, width: 150 }
                  , { caption: "Cst Tot Acumulado", dataField: "Cst_Tot_Acumulado", format: function (value) { return formatNumber.new(value.toFixed(2)); }, width: 150 }
                  , { caption: "Cst Aplicado", dataField: "Cst_Aplicado", format: function (value) { return formatNumber.new(value.toFixed(2)); }, width: 150 }
                  , { caption: "Kg proyectado", dataField: "Kg_proyectado", format: function (value) { return formatNumber.new(value.toFixed(3)); }, width: 150 }
                  , { caption: "Peso Normalizado", dataField: "Peso_Normalizado", format: function (value) { return formatNumber.new(value.toFixed(3)); }, width: 150 }
                  , { caption: "Cantidad Prod", dataField: "cantidad_prod", format: function (value) { return formatNumber.new(value.toFixed(3)); }, width: 150 }
                  , { caption: "Unid Prod", dataField: "UnidProd", width: 100 }
                  , { caption: "Costo S/ UnidProd", dataField: "Costo_S_UnidProd", format: function (value) { return formatNumber.new(value.toFixed(6)); }, width: 120 }
                  , { caption: "Costo $ UnidProd", dataField: "Costo_$_UnidProd", format: function (value) { return formatNumber.new(value.toFixed(6)); }, width: 120 }
                  ],
                  sortByGroupSummaryInfo: [{
                      summaryItem: "count"
                  }],
                  summary: {
                      groupItems: [{
                          column: "tipo",
                          summaryType: "count",
                          displayFormat: "{0} items",
                      }, {
                              column: "Cst_Mes",
                              summaryType: "sum",
                              valueFormat: function (value) {
                                  return formatNumber.new(value.toFixed(2));
                              },
                              displayFormat: "{0}",
                              showInGroupFooter: false,
                              alignByColumn: true
                          }, {
                          column: "Cst_Acum_Mantenimiento",
                          summaryType: "sum",
                          valueFormat: function (value) {
                              return formatNumber.new(value.toFixed(2));
                          },
                          displayFormat: "{0}",
                          showInGroupFooter: false,
                          alignByColumn: true
                      }, {
                              column: "Cst_Acum_Cosecha",
                          summaryType: "sum",
                          valueFormat: function (value) {
                              return formatNumber.new(value.toFixed(2));
                          },
                          displayFormat: "{0}",
                          showInGroupFooter: false,
                          alignByColumn: true
                          }, {
                              column: "Cst_Tot_Acumulado",
                              summaryType: "sum",
                              valueFormat: function (value) {
                                  return formatNumber.new(value.toFixed(2));
                              },
                              displayFormat: "{0}",
                              showInGroupFooter: false,
                              alignByColumn: true
                          }
                          //, {
                          //    column: "TotalAmount",
                          //    summaryType: "sum",
                          //    valueFormat: "currency",
                          //    displayFormat: "Total: {0}",
                          //    showInGroupFooter: true
                          //}
                      ],
                      totalItems: [{
                          column: "Cst_Mes",
                          summaryType: "sum",
                          valueFormat: function (value) {
                              return formatNumber.new(value.toFixed(2));
                          },
                          displayFormat: "{0}",
                      }, {
                              column: "Cst_Acum_Mantenimiento",
                              summaryType: "sum",
                              valueFormat: function (value) {
                                  return formatNumber.new(value.toFixed(2));
                              },
                              displayFormat: "{0}",
                          }, {
                              column: "Cst_Acum_Cosecha",
                              summaryType: "sum",
                              valueFormat: function (value) {
                                  return formatNumber.new(value.toFixed(2));
                              },
                              displayFormat: "{0}",
                          }, {
                              column: "Cst_Tot_Acumulado",
                          summaryType: "sum",
                          valueFormat: function (value) {
                              return formatNumber.new(value.toFixed(2));
                          },
                          displayFormat: "{0}",
                      }
                          // ...
                      ]
                  }
              }).dxDataGrid("instance");

              $("#autoExpand").dxCheckBox({
                  value: false,
                  text: "Expandir Todos los Grupos",
                  onValueChanged: function (data) {
                      dataGrid.option("grouping.autoExpandAll", data.value);
                  }
              });

              $("#filterRow").dxCheckBox({
                  text: "Filtro de Filas",
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
