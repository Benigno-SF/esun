<%@ Page Language="C#"  MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="Wfo_RRHHExc.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_RRHHExc" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.css" rel="stylesheet"/>

    <!--LIBRERIA DE ANIMACION AGC-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.light.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.2.4/css/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.2.4/css/dx.light.css" />
    
    <link href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/buttons/2.1.0/css/buttons.dataTables.min.css" rel="stylesheet" />

    <script src="https://cdn.amcharts.com/lib/4/core.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

    <style>
        .my-fixed-item {
            position: fixed; /* Hacemos que la posición en pantalla sea fija para que siempre se muestre en pantalla*/
	        right: 0; /* Establecemos la barra en la izquierda */
	        top: 330px; /* Bajamos la barra 200px de arriba a abajo */
	        z-index: 2000;
            width:14%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">

    <div class="container animate__animated  animate__fadeInLeft">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header text-center">
                        <h4>CENTRO DE COSTOS - PERSONAL</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-2 mt-1">
                                <p><b>Cargar Excel:</b></p>
                            </div>
                            <div class="col-sm-4">
                                <input type="file" class="txtexcel form-control" id="txtexcel" name="txtexcel" size="5120" haccept="image/*"/>
                            </div>
                            <div class="col-sm-2">
                                <button type="button" class="btn btn-info" id="btnExportar" name="btnExportar">Importar <i class="fas fa-file-excel"></i></button>
                            </div>
                            <div class="col-sm-2">
                                <button type="button" class="btn btn-success" id="btnEnviarTable" name="btnEnviarTable">Enviar</button>
                            </div>
                            <div class="col-sm-1">
                                <button type="button" class="btn btn-danger" id="btnEliminar" name="btnEliminar">Eliminar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 animate__animated animate__slideInRight" style="margin-top:-10px;" id="div_totalfilas">
                <div class="card">
                    <div class="card-header">
                        <h4>Total de filas: </h4><h4 id="TotalFilas"></h4>                   
                    </div>
                </div>
            </div>
            <div class="col-sm-12 animate__animated animate__slideInRight" style="margin-top:-10px;" id="div_table_show">
                <div class="card">
                    <div class="card-body table-responsive">
                        <table class="table table-sm table-hover table-bordered"  id="tb_excel" name="tb_excel">
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="my-fixed-item container animate__animated animate__slideInRight" style="background:#0b1629;">
        <div class="row">
            <div class="col-sm-12">
               <%-- <h5 id="mdgcarga" class="p-4" style="color:white;">Esperando carga... </h5>--%>
            </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.7.7/xlsx.core.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xls/0.7.4-a/xls.core.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../Content/file.js"></script>

    <script>
        var columns;
        $("document").ready(function () {
            HiddenShow(true);
            $("#btnEnviarTable").attr("disabled", true);
        });

        function HiddenShow(bol) {
            $("#div_totalfilas").attr("hidden", bol);
            $("#div_table_show").attr("hidden", bol);
            
        }

        function HDBoton(ide, valor, bol) {
            if (ide == "attr") {
                $("#btnExportar").attr(valor, bol);
            } else {
                $("#btnExportar").removeAttr(valor, bol);
            }
            
        }

        $(".txtexcel").on("change", function (e) {
            
            $("#tb_excel").html('');
            HDBoton("remove","disabled", true);
            $("#TotalFilas").text("0");
            var fileName = $(this).val().split("\\").pop();
            var caracteres = fileName.length;
            if (caracteres <= 15) {
                var name = fileName;
            } else if (caracteres <= 20) {
                var name = fileName.substring(0, 10) + fileName.substring(5, -1);
            } else {
                var name = fileName.substring(0, 10) + fileName.substring(10, -1);
            }
            $(this).siblings(".txtexcel").addClass("selected").html(name);
        });

        $("#btnExportar").on("click", function (e) {
            
            var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.xlsx|.xls)$/;
            
            /*Checks whether the file is a valid excel file*/
            if (regex.test($("#txtexcel").val().toLowerCase())) {
                var xlsxflag = false; /*Flag for checking whether excel is .xls format or .xlsx format*/
                if ($("#txtexcel").val().toLowerCase().indexOf(".xlsx") > 0) {
                    xlsxflag = true;
                }
                /*Checks whether the browser supports HTML5*/
                if (typeof (FileReader) != "undefined") {
                    HDBoton("attr", "disabled", true);
                    $("#btnEnviarTable").removeAttr("disabled", true);
                    $("#mdgcarga").text("Esperando carga...");
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var data = e.target.result;
                        var cuenta = 0;
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
                            cuenta++;
                            if (xlsxflag) {
                                var exceljson = XLSX.utils.sheet_to_json(workbook.Sheets[y]);
                                
                            }
                            else {
                                var exceljson = XLS.utils.sheet_to_row_object_array(workbook.Sheets[y]);
                                
                            }
                            
                            if (exceljson.length > 0 && cnt == 0) {
                                BindTable(exceljson, '#tb_excel');
                                cnt++;
                            }
                        });
                        
                        HiddenShow(false);
                        $('#tb_excel').show();
                        $('#tb_excel').addClass('table-bordered');

                    }
                    if (xlsxflag) {/*If excel file is .xlsx extension than creates a Array Buffer from excel*/
                        reader.readAsArrayBuffer($("#txtexcel")[0].files[0]);
                    }
                    else {
                        reader.readAsBinaryString($("#txtexcel")[0].files[0]);
                    }
                }
                else {
                    alert("Sorry! Your browser does not support HTML5!");
                }
            }
            else {
                alert("¡Sube un archivo Excel válido!");
            }
        });

        function BindTable(jsondata, tableid) {/*Function used to convert the JSON array to Html Table*/
             columns = BindTableHeader(jsondata, tableid); /*Gets all the column headings of Excel*/
            for (var i = 0; i < columns.length; i++) {
                console.log('aqui ' + columns[i]);
            }
           
            for (var i = 0; i < jsondata.length; i++) {
                var row$ = $('<tr id="tr'+i+'"/>');
                for (var colIndex = 0; colIndex < columns.length; colIndex++) {
                    var cellValue = jsondata[i][columns[colIndex]];
                    if (cellValue == null)
                        cellValue = "";
                    //console.log("ANTES ");
                    //console.log(cellValue);

                    //LUIS HUARCAYA - SE QUITÓ EL SPLIT :
                    /*if (cellValue.includes(":")) {*/
                    
                        //console.log(cellValue);
                    if (cellValue.includes("/")) {
            
                            cellValue = format_date(cellValue);
                        }
            
                    row$.append($('<td/>').html(cellValue));
                }
                $(tableid).append(row$);
            }
            $("#TotalFilas").text(jsondata.length);
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

               //LH - 15-02-2022  
            //Dividimos la fecha primero utilizando el espacio para obtener solo la fecha y el tiempo por separado

            if (initialDate.length<=7) {
                //console.log("ANTES SPLIT");
                var splitDate = initialDate;
                //console.log("DESPUES SPLIT");
                var date = splitDate.split("/");
                // var time = splitDate[1].split(":");
                // Obtenemos los campos individuales para todas las partes de la fecha
                var dd = "0" + date[0];
                var mm = "0" + date[1];
                var yyyy = '20' + date[2];


                var hh = "00";
                var min = "00";
                var ss = '00';
                // Creamos la fecha con Javascript
                // var fecha = new Date(yyyy, mm, dd, hh, min, ss);
                //console.log(dd+""+mm+""+yyyy);
                // De esta manera se puede volver a convertir a un string

                // LUIS HUARCAYA 15-02-2022
                var formattedDate = (dd.slice(-2)) + '/' + (mm.slice(-2)) + '/' + (yyyy.slice(-4)) /*+ ' ' + (hh.slice(-2)) + ':' + (min.slice(-2)) + ':' + (ss.slice(-2))*/;
                return formattedDate;
            }
            else {
                return initialDate;
            }
            //console.log('FINAL' + formattedDate)
            //return formattedDate
        };

        
        //async function aaa() {
        //    return await swal("A wild Pikachu appeared! What do you want to do?", {
        //        buttons: {
        //            catch: {
        //                text: "prueba",
        //                value: "catch111",
        //            }
        //        },
        //    }).then(resolve => {
        //        var aa = "quién soy";
        //        return aa;
        //    }).then(v => { console.log(v) });
        //};

        $("#btnEnviarTable").on("click", function () {
            //setInterval(Tablerecorre, 4000);
            //$("#btnEnviarTable").ajaxStart(function () { $("document").css("cursor", "wait"); });
            //$("#btnEnviarTable").ajaxStop(function () { $("document").css("cursor", "hand"); });
          // aaa();  
            swal.fire({
                title: "Subiendo imagenes al servidor...",
                text: "",
                icon: "warning"
            });
            enviardata();
        });

        var recorre_ = 0;
        var valid = 0;

        function enviardata() {
            var x = 0;
            var IdDocumento,
                Apellidos_Nombres = '',
                Cod_Planilla,
                C_Costo,
                Cod_Sucursal,
                Cod_Actividad,
                Cod_Labor,
                Fecha_Inicio,
                Fecha_Final,
                Porcentaje;
            var a, b, c, d, e, f, g, h, i, j, k, l, m, n;

            let ordencabecera = columns.slice(0, 10);
            console.log('VALIDADOR ' + ordencabecera[1]);


                $("#tb_excel tr").each(function (index) {

                        IdDocumento = '',
                        Apellidos_Nombres = '',
                        Cod_Planilla = '',
                        C_Costo = '',
                        Cod_Sucursal = '',
                        Cod_Actividad = '',
                        Cod_Labor = '',
                        Fecha_Inicio = '',
                        Fecha_Final = '',
                        Porcentaje = 0;

                    if (ordencabecera[1].trim() == "Cod.Planilla") {
                        console.log("CABECERA 1");
                        $(this).children("td").each(function (index2) {

                            switch (index2) {

                                case 0: IdDocumento = $(this).text(); break;
                                case 1: Cod_Planilla = $(this).text(); break;
                                case 2: C_Costo = $(this).text(); break;
                                case 3: Cod_Sucursal = $(this).text(); break;
                                case 4: Cod_Actividad = $(this).text(); break;
                                case 5: Cod_Labor = $(this).text(); break;
                                case 6: Fecha_Inicio = $(this).text(); break;
                                case 7: Fecha_Final = $(this).text(); break;
                                case 8: Porcentaje = $(this).text(); break;
                                case 9: Apellidos_Nombres = $(this).text(); break;
                            }

                        });
                    }

                    if (ordencabecera[1].trim() ==="Apellidos y Nombres") {
                        console.log("CABECERA 2");
                        $(this).children("td").each(function (index2) {

                            switch (index2) {
                                case 0: IdDocumento = $(this).text(); break;
                                case 1: Apellidos_Nombres = $(this).text(); break;
                                case 2: Cod_Planilla = $(this).text();  break;
                                case 3: C_Costo = $(this).text(); break;
                                case 4: Cod_Sucursal = $(this).text(); break;
                                case 5: Cod_Actividad = $(this).text(); break;
                                case 6: Cod_Labor = $(this).text(); break;
                                case 7: Fecha_Inicio = $(this).text(); break;
                                case 8: Fecha_Final = $(this).text(); break;
                                case 9: Porcentaje = $(this).text(); break;

                            }

                        });
                    }

                    console.log(IdDocumento + " - " + Apellidos_Nombres + " - " + Cod_Planilla + " - " + C_Costo + " - " + Cod_Sucursal + " - " + Cod_Actividad + " - " + Cod_Labor + " - " + Fecha_Inicio + " - " + Fecha_Final + " - " + Porcentaje);

                    if (Boolean(IdDocumento)) {
                        var obj = new Object();
                        obj.IdDocumento = IdDocumento;
                        obj.Apellidos_Nombres = Apellidos_Nombres;
                        obj.Cod_Planilla = Cod_Planilla;
                        obj.C_Costo = C_Costo;
                        obj.Cod_Sucursal = Cod_Sucursal;
                        obj.Cod_Actividad = Cod_Actividad;
                        obj.Cod_Labor = Cod_Labor;
                        obj.Fecha_Inicio = Fecha_Inicio;
                        obj.Fecha_Final = Fecha_Final;
                        obj.Porcentaje = Porcentaje;

                     

                        $.ajax({
                            type: "post",
                            async: false,
                            cache: false,
                            url: "../SerRRHH.asmx/InsertarTablaCecoII",
                            data: JSON.stringify({ objeto: obj }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                          
                            success: function (result, status, xhr) {
                                   swal.fire({
                                       title: "Se cargó con exito",
                                       text: "",
                                       icon: "success",
                                       timer: 2500
                                   });
                               
                              //  $("#mdgcarga").text("Se cargó con exito " + (x) + " registros.");
                                //mostraralerta(x);          
                              //  console.log("Envío exitoso")
                             
                            }
                        });
                    }
                    recorre_++;
                });


           
        }

        var aux = 0;
        var p = 0;
        var xy = '';

        function mostraralerta(ide) {
            xy = $("#TotalFilas").text();
            p = parseInt(ide)+1;
            if (p >= parseInt(xy)) {

                swal.fire({
                    title: "Se insertaron todas las filas con exito",
                    text: "",
                    icon: "success",
                    timer: 1500
                });

                $("#mdgcarga").text("Se cargó con exito " + (p-1) + " registros.");
                $("#txtexcel").val('');
                HDBoton("remove", "disabled", true);
                $("#btnEnviarTable").attr("disabled", true);

            } else {
                $("#mdgcarga").text("Se cargó con exito "+ (p-1) +" registros.");
            }
        }

        $("#btnEliminar").on("click", function () {
            $.ajax({
                type: "post",
                data: JSON.stringify({"h":""}),
                url: "../SerRRHH.asmx/EliminarTabla",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                beforeSend: function () {
                    swal.fire({
                        title: "Procesando...",
                        text: "",
                        imageUrl: '../Img/loading.gif',
                        showConfirmButton: false,
                        timerProgressBar: true,
                        showClass: {
                            popup: 'animate__animated animate__fadeInDown'
                        },
                        hideClass: {
                            popup: 'animate__animated animate__fadeOutUp'
                        }
                    });
                }, success: function (r) {
                    console.log(r.d);
                    var concat = '';
                    concat += "LOG DE ERRORES \n";
                    concat += "CORREGIR DNI \n";
                    concat += "======================================================================\n";
                    for (var i = 0; i < r.d.length; i++) {
                        concat += r.d[i]+"\n";
                    }
                    concat += "======================================================================";

                    if (parseInt(r.d.length) > 0) {
                        //Generar BLOC DE NOTAS
                        var blob = new Blob([concat], {type: "text/plain;charset=utf-8"});
                        saveAs(blob, "log_error.txt");

                        swal.fire({
                            title: "No se eliminó la data con exito.",
                            text: "",
                            icon: "error",
                            timer: 4500
                        });

                    } else {
                        swal.close();
                        swal.fire({
                            title: "Se eliminó la data con exito.",
                            text: "",
                            icon: "success",
                            timer: 1500
                        });
                        $("#tb_excel").html('');
                        $("#TotalFilas").text("0");
                        HiddenShow(true);
                        $("#mdgcarga").text("Esperando carga...");
                        console.log("Eliminado con éxito")
                    }

                }
            });
        });

    </script>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">

</asp:Content>