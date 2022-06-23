<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_Reporte_TR.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Wfo_Reporte_TR" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #chart-container {
            width: 100%;
            height: auto;
        }

        table {
            border-spacing: 0;
            border-collapse: collapse;
            width: 100%;
            margin: 0 auto;
        }

        .table th {
            padding: 0.65rem 1.5rem;
            font-size: 12px;
            vertical-align: middle;
        }

        .table td {
            padding: 0rem 0rem !important;
            font-size: 12px;
            vertical-align: middle;
        }
    </style>
        <!-- BEGIN: Vendor CSS-->

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-12" style="font-size: 16px;">
                <table id="tblSeleccion" style="width: 100%; text-align: center; margin-bottom: 0px" border="1" class="table">
                    <tbody>
                        <tr>
                            <td colspan="4">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-content">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-6 col-12 border-right-blue-grey border-right-lighten-3">
                                                        <div class="float-left pl-2">
                                                            <span class="font-large-3 text-bold-300 primary">589</span>
                                                        </div>
                                                        <div class="float-left mt-2 ml-1">
                                                            <span class="blue-grey darken-1 block">New</span>
                                                            <span class="blue-grey darken-1 block">Products</span>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-12 border-right-blue-grey border-right-lighten-3">
                                                        <div class="float-left pl-2">
                                                            <span class="font-large-3 text-bold-300 danger">765</span>
                                                        </div>
                                                        <div class="float-left mt-2 ml-1">
                                                            <span class="blue-grey darken-1 block">New</span>
                                                            <span class="blue-grey darken-1 block">Clients</span>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-12 border-right-blue-grey border-right-lighten-3">
                                                        <div class="float-left pl-2">
                                                            <span class="font-large-3 text-bold-300 success">693</span>
                                                        </div>
                                                        <div class="float-left mt-2 ml-1">
                                                            <span class="blue-grey darken-1 block">New</span>
                                                            <span class="blue-grey darken-1 block">Orders</span>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-12">
                                                        <div class="float-left pl-2">
                                                            <span class="font-large-3 text-bold-300 warning">946</span>
                                                        </div>
                                                        <div class="float-left mt-2 ml-1">
                                                            <span class="blue-grey darken-1 block">New</span>
                                                            <span class="blue-grey darken-1 block">Visitors</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td colspan="2">
                                <div class="col-xl-4 col-lg-6 col-12">
                                    <div class="card">
                                        <div class="card-content">
                                            <div class="card-body">
                                                <div class="media d-flex">
                                                    <div class="align-self-center">
                                                        <div id="sp-stacked-bar-total-sales">
                                                            <canvas width="124" height="30" style=" width: 124px; height: 30px; vertical-align: top;"></canvas>
                                                        </div>
                                                    </div>
                                                    <div class="media-body media-right text-right">
                                                        <h3>$45,668</h3>
                                                        <span class="text-muted">Total Sales</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <!-- END: Theme JS-->

    <script>
        function LoadData() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdGrupo = '3';
            obj.vcFecha = ' ';
            if (obj.vnIdGrupo != -1) {
                $.ajax({
                    type: 'POST',
                    url: "../SerProd.asmx/ListRendimientoProcesoRegistroRT",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        var vLin = "";
                        //lst[i].cLabor
                        /*cDescAGrupo
                        supervisor
                        seleccion
                        embalaje
                        totalpersonas
                        cajas
                        HORAS
                        cajashora
                        cajashorapersonal
                        Productor
                        Presentacion
                        inicio
                        fin*/
                        for (i = 0; i < lst.length; ++i) {
                            if (lst[i].cDescAGrupo != '') {
                                vLin += "<tr>";
                                vLin += "<td>" + lst[i].cDescAGrupo + "</td>";
                                /*vLin += "<td><i class='fas fa-id-badge'></i> Seleccion " + lst[i].seleccion + "<br>"; */

                                vLin += "<td><div class='card'><div class='card-content'><div class='media align-items-stretch'><i class='fas fa-users'></i>"
                                vLin += "</div><div class='p-2 bg-danger white media-body'><h5>Seleccion</h5><h5 class='text-bold-400 mb-0'>" + lst[i].seleccion + "</h5></div></div></div></div>"

                                vLin += "<i class='fa fa-id-badge'></i> Embalaje " + lst[i].embalaje + "</td>";
                                vLin += "<td><i class='fas fa-users'></i> " + lst[i].totalpersonas + "</td>";
                                vLin += "<td><i class='fas fa-boxes'></i> " + lst[i].cajas + "</td>";
                                vLin += "<td><i class='fas fa-box-open'></i> " + lst[i].Presentacion + "</td>";

                                vLin += "<td><i class='fas fa-street-view'></i> " + lst[i].supervisor + "</td>";
                                vLin += "</tr>";
                            } else {
                            }
                        }
                        $("#tblSeleccion tbody").html(vLin);
                    }
                });
            }
            obj = null
        }
        LoadData();
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
