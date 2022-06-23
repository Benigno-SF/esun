<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_UnidNegocio-Edit.aspx.cs" Inherits="SFC_WEB_APP.Mod_Pres.Wfo_UnidNegocio_Edit" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .myform-control {
            display: block;
            width: 90% !important;
            height: calc(1.5rem + 2px) !important;
            padding: 0rem 0.01rem !important;
            font-size: 1rem !important;
            font-weight: 400 !important;
            line-height: 1.5 !important;
            color: #495057 !important;
            background-color: #fff !important;
            background-clip: padding-box !important;
            border: 1px solid #ced4da !important;
            border-radius: 0.25rem !important;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out !important;
        }
        .frm-width {
            width: 90% !important;
        }
        .frm {
            margin-bottom: 0.3rem !important;
        }
        .col-1, .col-2, .col-3, .col-4, .col-5, .col-6, .col-7, .col-8, .col-9, .col-10, .col-11, .col-12, .col,
        .col-auto, .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm,
        .col-sm-auto, .col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12, .col-md,
        .col-md-auto, .col-lg-1, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg,
        .col-lg-auto, .col-xl-1, .col-xl-2, .col-xl-3, .col-xl-4, .col-xl-5, .col-xl-6, .col-xl-7, .col-xl-8, .col-xl-9, .col-xl-10, .col-xl-11, .col-xl-12, .col-xl,
        .col-xl-auto {
            position: relative;
            width: 100%;
            padding-right: 5px !important;
            padding-left: 5px !important;
        }

        .form-check {
            position: relative;
            display: block;
            padding-left: 0.25rem !important;
        }

        .btnPers {
            padding: 0.175rem 0.25rem !important;
            font-size: 1rem;
        }
        .myCol {
            width: 80px;
            padding-right: 5px;
            padding-left: 5px;
        }

        .scrl {
            overflow: auto !important;
            height: 73vh;
        }

        .tdTit {
            width: 90px
        }

        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
            background: rgba(255,255,255,0.5) !important;
        }

        tr {
        }

            tr:first-child th {
                position: sticky !important;
                top: 0px !important;
                z-index: 2;
            }

            tr td {
                min-width: 100px;
            }

        td, th {
            border: 1px solid #dddddd;
            padding: 3px;
        }

        th {
            background-color: #ADD1E4;
        }

            th:first-child, td:first-child {
                position: sticky;
                left: 0px;
            }

        td:first-child {
            background-color: grey;
        }
        .SubTot {
            background-color: #D3D8DB !important;
            font-weight: 600 !important;
        }

        .myctrl {
            text-align: right !important;
        }

        input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        input[type="number"] {
            -moz-appearance: textfield;
        }

        body {
        }
    </style>
    <link href="../Content/JQWidgets/jqx.base.css" rel="stylesheet" />
    <script >
    // JavaScript function to call inside UpdatePanel
    function jScript() {
        $("#<%=btnSave.ClientID%>").click(function () {
            var IdPres = $("#<%=ddlIdPresup.ClientID%>").val();
            var IdUNeg = $("#<%=ddlIdUnidNeg.ClientID%>").val();
            var IdForm = $("#<%=ddlIdForm.ClientID%>").val();
            var IdFreg = "0";
            if ($("#<%= rdbLote.ClientID %>").is(':checked')) {
                IdFreg = "1";
            };
            var valid = true;
            if (IdPres == "0") {
                $("#<%=ddlIdPresup.ClientID%>").addClass("is-invalid");
                valid = false;
            } else
                $("#<%=ddlIdPresup.ClientID%>").removeClass("is-invalid");
            if (IdUNeg == "0") {
                $("#<%=ddlIdUnidNeg.ClientID%>").addClass("is-invalid");
                valid = false;
            } else
                $("#<%=ddlIdUnidNeg.ClientID%>").removeClass("is-invalid");
            if (IdForm == "0") {
                $("#<%=ddlIdForm.ClientID%>").addClass("is-invalid");
                valid = false;
            } else
                $("#<%=ddlIdForm.ClientID%>").removeClass("is-invalid");
            if (valid == true) {
                var obj = new Object();
                obj.vcIdEmpresa = fuGetCdEmpre();
                obj.vnIdPresupuesto = IdPres;
                obj.vnIdUnidadNeg = IdUNeg;
                obj.vnIdFormato = IdForm;
                obj.vnFRegistro = IdFreg;
                $.ajax({
                    type: 'POST',
                    url: "../SerPres.asmx/RegiPresUnid",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        if (data.d == "0") {
                            alert("Ya hay un formato creado para el lote");
                        } else {
                            //Bloqueo de Controles
                            BloqckHeader(true);
                            load();
                        }
                    },
                    error: function (error) {
                        console.log(error);
                        alert(JSON.stringify(error))
                    }
                });
                
            }
        });
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
    <li class="nav-item">
        <button type="button" id="btnGuardar" class="btn btn-primary col-12">
            <span class="fa fa-save"></span> Guardar
        </button>
    </li>
    <div class="mr-1"></div>
    <li class="nav-item">
        <button type="button" id="btnCopy" class="btn btn-primary col-12" 
            data-toggle="modal" data-target="#modUnidNeg">
            <span class="fa fa-copy"></span> Copiar
        </button>
    </li>
    <li class="nav-item" id="lblEstado">Guardado</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdDat">
        <ContentTemplate>
            <script >
                Sys.Application.add_load(jScript);
            </script>
            <div class="form-inline">
                <div class="row frm col-12 col-sm-4">
                    <div class="col-3">Fundo</div>
                    <div class="col-9">:<asp:DropDownList ID="ddlCdFundo" runat="server" CssClass="form-control myform-control" OnSelectedIndexChanged="ddlCdFundo_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></div>
                </div>
                <div class="row frm col-12 col-sm-4">
                    <div class="col-2">Lote</div>
                    <div class="col-9">:<asp:DropDownList ID="ddlIdUnidNeg" runat="server" CssClass="form-control myform-control" OnSelectedIndexChanged="ddlIdUnidNeg_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></div>
                </div>
                <div class="row frm col-12 col-sm-4">
                    <div class="col-2">Ha</div>
                    <div class="col-4">: <asp:Label ID="lblNumHA" runat="server" Text="--"></asp:Label></div>
                    <div class="col-2">Cultivo</div>
                    <div class="col-4">: <asp:Label ID="lblCult" runat="server" Text="--"></asp:Label></div>
                </div>
                <div class="row frm col-12 col-sm-4">
                    <div class="col-3">Presupuesto</div>
                    <div class="col-9">:<asp:DropDownList ID="ddlIdPresup" runat="server" CssClass="form-control myform-control"></asp:DropDownList></div>
                </div>
                <div class="row frm col-12 col-sm-4">
                    <div class="col-2">Formato</div>
                    <div class="col-9">:<asp:DropDownList ID="ddlIdForm" runat="server" CssClass="form-control myform-control"></asp:DropDownList></div>
                </div>
                <div class="row frm col-12 col-sm-4">
                    <div class="col-2">Versión</div>
                    <div class="col-4">:<asp:DropDownList ID="ddlVersion" runat="server" CssClass="form-control myform-control" Enabled="false"></asp:DropDownList></div>
                    <div class="col-2">Final</div>
                    <div class="col-3">:<asp:CheckBox ID="chkFinal" runat="server" class="form-check-input" /></div>
                </div>
                <div class="row frm col-12 col-sm-4">
                    <div class="col-3">F. Ingreso</div>
                    <div class="col-9">
                        :<asp:RadioButton ID="rdbHect" runat="server" GroupName="rdb" Checked="true" name="IdFrRegi" value="0" />
                        x Hectarea  &nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="rdbLote" runat="server" GroupName="rdb" name="IdFrRegi" value="1" />
                        x Lote
                    </div>
                </div>
                <div class="row frm col-6 col-sm-6">
                </div>
                <div class="row frm col-6 col-sm-2">
                    <button type="button" id="btnSave" runat="server" class="btn btn-secondary btnPers col-12">
                        <i class="fa fa-location-arrow"></i> Iniciar
                    </button>
                </div>
            </div>
            <asp:HiddenField ID="hdfIdCult" runat="server" Value="0" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="dvGrd" class="scrl"></div>
    <div class="modal fade" id="modUnidNeg" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Lotes</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="dvdtl" class="clearfix container scrl">
                        <div id="jqxUnidNeg"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" id="btnRegiCopy" class="btn btn-primary">Guardar</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        var obPeriodo = function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdPresupuesto = $("#<%=ddlIdPresup.ClientID%>").val(); 
            var tmp = null;
            $.ajax({
                type: 'POST',
                url: "../SerPres.asmx/LisPresPeriodo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                async: false,
                success: function (data) {
                    tmp = JSON.parse(data.d);
                }
            });
            return tmp;
        }();
        var obParam = function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdPresupuesto = $("#<%=ddlIdPresup.ClientID%>").val();
            obj.vnIdUnidadNeg = $("#<%=ddlIdUnidNeg.ClientID%>").val();
            obj.vnIdFormato = $("#<%=ddlIdForm.ClientID%>").val();
            var tmp = null;
            $.ajax({
                type: 'POST',
                url: "../SerPres.asmx/LisPresDefin",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                async: false,
                success: function (data) {
                    tmp = JSON.parse(data.d);
                }
            });
            return tmp;
        }();
        var obUnidNeg = function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdUnidadNeg = $("#<%=ddlIdUnidNeg.ClientID%>").val();
            obj.vnIdCultivo = $("#<%=hdfIdCult.ClientID%>").val();
            var tmp = null;
            $.ajax({
                type: 'POST',
                url: "../SerPres.asmx/ListUnidNegFundo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                async: false,
                success: function (data) {
                    tmp = JSON.parse(data.d);
                }
            });
            return tmp;
        }();

        $("#btnRegiCopy").click(function () {
            var lstObj = new Array();
            var obj = new Object();
            obj.vnIdTiRow = 1;
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdPresupuesto = $("#<%=ddlIdPresup.ClientID%>").val();
            obj.vnIdUnidadNeg = $("#<%=ddlIdUnidNeg.ClientID%>").val();
            obj.vnIdFormato = $("#<%=ddlIdForm.ClientID%>").val();
            obj.vnVersion = $("#<%=ddlVersion.ClientID%>").val();
            obj.vbTerminado = true;
            lstObj.push(obj);
            var items = $('#jqxUnidNeg').jqxTree('getCheckedItems');
            items.forEach(function (result, index) {
                var objDet = new Object();
                objDet.vnIdTiRow = 2;
                objDet.vnIdParametro = result.id;
                lstObj.push(objDet);
            });
            $.ajax({
                type: 'POST',
                url: "../SerPres.asmx/RegiPresupVersCopy",
                data: JSON.stringify({ obj: lstObj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                async: false,
                success: function (data) {
                    $("#modUnidNeg").modal('hide');
                    if (data.d != "0") {
                        toastr.success("Se genero : " + data.d + " Copias", 'Exito');
                    }
                },
                error: function (error) {
                        console.log(error);
                        alert(JSON.stringify(error))
                    }
            });
        });
        $(document).ready(function () {
            LoadList();
            removeTag("footer");
            if (fuGetEstado() == "D") {
                BloqckHeader(true);
                CreaTbl();
                LoadDat();
                fuTotal();
            }
            $(function () {
                $('.myctrl').on('input', function () {
                    this.value = this.value
                        .replace(/[^\d.]/g, '')             // numbers and decimals only
                        .replace(/(^[\d]{8})[\d]/g, '$1')   // not more than 2 digits at the beginning
                        .replace(/(\..*)\./g, '$1')         // decimal can't exist more than once
                        .replace(/(\.[\d]{4})./g, '$1');    // not more than 4 digits after decimal
                });
            });
            $(".myctrl").change(function () {
                var dtx = $(this).attr("data-x");
                var dty = $(this).attr("data-y");
                var dtz = $(this).attr("data-z");
                var dtn = $(this).attr("data-n");
                var dtc = $(this).attr("data-c");
                var $tr = $(this).closest('tr');
                var tot = 0;
                var Val = 0;
                $('input', $tr).each(function () {
                    var IdPeri = this.id.split("_")[0];
                    if (IdPeri == "0") {
                        Val = Number($(this).val()) || 0;
                    } else {
                        tot += Number($(this).val()) || 0;
                    }
                });
                $("#1_" + dty).text(parseFloat(tot).toFixed(2));
                $("#2_" + dty).text(parseFloat(tot * Val).toFixed(2));
                //
                if (dtx == "0") {
                    $('input', $tr).each(function () {
                        var dtx = $(this).attr("data-x");
                        if (dtx != "0") {
                            var dtz = $(this).attr("data-z");
                            var tot = 0;
                            $("input[data-x='" + dtx + "'][data-z='" + dtz + "']").each(function () {
                                var dty = $(this).attr("data-y");
                                var vnCant = Number($(this).val()) || 0;
                                var vnCost = Number($("#0_" + dty).val()) || 0;
                                tot += (vnCant * vnCost);
                            });
                            $("#" + dtx + "_" + dtz).text(parseFloat(tot).toFixed(2));
                        };
                    });
                } else {
                    var sum = 0;
                    $("input[data-x='" + dtx + "'][data-z='" + dtz + "']").each(function () {
                        var dty = $(this).attr("data-y");
                        var vnCant = Number($(this).val()) || 0;
                        var vnCost = Number($("#0_" + dty).val()) || 0;
                        sum += (vnCant * vnCost);
                    });
                    
                };
            });
        });
        //
        $('#modUnidNeg').on('show.bs.modal', function (event) {
            obUnidNeg = GetLisFundos();
            $('#jqxUnidNeg').jqxTree('destroy');
            $( "#dvdtl" ).prepend( "<div id='jqxUnidNeg'></div>" );
            LoadList();
        })
        function LoadList() {
            obUnidNeg = GetLisFundos();
            var source =
            {
                datatype: "json",
                datafields: [
                    { name: 'id' },
                    { name: 'parentid' },
                    { name: 'descrip' },
                    { name: 'bTipo' },
                ],
                id: 'id',
                localdata: obUnidNeg
            };
            var dataAdapter = new $.jqx.dataAdapter(source);
            dataAdapter.dataBind();
            var records = dataAdapter.getRecordsHierarchy('id', 'parentid', 'items', [{ name: 'descrip', map: 'label'}]);
            $('#jqxUnidNeg').jqxTree({ source: records, hasThreeStates: true, checkboxes: true,  });
            $("#jqxUnidNeg").jqxTree('selectItem', $("#home")[0]);
        }

        function fuGetNivTitle(val) {
            var Param = $.grep(obParam, function (element, index) {
                return element.nIdParamTitulo == val;
            });
            return Param;
        };
        function fuCalcTotal(IdParam, dtx) {
            var obj = fuGetNivTitle(IdParam);
            var Tot = 0;
            obj.forEach(function (result, index) {
                if (result.InDetalle == 0) {
                    var vaCant = Number($("#" + dtx + "_" + result.nIdParametro).val()) || 0;
                    var vaCost = Number($("#0_" + result.nIdParametro).val()) || 0;
                    Tot += (vaCant * vaCost);
                }
                else {
                    Tot = Tot + fuCalcTotal(result.nIdParametro, dtx);
                }
            });
            $("#" + dtx + "_" + IdParam).html(parseFloat(Tot).toFixed(2))
            return Tot;
        };
        function fuTotaxColm(dtx) {
            var ParamTitle = $.grep(obParam, function (element, index) {
                return element.nNivel  == "0";
            });
            ParamTitle.forEach(function (result, index) {
                var SumTot = fuCalcTotal(result.nIdParametro, dtx)
            });
            $("input[data-x='0']").each(function () {
                var IdCtrl = this.id;
                var $tr = $(this).closest('tr');
                var tot = 0;
                var Val = 0;
                $('input', $tr).each(function () {
                    var IdPeri = this.id.split("_")[0];
                    if (IdPeri == "0") {
                        Val = Number($(this).val()) || 0;
                    } else {
                        tot += Number($(this).val()) || 0;
                    }
                })
                $("#1_" + IdCtrl.split("_")[1]).text(parseFloat(tot).toFixed(2));
                $("#2_" + IdCtrl.split("_")[1]).text(parseFloat(tot * Val).toFixed(2));
            });
        };
        function fuTotal() {
            obPeriodo.forEach(function (result, index) {
                fuTotaxColm(result.cIdPeriodo);
            });
        };
        function load() {
            obParam = GetListPresDefin();
            obPeriodo = GetListPeriodo();
            CreaTbl();
            $(function () {
                $('.myctrl').on('input', function () {
                    this.value = this.value
                        .replace(/[^\d.]/g, '')             // numbers and decimals only
                        .replace(/(^[\d]{8})[\d]/g, '$1')   // not more than 2 digits at the beginning
                        .replace(/(\..*)\./g, '$1')         // decimal can't exist more than once
                        .replace(/(\.[\d]{4})./g, '$1');    // not more than 4 digits after decimal
                });
            });
        };
        function CreaTbl() {
            tbl = "<table class='tbl' id='mytbl'>" + "<thead><tr><th class='text-center' style='z-index:5;' >Descripción</th>" +
                "<th class='text-center'>UM</th>" +
                "<th class='text-center'>Costos</th>";
            obPeriodo.forEach(function (result, index) {
                tbl += "<th class='text-center'>" + result.Mask + "</th>";
            });
            tbl += "<th class='text-center'>Total</th><th class='text-center'>Costos</th>"
            tbl += "</tr></thead>"
            //var inTbody = false;
            obParam.forEach(function (item, index) {
                var y = index;
                if (item.nNivel == 0) {
                    tbl += "<tbody id='" + item.nIdParametro + "' >";
                }
                else {
                    //inTbody = false;
                }
                tbl += "<tr>"
                if (item.InDetalle == 1) {
                    tbl += "<th colspan='2'><div class='pl-" + item.nNivel + "'><i class='fa fa-caret-right'></i> "
                        + item.cDescParametro + "</div></th>";
                    tbl += "<td class='text-center SubTot'>Sub Total</td>";
                    obPeriodo.forEach(function (result, index) {
                        tbl += "<td class='text-right SubTot'><div id='" + result.cIdPeriodo + "_" + item.nIdParametro
                            + "' data-x='" + result.cIdPeriodo + "' data-y='" + item.nIdParametro
                            + "' data-z='" + item.nIdParamTitulo + "' data-n='" + item.nNivel + "' data-c='" + item.cNivOrd
                            + "'>0.00</div></td>";
                    });
                    tbl += "<th></th><th></th>"
                } else {
                    tbl += "<th><div class='pl-" + item.nNivel + "'> <i class='fa fa-angle-right' ></i> "
                        + item.cDescParametro + "</div></th>";
                    tbl += "<th>" + item.cNombCort + "</th>";
                    tbl += "<td><input type='text' id='0_" + item.nIdParametro
                        + "' data-x='0' data-y='" + item.nIdParametro
                        + "' data-z='" + item.nIdParamTitulo + "' data-n='" + item.nNivel + "' data-c='" + item.cNivOrd
                        + "' class='form-control form-control-sm myctrl' /></td>";
                    obPeriodo.forEach(function (result, index) {
                        var vvDis = 
                        console.log(vvDis)
                        tbl += "<td><input type='text' id='" + result.cIdPeriodo + "_" + item.nIdParametro
                            + "' data-x='" + result.cIdPeriodo + "' data-y='" + item.nIdParametro
                            + "' data-z='" + item.nIdParamTitulo + "' data-n='" + item.nNivel + "' data-c='" + item.cNivOrd
                            + "' class='form-control form-control-sm myctrl disabled' patter "
                            + ((result.bCerrado) ? "disabled" : "") + " /></td>";
                    });
                    tbl += "<th class='text-right'><div id='1_" + item.nIdParametro + "'>0.00</div></th>"
                    tbl += "<th class='text-right'><div id='2_" + item.nIdParametro + "'>0.00</div></th>"
                }
            });
            tbl += "</table>";
            $("#dvGrd").html(tbl);
        };
        $("#dvGrd").keydown(function (e) {
            //alert(e.keyCode)
            var $focused = $(':focus');
            //alert($focused.attr("id"));
            if (e.keyCode == 40) {
                var inputs = $(this).closest('#dvGrd').find(':input');
                inputs.eq(inputs.index($focused) + (obPeriodo.length + 1)).focus();
                var $focus = $(':focus');
                $focus.select();
                e.preventDefault();
            }
            if (e.keyCode == 39) {
                var inputs = $(this).closest('#dvGrd').find(':input');
                inputs.eq(inputs.index($focused) + 1).focus();
                var $focus = $(':focus');
                $focus.select();
            }
            if (e.keyCode == 38) {
                var inputs = $(this).closest('#dvGrd').find(':input');
                inputs.eq(inputs.index($focused) - (obPeriodo.length + 1)).focus();
                var $focus = $(':focus');
                $focus.select();
                e.preventDefault();
            }
            if (e.keyCode == 37) {
                var inputs = $(this).closest('#dvGrd').find(':input');
                inputs.eq(inputs.index($focused) - 1).focus();
                var $focus = $(':focus');
                $focus.select();
            }
        });
        $("#<%=chkFinal.ClientID%>").change(function () {
            if (confirm("se guardara esta version como la final. \n \n ¿Esta seguro de Cambiar su Version Final?")) {
                var obj = new Object();
                obj.vcIdEmpresa = fuGetCdEmpre();
                obj.vnIdPresupuesto = $("#<%=ddlIdPresup.ClientID%>").val();
                obj.vnIdUnidadNeg = $("#<%=ddlIdUnidNeg.ClientID%>").val();
                obj.vnIdFormato = $("#<%=ddlIdForm.ClientID%>").val();
                obj.vnVersion = $("#<%=ddlVersion.ClientID%>").val();
                $.ajax({
                    type: 'POST',
                    url: "../SerPres.asmx/RegiPresupVers",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    success: function (data) {
                        if (data.d = "ok") {
                            $("#<%=hdfIdVers.ClientID%>").val($("#<%=ddlVersion.ClientID%>").val())
                            $("#<%=chkFinal.ClientID%>").prop('disabled', true);
                        }
                    }
                });
            } else {
                $(this).prop('checked', false);
                return;
            };
        });
        $("#<%=ddlVersion.ClientID%>").change(function () {
            LoadDat();
            fuTotal();
            if (fuGetIdVers() == $("#<%=ddlVersion.ClientID%>").val()) {
                $("#<%=chkFinal.ClientID%>").prop('checked', true);
                $("#<%=chkFinal.ClientID%>").prop('disabled', true);
            } else {
                $("#<%=chkFinal.ClientID%>").prop('checked', false);
                $("#<%=chkFinal.ClientID%>").prop('disabled', false);
            }
            if ($("#<%=ddlVersion.ClientID%>").val() == "0") {
                $("#<%=chkFinal.ClientID%>").prop('disabled', true);
            }
        });

        function LoadDat() {
            var IdVer = $("#<%=ddlVersion.ClientID%>").val();
            $('#mytbl tr').each(function () {
                $(this).find('input').val("");
            });
            if (IdVer != "0") {
                var obj = new Object();
                obj.vcIdEmpresa = fuGetCdEmpre();
                obj.vnIdPresupuesto = $("#<%=ddlIdPresup.ClientID%>").val();
                obj.vnIdUnidadNeg = $("#<%=ddlIdUnidNeg.ClientID%>").val();
                obj.vnIdFormato = $("#<%=ddlIdForm.ClientID%>").val();
                obj.vnVersion = IdVer;
                $.ajax({
                    type: 'POST',
                    url: "../SerPres.asmx/ListPresupVersDeta",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        lst.forEach(function (itm, index) {
                            $("#" + itm.cIdPeriodo + "_" + itm.nIdParametro).val(itm.nImporte);
                        });
                    }
                });
            }
        };
        function BloqckHeader(bool) {
            $("#<%=ddlCdFundo.ClientID%>").attr('disabled', bool);
            $("#<%=ddlIdUnidNeg.ClientID%>").attr('disabled', bool);
            $("#<%=ddlIdPresup.ClientID%>").attr('disabled', bool);
            $("#<%=ddlIdForm.ClientID%>").attr('disabled', bool);
            $("#<%=rdbHect.ClientID%>").attr('disabled', bool);
            $("#<%=rdbLote.ClientID%>").attr('disabled', bool);
            $("#<%=btnSave.ClientID%>").attr('disabled', bool);
        }
        function GetListPresDefin() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdPresupuesto = $("#<%=ddlIdPresup.ClientID%>").val();
            obj.vnIdUnidadNeg = $("#<%=ddlIdUnidNeg.ClientID%>").val();
            obj.vnIdFormato = $("#<%=ddlIdForm.ClientID%>").val();
            var tmp = null;
            $.ajax({
                type: 'POST',
                url: "../SerPres.asmx/LisPresDefin",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                async: false,
                success: function (data) {
                    tmp = JSON.parse(data.d);
                }
            });
            return tmp;
        }
        function GetListPeriodo() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdPresupuesto = $("#<%=ddlIdPresup.ClientID%>").val(); 
            var tmp = null;
            $.ajax({
                type: 'POST',
                url: "../SerPres.asmx/LisPresPeriodo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                async: false,
                success: function (data) {
                    tmp = JSON.parse(data.d);
                }
            });
            return tmp;
        }
        function GetLisFundos() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdUnidadNeg = $("#<%=ddlIdUnidNeg.ClientID%>").val();
            obj.vnIdCultivo = $("#<%=hdfIdCult.ClientID%>").val();
            var tmp = null;
            $.ajax({
                type: 'POST',
                url: "../SerPres.asmx/ListUnidNegFundo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                async: false,
                success: function (data) {
                    tmp = JSON.parse(data.d);
                }
            });
            return tmp;
        };
        $("#btnGuardar").click(function () {
            var lstObj = new Array();
            var obj = new Object();
            obj.vnIdTiRow = 1;
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdPresupuesto = $("#<%=ddlIdPresup.ClientID%>").val();
            obj.vnIdUnidadNeg = $("#<%=ddlIdUnidNeg.ClientID%>").val();
            obj.vnIdFormato = $("#<%=ddlIdForm.ClientID%>").val();
            obj.vnVersion = $("#<%=ddlVersion.ClientID%>").val();
            lstObj.push(obj);
            var sv = "";
            $('#mytbl tr').find('input').each(function () {
                //x Periodo : Y Parametro
                var IdPeri = this.id.split("_")[0];
                var IdPara = this.id.split("_")[1];
                var IdCtrl = this.id;
                if (IdPeri == "0") {
                    var objPar = new Object();
                    objPar.vnIdTiRow = 2;
                    objPar.vnIdParametro = IdPara;
                    objPar.vnImporte = Number($(this).val()) || 0;
                    lstObj.push(objPar);
                } else {
                    var objDet = new Object();
                    objDet.vnIdTiRow = 3;
                    objDet.vnIdParametro = IdPara;
                    objDet.vcIdPeriodo = IdPeri
                    objDet.vnImporte = Number($(this).val()) || 0;
                    lstObj.push(objDet);
                }
                sv += ($(this).val().length > 0) ? "0" : ""

            });
            if (sv.length > 0) {
                $.ajax({
                    type: 'POST',
                    url: "../SerPres.asmx/RegiPresupVersDeta",
                    data: JSON.stringify({ List: lstObj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    success: function (data) {
                        fuAddDdlItem(data.d, data.d);
                        if (data.d == "1") {
                            toastr.success("Version : " + data.d + " Guardada ", 'Exito');
                            $("#<%=hdfIdVers.ClientID%>").val($("#<%=ddlVersion.ClientID%>").val())
                            $("#<%=chkFinal.ClientID%>").prop('disabled', true);
                        }
                    }
             
                });
            } else {
                toastr.error("Ingrese Datos", 'Error');
            }
        });

        function fuGetIdVers() {
            return $("#<%=hdfIdVers.ClientID%>").val();
        }
        function fuGetEstado() {
            return $("#<%=hdfEstado.ClientID%>").val();
        }
        function fuSetEstado(val) {
            $("#<%=hdfEstado.ClientID%>").val(val);
        }
        function fuAddDdlItem(dat, text) {
            var exists = false;
            $("#<%=ddlVersion.ClientID %>").each(function () {
                if (this.value == dat) {
                    exists = true;
                    return false;
                }
            });
            if (exists == false) {
                var mySelect = $("#<%=ddlVersion.ClientID %>");
                mySelect.append(
                    $('<option></option>').val(dat).html(text)
                );
            }
            $("#<%=ddlVersion.ClientID %>").val(dat)
        }
        
    </script>
    <asp:HiddenField ID="hdfIdVers" runat="server" Value="0" />
    <asp:HiddenField ID="hdfEstado" runat="server" Value="N" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
    
</asp:Content>
