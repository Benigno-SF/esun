<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_Incidencias.aspx.cs" Inherits="SFC_WEB_APP.Mod_Segu.Wfo_Incidencias" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <style>
        .label-success {
            background-color: #72de1952;
            border-radius: 15px;
            padding: 2px;
            text-align: center;
        }

        .ui-autocomplete {
            z-index: 1115 !important;
        }

        .table {
            border-collapse: collapse;
            // 1 border-spacing: 0;
        }

        .tr-nopm tbody tr td {
            padding: 4px;
            margin: 4px;
            text-align: center;
            font-size: 0.9rem;
        }

        .tr-nopm thead tr th {
            padding: 6px;
            margin: 6px;
        }
    </style>

    <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
     <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body">
                            <h4 class="card-title info">Control Vehicular</h4>

                            <div class="row text-center" style="display: flex; justify-content: space-between;">
                                <div class="col-md-3 pt-4">
                                    <a class="btn btn-lg btn-success" id="BtnIncidencia" data-toggle="modal" data-target="#ModIncidencia">
                                        <i class="fa fa-book"></i> Incidencia
                                    </a>
                                </div>
                                <div class="col-xl-3">
                                    <div class="form-group">
                                        <!-- Social Outline Block Buttons Here-->
                                        <a href="#" class="btn btn-social btn-block mb-1 btn-outline-github"><i class="fa fa-bell"></i> Github</a>
                                        <a href="#" class="btn btn-social btn-block mb-1 btn-outline-soundcloud"><span class="fa fa-soundcloud"></span> Soundcloud</a>
                                        <a href="#" class="btn btn-social btn-block mb-1 btn-outline-vimeo"><span class="fa fa-vimeo-square"></span> Vimeo</a>
                                    </div>
                                </div>
                            </div>
                            <br />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body">
                            <h4 class="card-title info">Historial</h4>
                            <div class="row text-center">
                                <div class="col-md-6 table">
                                    <span>INCIDENCIAS</span>
                                    <table id="tblIncidencias" class="table table-striped table-bordered dt-responsive nowrap tr-nopm">
                                        <thead>
                                            <tr>
                                                <th># Placa</th>
                                                <th>tipo</th>
                                                <th>Ingreso</th>
                                                <th>Detalles</th>
                                                <th>Salida</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-6 table">
                                    <span>REP VIGILANTES</span>
                                    <table id="tblVigilantes" class="table table-striped table-bordered dt-responsive nowrap tr-nopm">
                                        <thead>
                                            <tr>
                                                <th style="width: 20%"># Placa  </th>
                                                <th style="width: 30%">tipo</th>
                                                <th style="width: 20%">Ingreso</th>
                                                <th style="width: 20%">Salida</th>
                                                <th style="width: 10%">Detalles</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>

      <!-- ////////////////////// GUIAS ////////////////////////////////// -->
    <div class="modal fade" id="ModIncidencia" data-backdrop="true" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-xs" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Incidencia</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Fundo:</label>
                        <asp:DropDownList ID="ddlFundo" runat="server" CssClass="form-control" ></asp:DropDownList>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Vigilante:</label>
                        <asp:DropDownList ID="ddlVigilante" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Tipo:</label>
                        <asp:DropDownList ID="ddlTipoIncidencia" runat="server" CssClass="form-control" ></asp:DropDownList>
                    </div>
                    <div class="form-group mb-1">
                        <label for="message-text" class="col-form-label">Incidencia:</label>
                        <textarea class="form-control" id="Incidencia" rows="3" placeholder="SIN NOVEDAD"></textarea>
                    </div>
                    <div class="form-group p-0 m-0" id="DivFecha">
                        <label for="txtFecha">Fecha Ingreso</label>
                        <input type="text" id="txtfecha" autocomplete="off" class="form-control round" placeholder="dd/mm/yyyy">
                        <script type="text/javascript">
                            $(function () {
                                $('#txtfecha').datetimepicker({
                                    format: 'DD/MM/YYYY',
                                    locale: 'es'
                                });
                                $(function () {
                                    $('#DivFecha').datetimepicker({
                                        format: 'DD/MM/YYYY',
                                        locale: 'es'
                                    });
                                });
                            });
                        </script>
                    </div>
                    <div class="form-group p-0 m-0" id="DivHora">
                        <label for="recipient-name" class="col-form-label">Hora Ingreso:</label>
                        <input type="text" id="txtHora" autocomplete="off" class="form-control" placeholder="HH:mm:ss">
                        <script type="text/javascript">
                            $(function () {
                                $('#txtHora').datetimepicker({
                                    format: 'HH:mm:ss',
                                    locale: 'es'
                                });
                                $(function () {
                                    $('#DivHora').datetimepicker({
                                        format: 'HH:mm:ss',
                                        locale: 'es'
                                    });
                                });
                            });
                        </script>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="nidIncidencia" value="0">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" id="SaveIncidencia" class="btn btn-primary">Agregar</button>
                </div>
            </div>
        </div>
    </div>

  
    <!-- ////////////////////// GUIAS ////////////////////////////////// 
    [nIdEmpresa]
      ,[nIdIncidencia]
      ,[nIdFundo]
      ,[cDescIncidencia]
      ,[nIdTipo]
      ,[dFechaRegistro]
      ,[dFecha]
      ,[cUsuarioCrea] -->

        <script src="../Scripts/sweetalert2.js"></script>

    <script>

        $(document).on('click', '#SaveIncidencia', function (event) {
            event.preventDefault();

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdIncidencia = 0;
            obj.vnIdFundo = $("#<%=ddlFundo.ClientID%>").val();
            obj.vnIdPersonal = $("#<%=ddlVigilante.ClientID%>").val();
            obj.vnTipo = $("#<%=ddlTipoIncidencia.ClientID%>").val();

            if ($('#Incidencia').val() != '') {
                var cDescIncidencia = $('#Incidencia').val();
            } else {
                var cDescIncidencia = 'SIN NOVEDAD';
            }
            obj.vcDescIncidencia = cDescIncidencia;

            if ($('#txtfecha').val() != '') {
                var dFechaRegistro = $('#txtfecha').val() + ' ' + $('#txtHora').val();
            } else {
                var dFechaRegistro = '';
            }

            obj.vcFecha = dFechaRegistro;
            if (obj.vcIdEmpresa != "" && obj.vnIdFundo != '' && obj.vnIdPersonal != '' && obj.vcFecha != '') {
                  $.ajax({
                      type: 'POST',
                      url: "../SerSegu.asmx/InicdenciaRegi",
                      data: JSON.stringify({ obj: obj }),
                      dataType: 'json',
                      contentType: 'application/json; charset=utf-8',
                      success: function (data) {
                          var lst = JSON.parse(data.d);
                          if (lst != '') {
                              switch (lst[0].regi) {
                                  case 0:
                                      toastr.success('Verifique los Datos', 'ERROR');
                                      clear();
                                      break;
                                  case 1:
                                      toastr.success('Ingreso Agregada', 'CORRECTO');
                                     /* $("#ModIngreso").modal('hide');
                                      $('body').removeClass('modal-open');
                                      $('.modal-backdrop').remove();*/

                                      $('#frmMain')[0].reset();
                                      clear();

                                     /* var table = $('#tblIngreso').DataTable();
                                      table.destroy();
                                      var table2 = $('#tblSalida').DataTable();
                                      table2.destroy();
                                      LoadData();
                                      var table3 = $('#tblGuias').DataTable();
                                      table3.destroy();
                                      LoadGuias();*/
                                      break;
                                  case 3:
                                      toastr.warning('Vehiculo no Ingreso o Ya registro salida', 'Verificar');
                                      break;
                                  case 4:
                                      toastr.warning('Vehiculo ya Ingresado o No registro salida', 'Verificar');
                                      break;
                                  default:
                                      toastr.warning('ERROR', 'Verificar');
                                      break;
                              }

                          } else {
                              toastr.success('Verifique los Datos', 'ERROR');
                          }

                      },
                      error: function (error) {
                          toastr.error(JSON.stringify(error), '');
                      }
                  });

              } else {
                  toastr.error('Ingrese los datos correspondientes', 'Faltan datos');
              }

          });

        function clear() {
            $("#<%=ddlFundo.ClientID%>").val('00');
            $("#<%=ddlVigilante.ClientID%>").val('00');
            $("#<%=ddlTipoIncidencia.ClientID%>").val('00');
            $('#txtfecha').val('');
            $('#txtHora').val('');
        }

        $("#BtnIncidencia").click(function () {
            $('#txtfechaIngreso').click();

                var today = new Date();
                var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
                var time = today.getHours() + ":" + today.getMinutes();
                var dateTime = date + ' ' + time;
                $("#txtfechaIngreso").datetimepicker({
                    format: 'yyyy-mm-dd hh:ii',
                    autoclose: true,
                    todayBtn: true,
                    startDate: dateTime
                });
        })

        function SendSMS (phone, message) {
            var obj = new Object();
            obj.cNumCel = phone;
            obj.cDescSms = message;
            $.ajax({
                type: 'POST',
                url: "../SerProd.asmx/SendSms",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                beforeSend: function () {
                    toastr.remove();
                    toastr.clear();
                    toastr.warning('', 'Enviando Mensaje ....');
                },
                success: function (data) {
                    toastr.remove();
                    toastr.clear();

                    if (data.d == 'OK') {
                        toastr.success('', 'MENSAJE ENVIADO')
                    } else if (data.d == 'NOT') {
                        toastr.error('', 'MENSAJE NO ENVIADO, GATEWAY INACTIVO')
                    } else if (data.d == '500') {
                        toastr.error('', 'NO SE ENVIO EL MENSAJE, VERIFIQUE NUMERO')
                    } else {
                        toastr.error('', 'ERROR ' + data.d)
                    }
                },
                error: function (error) {
                    $.toaster({
                        title: 'ERROR',
                        message: error,
                        priority: 'danger'
                    });
                    clear();
                }
            });

        };
        saveimg("data:image/jpeg;base64,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")

        function saveimg(base64) {
            var obj = new Object();
            obj.vcDescripcion = base64;
            $.ajax({
                type: 'POST',
                url: "../SerSegu.asmx/saveimg",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    toastr.remove();
                    toastr.clear();

                    if (data.d == 'OK') {
                        toastr.success('', 'Subido')
                    } else {
                        toastr.error('', 'ERROR ' + data.d)
                    }
                },
                error: function (error) {
                    $.toaster({
                        title: 'ERROR',
                        message: error,
                        priority: 'danger'
                    });
                    clear();
                }
            });

        };

        $("#btnSearch").click(function () {
            SendSMS($("#numcel").val(), $("#msmcel").val())
        });

        function validar(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 13) {
                $("#btnSearch").click();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
