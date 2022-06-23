<%@ Page Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ConfProd.aspx.cs" Inherits="SFC_WEB_APP.Mod_Pres.Wfo_ConfProd" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    

    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <!--LIBRERIA DE BOOSTRAP 5 -->
    <%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    <!-- js databales -->
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

     <script src="../Scripts/sweetalert2.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        .my-fixed-item {
            position: fixed; /* Hacemos que la posición en pantalla sea fija para que siempre se muestre en pantalla*/
	        right: 0; /* Establecemos la barra en la izquierda */
	        top: 330px; /* Bajamos la barra 200px de arriba a abajo */
	        z-index: 2000;
            width:14%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">

    <!-- Inicio   del font -->
    <div class="shadow p-3 mb-5 bg-body rounded bg-white">
<div class=" mb-12">
  <div class="card-header border border-3 border-purple text-center"> <h5>VALIDADOR DE CONFIGURACION DE PRODUCTOS</h5> </div>
  <div class="card-body border border-1">
        <div class="row">
            <div class="col-md-7">
                <div class="row">
                    <div class="input-group">
                        <div class="col-sm-4">
                            <label for="" class="form-label"> <b>Seleccione periodo :</b> </label>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group pb-3">   
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-purple"><i class="fa fa-calendar text-white"></i></span>
                                </div>
                                <input type="text" name="periodo_reg" id="periodo" class="form-control" autocomplete="off" placeholder="Seleccione" />
                                <script type="text/javascript">
                                    $(function () {
                                        $('#periodo').datetimepicker({
                                            format: 'YYYYMM',
                                            locale: 'es'
                                        });
                                        $(function () {
                                            $('#periodo').datetimepicker({
                                                format: 'YYYYMM',
                                                locale: 'es'
                                            });
                                        });
                                    });
                                </script>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <button type="button" class="btn btn-purple text-white" onclick="listar_confi_documento();">Consultar  |   <i class="fa fa-search"></i></button>
                        </div>
                    </div> 
                </div> 
            </div>
        </div>
      <hr />
      <!--  datagrid mostrar datos-->
      <div class="col-md-12">
        <div class="card">
                <div class="card-body card-dashboard" id="container-tbdist">
                    <div id="tbProductos">

                    </div>
                </div>
        </div>
    </div>
<!-- datagrid mostrar datos -->
  </div>
</div>
        </div>
<!-- fin   del font del usuario -->


    <script>
        function listar_confi_documento() {
            // cpturmaos la variable....
            var periodo = document.getElementById("periodo").value;

            if (periodo != "") {
                const periodo_cant_val = /^\d{6}$/;
                if (periodo_cant_val.test(periodo)) {
                    const periodo_parametro_val = /^[0-9]+$/;
                    if (periodo_parametro_val.test(periodo)) {

                        $('#tbProductos').html('<div class="text-center bold"><img src="../img/loading3.gif" width="200px" alt="loading" /><br/>Un momento, por favor...</div>');

                        var obj = new Object();
                        obj.VERI_DOC_PERIODO = periodo;
                        $.ajax({
                            type: 'POST',
                            url: "../SerPres.asmx/SER_lista_confi_documento",
                            data: JSON.stringify({ obj: obj }),
                            dataType: 'json',
                            contentType: 'application/json; charset=utf-8',
                            success: function (data) {
                                var lst = JSON.parse(data.d);
                                var val = JSON.stringify(data.d);
                                if (val === null) {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Ocurrió un problema ...',
                                        text: 'No hay datos por mostrar  !',
                                    })
                                } else {
                                    $('#tbProductos').html('<div id="data_grid"></div>');
                                    TbDataGrid(lst);
                                }
                            },
                            error: function (data) {
                                alert(JSON.stringify(data));
                            }
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un problema ...',
                            text: 'El campo PERIODO solo acepta números ...  !',
                        })
                        $('#tbProductos').html('<div id="data_grid"></div>');
                     }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un problema ...',
                        text: 'El campo PERIODO solo debe de ser 6 dígitos ...  !',
                    })
                    $('#tbProductos').html('<div id="data_grid"></div>')
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'El campo PERIODO esta vació...  !',
                })
                $('#tbProductos').html('<div id="data_grid"></div>');
            }
        }

        // dxDataGrid
        function TbDataGrid(data) {
            DevExpress.localization.locale('es');

            var dataGrid = $("#data_grid").dxDataGrid({
                dataSource: data,
                scrolling: {
                    mode: "virtual"
                },
                grouping: {
                    autoExpandAll: true
                },
                selection: {
                    mode: "single" // or "multiple" | "none"
                },
                onCellPrepared: function (e) {
                    if (e.rowType === 'header') {
                        e.cellElement.css("backgroundColor", "#2f394a" /*"#2f394a"*/);
                        e.cellElement.css("color", "#fff");
                    }
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

                //editing: {
                //    mode: "row",
                //    allowDeleting: true,
                //    useIcons: true,
                //    width: 50
                //},

                export: {
                    enabled: true,
                    fileName: "Reporte de Análisis de Compras - Servicios"
                },

                filterRow: {
                    visible: false,
                    applyFilter: "auto"
                },
                searchPanel: {
                    visible: false,
                    placeholder: "Buscar..."
                },
                filterRow: {
                    visible: true
                },
                headerFilter: {
                    visible: true
                },
                sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }]

            }).dxDataGrid("instance");

        };
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">

</asp:Content>
