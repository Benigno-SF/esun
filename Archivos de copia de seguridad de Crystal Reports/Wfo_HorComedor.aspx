<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_HorComedor.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_HorComedor" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/datatables.min.css">
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/buttons.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/buttons.bootstrap4.min.css">
    <!-- END: Vendor CSS-->


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivFeCont">
            <label for="txtFeCont">Fecha</label>
            <input type="text" id="txtFeCont" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
            <script type="text/javascript">
                $(function () {
                    $('#<%=txtFeCont.ClientID %>').datetimepicker({
                        format: 'DD/MM/YYYY',
                        locale: 'es'
                    });
                    $(function () {
                        $('#DivFeCont').datetimepicker({
                            format: 'DD/MM/YYYY',
                            locale: 'es'
                        });
                    });
                });
            </script>
        </div>
        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-4">
            <label for="txtDescri">Formato</label>
            <input type="text" id="txtDescri" runat="server" autocomplete="off" class="form-control" placeholder="INSPECCIÓN DE...">
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-3">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="btnBusc" runat="server" class="btn btn-secondary col-12"
                onserverclick="btnBusc_ServerClick">
                <i class="fas fa-search"></i>Buscar
            </button>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-3">
            <label for="btnAdd">&nbsp;</label>
            <button type="button" id="btnAdd" class="btn btn-primary col-12" data-toggle="modal" data-target="#modalevento">
                <i class="fas fa-plus"></i>Agregar Nuevo
            </button>
        </div>
    </div>
    <br />
    <asp:UpdatePanel ID="UpdGv" runat="server">
        <ContentTemplate>
            <div id="DivList" class="row center-block">
                <div class="table-responsive">
                    <asp:GridView ID="GvList" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-condensed bgtbl"
                        EmptyDataText="No se encontraron datos" ShowHeaderWhenEmpty="True" DataKeyNames="nIdEventoProg">
                        <Columns>
                            <asp:BoundField DataField="nIdEventoProg" Visible="false" />
                            <asp:BoundField DataField="cDescEvento" HeaderText="Tipo Evento" />
                            <asp:BoundField DataField="dFechaEvento" HeaderText="Fecha Evento" />
                            <asp:BoundField DataField="cMenu" HeaderText="Menu" />
                            <asp:BoundField DataField="cDieta" HeaderText="Dieta" />
                            <asp:BoundField DataField="cMensaje" HeaderText="Mensaje" />
                            <asp:BoundField DataField="cUsuarioCrea" HeaderText="Usuario" />
                            <asp:BoundField DataField="dFechaCrea" HeaderText="Fecha" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <button type="button" id="btnGvNew" class="mybtn btn btn-link"
                                        runat="server">
                                        <span class="fas fa-plus"></span>
                                    </button>&nbsp;&nbsp;
                                    <button type="button" id="btnGvEdit" class="mybtn btn btn-link"
                                        runat="server">
                                        <span class="fa fa-edit"></span>
                                    </button>
                                    <asp:HiddenField ID="hdfidEventoProg" runat="server" Value='<%#Eval("nIdEventoProg") %>' />
                                    <asp:HiddenField ID="hdfidTipoEvento" runat="server" Value='<%#Eval("nIdTipoEvento") %>' />
                                    <asp:HiddenField ID="hdffecha" runat="server" Value='<%#Eval("dFechaEvento") %>' />
                                    <asp:HiddenField ID="hdfcMenu" runat="server" Value='<%#Eval("cMenu") %>' />
                                    <asp:HiddenField ID="hdfcDieta" runat="server" Value='<%#Eval("cDieta") %>' />
                                    <asp:HiddenField ID="hdfcMensaje" runat="server" Value='<%#Eval("cMensaje") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnBusc" />
        </Triggers>
    </asp:UpdatePanel>


    <div class="row">

        <div class="col-md-12" id="activos">
            <div class="card">
                <div class="card-header card-header-warning">
                    <h3 class="card-title" style="font-weight: bold;">Detalle</h3>
                </div>
                <div class="card-body table-responsive">
                    <table id="table_det" class="table table-hover" style="">
                        <thead>
                            <tr>
                                <th>Evento</th>
                                <th>Grupo</th>
                                <th>Hora inicio</th>
                                <th>Hora fin</th>
                                <th>tiempo transcurrido</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>


    <div class="modal fade" id="modalevento" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Nuevo Evento</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Fecha Evento:</label>
                        <input type="text" id="FechaEvent" class="form-control round" value="" autocomplete="off" placeholder="dd/mm/yyyy">
                        <script type="text/javascript">
                            $(function () {
                                $('#FechaEvent').datetimepicker({
                                    format: 'DD/MM/YYYY',
                                    locale: 'es'
                                });
                                $(function () {
                                    $('#DivFeCont').datetimepicker({
                                        format: 'DD/MM/YYYY',
                                        locale: 'es'
                                    });
                                });
                            });
                        </script>
                    </div>

                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Tipo Evento:</label>
                        <asp:DropDownList ID="ddlTipoEvento" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Menu:</label>
                        <input type="text" id="Menu" class="form-control round" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Dieta:</label>
                        <input type="text" id="Dieta" class="form-control round" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Mensaje:</label>
                        <input type="text" id="Mensaje" class="form-control round" autocomplete="off">
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="IdEventoProg" value="0">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" id="btnSave" class="btn btn-primary">Agregar</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="modaldetalle" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Nuevo Evento</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Area:</label>
                        <asp:DropDownList ID="ddlAreaProceso" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Grupo:</label>
                        <asp:DropDownList ID="ddlAreaGrupo" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Hora Inicio:</label>
                        <input type="time" id="HInicio" class="form-control round" value="" autocomplete="off" placeholder="hh:mm:ss">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Minutos:</label>
                        <input type="number" id="Min" class="form-control round" value="15" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Hora Fin:</label>
                        <input type="time" id="HFin" class="form-control round" value="" autocomplete="off" placeholder="hh:mm:ss">
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="idEvento" value="">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" id="btnSavedetalle" class="btn btn-primary">Agregar</button>
                </div>
            </div>
        </div>
    </div>

        <!-- BEGIN: PageScripts/ Vendor JS-->
    <script src="../Scripts/dt/datatables.min.js"></script>
    <script src="../Scripts/dt/dataTables.buttons.min.js"></script>
    <script src="../Scripts/dt/buttons.bootstrap4.min.js"></script>
    <script src="../Scripts/dt/vfs_fonts.js"></script>
    <script src="../Scripts/dt/buttons.html5.min.js"></script>
    <!-- END: Page VScripts/endor JS-->


    <script>

        function aummin(min) {
            
            var valuemin = min;

                var fecha = new Date();
                var horas = fecha.getHours();
                horas = horas < 10 ? '0' + horas : horas;
                var minutos = fecha.getMinutes();
                minutos = minutos < 10 ? '0' + minutos : minutos;

                var horaexact = horas + ':' + minutos;
                $("#HInicio").val(horaexact);
                //var segundos = fecha.getSeconds();

                var minx = parseInt(minutos) + parseInt(valuemin);

                if (minx >= 60) {
                    var horasx = parseInt(horas) + 1;
                    var min_falt = minx - 59;
                    var min2 = ('0' + min_falt).slice(-2);
                } else {
                    var horasx = horas;
                    var min2 = ('0' + minx).slice(-2);
                }

                if (min2 > 0 && min2 < 60) {
                    var valuex2 = horasx + ':' + min2;
                    $("#HFin").val(valuex2);
                } else {
                    var valuex = horas + ':' + minutos;
                    $("#HFin").val(valuex);
                }
        }
        try {
            $("#Min").on('keyup', function () {
                var valuemin = $(this).val();
                aummin(valuemin);

            }).keyup();
        } catch (e) { }
        
        $('#<%=UpdGv.ClientID%>').on('click', 'table[id*=GvList] [id*=btnGvEdit]', function () {
            idevent = $(this).closest("tr").find("input[type=hidden][id*=hdfidEventoProg]").val();
            fechaevent = $(this).closest("tr").find("input[type=hidden][id*=hdffecha]").val();
            tevent = $(this).closest("tr").find("input[type=hidden][id*=hdfidTipoEvento]").val();

            menu = $(this).closest("tr").find("input[type=hidden][id*=hdfcMenu]").val();
            dieta = $(this).closest("tr").find("input[type=hidden][id*=hdfcDieta]").val();
            mensaje = $(this).closest("tr").find("input[type=hidden][id*=hdfcMensaje]").val();

            $('#IdEventoProg').val(idevent);
            $('#FechaEvent').val(fechaevent);
            $('#<%=ddlTipoEvento.ClientID%>').val(tevent).change();
            $('#Menu').val(menu);
            $('#Dieta').val(dieta);
            $('#Mensaje').val(mensaje);


            $('#modalevento').modal('show');
        });

        $("#btnSave").click(function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdEventoProg = $("#IdEventoProg").val();
            obj.vnIdTipoEvento = $('#<%=ddlTipoEvento.ClientID%>').val();
            obj.vcFecha = $("#FechaEvent").val();
            obj.vcMenu = $('#Menu').val();
            obj.vcDieta = $('#Dieta').val();
            obj.vcMensaje = $('#Mensaje').val();
            if (obj.vnIdTipoEvento != -1 && obj.vcFecha != "") {
                $.ajax({
                    type: 'POST',
                    url: "../SerRRHH.asmx/EventoprogMov",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        toastr["success"]("My name is Inigo Montoya. You killed my father. Prepare to die!")

                        $('#modalevento').modal('hide');
                        $('#<%=btnBusc.ClientID%>').click();

                    },
                    error: function (error) {
                        alert(JSON.stringify(error))
                        $.toaster({
                            title: 'ERROR',
                            message: error,
                            priority: 'danger'
                        });
                    }
                });
            } else {
                toastr["success"]("My name is Inigo Montoya. You killed my father. Prepare to die!")
            }
        });
        $('#<%=UpdGv.ClientID%>').on('click', 'table[id*=GvList] [id*=btnGvNew]', function () {
            abc = $(this).closest("tr").find("input[type=hidden][id*=hdfidEventoProg]").val();
            tevent = $(this).closest("tr").find("input[type=hidden][id*=hdfidTipoEvento]").val();
            // alert(abc);
            $('#modaldetalle').modal('show');
            $('#min').val('15');
            aummin(15);
        });
        $("#btnSavedetalle").click(function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdEventoProg = abc;
            obj.vnIdTipoEvento = tevent;
            var verifi = $('#<%=ddlAreaGrupo.ClientID%>').val();
            obj.vnIdGrupo = $('#<%=ddlAreaGrupo.ClientID%>').val();
            obj.vnIdArea = 1;
            obj.vdFechaInicio = $("#HInicio").val();
            obj.vdFechaFin = $("#HFin").val();
            obj.vnIdEstado = 1;
            if (verifi != -1) {
                $.ajax({
                    type: 'POST',
                    url: "../SerRRHH.asmx/EventoprogDetalleMov",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
       
                        toastr["success"]("My name is Inigo Montoya. You killed my father. Prepare to die!")

                        $('#modaldetalle').modal('hide');
                    },
                    error: function (error) {
                        console.log(error);
                        alert(JSON.stringify(error))
                    }
                });
            } else {
                toastr["success"]("fail!")
            }
        });


        $(document).ready(function () {


            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdEventoProg = 0;


            var cargatabla = function () {
                $.ajax({
                    type: 'POST',
                    url: "../SerRRHH.asmx/EventoProgDetalleList",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    error: function () {
                        $('#activos').hide();
                    },
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        $('#table_det').DataTable({
                            destroy: true,
                            paging: false,
                            ordering: false,
                            info: false,
                            searching: false,
                            data: lst,
                            columns: [
                                { data: 'cDescEvento' },
                                { data: 'cDescAGrupo' },
                                { data: 'Hinicio' },
                                { data: 'Hfin' },
                                {
                                     data: 'Falta',
                                render: function (Falta) {
                                    if (Falta == "0 Segundos") {
                                        return '<B style="color: red" class="parpadea text">CULMINO<B>';
                                    } else {
                                        return Falta;
                                    }

                                }
                                }

                            ]
                        })
                    }
                });
            }
            cargatabla();
           var intervalo = setInterval(cargatabla, 1000);

        });
    </script>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
