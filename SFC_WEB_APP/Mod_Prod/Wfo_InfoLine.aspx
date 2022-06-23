<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_InfoLine.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Wfo_InfoLine" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
        .switch-field {
            display: flex;
            /*margin-bottom: 36px;*/
            overflow: hidden;
        }

            .switch-field input {
                position: absolute !important;
                clip: rect(0, 0, 0, 0);
                height: 1px;
                width: 1px;
                border: 0;
                overflow: hidden;
            }

            .switch-field label {
                background-color: #e4e4e4;
                color: rgba(0, 0, 0, 0.6);
                font-size: 14px;
                line-height: 1;
                text-align: center;
                padding: 8px 16px;
                margin-right: -1px;
                border: 1px solid rgba(0, 0, 0, 0.2);
                box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.3), 0 1px rgba(255, 255, 255, 0.1);
                transition: all 0.1s ease-in-out;
            }

                .switch-field label:hover {
                    cursor: pointer;
                }

            .switch-field input:checked + label {
                background-color: #a5dc86;
                box-shadow: none;
            }

            .switch-field label:first-of-type {
                border-radius: 4px 0 0 4px;
            }

            .switch-field label:last-of-type {
                border-radius: 0 4px 4px 0;
            }
    </style>
    <script>
        function jScript() {
            $("#<%=ddlAProceso.ClientID%>").change(function () {
                LoadDetail();
            });
            $("#<%=btnClean.ClientID%>").click(function () {
                var bool = confirm("¿Esta seguro que desea eliminar todos los registros?");
                if (bool) {
                    DeletAll();
                    LoadData();
                    $("#<%=btnDdlIdCul.ClientID%>").trigger("click");
                } 
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">

    <asp:UpdatePanel ID="upHead" runat="server">
        <ContentTemplate>
            <script>
                Sys.Application.add_load(jScript);
                function UserConfirm() {
                return confirm("");
            }
            </script>
            <div class="row">
                <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-3">
                    <label for="ddlAProceso">Area de Proceso</label>
                    <asp:DropDownList ID="ddlAProceso" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAProceso_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                    <label class="control-label" for="ddlIdCult">Cultivo</label>
                    <asp:DropDownList ID="ddlIdCult" runat="server" CssClass="form-control myform-control" AutoPostBack="true" OnSelectedIndexChanged="ddlIdCult_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
                    <label for="btnBusc">&nbsp;</label>
                    <button type="button" id="btnClean" runat="server" class="btn btn-secondary col-12" >
                        <i class="fa fa-eraser"></i> Limpiar
                    </button>
                </div>
                <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
                    <label for="btnBusc">&nbsp;</label>
                    <button type="button" id="btnInicProc" runat="server" class="btn btn-primary col-12 proceso" data-toggle="modal" data-target="#ModProceso">
                        <i class="fa fa-play-circle"></i> Iniciar
                    </button>
                    <button type="button" id="btnFinProc" runat="server" class="btn btn-primary col-12 proceso" data-toggle="modal" data-target="#ModProceso">
                        <i class="fa fa-stop-circle"></i> Terminar
                    </button>
                </div>
                <div class="form-group col-6 col-sm-6 col-md-6 col-lg-3">
                    <label for="btnBusc">&nbsp;</label>
                   <b><p id="txtProc" class="" runat="server"></p></b>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnDdlIdCul" />
        </Triggers>
    </asp:UpdatePanel>
    <div class="container">
        <div class="row" id="dvCont"></div>
    </div>
    <div class="modal fade" id="ModGrd" tabindex="-1" role="dialog" aria-labelledby="Modal" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="lblModTitle"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <button type="button" id="btnAgregar" class="btn btn-primary">
                        <i class="fa fa-plus"></i>Nuevo
                    </button>
                    <br />
                    <asp:UpdatePanel ID="UpdGv" runat="server">
                        <ContentTemplate>
                            <div id="dvGv" class="row center-block">
                                <div class="table-responsive">
                                    <asp:GridView ID="GvList" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-condensed bgtbl"
                                        EmptyDataText="No se encontraron datos" ShowHeaderWhenEmpty="True" DataKeyNames="nIdSubLinea, nIdPanelInfo">
                                        <Columns>
                                            <asp:BoundField DataField="nIdSubLinea" Visible="false" />
                                            <asp:BoundField DataField="nIdPanelInfo" Visible="false" />
                                            <asp:BoundField DataField="nIdCultivo" Visible="false" />
                                            <asp:BoundField DataField="nIdCategoria" Visible="false" />
                                            <asp:BoundField DataField="cDesCategoria" HeaderText="Categoria" />
                                            <asp:BoundField DataField="nIdCalibre" Visible="false" />
                                            <asp:BoundField DataField="cDesCalibre" HeaderText="Calibre" />
                                            <asp:BoundField DataField="bPlu" HeaderText="PLU" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <button type="button" id="btnGvEdit" class="mybtn btn btn-link"
                                                        runat="server" title="Eliminar" onserverclick="btnGvEdit_ServerClick">
                                                        <span class="fa fa-trash"></span>
                                                    </button>
                                                    <asp:HiddenField ID="hdfIdPanel" runat="server" Value='<%#Eval("nIdCultivo") %>' />
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
                    <asp:HiddenField ID="hdfArea" runat="server" Value="0" />
                    <asp:HiddenField ID="hdfGrupo" runat="server" Value="0" />
                    <asp:HiddenField ID="hdfSubLi" runat="server" Value="0" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="dvRegiInfo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Registro: </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="upReg" runat="server">
                        <ContentTemplate>
                            <div class="form-group">
                                <label class="control-label" for="ddlIdCate">Categoría</label>
                                <asp:DropDownList ID="ddlIdCate" runat="server" CssClass="form-control myform-control"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="ddlIdCali">Calibre</label>
                                <asp:DropDownList ID="ddlIdCali" runat="server" CssClass="form-control myform-control"></asp:DropDownList>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="form-group">
                        
                        <label class="control-label" for="ddlIdCali">Lleva PLU?</label>
                        <div class="switch-field">
                            <input type="radio" id="radio-3" class="radiox" name="plu" value="1" />
                            <label for="radio-3">SI</label>
                            <input type="radio" id="radio-4" class="radiox" name="plu" value="0" />
                            <label for="radio-4">No</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" id="btnSave" class="btn btn-primary">Guardar</button>
                </div>
            </div>
        </div>
    </div>

        <!-- Modal -->
    <div class="modal fade" id="ModProceso" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" style="text-align: center">
                        <span id="ModTitleProc"></span><br />
                        <span id="ModSubTitleProc" style="font-size: 1rem"></span>
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="obsSalidaSalida">
                        <div class="form-group p-0 m-0" id="DivFechaProceso">
                            <label for="txtFecha">Fecha</label>
                            <input type="text" id="txtfechaProceso" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
                            <script type="text/javascript">
                                $(function () {
                                    $('#txtfechaProceso').datetimepicker({
                                        format: 'DD/MM/YYYY',
                                        locale: 'es'
                                    });
                                    $(function () {
                                        $('#DivFechaProceso').datetimepicker({
                                            format: 'DD/MM/YYYY',
                                            locale: 'es'
                                        });
                                    });
                                });
                            </script>
                        </div>
                        <div class="form-group p-0 m-0" id="DivHoraProceso">
                            <label for="recipient-name" class="col-form-label">Hora:</label>
                            <input type="text" id="txtHoraProceso" autocomplete="off" class="form-control" placeholder="HH:mm:ss">
                            <script type="text/javascript">
                                $(function () {
                                    $('#txtHoraProceso').datetimepicker({
                                        format: 'HH:mm:ss',
                                        locale: 'es'
                                    });
                                    $(function () {
                                        $('#DivHoraProceso').datetimepicker({
                                            format: 'HH:mm:ss',
                                            locale: 'es'
                                        });
                                    });
                                });
                            </script>
                        </div>
                        <div class="form-group mb-1" id="obsproc" style="display: none">
                            <label for="message-text" class="col-form-label">Observacion:</label>
                            <textarea id="cObservacion" name='cObservacion' class="form-control round"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnCancelProc" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" id="btnRegiProc" class="btn btn-primary">Iniciar Proceso</button>
                </div>
            </div>
        </div>
    </div>

    <button type="button" id="btnBusc" runat="server" style="display: none;" onserverclick="btnBusc_ServerClick">
        <i class="fas fa-search"></i>Buscar
    </button>
    <button type="button" id="btnDdlIdCul" runat="server" style="display: none;" onserverclick="btnDdlIdCul_ServerClick">
        <i class="fas fa-search"></i>Buscar
    </button>
      <script src="../Scripts/sweetalert2.js"></script>
    <script>
        function DeletAll() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdArea = $("#<%=ddlAProceso.ClientID%>").val();
            $.ajax({
                async: false,
                type: 'POST',
                url: "../SerProd.asmx/UpdPanelInfo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var vvRet = data.d * 1;
                    if (vvRet == 0) {
                        $("[id^='btnTh_']").each(function () {
                            var ctrID = this.id;
                            var vvClass = $(this).find("span").attr("class");
                            $("#" + ctrID).find("span").removeClass(vvClass);
                            $("#" + ctrID).find("span").addClass(toogleClass(false));
                        });
                    }
                    else 
                        toastr["error"]("No se pudo limpiar", "Error");
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        };
        setInterval(LoadData, 60000);


        $(document).on('click', '.proceso', function () {
            var title = $("#<%=txtProc.ClientID%>").text();


            if (title != 'Proceso No Iniciado') {
                $('#ModTitleProc').text('¿Esta seguro que desea finalizar el ' + title + ' ?');
                $('#ModSubTitleProc').text("Cuidado, verificar que haya finalizado las lecturas de las lineas");
                $('#btnRegiProc').text('Si, Finalizar!');
                $('#obsproc').show();
                $('#btnCancelProc').text('Cancelar');
            } else {
                $('#ModTitleProc').text('¿Iniciara Un nuevo Proceso?');
                $('#ModSubTitleProc').text("Desea continuar");
                $('#btnRegiProc').text('Si, Iniciar!');
                $('#obsproc').hide();
                $('#btnCancelProc').text('Cancelar');
            }
        });


        $(document).on('click', '#btnRegiProc', function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdArea = $("#<%=ddlAProceso.ClientID%>").val();
            obj.vnIdProceso = 0;
            if ($('#txtfechaProceso').val() != '' && $('#txtHoraProceso').val() != '' ) {
                obj.vcFechaProceso = $('#txtfechaProceso').val() + ' ' + $('#txtHoraProceso').val();
            } else {
                obj.vcFechaProceso = '';
            }
            obj.vcObservacion = $('#cObservacion').val();
            var title = $("#<%=txtProc.ClientID%>").text();
            if (obj.vcFechaProceso != '') {


                $.ajax({
                    async: false,
                    type: 'POST',
                    url: "../SerProd.asmx/InicFinProceso",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        switch (lst[0].nIdProceso) {
                            case -1:
                                toastr["error"]("No se guardo correctamente", "Error");
                                $('#txtfechaProceso').data("DateTimePicker").clear();
                                $('#txtHoraProceso').data("DateTimePicker").clear();
                                $('#cObservacion').val('')
                                $('#btnInicProc').hide();
                                $('#btnFinProc').show();
                                $('#ModProceso').modal("show");
                                break;
                            case 0:
                                toastr["warning"]("Proceso Finalizado", "");
                                $(".proceso").html('<i class="fa fa-stop-circle"></i> Iniciar');
                                $("#<%=txtProc.ClientID%>").text('Proceso No Iniciado');
                                $('#txtfechaProceso').data("DateTimePicker").clear();
                                $('#txtHoraProceso').data("DateTimePicker").clear();
                                $('#cObservacion').val('');
                                $('#ModProceso').modal("hode");
                                LoadData();
                                break;
                            default:
                                toastr["success"]("Proceso Iniciado correctamente", lst[0].dfecha);
                                $("#<%=txtProc.ClientID%>").text("Proceso Iniciado del dia " + lst[0].dfecha);
                                $(".proceso").html('<i class="fa fa-stop-circle"></i> Terminar');
                                $('#txtfechaProceso').data("DateTimePicker").clear();
                                $('#txtHoraProceso').data("DateTimePicker").clear();
                                $('#cObservacion').val('');
                                $('#ModProceso').modal("hide");
                                LoadData();
                                break;
                            // code block
                        }
                        //toastr["success"]('subtitulo', "titulo")
                        //succes warning error toastr["success"]('subtitulo', "titulo")
                    },
                    error: function (error) {
                        console.log(error);
                        alert(JSON.stringify(error))
                    }
                });
            } else {
                alert('ingreses fecha valida')
            }
        });


        $(document).on('click', '#dvCont .btnLock', function () {
            var ctrID = this.id;
            var vbEstado = $(this).attr("data-est") == "true";
            var vvClass = $(this).find("span").attr("class");
            //
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdArea = ctrID.split("_")[2];
            obj.vbEstado = !vbEstado;
            //
            $.ajax({
                async: false,
                type: 'POST',
                url: "../SerProd.asmx/BloqueoLinea",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var vnReturn = data.d * 1;
                    switch (vnReturn) {
                        case -1:
                            toastr["error"]("No se guardo correctamente", "Error");
                            break;
                        case 0:
                            
                            break;
                        default:
                            $("#" + ctrID).attr("data-est", !vbEstado + "");
                            $("#" + ctrID).find("span").removeClass(vvClass);
                            $("#" + ctrID).find("span").addClass(toogleClass(!vbEstado));
                        // code block
                    }
                    //toastr["success"]('subtitulo', "titulo")
                    //succes warning error toastr["success"]('subtitulo', "titulo")
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        });

        function LoadData() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdArea = $("#<%=ddlAProceso.ClientID%>").val();
            obj.vnIdSubLinea = 0
            obj.vnIdPanelInfo = 0
            $.ajax({
                async: false,
                type: 'POST',
                url: "../SerProd.asmx/ListPanelInfo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    $(".cl").each(function (i, obj) {
                        $(this).text("");
                    });
                    if (lst.length > 0) {
                        lst.forEach(function (result, index) {
                            var $dv = $("#dv" + result.nIdSubLinea);
                            var vnCount = $dv.attr("data-nu") * 1 + 1;
                            var plu = '';
                            if (result.bPlu == true) {
                                plu = "<img src='../img/img_plu_small.png' width='16px'>";
                            }
                            $("#" + result.nIdSubLinea + "_" + result.RowNumb).html("C-" + result.cDesCategoria + " " + result.cDesCalibre + " " + plu);
                            $dv.attr("data-nu", vnCount)
                        });
                    }
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        }

        $("#btnSave").click(function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdSubLinea = $("#<%=hdfSubLi.ClientID%>").val();;
            obj.vnIdPanelInfo = 0;
            obj.vnIdCultivo = $("#<%=ddlIdCult.ClientID%>").val();
            obj.vnIdCategoria = $("#<%=ddlIdCate.ClientID%>").val();
            obj.vnIdCalibre = $("#<%=ddlIdCali.ClientID%>").val();
            if ($('input:radio[name=plu]:checked').val() == 1) {
                obj.vbPlu = true;
            } else {
                obj.vbPlu = false;
            }
            obj.vbEstado = true;
            $.ajax({
                async: false,
                type: 'POST',
                url: "../SerProd.asmx/RegiPanelInfo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    $("#dvRegiInfo").modal("hide");
                    $("#<%=btnBusc.ClientID%>").trigger("click");
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        });

        $("#btnAgregar").click(function () {
            $("#dvRegiInfo").modal("show");
        });
        //dvRegiInfo
        function LoadDetail() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdArea = $("#<%=ddlAProceso.ClientID%>").val();
            $.ajax({
                async: false,
                type: 'POST',
                url: "../SerProd.asmx/ListAreaGrupo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    CreaTabla(JSON.parse(data.d));
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
            LoadData();
        }

        function toogleClass(vvBool) {
            return (vvBool) ? "fas fa-lock" : "fas fa-lock-open";
        }
        function CreaTabla(lst) {
            var vvdt = "";
            lst.forEach(function (result, index) {
                vvdt += "<div class='col-12 col-sm-3 p-2'><table id='" + result.nIdGrupo
                    + "' border='1' style='width: 90%; text-align: center;'><thead><tr><th colspan='" + result.nSubLinea + "'><button "
                    + "id='btnTh_" + result.nIdArea + "_" + result.nIdGrupo + "' type='button'"
                    + "data-est='" + result.bEstadoUso + "' "
                    + "class='mybtn btn btn-link btnLock'><span class='" + (toogleClass(result.bEstadoUso)) + "'></span></button>"
                    + result.cDescAGrupo 
                    + "</th></tr><tr id='hd'></tr><tr id='bd'></tr></thead></table></div>"
            });
            $("#dvCont").html(vvdt);
            Detalle();
        }
        function Detalle() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdArea = $("#<%=ddlAProceso.ClientID%>").val();
            $.ajax({
                async: false,
                type: 'POST',
                url: "../SerProd.asmx/ListSubLinea",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    lst.forEach(function (result, index) {
                        $("#" + result.nIdGrupo).find('tr[id=hd]').before("<td class='align-bottom'><button "
                            + "id='" + result.nIdArea + "_" + result.nIdGrupo + "_" + result.nIdSubLinea
                            + "' type='button' data-cu='" + result.nIdCultivo + "' class='btn btn-primary cls' data-target='#ModGrd'>" + result.cDescSubLinea
                            + "</button></td>");
                        $("#" + result.nIdGrupo).find('tr[id=bd]').before("<td><div class='dvIn' data-nu='0' id='dv" + result.nIdSubLinea + "'>"
                            + "<label class='cl' id='" + result.nIdSubLinea + "_1" + "'>&nbsp;</label><br />"
                            + "<label class='cl' id='" + result.nIdSubLinea + "_2" + "'>&nbsp;</label><br />"
                            + "<label class='cl' id='" + result.nIdSubLinea + "_3" + "'>&nbsp;</label><br />"
                            + "<label class='cl' id='" + result.nIdSubLinea + "_4" + "'>&nbsp;</label><br />"
                            + "</div></td>");
                    });
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        };
        var flag = 0;
        $(document).on('click', '#dvCont .cls', function () {
            var flag = 0;
            var vvVali = $("#<%=ddlIdCult.ClientID%>").val();
            if (vvVali == "0") {
                $("#<%=ddlIdCult.ClientID%>").addClass("is-invalid");
            } else {

                $("#<%=ddlIdCult.ClientID%>").removeClass("is-invalid");
                $('label[for=ddlIdCult]').removeClass("is-invalid");
                var ctrID = this.id;
                $("#<%=hdfArea.ClientID%>").val(ctrID.split("_")[0]);
                $("#<%=hdfGrupo.ClientID%>").val(ctrID.split("_")[1]);
                $("#<%=hdfSubLi.ClientID%>").val(ctrID.split("_")[2]);
                var cGrup = $("#" + ctrID.split("_")[1] + " tr>th:first").val()
                $("#lblModTitle").text("Linea: " + cGrup + " > " + "Sub Linea: " + $(this).html());
                $("#<%=btnBusc.ClientID%>").trigger("click");
                $("#ModGrd").modal("show");
                $("#ModGrd").on('hidden.bs.modal', function (e) {
                    if (flag == 0) {
                        $("#<%=ddlIdCate.ClientID%>").val("0");
                        $("#<%=ddlIdCali.ClientID%>").val("0");
                        LoadData();
                        $("#<%=btnDdlIdCul.ClientID%>").trigger("click");
                    }
                    flag = 1;
                });
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
