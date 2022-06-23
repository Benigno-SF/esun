<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_Costeo.aspx.cs" Inherits="SFC_WEB_APP.Mod_Admi.Wfo_Costeo" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/datatables.min.css">
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/buttons.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="../Scripts/dt/buttons.bootstrap4.min.css">
    <!-- END: Vendor CSS-->
    <style>
        table {
            border-spacing: 0;
            border-collapse: collapse;
            width: 100%;
            margin: 0 auto;
        }

        .table th {
            padding: 0.3rem 0.3rem !important;
            font-size: 12px
        }

        .table td {
            padding: 0.2rem 0.2rem !important;
            font-size: 12px
        }

        /* Círculos de colores numerados */
        .circulo_red {
            width: 0.7rem;
            height: 0.7rem;
            border-radius: 50%;
            background: red;
            display: flex;
            margin: 0px auto;
            color: red;
        }

        .circulo_green {
            width: 0.7rem;
            height: 0.7rem;
            border-radius: 50%;
            background: #79e04e;
            display: flex;
            margin: 0px auto;
            color: green;
        }

        .circulo_ambar {
            width: 0.7rem;
            height: 0.7rem;
            border-radius: 50%;
            background: #ffd800;
            display: flex;
            margin: 0px auto;
            color: #ffd800;
        }

        .text_rigth {
            text-align: right;
        }
    </style>
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

        .dataTables_wrapper .dataTables_filter {
            float: right;
            text-align: right;
            visibility: hidden;
            display: none
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="contdist-tab" data-toggle="tab" href="#contdist" role="tab" aria-controls="contdist" aria-selected="true">COSTOS CONT - DIST</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">COSTO FINAL</a>
        </li>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="contdist" role="tabpanel" aria-labelledby="contdist-tab">

            <asp:UpdatePanel runat="server" ID="UpdatePanel1" style="width: -webkit-fill-available;" class="col-md-12">
                <ContentTemplate>
                    <div class="row" style="display: flex;">
                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <label for="ddlAnio" class="col-form-label">Año</label>
                            <asp:DropDownList ID="ddlAnio" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAnio_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <label for="ddlPeriodo" class="col-form-label">Periodo</label>
                            <asp:DropDownList ID="ddlPeriodo" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <label for="btnRec" class="col-form-label">&nbsp;</label>
                            <button type="button" id="btnRec" runat="server" class="btn btn-secondary col-12" onserverclick="btnRec_ServerClick">
                                <i class="fa fa-search"></i>Recuperar
                            </button>
                        </div>
                        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-4">
                            <label for="btnRec" class="col-form-label">&nbsp;</label>
                            <label></label>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlAnio" />
                </Triggers>
            </asp:UpdatePanel>


            <section id="cell-background" style="display: none">
                <div class="row">
                    <div class="col-6">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Reporte Contabilidad - Distribucion</h4>
                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                <div class="heading-elements">
                                    <ul class="list-inline mb-0">
                                        <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-content collapse show">
                                <div class="card-body card-dashboard">
                                    <table id="table-dist" class="table table-striped table-bordered dataex-html5-background " width="100%">
                                        <thead>
                                            <tr>
                                                <th>CLASE</th>
                                                <th>CONTABILIDAD</th>
                                                <th>DISTRIBUCION</th>
                                                <th>DIF</th>
                                                <th>ESTADO</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td></td>
                                                <td id="cont"></td>
                                                <td id="dis"></td>
                                                <td id="dif"></td>
                                                <td></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Reporte Detallado</h4>
                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                <div class="heading-elements">
                                    <ul class="list-inline mb-0">
                                        <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-content collapse show">
                                <div class="card-body card-dashboard">
                                    <asp:UpdatePanel ID="UpdGv" runat="server">
                                        <ContentTemplate>
                                            <div id="dvGv" class="center-block">
                                                <div class="table table-responsive-sm">
                                                    <asp:GridView ID="GvList" runat="server" AutoGenerateColumns="false" CssClass="bgtbl"
                                                        EmptyDataText="No se encontraron datos" ShowHeaderWhenEmpty="True" DataKeyNames="id"
                                                        OnRowDataBound="GvList_RowDataBound" OnDataBound="GvList_DataBound">
                                                        <Columns>
                                                            <asp:BoundField DataField="id" Visible="false" />
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <a class="mybtn btn-outline-primary" id="btn_<%# Eval("id") %>" role="button" data-hide="true"
                                                                        href="JavaScript:divexpandcollapse('div_<%# Eval("id") %>');"><i class="fa fa-plus"></i></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="CLASE" HeaderText="CLASE" />
                                                            <asp:BoundField DataField="importe" HeaderText="IMPORTE" />
                                                            <asp:TemplateField HeaderText="">
                                                                <ItemTemplate>
                                                                    <asp:HiddenField runat="server" ID="hdfValue" Value="0" />

                                                                    <div id="div_<%# Eval("id") %>" style="display: none;">
                                                                        <asp:GridView ID="grdViewOrdersOfCustomer" runat="server" AutoGenerateColumns="false"
                                                                            DataKeyNames="id" CssClass="table-sm ChildGrid">
                                                                            <Columns>
                                                                                <asp:BoundField DataField="iddet" Visible="false" />
                                                                                <asp:BoundField DataField="clase_o" HeaderText="CLASE" />
                                                                                <asp:BoundField DataField="importe" HeaderText="IMPORTE" />
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
                                            <asp:AsyncPostBackTrigger ControlID="btnRec" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </div>
        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">

            <asp:UpdatePanel runat="server" ID="UpdDLL1" style="width: -webkit-fill-available;" class="col-md-12">
                <ContentTemplate>
                    <div class="row">
                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <label for="ddlAnio1" class="col-form-label">Año</label>
                            <asp:DropDownList ID="ddlAnio1" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAnio_SelectedIndexChanged1"></asp:DropDownList>
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <label for="ddlPeriodo1" class="col-form-label">Periodo</label>
                            <asp:DropDownList ID="ddlPeriodo1" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                        </div>
                        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
                            <label for="btnRec1" class="col-form-label">&nbsp;</label>
                            <button type="button" id="btnRec1" class="btn btn-secondary col-12">
                                <i class="fa fa-search"></i>Recuperar
                            </button>
                        </div>
                        <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2" style="display: none" id="export1">
                            <label for="1" class="col-form-label">&nbsp;</label>
                            <button type="button" id="1" class="btn btn-danger col-12 export-pdf">
                                <i class="fa fa-file-pdf"></i>export pdf
                            </button>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlAnio1" />
                </Triggers>
            </asp:UpdatePanel>
            <div class="canvas_div_pdf1">
                <section id="cell-background1" style="display: none">
                    <div class="row">
                        <div class="col-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Reporte Final</h4>
                                    <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                    <div class="heading-elements">
                                        <ul class="list-inline mb-0">
                                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                            <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                                            <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                            <li><a data-action="close"><i class="ft-x"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-content collapse show">
                                    <div class="card-body card-dashboard">
                                        <table id="table-final" class="table table-striped table-bordered dataex-html5-background " width="100%">
                                            <thead>
                                                <tr>
                                                    <th>CLASE</th>
                                                    <th>TOTAL</th>
                                                    <th>PORCENTAJE</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                            <tfoot id="footerp">
                                                <tr>
                                                    <td></td>
                                                    <td id="tot"></td>
                                                    <td id="por"></td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div id="pie"></div>
                        </div>
                        <%--            <div class="col-sm-12">
              <div id="chart"></div>
            </div>--%>
                    </div>
                </section>
            </div>
        </div>
    </div>

    <!--/ Excel - Cell background table -->


    <!-- BEGIN: PageScripts/ Vendor JS -->
    <script src="../Scripts/dt/datatables.min.js"></script>
    <script src="../Scripts/dt/dataTables.buttons.min.js"></script>
    <script src="../Scripts/dt/buttons.bootstrap4.min.js"></script>
    <script src="../Scripts/dt/vfs_fonts.js"></script>
    <script src="../Scripts/dt/buttons.html5.min.js"></script>
    <!-- END: Page VScripts/endor JS-->


    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/no-data-to-display.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>
    <script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>

    <script>
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

        function loadSH() {

            var table = $('#<%=GvList.ClientID%>').DataTable({
                destroy: true,
                dom: 'Bfrtip',
                buttons: [
                    'copyHtml5',
                    'excelHtml5',
                ],
                "paging": false,
                "ordering": false,
                "info": false,
                orderCellsTop: false,
                fixedHeader: true,
                colReorder: true,
                searching: false,
                "columnDefs": [
                    {
                        "render": function (data, type, row) {
                            return formatNumber.new(data);
                        },
                        "targets": 2,
                         className: "text_rigth"
                    },
                    ]
            });
        };



        $(document).on('click', '#<%=btnRec.ClientID%>', function () {

            $('#cell-background').hide();
            cargatabla();
        });

        var cargatabla = function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcPeriodo = $('#<%=ddlPeriodo.ClientID%>').val();
            obj.vcAmbito = 1;
            if (obj.vcPeriodo != null && obj.vcPeriodo != 0) {
                $('#cell-background').show();
                $('#table-dist tbody').html('<tr><td colspan="14" class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</td><tr>');
                $.ajax({
                    type: 'POST',
                    url: "../SerAdmi.asmx/ListCosteo",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    error: function () {
                        $('#activos').hide();
                    },
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        var cont = 0;
                        var dis = 0;
                        var dif = 0;
                        var rr = 0;
                        var aa = 0;
                        var vv = 0;
                        for (var x = 0; x < lst.length; x++) {
                            cont = cont + lst[x].CONTABILIDAD;
                            dis = dis + lst[x].DISTRIBUCION;
                            dif = dif + lst[x].DIFERENCIA;

                            if (lst[x].SEMAFORO == "R") {
                                rr=rr+1
                            } else if (lst[x].SEMAFORO == "A") {
                                aa=aa+1
                            } else if (lst[x].SEMAFORO == "V") {
                                vv=vv+1
                            }
                        }
                        var list = [rr,aa,vv]
                        lm = mayor(list);
                        //alert(lm);


                        $('#cont').text(formatNumber.new(cont.toFixed(2)));
                        $('#dis').text(formatNumber.new(dis.toFixed(2)));
                        $('#dif').text(formatNumber.new(dif.toFixed(2)));

                        //   $.noConflict();
                        $('#table-dist tbody').fadeIn(1000).html('');
                        var table = $('#table-dist').DataTable({

                            destroy: true,
                            dom: 'Bfrtip',
                            buttons: [
                                'copyHtml5',
                                'excelHtml5',
                            ],
                            "paging": false,
                            "ordering": false,
                            "info": false,
                            responsive: true,
                            data: lst,
                            columns: [
                                { data: 'CLASE' },
                                {
                                    data: 'CONTABILIDAD',
                                    render: function (CONTABILIDAD) {
                                        return formatNumber.new(CONTABILIDAD.toFixed(2));
                                    },
                                    className: "text_rigth"
                                },
                                {
                                    data: 'DISTRIBUCION',
                                    render: function (DISTRIBUCION) {
                                        return formatNumber.new(DISTRIBUCION.toFixed(2));
                                    },
                                    className: "text_rigth"
                                },
                                {
                                    data: 'DIFERENCIA',
                                    render: function (DIFERENCIA) {
                                        return formatNumber.new(DIFERENCIA.toFixed(2));
                                    },
                                    className: "text_rigth"
                                },
                                {
                                    data: 'SEMAFORO',
                                    render: function (SEMAFORO) {
                                        if (SEMAFORO == "R") {
                                            return '<div class="circulo_red"></div >';
                                        } else if (SEMAFORO == "A") {
                                            return '<div class="circulo_ambar"></div >';
                                        } else if (SEMAFORO == "V") {
                                            return '<div class="circulo_green"></div >';
                                        }

                                    }
                                }
                            ],
                            language: {
                                "processing": "<img src='../img/loading.gif' />"
                            },
                        });

                        //$('#cell-background').show();
                        //  var t = $('.dataex-html5-background tbody').prepend('<tr role="row" class="odd"><td tabindex="0"></td><td></td><td></td><td></td><td>' + d1 + '</td><td>' + d2 + '</td><td>' + d3 + '</td><td>' + d4 + '</td><td>' + d5 + '</td><td>' + d6 + '</td><td>' + d7 + '</td><td></td></tr>');
                    }
                });
            } else {
                ShowToast("error", "Error...", "Seleccione Periodo");
            }
        }

        $(document).on('click', '#btnRec1', function () {
            $('#export1').hide();
            $('#footerp').hide();
            $('#cell-background1').show();
            cargatabla1();
        });

        var cargatabla1 = function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcPeriodo = $('#<%=ddlPeriodo1.ClientID%>').val();
            obj.vcAmbito = 2;
            if (obj.vcPeriodo != null && obj.vcPeriodo != 0) {
            $('#table-final tbody').html('<tr><td colspan="14" class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</td><tr>');
            $.ajax({
                type: 'POST',
                url: "../SerAdmi.asmx/ListCosteo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                error: function () {
                    $('#activos').hide();
                },
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    var cont = 0;
                    var porcent = 0;
                    for (var x = 0; x < lst.length; x++) {
                        cont = cont + lst[x].CONTABILIDAD;
                    }
                    for (var x = 0; x < lst.length; x++) {
                        porcent = porcent + ((lst[x].CONTABILIDAD * 100) / cont);
                    }
                    $('#tot').text(formatNumber.new(cont.toFixed(2)));
                    $('#por').text(formatNumber.new(porcent.toFixed(2)) +'%');

                    //   $.noConflict();
                    $('#table-final tbody').fadeIn(1000).html('');
                    var table1 = $('#table-final').DataTable({

                        destroy: true,
                        dom: 'Bfrtip',
                        buttons: [
                            'copyHtml5',
                            'excelHtml5',
                        ],
                        "paging": false,
                        "ordering": false,
                        "info": false,
                        responsive: true,
                        data: lst,
                        columns: [
                            { data: 'CLASE' },
                            {
                                data: 'CONTABILIDAD',
                                render: function (CONTABILIDAD) {
                                    return formatNumber.new(CONTABILIDAD.toFixed(2));
                                },
                                className: "text_rigth"
                            },
                            {
                                data: 'CONTABILIDAD',
                                render: function (CONTABILIDAD) {
                                    return ((CONTABILIDAD * 100) / cont).toFixed(2) + '%';
                                },
                                className: "text_rigth"
                            }
                            //{
                            //    "targets": 0,
                            //    "data": "CONTABILIDAD",
                            //    "render": function (data, type, row, meta) {
                            //       // return '<a href="' + data + '">Download</a>';
                            //        return '<div class="progress p-0 m-0"><div class="progress-bar" role="progressbar" style="width: ' + ((data * 100) / cont).toFixed(2) + '%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div></div>' + ((data * 100) / cont).toFixed(2) + '%';;
                            //    }
                            //}
                        ],
                        language: {
                            "processing": "<img src='../img/loading.gif' />"
                        },
                    });
                    var tableData = getTableData(table1);
                    // create Highcharts
                    createHighcharts(tableData);
                    // table events
                    setTableEvents(table1);
                 //   $('#export1').show();
                    $('#footerp').show();
                    //$('#cell-background').show();
                    //  var t = $('.dataex-html5-background tbody').prepend('<tr role="row" class="odd"><td tabindex="0"></td><td></td><td></td><td></td><td>' + d1 + '</td><td>' + d2 + '</td><td>' + d3 + '</td><td>' + d4 + '</td><td>' + d5 + '</td><td>' + d6 + '</td><td>' + d7 + '</td><td></td></tr>');
                }
            });

        } else {
            ShowToast("error", "Error...", "Seleccione Periodo");
            }
        }

        var draw = false;


        function getTableData(table) {
            var dataArray = [],
                countryArray = [],
                populationArray = [],
                densityArray = [];
            ageArray = [];

            // loop table rows
            table.rows({
                search: "applied"
            }).every(function () {
                var data = this.data();
                countryArray.push(data['CLASE']);
                populationArray.push(parseInt(data['CONTABILIDAD']));
                densityArray.push(parseInt(data['DISTRIBUCION']));
                ageArray.push(parseInt(data['DIFERENCIA']));
            });

            // store all data in dataArray
            dataArray.push(countryArray, populationArray, densityArray, ageArray);

            return dataArray;
        }

        function createHighcharts(data) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ","
                }
            });

            var final = [];

            for (var i = 0; i < data[0].length; i++) {
                final.push({
                    name: data[0][i],
                    y: data[1][i]
                });
            }
            //Highcharts.chart("chart", {
            //    title: {
            //        text: "COSTEO"
            //    },
            //    subtitle: {
            //        text: ""
            //    },
            //    xAxis: [{
            //        categories: data[0],
            //        labels: {
            //            rotation: -45
            //        }
            //    }],
            //    yAxis: [{
            //        // first yaxis
            //        title: {
            //            text: "CONTABILIDAD"
            //        }
            //    },
            //    {
            //        // secondary yaxis
            //        title: {
            //            text: "DISTRIBUCION"
            //        },
            //        min: 0,
            //        opposite: true
            //    }
            //    ],


            //    series: [{
            //        name: "CONTABILIDAD",
            //        color: "#0071A7",
            //        type: "column",
            //        data: data[1],
            //        tooltip: {
            //            valueSuffix: " S/."
            //        }
            //    },
            //    {
            //        name: "DISTRIBUCION",
            //        color: "#68cc72",
            //        type: "column",
            //        data: data[2],
            //         tooltip: {
            //             valueSuffix: " S/."
            //        }
            //    },

            //    {
            //        name: "DIFERENCIA",
            //        color: "#FF404E",
            //        type: "spline",
            //        data: data[3],
            //        yAxis: 1,
            //        tooltip: {
            //            valueSuffix: " S/."
            //        }
            //    }
            //    ],

            //    tooltip: {
            //        shared: true
            //    },
            //    legend: {
            //        backgroundColor: "#ececec",
            //        shadow: true
            //    },
            //    credits: {
            //        enabled: false
            //    },
            //    noData: {
            //        style: {
            //            fontSize: "16px"
            //        }
            //    }
            //});


            Highcharts.chart('pie', {
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
                    text: 'COSTEO FINAL'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                            style: {
                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                            }
                        }
                    }
                },
                series: [{
                    name: "Brands",
                    colorByPoint: true,
                    data: final
                }]

            });

        }

        function setTableEvents(table) {
            // listen for page clicks
            table.on("page", function () {
                draw = true;
            });

            // listen for updates and adjust the chart accordingly
            table.on("draw", function () {
                if (draw) {
                    draw = false;
                } else {
                    var tableData = getTableData(table);
                    createHighcharts(tableData);
                }
            });
        }

        var formatNumber = {
            separador: ",", // separador para los miles
            sepDecimal: '.', // separador para los decimales
            formatear: function (num) {
                num += '';
                var splitStr = num.split('.');
                var splitLeft = splitStr[0];
                var splitRight = splitStr.length > 1 ? this.sepDecimal + splitStr[1] : '';
                var regx = /(\d+)(\d{3})/;
                while (regx.test(splitLeft)) {
                    splitLeft = splitLeft.replace(regx, '$1' + this.separador + '$2');
                }
                return this.simbol + splitLeft + splitRight;
            },
            new: function (num, simbol) {
                this.simbol = simbol || '';
                return this.formatear(num);
            }
        }
        $(document).on('click', '.export-pdf', function (e) {
            e.preventDefault();
            var xpc = $(this).attr('id');
            var HTML_Width = $(".canvas_div_pdf" + xpc).width();
            var HTML_Height = $(".canvas_div_pdf" + xpc).height();
            var top_left_margin = 15;
            var PDF_Width = HTML_Width + (top_left_margin * 2);
            var PDF_Height = (PDF_Width * 1.5) + (top_left_margin * 2);
            var canvas_image_width = HTML_Width;
            var canvas_image_height = HTML_Height;

            var totalPDFPages = Math.ceil(HTML_Height / PDF_Height) - 1;


            html2canvas($(".canvas_div_pdf" + xpc)[0], { allowTaint: true }).then(function (canvas) {
                canvas.getContext('2d');

                console.log(canvas.height + "  " + canvas.width);


                var imgData = canvas.toDataURL("image/jpeg", 1.0);
                var pdf = new jsPDF('p', 'pt', [PDF_Width, PDF_Height]);
                pdf.addImage(imgData, 'JPG', top_left_margin, top_left_margin, canvas_image_width, canvas_image_height);


                for (var i = 1; i <= totalPDFPages; i++) {
                    pdf.addPage(PDF_Width, PDF_Height);
                    pdf.addImage(imgData, 'JPG', top_left_margin, -(PDF_Height * i) + (top_left_margin * 4), canvas_image_width, canvas_image_height);
                }

                pdf.save("HTML-Document.pdf");
            });
        });

        function ShowToast(tipo, titulo, mensaje) {
            toastr.options = {
                tapToDismiss: false
                , timeOut: 5000
                , extendedTimeOut: 0
                , allowHtml: true
                , preventDuplicates: false
                , preventOpenDuplicates: false
                , newestOnTop: true
                , closeButton: true
                //, closeHtml: '<button class="btn-sm" style="background-color: grey; padding: 5px;">X</button>'
            }
            toastr[tipo](mensaje, titulo);
        }

        function mayor(lista) {
            var mayor = lista[0];
            for (i = 1; i < lista.length; i++) {
                if (lista[i] > mayor)
                    mayor = lista[i];
            }
            return mayor;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
