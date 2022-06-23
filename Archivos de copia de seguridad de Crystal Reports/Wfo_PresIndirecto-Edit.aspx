<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_PresIndirecto-Edit.aspx.cs" Inherits="SFC_WEB_APP.Mod_Pres.Wfo_PresIndirecto_Edit" %>

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
        .scrl {
            overflow: auto !important;
            height: 60vh;
        }

        .btnPers {
            padding: 0.175rem 0.25rem !important;
            font-size: 1rem;
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
    </style>
    <script>
        function jScript() {
            $("#btnAdd").click(function () {
                ParamRow();
            })
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
    <li class="nav-item">
        <button type="button" id="btnGuardar" class="btn btn-primary col-12">
            <span class="fa fa-save"></span> Guardar
        </button>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="form-inline">
        <div class="row frm col-12 col-sm-4">
            <div class="col-3">Presupuesto</div>
            <div class="col-9">:<asp:DropDownList ID="ddlIdPresup" runat="server" CssClass="custom-select myform-control"></asp:DropDownList></div>
        </div>
        <div class="row frm col-12 col-sm-4">
            <div class="col-2">Formato</div>
            <div class="col-9">:<asp:DropDownList ID="ddlIdForm" runat="server" CssClass="form-control myform-control" AutoPostBack="true" OnSelectedIndexChanged="ddlIdForm_SelectedIndexChanged"></asp:DropDownList></div>
        </div>
        <div class="row frm col-6 col-sm-2">
            <button type="button" id="btnSave" class="btn btn-secondary btnPers col-12">
                <i class="fa fa-location-arrow"></i> Iniciar
            </button>
        </div>
    </div>
    <br />
    <fieldset>
        <legend>Detalle</legend>
    </fieldset>
    <div id="dvDeta">
        <asp:UpdatePanel runat="server" ID="UpdMast">
            <ContentTemplate>
                <script>
                    Sys.Application.add_load(jScript);
                </script>
                <div class="row col-11">
                    <div class="form-group col-12 col-sm-6 col-md-6 col-lg-3">
                        <label class="control-label" for="ddlDest">Destino</label>
                        <asp:DropDownList ID="ddlDest" runat="server" CssClass="form-control myform-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDest_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="form-group col-12 col-sm-6 col-md-6 col-lg-2">
                        <label class="control-label" for="ddlItem">Item</label>
                        <asp:DropDownList ID="ddlItem" runat="server" CssClass="form-control myform-control"></asp:DropDownList>
                    </div>
                    <div class="form-group col-12 col-sm-6 col-md-6 col-lg-2">
                        <label class="control-label" for="ddlFundo">Fundo</label>
                        <asp:DropDownList ID="ddlFundo" runat="server" CssClass="form-control myform-control" AutoPostBack="true" OnSelectedIndexChanged="ddlFundo_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="form-group col-12 col-sm-6 col-md-6 col-lg-2">
                        <label class="control-label" for="ddlCult">Cultivo</label>
                        <asp:DropDownList ID="ddlCult" runat="server" CssClass="form-control myform-control"></asp:DropDownList>
                    </div>
                    <div class="form-group col-12 col-sm-6 col-md-6 col-lg-2">
                        <label class="control-label" for="ddlDriver">Driver</label>
                        <asp:DropDownList ID="ddlDriver" runat="server" CssClass="form-control myform-control"></asp:DropDownList>
                    </div>
                    <div class="form-group col-6 col-sm-6 col-md-5 col-lg-1">
                        <label for="btnBusc">&nbsp;</label>
                        <button type="button" id="btnAdd" class="btn btn-secondary btnPers col-12">
                            <i class="fa fa-search"></i> Add &nbsp;
                        </button>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlIdForm" />
            </Triggers>
        </asp:UpdatePanel>
        <div id="dvGrd" class="scrl"></div>
    </div>
    <script>
        $(document).ready(function () {
            removeTag("footer");
            var IdForm = $("#<%=ddlIdForm.ClientID%>").val() * 1;
            if (IdForm > 0) {
                CreaTbl();
                LoadDat();
            }
        });
        function LoadDat() {
            var obParam = function () {
                var obj = new Object();
                obj.vcIdEmpresa = fuGetCdEmpre();
                obj.vnIdPresupuesto = $("#<%=ddlIdPresup.ClientID%>").val();
                obj.vnIdFormato = $("#<%=ddlIdForm.ClientID%>").val();
                var tmp = null;
                $.ajax({
                    type: 'POST',
                    url: "../SerPres.asmx/ListParamIndiDeta",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    success: function (data) {
                        tmp = JSON.parse(data.d);
                    },
                    error: function (error) {
                        console.log(error);
                        alert(JSON.stringify(error))
                    }

                });
                return tmp;
            }();
            obParam.forEach(function (result, index) {
                if ($("#" + result.nIdParametro + "_" + result.nIdFundo
                    + "_" + result.nIdCultivo + "_" + result.cDriver).length) {

                } else {
                    fuAddRow(
                        result.nIdParamTitulo,
                        result.nIdParametro,
                        result.cDescParametro,
                        result.nIdFundo,
                        result.cDescFundo,
                        result.nIdCultivo,
                        result.cDesCultivo,
                        result.cDriver)
                }
            });
            obParam.forEach(function (result, index) {
                $("#" + result.cIdPeriodo + "_" + result.nIdParametro).val(result.nImporte);
            });
        };
        $("#btnGuardar").click(function () {
            Save(false);
        });
        function Save(itm) {
            var lstObj = new Array();
            var obj = new Object();
            obj.vnIdTiRow = 1;
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdPresupuesto = $("#<%=ddlIdPresup.ClientID%>").val();
            obj.vnIdFormato = $("#<%=ddlIdForm.ClientID%>").val();
            obj.vbTerminado = itm;
            lstObj.push(obj);
            var sv = "";
            $('#mytbl tr').find('input').each(function () {
                //x Periodo : Y Parametro
                var objPar = new Object();
                objPar.vnIdTiRow = 2;
                objPar.vnIdFundo = $(this).attr("data-fu");
                objPar.vnIdCultivo = $(this).attr("data-cu");
                objPar.vnIdParametro = $(this).attr("data-y");
                objPar.vcIdPeriodo = $(this).attr("data-x");
                objPar.vcDriver = $(this).attr("data-dr");
                objPar.vnImporte = Number($(this).val()) || 0;
                objPar.vnIdParamTitulo = $(this).attr("data-z");;
                lstObj.push(objPar);
                sv += ($(this).val().length > 0) ? "0" : ""
            });
            if (sv.length > 0) {
                $.ajax({
                    type: 'POST',
                    url: "../SerPres.asmx/RegiPresuIndiDeta",
                    data: JSON.stringify({ List: lstObj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    success: function (data) {
                        if (data.d == "1") {
                            toastr.success("Version : " + data.d + " Guardada ");
                            //$.toaster({
                            //    title: 'Exito',
                            //    message: "Version : " + data.d + " Guardada ",
                            //    priority: 'success'
                            //});
                        }
                    },
                    error: function (error) {
                        console.log(error);
                        alert(JSON.stringify(error))
                    }
                });
            } else {
                toastr.error ("Error", "Ingrese Datos");
                //$.toaster({
                //    title: 'Error',
                //    message: "Ingrese Datos",
                //    priority: 'danger'
                //});
            }
        };
        function ParamRow() {
            var vnIdDest = $("#<%=ddlDest.ClientID%>").val();
            var vnIdItem = $("#<%=ddlItem.ClientID%>").val();
            var vnIdFund = $("#<%=ddlFundo.ClientID%>").val();
            var vnIdCult = $("#<%=ddlCult.ClientID%>").val();
            var vcCdDriv = $("#<%=ddlDriver.ClientID%>").val();
            var vvDeItem = $("#<%=ddlItem.ClientID%> option:selected").text()
            var vvDeFund = $("#<%=ddlFundo.ClientID%> option:selected").text()
            var vvDeCult = $("#<%=ddlCult.ClientID%> option:selected").text()
            var vvDeDriv = $("#<%=ddlDriver.ClientID%> option:selected").text()
            if ($("#" + vnIdItem + "_" + vnIdFund + "_" + vnIdCult + "_" + vvDeDriv).length) {
                toastr.error ("Error", "Ya existe una fila en el documento");


                //$.toaster({
                //    title: 'Error',
                //    message: "Ya existe una fila en el documento",
                //    priority: 'danger'
                //});
            } else {
                fuAddRow(vnIdDest, vnIdItem, vvDeItem, vnIdFund, vvDeFund, vnIdCult, vvDeCult, vcCdDriv, vvDeDriv);
            }
        }

        function fuAddRow(vnIdDest, vnIdItem, vvDeItem, vnIdFund, vvDeFund, vnIdCult, vvDeCult, vvDeDriv) {
            var vRow = "";
            vRow += "<tr id='" + vnIdItem + "_" + vnIdFund + "_" + vnIdCult + "_" + vvDeDriv + "'>"
            vRow += "<th><div class='pl-2'><i class='fa fa-angle-right'></i> " + vvDeItem + "</div></th>";
            vRow += "<td nowrap>" + vvDeFund + "</td>";
            vRow += "<td nowrap>" + vvDeCult + "</td>";
            vRow += "<td nowrap>" + vvDeDriv + "</td>";
            vRow += "<td> <button type='button' class='mybtn btn btn-link del'  title='Editar' ><span class='fa fa-trash-alt'></span></button></td>";
            obPeriodo.forEach(function (result, index) {
                vRow += "<td><input type='text' id='" + result.cIdPeriodo + "_" + vnIdItem
                    + "' data-x='" + result.cIdPeriodo + "' data-y='" + vnIdItem
                    + "' data-z='" + vnIdDest + "' data-n='2"
                    + "' data-it='" + vnIdItem + "' data-fu='" + vnIdFund
                    + "' data-cu='" + vnIdCult + "' data-dr='" + vvDeDriv
                    + "' class='form-control form-control-sm myctrl' patter /></td>";
            });
            vRow += "<th class='text-right'><div id='1_" + vnIdItem + "'>0.00</div></th>"
            vRow += "</tr>";
            $("#" + vnIdDest).append(vRow);
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
        $("#btnSave").click(function () {
            CreaTbl();
        });
        function CreaTbl() {
            obPeriodo = GetListPeriodo();
            obParam = GetListParam();
            var tbl = "";
            tbl = "<table class='tbl' id='mytbl'>" + "<thead><tr><th class='text-center' style='z-index:5;' >Descripción</th>" +
                "<th class='text-center' style='min-width:80px !important;'>Fundo</th>" +
                "<th class='text-center'>Cultivo</th>" +
                "<th class='text-center'>Driver</th>" +
                "<th class='text-center'></th>";
            obPeriodo.forEach(function (result, index) {
                tbl += "<th class='text-center'>" + result.Mask + "</th>";
            });
            tbl += "<th class='text-center'>Total</th>";
            tbl += "</tr></thead>";
            obParam.forEach(function (item, index) {
                tbl += "<tbody id='" + item.nIdParametro + "' >";
                tbl += "<th colspan='5'><div'><i class='fa fa-caret-right'></i> "
                    + item.cDescParametro + "</div></th>";
                obPeriodo.forEach(function (result, index) {
                    tbl += "<td class='text-right SubTot'><div id='" + result.cIdPeriodo + "_" + item.nIdParametro
                        + "' data-x='" + result.cIdPeriodo + "' data-y='" + item.nIdParametro
                        + "' data-z='" + item.nIdParamTitulo + "' data-n='" + item.nNivel + "' data-c='" + item.cNivOrd
                        + "'>0.00</div></td>";
                });
                tbl += "<th class='text-right'><div id='1_" + item.nIdParametro + "'>0.00</div></th>"
            });
            $("#dvGrd").html(tbl)
        }
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
            obj.vnIdFormato = $("#<%=ddlIdForm.ClientID%>").val();
            obj.vnNivel = 2;
            obj.vnIdParamTitulo = 0;
            var tmp = null;
            $.ajax({
                type: 'POST',
                url: "../SerPres.asmx/ListParamIndi",
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
        function GetListParam() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdFormato = $("#<%=ddlIdForm.ClientID%>").val();
            obj.vnNivel = 2;
            obj.vnIdParamTitulo = 0;
            var tmp = null;
            $.ajax({
                type: 'POST',
                url: "../SerPres.asmx/ListParamIndi",
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
        };
        
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
    
</asp:Content>
