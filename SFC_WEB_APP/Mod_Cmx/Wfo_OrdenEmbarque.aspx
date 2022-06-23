<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_OrdenEmbarque.aspx.cs"  Inherits="SFC_WEB_APP.Mod_Cmx.Wfo_OrdenEmbarque" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.light.css" />
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
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

/*        #gridContainer {
            height: 500px;
        }*/

         #DataGrid {
            height: 70vh;
            width: 100%;
            color: black;
            font-weight: bold;
            font-size: 10px;
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
            font-size: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">

    <div class="row">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-3 pb-0 mb-0">
            <label for="btnBusc">Shipper</label>
               <asp:DropDownList ID="ddlShipper" style="cursor:pointer"  runat="server" CssClass="form-control js-find-shi"></asp:DropDownList>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-3 pb-0 mb-0">
            <label for="btnBusc">Cultivo</label>
            <asp:DropDownList ID="ddlCultivo" style="cursor:pointer" runat="server" onchange="cambio(this)" CssClass="form-control js-find-cul"></asp:DropDownList>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-3 pb-0 mb-0">
            <label for="btnBusc">Campaña</label>
            <asp:DropDownList type="combobox" ID="ddlCampana" style="cursor:pointer" runat="server" CssClass="form-control js-find-cmp"></asp:DropDownList>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2 pb-0 mb-0">
            <label for="recuperar">&nbsp;</label>
            <button type="button" id="recuperar" name="recuperar" class="btn btn-secondary col-12">
                <i class="fa fa-search"></i>Recuperar
            </button>
        </div>
        
    </div>
      <section id="cell-background" style="height: 80vh;">
        <div class="row mt-2">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Ordenes de Embarque</h4>
                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li id="btn-addOE"><a id='btn-add' title="Exportar en Excel"><i class="fas fa-plus"></i></a></li>
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
    <!-- Excel - Cell background table -->
    <div class="modal fade" id="ModGenera" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" style="text-align: center">
                       GENERAR CORRELATIVO
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="obsSalidaSalida">
                        <div class="form-group p-0 m-0" id="DivFechaProceso">
                            <label for="txtFecha">Correlativo Shipper</label>
                            <input type="text" id="txtShipper" autocomplete="off" class="form-control" placeholder="Correlativo Shiper" />
                        </div>
                        <div class="form-group p-0 m-0" id="DivHoraProceso">
                            <label for="recipient-name" class="col-form-label">Correlativo Cliente</label>
                            <input type="text" id="txtCliente" autocomplete="off" class="form-control" placeholder="Correlativo Cliente" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input id="idoem" type="hidden" />
                    <button type="button" id="btnCancelOE" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" id="btnGeneraOE" class="btn btn-primary">Guardar</button>
                </div>
            </div>
        </div>
    </div>

    <input type="text" class="form-control" id="TXTPRUEA" name="name" value="" />

    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="../Scripts/sweetalert2.js"></script>

       <script>

           $("document").ready(function () {
               startslc();
           });

           function startslc() {
               /*PLUGIN SELECT2*/
                   $('.js-find-shi').select2();
                   $('.js-find-cul').select2();
                   $('.js-find-cmp').select2();
               /*FIN PLUGIN*/
           }
           
           $("#recuperar").click(function () {
               cargatabla();    
           });

           function cambio(id) {
               $("#<%=ddlCampana.ClientID%>").empty();
               
               var dt = {
                       objp: {
                           idCampana: 1,
                           campNombre: "",
                           cultivo: id.value
                       }
               }
                         
               $.ajax({
                   method: "POST",
                   data: JSON.stringify(dt),
                   url: "../SerComex.asmx/combocampana",           
                   contentType: "application/json; charset=utf-8",
                   dataType: "json"
               }).done(function (inf) {
                   var req = JSON.parse(inf.d);
                   for (var i = 0; i < req.length; i++) {
                      
                       //Esta data viene con los nombres de cabecera de la base de datos
                       $("#<%=ddlCampana.ClientID%>").prepend("<option value='" + req[i].nIdCampana + "'>" + req[i].cCampNombre + "</option>");
                   }
                   $("#<%=ddlCampana.ClientID%>").prepend("<option value = '0' disabled selected>" + "Seleccione Campaña" + "</option>");
               });

           }
   
           function cargatabla() {
               var obj = new Object();
               obj.vcIdEmpresa = fuGetCdEmpre();
               obj.vnIdOrdenEmbarque = '0';
               obj.vnIdIntruccion = '0';
               obj.vnIdCampana = $("#<%=ddlCampana.ClientID%>").val();
               obj.vnIdShipper = $("#<%=ddlShipper.ClientID%>").val();
               obj.vnIdCultivo = $("#<%=ddlCultivo.ClientID%>").val();
               //  var f = new Date();
               //alert(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
               if (obj.vcIdEmpresa != '' && obj.vcIdEmpresa != null) {
                   $('#container-x').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                   $.ajax({
                       type: 'POST',
                       url: "../SerComex.asmx/OrdenEmbarqueList",
                       data: JSON.stringify({ obj: obj }),
                       dataType: 'json',
                       contentType: 'application/json; charset=utf-8',
                       error: function () {
                           $('#activos').hide();
                       },
                       success: function (data) {
                           var lst = JSON.parse(data.d);
                           var data = new Array();
                           for (var x = 0; x < lst.length; x++) {
                               var row = {};
                               row["cCShipper"] = lst[x].cCShipper;
                               row["cCCliente"] = lst[x].cCCliente;
                               row["nIdOrdenEmbarque"] = lst[x].nIdOrdenEmbarque;
                               row["cDescCliente"] = lst[x].cDescCliente;
                               row["cDescDestino"] = lst[x].cDescDestino;
                               row["cDescConsignee"] = lst[x].cDescConsignee;
                               row["cDescNotify"] = lst[x].cDescNotify;
                               row["cDescNotify2"] = lst[x].cDescNotify2;
                               row["cDescTipoTranporte"] = lst[x].cDescTipoTranporte;
                               row["cDescOpLogistico"] = lst[x].cDescOpLogistico;
                               row["cDescShipper"] = lst[x].cDescShipper;
                               row["dFechaEmbarque"] = lst[x].dFechaEmbarque;
                               row["cDescFlete"] = lst[x].cDescFlete;
                               row["cDescEmisionBL"] = lst[x].cDescEmisionBL;
                               row["cDesCultivo"] = lst[x].cDesCultivo;
                               row["nCajas"] = lst[x].nCajas;
                               row["nPesoNeto"] = lst[x].nPesoNeto;
                               row["nPesoBrutoAprox"] = lst[x].nPesoBrutoAprox;
                               row["cDescLineaNaviera"] = lst[x].cDescLineaNaviera;
                               row["cDescNavio"] = lst[x].cDescNavio + ' | ' + lst[x].cCodeVapor;
                               row["cDescLugarSalida"] = lst[x].cDescLugarSalida;
                               row["dFechaSalida"] = lst[x].dFechaSalida;
                               row["SemanaSalida"] = lst[x].SemanaSalida;
                               row["dFIngresoAlmacen"] = lst[x].dFIngresoAlmacen;
                               row["SemanaIAlmacen"] = lst[x].SemanaIAlmacen;
                               row["dETD"] = lst[x].dETD;
                               row["SemanaETD"] = lst[x].SemanaETD;
                               row["dETA"] = lst[x].dETA;
                               row["SemanaETA"] = lst[x].SemanaETA;
                               row["cSVC"] = lst[x].cSVC;
                               row["dFechaCrea"] = lst[x].dFechaCrea;
                               row["cUsuarioCrea"] = lst[x].cUsuarioCrea;
                               data[x] = row;
                           }

                           $('#container-x').html('<div class="options"><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="DataGrid"></div>');
                           TbDataGrid(data, obj.vcFecha);
                       },
                       error: function (data) {
                           alert(JSON.stringify(data));
                       }
                   });
               } else {
                   toastr.error('error', 'Falta Empresa', '')
               }
           }

           function TbDataGrid(data) {
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
                       fileName: "Reporte Ordenes"
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
                   //  groupIndex: 0,
                   columns: [
                       { caption: "nIdOrdenEmbarque", dataField: "nIdOrdenEmbarque", width: 80}
                       ,{ caption: "Corr. Shipper", dataField: "cCShipper", fixed: true, fixedPosition: "left"}
                       , { caption: "Corr. Cliente", dataField: "cCCliente", fixed: true, fixedPosition: "left" }
                       , { caption: "Shipper", dataField: "cDescShipper" }
                       , { caption: "Cliente", dataField: "cDescCliente" }
                       , { caption: "Destino", dataField: "cDescDestino" }
                       , { caption: "cConsignee", dataField: "cDescConsignee" }
                       , { caption: "Notify", dataField: "cDescNotify" }
                       , { caption: "Notify2", dataField: "cDescNotify2" }
                       , { caption: "Tranporte", dataField: "cDescTipoTranporte" }
                       , { caption: "OpLogistico", dataField: "cDescOpLogistico" }
                       , { caption: "F. Embarque", dataField: "dFechaEmbarque", fixed: true, fixedPosition: "left" }
                       , { caption: "Flete", dataField: "cDescFlete" }
                       , { caption: "EmisionBL", dataField: "cDescEmisionBL" }
                       , { caption: "Cultivo", dataField: "cDesCultivo" }
                       , { caption: "Cajas", dataField: "nCajas" }
                       , { caption: "Peso Neto", dataField: "nPesoNeto" }
                       , { caption: "Kg Aprox", dataField: "nPesoBrutoAprox" }
                       , { caption: "Linea Naviera", dataField: "cDescLineaNaviera" }
                       , { caption: "Navio", dataField: "cDescNavio" }
                       , { caption: "Lugar Salida", dataField: "cDescLugarSalida" }
                       , { caption: "F. Salida", dataField: "dFechaSalida" }
                       , { caption: "S FS", dataField: "SemanaSalida" }
                       , { caption: "Ing Almacen", dataField: "dFIngresoAlmacen" }
                       , { caption: "S IA", dataField: "SemanaIAlmacen" }
                       , { caption: "ETD", dataField: "dETD" }
                       , { caption: "SETD", dataField: "SemanaETD" }
                       , { caption: "ETA", dataField: "dETA" }
                       , { caption: "SETA", dataField: "SemanaETA" }
                       , { caption: "SVC", dataField: "cSVC" }
                       , { caption: "Fecha Crea", dataField: "dFechaCrea" }
                       , { caption: "Usuario Crea", dataField: "cUsuarioCrea" }
                       , {
                           type: "buttons",
                           buttons: [
                               {
                                   icon: "exportselected",
                                   hint: "Generar",
                                   onClick: function (e) {
                                       GenerateOE(e.row.data.nIdOrdenEmbarque);
                                       e.event.preventDefault();
                                   },
                                   visible: function (e) {
                                       if (e.row.data.cCShipper == '' || e.row.data.cCShipper == null) {
                                           return true;
                                       } else {
                                           return false
                                       }
                                   }
                               },
                               {
                                   icon: "export",
                                   hint: "exportar",
                                   onClick: function (e) {
                                       ViewReport(e.row.data.nIdOrdenEmbarque);
                                       e.event.preventDefault();
                                   }
                               },
                               {
                                   icon: "edit",
                                   hint: "Editar",
                                   onClick: function (e) {
                                       document.location.href = "Wfo_OrdenEmbarque_Edit?Cd=" + getParameterByName('Cd') + "&Coe=" + e.row.data.nIdOrdenEmbarque;
                                       e.event.preventDefault();
                                   },
                                   visible: function (e) {
                                       if (e.row.data.cContainer == '' || e.row.data.cContainer == null) {
                                           return true;
                                       } else {
                                           return false
                                       }
                                   }
                               },{
                                   icon: "doesnotcontain",
                                   hint: "Eliminar Correlativo",
                                   onClick: function (e) {
                                       DeleteCorrOE(e.row.data.nIdOrdenEmbarque);
                                       e.event.preventDefault();
                                   },
                                   visible: function (e) {
                                       if (e.row.data.cCShipper != '' || e.row.data.cCShipper != null) {
                                           return true;
                                       } else {
                                           return false
                                       }
                                   }
                               }
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
                   ],
                   sortByGroupSummaryInfo: [{
                       summaryItem: "count"
                   }],
                   summary: {
                       groupItems: [{
                           column: "nIdOrdenEmbarque",
                           summaryType: "count",
                           displayFormat: "{0} items",
                       }, {
                           column: "nCajas",
                           summaryType: "sum",
                           valueFormat: function (value) {
                               return formatNumber.new(value.toFixed(2));
                           },
                           displayFormat: "{0}",
                           showInGroupFooter: false,
                           alignByColumn: true
                       }, {
                           column: "nPesoNeto",
                           summaryType: "sum",
                           valueFormat: function (value) {
                               return formatNumber.new(value.toFixed(2));
                           },
                           displayFormat: "{0}",
                           showInGroupFooter: false,
                           alignByColumn: true
                       }, {
                           column: "nPesoBrutoAprox",
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
                       totalItems: [
                           //{
                           //    column: "nCajas",
                           //    summaryType: "sum",
                           //    valueFormat: function (value) {
                           //        return formatNumber.new(value.toFixed(2));
                           //    },
                           //    displayFormat: "{0}",
                           //}, {
                           //        column: "nPesoNeto",
                           //    summaryType: "sum",
                           //    valueFormat: function (value) {
                           //        return formatNumber.new(value.toFixed(2));
                           //    },
                           //    displayFormat: "{0}",
                           //}, {
                           //        column: "nPesoBrutoAprox",
                           //    summaryType: "sum",
                           //    valueFormat: function (value) {
                           //        return formatNumber.new(value.toFixed(2));
                           //    },
                           //    displayFormat: "{0}",
                           //}
                       ]
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


           $("#btn-add").click(function () {
               window.location.href = 'Wfo_OrdenEmbarque_Edit?Cd=' + fuGetCdEmpre();
           });

           function GenerateOE(Id) {

               var obj = new Object();
               obj.vcIdEmpresa = fuGetCdEmpre();
               obj.vnIdOrdenEmbarque = Id;
               $('#idoem').val(Id);
               $.ajax({
                   type: 'POST',
                   url: "../SerComex.asmx/GenerarOrdenEmbarque",
                   data: JSON.stringify({ obj: obj }),
                   dataType: 'json',
                   contentType: 'application/json; charset=utf-8',
                   success: function (data) {
                      
                       var lst = JSON.parse(data.d);

                       if (lst != '') {
                           $('#txtShipper').val(lst[0].cCorrelativo);
                           $('#txtCliente').val(lst[0].cCliCorrelativo);
                           $('#ModGenera').modal('show');
                       } else {
                           toastr.warning('', 'ERROR AL Generar Orden')
                       }
                   }, error: function (data) {
                       JSON.stringify(data)
                   }
               });


           }

           $("#btnGeneraOE").click(function () {

               var obj = new Object();
               obj.vcIdEmpresa = fuGetCdEmpre();
               obj.vnIdOrdenEmbarque = $('#idoem').val();
               obj.vcCShipper = $('#txtShipper').val();
               obj.vcCCliente = $('#txtCliente').val();
               if (obj.vnIdOrdenEmbarque != 0) {
                   $.ajax({
                       type: 'POST',
                       url: "../SerComex.asmx/SaveGenerarOrdenEmbarque",
                       data: JSON.stringify({ obj: obj }),
                       dataType: 'json',
                       contentType: 'application/json; charset=utf-8',
                       success: function (data) {
                           var lst = JSON.parse(data.d);

                           if (lst != '') {
                               Swal.fire({
                                   title: lst[0].cCorrelativo + ' ' + lst[0].cCliCorrelativo,
                                   text: "Orden Generada",
                                   icon: 'success',
                               });
                               cargatabla();
                               $('#idoem').val('0');
                           } else {
                               toastr.warning('', 'ERROR AL Generar Orden')
                           }
                       }, error: function (data) {
                           JSON.stringify(data)
                       }
                   });
               } else {
                   toastr.warning('', 'ERROR AL Generar Orden')
               }

           });

           function DeleteCorrOE(Id) {

               var obj = new Object();
               obj.vcIdEmpresa = fuGetCdEmpre();
               obj.vnIdOrdenEmbarque = Id;
               Swal.fire({
                   title: '¿Esta seguro que desea Eliminar el Correlativo?',
                   text: "se eliminara el correlativo tanto del Shipper como del Cliente",
                   icon: 'warning',
                   showCancelButton: true,
                   confirmButtonColor: '#3085d6',
                   cancelButtonColor: '#d33',
                   confirmButtonText: 'Si, Eliminar!',
                   cancelButtonText: 'Cancelar'
               }).then((result) => {
                   if (result.value) {
                       $.ajax({
                           type: 'POST',
                           url: "../SerComex.asmx/DeleteCorrOrdenEmbarque",
                           data: JSON.stringify({ obj: obj }),
                           dataType: 'json',
                           contentType: 'application/json; charset=utf-8',
                           success: function (data) {
                               var lst = JSON.parse(data.d);

                               if (lst != '') {
                                   Swal.fire({
                                       title: "Correlativo Eliminado",
                                       text: "",
                                       icon: 'success',
                                   });
                                   cargatabla();
                               } else {
                                   toastr.warning('', 'ERROR AL Eliminar Correlativo')
                               }
                           }
                       });
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

           function getParameterByName(name) {
               name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
               var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                   results = regex.exec(location.search);
               return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
           }

           function ViewReport(id) {
               var obj = new Object();
               obj.vcIdEmpresa = fuGetCdEmpre();
               obj.vnIdOrdenEmbarque = id;
               if (obj.vnIdOrdenEmbarque != null && obj.vnIdOrdenEmbarque != '') {
                   $.ajax({
                       async: false,
                       type: 'POST',
                       url: "../SerRepo.asmx/RepOrdenEmbarque",
                       data: JSON.stringify({ obj: obj }),
                       dataType: 'json',
                       contentType: 'application/json; charset=utf-8',
                       success: function (data) {
                           console.log(data.d);
                           var lst = data.d;
                           myWindow = window.open("../Mod_Repo/Wfo_RepoView.aspx?Cd=" + fuGetCdEmpre() + "&wXml=" + lst[1] + "&wCrt=Crt_OrdenEmbarquecmx&wExp=2&wCan=0", "popup_window",
                               "width=970, height=600 toolbar=no, scrollbars=no, resizable=no, top=20, left=200");

                       },
                       error: function (error) {
                           console.log(error);
                           alert(JSON.stringify(error))
                       }
                   });
               } else {
                   toastr.error('', 'ERROR NO SE ENCONTRO ID')
               }
           }
       </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
