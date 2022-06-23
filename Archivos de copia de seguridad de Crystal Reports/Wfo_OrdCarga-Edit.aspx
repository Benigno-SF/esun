<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_OrdCarga-Edit.aspx.cs" Inherits="SFC_WEB_APP.Mod_Frio.Wfo_OrdCarga_Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%: Styles.Render("~/Content/JQWidgets/css") %>
    <%: Scripts.Render("~/js/jqx") %>

    <link href="../Content/JQWidgets/jqx.energyblue.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
    <li class="breadcrumb-item"><a href="<%= ResolveUrl("~/") %>">Home</a></li>
    <li class="breadcrumb-item"><a href="#">Frio</a></li>
    <li class="breadcrumb-item active">Orden de Carga</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <h3 class="text-center">Orden de Carga</h3>
    <div class="row">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label class="control-label" for="txtNoCarga">No. </label>
            <input type="text" id="txtNoCarga" runat="server" autocomplete="off" class="form-control" placeholder="...">
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-3">
            <label class="control-label" for="txtCultivo">Destino</label>
            <asp:DropDownList ID="ddlDest" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label class="control-label" for="txtFeEven">Fecha</label>
            <div class="input-group input-append">
                <input type="text" id="txtFeCarga" runat="server" class="form-control" placeholder="dd/mm/yyyy" autocomplete="off" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label class="control-label" for="txtFeInic">Hora</label>
            <div class="input-group input-append">
                <input type="text" id="txtHoCarga" runat="server" class="form-control" placeholder="HH:mm" autocomplete="off" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-time"></span>
                </span>
            </div>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-3">
            <label class="control-label" for="txtDescri">Booking</label>
            <input type="text" id="txtBook" runat="server" autocomplete="off" class="form-control" placeholder="...">
        </div>
    </div>
    <div style="display: none;">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-5">
            <label class="control-label" for="txtDescri">Codigo</label>
            <input type="text" id="txtDescri" runat="server" autocomplete="off" class="form-control" placeholder="...">
        </div>
    </div>
    <fieldset>
        <legend>Selección de Pallets</legend>
    </fieldset>
    <div class="row">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-4">
            <label for="txtCliente">Cliente</label>
            <input id="txtCliente" type="text" runat="server" autocomplete="off" class="form-control" placeholder="Cliente...">
            <asp:HiddenField ID="hdfCdClie" runat="server" />
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="txtCultivo">Cultivo</label>
            <asp:DropDownList ID="ddlCultivo" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
            <label for="txtVariedad">Variedad</label>
            <input id="txtVariedad" type="text" autocomplete="off" class="form-control" placeholder="Variedad...">
            <asp:HiddenField ID="hdfCdVariedad" runat="server" />
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnBusc" class="btn btn-secondary col-12">
                <i class="fas fa-search"></i> Buscar
            </button>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnGuardar" runat="server" class="btn btn-primary col-12">
                <span class="glyphicon glyphicon-floppy-disk"></span>Guardar
            </button>
        </div>
    </div>
    <br />
    <div id="GvData"></div>
    <asp:HiddenField ID="hdfIdOrden" runat="server" Value="0" />
    <script>
        function GuardaOrden(ArrCarga) {
            $.ajax({
                type: 'POST',
                url: "../SerProd.asmx/RegiOrdenCarga",
                data: JSON.stringify({ List: ArrCarga }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    window.location.replace("Wfo_OrdCarga.aspx");
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        };
        function fuValid() {
            var valid = true;
            //if (vnNuCarga.length == 0)
            if ($("#<%=txtFeCarga.ClientID%>").val() < 1) {
                valid = false;
                $("#<%=txtNoCarga.ClientID%>").parent().addClass("has-error");
            };
            if ($("#<%=txtFeCarga.ClientID%>").val().length < 1) {
                valid = false;
                $("#<%=txtFeCarga.ClientID%>").parent().parent().addClass("has-error");
            };
            if ($("#<%=txtHoCarga.ClientID%>").val().length < 1) {
                valid = false;
                $("#<%=txtHoCarga.ClientID%>").parent().parent().addClass("has-error");
            };
            if ($("#<%=ddlDest.ClientID%>").val() == "00") {
                valid = false;
                $("#<%=ddlDest.ClientID%>").parent().addClass("has-error");
            };
            if ($("#<%=txtCliente.ClientID%>").val().length < 1) {
                valid = false;
                $("#<%=txtCliente.ClientID%>").parent().addClass("has-error");
            };
            if ($("#<%=ddlCultivo.ClientID%>").val() == "00") {
                valid = false;
                $("#<%=ddlCultivo.ClientID%>").parent().addClass("has-error");
            };
            if (valid) {
                var rowindexes = $('#GvData').jqxGrid('getselectedrowindexes');
                if (rowindexes.length < 1) {
                    alert("faltan agregar palets a la orden")
                    valid = false;
                };
            };
            return valid;
        }
        $("#<%=btnGuardar.ClientID%>").click(function () {
            if (fuValid()) {
                var vbVal = true;
                var arOrden = new Array();
                var obOrden = new Object();
                obOrden.vnIdTiRow = 1;
                obOrden.vnIdOrdCarga = fuGetIdOrden();
                obOrden.vnNoCarga = $("#<%=txtNoCarga.ClientID%>").val();
                obOrden.vcDescCarga = $("#<%=txtDescri.ClientID%>").val();
                obOrden.vcDestino = $("#<%=ddlDest.ClientID%>").val();
                obOrden.vcFecha = $("#<%=txtFeCarga.ClientID%>").val();
                obOrden.vcHora = $("#<%=txtHoCarga.ClientID%>").val();
                obOrden.vcBooking = $("#<%=txtBook.ClientID%>").val();
                obOrden.vcIdProvLote = fuGetCdClie();
                obOrden.vcRazonSolcial = $("#<%=txtCliente.ClientID%>").val().label;
                obOrden.vcIdCultivo = $("#<%=ddlCultivo.ClientID%>").val();
                obOrden.vcDescCultivo = $("#<%=ddlCultivo.ClientID%> option:selected").text();
                //alert(JSON.stringify(obOrden));
                arOrden.push(obOrden);
                var rowindexes = $('#GvData').jqxGrid('getselectedrowindexes');
                var boundrows = $('#GvData').jqxGrid('getboundrows');
                for (var i = 0; i < rowindexes.length; i++) {
                    if (fuGetCdClie() != boundrows[rowindexes[i]].idcliente) {
                        alert("Los Pallets no pueden ser de otro Cliente")
                        vbVal = false;
                        return false;
                    }
                    var obDeta = new Object();
                    obDeta.vnIdTiRow = 2;
                    var vcIdCampana = boundrows[rowindexes[i]].nropaleta;
                    obDeta.vcIdRegistroPaleta = boundrows[rowindexes[i]].idreferencia;
                    obDeta.vcNroPaleta = boundrows[rowindexes[i]].nropaleta;
                    obDeta.vcIdCampana = vcIdCampana.substring(0, 4);
                    obDeta.desc_cliente = boundrows[rowindexes[i]].desc_cliente;
                    obDeta.idproductor = boundrows[rowindexes[i]].idproductor;
                    obDeta.desc_productor = boundrows[rowindexes[i]].desc_productor;
                    obDeta.grower_code = boundrows[rowindexes[i]].grower_code;
                    obDeta.desc_variedad = boundrows[rowindexes[i]].desc_variedad;
                    obDeta.desc_envase = boundrows[rowindexes[i]].desc_envase;
                    obDeta.desc_condicion = boundrows[rowindexes[i]].desc_condicion;
                    obDeta.desc_talla = boundrows[rowindexes[i]].desc_talla;
                    obDeta.desc_color = boundrows[rowindexes[i]].desc_color;
                    obDeta.talla_equiv = boundrows[rowindexes[i]].talla_equiv;
                    obDeta.desc_embalaje = boundrows[rowindexes[i]].desc_embalaje;
                    obDeta.desc_parihuela = boundrows[rowindexes[i]].desc_parihuela;
                    obDeta.desc_etiqueta = boundrows[rowindexes[i]].desc_etiqueta;
                    obDeta.desc_etiqueta2 = boundrows[rowindexes[i]].desc_etiqueta2;
                    obDeta.vcFecha = boundrows[rowindexes[i]].fechaproc;
                    obDeta.desc_motivopaleta = boundrows[rowindexes[i]].desc_motivopaleta;
                    obDeta.nromanual = boundrows[rowindexes[i]].nromanual;
                    obDeta.desc_sucursal = boundrows[rowindexes[i]].desc_sucursal;
                    arOrden.push(obDeta);
                }

                GuardaOrden(arOrden);
            };
        });
        //Control Fecha
        $('#<%=txtFeCarga.ClientID %>').datetimepicker({
            format: 'DD/MM/YYYY',
            locale: 'es',
        });
        $('#<%=txtHoCarga.ClientID %>').datetimepicker({
            format: 'HH:mm'
        });
        $(document).ready(function () {
            jqCliente();
            CargaVariedad("", 0);
            $("#<%=txtNoCarga.ClientID%>").on("input", function (evt) {
                this.value = (this.value + '').replace(/[^0-9]/g, '');
            });
            GetDataGv(((fuGetIdOrden() == "0") ? "9999" : fuGetCdClie()), ((fuGetIdOrden() == "0") ? "9999" : fuGetCdVariedad()), "", fuGetIdOrden())
        });
        $("#btnBusc").click(function () {
            var IdCliente = fuGetCdClie();
            var IdCultivo = $('#<%=ddlCultivo.ClientID %>').val();
            var IdVariedad = fuGetCdVariedad();
            GetDataGv(IdCliente, IdCultivo, IdVariedad, 0, 1);
        });
        function Selected(List) {
            $('#GvData').jqxGrid('clearselection');
            var IdOrde = fuGetIdOrden() * 1;
            if (IdOrde != 0) {
                for (var i = 0; i < List.length; i++) {
                    if (IdOrde == List[i].IdOrdC) {
                        $("#GvData").jqxGrid('selectrow', i);
                    };
                };
            };
            /*
            var boundrows = $('#GvData').jqxGrid('getboundrows');

            for (var i = 0; i < boundrows.length; i++) {
                
                if (IdOrde == boundrows[i].IdOrdC) {
                    var data = $('#GvData').jqxGrid('getrowboundindexbyid', boundrows[i].uid);    
                    $("#GvData").jqxGrid('selectrow', data);
                }
            } 
             */
        };
        function LoadGv(List) {
            // prepare the data
            var source =
            {
                localdata: List,
                datatype: "json",
                datafields: [
                    { name: 'pk', type: 'int' },
                    { name: 'idreferencia', type: 'string' },
                    { name: 'nropaleta', type: 'string' },
                    { name: 'desc_motivopaleta', type: 'int' },
                    { name: 'idcliente', type: 'string' },
                    { name: 'desc_cliente', type: 'string' },
                    { name: 'desc_variedad', type: 'string' },
                    { name: 'desc_envase', type: 'string' },
                    { name: 'desc_condicion', type: 'string' },
                    { name: 'desc_talla', type: 'string' },
                    { name: 'desc_color', type: 'string' },
                    { name: 'talla_equiv', type: 'string' },
                    { name: 'desc_embalaje', type: 'string' },
                    { name: 'desc_etiqueta', type: 'string' },
                    { name: 'desc_etiqueta2', type: 'string' },
                    { name: 'fechaproc', type: 'string' },
                    { name: 'dias', type: 'number' },
                    { name: 'cantidad', type: 'number' },
                    { name: 'nNoCarga', type: 'number' },
                    { name: 'desc_productor', type: 'string' },
                    { name: 'grower_code', type: 'string' },
                    { name: 'desc_parihuela', type: 'string' },
                    { name: 'nromanual', type: 'string' },
                    { name: 'desc_sucursal', type: 'string' },
                    { name: 'IdOrdC', type: 'number' }
                ],
                id: 'pk'
            };
            var dataAdapter = new $.jqx.dataAdapter(source);
            $("#GvData").jqxGrid(
                {
                    width: "100%",
                    autoHeight: true,
                    source: dataAdapter,
                    selectionmode: 'checkbox',
                    columnsresize: true,
                    sortable: true,
                    showfilterrow: true,
                    filterable: true,
                    theme: 'energyblue',
                    columns: [
                        { text: 'pk', datafield: 'pk', hidden: true },
                        { text: 'idreferencia', datafield: 'idreferencia', hidden: true },
                        { text: 'N° de Paleta', datafield: 'nropaleta' },
                        { text: 'Tipo de Paleta', datafield: 'desc_motivopaleta' },
                        { text: 'Cliente', datafield: 'desc_cliente', hidden: true },
                        { text: 'Variedad', datafield: 'desc_variedad' },
                        { text: 'Envase', datafield: 'desc_envase' },
                        { text: 'Categoría', datafield: 'desc_condicion' },
                        { text: 'Calibre', datafield: 'desc_talla' },
                        { text: 'Color', datafield: 'desc_color' },
                        { text: 'Calibre Cliente', datafield: 'talla_equiv' },
                        { text: 'Embalaje', datafield: 'desc_embalaje' },
                        { text: 'Etiqueta Productor', datafield: 'desc_etiqueta' },
                        { text: 'Etiqueta Destino', datafield: 'desc_etiqueta2' },
                        { text: 'Fecha de Producción', datafield: 'fechaproc', cellsformat: 'dd/MM/yyyy' },
                        { text: 'Días en Cámara', datafield: 'dias' },
                        { text: 'N° de Cajas', datafield: 'cantidad' },
                        { text: 'Id Orden', datafield: 'nNoCarga' }
                    ]
                });
        };
        $('#GvData').on('rowselect', function (event) {
            var args = event.args;
            var rowBoundIndex = args.rowindex;
            var rowData = args.row;
            if ((rowData.IdOrdC != 0) && (rowData.IdOrdC != fuGetIdOrden()))
                $('#GvData').jqxGrid('unselectrow', rowBoundIndex);
        });
        function GetDataGv(IdCliente, IdCultivo, IdVariedad, IdOrdC, InCarga) {
            $.ajax({
                type: 'POST',
                url: "../SerProd.asmx/ListStockPallet",
                data: "{'IdCliente': '" + IdCliente +
                    "','IdCultivo': '" + IdCultivo +
                    "','IdVariedad': '" + IdVariedad +
                    "','vnIdCarga': '" + IdOrdC +
                    "' }",
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var List = JSON.parse(data.d);
                    if (InCarga == 0)
                        LoadGv(List);
                    else {
                        LoadGv(List);
                        $("#GvData").jqxGrid('updatebounddata');
                        //$('#JqxConc1').jqxGrid('updatebounddata');
                    }
                    Selected(List);
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        };
        function jqVariedad(List) {
            var source =
            {
                localdata: List,
                datatype: "json",
                datafields: [
                    { name: 'IDVARIEDAD' },
                    { name: 'DESCRIPCION' }
                ]
            };
            var dataAdapter = new $.jqx.dataAdapter(source);
            $("#txtVariedad").jqxInput({ source: dataAdapter, displayMember: "DESCRIPCION", valueMember: "IDVARIEDAD" });
            $("#txtVariedad").on('select', function (event) {
                fuSetCdVariedad("");
                if (event.args) {
                    var item = event.args.item;
                    if (item) {
                        fuSetCdVariedad(item.value);
                    }
                }
            });
        };
        function CargaVariedad(IdCult, InCarga) {
            $.ajax({
                type: 'POST',
                url: "../SerProd.asmx/ListVariedad",
                data: "{'ctipo': '" + IdCult +
                    "' }",
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var List = JSON.parse(data.d);
                    if (InCarga == 0)
                        jqVariedad(List);
                    else {
                        var dataAdapter = new $.jqx.dataAdapter(source);
                        $("#txtVariedad").jqxInput({ source: dataAdapter });
                    }
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        };
        $('#<%=ddlCultivo.ClientID %>').change(function () {
            var eval = this.value;
            CargaVariedad(eval, 0);
            $("#txtVariedad").val("");
        });        
        function jqCliente() {
            $.ajax({
                type: 'POST',
                url: "../SerProd.asmx/ListProvClie",
                data: "{'ctipo': '" + 'C' +
                    "' }",
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var List = JSON.parse(data.d);
                    var source =
                    {
                        localdata: List,
                        datatype: "json",
                        datafields: [
                            { name: 'IDPROVLOTE' },
                            { name: 'RAZON_SOCIAL' }
                        ]
                    };
                    var dataAdapter = new $.jqx.dataAdapter(source);
                    $("#<%=txtCliente.ClientID%>").jqxInput({ source: dataAdapter, placeHolder: "Contact Name:", displayMember: "RAZON_SOCIAL", valueMember: "IDPROVLOTE" });
                    $("#<%=txtCliente.ClientID%>").on('select', function (event) {
                        if (event.args) {
                            var item = event.args.item;
                            if (item) {
                                fuSetCdClie(item.value)
                            };
                        };
                    });
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        };
        //
        function fuSetCdVariedad(valor) {
            $('#<%=hdfCdVariedad.ClientID%>').val(valor);
        };
        function fuGetCdVariedad() {
            return $('#<%=hdfCdVariedad.ClientID%>').val();
        };
        function fuSetCdClie(valor) {
            $('#<%=hdfCdClie.ClientID%>').val(valor);
        };
        function fuGetCdClie() {
            return $('#<%=hdfCdClie.ClientID%>').val();
        };
        function fuSetIdOrden(valor) {
            return $('#<%=hdfIdOrden.ClientID%>').val(valor);
        };
        function fuGetIdOrden() {
            return $('#<%=hdfIdOrden.ClientID%>').val();
        };
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
