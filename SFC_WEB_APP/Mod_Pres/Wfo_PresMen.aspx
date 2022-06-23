<%@ Page Language="C#"  MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="Wfo_PresMen.aspx.cs" Inherits="SFC_WEB_APP.Mod_Pres.Wfo_PresMen" %>

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://unpkg.com/xlsx@0.14.1/dist/xlsx.full.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


    <style>
        .my-fixed-item {
            position: fixed; /* Hacemos que la posición en pantalla sea fija para que siempre se muestre en pantalla*/
	        right: 0; /* Establecemos la barra en la izquierda */
	        top: 330px; /* Bajamos la barra 200px de arriba a abajo */
	        z-index: 2000;
            width:14%;
        }
        table {
          border-collapse: collapse;
          width: 300px;
          /*overflow-x: scroll;*/
          display: block;
        }

        thead {
          background-color: #EFEFEF;
        }

        thead,
        tbody {
          display: block;
        }

        tbody {
          overflow-y: scroll;
          overflow-x: scroll;
          height: 460px;
        }

        td,
        th {
          min-width: 200px;
          height: 15px;
          border: dashed 1px lightblue;
          overflow: hidden;
          text-overflow: ellipsis;
          max-width: 100px;
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
                        <h4>Configuracion de Presupuesto Mensual</h4>
                    </div>
                    <div class="card-body">

                     
                            <div class="row">  
                                 <div class="col-sm-2 mt-1">
                                        <p><b>DESCARGAR Formato:</b></p>
                                  </div>
                                   <div class="col-sm-10">
                                     
                                         <select id="dynamic_select" class="form-select" aria-label="Default select example">
                                          <option selected >Seleccione Formato</option>
                                          <option value="../formatos/PR001.xlsm">AGRO</option>
                                          <option value="../formatos/PR002.xlsm">PACKIN</option>
                                          <option value="../formatos/PR003.xlsm">SERVICIO COMPLEMENTARIOS</option>
                                          <option value="../formatos/PR004.xlsm">ADMIN</option>
                                          <option value="../formatos/PR005.xlsm">VENTAS</option>
                                          <option value="../formatos/PR007.xlsm">PRUEBA PPTO</option>
                                        </select>
                                    </div>
                            </div>
                           <div class="row">
                              <div class="col-sm-4">
                                   <br />
                               </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-2 mt-1">
                                <p><b>Cargar Formato:</b></p>
                            </div>
                            <div class="col-sm-4">
                                <asp:FileUpload class="txtexcel form-control" id="fuExcel" name="txtexcel" size="5120" accept=".xl*" runat="server"/>
                            </div>
                           
                            <div class="col-sm-2">
                                	

                                <asp:Button type="button" class="btn btn-success" id="btnCargarExcel" name="btnCargarExcel" runat="server" Text="Enviar excel"  />
                            </div>
                        </div>
                    </div>

                       <div class="col-sm-12 animate__animated animate__slideInRight" style="margin-top:-10px;" id="div_table_show">
                            <div class="card">

                             <%--   <div class="card-body table-responsive">
                                    <table class="table table-sm table-hover table-bordered"  id="tb_excel" name="tb_excel">
                                    </table>
                                </div>--%>
                                <div id="excel_data" class="mt-5"></div>
                            </div>
                        </div>
                </div>
            </div>
         
           
        </div>
    </div>






    <script>
        var obj = new Object();
        var columns;
            $("document").ready(function () {
                $("#divCarga").attr("hidden", true);
                $("#Body_btnCargarExcel").hide();
                
                //HiddenShow(true);
            });

        $("#Body_btnCargarExcel").on("click", function (event) {
            event.preventDefault();
            //console.log("hoja2");
            console.log(obj);
            $.ajax({
                type: "post",
                data: JSON.stringify({ obj: obj }),
                url: "../SerPres.asmx/CargaExcel",
                dataType: "json",
                contentType: "application/json;charset=utf-8",
                beforeSend: function () {
                    swal.fire({
                        title: "Enviando Formato...",
                        text: "Por favor espere",
                        icon: "warning"
                    });
                },
                success: function (data) {
                    console.log(JSON.stringify(data));
                    swal.fire({
                        title: JSON.stringify(data),
                        text: "",
                        icon: "success"
                    
                    });
                },
                error: function (request, error) {
                    console.log(arguments);
                    alert(" Error: " + error);
                }
            });

            $("#Body_btnCargarExcel").hide();
           



        });
    
        $(function () {
            // bind change event to select
            $('#dynamic_select').on('change', function () {
                var url = $(this).val(); // get selected value
                if (url) { // require a URL
                    window.location = url; // redirect
                }
                return false;
            });
        });


        $('tb_excel').on('scroll', function () {
            $("#" + this.id + " > *").width($(this).width() + $(this).scrollLeft());
        });
        $('#Body_fuExcel').change(function (e) {
            $("#tb_excel").html('');
            $("#Body_btnCargarExcel").show();

           
            var reader = new FileReader();
          
            reader.readAsArrayBuffer(e.target.files[0]);
            reader.onload = function (e) {
                var data = new Uint8Array(reader.result);
                var wb = XLSX.read(data, { type: 'array' });
                //
                var sheet_data = XLSX.utils.sheet_to_json(wb.Sheets["Hoja1"], { header: 1 });
                var sheet_data2 = XLSX.utils.sheet_to_json(wb.Sheets["Hoja2"], { header: 0 });
                obj = sheet_data2;
                console.log(sheet_data);
                console.log(sheet_data2);
                if (sheet_data.length > 0) {
                    var table_output = '<table class="table table-striped table-bordered">';

                    for (var row = 0; row < sheet_data.length; row++) {

                        table_output += '<tr align="center">';

                        for (var cell = 0; cell < sheet_data[row].length; cell++) {


                            if (sheet_data[row][cell]== undefined) {
                                sheet_data[row][cell] = '';
                            }
                            if (row == 0) {

                                table_output += '<th scope="row" >' + sheet_data[row][cell] + '</th>';
                            } else if (!isNaN(sheet_data[row][cell])) {
                                var num = sheet_data[row][cell];

                                if (num.toString().replace('.', '') !== num) {
                                    table_output += '<td align="center">' + parseInt(sheet_data[row][cell]) + '</td>';
                                } else {
                                    table_output += '<td align="center">' + sheet_data[row][cell] + '</td>';
                                }
                            }
                            else {

                                table_output += '<td align="center">' + sheet_data[row][cell] + '</td>';
                            }

                        }

                        table_output += '</tr>';

                    }

                    table_output += '</table>';

                    document.getElementById('excel_data').innerHTML = table_output;
                }
            }
        });


   


      

    </script>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">

</asp:Content>