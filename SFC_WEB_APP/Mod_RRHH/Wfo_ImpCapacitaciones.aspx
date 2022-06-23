<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ImpCapacitaciones.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_ImpCapacitaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        table { margin-top: 20px; border-collapse: collapse; display: none; }
        table th, table td { border: 1px solid #000; padding: 5px 10px; }
    </style>

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
            padding: 0.45rem 1rem;
            font-size: 12px
        }

        .table td {
            padding: 0.45rem 0.45rem !important;
            font-size: 12px
        }

        .bolded {
            font-weight: bold;
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
        <div class="row">
<%--        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
                            <input type="file" id="excelfile" />
            <button type="button" id="viewfile" name="viewfile" class="btn btn-secondary col-12" onclick="ExportToTable()" >
                <i class="fa fa-search"></i>Export To Table
            </button>
        </div>--%>

        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnAdd">&nbsp;</label>
            <div class="input-group" class="custom-file">
            <input type="file" class="custom-file-input form-control main-search" id="excelfile" name="excelfile" size="5120" haccept="image/*" required>
            <label class="custom-file-label" for="customFile" style="text-align: left">Seleccionar Archivo xls</label>
            </div>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnBusc">&nbsp;</label>
            <button type="button" id="viewfile" name="viewfile" class="btn btn-secondary col-12" onclick="ExportToTable()" >
                <i class="fa fa-search"></i>Exportar Excel
            </button>
        </div>
        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
            <label for="btnAdd">&nbsp;</label>
            <button type="button" id="btnSend" class="btn btn-success col-12" >
                <i class="fa fa-send"></i>Importar Informacion
            </button>
        </div>
        <%--        <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
            <asp:Image ID="loaddata" runat="server" ImageUrl="~/Img/loading.gif" AlternateText="kyocode" />
        </div>--%>
    </div>
    <!-- Excel - Cell background table -->
    <section id="cell-background">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">IMPORTAR CAPACITACIONES</h4>
                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li id="btn-excel" style="display: none"><a id='excelExport' title="Exportar en Excel"><i class="fas fa-file-excel"></i></a></li>
                                <li id="btn-add-div" style="/*display: none*/"><a id='btn-add' title="Importar Tabla" data-toggle="modal"><i class="fas fa-plus"></i></a></li>
                                <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body card-dashboard">
                            <table id="exceltable" class="table table-striped table-bordered dataex-html5-background" style="width: 100%">
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



            <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.7.7/xlsx.core.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xls/0.7.4-a/xls.core.min.js"></script>

    <script type="text/javascript">

        $(".custom-file-input").on("change", function () {
            var fileName = $(this).val().split("\\").pop();
            var caracteres = fileName.length;
            if (caracteres <= 15) {
                var name = fileName;
            } else if (caracteres <= 20){
                var name = fileName.substring(0, 10) + fileName.substring(5, -1);
            } else {
                var name = fileName.substring(0, 10) + fileName.substring(10, -1);
            }
            

            $(this).siblings(".custom-file-label").addClass("selected").html(name);
        });


        function ExportToTable() {
            $('#exceltable').html('');
            var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.xlsx|.xls)$/;
            /*Checks whether the file is a valid excel file*/
            if (regex.test($("#excelfile").val().toLowerCase())) {
                var xlsxflag = false; /*Flag for checking whether excel is .xls format or .xlsx format*/
                if ($("#excelfile").val().toLowerCase().indexOf(".xlsx") > 0) {
                    xlsxflag = true;
                }
                /*Checks whether the browser supports HTML5*/
                if (typeof (FileReader) != "undefined") {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var data = e.target.result;
                        /*Converts the excel data in to object*/
                        if (xlsxflag) {
                            var workbook = XLSX.read(data, { type: 'binary' });
                        }
                        else {
                            var workbook = XLS.read(data, { type: 'binary' });
                        }
                        /*Gets all the sheetnames of excel in to a variable*/
                        var sheet_name_list = workbook.SheetNames;

                        var cnt = 0; /*This is used for restricting the script to consider only first sheet of excel*/
                        sheet_name_list.forEach(function (y) { /*Iterate through all sheets*/
                            /*Convert the cell value to Json*/
                            if (xlsxflag) {
                                var exceljson = XLSX.utils.sheet_to_json(workbook.Sheets[y]);
                            }
                            else {
                                var exceljson = XLS.utils.sheet_to_row_object_array(workbook.Sheets[y]);
                            }
                            if (exceljson.length > 0 && cnt == 0) {
                                BindTable(exceljson, '#exceltable');
                                cnt++;
                            }
                        });
                        $('#exceltable').show();
                        $('#exceltable').addClass('table');
                        //setTimeout(function () { cargatabla(); }, 3000);

                    }
                    if (xlsxflag) {/*If excel file is .xlsx extension than creates a Array Buffer from excel*/
                        reader.readAsArrayBuffer($("#excelfile")[0].files[0]);
                    }
                    else {
                        reader.readAsBinaryString($("#excelfile")[0].files[0]);
                    }
                }
                else {
                    alert("Sorry! Your browser does not support HTML5!");
                }
            }
            else {
                alert("¡Sube un archivo Excel válido!");
            }
        }

        function BindTable(jsondata, tableid) {/*Function used to convert the JSON array to Html Table*/
            var columns = BindTableHeader(jsondata, tableid); /*Gets all the column headings of Excel*/
            for (var i = 0; i < jsondata.length; i++) {
                var row$ = $('<tr/>');
                for (var colIndex = 0; colIndex < columns.length; colIndex++) {
                    var cellValue = jsondata[i][columns[colIndex]];
                    if (cellValue == null)
                        cellValue = "";
                
                    if (cellValue.includes(":")) {
                        if (cellValue.includes("/")) {
                            cellValue = format_date(cellValue);
                        }
                    }
                    row$.append($('<td/>').html(cellValue));
                }
                $(tableid).append(row$);
              //  console.log(row$[0])
            }
        }
        function BindTableHeader(jsondata, tableid) {/*Function used to get all column names from JSON and bind the html table header*/
            var columnSet = [];
            var headerTr$ = $('<tr/>');
            for (var i = 0; i < jsondata.length; i++) {
                var rowHash = jsondata[i];
                for (var key in rowHash) {
                    if (rowHash.hasOwnProperty(key)) {
                        if ($.inArray(key, columnSet) == -1) {/*Adding each unique column names to a variable array*/
                            columnSet.push(key);
                            headerTr$.append($('<th/>').html(key));
                        }
                    }
                }
            }
            $(tableid).append(headerTr$);
            return columnSet;
        }
        
        function format_date(initialDate) {
           //Dividimos la fecha primero utilizando el espacio para obtener solo la fecha y el tiempo por separado
            var splitDate = initialDate.split(" ");

           var date = splitDate[0].split("/");
            var time = splitDate[1].split(":");
           // Obtenemos los campos individuales para todas las partes de la fecha
            var dd = "0"+date[0];
            var mm = "0"+date[1];
            var yyyy = date[2];
            var hh = "0"+time[0];
            var min = "0"+time[1];
           var ss = '00';
           // Creamos la fecha con Javascript
          // var fecha = new Date(yyyy, mm, dd, hh, min, ss);

           // De esta manera se puede volver a convertir a un string
           var formattedDate = ( dd.slice(-2)) + '/' + (mm.slice(-2)) + '/' + yyyy + ' ' + (hh.slice(-2)) + ':' + (min.slice(-2)) + ':' + (ss.slice(-2));

           return formattedDate

       };

        $(document).on('click', '#btnSend', function (event) {
            event.preventDefault();
            var obj2 = new Object();
            $('#modalSend-body').html('<span colspan="14" class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>ENVIANDO INFROMACION...</span>');
            $('#modalSend-btn').hide();
            i = 0;
            j = 0;
            $("#exceltable tr").each(function (index) {
                var campo1, campo2, campo3, campo4, campo5, campo6, campo7, campo8, campo9, campo10;
                $(this).find("td").each(function (index2) {
                    switch (index2) {
                        case 0:
                            campo1 = $(this).html();
                            break;
                        case 1:
                            campo2 = $(this).html();
                            break;
                        case 2:
                            campo3 = $(this).html();
                            break;
                        case 3:
                            campo4 = $(this).html();
                            break;
                        case 4:
                            campo5 = $(this).html();
                            break;
                        case 5:
                            campo6 = $(this).html();
                            break;
                        case 6:
                            campo7 = $(this).html();
                            break;
                        case 7:
                            campo8 = $(this).html();
                            break;
                        case 8:
                            campo9 = $(this).html();
                            break;
                        case 9:
                            campo10 = $(this).html();
                            break;
                    }

                });
                    if (campo1 != '' && campo2 != '' && campo3 != '' && campo4 != '' && campo5 != '' && campo6 != '' && campo7 != '' && campo8 != null && campo9 != null && campo10 != null) {
                    var obj = new Object();
                    obj.vcIdEmpresa = fuGetCdEmpre();
                        obj.vcCodigo = campo1;
                        obj.vcType = campo2;
                        obj.vcLugar = campo3;
                        obj.vcNombre = campo4;
                        obj.vcDetalle = campo5;
                        obj.vcExpositor = campo6;
                        obj.vcEstado = campo7;
                        obj.vcFecha = campo8;
                        obj.vcFechaFin = campo9;
                        obj.vcDuracion = campo10;
                        i++
                        j++
                        obj2[i] = obj;
                        //console.log('"' + campo1 + '","' + campo2 + '","' + campo3 + '","' + campo4 + '","' + campo5 + '","' + campo6 + '","' + campo7 + '","' + campo8 + '","' + campo9 + '","' + campo10+'"')




                   
                } else {
                    toastr.warning('verificar', 'INFORMACION INCOMPLETA');
                    //if (index === (len - 1)) {
                    //    var tx = setTimeout(function () { toastr.success('', 'ENVIO TERMINADO'); }, 2000);
                    //    var ttx = setTimeout(function () { cargatabla() }, 2000);
                    //    $('#modalSend').modal('hide')
                    //};
                }

 

            });
            declare(obj2, 1, j)
        });



        function declare(obj, nums, max) {
            if (nums <= max) {
                $.ajax({
                    type: 'POST',
                    url: "../SerRRHH.asmx/RegiCapacitacionesNis",
                    data: JSON.stringify({ obj: obj[nums] }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst[0].duplicado == 1) {
                            toastr.success(nums + ' Registro de ' + lst[0].APENOM + ' - Correcto  - cod:' + lst[0].IDOTROSDOCUMENTOS);
                            // $("#exceltable tr" + nums).remove();
                            document.getElementById("exceltable").deleteRow(1);
                        } else if (lst[0].duplicado == 2) { 
                            toastr.error(nums + ' Registro de ' + lst[0].dni + ' - Duplicado  - fecha:' + lst[0].ini + ' hasta' + lst[0].fin);
                        }
                    }, error: function (data) {
                        toastr.error(JSON.stringify(data), 'ERROR EN REGISTRO');
                    },
                    complete: function (data) {
                        nums = nums + 1;
                        declare(obj, nums, max)
                    }
                });


            }

        }


    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
