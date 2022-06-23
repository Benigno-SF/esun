<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Beta2.aspx.cs" Inherits="SFC_WEB_APP.Beta2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <style type="text/css">
        .bgtbl {
        }

        .table {
        }

        .table-sm th,
        .table-sm td {
            padding-top: 0.3rem !important;
            padding-bottom: 0.3rem !important;
            padding-left: 0.1rem !important;
            padding-right: 0.1rem !important;
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
    </style>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="../Scripts/excel-bootstrap-table-filter-bundle.js"></script>
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
    <script type="text/javascript">
        $(function () {
            // Apply the plugin 
            $("#Body_GvList").excelTableFilter();
        });
    </script>

    <div class="row">
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button id="Body_btnBusc" type="button" class="btn btn-secondary col-12">
                <i class="fa fa-search"></i>Buscar
            </button>
        </div>
        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnGuardar">&nbsp;</label>
            <button onclick="__doPostBack('ctl00$Body$btnGuardar','')" id="Body_btnGuardar" type="button" class="btn btn-secondary col-12">
                <i class="fa fa-save"></i>Guardar
            </button>
        </div>
    </div>
    <div id="Body_UpdGv">

        <div id="dvGv" class="row center-block">
            <div class="table table-responsive-sm">
                <div>
                    <table class="bgtbl" cellspacing="0" rules="all" border="1" id="Body_GvList" style="border-collapse: collapse;">
                        <thead>
                            <tr>
                                <th scope="col">1</th>
                                <th scope="col">Centro</th>
                                <th class="filter" scope="col">Serie</th>
                                <th scope="col">Fecha</th>
                                <th scope="col">Referencia</th>
                                <th scope="col">Almacen</th>
                                <th scope="col">F. Entrega</th>
                                <th scope="col">Usuario</th>
                                <th scope="col">Observaci&#243;n</th>
                                <th scope="col">U. Aprob</th>
                                <th scope="col">&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_117" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_117');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-113</td>
                                <td>04/11/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>04/11/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_117" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_117');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_117" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_117');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl02$hdfValue" id="Body_GvList_hdfValue_0" value="0" />

                                    <div id="div_117" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_0" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>256100500008</td>
                                                    <td>TIRAS REACTIVAS PARA GLUCOMETRO</td>
                                                    <td>4.000</td>
                                                    <td>CAJA</td>
                                                </tr>
                                                <tr>
                                                    <td>256100500009</td>
                                                    <td>AGUJA N&#176; 21 </td>
                                                    <td>1.000</td>
                                                    <td>CAJA</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_224" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_224');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-220</td>
                                <td>01/10/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>01/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_224" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_224');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_224" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_224');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl03$hdfValue" id="Body_GvList_hdfValue_1" value="0" />

                                    <div id="div_224" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_1" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255600400130</td>
                                                    <td>JUEGO DE RETENES PARA TK-20L</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_230" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_230');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-226</td>
                                <td>01/10/2019</td>
                                <td>CAMBIO DE TRASPALETA </td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>01/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_230" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_230');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_230" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_230');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl04$hdfValue" id="Body_GvList_hdfValue_2" value="0" />

                                    <div id="div_230" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_2" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255600400021</td>
                                                    <td>BOCINA DE BRONCE PARA BALANCINES</td>
                                                    <td>8.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255600400130</td>
                                                    <td>JUEGO DE RETENES PARA TK-20L</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_236" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_236');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-232</td>
                                <td>01/10/2019</td>
                                <td>AREA DE TOPICO</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>01/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_236" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_236');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_236" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_236');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl05$hdfValue" id="Body_GvList_hdfValue_3" value="0" />

                                    <div id="div_236" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_3" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>256100300019</td>
                                                    <td>PAPEL BOND T/A-4 75GR</td>
                                                    <td>1.500</td>
                                                    <td>MILL</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_323" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_323');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-319</td>
                                <td>03/10/2019</td>
                                <td>ASEGURAMIENTO DE LA CALIDAD</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>03/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_323" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_323');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_323" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_323');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl06$hdfValue" id="Body_GvList_hdfValue_4" value="0" />

                                    <div id="div_323" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_4" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>256100400007</td>
                                                    <td>CAJA TECNOPOR</td>
                                                    <td>2.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_332" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_332');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-328</td>
                                <td>03/10/2019</td>
                                <td>CAMBIO DE BATERIAS BALANZA</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>03/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_332" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_332');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_332" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_332');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl07$hdfValue" id="Body_GvList_hdfValue_5" value="0" />

                                    <div id="div_332" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_5" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255600400012</td>
                                                    <td>BATERIA RECARGABLE RANGO 6VDC/4.5AH</td>
                                                    <td>50.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_359" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_359');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-355</td>
                                <td>04/10/2019</td>
                                <td>CAMBIO EN COLECTORES EN MOD 1</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>04/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_359" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_359');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_359" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_359');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl08$hdfValue" id="Body_GvList_hdfValue_6" value="0" />

                                    <div id="div_359" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_6" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255600400060</td>
                                                    <td>CHUMACERA DE PARED MUCFL 206 CON EJE DE 30MM WHX</td>
                                                    <td>2.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_360" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_360');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-356</td>
                                <td>04/10/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>04/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_360" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_360');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_360" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_360');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl09$hdfValue" id="Body_GvList_hdfValue_7" value="0" />

                                    <div id="div_360" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_7" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255600400012</td>
                                                    <td>BATERIA RECARGABLE RANGO 6VDC/4.5AH</td>
                                                    <td>50.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_363" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_363');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-359</td>
                                <td>04/10/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>04/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_363" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_363');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_363" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_363');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl10$hdfValue" id="Body_GvList_hdfValue_8" value="0" />

                                    <div id="div_363" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_8" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255100600023</td>
                                                    <td>CINTILLO 300 MM X 100 UNID</td>
                                                    <td>1.000</td>
                                                    <td>PAQ </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_368" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_368');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-364</td>
                                <td>04/10/2019</td>
                                <td>CAMBIO EN TABLERO RETORNO DE JABAS</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>04/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_368" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_368');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_368" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_368');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl11$hdfValue" id="Body_GvList_hdfValue_9" value="0" />

                                    <div id="div_368" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_9" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255600300131</td>
                                                    <td>PULSADOR DE PARADA DE EMERGENCIA</td>
                                                    <td>2.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_393" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_393');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-389</td>
                                <td>05/11/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>05/11/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_393" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_393');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_393" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_393');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl12$hdfValue" id="Body_GvList_hdfValue_10" value="0" />

                                    <div id="div_393" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_10" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>256100300002</td>
                                                    <td>ARCHIVADOR TAMA&#209;O OFICIO</td>
                                                    <td>24.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>256100300034</td>
                                                    <td>RESALTADOR</td>
                                                    <td>3.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_948" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_948');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-941</td>
                                <td>24/10/2019</td>
                                <td>CONSUMO CAMIONETA PABLO LEZAETA BAB-833</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>24/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_948" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_948');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_948" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_948');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl13$hdfValue" id="Body_GvList_hdfValue_11" value="0" />

                                    <div id="div_948" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_11" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255200300003</td>
                                                    <td>GASOLINA 95&#176;</td>
                                                    <td>32.200</td>
                                                    <td>GLN</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_950" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_950');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-943</td>
                                <td>16/10/2019</td>
                                <td>CONSUMO CAMIONETA PABLO LEZAETA BAB-833</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>16/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_950" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_950');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_950" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_950');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl14$hdfValue" id="Body_GvList_hdfValue_12" value="0" />

                                    <div id="div_950" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_12" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255200300003</td>
                                                    <td>GASOLINA 95&#176;</td>
                                                    <td>31.064</td>
                                                    <td>GLN</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1243" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1243');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1230</td>
                                <td>11/11/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>11/11/2019</td>
                                <td>&nbsp;</td>
                                <td>Para analisis de vibracion a realizar a los compresores a plena carga en funcinamiento</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1243" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1243');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1243" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1243');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl15$hdfValue" id="Body_GvList_hdfValue_13" value="0" />

                                    <div id="div_1243" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_13" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>635500600008</td>
                                                    <td>MANTENIMIENTO Y ANALISIS DE COMPRESOR</td>
                                                    <td>4.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1259" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1259');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1245</td>
                                <td>11/11/2019</td>
                                <td>SUMIN.CHIMENEA CAMARA GASIFICADO1,2 Y 3</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>11/11/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1259" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1259');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1259" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1259');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl16$hdfValue" id="Body_GvList_hdfValue_14" value="0" />

                                    <div id="div_1259" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_14" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>635500600013</td>
                                                    <td>SERVICIO DE SUMINISTRO E INSTALACION DE EQUIPOS</td>
                                                    <td>3.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1329" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1329');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1312</td>
                                <td>12/11/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>12/11/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1329" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1329');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1329" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1329');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl17$hdfValue" id="Body_GvList_hdfValue_15" value="0" />

                                    <div id="div_1329" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_15" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255800200071</td>
                                                    <td>ESCALERA DE ALUMINIO</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1377" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1377');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1360</td>
                                <td>05/10/2019</td>
                                <td>CAMBIO DE MOTOR DE TRACCION</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>05/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1377" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1377');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1377" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1377');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl18$hdfValue" id="Body_GvList_hdfValue_16" value="0" />

                                    <div id="div_1377" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_16" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255600400129</td>
                                                    <td>JUEGO DE CARBONES PARA MOTOR DE TRACCION</td>
                                                    <td>4.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1379" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1379');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1362</td>
                                <td>05/10/2019</td>
                                <td>SOLDADURA PARA RIEL AEREO</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>05/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1379" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1379');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1379" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1379');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl19$hdfValue" id="Body_GvList_hdfValue_17" value="0" />

                                    <div id="div_1379" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_17" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255100800001</td>
                                                    <td>SOLDADURA 1/8&quot; 6011 - CELLOCORD&#160;</td>
                                                    <td>1.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1382" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1382');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1365</td>
                                <td>05/10/2019</td>
                                <td>RIEL AEREO MODULO 1</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>05/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1382" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1382');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1382" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1382');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl20$hdfValue" id="Body_GvList_hdfValue_18" value="0" />

                                    <div id="div_1382" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_18" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255100100030</td>
                                                    <td>DISCO DE DESBASTE 4 1/2&quot; PARA METAL</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1383" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1383');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1366</td>
                                <td>07/10/2019</td>
                                <td>COLOCACION BANDEJAS EVAPORADORES </td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>07/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1383" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1383');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1383" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1383');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl21$hdfValue" id="Body_GvList_hdfValue_19" value="0" />

                                    <div id="div_1383" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_19" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255100600088</td>
                                                    <td>REMACHES TIPO POP 3/16 X 1&quot;</td>
                                                    <td>200.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255100500008</td>
                                                    <td>ANGULO DE 1 1/2 PERFIL PREPINTADO CARA INTERNA</td>
                                                    <td>2.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1385" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1385');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1368</td>
                                <td>07/10/2019</td>
                                <td>CAMBIO RODAJE MOTOR TUNEL PREFRIO</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>07/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1385" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1385');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1385" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1385');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl22$hdfValue" id="Body_GvList_hdfValue_20" value="0" />

                                    <div id="div_1385" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_20" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255600400393</td>
                                                    <td>RODAJE 6307/C3</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1387" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1387');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1370</td>
                                <td>07/10/2019</td>
                                <td>PINTADO MODULO 1</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>07/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1387" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1387');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1387" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1387');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl23$hdfValue" id="Body_GvList_hdfValue_21" value="0" />

                                    <div id="div_1387" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_21" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255100700001</td>
                                                    <td>AGUARRAS MINERAL</td>
                                                    <td>1.000</td>
                                                    <td>GLN</td>
                                                </tr>
                                                <tr>
                                                    <td>255700200030</td>
                                                    <td>TRAPO INDUSTRIAL</td>
                                                    <td>1.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1389" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1389');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1372</td>
                                <td>07/10/2019</td>
                                <td>CAMARA DE GASIFICADO</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>07/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1389" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1389');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1389" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1389');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl24$hdfValue" id="Body_GvList_hdfValue_22" value="0" />

                                    <div id="div_1389" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_22" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255100700088</td>
                                                    <td>PEGA + SELLA (K+D) BLANCO CARTUCHO</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1391" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1391');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1374</td>
                                <td>07/10/2019</td>
                                <td>PINTADO SOCALO DE TUNELES</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>10/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1391" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1391');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1391" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1391');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl25$hdfValue" id="Body_GvList_hdfValue_23" value="0" />

                                    <div id="div_1391" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_23" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255100700038</td>
                                                    <td>PINTURA ESMALTE C/GRIS CLARO</td>
                                                    <td>1.000</td>
                                                    <td>GLN</td>
                                                </tr>
                                                <tr>
                                                    <td>255800200009</td>
                                                    <td>BROCHA DE 3&quot;</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1393" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1393');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1376</td>
                                <td>07/10/2019</td>
                                <td>FORRADO DE MOTOR</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>07/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1393" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1393');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1393" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1393');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl26$hdfValue" id="Body_GvList_hdfValue_24" value="0" />

                                    <div id="div_1393" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_24" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>265000800019</td>
                                                    <td>STRECH FILM                                                                                         </td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1396" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1396');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1379</td>
                                <td>07/10/2019</td>
                                <td>ABASTECIMIENTO LINEA 7</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>07/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1396" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1396');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1396" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1396');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl27$hdfValue" id="Body_GvList_hdfValue_25" value="0" />

                                    <div id="div_1396" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_25" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255600300151</td>
                                                    <td>SENSOR DE PROXIMIDAD FOTEK A3R-2MX</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1397" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1397');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1380</td>
                                <td>07/10/2019</td>
                                <td>RECURSOS HUMANOS</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>07/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1397" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1397');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1397" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1397');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl28$hdfValue" id="Body_GvList_hdfValue_26" value="0" />

                                    <div id="div_1397" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_26" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>256100300019</td>
                                                    <td>PAPEL BOND T/A-4 75GR</td>
                                                    <td>5.000</td>
                                                    <td>MILL</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1399" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1399');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1382</td>
                                <td>07/10/2019</td>
                                <td>PINTADO SOCALOS ZONA DE DESPACHO</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>07/10/2019</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1399" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1399');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1399" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1399');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl29$hdfValue" id="Body_GvList_hdfValue_27" value="0" />

                                    <div id="div_1399" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_27" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255100700038</td>
                                                    <td>PINTURA ESMALTE C/GRIS CLARO</td>
                                                    <td>1.000</td>
                                                    <td>GLN</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1440" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1440');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1423</td>
                                <td>09/10/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>09/10/2019</td>
                                <td>PARIONA ALEJO CARMEN FLOR</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1440" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1440');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1440" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1440');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl30$hdfValue" id="Body_GvList_hdfValue_28" value="0" />

                                    <div id="div_1440" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_28" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255000200030</td>
                                                    <td>LENTES DE SEGURIDAD NEGROS DE PROTECCION UV</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1447" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1447');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1430</td>
                                <td>09/10/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>09/10/2019</td>
                                <td>PARIONA ALEJO CARMEN FLOR</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1447" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1447');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1447" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1447');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl31$hdfValue" id="Body_GvList_hdfValue_29" value="0" />

                                    <div id="div_1447" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_29" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255100400047</td>
                                                    <td>LIMPIADOR DE EVAPORADOR ACTI-KLEAN</td>
                                                    <td>1.000</td>
                                                    <td>GLN</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1492" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1492');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1475</td>
                                <td>10/10/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>10/10/2019</td>
                                <td>PARIONA ALEJO CARMEN FLOR</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1492" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1492');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1492" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1492');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl32$hdfValue" id="Body_GvList_hdfValue_30" value="0" />

                                    <div id="div_1492" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_30" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255000200022</td>
                                                    <td>GUANTES DE BADANA TIPO CUERO</td>
                                                    <td>1.000</td>
                                                    <td>PAR </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1499" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1499');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1482</td>
                                <td>10/10/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>10/10/2019</td>
                                <td>PARIONA ALEJO CARMEN FLOR</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1499" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1499');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1499" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1499');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl33$hdfValue" id="Body_GvList_hdfValue_31" value="0" />

                                    <div id="div_1499" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_31" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255600300230</td>
                                                    <td>CURVA CONDUIT 3/4&quot; X 90&#176;</td>
                                                    <td>19.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255600300205</td>
                                                    <td>UNION 3/4&quot; EMT CONDUIT</td>
                                                    <td>166.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255600300056</td>
                                                    <td>CONECTOR 3/4&quot; EMT CONDUIT</td>
                                                    <td>100.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255100200014</td>
                                                    <td>ABRAZADERA 3/4&quot; UNISTRUT</td>
                                                    <td>100.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255600300231</td>
                                                    <td>CAJA DE PASE METALICA 100X100 MM RANURADO 3/4&quot;</td>
                                                    <td>30.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255100600015</td>
                                                    <td>AUTOPERFORANTE 1/4&quot; X 3/4&quot;</td>
                                                    <td>250.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1500" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1500');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1483</td>
                                <td>10/10/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>10/10/2019</td>
                                <td>PARIONA ALEJO CARMEN FLOR</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1500" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1500');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1500" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1500');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl34$hdfValue" id="Body_GvList_hdfValue_32" value="0" />

                                    <div id="div_1500" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_32" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255100100033</td>
                                                    <td>DISCO DE LAMINAS 115 MM GR 60</td>
                                                    <td>2.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1709" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1709');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFP</td>
                                <td>001-6</td>
                                <td>14/11/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL PACKS </td>
                                <td>14/11/2019</td>
                                <td>AURA SANABRIA LEVANO</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1709" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1709');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1709" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1709');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl35$hdfValue" id="Body_GvList_hdfValue_33" value="0" />

                                    <div id="div_1709" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_33" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>256100300033</td>
                                                    <td>REGLA DE 30 CM</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1942" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1942');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1902</td>
                                <td>14/11/2019</td>
                                <td>ASESORIA PROC. DE TITULACION HUARANGAL</td>
                                <td>SUN FRUITS PACKS S.A.</td>
                                <td>14/11/2019</td>
                                <td>LILIANA RAMOS</td>
                                <td>ASESOR&#205;A EN EL PROCEDIMIENTO ADMINISTRATIVO DE TITULACI&#211;N DEL PREDIO R&#218;STICO DENOMINADO EL
HUARANGAL, SITO EN EL SECTOR CHAVALINA DEL DISTRITO DE SAN JOSE DE LOS MOLINOS, CON LA
OBTENCI&#211;N DE LA RESOLUCI&#211;N DE INCORPORACI&#211;N DEL PREDIO AL DOMINIO DEL ES TADO, PARA SU
INMATRICULACI&#211;N EN REGISTROS P&#218;BLICOS (SOLICITADO POR ABOG. LORENA HILARIO TENORIO)</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1942" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1942');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1942" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1942');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl36$hdfValue" id="Body_GvList_hdfValue_34" value="0" />

                                    <div id="div_1942" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_34" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>635300100002</td>
                                                    <td>ASESORIA  LEGAL</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>635300100002</td>
                                                    <td>ASESORIA  LEGAL</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1960" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1960');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-1920</td>
                                <td>15/11/2019</td>
                                <td>ASESORIA PROCED. TITULACION  HUARANGAL</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>15/11/2019</td>
                                <td>LILIANA RAMOS</td>
                                <td>ASESOR&#205;A EN EL PROCEDIMIENTO ADMINISTRATIVO DE TITULACI&#211;N DEL PREDIO R&#218;STICO DENOMINADO EL
HUARANGAL, SITO EN EL SECTOR CHAVALINA DEL DISTRITO DE SAN JOSE DE LOS MOLINOS, CON LA
OBTENCI&#211;N DE LA RESOLUCI&#211;N DE INCORPORACI&#211;N DEL PREDIO AL DOMINIO DEL ES TADO, PARA SU
INMATRICULACI&#211;N EN REGISTROS P&#218;BLICOS. (SOLICITADO POR ABOG. LORENA HILARIO TENORIO)</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1960" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1960');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1960" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1960');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl37$hdfValue" id="Body_GvList_hdfValue_35" value="0" />

                                    <div id="div_1960" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_35" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>635300100002</td>
                                                    <td>ASESORIA  LEGAL</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_1963" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_1963');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFP</td>
                                <td>-1</td>
                                <td>15/11/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL PACKS </td>
                                <td>15/11/2019</td>
                                <td>MICHAEL SALAZAR</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_1963" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_1963');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_1963" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_1963');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl38$hdfValue" id="Body_GvList_hdfValue_36" value="0" />

                                    <div id="div_1963" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_36" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>635200100011</td>
                                                    <td>SERVICIO DE MUESTREO, INSPECCION Y ANALISIS</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_2506" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_2506');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-2436</td>
                                <td>18/11/2019</td>
                                <td>&nbsp;</td>
                                <td>ALM. GABRIELAS</td>
                                <td>18/11/2019</td>
                                <td>JUAN CCERHUAYO</td>
                                <td>FERTILIZACION PARA CULTIVO DE PALTO.</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_2506" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_2506');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_2506" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_2506');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl39$hdfValue" id="Body_GvList_hdfValue_37" value="0" />

                                    <div id="div_2506" style="display: none;">
                                        <div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_2511" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_2511');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-2437</td>
                                <td>18/11/2019</td>
                                <td>SERVICIO MENSUAL - FACTURACION</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>18/11/2019</td>
                                <td>MELANY  PRADA VASQUEZ</td>
                                <td>PAGO FIJO MENSUAL Y VARIABLE POR LA EMISION DE DOCUMENTOS ELECTRONICOS / PEDIDO POR 06 MESES
POR LA EMISION DE 0 A 481 DOCUMENTOS ELECTRONICOS - JULIO 2019 VALOR DE VENTA 27.11 USD MAS IGV 
POR LA EMISION DE 0 A 479 DOCUMENTOS ELECTRONICOS - AGOSTO 2019 VALOR DE VENTA 27.05 USD MAS IGV 
POR LA EMISION DE 0 A 400 DOCUMENTOS ELECTRONICOS - SETIEMBRE 2019 VALOR DE VENTA 24.60 USD MAS IGV 
POR LA EMISION DE 0 A 400 DOCUMENTOS ELECTRONICOS - OCTUBRE 2019 VALOR DE VENTA 24.60 USD MAS IGV 
POR LA EMISION DE 0 A 400 DOCUMENTOS ELECTRONICOS - NOVIEMBRE 2019 VALOR DE VENTA 24.60 USD MAS IGV 
POR LA EMISION DE 0 A 800 DOCUMENTOS ELECTRONICOS - DICIEMBRE 2019 VALOR DE VENTA 49.20 USD MAS IGV 
</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_2511" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_2511');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_2511" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_2511');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl40$hdfValue" id="Body_GvList_hdfValue_38" value="0" />

                                    <div id="div_2511" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_38" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>635700100012</td>
                                                    <td>EMISION DE FACTURACION ELECTRONICA</td>
                                                    <td>6.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3202" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3202');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3091</td>
                                <td>12/11/2019</td>
                                <td>FERTIRRIEGO CITRICO</td>
                                <td>ALM. HUARANGAL CITRICO</td>
                                <td>12/11/2019</td>
                                <td>VICTOR ESCATE</td>
                                <td>FERTIRRIEGO CITRICO LOTE HC-02</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3202" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3202');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3202" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3202');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl41$hdfValue" id="Body_GvList_hdfValue_39" value="0" />

                                    <div id="div_3202" style="display: none;">
                                        <div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3493" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3493');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>-68</td>
                                <td>26/11/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>26/11/2019</td>
                                <td>CYNTHIA ESPINOZA PAUCAR</td>
                                <td>Subsolado de un &#225;rea de 3.7 H&#225;s</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3493" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3493');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3493" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3493');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl42$hdfValue" id="Body_GvList_hdfValue_40" value="0" />

                                    <div id="div_3493" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_40" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>635100100001</td>
                                                    <td>ALQUILER DE MAQUINARIAS Y EQUIPOS</td>
                                                    <td>16.000</td>
                                                    <td>H</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3554" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3554');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3416</td>
                                <td>26/11/2019</td>
                                <td>COMPRA</td>
                                <td>ALM.SANTA ANA DE PALTA</td>
                                <td>26/11/2019</td>
                                <td>DAVID SANCHEZ</td>
                                <td>INSECTICIDA PARA EL CONTROL DEL BICHO DEL CESTO </td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3554" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3554');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3554" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3554');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl43$hdfValue" id="Body_GvList_hdfValue_41" value="0" />

                                    <div id="div_3554" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_41" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245000200018   </td>
                                                    <td>COLOSO 50 SG</td>
                                                    <td>58.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3555" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3555');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3417</td>
                                <td>26/11/2019</td>
                                <td>PARA COMPRA</td>
                                <td>ALM.SANTA ANA DE PALTA</td>
                                <td>26/11/2019</td>
                                <td>DAVID SANCHEZ</td>
                                <td>INSECTICIDA BIOLOGICO PARA EL CONTROL DEL BICHO DEL CESTO</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3555" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3555');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3555" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3555');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl44$hdfValue" id="Body_GvList_hdfValue_42" value="0" />

                                    <div id="div_3555" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_42" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245000200041   </td>
                                                    <td>LEPIBAC 10 PM</td>
                                                    <td>125.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3556" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3556');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3418</td>
                                <td>26/11/2019</td>
                                <td>PARA COMPRA</td>
                                <td>ALM.SANTA ANA DE PALTA</td>
                                <td>26/11/2019</td>
                                <td>DAVID SANCHEZ</td>
                                <td>ACIDIFICANTE PARA BAJAR EL PH EN EL CALDO DE APLICACION</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3556" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3556');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3556" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3556');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl45$hdfValue" id="Body_GvList_hdfValue_43" value="0" />

                                    <div id="div_3556" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_43" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245000500003   </td>
                                                    <td>BB5</td>
                                                    <td>120.000</td>
                                                    <td>LIT</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3557" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3557');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3419</td>
                                <td>26/11/2019</td>
                                <td>PARA COMPRA</td>
                                <td>ALM.SANTA ANA DE PALTA</td>
                                <td>26/11/2019</td>
                                <td>DAVID SANCHEZ</td>
                                <td>DISPERSANTE DE AGUA PARA REDUCIR LA TEMSION SUPERFICIAL DE LAS GOTAS  DE APLICACION</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3557" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3557');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3557" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3557');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl46$hdfValue" id="Body_GvList_hdfValue_44" value="0" />

                                    <div id="div_3557" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_44" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245000500005   </td>
                                                    <td>BREAK THRU</td>
                                                    <td>35.000</td>
                                                    <td>LIT</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3606" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3606');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>-82</td>
                                <td>27/11/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>27/11/2019</td>
                                <td>CYNTHIA ESPINOZA PAUCAR</td>
                                <td>SERVICIO DE ANALAISIS DE MUESTRAS DE PALTOS Y CITRICOS DE FUNDO SANTA ANA AY HACIENDA GRANDE -  REGULARIZACION DE OS 1775 Y 1776 NISIRA</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3606" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3606');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3606" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3606');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl47$hdfValue" id="Body_GvList_hdfValue_45" value="0" />

                                    <div id="div_3606" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_45" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>635200100006</td>
                                                    <td>SERVICIO DE ANALISIS QUIMICO</td>
                                                    <td>14.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3607" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3607');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>-83</td>
                                <td>27/11/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>27/11/2019</td>
                                <td>CYNTHIA ESPINOZA PAUCAR</td>
                                <td>SERVICIO DE ANALAISIS PARA MUESTRA DE ARANDANOS
</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3607" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3607');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3607" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3607');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl48$hdfValue" id="Body_GvList_hdfValue_46" value="0" />

                                    <div id="div_3607" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_46" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>635200100006</td>
                                                    <td>SERVICIO DE ANALISIS QUIMICO</td>
                                                    <td>8.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3630" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3630');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3488</td>
                                <td>28/11/2019</td>
                                <td>AREA DE FRIGORIFICO</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>28/11/2019</td>
                                <td>DIANA DUE&#209;AS</td>
                                <td>CINTA  DE EMBALAJE PARA OFICINA DE DESPACHO Y FRIGORIFICO</td>
                                <td>LUIS ACCO</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3630" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3630');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3630" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3630');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl49$hdfValue" id="Body_GvList_hdfValue_47" value="0" />

                                    <div id="div_3630" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_47" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>256100300004</td>
                                                    <td>CINTA DE EMBALAJE 2&quot;</td>
                                                    <td>93.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3704" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3704');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3550</td>
                                <td>29/11/2019</td>
                                <td>Trabajo de Altura - Renovaci&#243;n de Ex&#225;men</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>29/11/2019</td>
                                <td>NEMISIS GAMARRA</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3704" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3704');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3704" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3704');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl50$hdfValue" id="Body_GvList_hdfValue_48" value="0" />

                                    <div id="div_3704" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_48" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>635200100018</td>
                                                    <td>EXAMEN DE AUDIOMETRIA</td>
                                                    <td>57.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>635200100019</td>
                                                    <td>EXAMEN DE ESPIROMETRIA</td>
                                                    <td>57.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>635200100020</td>
                                                    <td>EXAMEN RX TORAXICO</td>
                                                    <td>57.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>635200100021</td>
                                                    <td>ELECTROCARDIOGRAMA</td>
                                                    <td>13.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255300100014</td>
                                                    <td>PRUEBA TOXICOLOGICA</td>
                                                    <td>100.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3710" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3710');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3556</td>
                                <td>29/11/2019</td>
                                <td>Renovaci&#243;n de Ex&#225;menes Fundo</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>29/11/2019</td>
                                <td>NEMISIS GAMARRA</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3710" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3710');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3710" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3710');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl51$hdfValue" id="Body_GvList_hdfValue_49" value="0" />

                                    <div id="div_3710" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_49" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255300100014</td>
                                                    <td>PRUEBA TOXICOLOGICA</td>
                                                    <td>30.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255300100014</td>
                                                    <td>PRUEBA TOXICOLOGICA</td>
                                                    <td>30.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3712" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3712');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3558</td>
                                <td>29/11/2019</td>
                                <td>Colacaciones del Personal planta</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>29/11/2019</td>
                                <td>NEMISIS GAMARRA</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3712" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3712');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3712" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3712');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl52$hdfValue" id="Body_GvList_hdfValue_50" value="0" />

                                    <div id="div_3712" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_50" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>636100100001</td>
                                                    <td>SERVICIOS DE ALIMENTACION</td>
                                                    <td>24.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3715" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3715');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFP</td>
                                <td>001-12</td>
                                <td>29/11/2019</td>
                                <td>Colaciones del Personal de planta</td>
                                <td>SUN FRUITS PACKS S.A.</td>
                                <td>29/11/2019</td>
                                <td>NEMISIS GAMARRA</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3715" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3715');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3715" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3715');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl53$hdfValue" id="Body_GvList_hdfValue_51" value="0" />

                                    <div id="div_3715" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_51" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>636100100001</td>
                                                    <td>SERVICIOS DE ALIMENTACION</td>
                                                    <td>24.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3716" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3716');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3561</td>
                                <td>29/11/2019</td>
                                <td>Colaciones del Personal de Planta</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>29/11/2019</td>
                                <td>NEMISIS GAMARRA</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3716" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3716');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3716" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3716');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl54$hdfValue" id="Body_GvList_hdfValue_52" value="0" />

                                    <div id="div_3716" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_52" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>636100100001</td>
                                                    <td>SERVICIOS DE ALIMENTACION</td>
                                                    <td>622.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3728" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3728');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3571</td>
                                <td>29/11/2019</td>
                                <td>COMPRAS DE PRODUCTOS </td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>29/11/2019</td>
                                <td>JOSE LUIS CHACALIZA ORELLANA</td>
                                <td>FUNGICIDAS /NEMATICIDA /NEMATICIDA / ENRRAIZANTE / FOLIARES / ACIDOS HUMICOS / INSECTICIDAS  APLICACIONES PARA EL CULTIVO DE LA VID </td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3728" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3728');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3728" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3728');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl55$hdfValue" id="Body_GvList_hdfValue_53" value="0" />

                                    <div id="div_3728" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_53" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245000100008   </td>
                                                    <td>AZUFRE PANTERA EN POLVO</td>
                                                    <td>800.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245000100046   </td>
                                                    <td>TELDOR 50 PM</td>
                                                    <td>17.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245000100006   </td>
                                                    <td>ARMOR</td>
                                                    <td>200.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245000200049   </td>
                                                    <td>NEMA RAZER</td>
                                                    <td>200.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245100300005   </td>
                                                    <td>BIOCRECE</td>
                                                    <td>200.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100052   </td>
                                                    <td>ORGANIHUM HUMISOL</td>
                                                    <td>400.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245000200028   </td>
                                                    <td>GF-120</td>
                                                    <td>12.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3729" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3729');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3572</td>
                                <td>29/11/2019</td>
                                <td>COMPRA DE FERTILIZANTE </td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>29/11/2019</td>
                                <td>JOSE LUIS CHACALIZA ORELLANA</td>
                                <td>FERTIRRIEGO PARA LA VID </td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3729" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3729');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3729" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3729');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl56$hdfValue" id="Body_GvList_hdfValue_54" value="0" />

                                    <div id="div_3729" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_54" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100022   </td>
                                                    <td>NITRATO DE AMONIO</td>
                                                    <td>2500.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100023   </td>
                                                    <td>NITRATO DE CALCIO CRISTALIZADO DSC</td>
                                                    <td>2000.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100024   </td>
                                                    <td>NITRATO DE MAGNESIO</td>
                                                    <td>3000.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100040   </td>
                                                    <td>SULFATO DE ZINC</td>
                                                    <td>800.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100038   </td>
                                                    <td>SULFATO DE MANGANESO</td>
                                                    <td>300.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100036   </td>
                                                    <td>SULFATO DE MAGNESIO</td>
                                                    <td>1500.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100011   </td>
                                                    <td>ENERGYPHOS PLUS</td>
                                                    <td>180.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100003   </td>
                                                    <td>ACIDO FOSFORICO 85 %</td>
                                                    <td>1500.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3798" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3798');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3632</td>
                                <td>30/11/2019</td>
                                <td>CARTELES VINIL PVC - PARA FUNDOS</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>30/11/2019</td>
                                <td>NEMISIS GAMARRA</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3798" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3798');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3798" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3798');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl57$hdfValue" id="Body_GvList_hdfValue_55" value="0" />

                                    <div id="div_3798" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_55" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>256100200010</td>
                                                    <td>VINIL + PVC 0.26 X 0.20 MTS</td>
                                                    <td>26.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3799" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3799');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3633</td>
                                <td>30/11/2019</td>
                                <td>Banner  para charla de Inicio de Campa&#241;a</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>30/11/2019</td>
                                <td>NEMISIS GAMARRA</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3799" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3799');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3799" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3799');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl58$hdfValue" id="Body_GvList_hdfValue_56" value="0" />

                                    <div id="div_3799" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_56" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>256100200011</td>
                                                    <td>BANNER + BASTIDOR DE MADERA 2.00 X 1.20 MTS</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3804" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3804');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3635</td>
                                <td>30/11/2019</td>
                                <td>Sillas Ergonomicas - RRHH</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>30/11/2019</td>
                                <td>NEMISIS GAMARRA</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3804" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3804');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3804" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3804');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl59$hdfValue" id="Body_GvList_hdfValue_57" value="0" />

                                    <div id="div_3804" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_57" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>256100700016</td>
                                                    <td>SILLA GIRATORIA</td>
                                                    <td>5.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3870" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3870');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3694</td>
                                <td>02/12/2019</td>
                                <td>AUSPICIO ENCUENTRO DESARROLLO ECONOMICO</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>02/12/2019</td>
                                <td>LILIANA RAMOS</td>
                                <td>Auspicio de Foro: &quot;Encuentro Internacional de Comercio
Exterior y Desarrollo Economico&quot;, el 7 y 8 de Noviembre del
2019. (Solicitado por la CAMARA DE COMERCIO INDUSTRIA Y TURISMO DE ICA) FACTURA F001-579</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3870" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3870');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3870" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3870');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl60$hdfValue" id="Body_GvList_hdfValue_58" value="0" />

                                    <div id="div_3870" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_58" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>635900100001</td>
                                                    <td>AUSPICIO A EVENTOS</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3879" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3879');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3703</td>
                                <td>02/12/2019</td>
                                <td>AREA DE FRIGORIFICO-ZAPATOS DE SEGURIDAD</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>02/12/2019</td>
                                <td>DIANA DUE&#209;AS</td>
                                <td>ZAPATOS DE SEGURIDAD PARAN EL AREA DE FRIGORIFICO</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3879" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3879');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3879" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3879');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl61$hdfValue" id="Body_GvList_hdfValue_59" value="0" />

                                    <div id="div_3879" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_59" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255000200050</td>
                                                    <td>ZAPATO DE SEGURIDAD PUNTA DE ACERO</td>
                                                    <td>25.000</td>
                                                    <td>PAR </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3951" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3951');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3764</td>
                                <td>03/12/2019</td>
                                <td>LOTE ES-01,02,03 LOTE LP 01,02,03</td>
                                <td>ALM. HUARANGAL CITRICO</td>
                                <td>03/12/2019</td>
                                <td>VICTOR ESCATE</td>
                                <td>FERTIRRIEGO CITRICO</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3951" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3951');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3951" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3951');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl62$hdfValue" id="Body_GvList_hdfValue_60" value="0" />

                                    <div id="div_3951" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_60" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100022   </td>
                                                    <td>NITRATO DE AMONIO</td>
                                                    <td>16.990</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100054</td>
                                                    <td>ENERGYPHOS</td>
                                                    <td>55.200</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100054</td>
                                                    <td>ENERGYPHOS</td>
                                                    <td>67.360</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100054</td>
                                                    <td>ENERGYPHOS</td>
                                                    <td>74.880</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100054</td>
                                                    <td>ENERGYPHOS</td>
                                                    <td>74.640</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100054</td>
                                                    <td>ENERGYPHOS</td>
                                                    <td>26.800</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100054</td>
                                                    <td>ENERGYPHOS</td>
                                                    <td>53.520</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3955" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3955');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3768</td>
                                <td>03/12/2019</td>
                                <td>APLICACION FOLIAR </td>
                                <td>ALM. HUARANGAL CITRICO</td>
                                <td>03/12/2019</td>
                                <td>VICTOR ESCATE</td>
                                <td>APLICACION FOLIAR LOTE ES-3</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3955" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3955');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3955" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3955');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl63$hdfValue" id="Body_GvList_hdfValue_61" value="0" />

                                    <div id="div_3955" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_61" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100023   </td>
                                                    <td>NITRATO DE CALCIO CRISTALIZADO DSC</td>
                                                    <td>24.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3956" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3956');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3769</td>
                                <td>03/12/2019</td>
                                <td>APLICACION FOLIAR </td>
                                <td>ALM. HUARANGAL CITRICO</td>
                                <td>03/12/2019</td>
                                <td>VICTOR ESCATE</td>
                                <td>APLICACION FOLIAR LOTE HC -03</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3956" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3956');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3956" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3956');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl64$hdfValue" id="Body_GvList_hdfValue_62" value="0" />

                                    <div id="div_3956" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_62" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100023   </td>
                                                    <td>NITRATO DE CALCIO CRISTALIZADO DSC</td>
                                                    <td>45.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3960" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3960');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3772</td>
                                <td>03/12/2019</td>
                                <td>APLICACION INSECTICIDA </td>
                                <td>ALM. HUARANGAL CITRICO</td>
                                <td>03/12/2019</td>
                                <td>VICTOR ESCATE</td>
                                <td>APLICACION INSECTICIDA LOTE HC 01</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3960" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3960');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3960" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3960');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl65$hdfValue" id="Body_GvList_hdfValue_63" value="0" />

                                    <div id="div_3960" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_63" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245000500003   </td>
                                                    <td>BB5</td>
                                                    <td>1.600</td>
                                                    <td>LIT</td>
                                                </tr>
                                                <tr>
                                                    <td>245000200004   </td>
                                                    <td>ACARISIL 110 SC</td>
                                                    <td>1.600</td>
                                                    <td>LIT</td>
                                                </tr>
                                                <tr>
                                                    <td>245000500005   </td>
                                                    <td>BREAK THRU</td>
                                                    <td>0.400</td>
                                                    <td>LIT</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3965" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3965');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3774</td>
                                <td>03/12/2019</td>
                                <td>AREA DE FRIGORIFICO</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>03/12/2019</td>
                                <td>DIANA DUE&#209;AS</td>
                                <td>MATERIALES PARA FRIGORIFICO</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3965" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3965');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3965" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3965');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl66$hdfValue" id="Body_GvList_hdfValue_64" value="0" />

                                    <div id="div_3965" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_64" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>265000800019</td>
                                                    <td>STRECH FILM                                                                                         </td>
                                                    <td>300.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3967" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3967');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3776</td>
                                <td>03/12/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>03/12/2019</td>
                                <td>JUNIOR TOLEDO MATTA</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3967" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3967');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3967" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3967');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl67$hdfValue" id="Body_GvList_hdfValue_65" value="0" />

                                    <div id="div_3967" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_65" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255000400019</td>
                                                    <td>GUARDAPOLVO CON LOGO BORDADO Y BOLSILLOS LATERALES</td>
                                                    <td>15.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255000400020</td>
                                                    <td>TOCA SIMPLE PARA CABELLO</td>
                                                    <td>15.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3968" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3968');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3777</td>
                                <td>03/12/2019</td>
                                <td>MATERIALES AREA DE FRIGORIFICO</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>03/12/2019</td>
                                <td>DIANA DUE&#209;AS</td>
                                <td>MATERIALES PARA EL AREA DE FRIGORIFICO</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3968" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3968');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3968" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3968');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl68$hdfValue" id="Body_GvList_hdfValue_66" value="0" />

                                    <div id="div_3968" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_66" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255800300002</td>
                                                    <td>LINTERNA DE CABEZA LED</td>
                                                    <td>2.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255100500030</td>
                                                    <td>GRAPA 5/16&quot;</td>
                                                    <td>5.000</td>
                                                    <td>CAJA</td>
                                                </tr>
                                                <tr>
                                                    <td>256100300005</td>
                                                    <td>CINTA DUCTOS 2&quot; X 60 YDS PLOMO</td>
                                                    <td>200.000</td>
                                                    <td>ROLL</td>
                                                </tr>
                                                <tr>
                                                    <td>256100300012</td>
                                                    <td>GRAPA 26/6 X 5000 UNIDADES</td>
                                                    <td>4.000</td>
                                                    <td>CAJA</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3972" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3972');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3780</td>
                                <td>04/12/2019</td>
                                <td>FERT. ARANDANO LOTE 1</td>
                                <td>ALM. SANTA ANA ARANDANO</td>
                                <td>04/12/2019</td>
                                <td>CLAUDIA SANCHEZ</td>
                                <td>FERT. ARANDANO LOTE 1</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3972" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3972');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3972" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3972');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl69$hdfValue" id="Body_GvList_hdfValue_67" value="0" />

                                    <div id="div_3972" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_67" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100003   </td>
                                                    <td>ACIDO FOSFORICO 85 %</td>
                                                    <td>1.200</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100036   </td>
                                                    <td>SULFATO DE MAGNESIO</td>
                                                    <td>1.600</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100040   </td>
                                                    <td>SULFATO DE ZINC</td>
                                                    <td>0.024</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100031   </td>
                                                    <td>SOLVER 500</td>
                                                    <td>2.800</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100023   </td>
                                                    <td>NITRATO DE CALCIO CRISTALIZADO DSC</td>
                                                    <td>2.400</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3973" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3973');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3781</td>
                                <td>04/12/2019</td>
                                <td>FERT. ARANDANO LOTE 2</td>
                                <td>ALM. SANTA ANA ARANDANO</td>
                                <td>04/12/2019</td>
                                <td>CLAUDIA SANCHEZ</td>
                                <td>FERT. ARANDANO LOTE 2</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3973" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3973');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3973" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3973');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl70$hdfValue" id="Body_GvList_hdfValue_68" value="0" />

                                    <div id="div_3973" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_68" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100003   </td>
                                                    <td>ACIDO FOSFORICO 85 %</td>
                                                    <td>3.600</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100036   </td>
                                                    <td>SULFATO DE MAGNESIO</td>
                                                    <td>5.100</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100040   </td>
                                                    <td>SULFATO DE ZINC</td>
                                                    <td>0.075</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100031   </td>
                                                    <td>SOLVER 500</td>
                                                    <td>9.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100023   </td>
                                                    <td>NITRATO DE CALCIO CRISTALIZADO DSC</td>
                                                    <td>5.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3981" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3981');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3789</td>
                                <td>04/12/2019</td>
                                <td>FUNGISIDAS Y MOSCA D LA FRUTA HU 08</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>04/12/2019</td>
                                <td>JUAN QUISPE</td>
                                <td>APLICACION FUNGISIDA Y BOTRICIDA</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3981" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3981');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3981" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3981');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl71$hdfValue" id="Body_GvList_hdfValue_69" value="0" />

                                    <div id="div_3981" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_69" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245000100008   </td>
                                                    <td>AZUFRE PANTERA EN POLVO</td>
                                                    <td>68.600</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245000100014   </td>
                                                    <td>BIO SPLENT 70 WP</td>
                                                    <td>7.425</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245000200028   </td>
                                                    <td>GF-120</td>
                                                    <td>10.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>255900200018</td>
                                                    <td>BIOLURE 3 COMPONENTES</td>
                                                    <td>10.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3982" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3982');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3790</td>
                                <td>04/12/2019</td>
                                <td>APLICACION OIDIUM HU 09</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>04/12/2019</td>
                                <td>JUAN QUISPE</td>
                                <td>APLICACIPON FUNGISIDA</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3982" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3982');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3982" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3982');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl72$hdfValue" id="Body_GvList_hdfValue_70" value="0" />

                                    <div id="div_3982" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_70" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245000500001   </td>
                                                    <td>ACIDO CITRICO</td>
                                                    <td>0.329</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245000100059   </td>
                                                    <td>POLAR</td>
                                                    <td>0.658</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245000500023   </td>
                                                    <td>OMEX K50</td>
                                                    <td>13.160</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245000100035   </td>
                                                    <td>PRIX</td>
                                                    <td>0.493</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_3984" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_3984');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3792</td>
                                <td>04/12/2019</td>
                                <td>OIDIUM HU 1O</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>04/12/2019</td>
                                <td>JUAN QUISPE</td>
                                <td>APLICACION FUNGISIDA
</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_3984" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_3984');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_3984" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_3984');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl73$hdfValue" id="Body_GvList_hdfValue_71" value="0" />

                                    <div id="div_3984" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_71" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245000500001   </td>
                                                    <td>ACIDO CITRICO</td>
                                                    <td>0.357</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245000100059   </td>
                                                    <td>POLAR</td>
                                                    <td>0.714</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245000500023   </td>
                                                    <td>OMEX K50</td>
                                                    <td>14.280</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245000100035   </td>
                                                    <td>PRIX</td>
                                                    <td>0.535</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4004" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4004');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3808</td>
                                <td>04/12/2019</td>
                                <td>ASEGURAMIENTO DE CALIDAD</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>04/12/2019</td>
                                <td>SILVIA HUAMAN</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4004" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4004');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4004" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4004');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl74$hdfValue" id="Body_GvList_hdfValue_72" value="0" />

                                    <div id="div_4004" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_72" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>256100300019</td>
                                                    <td>PAPEL BOND T/A-4 75GR</td>
                                                    <td>3.000</td>
                                                    <td>MILL</td>
                                                </tr>
                                                <tr>
                                                    <td>256100400007</td>
                                                    <td>CAJA TECNOPOR</td>
                                                    <td>10.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4005" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4005');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3809</td>
                                <td>04/12/2019</td>
                                <td>FERTILIZANTE PARA EL CAMPO DE PALTA.</td>
                                <td>ALM.SANTA ANA DE PALTA</td>
                                <td>04/12/2019</td>
                                <td>CHRISTIAN PE&#209;A</td>
                                <td>L. SE REQUIERE FERTILIZANTE PARA EL CAMPO DE PALTA.</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4005" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4005');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4005" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4005');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl75$hdfValue" id="Body_GvList_hdfValue_73" value="0" />

                                    <div id="div_4005" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_73" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100011   </td>
                                                    <td>ENERGYPHOS PLUS</td>
                                                    <td>10.710</td>
                                                    <td>LIT</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4006" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4006');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3810</td>
                                <td>04/12/2019</td>
                                <td>FERTILIZANTE PARA EL CAMPO DE PALTA.</td>
                                <td>ALM.SANTA ANA DE PALTA</td>
                                <td>04/12/2019</td>
                                <td>CHRISTIAN PE&#209;A</td>
                                <td>L. SE REQUIERE FERTILIZANTE PARA EL CAMPO DE PALTA.</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4006" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4006');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4006" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4006');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl76$hdfValue" id="Body_GvList_hdfValue_74" value="0" />

                                    <div id="div_4006" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_74" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100011   </td>
                                                    <td>ENERGYPHOS PLUS</td>
                                                    <td>20.560</td>
                                                    <td>LIT</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4007" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4007');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3811</td>
                                <td>04/12/2019</td>
                                <td>FERTILIZANTE PARA EL CAMPO DE PALTA.</td>
                                <td>ALM.SANTA ANA DE PALTA</td>
                                <td>04/12/2019</td>
                                <td>CHRISTIAN PE&#209;A</td>
                                <td>L. SE REQUIERE FERTILIZANTE PARA EL CAMPO DE PALTA.</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4007" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4007');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4007" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4007');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl77$hdfValue" id="Body_GvList_hdfValue_75" value="0" />

                                    <div id="div_4007" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_75" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100011   </td>
                                                    <td>ENERGYPHOS PLUS</td>
                                                    <td>46.980</td>
                                                    <td>LIT</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4008" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4008');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3812</td>
                                <td>04/12/2019</td>
                                <td>PESTICIDAS PARA PREVENCION DE CAIDA DE F</td>
                                <td>ALM.SANTA ANA DE PALTA</td>
                                <td>04/12/2019</td>
                                <td>VICTOR VALLE</td>
                                <td>L. SE REQUIERE PRODUCTOS PESTICIDAS PARA PREVENCION DE CAIDA DE FRUTA.</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4008" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4008');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4008" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4008');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl78$hdfValue" id="Body_GvList_hdfValue_76" value="0" />

                                    <div id="div_4008" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_76" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245000500003   </td>
                                                    <td>BB5</td>
                                                    <td>1.500</td>
                                                    <td>LIT</td>
                                                </tr>
                                                <tr>
                                                    <td>245100300011   </td>
                                                    <td>CITOKELP</td>
                                                    <td>12.000</td>
                                                    <td>LIT</td>
                                                </tr>
                                                <tr>
                                                    <td>245000500005   </td>
                                                    <td>BREAK THRU</td>
                                                    <td>0.400</td>
                                                    <td>LIT</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4010" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4010');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFP</td>
                                <td>001-13</td>
                                <td>04/12/2019</td>
                                <td>INSPECCION DE CONTENEDOR</td>
                                <td>ALMACEN GENERAL PACKS </td>
                                <td>04/12/2019</td>
                                <td>MICHAEL SALAZAR</td>
                                <td>SERVICIO DE INSPECCION DE CONTENEDOR SUDU8147305 - UVA CAMP 2018-2019</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4010" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4010');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4010" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4010');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl79$hdfValue" id="Body_GvList_hdfValue_77" value="0" />

                                    <div id="div_4010" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_77" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>635200100011</td>
                                                    <td>SERVICIO DE MUESTREO, INSPECCION Y ANALISIS</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4025" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4025');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3823</td>
                                <td>04/12/2019</td>
                                <td>APLICACION FERTIRRIEGO LOTE HU-139.9</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>04/12/2019</td>
                                <td>ALEX PILLACA</td>
                                <td>APLICACION FERTIRRIEGO</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4025" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4025');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4025" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4025');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl80$hdfValue" id="Body_GvList_hdfValue_78" value="0" />

                                    <div id="div_4025" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_78" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100039   </td>
                                                    <td>SULFATO DE POTASIO SOLUBLE</td>
                                                    <td>139.900</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4026" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4026');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3824</td>
                                <td>04/12/2019</td>
                                <td>APLICACION FERTIRRIEGO LOTE HU-07</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>04/12/2019</td>
                                <td>ALEX PILLACA</td>
                                <td>APLICACION FERTIRRIEGO</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4026" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4026');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4026" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4026');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl81$hdfValue" id="Body_GvList_hdfValue_79" value="0" />

                                    <div id="div_4026" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_79" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100022   </td>
                                                    <td>NITRATO DE AMONIO</td>
                                                    <td>34.730</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100023   </td>
                                                    <td>NITRATO DE CALCIO CRISTALIZADO DSC</td>
                                                    <td>115.800</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4027" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4027');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3825</td>
                                <td>04/12/2019</td>
                                <td>APLICACION FERTIRRIEGO LOTE HU-06</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>04/12/2019</td>
                                <td>ALEX PILLACA</td>
                                <td>APLICACION FERTIRRIEGO.</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4027" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4027');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4027" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4027');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl82$hdfValue" id="Body_GvList_hdfValue_80" value="0" />

                                    <div id="div_4027" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_80" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100022   </td>
                                                    <td>NITRATO DE AMONIO</td>
                                                    <td>53.910</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100023   </td>
                                                    <td>NITRATO DE CALCIO CRISTALIZADO DSC</td>
                                                    <td>179.700</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4028" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4028');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3826</td>
                                <td>04/12/2019</td>
                                <td>APLICACION FERTIRRIEGO LOTE HU-12</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>04/12/2019</td>
                                <td>ALEX PILLACA</td>
                                <td>APLICACION FERTIRRIEGO</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4028" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4028');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4028" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4028');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl83$hdfValue" id="Body_GvList_hdfValue_81" value="0" />

                                    <div id="div_4028" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_81" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100040   </td>
                                                    <td>SULFATO DE ZINC</td>
                                                    <td>69.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100002</td>
                                                    <td>ACIDO BORICO</td>
                                                    <td>4.500</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4029" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4029');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3827</td>
                                <td>04/12/2019</td>
                                <td>APLICACION FERTIRRIEGO LOTE HU-11</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>04/12/2019</td>
                                <td>ALEX PILLACA</td>
                                <td>APLICACION FERTIRRIEGO. </td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4029" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4029');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4029" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4029');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl84$hdfValue" id="Body_GvList_hdfValue_82" value="0" />

                                    <div id="div_4029" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_82" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100040   </td>
                                                    <td>SULFATO DE ZINC</td>
                                                    <td>79.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100002</td>
                                                    <td>ACIDO BORICO</td>
                                                    <td>5.100</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4035" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4035');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3829</td>
                                <td>04/12/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>04/12/2019</td>
                                <td>ROSA SAIRITUPAC SALCEDO</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4035" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4035');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4035" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4035');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl85$hdfValue" id="Body_GvList_hdfValue_83" value="0" />

                                    <div id="div_4035" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_83" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255300100001</td>
                                                    <td>AGUA DESTILADA</td>
                                                    <td>100.000</td>
                                                    <td>GLN</td>
                                                </tr>
                                                <tr>
                                                    <td>255700100020</td>
                                                    <td>DESINFECTANTE PINO</td>
                                                    <td>20.000</td>
                                                    <td>GLN</td>
                                                </tr>
                                                <tr>
                                                    <td>255000200001</td>
                                                    <td>BARBIQUEJO PARA CASCO C/MENTONERA</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255000200040</td>
                                                    <td>PROTECTOR AURICULAR DE COPA PARA CASCO</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255700100009</td>
                                                    <td>DETERFLASH 12100</td>
                                                    <td>100.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>255000200056</td>
                                                    <td>CASCO DE SEGURIDAD</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255700100023</td>
                                                    <td>PAPEL TOALLA MULTIFOLD HOJA TRIPLE MAX&#160; 80 MTS</td>
                                                    <td>100.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>255300200009</td>
                                                    <td>ESTUCHE RECTANGULAR TAPA BAJA 142</td>
                                                    <td>2.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>255600400011</td>
                                                    <td>BATERIA 9V GRANDE</td>
                                                    <td>6.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255000100013</td>
                                                    <td>EXTINTOR DE ACETATO DE POTASIO 10 KG</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255000200040</td>
                                                    <td>PROTECTOR AURICULAR DE COPA PARA CASCO</td>
                                                    <td>4.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255800200055</td>
                                                    <td>WINCHA 5 MTS</td>
                                                    <td>2.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>256100300019</td>
                                                    <td>PAPEL BOND T/A-4 75GR</td>
                                                    <td>5.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>256100300019</td>
                                                    <td>PAPEL BOND T/A-4 75GR</td>
                                                    <td>5.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>255000300002</td>
                                                    <td>CINTA TRAFICO AMARILLA Y NEGRO</td>
                                                    <td>12.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>255700100004</td>
                                                    <td>AMBIENTADOR SPRAY</td>
                                                    <td>2.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255000200038</td>
                                                    <td>MASCARILLA DESCARTABLE X 50 UND</td>
                                                    <td>100.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>256000200002</td>
                                                    <td>CAMARA DIGITAL</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255900200014</td>
                                                    <td>TRAMPA TOMAHWK&#160; DE ALAMBRE ZINCADO PARA ROEDORES</td>
                                                    <td>8.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255000200022</td>
                                                    <td>GUANTES DE BADANA TIPO CUERO</td>
                                                    <td>5.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>255900200021</td>
                                                    <td>CAJA PROTECTORA - TRAMPA PARA ROEDORES</td>
                                                    <td>12.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4044" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4044');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3833</td>
                                <td>05/12/2019</td>
                                <td>HERBICIDA PARA EL CONTROL DE MALEZAS.</td>
                                <td>ALM.SANTA ANA DE PALTA</td>
                                <td>05/12/2019</td>
                                <td>VICTOR VALLE</td>
                                <td>L. SE REQUIERE HERBICIDA PARA EL CONTROL DE MALEZAS.</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4044" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4044');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4044" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4044');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl86$hdfValue" id="Body_GvList_hdfValue_84" value="0" />

                                    <div id="div_4044" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_84" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245000500001   </td>
                                                    <td>ACIDO CITRICO</td>
                                                    <td>0.060</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245000400002   </td>
                                                    <td>EMBATE 480 SL</td>
                                                    <td>6.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4046" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4046');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3835</td>
                                <td>05/12/2019</td>
                                <td>APLICACION FERTIRRIEGO LOTE HU-09</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>05/12/2019</td>
                                <td>ALEX PILLACA</td>
                                <td>APLICACION FERTIRRIEGO</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4046" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4046');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4046" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4046');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl87$hdfValue" id="Body_GvList_hdfValue_85" value="0" />

                                    <div id="div_4046" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_85" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100040   </td>
                                                    <td>SULFATO DE ZINC</td>
                                                    <td>76.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100002</td>
                                                    <td>ACIDO BORICO</td>
                                                    <td>4.900</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4047" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4047');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3836</td>
                                <td>05/12/2019</td>
                                <td>APLICACION FERTIRRIEGO LOTE HU-10</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>05/12/2019</td>
                                <td>ALEX PILLACA</td>
                                <td>APLICACION FERTIRRIEGO</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4047" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4047');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4047" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4047');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl88$hdfValue" id="Body_GvList_hdfValue_86" value="0" />

                                    <div id="div_4047" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_86" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100040   </td>
                                                    <td>SULFATO DE ZINC</td>
                                                    <td>82.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100002</td>
                                                    <td>ACIDO BORICO</td>
                                                    <td>5.400</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4048" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4048');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3837</td>
                                <td>05/12/2019</td>
                                <td>APLICACION FERTIRRIEGO LOTE HU-05</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>05/12/2019</td>
                                <td>ALEX PILLACA</td>
                                <td>APLICACION FERTIRRIEGO</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4048" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4048');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4048" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4048');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl89$hdfValue" id="Body_GvList_hdfValue_87" value="0" />

                                    <div id="div_4048" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_87" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100022   </td>
                                                    <td>NITRATO DE AMONIO</td>
                                                    <td>43.420</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100016   </td>
                                                    <td>FOSFATO MONOAMONICO SOLUBLE</td>
                                                    <td>40.200</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4050" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4050');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3839</td>
                                <td>05/12/2019</td>
                                <td>FERTILIZANTE PARA EL CAMPO DE PALTA.</td>
                                <td>ALM.SANTA ANA DE PALTA</td>
                                <td>05/12/2019</td>
                                <td>CHRISTIAN PE&#209;A</td>
                                <td>L. SE REQUIERE FERTILIZANTE PARA EL CAMPO DE PALTA.</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4050" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4050');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4050" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4050');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl90$hdfValue" id="Body_GvList_hdfValue_88" value="0" />

                                    <div id="div_4050" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_88" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100011   </td>
                                                    <td>ENERGYPHOS PLUS</td>
                                                    <td>23.060</td>
                                                    <td>LIT</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4051" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4051');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3840</td>
                                <td>05/12/2019</td>
                                <td>FERTILIZANTE PARA EL CAMPO DE PALTA.</td>
                                <td>ALM.SANTA ANA DE PALTA</td>
                                <td>05/12/2019</td>
                                <td>CHRISTIAN PE&#209;A</td>
                                <td>L. SE REQUIERE FERTILIZANTE PARA EL CAMPO DE PALTA.</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4051" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4051');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4051" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4051');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl91$hdfValue" id="Body_GvList_hdfValue_89" value="0" />

                                    <div id="div_4051" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_89" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100011   </td>
                                                    <td>ENERGYPHOS PLUS</td>
                                                    <td>18.170</td>
                                                    <td>LIT</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4052" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4052');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3841</td>
                                <td>05/12/2019</td>
                                <td>FERTILIZANTE PARA EL CAMPO DE PALTA.</td>
                                <td>ALM.SANTA ANA DE PALTA</td>
                                <td>05/12/2019</td>
                                <td>CHRISTIAN PE&#209;A</td>
                                <td>L. SE REQUIERE FERTILIZANTE PARA EL CAMPO DE PALTA.</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4052" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4052');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4052" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4052');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl92$hdfValue" id="Body_GvList_hdfValue_90" value="0" />

                                    <div id="div_4052" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_90" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100011   </td>
                                                    <td>ENERGYPHOS PLUS</td>
                                                    <td>20.320</td>
                                                    <td>LIT</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4053" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4053');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3842</td>
                                <td>05/12/2019</td>
                                <td>FERTILIZANTE PARA EL CAMPO DE PALTA.</td>
                                <td>ALM.SANTA ANA DE PALTA</td>
                                <td>05/12/2019</td>
                                <td>CHRISTIAN PE&#209;A</td>
                                <td>L. SE REQUIERE FERTILIZANTE PARA EL CAMPO DE PALTA.</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4053" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4053');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4053" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4053');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl93$hdfValue" id="Body_GvList_hdfValue_91" value="0" />

                                    <div id="div_4053" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_91" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100011   </td>
                                                    <td>ENERGYPHOS PLUS</td>
                                                    <td>53.280</td>
                                                    <td>LIT</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4054" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4054');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3843</td>
                                <td>05/12/2019</td>
                                <td>FERTILIZANTE PARA EL CAMPO DE PALTA.</td>
                                <td>ALM.SANTA ANA DE PALTA</td>
                                <td>05/12/2019</td>
                                <td>CHRISTIAN PE&#209;A</td>
                                <td>L. SE REQUIERE FERTILIZANTE PARA EL CAMPO DE PALTA.</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4054" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4054');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4054" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4054');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl94$hdfValue" id="Body_GvList_hdfValue_92" value="0" />

                                    <div id="div_4054" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_92" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100011   </td>
                                                    <td>ENERGYPHOS PLUS</td>
                                                    <td>9.880</td>
                                                    <td>LIT</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4055" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4055');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3844</td>
                                <td>05/12/2019</td>
                                <td>FERTILIZANTE PARA EL CAMPO DE PALTA.</td>
                                <td>ALM.SANTA ANA DE PALTA</td>
                                <td>05/12/2019</td>
                                <td>CHRISTIAN PE&#209;A</td>
                                <td>L. SE REQUIERE FERTILIZANTE PARA EL CAMPO DE PALTA.</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4055" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4055');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4055" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4055');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl95$hdfValue" id="Body_GvList_hdfValue_93" value="0" />

                                    <div id="div_4055" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_93" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100011   </td>
                                                    <td>ENERGYPHOS PLUS</td>
                                                    <td>70.900</td>
                                                    <td>LIT</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4056" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4056');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3845</td>
                                <td>05/12/2019</td>
                                <td>FERT. ARANDANO LOTE 1</td>
                                <td>ALM. SANTA ANA ARANDANO</td>
                                <td>05/12/2019</td>
                                <td>CLAUDIA SANCHEZ</td>
                                <td>FERT. ARANDANO LOTE 1</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4056" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4056');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4056" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4056');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl96$hdfValue" id="Body_GvList_hdfValue_94" value="0" />

                                    <div id="div_4056" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_94" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100003   </td>
                                                    <td>ACIDO FOSFORICO 85 %</td>
                                                    <td>1.200</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100036   </td>
                                                    <td>SULFATO DE MAGNESIO</td>
                                                    <td>1.600</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100040   </td>
                                                    <td>SULFATO DE ZINC</td>
                                                    <td>0.024</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100031   </td>
                                                    <td>SOLVER 500</td>
                                                    <td>2.800</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100023   </td>
                                                    <td>NITRATO DE CALCIO CRISTALIZADO DSC</td>
                                                    <td>2.400</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245100200055</td>
                                                    <td>ROOT FEED</td>
                                                    <td>1.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4057" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4057');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3846</td>
                                <td>05/12/2019</td>
                                <td>PESTICIDAS PARA EL CONTROL DE QUEREZAS.</td>
                                <td>ALM.SANTA ANA DE PALTA</td>
                                <td>05/12/2019</td>
                                <td>VICTOR VALLE</td>
                                <td>L. SE REQUIEREN PRODUCTOS PESTICIDAS PARA EL CONTROL DE QUEREZAS.</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4057" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4057');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4057" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4057');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl97$hdfValue" id="Body_GvList_hdfValue_95" value="0" />

                                    <div id="div_4057" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_95" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245000500003   </td>
                                                    <td>BB5</td>
                                                    <td>12.000</td>
                                                    <td>LIT</td>
                                                </tr>
                                                <tr>
                                                    <td>245000200015   </td>
                                                    <td>CAPEMIL</td>
                                                    <td>32.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245000200037   </td>
                                                    <td>LANCER 35</td>
                                                    <td>22.400</td>
                                                    <td>LIT</td>
                                                </tr>
                                                <tr>
                                                    <td>245000500005   </td>
                                                    <td>BREAK THRU</td>
                                                    <td>3.200</td>
                                                    <td>LIT</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4058" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4058');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3847</td>
                                <td>05/12/2019</td>
                                <td>FERT.ARANDANO LOTE 2</td>
                                <td>ALM. SANTA ANA ARANDANO</td>
                                <td>05/12/2019</td>
                                <td>CLAUDIA SANCHEZ</td>
                                <td>FERT.ARANDANO LOTE 2</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4058" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4058');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4058" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4058');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl98$hdfValue" id="Body_GvList_hdfValue_96" value="0" />

                                    <div id="div_4058" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_96" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100003   </td>
                                                    <td>ACIDO FOSFORICO 85 %</td>
                                                    <td>3.600</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100036   </td>
                                                    <td>SULFATO DE MAGNESIO</td>
                                                    <td>5.100</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100040   </td>
                                                    <td>SULFATO DE ZINC</td>
                                                    <td>0.075</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100031   </td>
                                                    <td>SOLVER 500</td>
                                                    <td>9.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100023   </td>
                                                    <td>NITRATO DE CALCIO CRISTALIZADO DSC</td>
                                                    <td>5.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245100200055</td>
                                                    <td>ROOT FEED</td>
                                                    <td>1.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4059" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4059');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3848</td>
                                <td>05/12/2019</td>
                                <td>OIDIUM HU 12</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>05/12/2019</td>
                                <td>JUAN QUISPE</td>
                                <td>APLICACION FUNGISIDA</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4059" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4059');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4059" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4059');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl99$hdfValue" id="Body_GvList_hdfValue_97" value="0" />

                                    <div id="div_4059" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_97" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245000100033   </td>
                                                    <td>PANTERA 720</td>
                                                    <td>7.475</td>
                                                    <td>LIT</td>
                                                </tr>
                                                <tr>
                                                    <td>245000500001   </td>
                                                    <td>ACIDO CITRICO</td>
                                                    <td>0.299</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>255900200009</td>
                                                    <td>RATAPLUM</td>
                                                    <td>3.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4060" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4060');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3849</td>
                                <td>05/12/2019</td>
                                <td>APLICACION OIDIUM HU 12</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>05/12/2019</td>
                                <td>JUAN QUISPE</td>
                                <td>APLICACION FUNGISIDA</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4060" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4060');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4060" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4060');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl100$hdfValue" id="Body_GvList_hdfValue_98" value="0" />

                                    <div id="div_4060" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_98" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245000100033   </td>
                                                    <td>PANTERA 720</td>
                                                    <td>8.575</td>
                                                    <td>LIT</td>
                                                </tr>
                                                <tr>
                                                    <td>245000500001   </td>
                                                    <td>ACIDO CITRICO</td>
                                                    <td>0.343</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>255900200009</td>
                                                    <td>RATAPLUM</td>
                                                    <td>3.000</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4061" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4061');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3850</td>
                                <td>05/12/2019</td>
                                <td>OIDIUM Y ACARO HU 05</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>05/12/2019</td>
                                <td>JUAN QUISPE</td>
                                <td>APLICACION PESTICIDAS</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4061" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4061');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4061" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4061');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl101$hdfValue" id="Body_GvList_hdfValue_99" value="0" />

                                    <div id="div_4061" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_99" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245000200001   </td>
                                                    <td>ABAFIN</td>
                                                    <td>2.288</td>
                                                    <td>LIT</td>
                                                </tr>
                                                <tr>
                                                    <td>245000500001   </td>
                                                    <td>ACIDO CITRICO</td>
                                                    <td>0.228</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245000100059   </td>
                                                    <td>POLAR</td>
                                                    <td>0.457</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245100300028   </td>
                                                    <td>PROFERT</td>
                                                    <td>3.981</td>
                                                    <td>LIT</td>
                                                </tr>
                                                <tr>
                                                    <td>245000500005   </td>
                                                    <td>BREAK THRU</td>
                                                    <td>0.228</td>
                                                    <td>LIT</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4062" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4062');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3851</td>
                                <td>05/12/2019</td>
                                <td>OIDIUM Y ACARO DE YEMA</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>05/12/2019</td>
                                <td>JUAN QUISPE</td>
                                <td>APLICACION PESTICIDA</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4062" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4062');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4062" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4062');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl102$hdfValue" id="Body_GvList_hdfValue_100" value="0" />

                                    <div id="div_4062" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_100" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245000200001   </td>
                                                    <td>ABAFIN</td>
                                                    <td>3.328</td>
                                                    <td>LIT</td>
                                                </tr>
                                                <tr>
                                                    <td>245000500001   </td>
                                                    <td>ACIDO CITRICO</td>
                                                    <td>0.333</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245000100059   </td>
                                                    <td>POLAR</td>
                                                    <td>0.665</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245100200012   </td>
                                                    <td>BAYFOLAN</td>
                                                    <td>9.850</td>
                                                    <td>LIT</td>
                                                </tr>
                                                <tr>
                                                    <td>245000500005   </td>
                                                    <td>BREAK THRU</td>
                                                    <td>0.333</td>
                                                    <td>LIT</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4066" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4066');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3852</td>
                                <td>29/11/2019</td>
                                <td>CUBRIR RACIMO HU 08</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>29/11/2019</td>
                                <td>JUAN QUISPE</td>
                                <td>PAPEL CUBRE RACIMO</td>
                                <td>MANUEL OLAECHEA</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4066" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4066');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4066" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4066');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl103$hdfValue" id="Body_GvList_hdfValue_101" value="0" />

                                    <div id="div_4066" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_101" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255900400001</td>
                                                    <td>BOLSA DE PAPEL CUBRERACIMO IMPERMEABLE</td>
                                                    <td>15000.000</td>
                                                    <td>MILL</td>
                                                </tr>
                                                <tr>
                                                    <td>256100400004</td>
                                                    <td>BIDON DE AGUA</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4067" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4067');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3853</td>
                                <td>29/11/2019</td>
                                <td>MOTO RIEGO</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>29/11/2019</td>
                                <td>JUAN QUISPE</td>
                                <td>LLANTA TRASERA MOTO LINEAL PLACA 4653 JA</td>
                                <td>MANUEL OLAECHEA</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4067" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4067');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4067" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4067');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl104$hdfValue" id="Body_GvList_hdfValue_102" value="0" />

                                    <div id="div_4067" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_102" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255600400146</td>
                                                    <td>LLANTA POSTERIOR 90-90-18</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4068" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4068');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3854</td>
                                <td>30/11/2019</td>
                                <td>CUBRIR RACIMO HU 08</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>30/11/2019</td>
                                <td>JUAN QUISPE</td>
                                <td>BOLSAS CUBRE RACIMO</td>
                                <td>MANUEL OLAECHEA</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4068" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4068');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4068" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4068');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl105$hdfValue" id="Body_GvList_hdfValue_103" value="0" />

                                    <div id="div_4068" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_103" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255900400001</td>
                                                    <td>BOLSA DE PAPEL CUBRERACIMO IMPERMEABLE</td>
                                                    <td>15000.000</td>
                                                    <td>MILL</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4069" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4069');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3855</td>
                                <td>02/12/2019</td>
                                <td>OFICINA UVA</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>02/12/2019</td>
                                <td>JUAN QUISPE</td>
                                <td>2 LAPICEROS</td>
                                <td>MANUEL OLAECHEA</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4069" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4069');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4069" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4069');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl106$hdfValue" id="Body_GvList_hdfValue_104" value="0" />

                                    <div id="div_4069" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_104" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>256100300013</td>
                                                    <td>LAPICERO</td>
                                                    <td>2.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4070" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4070');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3856</td>
                                <td>02/12/2019</td>
                                <td>CUBRIR RACIMO HU 08</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>02/12/2019</td>
                                <td>JUAN QUISPE</td>
                                <td>BOLSAS CUBRE RACIMO- CALCULADORA-REGLA</td>
                                <td>MANUEL OLAECHEA</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4070" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4070');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4070" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4070');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl107$hdfValue" id="Body_GvList_hdfValue_105" value="0" />

                                    <div id="div_4070" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_105" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255900400001</td>
                                                    <td>BOLSA DE PAPEL CUBRERACIMO IMPERMEABLE</td>
                                                    <td>3000.000</td>
                                                    <td>MILL</td>
                                                </tr>
                                                <tr>
                                                    <td>256100300062</td>
                                                    <td>CALCULADORA</td>
                                                    <td>3.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>256100300033</td>
                                                    <td>REGLA DE 30 CM</td>
                                                    <td>2.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4071" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4071');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3857</td>
                                <td>05/12/2019</td>
                                <td>HUARANGAL UVA</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>05/12/2019</td>
                                <td>JUAN QUISPE</td>
                                <td>AGUA Y JUNCO</td>
                                <td>MANUEL OLAECHEA</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4071" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4071');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4071" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4071');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl108$hdfValue" id="Body_GvList_hdfValue_106" value="0" />

                                    <div id="div_4071" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_106" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>256100400004</td>
                                                    <td>BIDON DE AGUA</td>
                                                    <td>20.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255900400002</td>
                                                    <td>JUNCOS</td>
                                                    <td>10.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4077" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4077');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3859</td>
                                <td>05/12/2019</td>
                                <td>&nbsp;</td>
                                <td>ALMACEN GENERAL EXPORTS</td>
                                <td>05/12/2019</td>
                                <td>CESAR CUEVA</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4077" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4077');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4077" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4077');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl109$hdfValue" id="Body_GvList_hdfValue_107" value="0" />

                                    <div id="div_4077" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_107" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255100100017</td>
                                                    <td>BROCA&#160;8 MM DE CONCRETO</td>
                                                    <td>2.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255100100003</td>
                                                    <td>BROCA 5/16&quot; DE FIERRO</td>
                                                    <td>2.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255100100009</td>
                                                    <td>BROCA 3/16&quot; PARA METAL</td>
                                                    <td>2.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                                <tr>
                                                    <td>255100100010</td>
                                                    <td>BROCA 3/8&quot; PARA FIERRO</td>
                                                    <td>2.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4078" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4078');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3860</td>
                                <td>05/12/2019</td>
                                <td>CAMBIO DE BOMBA DE AGUA </td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>05/12/2019</td>
                                <td>JOSE LUIS CHACALIZA ORELLANA</td>
                                <td>CAMBIO DE BOMBA PARA CAMIONETA MASDA B7G. 863</td>
                                <td>MANUEL OLAECHEA</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4078" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4078');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4078" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4078');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl110$hdfValue" id="Body_GvList_hdfValue_108" value="0" />

                                    <div id="div_4078" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_108" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255600400431</td>
                                                    <td>BOMBA DE AGUA PARA TRACTOR</td>
                                                    <td>1.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4080" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4080');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3862</td>
                                <td>05/12/2019</td>
                                <td>POR COMPRA TIJERA ARS PARA COSECHA </td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>05/12/2019</td>
                                <td>JOSE LUIS CHACALIZA ORELLANA</td>
                                <td>TIJERA ARS PARA COSECHA DE LA UVA </td>
                                <td>MANUEL OLAECHEA</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4080" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4080');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4080" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4080');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl111$hdfValue" id="Body_GvList_hdfValue_109" value="0" />

                                    <div id="div_4080" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_109" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>255900600020</td>
                                                    <td>TIJERAS DE COSECHA</td>
                                                    <td>50.000</td>
                                                    <td>UNID</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4083" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4083');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3865</td>
                                <td>05/12/2019</td>
                                <td>APLICACION FERTIRRIEGO LOTE HU-05</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>05/12/2019</td>
                                <td>ALEX PILLACA</td>
                                <td>APLICACION FERTIRRIEGO.</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4083" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4083');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4083" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4083');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl112$hdfValue" id="Body_GvList_hdfValue_110" value="0" />

                                    <div id="div_4083" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_110" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100024   </td>
                                                    <td>NITRATO DE MAGNESIO</td>
                                                    <td>112.200</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100022   </td>
                                                    <td>NITRATO DE AMONIO</td>
                                                    <td>37.070</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4084" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4084');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3866</td>
                                <td>05/12/2019</td>
                                <td>APLICACION FERTIRRIEGO LOTE HU-02</td>
                                <td>ALM. HUARANGAL DE UVA</td>
                                <td>05/12/2019</td>
                                <td>ALEX PILLACA</td>
                                <td>APLICACION FERTIRRIEGO.</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4084" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4084');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4084" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4084');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl113$hdfValue" id="Body_GvList_hdfValue_111" value="0" />

                                    <div id="div_4084" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_111" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100022   </td>
                                                    <td>NITRATO DE AMONIO</td>
                                                    <td>41.430</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245200100024   </td>
                                                    <td>NITRATO DE MAGNESIO</td>
                                                    <td>124.400</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4089" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4089');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3868</td>
                                <td>05/12/2019</td>
                                <td>FERTILIZANTE DE SUELOS.</td>
                                <td>ALM. GABRIELAS</td>
                                <td>05/12/2019</td>
                                <td>JUAN CCERHUAYO</td>
                                <td>PARA EL LOTE 4.</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4089" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4089');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4089" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4089');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl114$hdfValue" id="Body_GvList_hdfValue_112" value="0" />

                                    <div id="div_4089" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_112" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100022   </td>
                                                    <td>NITRATO DE AMONIO</td>
                                                    <td>86.400</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4090" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4090');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3869</td>
                                <td>04/12/2019</td>
                                <td>LOTE HC-01,02,03, LOTE 04 ES ARCE</td>
                                <td>ALM. HUARANGAL CITRICO</td>
                                <td>04/12/2019</td>
                                <td>VICTOR ESCATE</td>
                                <td>FERTIRRIEGO CITRICO</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4090" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4090');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4090" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4090');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl115$hdfValue" id="Body_GvList_hdfValue_113" value="0" />

                                    <div id="div_4090" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_113" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245200100054</td>
                                                    <td>ENERGYPHOS</td>
                                                    <td>106.160</td>
                                                    <td>LIT</td>
                                                </tr>
                                                <tr>
                                                    <td>245200100054</td>
                                                    <td>ENERGYPHOS</td>
                                                    <td>91.440</td>
                                                    <td>LIT</td>
                                                </tr>
                                                <tr>
                                                    <td>245200100054</td>
                                                    <td>ENERGYPHOS</td>
                                                    <td>78.880</td>
                                                    <td>LIT</td>
                                                </tr>
                                                <tr>
                                                    <td>245200100054</td>
                                                    <td>ENERGYPHOS</td>
                                                    <td>16.160</td>
                                                    <td>LIT</td>
                                                </tr>
                                                <tr>
                                                    <td>245200100054</td>
                                                    <td>ENERGYPHOS</td>
                                                    <td>35.600</td>
                                                    <td>LIT</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btn_4092" role="button" data-hide="true"
                                        href="JavaScript:divexpandcollapse('div_4092');"><i class="fa fa-plus"></i></a>
                                </td>
                                <td>SFE</td>
                                <td>001-3870</td>
                                <td>05/12/2019</td>
                                <td>LOTE ES 02,03;LP-01,02,03</td>
                                <td>ALM. HUARANGAL CITRICO</td>
                                <td>05/12/2019</td>
                                <td>VICTOR ESCATE</td>
                                <td>FERTIRRIEGO CITRICO</td>
                                <td>&nbsp;</td>
                                <td>
                                    <a class="mybtn btn-outline-primary" id="btnAc_4092" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveCheck('btnAc_4092');"><i class="fa fa-check"></i></a>
                                    <a class="mybtn btn-outline-primary" id="btnRe_4092" role="button"
                                        data-value="2" data-active="false"
                                        href="JavaScript:ActiveUnCheck('btnRe_4092');"><i class="fa fa-times"></i></a>
                                    <input type="hidden" name="ctl00$Body$GvList$ctl116$hdfValue" id="Body_GvList_hdfValue_114" value="0" />

                                    <div id="div_4092" style="display: none;">
                                        <div>
                                            <table class="table-sm ChildGrid" cellspacing="0" rules="all" border="1" id="Body_GvList_grdViewOrdersOfCustomer_114" style="border-collapse: collapse;">
                                                <tr>
                                                    <th scope="col">Codigo</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">U. M.</th>
                                                </tr>
                                                <tr>
                                                    <td>245100200046   </td>
                                                    <td>TRADECORP ZN</td>
                                                    <td>20.700</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245100200046   </td>
                                                    <td>TRADECORP ZN</td>
                                                    <td>25.260</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245100200046   </td>
                                                    <td>TRADECORP ZN</td>
                                                    <td>28.080</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245100200046   </td>
                                                    <td>TRADECORP ZN</td>
                                                    <td>27.990</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245100200046   </td>
                                                    <td>TRADECORP ZN</td>
                                                    <td>10.050</td>
                                                    <td>KG  </td>
                                                </tr>
                                                <tr>
                                                    <td>245100200046   </td>
                                                    <td>TRADECORP ZN</td>
                                                    <td>20.070</td>
                                                    <td>KG  </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
