<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_ConsultaRendimiento.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_ConsultaRendimiento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Tickets</title>
    <%: Styles.Render("~/Content/css") %>
    <%: Scripts.Render("~/jquery") %>
    <style>
        .form-control:focus {
            box-shadow: none;
        }

        .form-control-underlined {
            border-width: 0;
            border-bottom-width: 1px;
            border-radius: 0;
            padding-left: 0;
        }

        body {
            background: radial-gradient(at bottom,#bacad0 12%,#9d9e54);
            /*background: #ffd89b;
            background: -webkit-linear-gradient(to right, #ffd89b, #19547b);
            background: linear-gradient(to right, #ffd89b, #19547b);*/
            min-height: 100vh;
        }

        .form-control::placeholder {
            font-size: 0.95rem;
            color: #aaa;
            font-style: italic;
        }

                .barra-iconos {
            position: absolute;
            top: 18px;
            right: 18px;
        }
    </style>
            <link rel="stylesheet" type="text/css" href="../Content/toastr.css" />
    <script type="text/javascript" src="../Scripts/toastr.js"></script>
    <script type="text/javascript" src="../Scripts/toastr.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row py-3">
                <div class="barra-iconos">
        <button type="button" id="btnNetwork" class="btn btn-success" data-valid="-1"><i class="fas fa-network-wired fa-lg black"></i></button>
    </div>
            <div class="col-lg-9 mx-auto text-white text-center">
                <h1 class="display-4">
                    <img src="../Img/e-sun_logo_l.png" /></h1>
                <br />
                <p class="lead mb-0">PASE SU FOTOCHECK PARA VERIFICAR AVANCE</p>
                <br />
                <p style="font-size: 2rem;" id="fechaproceso"><label>Fecha de proceso :&nbsp;</label><span id="tfecha" class="ft-bold"></span>&nbsp;<span id="thora"></span> </p>        
                
                <input type="hidden" id="fecha" class="form-control col-2" style="margin:auto" value="" />
            </div>
        </div>
        <div class="row mb-5">
            <div class="col-lg-6 mx-auto">
                <div class="">
                    <form id="PrintTicket" name="PrintTicket" runat="server">
                        <div class="p-1 bg-light rounded rounded-pill shadow-sm mb-4">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <button id="btnRegi" type="submit" class="btn btn-link text-warning"><i class="fa fa-search"></i></button>
                                </div>
                                <input type="text" runat="server" id="txtCodigo" name="Codigo" class="form-control border-0 rounded-pill bg-light" aria-describedby="button-addon2" autofocus onblur="this.focus()" placeholder="Identifiquese..." value="" autocomplete="off" required="required" />
                            </div>
                        </div>
                        <div class="col-12 align-middle" id="personal" style="display: none">
                                           <div class="form-group">
                                                <h3 id="persona" style="font-weight: bold"></h3>
                                            </div>
                        </div>
                        <hr />
                        <div class="col-12 align-middle" id="cajas" style="display: none">
                            <table id="origen_hoyleidos" class="table table-bordered table-striped" style="font-size: 1.5rem; font-weight:bold; color: black">
                                <thead>
                                    <tr>
                                        <td>Labor</td>
                                        <td>Presentacion</td>
                                        <td>Cantidad leidos hoy</td>
                                    </tr>
                                </thead>
                                <tbody style="font-size: 1.5rem; font-weight:bold; color: white; text-shadow: 1px 1px 1px black;"></tbody>
                                <tfoot style="font-size: 1.5rem; font-weight:bold; color: white; text-shadow: 1px 1px 1px black;">
                                    <tr>
                                        <td><b>Total leídos: </b></td>
                                        <td></td>
                                        <td><b><span id="leido"></span></b></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <asp:HiddenField runat="server" ID="hdfPrintIp"></asp:HiddenField>
                    </form>
                </div>
            </div>
        </div>
        <div class="row py-2">
            <div class="col-lg-4 mx-auto text-center">
                <h1 id="msg">
                </h1>
                <h1><asp:Label ID="lblError" runat="server" Text=""></asp:Label></h1>
                <br />
                <h1><span id="lab" style="font-size: 80px;
    color: darkblue;"></span></h1>
            </div>
        </div>
    </div>

    <script>
        let myVar = setInterval(myTimer, 1000);

        function myTimer() {
            const d = new Date();
            document.getElementById("thora").innerHTML = d.toLocaleTimeString();
            document.getElementById("tfecha").innerHTML = String(d.getDate()).padStart(2, '0') + '/' + String(d.getMonth() + 1).padStart(2, '0') + '/' + d.getFullYear();
            $("#fecha").val(d.getFullYear() + '-' + String(d.getMonth() + 1).padStart(2, '0') + '-' + String(d.getDate()).padStart(2, '0'));
        }

        window.addEventListener("offline", function (e) {
            $("#btnNetwork").removeClass("btn-success");
            $("#btnNetwork").addClass("btn-danger");
            $('#persona').html('Revise su conexión');
            $('#personal').show(); 
            $('#fechaproceso').hide();
            clearInterval(myVar)
        });

        // Add event listener online to detect network recovery.
        window.addEventListener("online", function (e) {
            $("#btnNetwork").removeClass("btn-danger");
            $("#btnNetwork").addClass("btn-success");
            $("#persona").html("");
            $('#personal').hide();
            $('#fechaproceso').show();
            $("#txtCodigo").focus();
            document.getElementById("txtCodigo").autofocus;
            myTimer()
        });

        $("#btnAdd").click(function () {
            var vvCant = $("#txtCantidad").val() * 1;
            if (vvCant < 330) {
                vvCant += 33
            }
            $("#txtCantidad").val(vvCant);
        });
        $("#btnDel").click(function () {
            var vvCant = $("#txtCantidad").val() * 1;
            if (vvCant > 0) {
                vvCant -= 33
            }
            $("#txtCantidad").val(vvCant);
        });

        var clear;
        function fclear() {
            clear = setTimeout("limpiar()", 5000);
        }

        function limpiar() {
            $('#msg').text("");
            $("#<%=txtCodigo.ClientID%>").val("");
            $("#cajas").hide();
            $("#personal").hide();
            $("#persona").text('')
            $("#origen_hoyleidos tbody").html('');
        }

        $(document).on('submit', '#PrintTicket', function (event) {
            event.preventDefault();
            var obj = new Object();
            obj.vcNroDocumento = $("#<%=txtCodigo.ClientID%>").val();
                    obj.vnIdTiRow = $("#txtCantidad").val() * 1;
                    if (obj.vcNroDocumento != '') {
                        ver_avance(obj.vcNroDocumento);
                    } else {
                        toastr["error"]('', "falta seleccionar DNI o labor")
                    }
                });


        function ver_avance(dni) {
            obj = new Object();
            obj.vcNroDocumento = dni;
            $("#cajas").hide();
            $("#personal").show();
            $("#persona").html('Recuperando.... <img src="../img/loading.gif">');
            $.ajax({
                type: 'POST',
                url: "SerApp.asmx/ConsultaRendimientoPersonal",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    $("#<%=txtCodigo.ClientID%>").val("");

                    var lst = JSON.parse(data.d);
                    if (lst != "") {

                        $("#persona").text(lst[0].Nombre);
                        
                        var total = 0, total2 = 0;
                        var bloques = "";
                        for (var i = 0; i < lst.length; i++) {
                            bloques += "<tr><td>" + lst[i].clabor + "</td><td>" + lst[i].cDesEmbalaje + "</td><td>" + lst[i].total + "</td></tr>";
 
                            total += parseInt(lst[i].total);
                            total2 += parseInt(lst[i].Anulados);
                        }

                        $("#origen_hoyleidos tbody").html(bloques);

                        $("#ttotal1").html(total);
                        $("#ttotal2").html(total2);
                        $("#leido").html(total);
                        $("#cajas").show();
                        $("#personal").show();
                        //fclear();
                    } else {
                        $("#personal").show();
                        $("#persona").text('Personal no existe o verifique fotocheck');
                        $("#cajas").hide();
                        fclear();
                    }
                    //console.log(data['d'].persona);
                    if (data['d'].persona != "") {


                        //alert(JSON.stringify(data['d'].hoyleidos));

                        for (var i = 0; i < data['d'].hoyleidos.length; i++) {
                            bloques2 += "<tr><td>" + data['d'].hoyleidos[i].dFechaImp + "</td><td>" + data['d'].emitidos[i].cLabor + "</td><td>" + data['d'].hoyleidos[i].cantidad + "</td></tr>";

                            //Pintamos las coincidencias
                            $('#tblbloques td').filter(function () {
                                return $(this).text() == data['d'].hoyleidos[i].dFechaImp;
                            }).append("<i class=\"fas fa-arrow-circle-left\" style=\"padding-left: 10px; color: crimson;\"></i>");//
                        }

                        console.log("Total: " + total);
                        $("#origen_hoyleidos tbody").html(bloques2);

                        //id="#ttotal1"

                        //$("#bloques2 table").html(bloques2);
                        $("#ttotal1").html(total);
                        $("#ttotal2").html(total2);
                        $("#diferencia").html(total - total2);


                        $("#leido2").html(total - data['d'].leidos);

                        $("#cajas").show();
                        $("#personal").show();
                        fclear();
                    } else {
                      
                    }
                },
                error: function (error) {
                    console.log(error);
                    alert(JSON.stringify(error))
                }
            });
        }

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


    </script>

</body>
</html>
