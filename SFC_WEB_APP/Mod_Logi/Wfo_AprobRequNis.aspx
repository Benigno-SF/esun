<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_AprobRequNis.aspx.cs" Inherits="SFC_WEB_APP.Mod_Logi.Wfo_AprobRequNis" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/datatables.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <script src="../Scripts/datatables.js"></script>
    <style type="text/css">
/*        .bgtbl {
        }*/

        .table {
             overflow: auto; 
             height: 70vh;
        }

        .table-sm th,
        .table-sm td {
            padding-top: 0.5rem !important;
            padding-bottom: 0.5rem !important;
            padding-left: 0.5rem !important;
            padding-right: 0.5rem !important;
        }


        .Grid td {
            background-color: White;
            color: Black;
            font-size: 10pt;
            line-height: 200%;
        }

        .Grid th {
            background-color: Navy;
            color: White;
            font-size: 10pt;
            line-height: 200%;
        }

        .ChildGrid td {
            color: black;
            font-size: 10pt;
            line-height: 200%;
        }

        .ChildGrid th {
            background-color: Black !important;
            color: black;
            font-size: 10pt;
            line-height: 200%;
        }

        .bgtbl {
            background: rgba(255,255,255,0.5) !important;
        }

            .bgtbl tr th {
                background-color: #d9edf7 !important;
            }

                    .dataTables_wrapper .dataTables_filter {
                        float: right;
                        text-align: right;
                        visibility: hidden;
                        display: none
                        }


            .dataTables_wrapper table {
                display: table;
                width: 100%;
                min-height: .01%;
                overflow-x: auto;
            }
    </style>

    <script>
        function ActiveCheck(btnId) {
            var idRow = btnId.split("_")[1];

            var vvActive = $("#" + btnId).attr("data-active");
            if (vvActive == "false") {
                $("#" + btnId).addClass("btn btn-success");
                $("#" + btnId).attr("data-active", "true");
                $("#btnRe_" + idRow).removeClass("btn btn-danger");
                $("#btnRe_" + idRow).attr("data-active", "false");
                $("#" + btnId).closest("tr").find("input[type=hidden][id*=hdfValue]").val("1");
                $("#" + btnId).blur();
            } else {
                $("#" + btnId).removeClass("btn btn-success");
                $("#" + btnId).attr("data-active", "false");
                $("#" + btnId).closest("tr").find("input[type=hidden][id*=hdfValue]").val("0")
            }
        }
        function ActiveUnCheck(btnId) {
            var idRow = btnId.split("_")[1];
            var vvActive = $("#" + btnId).attr("data-active");
            if (vvActive == "false") {
                $("#" + btnId).addClass("btn btn-danger");
                $("#" + btnId).attr("data-active", "true");
                $("#btnAc_" + idRow).removeClass("btn btn-success");
                $("#btnAc_" + idRow).attr("data-active", "false");
                $("#" + btnId).closest("tr").find("input[type=hidden][id*=hdfValue]").val("2")
            } else {
                $("#" + btnId).removeClass("btn btn-danger");
                $("#" + btnId).attr("data-active", "false");
                $("#" + btnId).closest("tr").find("input[type=hidden][id*=hdfValue]").val("0")
            }
        }

        function divexpandcollapse(divname) {
            var btnId = "#btn_" + divname.split("_")[1];
            var atrr = $(btnId).attr("data-hide");
            var img = divname;
            if (atrr == "true") {
                $(btnId)
                    .closest("tr")
                    .after("<tr><td></td><td colspan = '150%'>" + $("#" + divname)
                        .html() + "</td></tr>");
                $(btnId).attr("data-hide", "false");
                $(btnId).html("<i class='fa fa-minus'></i>");
            } else {
                $(btnId).closest("tr").next().remove();
                $(btnId).attr("data-hide", "true");
                $(btnId).html("<i class='fa fa-plus'></i>");
            }
        }
    </script>
    <style>
        thead input {
        width: 100%;
        }
        .clOCO{
            display: unset !important;
        }
        .clOSR{
            display: unset !important;
        }
    </style>

    <div class="row">
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnActualizar" runat="server" class="btn btn-secondary col-12" onserverclick="btnActualizar_ServerClick">
                <i class="fa fa-search"></i>Actualizar
            </button>
        </div>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnGuardar">&nbsp;</label>
            <button type="button" id="btnGuardar" runat="server" class="btn btn-secondary col-12" onserverclick="btnGuardar_ServerClick">
                <i class="fa fa-save"></i> Guardar
            </button>
        </div>
    </div>
    <asp:UpdatePanel ID="UpdGv" runat="server">
        <ContentTemplate>
            <div id="dvGv" class="center-block">
                <div class="table table-sm dataTables_scrollBody dataTables_scrollHead">
                    <asp:GridView ID="GvList" runat="server" AutoGenerateColumns="false" CssClass="bgtbl table"
                        EmptyDataText="No se encontraron datos" ShowHeaderWhenEmpty="True" DataKeyNames="IDDOCX, IDDOCUMENTO, IDEMPRESA, IDESTADO, APROBACION"
                        OnRowDataBound="GvList_RowDataBound" OnDataBound="GvList_DataBound">
                        <Columns>
                            <asp:BoundField DataField="IDDOCX" Visible="false" />
                            <asp:BoundField DataField="IDDOCUMENTO"  Visible="false" />
                            <asp:BoundField DataField="IDEMPRESA" HeaderText="EMPRESA" />
                            <asp:BoundField DataField="IDESTADO"  Visible="false" />
                            <asp:BoundField DataField="APROBACION"  Visible="false" />
                            <asp:BoundField DataField="TIPO" HeaderText="Doc" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a class="mybtn btn-outline-primary" id="btn<%# Eval("IDDOCX") %>" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div<%# Eval("IDDOCX") %>');"><i class="fa fa-plus"></i></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CODIGO" HeaderText="Serie" />
                            <asp:BoundField DataField="fechacreacion" HeaderText="Fecha Creacion" />
                            <asp:BoundField DataField="FECHA" HeaderText="F. Documento" />
                            <asp:TemplateField HeaderText="Cotizaciones"  ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" >
                                <ItemTemplate>
                          
                                 <a class="mybtn btn-outline-primary cl<%# Eval("IDDOCUMENTO") %>" style="display: none" id="btn<%# Eval("IDDOCX") %>" role="button" data-hide="true"
                                        href="JavaScript:viewcotizacion('<%# Eval("IDEMPRESA") %>','<%# Eval("IDDOCUMENTO") %>','<%# Eval("IDDOCX") %>');"><i class="fas fa-file"></i></a>
                    
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="ALMACEN" HeaderText="Almacen" />
                            <asp:BoundField DataField="NOMBRE" HeaderText="Usuario" />
                            <asp:BoundField DataField="OBSERVACION" HeaderText="Observación" ItemStyle-Width="200px"/>
                            <asp:BoundField DataField="MONTO" HeaderText="Monto" />
                            <asp:BoundField DataField="USUARIOAPROBADOR" HeaderText="U. Aprob" />
                            <asp:TemplateField HeaderText="Historial Modificaciones" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                          
                                 <a class="mybtn btn-outline-primary " id="btn<%# Eval("IDDOCX") %>" role="button" data-hide="true"
                                        href="JavaScript:viewLog('<%# Eval("IDDOCX") %>','<%# Eval("IDDOCUMENTO") %>','<%# Eval("IDEMPRESA") %>');"><i class="fas fa-history"></i></a>
                    
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="U. Aprob Req"   ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                          
                                 <a class="mybtn btn-outline-primary cl<%# Eval("IDDOCUMENTO") %>" style="display: none" id="btn<%# Eval("IDDOCX") %>" role="button" data-hide="true"
                                        href="JavaScript:viewaprobador('<%# Eval("IDDOCX") %>','<%# Eval("IDDOCUMENTO") %>','<%# Eval("IDEMPRESA") %>');"><i class="fas fa-eye"></i></a>
                    
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <a class="mybtn btn-outline-primary" id="btnAc<%# Eval("IDDOCX") %>" role="button"
                                        data-value="2" data-active="false" style="padding-bottom: 1rem;"
                                        href="JavaScript:ActiveCheck('btnAc<%# Eval("IDDOCX") %>');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe<%# Eval("IDDOCX") %>" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe<%# Eval("IDDOCX") %>');"><i class="fa fa-times"></i></a>
                                    <asp:HiddenField runat="server" ID="hdfValue" Value="0" />
                                    <div id="div<%# Eval("IDDOCX") %>" style="display: none;">
                                        <asp:GridView ID="grdViewOrdersOfCustomer" runat="server" AutoGenerateColumns="false"
                                            DataKeyNames="IDDOCX" CssClass="table-sm ChildGrid">
                                            <Columns>
                                                <asp:BoundField DataField="IDDOCX" Visible="false" />
                                                <asp:BoundField DataField="IDPRODUCTO" HeaderText="Codigo" />
                                                <asp:BoundField DataField="DESCRIPCION" HeaderText="Descripcion" />
                                                <asp:BoundField DataField="CANTIDAD" HeaderText="Cantidad" />
                                                <asp:BoundField DataField="IDMEDIDA" HeaderText="U. M." />
                                                <asp:BoundField DataField="precio_unitario" HeaderText="Precio Unit." />
                                                <asp:BoundField DataField="total" HeaderText="TOTAL" />
                                                <asp:BoundField DataField="PROVEEDOR" HeaderText="PROVEEDOR" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnActualizar" />
            <asp:AsyncPostBackTrigger ControlID="btnGuardar" />
        </Triggers>
    </asp:UpdatePanel>

        <div class="modal fade" id="ModAprobador" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm  modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Aprobador Requerimiento</h5> 
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="body-sync" >
                    Aprobador: <span id="vaprobador"></span><br />
                    Fecha: <span id="vfecha"></span><br />
                    <span id="vaprobpor" style="display: none"></span>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModFiles" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-md  modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Archivos </h5> 
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="bodyfiles" >
                    <div class="form-group mb-1" style="overflow: auto;">
                           <table class="table table-sm table-bordered text-center" style="" id="tblFiles">
                            <thead>
                                <tr>
                                    <th style="width:60%">Archivo</th>
                                    <th style="width:20%">Id Usuario</th>
                                    <th style="width:20%">Fecha</th>
                                    <th style="width:20%">Descargar</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModHistorial" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg  modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Historial de Cambios </h5> 
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="bodylog" >
                    <div class="form-group mb-1" style="overflow: auto;">
                           <table class="table table-sm table-bordered text-center" style="" id="tblLogs">
                            <thead>
                                <tr>
                                    <th style="width:14.2%">Evento</th>
                                    <th style="width:14.2%">Fecha Creacion</th>
                                    <th style="width:14.2%">Usuario</th>
                                    <th style="width:14.2%">Maquina</th>
                                    <th style="width:14.2%">Campo</th>
                                    <th style="width:14.2%">Valor Anterior</th>
                                    <th style="width:14.2%">Valor Actual</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
        <div class="modal fade" id="ModalViewDoc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document" id="modview">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="titleDoc">Documento</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12" id="embed">
                          <div class="embed-responsive embed-responsive-21by9" id="DocView" style="height: 65vh;">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        function viewaprobador(id, tipo, empresa) {

                var obj = new Object();
            obj.vcEmpresa = empresa;
            obj.vcType = tipo;
            obj.vcId = id;

            $('#vaprobador').text('');
            $('#vfecha').text('');
            $('#vaprobpor').text('');
            if (obj.vcId != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerLogi.asmx/DetOrden",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst.length != 0) {
                            $("#ModAprobador").modal("show");

                            $('#vaprobador').text(lst[0].IDUSUARIO);
                            $('#vfecha').text(lst[0].FECHACREACION);
                            $('#vaprobpor').text(lst[0].MAQUINA);
                            		
                        } else {
                            $("#ModAprobador").modal("hide");
                            $('#vaprobador').text('');
                            $('#vfecha').text('');
                            $('#vaprobpor').text('');
                            toastr.error('', 'No encontrado');
                        }
                    }
                })
            }
        }

        function viewLog(id, tipo, empresa) {

            var obj = new Object();
            obj.vcEmpresa = empresa;
            obj.vcType = tipo;
            obj.vcId = id;

            $('#vaprobador').text('');
            $('#vfecha').text('');
            $('#vaprobpor').text('');
            if (obj.vcId != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerLogi.asmx/LogHistorial",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        var vvIng = '';
                        if (lst.length != 0) {

                            for (i = 0; i < lst.length; ++i) {

                                vvIng += "<tr><td>" + lst[i].evento + "</td>";
                                vvIng += "<td>" + lst[i].fechacreacion + "</td>";
                                vvIng += "<td>" + lst[i].idusuario + "</td>";
                                vvIng += "<td>" + lst[i].maquina + "</td>";
                                vvIng += "<td>" + lst[i].IDCAMPO + "</td>";
                                vvIng += "<td>" + lst[i].VALORANTERIOR + "</td>";
                                vvIng += "<td>" + lst[i].VALORACTUAL + "</td>";
                                vvIng += "</tr>"
                            }

                            $("#ModHistorial").modal("show");
                            $('#tblLogs tbody').html(vvIng);
                            //$("#tblFiles").dataTable();
                        } else {
                            $("#ModHistorial").modal("hide");
                            $('#tblLogs tbody').html('');
                            toastr.error('', 'No encontrado');
                        }
                    }
                })
            }
        }


        function viewcotizacion(empresa, tipo, id) {

            var obj = new Object();
            obj.vcIdEmpresa = empresa;
            obj.vcType = tipo;
            obj.vcCodigo = id;

            $('#vaprobador').text('');
            $('#vfecha').text('');
            $('#vaprobpor').text('');
            if (obj.vcId != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerLogi.asmx/ListFilesNisira_list",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        var vvIng = '';
                        if (lst.length != 0) {

                            for (i = 0; i < lst.length; ++i) {

                                vvIng += "<tr><td>" + lst[i].ARCHIVO + "</td>";
                                vvIng += "<td>" + lst[i].IDUSUARIO + "</td>";
                                vvIng += "<td>" + lst[i].FECHACREACION + "</td>";
                                vvIng += "<td><button class='viewpdf btn btn-link red m-0 p-0' file='" + lst[i].RUTACOMPLETA + "'><i class='fas fa-file'></i></button></td>"
                                vvIng += "</tr>"
                            }

                            $("#ModFiles").modal("show");
                            $('#tblFiles tbody').html(vvIng);
                            //$("#tblFiles").dataTable();
                        } else {
                            $("#ModFiles").modal("hide");
                            $('#tblFiles tbody').html('');
                            toastr.error('', 'No encontrado');
                        }
                    }
                })
            }
        }

        $(document).on('click', '.viewpdf', function (e) {
            e.preventDefault();
            
            var obj = new Object();
            obj.vcFile = $(this).attr('file');
            if (obj.vcFile != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerLogi.asmx/ViewPdf",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst.length != 0) {

                            $('#modview').attr('class', 'modal-dialog modal-lg');
                            $('#data').attr('class', 'col-md-3');
                            $('#embed').show();

                            var embed = '<embed src="data:application/pdf;base64,' + lst[0].file + '" type="application/pdf" width="100%" height="600px"/>';
                            $('#DocView').html(embed);

                            $("#ModalViewDoc").modal('show');
                        } else {
                            toastr.error('Archivo No existe', 'ERROR AL ABRIR');

                            $('#modview').attr('class', 'modal-dialog modal-xs');
                            $('#data').attr('class', 'col-md-12');
                            $('#embed').hide();

                            $("#ModalViewDoc").modal('show');
                        }
                    }
                })
            }
        })

        $("#<%=btnActualizar.ClientID%>").click(function () {
            
            setTimeout(function () { cargatabla(); }, 2000);
        });

        cargatabla();

       function cargatabla() {
            // Setup - add a text input to each footer cell
            $('#<%=GvList.ClientID%> thead tr').clone(true).appendTo('#<%=GvList.ClientID%> thead');
            $('#<%=GvList.ClientID%> thead tr:eq(1) th').each(function (i) {
                var title = $(this).text();
                if (title.length > 1) {
                    $(this).html('<input type="text" placeholder=" ' + title + '" />');
                    $('input', this).on('keyup change', function () {
                    if (table.column(i).search() !== this.value) {
                        table
                            .column(i)
                            .search(this.value)
                            .draw();
                    }
                });
                }
            });

           var table = $('#<%=GvList.ClientID%>').DataTable({
               destroy: true,
                orderCellsTop: false,
                fixedHeader: true,
                paging: false,
               //  searching: false,
               responsive: false
           });

           table.columns.adjust().draw();
        };

    </script>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
