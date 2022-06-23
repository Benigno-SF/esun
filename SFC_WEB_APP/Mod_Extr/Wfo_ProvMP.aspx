<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ProvMP.aspx.cs" Inherits="SFC_WEB_APP.Mod_Admi.Wfo_ProvMP" %>
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
    <section class="content-header">
      <h4>Provisión de entrada por día</h4>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item active">Aministración / Previsión</li>
          </ol>
        </nav>
    </section>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="col-md-12"><h5>Periodo</h5></div>
    </div>
    
    <div class="row" style="min-height:220px;">
        <div class="col-md-2">
            <div class="form-group">
                <label>Tipo de periodo</label>
                <select class="form-control">
                    <option value="1">Fecha</option>
                </select>
            </div>
        </div>
    
        <div class="col-md-2">
            <div class="form-group">
                <label>Fecha desde:</label>
                <input type="text" id="txtFInicio" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy"/>
                <script type="text/javascript">
                    $(function () {
                        $('#txtFInicio').datetimepicker({
                            format: 'DD/MM/YYYY',
                            locale: 'es-PE'
                        });
                    });
                </script>
            </div>
        </div>

        <div class="col-md-2">
            <div class="form-group">
                <label>Fecha hasta:</label>
                <input type="text" id="txtFFin" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy"/>
                <script type="text/javascript">
                    $(function () {
                        $('#txtFFin').datetimepicker({
                            format: 'DD/MM/YYYY',
                            locale: 'es-PE'
                        });
                    });
                </script>
              </div>
        </div>

        <div class="col-md-2">
            <div class="form-group">
                <label>Almacen:</label>
                <select id="ddlAlmacen" runat="server" class="form-control"></select>
                <input type="hidden" id="pidproveedor" runat="server" />
            </div>
        </div>

        <div class="col-md-2">
            <div class="form-group">
                <label>Provisiones a nivel:</label>
                <input type="hidden" id="par_cookie" name="par_cookie" runat="server"/>
                <select class="form-control"><option value="1">Cantidad</option></select>
            </div>
        </div>

        <div class="col-md-2">
            <div class="form-group">
                <label style="width: 100%; height: 15px;"></label>
                <button type="button" id="buscar" onclick="FnPrincipalCargar()" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
            </div>
        </div>

        <div class="col-md-12">
            <div id="resultado" style="display:none">
                <h5>Previsiones de compra</h5>
                <div class="scrollmenu" style="margin-top: 10px">
                    <table id="table-contenido" class="table table-bordered table-condensed bgtbl"></table>
                </div>
                <br/>
                <button id="agregar" onclick="FnFilaAgregar()" type="button" class="btn btn-primary"><i class="far fa-plus-square"></i> Insertar fila</button>
                <button type="button" class="btn btn-success" onclick="FnPrincipalGuardar()"><i class="far fa-save"></i> Confirmar cambios</button>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Búsqueda de familias</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="gridContainer"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
                    <%--<button type="button" class="btn btn-primary">Understood</button>--%>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        var cobUmedida = "";
        var jsonFamilias = null;
        $('#txtFInicio').val(Date());
        $('#txtFFin').val(Date());
        var dias = 0; <%-- Almacena el rango de dias seleccionados --%>
        var fila_seleccionada = -1; <%-- Almacena el Index de la fila seleccionada --%>
        var filas_eliminadas = []; <%-- Incluye todas las filas eliminadas con ID de prevision compra (cabecera) --%>
        var ParBusqueda = null;
        var FechasContexto = [];

        FnCargaInicial();

        function FnCargaInicial() {
            FnUICargarUnidadesMedida();
            FnUIFamiliasCargar();
        }

        function addDays(date, days) {
            var result = new Date(date);
            result.setDate(result.getDate() + days);
            return result;
        }

        function FnPrincipalCargar() {
            filas_eliminadas = [];
            var f1 = $("#txtFInicio").val(), f1_d = f1.split('/')[0], f1_m = f1.split('/')[1], f1_y = f1.split('/')[2];
            var f2 = $("#txtFFin").val(), f2_d = f2.split('/')[0], f2_m = f2.split('/')[1], f2_y = f2.split('/')[2];
            var d1 = new Date(f1_y + "-" + f1_m + "-" + f1_d + " 00:00:00 UTC-5"), d2 = new Date(f2_y + "-" + f2_m + "-" + f2_d + " 00:00:00 UTC-5");
            dias = Math.floor((d2 - d1) / (1000 * 60 * 60 * 24)) + 1;

            FechasContexto = [];
            for (var i = 0; i < dias; i++) {    
                var nd = addDays(d1, i);
                <%-- La fecha debe tener el siguiente formato: dd-mm-yyyy --%>
                <%-- en la siguiente linea se actualiza la fecha --%>
                var arr_nd = (nd.toLocaleDateString()).split('/');

                var d_a = "", d_b = "", d_c = "";
                if (arr_nd[0].length == 1) {
                    d_a = "0" + arr_nd[0];
                } else {
                    d_a = arr_nd[0];
                }
                if (arr_nd[1].length == 1) {
                    d_b = "0" + arr_nd[1];
                } else {
                    d_b = arr_nd[1];
                }
                d_c = arr_nd[2];
                FechasContexto.push(d_a + "-" + d_b + "-" + d_c);
            }
            
            if (($("#Body_ddlAlmacen").val() == 0 || $("#Body_ddlAlmacen").val() == null) || ($("#txtFInicio").val().length != 10) || ($("#txtFFin").val().length != 10)) {
                toastr.error("complete todos los campos.", "Error");
            } else if (Math.floor((d2 - d1) / (1000 * 60 * 60 * 24)) > 14) {
                toastr.error("El valor para el intervalo de dias, no puede ser superior a 15.", "Error");
            } else if (Math.floor((d2 - d1) / (1000 * 60 * 60 * 24)) < 0) {
                toastr.error("El dato \"Fecha desde:\" no puede ser mayor que el dato \"Fecha hasta:\"", "Error");
            } else {
                ParBusqueda = new Object(); 
                ParBusqueda.idProveedor = $("#Body_pidproveedor").val();
                ParBusqueda.idAlmacen = $("#Body_ddlAlmacen").val();
                ParBusqueda.fechaInicial = d1.toDateString();
                ParBusqueda.fechaFinal = d2.toDateString();
                ParBusqueda.idTipoAplicacion = 2;
                ParBusqueda.idActividadNegocio = 8;

                /*
                ParBusqueda = new Object();
                ParBusqueda.idProveedor = 167; //$("#Body_pidproveedor").val();
                ParBusqueda.idAlmacen = 2;//$("#Body_ddlAlmacen").val();
                ParBusqueda.fechaInicial = (new Date("2020" + "-" + "05" + "-" + "10" + " 00:00:00 UTC-5")).toDateString();
                ParBusqueda.fechaFinal = (new Date("2020" + "-" + "05" + "-" + "23" + " 00:00:00 UTC-5")).toDateString();
                ParBusqueda.idTipoAplicacion = 2;
                ParBusqueda.idActividadNegocio = 8;*/

                $.ajax({
                    type: "POST",
                    url: "../SerExtr.asmx/PrevisionesComprasLeerEntradasPorDia",
                    data: JSON.stringify({ obj: ParBusqueda }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (datos) {
                        var o = datos['d'][0];

                        $("#table-contenido").empty();
                        var primerafila = '<tr><td colspan="2" style="text-align: center;"><b>Aplicación Store</b></td>';
                        for (var k = 0; k < dias; k++) { primerafila += '<td colspan="2" style="text-align: center;"><b>' + o.cabeceras[k] + '</b></td>'; }
                        primerafila += '</tr>';
                        $("#table-contenido").append(primerafila);
                        var segundafila = '<tr><td style="text-align: center; width: 20px;">Código</td><td>Descripción</td>';
                        for (var k = 0; k < dias; k++) { segundafila += '<td style="text-align: center; width: 50px;">U. Medida</td><td>Cantidad</td>'; }
                        segundafila += '</tr>';
                        $("#table-contenido").append(segundafila);
                        var selects = [];
                        for (var cabecera in o.contenido) {
                            var obc = new Object();
                            obc.Id = o.contenido[cabecera].id;
                            obc.Id_Proveedor = o.contenido[cabecera].idp;
                            obc.Id_FamiliaArticulo = o.contenido[cabecera].idfam;
                            obc.Id_Almacen = 0;
                            obc.codigo = o.contenido[cabecera].codigo;
                            obc.descripcion = o.contenido[cabecera].descripcion;
                            var obdlist = [];
                            
                            for (var detalle in o.contenido[cabecera].columnas) {
                                obd = new Object();
                                obd.Id = o.contenido[cabecera].columnas[detalle].id;
                                obd.Fecha = o.contenido[cabecera].columnas[detalle].fe;
                                obd.Id_UnidadMedida = o.contenido[cabecera].columnas[detalle].idum;
                                obd.Unidades = o.contenido[cabecera].columnas[detalle].un;
                                selects.push(obd.Id_UnidadMedida);
                                obdlist.push(obd);
                            }
                            FnPlantilla(obc, obdlist);
                        }

                        var i = 0;
                        $('#table-contenido tr td').each(function () {
                            var sec = parseInt(selects[i]);
                            if ($(this).attr('class') != undefined) {
                                if ($(this).attr('class').includes("form1_")) {
                                    if (!isNaN(sec)) {
                                        $(this).children('select').val(sec);
                                    }
                                    i++;
                                }
                            }
                        });
                    }, error: function () {
                        toastr.error("Existe un error de conectividad.", "Error");
                    }
                });

                <%--Quitar las filas vacias--%>
                
                $('#table-contenido tr td').each(function () {
                    if ($(this).attr('class') != undefined) {
                        if ($(this).attr('class').includes('cod_')) {
                            var verelimi = $(this).attr('class').split('_');
                            if (verelimi[3] == '' || verelimi[3] == 0) {
                                $(this).parent().remove();
                            }
                        }
                    }
                });

                filas_eliminadas = [];
                
                $("#resultado").show();
                
            }
        }

        function FnPrincipalGuardar() {
            var obj_contenido = [];
            var obj_cabecera = null, obj_detalle = null;

            $('#table-contenido tr td').each(function () {
                if ($(this).attr('class') != undefined) {

                    var s_cabecera = "", s_detalle = "";
                    if ($(this).attr('class').includes("cod_")) {
                        if (obj_cabecera != null) {
                            obj_contenido.push(obj_cabecera);
                        }
                        var s_cabecera = $(this).attr('class').split('_');
                        obj_cabecera = new Object();
                        obj_cabecera.Id = s_cabecera[1];
                        obj_cabecera.Id_proveedor = ParBusqueda.idProveedor; // Obtiene de la session y no debe cambiar
                        obj_cabecera.Id_FamiliaArticulo = s_cabecera[3];
                        obj_cabecera.Id_Almacen = ParBusqueda.idAlmacen; // Obtiene de los almacenes asociados
                        obj_cabecera.Detalles = [];
                        obj_contenido.push();
                    }
                    if ($(this).attr('class').includes("des_")) {

                    }
                    if ($(this).attr('class').includes("form1_")) {
                        s_detalle = $(this).attr('class').split('_');
                        obj_detalle = new Object();
                        obj_detalle.Id = s_detalle[4];
                        obj_detalle.Id_PrevisionCompras = obj_cabecera.Id;
                        obj_detalle.Fecha = s_detalle[1];
                        obj_detalle.Id_UnidadMedida = $(this).children('select').val();
                    }
                    if ($(this).attr('class').includes("form2_")) {
                        obj_detalle.Unidades = $(this).children('input').val();
                        obj_cabecera.Detalles.push(obj_detalle);
                    }
                }
            });

            obj_contenido.push(obj_cabecera);
            var parametro = new Object();
            parametro.contenido = obj_contenido;
            parametro.eliminados = filas_eliminadas

            $.ajax({
                type: "POST",
                url: "../SerExtr.asmx/PrevisionesCompras_Guardar",
                data: JSON.stringify({ objs: parametro }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (datos) {
                    var o = JSON.parse(datos['d']);
                    if (JSON.stringify(o) == "1") {
                        toastr.success("Los cambios se guardaron correctamente.", "Correcto");
                    } else {
                        toastr.error("Hubo un problema en la conectividad debes verificar otra vez.", "Error");
                    }
                },
                error: function () {
                    toastr.error("Existe un error de conectividad.", "Error");
                }
            });

            <%--Quitar las filas vacias--%>

            $('#table-contenido tr td').each(function () {
                if ($(this).attr('class') != undefined) {
                    if ($(this).attr('class').includes('cod_')) {
                        var verelimi = $(this).attr('class').split('_');
                        if (verelimi[3] == '' || verelimi[3] == 0) {
                            $(this).parent().remove();
                        }
                    }
                }
            });

            filas_eliminadas = [];

            FnUICargarMascaras();
        }

        function FnFilaAgregar() {
            var obc = new Object();
            obc.Id = 0;
            obc.Id_Proveedor = 0;
            obc.Id_FamiliaArticulo = 0;
            obc.Id_Almacen = 0;
            obc.codigo = "";
            obc.descripcion = "";
            var obdlist = [];
            for (var i = 0; i < dias; i++) {
                obd = new Object();
                obd.Id = "";
                obd.Fecha = "00-00-0000";
                obd.Id_UnidadMedida = 0;
                obd.Unidades = 0;
                obdlist.push(obd);
            }
            FnPlantilla(obc, obdlist);
        }

        function FnFilaQuitar(o) {
            $("tr:nth-child(" + (o.parent().parent().index() + 1) + ")").hide();
            var contclass = $("tr:nth-child(" + (o.parent().parent().index() + 1) + ") .codigo").parent().parent().attr("class");
            filas_eliminadas.push(contclass.split('_')[1]);
        }

        function FnUIFamiliasCargar() {
            $.ajax({
                type: "POST",
                url: "../SerExtr.asmx/FamiliasPrevisiones",
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (datos) {
                    jsonFamilias = JSON.parse(datos['d']);
                    $("#gridContainer").dxDataGrid({
                        dataSource: jsonFamilias,
                        columns: ["IdAsociado", "Codigo", "Nombre"],
                        customizeColumns: function (columns) {
                            columns[0].width = 0;
                            columns[1].width = 60;
                        },
                        showBorders: true,
                        hoverStateEnabled: true,
                        selection: {
                            mode: "single"
                        },
                        paging: {
                            pageSize: 10
                        },
                        pager: {
                            showPageSizeSelector: false,
                            allowedPageSizes: [10],
                            showInfo: true
                        },
                        filterRow: {
                            visible: true,
                            applyFilter: "auto"
                        },
                        searchPanel: {
                            visible: true,
                            width: 240,
                            placeholder: "Buscar..."
                        },
                        onSelectionChanged: function (selectedItems) {
                            var data = selectedItems.selectedRowsData[0];
                            if (data) {
                                <%-- Obtener el indice de la fila seleccionada --%>
                                //fila_seleccionada
                                $("tr:nth-child(" + (fila_seleccionada + 1) + ") .codigo").text(data.Codigo);
                                $("tr:nth-child(" + (fila_seleccionada + 1) + ") .descripcion").text(data.Nombre);
                                var modif = $("tr:nth-child(" + (fila_seleccionada + 1) + ") .codigo").parent().parent().attr('class'); // get class y set class
                                var a_modif = modif.split('_');
                                var ncad = "cod_" + a_modif[1] + "_" + a_modif[2] + "_" + data.IdAsociado + "_" + a_modif[4];
                                $("tr:nth-child(" + (fila_seleccionada + 1) + ") .codigo").parent().parent().attr('class',"");
                                $("tr:nth-child(" + (fila_seleccionada + 1) + ") .codigo").parent().parent().addClass(ncad);
                            }
                        }
                    });
                }, error: function () {
                    toastr.error("Existe un error de conectividad.", "Error");
                }
            });
        }

        function FnPlantilla(cabecera, detalle) {
            var cadena = "";
            cadena += '<tr>';
            cadena += '<td class="cod_' + cabecera.Id + '_' + cabecera.Id_Proveedor + '_' + cabecera.Id_FamiliaArticulo + '_' + cabecera.Id_Almacen + '" style="vertical-align:middle">';
            cadena += '<button type="button" class="btn btn-primary" style="padding:6px; margin-right:5px;" onclick="FnSeleccionar($(this))"  data-toggle="modal" data-target="#staticBackdrop"><i class="fa fa-search"></i></button>';
            cadena += '<button type="button" class="btn btn-primary" style="padding:6px; margin-right:15px;" onclick="FnFilaQuitar($(this))"><i class="fa fa-trash"></i></button><b style="vertical-align:middle"><span class="codigo">' + cabecera.codigo + '</span></b>';
            cadena += '</td>';
            cadena += '<td class="des_"  style="vertical-align:middle"><span class="descripcion">' + cabecera.descripcion;
            cadena += '</span></td>';
            for (var i = 0; i < detalle.length; i++) {
                cadena += '<td class="form1_' + FechasContexto[i] + '_' + detalle[i].Id_UnidadMedida + '_' + detalle[i].Unidades + '_' + detalle[i].Id + '">';
                cadena += '<select data-idum="sel' + '_' + detalle[i].Id_UnidadMedida + '" class="form-control" style="width:100px;">' + cobUmedida + '</select>';
                cadena += '</td>';
                cadena += '<td class="form2_">';
                cadena += '<input class="form-control" type="text" value="' + detalle[i].Unidades + '" style="width:100px;">';
                cadena += '</td>';
            }
            cadena += "</tr>";
            $("#table-contenido").append(cadena);
            FnUICargarMascaras();
        }

        function FnSeleccionar(o) {
            fila_seleccionada = o.parent().parent().index();
        }

        function FnUICargarUnidadesMedida() {
            $.ajax({
                type: "POST",
                url: "../SerExtr.asmx/UnidadesMedida",
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (datos) {
                    var o = JSON.parse(datos.d);
                    var ds = "<option value=\"-1\">(seleccionar)</option>";
                    for (var i = 0; i < o.length; i++) {
                        ds += '<option value="' + o[i].Id + '">' + o[i].Nombre + '</option>';
                    }
                    cobUmedida = ds;
                },
                error: function () {
                    toastr.error("Existe un error de conectividad.", "Error");
                }
            });
        };

        function FnUICargarMascaras() {
            $("td[class^='form2_'] input").inputmask("decimal", {
                rightAlign: true
            });
        }

        $('#staticBackdrop').on('hidden.bs.modal', function () {
            fila_seleccionada = -1;
        });

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server"></asp:Content>
