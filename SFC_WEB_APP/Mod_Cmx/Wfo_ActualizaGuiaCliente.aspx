<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ActualizaGuiaCliente.aspx.cs" Inherits="SFC_WEB_APP.Mod_Cmx.Wfo_ActualizaGuiaCliente" %>

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
       <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />

        <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap4.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

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
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
        <div class="container">
        <div class="input-group mb-1 col-md-3 row">
            <label for="">Empresa</label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <button type="button" class="btn btn-warning"><i class="fa fa-industry"></i></button>
                </div>
                <select name="empresa" id="empresa" class="form-control round">
                    <option value="0" selected="selected">Seleccionar</option>
                    <option value="SFE">SUN FRUITS EXPORTS</option>
                    <option value="SFP">SUN FRUITS PACKS</option>
                </select> 
            </div>
        </div>
        <div class="input-group mb-1 col-md-3 row">
            <label for="">Serie</label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <button type="button" class="btn btn-warning"><i class="fa fa-code"></i></button>
                </div>
                <input  class="form-control round" id="serie" placeholder="Ingrese Serie"></input>
            </div>
        </div>
         <div class="input-group mb-0 col-md-3 row">
            <label for="txtArtiEnvase" class="rigth">Numero</label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <button type="button" class="btn btn-warning"><i class="fas fa-receipt"></i></button>
                </div>
                <input  class="form-control round" id="numero" placeholder="Ingrese Numero"></input>
            </div>
        </div>
        <div class="input-group mb-0 col-md-3 row">
            <label for="message-text">Cliente:</label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <button type="button" class="btn btn-warning"><i class="fas fa-user-tie"></i></button>
                </div>
                <input class="form-control round descli" id="cDescClieProv"  placeholder="Ingrese Cliente">
            </div>
        </div>
        <div id="DatCliente" style="padding-left: 25px; display: none">
            <div class="form-group mb-1">
                <b><label for="message-text" class="col-form-label">Codigo:</label></b>
                <span id="cId"></span><br />
                 <b><label for="message-text" class="col-form-label">Ruc:</label></b>
                <span id="nIdentClieProv"></span>
                <input type="hidden" id="nIdClieProv">
            </div>
        </div>
        <br />
        <button type="button" id="btnRegi" class="btn btn-lg btn-success" >Guardar</button>
    </div>
    <br />
    <br />
    <asp:HiddenField ID="hdfIdPalet" runat="server" Value="0" />
    <script>
        $("#btnRegi").click(function () {
            if ($("#serie").val().length > 0 && $("#numero").val().length > 0 && $("#nIdClieProv").val().length > 0 && $("#empresa").val() != 0) {
                
                var obj = new Object();
                obj.vcEmpresa = $("#empresa").val();
                obj.vcSerie = $("#serie").val();
                obj.vcNumero = $("#numero").val();
                obj.vcIdCliente = $("#nIdClieProv").val();
                $.ajax({
                    async: false,
                    type: 'POST',
                    url: "../SerComex.asmx/ACTUALIZA_CLIE_GUIAS",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                 
                        var lst = JSON.parse(data.d);
                        if (lst[0].val == '1') {
                            toastr.success("", lst[0].MSJE);

                            LimpiarControles();
                        } else {
                            toastr.error("", lst[0].MSJE);
                        }
      
                    },
                    error: function (error) {
                        console.log(error);
                        alert(JSON.stringify(error))
                    }
                });
            } else {
                toastr.error("Datos incompletos", "Error");
            }
        });
        function LimpiarControles() {
            $("#empresa").val("0");
            $("#serie").val("");
            $("#numero").val("");
            $("#nIdClieProv").val("");
        }


        // CLIENTE //
        $("#cDescClieProv").autocomplete({
            source: function (request, response) {
                var obj = new Object();
                obj.vcIdCliente = $("#cDescClieProv").val();
                $('#DatCliente').hide();
                $.ajax({
                    url: "../SerComex.asmx/ArrayClienteNis",
                    data: JSON.stringify({ obj: obj }),
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    // dataFilter: function (data) { return data; },
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('|')[2],
                                val: item.split('|')[1],
                                num: item.split('|')[0]
                            }
                        }))
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(textStatus);
                    }
                });
            },
            select: function (event, ui) {
                if (ui.item) {
                    if (ui.item.num != 0) {
                        var labels = '<p class="m-0 p-0"><b>Cliente Encontrado ' + ui.item.label + ', con RUC:' + ui.item.val + ' y Codigo:' + ui.item.num + '</b></p></b>';
                        $('#LabelCliente').html(labels);
                        $('#LabelCliente').show();

                        $('#cDescClieProv').val(ui.item.label);
                        $('#nIdentClieProv').text(ui.item.val);
                        $('#nIdClieProv').val(ui.item.num);

                        $('#cId').text(ui.item.num);

                        $('#DatCliente').show();
                    } else {
                        $('#LabelCliente').html('');
                        $('#LabelCliente').hide();
                        if (!isNaN(ui.item.label)) {
                            $('#nIdentClieProv').val(ui.item.label);
                            toastr.warning('INGRESE NOMBRE DE CLIENTE');
                        } else {
                            toastr.warning('INGRESE RUC Y NOMBRE DE CLIENTE');
                            $('#nIdentClieProv').focus();
                        }
                        $('#nIdClieProv').val('0');

                        $('.descli').val('');
                        $('#DatCliente').hide();
                    }
                }
            },
            minLength: 2
        });
        // CLIENTE //

        $("#serie").change(function () {
            $(this).val();
            var conceros = zeroFill($(this).val(), 4);
            $(this).val(conceros);
        });

        $("#numero").change(function () {
            $(this).val();
            var conceros = zeroFill($(this).val(), 7);
            $(this).val(conceros);
        });

        function zeroFill(number, width) {
            width -= number.toString().length;
            if (width > 0) {
                return new Array(width + (/\./.test(number) ? 2 : 1)).join('0') + number;
            }
            return number + ""; // siempre devuelve tipo cadena
        }


    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
