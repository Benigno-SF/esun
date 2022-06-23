<%@ Page Language="C#"  MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="Wfo_Mantenimiento.aspx.cs" Inherits="SFC_WEB_APP.Mod_Usr.Wfo_Mantenimiento" %>

<%@ MasterType VirtualPath="~/Site.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
    <!-- MDB -->

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
                                <h4>Configuracion: Usuario - Perfil - Menu </h4>
                            </div>
                        <div class="card-body">
                                 <div class="row">
                                        <div class="col-sm-1">
                                                <p><b>Consultar Usuario:</b></p>
                                          </div>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="tbUsuario" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox>
                                       </div>
                                       <div class="col-sm-2">
                                            <asp:Button type="button" class="btn btn-success" id="btnConsultarUsr" name="btnConsultarUsr" runat="server" Text="Consultar"  />
                                        </div>
                                  </div>
                            <div class="container" id ="form1">
                                <div class="row">
                                      <div class="col-sm-1">
                                                <p><b>Perfil:</b></p>
                                          </div>
                                       <div class="col-sm-3">
                                            <asp:TextBox ID="tbPerfil" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox>
                                       </div>
                                    <div class="col-sm-4 mt-1">
                                            <div class="input-group">
                                                <span class="input-group-text">Menu:</span>
                                                <select class="form-control" id="cmbMenu" name="cmbPerfil" style="cursor:pointer">
                                                </select>
                                            </div>  
                                     </div>
                                      <div class="col-sm-1">
                                            <asp:Button type="button" class="btn btn-warning" id="btnEliminar" name="btnEliminar" runat="server" Text="Quitar"  />
                                        </div>
                                      <div class="col-sm-1">
                                            <asp:Button type="button" class="btn btn-success" id="btnAgregar" name="btnAgregar" runat="server" Text="Agregar"  />
                                        </div>

                                     </div>
                                        <div class="row">
                                            <div class="col-sm-4 mt-2">

                                            </div>
                                            <div class="col-sm-4 mt-1">
                                            <div class="input-group">
                                                <span class="input-group-text">Agregar:</span>
                                                <select class="form-control" id="cmbMenuADD" name="cmbMenuADD" style="cursor:pointer">
                                                </select>
                                                 <div class="col-sm-2">
                                                    <asp:Button type="button" class="btn btn-success" id="btnGuardar" name="btnGuardar" runat="server" Text="Guardar"  />
                                                  </div>
                                            </div>  
                                            </div>
                                        </div>

                                </div>
                            <div class ="row">
                                 

                            </div>
                        </div>
                </div>    

            </div>
         
           
        </div>
    </div>

    <script>
        $("document").ready(function () {
            $("#form1").attr("hidden", true);
            $("#cmbMenu").hide();
            $("#btnEliminar").hide();
            $("#btnAgregar").hide();
            $("#cmbMenuADD").hide();
        });


        $("#btnConsultarUsr").on("click", function (event) {
            event.preventDefault();
            
            var usuario = this.tbUsuario.text;
            console.log(usuario);
            $("#form1").attr("hidden", false);
            $("#cmbMenu").hide();
            $("#btnEliminar").hide();
            $("#btnAgregar").hide();
            $("#cmbMenuADD").hide();
            console.log(usuario);

            //$.ajax({
            //    type: "post",
            //    data: JSON.stringify({ obj: usuario }),
            //    url: "../SerPres.asmx/CargaExcel",
            //    dataType: "json",
            //    contentType: "application/json;charset=utf-8",
            //    beforeSend: function () {
            //        swal.fire({
            //            title: "Enviando Formato...",
            //            text: "Por favor espere",
            //            icon: "warning"
            //        });
            //    },
            //    success: function () {
            //        swal.fire({
            //            title: "Transacción Exitosa.",
            //            text: "",
            //            icon: "success"

            //        });
            //    },
            //    error: function (request, error) {
            //        console.log(arguments);
            //        alert(" Error: " + error);
            //    }
            //});

            //$("#Body_btnCargarExcel").hide();




        });
    </script>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">

</asp:Content>