<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ReporteStock.aspx.cs" Inherits="SFC_WEB_APP.Mod_Repo.Wfo_ReporteStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>div.scrollmenu {overflow: auto;white-space: nowrap;} div.scrollmenu a {display: inline-block;text-align: center;padding: 14px;text-decoration: none;} div.scrollmenu a:hover {background-color: #777;} td input {width: 80px;} .table th, .table td {padding:0.75rem !important;}</style>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>

    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.light.css" />

   <script src="../Content/DevExtreme/cldr.min.js"></script>
    <script src="../Content/DevExtreme/event.min.js"></script>
    <script src="../Content/DevExtreme/supplemental.min.js"></script>
    <script src="../Content/DevExtreme/unresolved.min.js"></script>
    <script src="../Content/DevExtreme/globalize.min.js"></script>
    <%-- <script src="../Content/DevExtreme/number.min.js"></script> --%>
    <script src="../Content/DevExtreme/message.min.js"></script>
    <%-- <script src="../Content/DevExtreme/currency.min.js"></script>
    <script src="../Content/DevExtreme/date.min.js"></script> --%>
    <script src="../Content/DevExtreme/jszip.min.js"></script>
    <script src="../Content/DevExtreme/dx.all.js"></script>
    <script src="../Content/DevExtreme/dx.messages.es.js"></script>
    <script src="../Content/DevExtreme/supplemental.js"></script>
    <script src="../Content/DevExtreme/es.js"></script>

    <style>
        .app-content {
            min-height: 2000px !important;
        }

        #gridContainer>div{
            padding: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
    <section class="content-header">
      <h4>
        <i class="far fa-building"></i> Reporte de Stocks
      </h4>
        <br/>
    </section>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="col-md-3">
            <div class="form-group">
                <label>Empresa: </label>
                <select id="cboEmpresa" onchange="FnAlmacenCargar()"  class="form-control">
                    <option value="0">(Seleccionar)</option>
                    <option value="1">SUN FRUITS EXPORTS S.A.</option>
                    <option value="2">SUN FRUITS PACKS S.A.</option>
                </select>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label>Almacen: </label><%--Existe una tabla de equivalencias--%>
                <select id="cboAlmacenes" class="form-control"></select>
            </div>
        </div>
        <div class="col-md-2">
            <div class="form-group">
                <label>Fecha hasta:</label>
                <input type="text" id="txtFHasta" autocomplete="on" class="form-control" placeholder="dd/mm/yyyy"/>
                <script type="text/javascript">
                    $(function () {
                        $('#txtFHasta').datetimepicker({
                            format: 'DD/MM/YYYY',
                            locale: 'es-PE'
                        });
                    });
                </script>
            </div>
        </div>
    </div>
    
    <button class="btn btn-primary" onclick="FnCargar()" type="button" style="margin-bottom: 10px"><i class="fa fa-search"></i>&nbsp;&nbsp;Cargar</button>
    
    <div class="row">
        <div class="col-md-12">
            <div id="cargando">Cargando ...<br/></div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div id="gridContainer">
                <table class="table table-bordered">
                    <tr>
                        <td style="text-align: center; font-weight: bold;">HISPATEC</td>
                        <td style="text-align: center; font-weight: bold;">NISIRA</td>
                    </tr>
                    <tr>
                        <td style="padding:0px !important">
                            <table class="table table-bordered">
                                <tr>
                                    <td>CÓDIGO</td>
                                    <td>NOMBRE</td>
                                    <td>U. MD.</td>
                                    <td>STOCK</td>
                                </tr>
                            </table>
                        </td>
                        <td style="padding:0px !important;">
                            <table class="table table-bordered">
                                <tr>
                                    <td>CÓDIGO</td>
                                    <td>NOMBRE</td>
                                    <td>U. MD.</td>
                                    <td>STOCK</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

   <script>

       Actualizacion();

        function Actualizacion() {
            $("#cargando").hide();
        }

       function FnAlmacenCargar() {
           var parm = $("#cboEmpresa").val();
           $.ajax({    
               type: "POST",
               url: "../SerRepo.asmx/Almacenes",
               dataType: 'json',
               data: JSON.stringify({parm:parm}),
               contentType: 'application/json; charset=utf-8',
               success: function (datos) {
                   $("#cboAlmacenes").html("");
                   var o = JSON.parse(datos["d"]);
                   var ds = "<option value=\"-1\">(seleccionar)</option>";
                   for (var i = 0; i < o.length; i++) {
                       ds += '<option value="' + o[i].IDSUCURSAL + '_' + o[i].IDALMACEN + '">' + o[i].DESCRIPCION + '</option>';
                   }
                   $("#cboAlmacenes").append(ds);
               }, error: function () {
                   toastr.error("Existe un error de conectividad.", "Error");
               }
           });
       }

       function FnCargar() {
           $("#cargando").show();
           ParBusqueda = new Object();
           ParBusqueda.Fecha = $("#txtFHasta").val();
           ParBusqueda.IdEmpresa = $("#cboEmpresa").val();
           ParBusqueda.IdAlmacen = $("#cboAlmacenes").val();

           $.ajax({
               type: "POST",
               url: "../SerRepo.asmx/ReporteStock",
               dataType: 'json',
               data: JSON.stringify({ parm: ParBusqueda }),
               contentType: 'application/json; charset=utf-8',
               success: function (datos) {
                   jsonFamilias = JSON.parse(datos['d']);
                   $("#gridContainer").dxDataGrid({
                       dataSource: jsonFamilias,
                       encodeHtml: false,
                       columns: [{
                           caption: 'STOCK en HISPATEC',
                           columns: ["Codigo1", "Nombre1", "UnidadMedida1", "Stock1"]
                       }, {
                               caption: 'STOCK en NISIRA',
                               columns: ["Codigo2", "Nombre2", "UnidadMedida2", "Stock2"]
                           }, {
                               caption: '',
                               cssClass: 'SimboloDelta',
                               columns: ["Diferencia"]
                           }],
                       showBorders: true,
                       hoverStateEnabled: true,
                       selection: {
                           mode: "single"
                       },
                       paging: {
                           pageSize: 50
                       },
                       pager: {
                           showPageSizeSelector: false,
                           allowedPageSizes: [50],
                           showInfo: true
                       },
                       onContentReady: function () {
                           $(".SimboloDelta div").html("")
                       },
                       filterRow: {
                           visible: true,
                           applyFilter: "auto"
                       },
                       searchPanel: {
                           visible: true,
                           width: 240,
                           placeholder: "Buscar..."
                       }
                   });
                   $("#cargando").hide();
               }, error: function () {
                   toastr.error("Existe un error de conectividad.", "Error");
                   $("#cargando").hide();
               }
           });
       }
       
   </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
