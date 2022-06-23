<%@ Page Language="C#"  MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="Wfo_Planilla.aspx.cs" Inherits="SFC_WEB_APP.Mod_RRHH.Wfo_Planilla" %>

<%@ MasterType VirtualPath="~/Site.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    

    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <!--LIBRERIA DE BOOSTRAP 5 -->
    <%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    <!-- js databales -->
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.light.css" />

    <script src="../Content/DevExtreme/cldr.min.js"></script>
    <script src="../Content/DevExtreme/event.min.js"></script>
    <script src="../Content/DevExtreme/supplemental.min.js"></script>
    <script src="../Content/DevExtreme/unresolved.min.js"></script>
    <script src="../Content/DevExtreme/globalize.min.js"></script>
    <%--<script src="../Content/DevExtreme/number.min.js"></script>--%>
    <script src="../Content/DevExtreme/message.min.js"></script>
    <%--   <script src="../Content/DevExtreme/currency.min.js"></script>
    <script src="../Content/DevExtreme/date.min.js"></script>--%>
    <script src="../Content/DevExtreme/jszip.min.js"></script>
    <script src="../Content/DevExtreme/dx.all.js"></script>
    <script src="../Content/DevExtreme/dx.messages.es.js"></script>
    <script src="../Content/DevExtreme/supplemental.js"></script>
    <script src="../Content/DevExtreme/es.js"></script>

    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/print.min.css" />
    <script src="../Content/DevExtreme/print.min.js"></script>

     <script src="../Scripts/sweetalert2.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- fin js databales -->

    <!-- linreria de select 2 -->
    <%--<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>--%>
    <style>
        .dx-freespace-row {
            height: 0px !important;
        }

        .long-title h3 {
            font-family: 'Segoe UI Light', 'Helvetica Neue Light', 'Segoe UI', 'Helvetica Neue', 'Trebuchet MS', Verdana;
            font-weight: 200;
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
        }

        @media print {
            body, .printjsa, .dx-scrollable-content {
                display: block !important;
                position: relative !important;
                width: auto !important;
                height: auto !important;
                overflow: visible !important;
                margin-left: 0 !important;
                display: block !important; /* Not really needed in all cases */
                position: relative !important;
                width: auto !important;
                height: auto !important;
                overflow: visible !important;
            }
        }

        #gridContainer {
            height: 60vh;
        }

        #DataGrid {
            height: auto;
            width: 100%;
            color: black;
            font-weight: bold;
            font-size: 10px;
            height: 60vh;
        }

        .options {
            padding: 0px;
            margin-top: 0px;
        }

        .caption {
            font-size: 18px;
            font-weight: 500;
        }

        .option {
            margin-top: 0px;
        }

        .dx-datagrid-rowsview .dx-row > .dx-master-detail-cell {
            padding: 15px;
        }

        .ui-autocomplete {
            z-index: 11115 !important;
            color: #96f226 !important;
            border-radius: 0px !important;
            border: 1px solid #454545 !important;
        }

        
    </style>  
    
    <link rel="stylesheet" type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">

<!-- Modal -->
<div class="modal fade" id="modal_form_reg" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h5 class="modal-title" id="staticBackdropLabel">Registro de Datos</h5>
                <button type="button" class="btn-close btn btn-default" data-bs-dismiss="modal" ><i class="fa fa-close"></i></button>
            </div>
            <div class="modal-body">
                <!-- form registrarra modal -->
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-2">
                            <p><b>Buscar por DNI:</b></p>
                         </div>
                        <div class="col-sm-4">
                             <div class="input-group mb-3">
                              <input type="text" class="form-control" id="usuario_dni_busc" name="usuario_dni_busc" title="Solo numeros" pattern="[0-9]{8}" placeholder="ejem.: 77028950"/>
                              <button class="btn btn-success" type="button" id="button-addon2" onclick="listar_datos();">BUSCAR</button>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <p><b>Tipo de Registro:</b></p>
                         </div>
                         <div class="col-sm-4">
                            <select class="form-control" name="tipo_registro" id="tipo_registro" aria-label="Default select example"> </select>
                         </div>
                    </div> 
                    <!-- form mostrar datos del usuario -->
                    <div class="border border-1 m-2">
                        <div class="row p-2">
                            <div class="col-sm-4">
                                <asp:Label Text="DNI" runat="server" />
                                <input type="text" class="form-control" name="usuario_dni_reg" id="usuario_dni" disabled />
                            </div>
                            <div class="col-sm-8">
                                <asp:Label Text="NOMBRES Y APELLIDOS" runat="server" />
                                <input type="text" class="form-control" name="usuario_nombres_reg" id="usuario_nombres" disabled />
                            </div>
                            <div class="col-sm-4">
                                <asp:Label Text="CODIGO DE PLANILLA" runat="server" />
                                <input type="text" class="form-control" name="usuario_codigo_planilla_reg" id="usuario_codigo_planilla" disabled />
                            </div>
                            <div class="col-sm-4">
                                <asp:Label Text="CARGO" runat="server" />
                                <input type="text" class="form-control" name="usuario_cargo_reg" id="usuario_cargo" disabled />
                            </div>
                        </div>
                    </div>
                    <!-- fin form mostrar datos del usuario -->
                    <!-- form DESCANSO medico -->
                    <div id="form_descanso_medico">
                         <div class="border border-1 m-2">
                             <div class="container-fluid">
                                <div class="row p-2">
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Registro(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="descanso_medico_fecha_registro_reg" id="descanso_medico_fecha_registro"  disabled />
                                            <input type="hidden" name="usuario_id" id="usuario_id"  />
                                            <input type="hidden" name="descanso_medico_fecha_creacion" id="descanso_medico_fecha_creacion" value="" />
                                            <%--<script type="text/javascript">
                                                $(function () {
                                                    $('#descanso_medico_fecha_creacion').datetimepicker({
                                                        format: 'DD/MM/YYYY',
                                                        locale: 'es'
                                                    });
                                                });
                                            </script>--%>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Inicio(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id=""><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date="" data-date-format="DD-YYYY-MM" name="descanso_medico_fecha_inicio_reg"  id="descanso_medico_fecha_inicio"  />
                                            <script type="text/javascript">
                                                $("descanso_medico_fecha_inicio").on("change", function() {
                                                this.setAttribute(
                                                    "data-date",
                                                    moment(this.value, "DD-YYYY-MM")
                                                    .format( this.getAttribute("data-date-format") )
                                                )
                                                }).trigger("change")
                                            </script>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Termino(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id=""><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="descanso_medico_fecha_fin_reg"  id="descanso_medico_fecha_fin" >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Numero de Días(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-clock"></i></span>
                                          <input type="text" class="form-control" name="descanso_medico_num_dias_reg" id="descanso_medico_num_dias"  disabled >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Observaciones</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-file-text"></i></span>
                                          <input type="text" class="form-control" name="descanso_medico_observacion_reg"  id="descanso_medico_observacion"  >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Proviene(*)</label>
                                        <select class="form-control" name="descanso_medico_proviene_reg" id="descanso_medico_proviene" >
                                          <option selected>Seleccione tipo de registro</option>
                                          <option value="Fundo">Fundo</option>
                                          <option value="Planta">Planta</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="formFileMultiple" class="form-label">Doc. Sustentario - CMP(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-file-text"></i></span>
                                          <input type="text" class="form-control" name="descanso_medico_cmp_reg"  id="descanso_medico_cmp"  >
                                        </div>
                                    </div>
                                    <!-- DIAGNSOTICO -->
                                    <div class="col-md-6" id="idCliente">
                                        <label for="formFileMultiple" class="form-label">Ingrese Cod. Desc. Diagnostico(*)</label>
                                        <div class="input-group">
                                            <input type="text" id="cDescClieProv" class="form-control round descli" placeholder="Ingrese Cod. / Desc. Diagnostico">
                                            <input type="hidden" id="nIdClieProv">
                                        </div>
                                    </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin form DESCANSO medico -->
                    <!-- form permiso atencion medico -->
                    <div id="form_permiso_atension_medica">
                         <div class="border border-1 m-2">
                             <div class="container-fluid">
                                <div class="row p-2">
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Atención(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="atencion_medica_fecha_atencion_reg" id="atencion_medica_fecha_atencion" disabled/>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Inicio(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id=""><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="atencion_medica_fecha_inicio_reg"  id="atencion_medica_fecha_inicio"  >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Termino(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id=""><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="atencion_medica_fecha_fin_reg"  id="atencion_medica_fecha_fin" >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Motivo(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id=""><i class="fa fa-user"></i></span>
                                          <input type="text" class="form-control" name="atencion_medica_motivo_reg"  id="atencion_medica_motivo" >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Documentación(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id=""><i class="fa fa-file"></i></span>
                                          <input type="text" class="form-control" name="atencion_medica_documentacion_reg"  id="atencion_medica_documentacion" >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Tiempo - Horas(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-clock"></i></span>
                                          <input type="text" class="form-control" name="atencion_medica_tiempo_reg" id="atencion_medica_tiempo">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Proviene(*)</label>
                                        <select class="form-control" name="atencion_medica_proviene_reg" id="atencion_medica_proviene" >
                                          <option selected>Seleccione tipo de registro</option>
                                          <option value="Fundo">Fundo</option>
                                          <option value="Planta">Planta</option>
                                        </select>
                                    </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin form permiso atencion medico -->
                    <!-- form falta justificacion bono asistencia -->
                    <div id="form_falta_just_bono_asistencia">
                         <div class="border border-1 m-2">
                             <div class="container-fluid">
                                <div class="row p-2">
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fcha Registro(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="bono_asistencia_fecha_registro_reg" id="bono_asistencia_fecha_registro" disabled />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Inicio(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="bono_asistencia_fecha_ingreso_reg" id="bono_asistencia_fecha_ingreso" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Fin(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY"  name="bono_asistencia_fecha_fin_reg" id="bono_asistencia_fecha_fin">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Días(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-clock"></i></span>
                                          <input type="text" class="form-control"  name="bono_asistencia_dias_reg" id="bono_asistencia_dias" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Motivo(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-user"></i></span>
                                          <input type="text" class="form-control"  name="bono_asistencia_motivo_reg" id="bono_asistencia_motivo" >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Documentación(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-file"></i></span>
                                          <input type="text" class="form-control"  name="bono_asistencia_documentacion_reg" id="bono_asistencia_documentacion" >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Proviene(*)</label>
                                        <select class="form-control" name="bono_asistencia_proviene_reg" id="bono_asistencia_proviene" >
                                          <option selected>Seleccione tipo de registro</option>
                                          <option value="Fundo">Fundo</option>
                                          <option value="Planta">Planta</option>
                                        </select>
                                    </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin form falta justificacion bono asistencia -->
                    <!-- form lactancia -->
                    <div id="form_h_lactancia">
                         <div class="border border-1 m-2">
                             <div class="container-fluid">
                                <div class="row p-2">
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Registro(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id=""><i class="fa fa-calendar"></i></span>
                                          <input type="text" class="form-control" name="lactancia_fecha_registro_reg" id="lactancia_fecha_registro" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Inicio(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="lactancia_fecha_inicio_reg" id="lactancia_fecha_inicio" >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Termino(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="lactancia_fecha_termino_reg" id="lactancia_fecha_termino" >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Lactante(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-user"></i></span>
                                          <input type="text" class="form-control" name="lactancia_lactante_reg" id="lactancia_lactante" >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Proviene(*)</label>
                                        <select class="form-control" name="lactancia_proviene_reg" id="lactancia_proviene" >
                                          <option selected>Seleccione tipo de registro </option>
                                          <option value="Fundo">Fundo</option>
                                          <option value="Planta">Planta</option>
                                        </select>
                                    </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin form lactancia -->
                    <!-- form paternidad -->
                    <div id="form_licencia_paternidad">
                         <div class="border border-1 m-2">
                             <div class="container-fluid">
                                <div class="row p-2">
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Registro(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="paternidad_fecha_registro_reg" id="paternidad_fecha_registro" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Inicio(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id=""><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="paternidad_fecha_inicio_reg" id="paternidad_fecha_inicio">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Termino(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="paternidad_fecha_termino_reg" id="paternidad_fecha_termino">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Días(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-clock"></i></span>
                                          <input type="text" class="form-control" name="paternidad_dias_reg" id="paternidad_dias" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Vínculo Familiar (*)</label>
                                        <select class="form-control" name="paternidad_vinculo_familiar_reg" id="paternidad_vinculo_familiar" >
                                          <option selected>Seleccione tipo de registro </option>
                                          <option value="Hijo">Hijo</option>
                                          <option value="Hija">Hija</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Observación</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-file"></i></span>
                                          <input type="text" class="form-control" name="paternidad_observacion_reg" id="paternidad_observacion">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Proviene(*)</label>
                                        <select class="form-control" name="paternidad_proviene_reg" id="paternidad_proviene" >
                                          <option selected>Seleccione tipo de registro </option>
                                          <option value="Fundo">Fundo</option>
                                          <option value="Planta">Planta</option>
                                        </select>
                                    </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin form paternidad -->
                    <!-- form fallecimiento -->
                    <div id="form_licencia_fallecimiento">
                         <div class="border border-1 m-2">
                             <div class="container-fluid">
                                <div class="row p-2">
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Registro(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="fallecimiento_fecha_registro_reg" id="fallecimiento_fecha_registro" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Inicio(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="fallecimiento_fecha_inicio_reg" id="fallecimiento_fecha_inicio">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Termino(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="fallecimiento_fecha_termino_reg" id="fallecimiento_fecha_termino">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Días (*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-clock"></i></span>
                                          <input type="text" class="form-control" name="fallecimiento_dias_reg" id="fallecimiento_dias" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fallecido(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-user"></i></span>
                                          <input type="text" class="form-control" name="fallecimiento_fallecido_reg" id="fallecimiento_fallecido">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Vinculo(*)</label>
                                        <select class="form-control" name="fallecimiento_vinculo_reg" id="fallecimiento_vinculo" >
                                            <option selected>Seleccione tipo de registro </option>
                                            <option value="Madre">Madre</option>
                                            <option value="Padre">Padre</option>
                                            <option value="Conyuge">Conyuge</option>
                                            <option value="Hijo">Hijo</option>
                                            <option value="Hija">Hija</option>
                                            <option value="Hermano">Hermano</option>
                                            <option value="Hermana">Hermana</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Proviene(*)</label>
                                        <select class="form-control" name="fallecimiento_proviene_reg" id="fallecimiento_proviene" >
                                          <option selected>Seleccione tipo de registro </option>
                                          <option value="Fundo">Fundo</option>
                                          <option value="Planta">Planta</option>
                                        </select>
                                    </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin form fallecimiento -->
                    <!-- form gose -->
                    <div id="form_licencia_gose">
                         <div class="border border-1 m-2">
                             <div class="container-fluid">
                                <div class="row p-2">
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Registro(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="gose_fecha_registro_reg" id="gose_fecha_registro" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Inicio(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id=""><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="gose_fecha_inicio_reg" id="gose_fecha_inicio">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Termino(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="gose_fecha_termino_reg" id="gose_fecha_termino">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Días(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-clock"></i></span>
                                          <input type="text" class="form-control" name="gose_dias_reg" id="gose_dias" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Caso(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-user"></i></span>
                                          <input type="text" class="form-control" name="gose_caso_reg" id="gose_caso">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Proviene(*)</label>
                                        <select class="form-control" name="gose_proviene_reg" id="gose_proviene" >
                                          <option selected>seleccione tipo de registro  </option>
                                          <option value="Fundo">Fundo</option>
                                          <option value="Planta">Planta</option>
                                        </select>
                                    </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin form gose -->

                    <p id="demo"></p>

                    <!--  footer del form-->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CANCELAR</button>
                        <button type="button" class="btn btn-primary" onclick="registrar_documento();">GUARDAR</button>
                      </div>
                    <!--  footer del form-->
                    </div>
               <!-- fin form registrar modal -->
               </div>
          </div>
    </div>
</div>
<!--ffin de modal registrar -->
<div class="container animate__animated  animate__fadeInLeft" id="form_principal">
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header text-center">
                    <h4>REGISTRO DE DESCANSOS Y LICENCIAS</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                        <!-- select para mostrar daos segun el docuemnto -->  
                        <div class="row m-3">
                            <div class="col-md-10 border border-1 p-1">
                                <label  class="form-label"><b>FILTRADO POR SEMANAS</b></label>
                              <div class="row">
                                  <div class="col-md-2">
                                     <label for="" class="form-label"><b>Año</b></label>
                                      <div class="input-group">
                                           <input type="text" class="form-control" name="anio_busc_filt_reg" id="anio_busc_filt" autocomplete="off" placeholder="Seleccione" />
                                          <%--<button class="btn btn-primary" type="button" onclick="listar_semana_anio();"><i class="fa fa-calendar"></i></button>--%>
                                          <script type="text/javascript">
                                              $(function () {
                                                  $('#anio_busc_filt').datetimepicker({
                                                      format: 'YYYYMM',
                                                      locale: 'es'
                                                  });
                                                  $(function () {
                                                      $('#anio_busc_filt').datetimepicker({
                                                          format: 'YYYYMM',
                                                          locale: 'es'
                                                      });
                                                  });
                                              });
                                          </script>
                                          <%--<select class="form-control" name="anio_busc_filt" id="anio_busc_filt" aria-label="Default select example"> 
                                              <option selected="">Seleccione</option>
                                          </select>--%>
                                      </div>
                                  </div>
                                  <div class="col-md-4">
                                     <label for="" class="form-label"><b>Semana</b></label>
                                        <div class="input-group">
                                             <select class="form-control" name="semana_busc_filt" id="semana_busc_filt" aria-label="Default select example"  placeholder="Seleccione"> 
                                              <%--<option selected="">Seleccione</option>--%>
                                          </select>
                                        </div>
                                  </div>
                                  <div class="col-md-2">
                                        <label for="" class="form-label">Inicio(*)</label>
                                        <input class="form-control" type="text" id="fecha_inicio_filt" disabled>
                                    </div>
                                    <div class="col-md-2">
                                       <label for="" class="form-label">Fin(*)</label>
                                          <input class="form-control" type="text" id="fecha_fin_filt" disabled>
                                    </div>
                                  <div class="col-md-2">
                                      <label for="" class="form-label">Estado(*)</label>
                                      <input class="form-control" type="text" id="estado_filt" disabled>
                                    </div>
                              </div>
                          </div>
                          <div class="col-md-2" id="cerrar_semana_dato">
                              <div class="">
                                    <button class="btn btn-success" type="button" id="btn_consultar_datos" onclick="priv_btn_consuta_semana();">Consultar  <i class="fa fa-search"></i></button>   
                               </div>
                              <!-- BTN CERRAR SEMANA -->
                                 <div class="pt-1">
                                     <button type="button" class="btn btn-info position-relative" id="btn_apert_semana_dato" onclick="priv_btn_apert_semana();">
                                          APERTURAR
                                      </button>
                                   </div>
                                  <div class="pt-1">
                                          <button type="button" class="btn btn-danger position-relative" id="btn_cerrar_semana_dato" onclick="priv_btn_cerrar_semana();">
                                           CERRAR <i class="fa fa-close"></i>
                                        </button>
                                  </div>   
                              <div class="pt-1">
                                <button type="button" class="btn btn-primary position-relative" id="btn_registrar" onclick="priv_btn_nuevo_registro();" >
                                     Registro  <i class="fa fa-file"></i>
                                </button>
                            </div> 
                              <!-- FIN  BTN CERRAR SEMANA -->
                          </div>
                          
                        </div>
                        
                     <!-- fin select para mostrar daos segun el docuemnto -->
                     <div class="modal fade" id="modal_apertura" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header bg-warning">
                                <h5 class="modal-title" id="exampleModalLabel">APERTURA DE SEMANA</h5>
                                <button type="button" class="btn-close" id="btn_cerrar" data-bs-dismiss="modal" aria-label="Close"></button>
                              </div>
                              <div class="modal-body">
                                  <div class="row">
                                      <div class="col-md-6">
                                        <label for="" class="form-label"><b>Año</b></label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="apertura_seman_anio_reg" id="apertura_seman_anio" >
                                        </div>
                                        </div>
                                      <div class="col-md-6">
                                        <label for="" class="form-label"><b>Semana</b></label>
                                        <div class="input-group">
                                                <input type="text" class="form-control" name="apertura_seman_semana_reg" id="apertura_seman_semana" >
                                                <button class="btn btn-danger" type="button" onclick="listar_semana();" id="btn_buscar_semana"><i class="fa fa-search"></i></button>
                                        </div>
                                        </div>
                                          <div class="col-md-6">
                                                <label for="" class="form-label">F. Inicio(*)</label>
                                                <input class="form-control" type="text" id="cerrar_fecha_inicio_sem" disabled>
                                            </div>
                                        <div class="col-md-6">
                                                <label for="" class="form-label">F. Fin(*)</label>
                                                 <input class="form-control" type="text" id="cerrar_fecha_fin_sem" disabled>
                                                <input class="form-control" type="hidden" id="cerrar_fecha_estado_sem" >
                                                <input class="form-control" type="hidden" id="cerrar_fecha_anio_sem" >
                                                 <input class="form-control" type="hidden" id="cerrar_fecha_ID_sem" >
                                        </div>
                                      </div>
                                </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"  data-bs-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-danger" onclick="registrar_apertura_semana();" id="btn_registro_semana">APERTURAR</button>
                              </div>
                            </div>
                          </div>
                        </div>
                    
                        <div class="modal fade" id="modal_cerrar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header bg-warning">
                                <h5 class="modal-title" id="">CIERRE DE SEMANA</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                              </div>
                              <div class="modal-body">
                                  <div class="row">
                                      <div class="col-md-6">
                                        <label for="" class="form-label"><b>Año</b></label>
                                        <div class="input-group">
                                                <input type="text" class="form-control" name="cerrar_semana_anio_reg" id="cerrar_semana_anio" >
                                        </div>
                                        </div>
                                    <div class="col-md-6">
                                        <label for="" class="form-label"><b>Semana</b></label>
                                        <div class="input-group">
                                                <input type="text" class="form-control" name="cerrar_semana_anio_reg" id="cerrar_semana_semana" >
                                                <button class="btn btn-danger" type="button" onclick="listar_semana_datos();" id="btn_buscar_semana"><i class="fa fa-search"></i></button>
                                        </div>
                                        </div>
                                          <div class="col-md-6">
                                                <label for="" class="form-label">F. Inicio(*)</label>
                                                <input class="form-control" type="text" id="cerrar_fecha_ini_t" disabled>
                                            </div>
                                        <div class="col-md-6">
                                            <label for="" class="form-label">F. Fin(*)</label>
                                              <input class="form-control" type="text" id="cerrar_fecha_fin_t" disabled>
                                            
                                            <input class="form-control" type="hidden" id="cerrar_estado_fin_t" disabled>
                                            <input class="form-control" type="hidden" id="cerrar_anio_t" disabled>
                                            <input class="form-control" type="hidden" id="cerrar_id_t" disabled>
                                        </div>
                                      </div>
                                </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-danger" onclick="cerrar_semana_datos();" id="btn_cerrar_semana">CERRAR</button>
                              </div>
                            </div>
                          </div>
                        </div>
                    <!-- FIN MODDAL DE APERUYRA CY CIRRE DE SEMANA -->
                            
                    </div>
                     <!--  datagrid mostrar datos-->
                        <div class="mt-2">
                            <section id="cell-background" style="/*height: 300px; */">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title" id="title-card"></h4>
                                            <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                            <div class="heading-elements">
                                                <ul class="list-inline mb-0">
                                                    <li id="btn-addOE" style="display: none"><a id='btn-add' title="Exportar en Excel"><i class="fas fa-plus"></i></a></li>
                                                    <li id="btn-pdf" style="display: none"><a id='pdfExport' title="Exportar en Pdf"><i class="fas fa-file-pdf"></i></a></li>
                                                    <li id="btn-expand" style="display: none"><a id='expandall' title="Expandir Grupos"><i class="fas fa-angle-double-down"></i></a></li>
                                                    <li id="btn-collapse" style="display: none"><a id='collapseall' title="Collapsar Grupos"><i class="fas fa-angle-double-up"></i></a></li>
                                                    <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="card-content collapse show">
                                            <div class="card-body card-dashboard">
                                                <div id="container-x" class="device-mobile-tablet-container">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        </div>
                        
                    <!-- datagrid mostrar datos -->
               </div>
             </div>
          </div> 
     </div>  
</div>

<!-- modal para editar -->
<div class="modal fade" id="modal_editar_descanso_medico_reg" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <div class="col-md-4">
                    
                        <h5 class="modal-title" id="staticBackdropLabel">DESCANSO  MEDICO</h5>
                         <b><div class="" id="num_documento_1"></div></b>

                </div>
                
                     <button type="button" class="btn-close btn btn-default" data-bs-dismiss="modal" ><i class="fa fa-close"></i></button>
                    
            </div>
            <div class="modal-body">
                <!-- form registrarra modal -->
                <div class="card-body">
                    <!-- form datos del usuario -->
                    <div id="form_descanso_medico">
                        <div class="col-md-10">
                            <h6><div class="" id="semana1"></div></h6>
                        </div>
                         <div class="border border-1 m-2">
                             <div class="container-fluid">
                                <div class="row p-2">
                                    <div class="col-md-6">
                                        <label for="formFileMultiple" class="form-label">Personal(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="descanso_medico_personal_up" id="descanso_medico_personal_up" disabled >
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="formFileMultiple" class="form-label">Num. Celular(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="descanso_medico_num_celular_up" id="descanso_medico_num_celular_up" disabled >
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="formFileMultiple" class="form-label">DNI(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="descanso_medico_dni_up" id="descanso_medico_dni_up" disabled >
                                        </div>
                                    </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin form datos del usuario -->
                    <!-- form DESCANSO medico -->
                    <div id="form_descanso_medico">
                         <div class="border border-1 m-2">
                             <div class="container-fluid">
                                <div class="row p-2">
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Registro(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="text" class="form-control" name="descanso_medico_fecha_registro_up" id="descanso_medico_fecha_registro_up" disabled>
                                           <input type="hidden" name="id_usuario_up" id="id_usuario_up"  />
                                           <input type="hidden" name="id_tipo_documento_up" id="id_tipo_documento_up" />
                                            <input type="hidden" name="id_documento_up" id="id_documento_up" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Inicio(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="descanso_medico_fecha_inicio_up"  id="descanso_medico_fecha_inicio_up"  >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Termino(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="descanso_medico_fecha_fin_up"  id="descanso_medico_fecha_fin_up" >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Numero de Días(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-clock"></i></span>
                                          <input type="text" class="form-control" name="descanso_medico_num_dias_up" id="descanso_medico_num_dias_up" disabled >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Observaciones</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-file-text"></i></span>
                                          <input type="text" class="form-control" name="descanso_medico_observacion_up"  id="descanso_medico_observacion_up"  >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Proviene(*)</label>
                                        <select class="form-control" name="descanso_medico_proviene_up" id="descanso_medico_proviene_up" >
                                          <option selected>seleccione tipo de registro </option>
                                          <option value="Fundo">Fundo</option>
                                          <option value="Planta">Planta</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="formFileMultiple" class="form-label">Doc. Sustentario - CMP(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-file"></i></span>
                                          <input type="text" class="form-control" name="descanso_medico_cmp_up" id="descanso_medico_cmp_up">
                                        </div>
                                    </div>
                                    <div class="col-md-6" id="idCliente_up">
                                        <label for="formFileMultiple" class="form-label">Ingrese Cod. Desc. Diagnostico(*)</label>
                                        <div class="input-group">
                                            <input type="text" id="cDescClieProv_up" class="form-control round descli" placeholder="Ingrese Cod. / Desc. Diagnostico">
                                            <input type="hidden" id="nIdClieProv_up">
                                        </div>
                                    </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin form DESCANSO medico -->

                    <!--  footer del form-->
                    <div class="modal-footer">
                        <div class="col-md-6">
                            
                                <div class="" id="usuario_nombre1"></div>
                            <div class="" id="fecha1"></div>
                            
                        </div>
                        <div class="col-md-2">

                        </div>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CANCELAR</button>
                        <button type="button" class="btn btn-primary" onclick="actualizar_datos_documento();">GUARDAR</button>
                      </div>
                    <!--  footer del form-->
                    </div>
               <!-- fin form registrar modal -->
               </div>
          </div>
    </div>
</div>

    <div class="modal fade" id="modal_editar_atencion_medica_reg" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-warning">
                    <div class="col-md-4">
                        <h5 class="modal-title" id="staticBackdropLabel">ATENCIÓN  MEDICA</h5>
                        <b><div class="" id="num_documento_2"></div></b>
                    </div>
                     <button type="button" class="btn-close btn btn-default" data-bs-dismiss="modal" ><i class="fa fa-close"></i></button>
                </div>
                <div class="modal-body">
                    <!-- form registrarra modal -->
                    <div class="card-body">
                        <!-- form datos del usuario -->
                        <div id="">
                            <div class="col-md-10">
                            <h6><div class="" id="semana2"></div></h6>
                        </div>
                             <div class="border border-1 m-2">
                                 <div class="container-fluid">
                                    <div class="row p-2">
                                        <div class="col-md-6">
                                            <label for="formFileMultiple" class="form-label">Personal(*)</label>
                                            <div class="input-group">
                                              <input type="text" class="form-control" name="atension_medica_personal_up" id="atension_medica_personal_up" disabled >
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="formFileMultiple" class="form-label">Num. Celular(*)</label>
                                            <div class="input-group">
                                              <input type="text" class="form-control" name="atension_medica_num_celular_up" id="atension_medica_num_celular_up" disabled >
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="formFileMultiple" class="form-label">DNI(*)</label>
                                            <div class="input-group">
                                              <input type="text" class="form-control" name="atension_medica_dni_up" id="atension_medica_dni_up" disabled >
                                            </div>
                                        </div>
                                  </div>
                                </div>
                            </div>
                        </div>
                        <!-- fin form datos del usuario -->
                        <!-- form permiso atencion medico -->
                        <div>
                             <div class="border border-1 m-2">
                                 <div class="container-fluid">
                                    <div class="row p-2">
                                        <div class="col-md-4">
                                            <label for="formFileMultiple" class="form-label">Fecha de Atención (*)</label>
                                            <div class="input-group">
                                              <span class="input-group-text" id=""><i class="fa fa-calendar"></i></span>
                                              <input type="text" class="form-control" name="atencion_medica_fecha_atencion_up" id="atencion_medica_fecha_atencion_up" disabled>
                                                <input type="hidden" name="id_usuario_up" id="id_usuario_up"  />
                                               <input type="hidden" name="id_tipo_documento_up" id="id_tipo_documento_up" />
                                                <input type="hidden" name="id_documento_up" id="id_documento_up" />
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Inicio(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id=""><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="atencion_medica_fecha_inicio_up"  id="atencion_medica_fecha_inicio_up"  >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Termino(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id=""><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="atencion_medica_fecha_fin_up"  id="atencion_medica_fecha_fin_up" >
                                        </div>
                                    </div>
                                        <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Motivo(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id=""><i class="fa fa-user"></i></span>
                                          <input type="text" class="form-control" name="atencion_medica_motivo_up"  id="atencion_medica_motivo_up" >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Documentación(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id=""><i class="fa fa-file"></i></span>
                                          <input type="text" class="form-control" name="atencion_medica_documentacion_up"  id="atencion_medica_documentacion_up" >
                                        </div>
                                    </div>
                                        <div class="col-md-4">
                                            <label for="formFileMultiple" class="form-label">Tiempo - Horas(*)</label>
                                            <div class="input-group">
                                              <span class="input-group-text" id=""><i class="fa fa-clock"></i></span>
                                              <input type="text" class="form-control" name="atencion_medica_tiempo_up" id="atencion_medica_tiempo_up">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label for="formFileMultiple" class="form-label">Proviene(*)</label>
                                            <select class="form-control" name="atencion_medica_proviene_up" id="atencion_medica_proviene_up" >
                                              <option value="Fundo">Fundo</option>
                                              <option value="Planta">Planta</option>
                                            </select>
                                        </div>
                                  </div>
                                </div>
                            </div>
                        </div>
                        <!-- fin form permiso atencion medico -->

                        <!--  footer del form-->
                        <div class="modal-footer">
                            <div class="col-md-6">
                            
                                <div class="" id="usuario_nombre2"></div>
                           <div class="" id="fecha2"></div>
                        </div>
                        <div class="col-md-2">

                        </div>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CANCELAR</button>
                            <button type="button" class="btn btn-primary" onclick="actualizar_datos_documento();">GUARDAR</button>
                          </div>
                        <!--  footer del form-->
                    </div>
                   <!-- fin form registrar modal -->
               </div>
            </div>
        </div>
    </div>
   
<div class="modal fade" id="modal_editar_justificados_asistencia_reg" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <div class="col-md-6">
                        <h6 class="modal-title" id="staticBackdropLabel">FALTA JUSTIFICADAS -  BONO ASISTENCIA</h6>
                    <b><div class="" id="num_documento_3"></div></b>
                    </div>
                     <button type="button" class="btn-close btn btn-default" data-bs-dismiss="modal" ><i class="fa fa-close"></i></button>
               
            </div>
            <div class="modal-body">
                <!-- form registrarra modal -->
                <div class="card-body">
                    <!-- form registrarra modal -->
                <div class="card-body">
                    <!-- form datos del usuario -->
                    <div id="form_descanso_medico">
                        <div class="col-md-10">
                            <h6><div class="" id="semana3"></div></h6>
                        </div>
                         <div class="border border-1 m-2">
                             <div class="container-fluid">
                                <div class="row p-2">
                                    <div class="col-md-6">
                                        <label for="formFileMultiple" class="form-label">Personal(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="bono_asistencia_personal_up" id="bono_asistencia_personal_up" disabled >
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="formFileMultiple" class="form-label">Num. Celular(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="bono_asistencia_num_celular_up" id="bono_asistencia_num_celular_up" disabled >
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="formFileMultiple" class="form-label">DNI(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="bono_asistencia_dni_up" id="bono_asistencia_dni_up" disabled >
                                        </div>
                                    </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin form datos del usuario -->
                    <!-- form falta justificacion bono asistencia -->
                    <div id="form_falta_just_bono_asistencia">
                         <div class="border border-1 m-2">
                             <div class="container-fluid">
                                <div class="row p-2">
                                    <div class="col-md-4">
                                            <label for="formFileMultiple" class="form-label">Fecha de Registro (*)</label>
                                            <div class="input-group">
                                              <span class="input-group-text" id=""><i class="fa fa-calendar"></i></span>
                                              <input type="text" class="form-control" name="bono_asistencia_fecha_registro_up" id="bono_asistencia_fecha_registro_up" disabled>
                                                
                                            </div>
                                        </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Inicio(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="bono_asistencia_fecha_ingreso_up" id="bono_asistencia_fecha_ingreso_up" />
                                            <input type="hidden" name="id_usuario_up" id="id_usuario_up"  />
                                           <input type="hidden" name="id_tipo_documento_up" id="id_tipo_documento_up" />
                                            <input type="hidden" name="id_documento_up" id="id_documento_up" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Fin(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY"  name="bono_asistencia_fecha_fin_up" id="bono_asistencia_fecha_fin_up">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Días (*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-clock"></i></span>
                                          <input type="text" class="form-control"  name="bono_asistencia_dias_up" id="bono_asistencia_dias_up" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Motivo(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-user"></i></span>
                                          <input type="text" class="form-control"  name="bono_asistencia_motivo" id="bono_asistencia_motivo_up" >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Documentación(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-file"></i></span>
                                          <input type="text" class="form-control"  name="bono_asistencia_documentacion" id="bono_asistencia_documentacion_up" >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Proviene(*)</label>
                                        <select class="form-control" name="bono_asistencia_proviene_up" id="bono_asistencia_proviene_up" >
                                          <option value="Fundo">Fundo</option>
                                          <option value="Planta">Planta</option>
                                        </select>
                                    </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin form falta justificacion bono asistencia -->

                    <!--  footer del form-->
                    <div class="modal-footer">
                        <div class="col-md-6">
                           
                                <div class="" id="usuario_nombre3"></div>
                           <div class="" id="fecha3"></div>
                        </div>
                        <div class="col-md-2">

                        </div>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CANCELAR</button>
                        <button type="button" class="btn btn-primary" onclick="actualizar_datos_documento();">GUARDAR</button>
                      </div>
                    <!--  footer del form-->
                    </div>
               <!-- fin form registrar modal -->
               </div>
          </div>
    </div>
</div>
 </div>
 
    <div class="modal fade" id="modal_editar_hora_lactanciareg" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <div class="col-md-4">
                        <h5 class="modal-title" id="staticBackdropLabel">HORA  LACTANCIA</h5>
                    <b><div class="" id="num_documento_4"></div></b>
                    </div>
                     <button type="button" class="btn-close btn btn-default" data-bs-dismiss="modal" ><i class="fa fa-close"></i></button>
            </div>
            <div class="modal-body">
                <!-- form registrarra modal -->
                <div class="card-body">
                    <!-- form datos del usuario -->
                    <div id="form_descanso_medico">
                        <div class="col-md-10">
                            <h6><div class="" id="semana4"></div></h6>
                        </div>
                         <div class="border border-1 m-2">
                             <div class="container-fluid">
                                <div class="row p-2">
                                    <div class="col-md-6">
                                        <label for="formFileMultiple" class="form-label">Personal(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="lactancia_personal_up" id="lactancia_personal_up" disabled >
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="formFileMultiple" class="form-label">Num. Celular(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="lactancia_num_celular_up" id="lactancia_num_celular_up" disabled >
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="formFileMultiple" class="form-label">DNI(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="lactancia_dni_up" id="lactancia_dni_up" disabled >
                                        </div>
                                    </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin form datos del usuario -->
                    <!-- form lactancia -->
                    <div id="form_h_lactancia">
                         <div class="border border-1 m-2">
                             <div class="container-fluid">
                                <div class="row p-2">
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Registro(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id=""><i class="fa fa-calendar"></i></span>
                                          <input type="text" class="form-control" name="lactancia_fecha_registro_up" id="lactancia_fecha_registro_up" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Inicio(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="lactancia_fecha_inicio_up" id="lactancia_fecha_inicio_up" >
                                            <input type="hidden" name="id_usuario_up" id="id_usuario_up"  />
                                           <input type="hidden" name="id_tipo_documento_up" id="id_tipo_documento_up" />
                                            <input type="hidden" name="id_documento_up" id="id_documento_up" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Termino(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="lactancia_fecha_termino_up" id="lactancia_fecha_termino_up" >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Lactante(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-user"></i></span>
                                          <input type="text" class="form-control" name="lactancia_lactante_up" id="lactancia_lactante_up" >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Proviene(*)</label>
                                        <select class="form-control" name="lactancia_proviene_up" id="lactancia_proviene_up" >
                                          <option selected>seleccione tipo de </option>
                                          <option value="Fundo">Fundo</option>
                                          <option value="Planta">Planta</option>
                                        </select>
                                    </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin form lactancia -->

                    <!--  footer del form-->
                    <div class="modal-footer">
                        <div class="col-md-6">
                            
                                <div class="" id="usuario_nombre4"></div>
                           <div class="" id="fecha4"></div>
                        </div>
                        <div class="col-md-2">

                        </div>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CANCELAR</button>
                        <button type="button" class="btn btn-primary" onclick="actualizar_datos_documento();">GUARDAR</button>
                      </div>
                    <!--  footer del form-->
                    </div>
               <!-- fin form registrar modal -->
               </div>
          </div>
    </div>
</div>

    <div class="modal fade" id="modal_editar_licencia_paternidad_reg" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <div class="col-md-4">
                        <h5 class="modal-title" id="staticBackdropLabel">LICENCIA POR PATERNIDAD</h5>
                        <b><div class="" id="num_documento_5"></div></b>
                    </div>
                     <button type="button" class="btn-close btn btn-default" data-bs-dismiss="modal" ><i class="fa fa-close"></i></button>
            </div>
            <div class="modal-body">
                <!-- form registrarra modal -->
                <div class="card-body">
                    <!-- form datos del usuario -->
                    <div id="form_descanso_medico">
                        <div class="col-md-10">
                            <h6><div class="" id="semana5"></div></h6>
                        </div>
                         <div class="border border-1 m-2">
                             <div class="container-fluid">
                                <div class="row p-2">
                                    <div class="col-md-6">
                                        <label for="formFileMultiple" class="form-label">Personal(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="paternidad_personal_up" id="paternidad_personal_up" disabled >
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="formFileMultiple" class="form-label">Num. Celular(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="paternidad_num_celular_up" id="paternidad_num_celular_up" disabled >
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="formFileMultiple" class="form-label">DNI(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="paternidad_dni_up" id="paternidad_dni_up" disabled >
                                        </div>
                                    </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin form datos del usuario -->
                    <!-- form paternidad -->
                    <div id="form_licencia_paternidad">
                         <div class="border border-1 m-2">
                             <div class="container-fluid">
                                <div class="row p-2">
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Registro(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id=""><i class="fa fa-calendar"></i></span>
                                          <input type="text" class="form-control" name="paternidad_fecha_registro_up" id="paternidad_fecha_registro_up" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Inicio(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="paternidad_fecha_inicio_up" id="paternidad_fecha_inicio_up">
                                            <input type="hidden" name="id_usuario_up" id="id_usuario_up"  />
                                           <input type="hidden" name="id_tipo_documento_up" id="id_tipo_documento_up" />
                                            <input type="hidden" name="id_documento_up" id="id_documento_up" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Termino(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="paternidad_fecha_termino_up" id="paternidad_fecha_termino_up">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Días (*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-clock"></i></span>
                                          <input type="text" class="form-control" name="paternidad_dias_up" id="paternidad_dias_up" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Vínculo Familiar (*)</label>
                                        <select class="form-control" name="paternidad_vinculo_familiar_up" id="paternidad_vinculo_familiar_up" >
                                          <option selected>Selecciione tipo de registro</option>
                                          <option value="Hijo">Hijo</option>
                                            <option value="Hija">Hija</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Observación</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-file"></i></span>
                                          <input type="text" class="form-control" name="paternidad_observacion_up" id="paternidad_observacion_up">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Proviene(*)</label>
                                        <select class="form-control" name="paternidad_proviene_up" id="paternidad_proviene_up" >
                                          <option selected>seleccione tipo de registro </option>
                                          <option value="Fundo">Fundo</option>
                                          <option value="Planta">Planta</option>
                                        </select>
                                    </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin form paternidad -->

                    <!--  footer del form-->
                    <div class="modal-footer">
                        <div class="col-md-6">
                           
                                <div class="" id="usuario_nombre5"></div>
                           <div class="" id="fecha5"></div>
                        </div>
                        <div class="col-md-2">

                        </div>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CANCELAR</button>
                        <button type="button" class="btn btn-primary" onclick="actualizar_datos_documento();">GUARDAR</button>
                      </div>
                    <!--  footer del form-->
                    </div>
               <!-- fin form registrar modal -->
               </div>
          </div>
    </div>
</div>

    <div class="modal fade" id="modal_editar_licencia_fallecimiento_reg" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <div class="col-md-6">
                        <h6 class="modal-title" id="staticBackdropLabel">LICENCIA POR FALLECIMIENTO DE FAMILIAR DIRECTO</h6>
                        <b><div class="" id="num_documento_6"></div></b>
                    </div>
                    <button type="button" class="btn-close btn btn-default" data-bs-dismiss="modal" ><i class="fa fa-close"></i></button>
            </div>
            <div class="modal-body">
                <!-- form registrarra modal -->
                <div class="card-body">
                    <!-- form datos del usuario -->
                    <div id="form_descanso_medico">
                        <div class="col-md-10">
                            <h6><div class="" id="semana6"></div></h6>
                        </div>
                         <div class="border border-1 m-2">
                             <div class="container-fluid">
                                <div class="row p-2">
                                    <div class="col-md-6">
                                        <label for="formFileMultiple" class="form-label">Personal(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="fallecimiento_personal_up" id="fallecimiento_personal_up" disabled >
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="formFileMultiple" class="form-label">Num. Celular(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="fallecimiento_num_celular_up" id="fallecimiento_num_celular_up" disabled >
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="formFileMultiple" class="form-label">DNI(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="fallecimiento_dni_up" id="fallecimiento_dni_up" disabled >
                                        </div>
                                    </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin form datos del usuario -->
                    <!-- form fallecimiento -->
                    <div id="form_licencia_fallecimiento">
                         <div class="border border-1 m-2">
                             <div class="container-fluid">
                                <div class="row p-2">
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Registro(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id=""><i class="fa fa-calendar"></i></span>
                                          <input type="text" class="form-control" name="fallecimiento_fecha_registro_up" id="fallecimiento_fecha_registro_up" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Inicio(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="fallecimiento_fecha_inicio_up" id="fallecimiento_fecha_inicio_up">
                                            <input type="hidden" name="id_usuario_up" id="id_usuario_up"  />
                                           <input type="hidden" name="id_tipo_documento_up" id="id_tipo_documento_up" />
                                            <input type="hidden" name="id_documento_up" id="id_documento_up" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Termino(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="fallecimiento_fecha_termino_up" id="fallecimiento_fecha_termino_up">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Días (*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-clock"></i></span>
                                          <input type="text" class="form-control" name="fallecimiento_dias_up" id="fallecimiento_dias_up" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fallecido(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-user"></i></span>
                                          <input type="text" class="form-control" name="fallecimiento_fallecido_up" id="fallecimiento_fallecido_up">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Vinculo(*)</label>
                                        <select class="form-control" name="fallecimiento_vinculo_up" id="fallecimiento_vinculo_up" >
                                          <option selected>seleccione tipo de registro </option>
                                          <option value="Madre">Madre</option>
                                            <option value="Padre">Padre</option>
                                            <option value="Conyuge">Conyuge</option>
                                            <option value="Hijo">Hijo</option>
                                            <option value="Hija">Hija</option>
                                            <option value="Hermano">Hermano</option>
                                            <option value="Hermana">Hermana</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Proviene(*)</label>
                                        <select class="form-control" name="fallecimiento_proviene_up" id="fallecimiento_proviene_up" >
                                          <option selected>seleccione tipo de registro </option>
                                          <option value="Fundo">Fundo</option>
                                          <option value="Planta">Planta</option>
                                        </select>
                                    </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin form fallecimiento -->

                    <!--  footer del form-->
                    <div class="modal-footer">
                        <div class="col-md-6">
                            
                                <div class="" id="usuario_nombre6"></div>
                            <div class="" id="fecha6"></div>
                        </div>
                        <div class="col-md-2">

                        </div>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CANCELAR</button>
                        <button type="button" class="btn btn-primary" onclick="actualizar_datos_documento();">GUARDAR</button>
                      </div>
                    <!--  footer del form-->
                    </div>
               <!-- fin form registrar modal -->
               </div>
          </div>
    </div>
</div>

    <div class="modal fade" id="modal_editar_licencia_gose_reg" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <div class="col-md-4">
                        <h5 class="modal-title" id="staticBackdropLabel">LICENCIA CON GOCE</h5>
                        <b><div class="" id="num_documento_7"></div></b>
                    </div>
                     <button type="button" class="btn-close btn btn-default" data-bs-dismiss="modal" ><i class="fa fa-close"></i></button>
            </div>
            <div class="modal-body">
                <!-- form registrarra modal -->
                <div class="card-body">
                    <!-- form datos del usuario -->
                    <div id="form_descanso_medico">
                        <div class="col-md-10">
                            <h6><div class="" id="semana7"></div></h6>
                        </div>
                         <div class="border border-1 m-2">
                             <div class="container-fluid">
                                <div class="row p-2">
                                    <div class="col-md-6">
                                        <label for="formFileMultiple" class="form-label">Personal(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="gose_personal_up" id="gose_personal_up" disabled >
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="formFileMultiple" class="form-label">Num. Celular(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="gose_num_celular_up" id="gose_num_celular_up" disabled >
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="formFileMultiple" class="form-label">DNI(*)</label>
                                        <div class="input-group">
                                          <input type="text" class="form-control" name="gose_dni_up" id="gose_dni_up" disabled >
                                        </div>
                                    </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin form datos del usuario -->
                    <!-- form gose -->
                    <div id="form_licencia_gose">
                         <div class="border border-1 m-2">
                             <div class="container-fluid">
                                <div class="row p-2">
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Registro(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id=""><i class="fa fa-calendar"></i></span>
                                          <input type="text" class="form-control" name="gose_fecha_registro_up" id="gose_fecha_registro_up" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Inicio(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="gose_fecha_inicio_up" id="gose_fecha_inicio_up">
                                            <input type="hidden" name="gid_usuario_up" id="gid_usuario_up"  />
                                           <input type="hidden" name="id_tipo_documento_up" id="id_tipo_documento_up" />
                                            <input type="hidden" name="id_documento_up" id="id_documento_up" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Fecha de Termino(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                          <input type="date" class="form-control" data-date-format="DD MMMM YYYY" name="gose_fecha_termino_up" id="gose_fecha_termino_up">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Días (*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-clock"></i></span>
                                          <input type="text" class="form-control" name="gose_dias_up" id="gose_dias_up" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">Caso(*)</label>
                                        <div class="input-group">
                                          <span class="input-group-text" id="basic-addon1"><i class="fa fa-user"></i></span>
                                          <input type="text" class="form-control" name="gose_caso_up" id="gose_caso_up">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="formFileMultiple" class="form-label">PorviProviene ene(*)</label>
                                        <select class="form-control" name="gose_proviene_up" id="gose_proviene_up" >
                                          <option selected>seleccione tipo de registro </option>
                                          <option value="Fundo">Fundo</option>
                                          <option value="Planta">Planta</option>
                                        </select>
                                    </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin form gose -->

                    <!--  footer del form-->
                    <div class="modal-footer">
                        <div class="col-md-6">
                           
                                <div class="" id="usuario_nombre7"></div>
                            <div class="" id="fecha7"></div>
                        </div>
                        <div class="col-md-2">

                        </div>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CANCELAR</button>
                        <button type="button" class="btn btn-primary" onclick="actualizar_datos_documento();">GUARDAR</button>
                      </div>
                    <!--  footer del form-->
                    </div>
               <!-- fin form registrar modal -->
               </div>
          </div>
    </div>
</div>


<!-- modal para editar -->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script>
    window.addEventListener('load', function () {

        $('#btn_apert_semana_dato').hide();
        $('#btn_cerrar_semana_dato').hide();

        // MOSTRAR LA FECHA DE FORMA AUTMATICA NE UN INPUT
        var fecha_actual_sistema = new Date();
        var mes =fecha_actual_sistema.getMonth() + 1; //obteniendo mes
        var dia = fecha_actual_sistema.getDate(); //obteniendo dia
        if (dia < 10) {
            dia = "0" + dia;
        } else {
            dia = dia;
        }

        if (mes < 10) {
            mes = "0" + mes;
        } else {
            mes = mes;
        }
        var anio = fecha_actual_sistema.getFullYear(); //obteniendo año
        var fecha_actual = dia + "/" + mes + "/" + anio;

        /*alert(fecha_actual);*/

        document.getElementById('descanso_medico_fecha_registro').value = fecha_actual;
        document.getElementById('atencion_medica_fecha_atencion').value = fecha_actual;
        document.getElementById('bono_asistencia_fecha_registro').value = fecha_actual;
        document.getElementById('lactancia_fecha_registro').value = fecha_actual;
        document.getElementById('paternidad_fecha_registro').value = fecha_actual;
        document.getElementById('fallecimiento_fecha_registro').value = fecha_actual;
        document.getElementById('gose_fecha_registro').value = fecha_actual;

        cargar_tabla_inicial();

        // funcion listar AÑOS
        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SerPlanilla.asmx/SER_listar_anio",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);

                var searchBox = $("#anio_busc_filt").dxSelectBox({
                    dataSource: lst,
                    displayExpr: 'SEMANADESC',
                    valueExpr: 'SEMANA',
                    placeholder: "Seleccione",
                    noDataText: "Sin Datos",
                }).dxSelectBox("instance");
            },
            error: function (data) {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'No se ha podido listar los años  !',
                })
            }
        });

        cargar_semana_actual();
    });
    //funcion obneter cdigo diagnostico
    $("#cDescClieProv").autocomplete({
        source: function (request, response) {
            var obj = new Object();
            obj.DOCUMENTO_CODIGO_DIAGNOSTICO = $("#cDescClieProv").val();

            /*alert(obj.DOCUMENTO_CODIGO_DIAGNOSTICO);*/
            $.ajax({
                url: "../SerPlanilla.asmx/SER_listar_diagnostico_ini",
                data: JSON.stringify({ obj: obj }),
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                // dataFilter: function (data) { return data; },
                success: function (data) {
                    response($.map(data.d, function (item) {
                        /*  return {
                              value: item
                          }*/
                        return {
                            label: item.split('-')[0] + " - " + item.split('-')[1],
                            val: item.split('-')[0],
                            num: item.split('-')[2]
                        }
                    }))

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
        },
        select: function (event, ui) {
            // DATOS SELECCIOANDO......
        },
        minLength: 2
    });

    $("#cDescClieProv_up").autocomplete({
        source: function (request, response) {
            var obj = new Object();
            obj.DOCUMENTO_CODIGO_DIAGNOSTICO = $("#cDescClieProv_up").val();

            /*alert(obj.DOCUMENTO_CODIGO_DIAGNOSTICO);*/
            $.ajax({
                url: "../SerPlanilla.asmx/SER_listar_diagnostico_ini",
                data: JSON.stringify({ obj: obj }),
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                // dataFilter: function (data) { return data; },
                success: function (data) {
                    response($.map(data.d, function (item) {
                        /*  return {
                              value: item
                          }*/
                        return {
                            label: item.split('-')[0] + " - " + item.split('-')[1],
                            val: item.split('-')[0],
                            num: item.split('-')[2]
                        }
                    }))

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
        },
        select: function (event, ui) {
            // DATOS SELECCIOANDO......
        },
        minLength: 2
    });

    // ------------------------------------------- funcion para vlaidar .------------------------------ ---//
    function priv_btn_busc_sem_filtro() {
        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SerPlanilla.asmx/SER_obtener_privilegio",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);
                if (lst[0].PRIVILEGIO_BTN_BUSC_SEM_FILTRO == 1) {
                    listar_semana_filtro();
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un error ...',
                        text: 'No tiene permiso para realizar esta acción ...!',
                    })
                }
            },
            error: function (data) {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un error ...',
                    text: 'Tiene errores al realizar dicha consulta ...!',
                })
            }
        });
    }

    function priv_btn_consuta_semana() {
        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SerPlanilla.asmx/SER_obtener_privilegio",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);
                if (lst[0].PRIVILEGIO_BTN_CONSULTA == 1) {
                    filtrar_semana_datos();
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un error ...',
                        text: 'No tiene permiso para realizar esta acción ...!',
                    })
                }
            },
            error: function (data) {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un error ...',
                    text: 'Tiene errores al realizar dicha consulta ...!',
                })
            }
        });
    }

    function priv_btn_apert_semana() {
        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SerPlanilla.asmx/SER_obtener_privilegio",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);
                if (lst[0].PRIVILEGIO_BTN_APERTURA_SEM == 1) {
                    document.getElementById('btn_apert_semana_dato').disabled = false;
                    /*$('#modal_apertura').modal('show');*/
                    registrar_apertura_semana();
                } else {
                    /*document.getElementById('btn_apert_semana_dato').disabled = true;*/
                    $("#btn_apert_semana_dato").hide();
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un error...',
                        text: 'No tiene los permisos necesarios ...!',
                    })
                }
            },
            error: function (data) {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un error ...',
                    text: 'Tiene errores al realizar dicha consulta ...!',
                })
            }
        });
    }

    function priv_btn_cerrar_semana() {

        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SerPlanilla.asmx/SER_obtener_privilegio",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);
                if (lst[0].PRIVILEGIO_BTN_CERRAR_SEM == 1) {
                    document.getElementById('btn_cerrar_semana_dato').disabled = false;
                    
                    verificar_docuemntos_sin_aprobar();
                    /*$('#modal_cerrar').modal('show');*/
                } else {
                    $("#btn_cerrar_semana_dato").hide();
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un error ...',
                        text: 'No tiene los permisos necesarios ...!',
                    })
                }
            },
            error: function (data) {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un error ...',
                    text: 'Tiene errores al realizar dicha consulta ...!',
                })
            }
        });
    }

    function priv_btn_nuevo_registro() {
        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SerPlanilla.asmx/SER_obtener_privilegio",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);
                if (lst[0].PRIVILEGIO_BTN_REGISTRO == 1) {
                    document.getElementById('btn_registrar').disabled = false;
                    $('#modal_form_reg').modal('show');
                } else {
                    /*document.getElementById('btn_registrar').disabled = true;*/
                    $('#btn_registrar').hide();
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un error ...',
                        text: 'No tiene los permisos necesarios ...!',
                    })
                }
            },
            error: function (data) {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un error ...',
                    text: 'Tiene errores al realizar dicha consulta ...!',
                })
            }
        });
    }

    function priv_btn_editar(documento_id, documento_tipo_id, documento_estado) {
        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SerPlanilla.asmx/SER_obtener_privilegio",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);
                if (lst[0].PRIVILEGIO_EDITAR == 1) {
                    listar_documento_individual(documento_id, documento_tipo_id, documento_estado);
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un error ...',
                        text: 'No tiene permiso para editar ...!',
                    })
                }
            },
            error: function (data) {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un error ...',
                    text: 'Tiene errores al realizar dicha consulta ...!',
                })
            }
        });
    }

    function priv_btn_anular(documento_id, documento_estado) {
        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SerPlanilla.asmx/SER_obtener_privilegio",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);
                if (lst[0].PRIVILEGIO_ANULAR == 1) {
                    anular_documento(documento_id, documento_estado);
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un error ...',
                        text: 'No tiene permiso para anular ...!',
                    })
                }
            },
            error: function (data) {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un error ...',
                    text: 'Tiene errores al realizar dicha consulta ...!',
                })
            }
        });
    }

    function priv_btn_aprobar(documento_id, documento_estado) {

        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SerPlanilla.asmx/SER_obtener_privilegio",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);
                if (lst[0].PRIVILEGIO_APROBAR == 1) {
                    aprobar_documento(documento_id, documento_estado);
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un error ...',
                        text: 'No tiene permiso para Aprobar ...!',
                    })
                }
            },
            error: function (data) {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un error ...',
                    text: 'Tiene errores al realizar dicha consulta ...!',
                })
            }
        });
    }
    // ----------------------------------------- fin funcion para vlaidar .------------------------------ ---//
    // CARGAR SEMANA ACTUAL
    function cargar_semana_actual() {
        // SELECCIONAR LAS SEMANA ACTUAL
        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SerPlanilla.asmx/SER_listar_semana_actual",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                //capturamos los datos
                var lst = JSON.parse(data.d);
                if (lst[0] == null) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un error ...',
                        text: 'El DNI ingresado no está registrado...!',
                    })
                } else {
                    var anio = lst[0].nAnio;
                    var id = lst[0].cIdSemana;
                    var semana = lst[0].semana;
                    var fecha_inicio = lst[0].dFechaIni;
                    var fecha_fin = lst[0].dFechaFin;
                    var Estado = lst[0].bEstado;

                    if (Estado == "ABIERTO") {
                        $("#btn_registrar").show();
                        $("#btn_apert_semana_dato").hide();
                        $("#btn_cerrar_semana_dato").show();

                    } else {
                        $("#btn_registrar").hide();
                        $("#btn_apert_semana_dato").show();
                        $("#btn_cerrar_semana_dato").hide();
                    }
                    /*alert(semana);*/
                    // mostramos los datos del personal
                    document.getElementById("anio_busc_filt").value = anio;
                    var x = document.getElementById("semana_busc_filt");
                    var option = document.createElement("option");
                    option.value = id;
                    option.text = semana;
                    x.add(option);

                    document.getElementById("fecha_inicio_filt").value = fecha_inicio;
                    document.getElementById("fecha_fin_filt").value = fecha_fin;
                    document.getElementById("estado_filt").value = Estado;


                }
            },
            error: function (data) {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un error...',
                    text: 'Tiene errores al ejecutar la instrucción ...!',
                })
            }
        });

    }

    // FUNCUON PARA LISTAR TABLAS
    function cargar_tabla_inicial() {

        // OCULTAMOS LOS FPRMULARIOS DE REGISTRO.
        document.getElementById('form_descanso_medico').style.display = 'none';
        document.getElementById('form_permiso_atension_medica').style.display = 'none';
        document.getElementById('form_falta_just_bono_asistencia').style.display = 'none';
        document.getElementById('form_h_lactancia').style.display = 'none';
        document.getElementById('form_licencia_paternidad').style.display = 'none';
        document.getElementById('form_licencia_fallecimiento').style.display = 'none';
        document.getElementById('form_licencia_gose').style.display = 'none';

        // FUNCION PARA LISTAR TODOS LOS DATOS DEL DOCUMENTO.
        var fecha_actual_sistema = new Date();
        var mes = fecha_actual_sistema.getMonth() + 1; //obteniendo mes
        var dia = fecha_actual_sistema.getDate(); //obteniendo dia
        if (dia < 10) {
            dia = "0" + dia;
        } else {
            dia = dia;
        }

        if (mes < 10) {
            mes = "0" + mes;
        } else {
            mes = mes;
        }
        var anio = fecha_actual_sistema.getFullYear(); //obteniendo año
        var fecha_actual = dia + "/" + mes + "/" + anio;

        /*alert(fecha_actual);*/
        var obj = new Object();
        /*obj.FECHA_ACTAUL_SISTEMA = fecha_actual;*/
        $.ajax({
            type: 'POST',
            url: "../SerPlanilla.asmx/SER_listar_documento2",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);
                $('#container-x').html('<div class=""><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="gridDeleteSelected"></div><div id="DataGrid"></div>');
                TbDataGrid(lst);
            },
            error: function (data) {
                alert("error");
            }
        });

        function TbDataGrid(data) {
            DevExpress.localization.locale('es');
            var dataGrid = $("#DataGrid").dxDataGrid({
                dataSource: data,
                scrolling: {
                    mode: 'virtual'
                },
                grouping: {
                    autoExpandAll: false
                },
                // seleccianr de comunas.
                columnChooser: {
                    enabled: true
                },
                groupPanel: {
                    visible: true
                },
                allowColumnReordering: true,
                allowColumnResizing: true,
                columnMinWidth: 30,
                columnAutoWidth: true,
                showBorders: true,
                columnFixing: {
                    enabled: true
                },
                showRowLines: true,
                showColumnLines: true,
                rowAlternationEnabled: true,
                RowAutoHeight: true,
                showBorders: true,
                export: {
                    enabled: true,
                    fileName: "Reporte de Descansos y Licencias"
                },
                // evento para poner visible las columas oclutas y poder exportar.
                onExporting: function (e) {
                    e.component.columnOption("cNroDocumento", "visible", true);
                    e.component.columnOption("DOCUMENTO_CMP", "visible", true);
                    e.component.columnOption("DOCUMENTO_CODIGO_DIAGNOSTICO", "visible", true);
                    e.component.columnOption("DOCUMENTO_DIAGNOSTICO", "visible", true);
                    e.component.columnOption("DOCIEMENTO_OBSERVACIONES", "visible", true);
                    e.component.columnOption("DOCUMENTO_MOTIVO", "visible", true);
                    e.component.columnOption("DOCUMENTO_DOCUMENTACION", "visible", true);
                    e.component.columnOption("DOCUMENTO_LACTANTE", "visible", true);
                    e.component.columnOption("DOCUMENTO_VINCULO_FAMILIAR", "visible", true);
                    e.component.columnOption("DOCUMENTO_FALLECIDO", "visible", true);
                    e.component.columnOption("DOCUMENTO_CASO", "visible", true);
                    e.component.endUpdate();
                },
                onExported: function (e) {
                    e.component.columnOption("cNroDocumento", "visible", false);
                    e.component.columnOption("DOCUMENTO_CMP", "visible", false);
                    e.component.columnOption("DOCUMENTO_CODIGO_DIAGNOSTICO", "visible", false);
                    e.component.columnOption("DOCUMENTO_DIAGNOSTICO", "visible", false);
                    e.component.columnOption("DOCIEMENTO_OBSERVACIONES", "visible", false);
                    e.component.columnOption("DOCUMENTO_MOTIVO", "visible", false);
                    e.component.columnOption("DOCUMENTO_DOCUMENTACION", "visible", false);
                    e.component.columnOption("DOCUMENTO_LACTANTE", "visible", false);
                    e.component.columnOption("DOCUMENTO_VINCULO_FAMILIAR", "visible", false);
                    e.component.columnOption("DOCUMENTO_FALLECIDO", "visible", false);
                    e.component.columnOption("DOCUMENTO_CASO", "visible", false);
                    e.component.endUpdate();
                },
                filterRow: {
                    visible: false,
                    applyFilter: "auto"
                },
                searchPanel: {
                    visible: false,
                    placeholder: "Search..."
                },
                headerFilter: {
                    visible: false
                },
                editing: {
                    mode: "row",
                    allowDeleting: true,
                    useIcons: true,
                    width: 50
                },
                //  groupIndex: 0,
                columns: [
                    , { caption: "N°", dataField: "DOCUMENTO_ID" }
                    , { caption: "Fec. Registro", dataField: "DOCUMENTO_FECHA_REGISTRO", width: 75 }
                    , { caption: "Fec. Inicio", dataField: "DOCUMENTO_FECHA_INICIO" }
                    , { caption: "Fec. Fin", dataField: "DOCUMENTO_FECHA_FIN" }
                    , { caption: "Días/Horas", dataField: "TIEMPO", width: 65 }
                    , { caption: "DNI", dataField: "cNroDocumento", visible: false }
                    , { caption: "Personal", dataField: "PERSONAL" }
                    , { caption: "Proviene", dataField: "DOCUMENTO_PROVIENE", width: 55 }
                    , {
                        caption: "Estado",
                        dataField: "DOCUMENTO_ESTADO",
                        cellTemplate: function (container, options) {
                            if (options.row.data.DOCUMENTO_ESTADO == "APROBADO") {
                                $("<div>")
                                    .append(options.value)
                                    .css("color", "#0a2a3b")
                                    .css("font-weight", "bold")
                                    .css("font-size", "10px")
                                    .appendTo(container);
                            } else if (options.row.data.DOCUMENTO_ESTADO == "CERRADO") {
                                $("<div>")
                                    .append(options.value)
                                    .css("color", "#ed1d0e")
                                    .css("font-weight", "bold")
                                    .css("font-size", "10px")
                                    .appendTo(container);
                            } else if (options.row.data.DOCUMENTO_ESTADO == "ANULADO") {
                                $("<div>")
                                    .append(options.value)
                                    .css("color", "#0a2a3b")
                                    .css("font-weight", "bold")
                                    .css("font-size", "10px")
                                    .appendTo(container);
                            } else if (options.row.data.DOCUMENTO_ESTADO == "PENDIENTE") {
                                $("<div>")
                                    .append(options.value)
                                    .css("color", "#0a2a3b")
                                    .css("font-weight", "bold")
                                    .css("font-size", "10px")
                                    .appendTo(container);
                            }
                        }
                    }
                    , { caption: "Tipo Reg.", dataField: "TIPO_REGISTRO_NOMBRE" }
                    , { caption: "Doc. Sustentario", dataField: "DOCUMENTO_CMP", visible: false }
                    , { caption: "Cod. Diagnóstico", dataField: "DOCUMENTO_CODIGO_DIAGNOSTICO", visible: false }
                    , { caption: "Diagnóstico", dataField: "DOCUMENTO_DIAGNOSTICO", visible: false }
                    , { caption: "Observaciones", dataField: "DOCIEMENTO_OBSERVACIONES", visible: false }
                    , { caption: "Motivo", dataField: "DOCUMENTO_MOTIVO", visible: false  }
                    , { caption: "Documentación", dataField: "DOCUMENTO_DOCUMENTACION", visible: false  }
                    , { caption: "Lactante", dataField: "DOCUMENTO_LACTANTE", visible: false }
                    , { caption: "Vinc. Familiar", dataField: "DOCUMENTO_VINCULO_FAMILIAR", visible: false  }
                    , { caption: "Fallecido", dataField: "DOCUMENTO_FALLECIDO", visible: false }
                    , { caption: "Caso", dataField: "DOCUMENTO_CASO", visible: false }
                    , {
                        caption: "Editar",
                        type: "buttons",
                        buttons: [{
                            icon: "edit",
                            onClick: function (e) {
                                if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 1) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                } else if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 2) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                } else if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 3) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                } else if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 4) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                } else if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 5) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                } else if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 6) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                } else if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 7) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                }

                            }
                        }]
                    }
                    , {
                        caption: "Anular",
                        type: "buttons",
                        buttons: [{
                            icon: "trash",
                            onClick: function (e) {
                                priv_btn_anular(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                            }
                        }]
                    }
                    , {
                        caption: "Aprobar",
                        type: "buttons",
                        buttons: [{
                            icon: "check",
                            onClick: function (e) {
                                priv_btn_aprobar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                            }
                        }]
                    }
                ],
                sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }],
                summary: {
                    groupItems: [{
                        column: "DOCUMENTO_ID",
                        summaryType: "count",
                        displayFormat: "{0} Postulantes",
                    }]
                },
                onSelectionChanged: function (selectedItems) {
                    changedBySelectBox = false;
                    var data = selectedItems.selectedRowsData;
                    if (data.length > 0)

                        cad_id = $.map(data, function (value) {
                            return value.nIdPersona;
                        }).join(";")
                    else
                        cad_id = '';
                    $("#Div_close_part").hide();
                    var elements = cad_id.split(';');
                    $('#selx').text(elements.length);
                    if (!changedBySelectBox)
                        changedBySelectBox = false;
                    if (cad_id != '') {
                        $("#Div_close_part").show();
                    } else {
                        $("#Div_close_part").hide();
                    }
                },
                onRowRemoving: function (e) {
                    DeleteSeleccion(e.key.nIdPersona, '0');
                },
                onRowRemoved: function (e) {
                }

            }).dxDataGrid("instance");

            

            $("#autoExpand").dxCheckBox({
                value: false,
                text: "Expandir",
                onValueChanged: function (data) {
                    dataGrid.option("grouping.autoExpandAll", data.value);
                }
            });

            $("#filterRow").dxCheckBox({
                text: "Buscar",
                value: false,
                onValueChanged: function (data) {
                    dataGrid.clearFilter();
                    dataGrid.option("filterRow.visible", data.value);
                }
            });

            $("#headerFilter").dxCheckBox({
                text: "Filtro",
                value: false,
                onValueChanged: function (data) {
                    dataGrid.clearFilter();
                    dataGrid.option("headerFilter.visible", data.value);
                }
            });

        }
        // LISTAMOS LOS DATOS DE TIPO DE REGISTRO EN EL SELECT.
        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SerPlanilla.asmx/SER_listar_tipo_registro",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);
                $('#tipo_registro').html('<option value="0">Seleccione tipo de registro</option>');
                for (var i = 0; i < lst.length; i++) {
                    var x = document.getElementById("tipo_registro");
                    var option = document.createElement("option");
                    option.value = lst[i].TIPO_REGISTRO_ID;
                    option.text = lst[i].TIPO_REGISTRO_NOMBRE;
                    x.add(option);
                }
            },
            error: function (data) {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'No se ha podido listar tipos de registro  !',
                })
            }
        });
    }

    // FUNCION MOSTRAR FORMULARIOS SEGUN EL TIPOD DE REGISTRO
    document.getElementById('tipo_registro').onchange = function () {
        var id_select = this.value;
        if (id_select == 1) {
            document.getElementById('form_descanso_medico').style.display = 'block';
            document.getElementById('form_permiso_atension_medica').style.display = 'none';
            document.getElementById('form_falta_just_bono_asistencia').style.display = 'none';
            document.getElementById('form_h_lactancia').style.display = 'none';
            document.getElementById('form_licencia_paternidad').style.display = 'none';
            document.getElementById('form_licencia_fallecimiento').style.display = 'none';
            document.getElementById('form_licencia_gose').style.display = 'none';
        } else if (id_select == 2) {
            document.getElementById('form_descanso_medico').style.display = 'none';
            document.getElementById('form_permiso_atension_medica').style.display = 'block';
            document.getElementById('form_falta_just_bono_asistencia').style.display = 'none';
            document.getElementById('form_h_lactancia').style.display = 'none';
            document.getElementById('form_licencia_paternidad').style.display = 'none';
            document.getElementById('form_licencia_fallecimiento').style.display = 'none';
            document.getElementById('form_licencia_gose').style.display = 'none';
        } else if (id_select == 3) {
            document.getElementById('form_descanso_medico').style.display = 'none';
            document.getElementById('form_permiso_atension_medica').style.display = 'none';
            document.getElementById('form_falta_just_bono_asistencia').style.display = 'block';
            document.getElementById('form_h_lactancia').style.display = 'none';
            document.getElementById('form_licencia_paternidad').style.display = 'none';
            document.getElementById('form_licencia_fallecimiento').style.display = 'none';
            document.getElementById('form_licencia_gose').style.display = 'none';
        } else if (id_select == 4) {
            document.getElementById('form_descanso_medico').style.display = 'none';
            document.getElementById('form_permiso_atension_medica').style.display = 'none';
            document.getElementById('form_falta_just_bono_asistencia').style.display = 'none';
            document.getElementById('form_h_lactancia').style.display = 'block';
            document.getElementById('form_licencia_paternidad').style.display = 'none';
            document.getElementById('form_licencia_fallecimiento').style.display = 'none';
            document.getElementById('form_licencia_gose').style.display = 'none';
        } else if (id_select == 5) {
            document.getElementById('form_descanso_medico').style.display = 'none';
            document.getElementById('form_permiso_atension_medica').style.display = 'none';
            document.getElementById('form_falta_just_bono_asistencia').style.display = 'none';
            document.getElementById('form_h_lactancia').style.display = 'none';
            document.getElementById('form_licencia_paternidad').style.display = 'block';
            document.getElementById('form_licencia_fallecimiento').style.display = 'none';
            document.getElementById('form_licencia_gose').style.display = 'none';
        } else if (id_select == 6) {
            document.getElementById('form_descanso_medico').style.display = 'none';
            document.getElementById('form_permiso_atension_medica').style.display = 'none';
            document.getElementById('form_falta_just_bono_asistencia').style.display = 'none';
            document.getElementById('form_h_lactancia').style.display = 'none';
            document.getElementById('form_licencia_paternidad').style.display = 'none';
            document.getElementById('form_licencia_fallecimiento').style.display = 'block';
            document.getElementById('form_licencia_gose').style.display = 'none';
        } else if (id_select == 7) {
            document.getElementById('form_descanso_medico').style.display = 'none';
            document.getElementById('form_permiso_atension_medica').style.display = 'none';
            document.getElementById('form_falta_just_bono_asistencia').style.display = 'none';
            document.getElementById('form_h_lactancia').style.display = 'none';
            document.getElementById('form_licencia_paternidad').style.display = 'none';
            document.getElementById('form_licencia_fallecimiento').style.display = 'none';
            document.getElementById('form_licencia_gose').style.display = 'block';
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'Dicha opcion no es valida  !',
            })
        }
    }

    // FUNCION LISTAR DATOS DEL USUARIO
    function listar_datos() {
        var obj = new Object();
        // validamos el campo.
        var dni_usuario = document.getElementById('usuario_dni_busc').value;
        if (dni_usuario != "") {
            const dni_cant_val = /^\d{8}$/;
            if (dni_cant_val.test(dni_usuario)) {
                const dni_parametro_val = /^[0-9]+$/;
                if (dni_parametro_val.test(dni_usuario)) {
                    obj.USUARIO_DNI = dni_usuario;
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un error ...',
                        text: 'El DNI no cumple con los parámetros establecidos ...!',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un error...',
                    text: 'El DNI tiene que tener 8 dígitos y positivos ...!',
                })
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un error ...',
                text: 'El campo este vacío !',
            })
        }

        $.ajax({
            type: 'POST',
            url: "../SerPlanilla.asmx/SER_listar_usuario",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                //capturamos los datos
                var lst = JSON.parse(data.d);
                if (lst[0] == null) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un error ...',
                        text: 'El DNI ingresado no está registrado...!',
                    })
                } else {
                    var id = lst[0].nIdPersonal;
                    var nombres = lst[0].cNombre;
                    var apellidos = lst[0].cApPaterno + " " + lst[0].cApMaterno;
                    var dni = lst[0].cNroDocumento;
                    var cod_planilla = lst[0].cIdPlanilla;
                    var fecha_ingreso = lst[0].dFechaRegistro;
                    var cargo = lst[0].cGrupoTrabajo;

                    // mostramos los datos del personal
                    document.getElementById("usuario_dni").value = dni;
                    document.getElementById("usuario_nombres").value = nombres + " " + apellidos;
                    document.getElementById("usuario_codigo_planilla").value = cod_planilla;
                    document.getElementById("usuario_cargo").value = cargo;

                    document.getElementById("usuario_id").value = id;
                }
            },
            error: function (data) {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un error...',
                    text: 'Tiene errores al ejecutar la instrucción ...!',
                })
            }
        });
    }

    // evento para calcular los dias - DESCANSO MEDICO
    descanso_medico_fecha_fin.oninput = function () {
        var timeStart = new Date(document.getElementById('descanso_medico_fecha_inicio').value);
        var timeEnd = new Date(document.getElementById('descanso_medico_fecha_fin').value);
        var actualDate = new Date();
        if (timeEnd > timeStart) {
            var diff = timeEnd.getTime() - timeStart.getTime();
            var dias = Math.round(diff / (1000 * 60 * 60 * 24));
            document.getElementById('descanso_medico_num_dias').value = dias + 1;
        } else if (timeStart.getTime() == timeEnd.getTime()) {
            document.getElementById('descanso_medico_num_dias').value = 1;
        } else if (timeEnd != null && timeEnd < timeStart) {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'La fecha Final debe de ser mayor o igual a la fecha inicial  !',
            })
        }
    }

    // evento para calcular los dias - TAENSION MEDICA
    atencion_medica_fecha_fin.oninput = function () {
        var timeStart = new Date(document.getElementById('atencion_medica_fecha_inicio').value);
        var timeEnd = new Date(document.getElementById('atencion_medica_fecha_fin').value);
        var actualDate = new Date();
        if (timeEnd > timeStart) {
            var diff = timeEnd.getTime() - timeStart.getTime();
            var dias = Math.round(diff / (1000 * 60 * 60 * 24));
            var dias_atension_medica = dias + 1;
        } else if (timeStart.getTime() == timeEnd.getTime()) {
            var dias_atension_medica = 1;
        }else if (timeEnd != null && timeEnd < timeStart) {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'La fecha Final debe de ser mayor o igual a la fecha inicial  !',
            })
        }
    }

    // evento para calcular los dias - FALTA - JUSTIFICADA - BONO ASISTENCIA
    bono_asistencia_fecha_fin.oninput = function () {
        var timeStart = new Date(document.getElementById('bono_asistencia_fecha_ingreso').value);
        var timeEnd = new Date(document.getElementById('bono_asistencia_fecha_fin').value);
        var actualDate = new Date();
        if (timeEnd > timeStart) {
            var diff = timeEnd.getTime() - timeStart.getTime();
            var dias = Math.round(diff / (1000 * 60 * 60 * 24));
            document.getElementById('bono_asistencia_dias').value = dias + 1;
        } else if (timeStart.getTime() == timeEnd.getTime()) {
            document.getElementById('bono_asistencia_dias').value = 1;
        }else if (timeEnd != null && timeEnd < timeStart) {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'La fecha Final debe de ser mayor o igual a la fecha inicial  !',
            })
        }
    }

    // evento para calcular los dias - LICENCIA - PATERNIDAD
    paternidad_fecha_termino.oninput = function () {
        var timeStart = new Date(document.getElementById('paternidad_fecha_inicio').value);
        var timeEnd = new Date(document.getElementById('paternidad_fecha_termino').value);
        var actualDate = new Date();
        if (timeEnd > timeStart) {
            var diff = timeEnd.getTime() - timeStart.getTime();
            var dias = Math.round(diff / (1000 * 60 * 60 * 24));
            document.getElementById('paternidad_dias').value = dias + 1;
        } else if (timeStart.getTime() == timeEnd.getTime()) {
            document.getElementById('paternidad_dias').value = 1;
        }else if (timeEnd != null && timeEnd < timeStart) {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'La fecha Final debe de ser mayor o igual a la fecha inicial  !',
            })
        }
    }

    // evento para calcular los dias - LICENCIA - FALLECIMIENTO
    fallecimiento_fecha_termino.oninput = function () {
        var timeStart = new Date(document.getElementById('fallecimiento_fecha_inicio').value);
        var timeEnd = new Date(document.getElementById('fallecimiento_fecha_termino').value);
        var actualDate = new Date();
        if (timeEnd > timeStart) {
            var diff = timeEnd.getTime() - timeStart.getTime();
            var dias = Math.round(diff / (1000 * 60 * 60 * 24));
            document.getElementById('fallecimiento_dias').value = dias + 1;
        } else if (timeStart.getTime() == timeEnd.getTime()) {
            document.getElementById('fallecimiento_dias').value = 1;
        }else if (timeEnd != null && timeEnd < timeStart) {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'La fecha Final debe de ser mayor o igual a la fecha inicial  !',
            })
        }
    }

    // evento para calcular los dias - LICENCIA - GOSE
    gose_fecha_termino.oninput = function () {
        var timeStart = new Date(document.getElementById('gose_fecha_inicio').value);
        var timeEnd = new Date(document.getElementById('gose_fecha_termino').value);
        var actualDate = new Date();
        if (timeEnd > timeStart) {
            var diff = timeEnd.getTime() - timeStart.getTime();
            var dias = Math.round(diff / (1000 * 60 * 60 * 24));
            document.getElementById('gose_dias').value = dias + 1;
        } else if (timeStart.getTime() == timeEnd.getTime()) {
            document.getElementById('gose_dias').value = 1;
        }else if (timeEnd != null && timeEnd < timeStart) {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'La fecha Final debe de ser mayor o igual a la fecha inicial  !',
            })
        }
    }
    // actulizar FECHAS -------------------------------------
    // evento para calcular los dias - DESCANSO MEDICO
    descanso_medico_fecha_fin_up.oninput = function () {
        var timeStart = new Date(document.getElementById('descanso_medico_fecha_inicio_up').value);
        var timeEnd = new Date(document.getElementById('descanso_medico_fecha_fin_up').value);
        var actualDate = new Date();
        if (timeEnd > timeStart) {
            var diff = timeEnd.getTime() - timeStart.getTime();
            var dias = Math.round(diff / (1000 * 60 * 60 * 24));
            document.getElementById('descanso_medico_num_dias_up').value = dias + 1;
        } else if (timeStart.getTime() == timeEnd.getTime()) {
            document.getElementById('descanso_medico_num_dias_up').value =  1;
        }else if (timeEnd != null && timeEnd < timeStart) {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'La fecha Final debe de ser mayor o igual a la fecha inicial  !',
            })
        }
    }

    // evento para calcular los dias - TAENSION MEDICA
    atencion_medica_fecha_fin_up.oninput = function () {
        var timeStart = new Date(document.getElementById('atencion_medica_fecha_inicio_up').value);
        var timeEnd = new Date(document.getElementById('atencion_medica_fecha_fin_up').value);
        var actualDate = new Date();
        if (timeEnd > timeStart) {
            var diff = timeEnd.getTime() - timeStart.getTime();
            var dias = Math.round(diff / (1000 * 60 * 60 * 24));
            var dias_atension_medica = dias + 1;
        } else if (timeStart.getTime() == timeEnd.getTime()) {
            var dias_atension_medica = 1;
        }else if (timeEnd != null && timeEnd < timeStart) {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'La fecha Final debe de ser mayor o igual a la fecha inicial  !',
            })
        }
    }

    // evento para calcular los dias - FALTA - JUSTIFICADA - BONO ASISTENCIA
    bono_asistencia_fecha_fin_up.oninput = function () {
        var timeStart = new Date(document.getElementById('bono_asistencia_fecha_ingreso_up').value);
        var timeEnd = new Date(document.getElementById('bono_asistencia_fecha_fin_up').value);
        var actualDate = new Date();
        if (timeEnd > timeStart) {
            var diff = timeEnd.getTime() - timeStart.getTime();
            var dias = Math.round(diff / (1000 * 60 * 60 * 24));
            document.getElementById('bono_asistencia_dias_up').value = dias + 1;
        } else if (timeStart.getTime() == timeEnd.getTime()) {
            document.getElementById('bono_asistencia_dias_up').value = 1;
        }else if (timeEnd != null && timeEnd < timeStart) {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'La fecha Final debe de ser mayor o igual a la fecha inicial  !',
            })
        }
    }

    // evento para calcular los dias - LICENCIA - PATERNIDAD
    paternidad_fecha_termino_up.oninput = function () {
        var timeStart = new Date(document.getElementById('paternidad_fecha_inicio_up').value);
        var timeEnd = new Date(document.getElementById('paternidad_fecha_termino_up').value);
        var actualDate = new Date();
        if (timeEnd > timeStart) {
            var diff = timeEnd.getTime() - timeStart.getTime();
            var dias = Math.round(diff / (1000 * 60 * 60 * 24));
            document.getElementById('paternidad_dias_up').value = dias + 1;
        } else if (timeStart.getTime() == timeEnd.getTime()) {
            document.getElementById('paternidad_dias_up').value = 1;
        }else if (timeEnd != null && timeEnd < timeStart) {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'La fecha Final debe de ser mayor o igual a la fecha inicial  !',
            })
        }
    }

    // evento para calcular los dias - LICENCIA - FALLECIMIENTO
    fallecimiento_fecha_termino_up.oninput = function () {
        var timeStart = new Date(document.getElementById('fallecimiento_fecha_inicio_up').value);
        var timeEnd = new Date(document.getElementById('fallecimiento_fecha_termino_up').value);
        var actualDate = new Date();
        if (timeEnd > timeStart) {
            var diff = timeEnd.getTime() - timeStart.getTime();
            var dias = Math.round(diff / (1000 * 60 * 60 * 24));
            document.getElementById('fallecimiento_dias_up').value = dias + 1;
        } else if (timeStart.getTime() == timeEnd.getTime()) {
            document.getElementById('fallecimiento_dias_up').value = 1;
        }else if (timeEnd != null && timeEnd < timeStart) {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'La fecha Final debe de ser mayor o igual a la fecha inicial  !',
            })
        }
    }

    // evento para calcular los dias - LICENCIA - GOSE
    gose_fecha_termino_up.oninput = function () {
        var timeStart = new Date(document.getElementById('gose_fecha_inicio_up').value);
        var timeEnd = new Date(document.getElementById('gose_fecha_termino_up').value);
        var actualDate = new Date();
        if (timeEnd > timeStart) {
            var diff = timeEnd.getTime() - timeStart.getTime();
            var dias = Math.round(diff / (1000 * 60 * 60 * 24));
            document.getElementById('gose_dias_up').value = dias + 1;
        } else if (timeStart.getTime() == timeEnd.getTime()) {
            document.getElementById('gose_dias_up').value = 1;
        }else if (timeEnd != null && timeEnd < timeStart) {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'La fecha Final debe de ser mayor a la fecha inicial  !',
            })
        }
    }

    // FUNCION REGISTRAR DATOS DEL DOCUMENTO.
    function registrar_documento() {
        var id_select = document.getElementById('tipo_registro');
        var id_tipo_registro = id_select.value;

        // Opcion para enviar datos segun el tipo de registro.
        if (id_tipo_registro == 1) {
            var fecha_registro_ini = document.getElementById('descanso_medico_fecha_registro').value;
            var fecha_inicio = document.getElementById('descanso_medico_fecha_inicio').value;
            var fecha_fin = document.getElementById('descanso_medico_fecha_fin').value;
            var dias = document.getElementById('descanso_medico_num_dias').value;
            var cmp = document.getElementById('descanso_medico_cmp').value;//por validar

            var DIAG = document.getElementById('cDescClieProv').value;

            var cadena = DIAG.split("-");
            // dividimos los campos 
            var cod_diagnostico = cadena[0]; // por validar
            var diagnostico = cadena[1];

            var observaciones = document.getElementById('descanso_medico_observacion').value;
            var proviene = document.getElementById('descanso_medico_proviene').value;
            var id_usuario = document.getElementById('usuario_id').value;

            // obtenemos fecha final  de la semana
            var fecha_fin_ini = document.getElementById('fecha_fin_filt').value;

            // validamoas las fechas
            if (fecha_registro_ini.valueOf() > fecha_fin_ini.valueOf()) {
                fecha_registro = fecha_fin_ini;
            } else {
                fecha_registro = fecha_registro_ini;
            }

            // validamos los campos
            if (fecha_registro.length) {
                fecha_inicio_val = new Date(fecha_inicio);
                fecha_fin_val = new Date(fecha_fin);
                if (fecha_inicio_val < fecha_fin_val || fecha_inicio_val.getTime() == fecha_fin_val.getTime()) {
                    if (cmp != "") {
                        if (proviene == "Fundo" || proviene == "Planta") {
                            if (id_usuario != "") {
                                if (cod_diagnostico != "") {
                                    var obj = new Object();
                                    obj.DOCUMENTO_FECHA_REGISTRO = fecha_registro;
                                    obj.DOCUMENTO_FECHA_INICIO = fecha_inicio;
                                    obj.DOCUMENTO_FECHA_FIN = fecha_fin;
                                    obj.DOCUMENTO_DIAS = dias;
                                    obj.DOCUMENTO_CMP = cmp;
                                    obj.DOCUMENTO_CODIGO_DIAGNOSTICO = cod_diagnostico;
                                    obj.DOCUMENTO_DIAGNOSTICO = diagnostico;
                                    obj.DOCUMENTO_OBSERVACIONES = observaciones;
                                    obj.DOCUMENTO_PROVIENE = proviene;

                                    obj.DOCUMENTO_MOTIVO = "";
                                    obj.DOCUMENTO_DOCUMENTACION = "";
                                    obj.DOCUMENTO_HORAS = "";
                                    obj.DOCUMENTO_LACTANTE = "";
                                    obj.DOCUMENTO_VINCULO_FAMILIAR = "";
                                    obj.DOCUMENTO_FALLECIDO = "";
                                    obj.DOCUMENTO_CASO = "";

                                    obj.DOCUMENTO_ESTADO = "PENDIENTE";
                                    obj.DOCUMENTO_TIPO_DOCUMENTO_ID = id_tipo_registro;
                                    obj.DOCUMENTO_PERSONAL_ID = id_usuario;

                                    $.ajax({
                                        type: 'POST',
                                        url: "../SerPlanilla.asmx/SER_registro_documento",
                                        data: JSON.stringify({ obj: obj }),
                                        dataType: 'json',
                                        contentType: 'application/json; charset=utf-8',
                                        success: function (data) {
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Ocurrió un problema ...',
                                                text: 'No se puede registrar  !',
                                            })
                                        },
                                        error: function (data) {
                                            Swal.fire({
                                                title: '¿Está seguro de realizar los cambios?',
                                                text: "¡Los datos quedaran guardados en el sistema!",
                                                icon: 'warning',
                                                showCancelButton: true,
                                                confirmButtonColor: '#3085d6',
                                                cancelButtonColor: '#d33',
                                                confirmButtonText: 'Si, Aceptar ...!'
                                            }).then((result) => {
                                                if (result.isConfirmed) {
                                                    Swal.fire(
                                                        'Registrado !',
                                                        'Datos guardados con éxito.',
                                                        'success'
                                                    ).then((result) => {
                                                        refrescar_tabla_datos();
                                                        $('#modal_form_reg').modal('hide');
                                                        limpiar_campos(obj.DOCUMENTO_TIPO_DOCUMENTO_ID);
                                                    })
                                                }
                                            })

                                        }
                                    });
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Ocurrió un error ...',
                                        text: 'El Código de Diagnostico esta vacío ...!',
                                    })
                                }
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Ocurrió un error ...',
                                    text: 'El USUARIO, No este asignado ...!',
                                })
                            }

                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un error ...',
                                text: 'La opción seleccionada no está dentro de los parámetros ...!',
                            })
                        }
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrio un error ...',
                            text: 'La CMP esta vacio ...!',
                        })
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un error ...',
                        text: 'la fecha Final debe de ser mayor o igual !',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un error ...',
                    text: 'Uno de los campos esta vacío, verificar !',
                })
            }
        } else if (id_tipo_registro == 2) {

            var fecha_registro_ini = document.getElementById('atencion_medica_fecha_atencion').value;
            var fecha_inicio = document.getElementById('atencion_medica_fecha_inicio').value;
            var fecha_fin = document.getElementById('atencion_medica_fecha_fin').value;
            var motivo = document.getElementById('atencion_medica_motivo').value;
            var documentacion = document.getElementById('atencion_medica_documentacion').value;
            var horas = document.getElementById('atencion_medica_tiempo').value;
            var proviene = document.getElementById('atencion_medica_proviene').value;
            var usuario = document.getElementById('usuario_id').value;

            // obtenemos fecha final  de la semana
            var fecha_fin_ini = document.getElementById('fecha_fin_filt').value;

            // validamoas las fechas
            if (fecha_registro_ini.valueOf() > fecha_fin_ini.valueOf()) {
                fecha_registro = fecha_fin_ini;
            } else {
                fecha_registro = fecha_registro_ini;
            }

            /*alert(documentacion);*/
            if (fecha_registro.length) {
                fecha_inicio_val = new Date(fecha_inicio);
                fecha_fin_val = new Date(fecha_fin);
                if (fecha_inicio_val < fecha_fin_val || fecha_inicio_val.getTime() == fecha_fin_val.getTime()) {
                    const motivo_val = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ0-9 ]+$/;
                    if (motivo_val.test(motivo)) {
                        const documento_val = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ0-9 ]+$/;
                        if (documento_val.test(documentacion)) {
                            const horas_val = /^[0-9]+$/;
                            if (horas_val.test(horas)) {
                                if (proviene == "Fundo" || proviene == "Planta") {
                                    if (usuario != "") {
                                        var obj = new Object();
                                        obj.DOCUMENTO_FECHA_REGISTRO = fecha_registro;
                                        obj.DOCUMENTO_MOTIVO = motivo;
                                        obj.DOCUMENTO_DOCUMENTACION = documentacion;
                                        obj.DOCUMENTO_HORAS = horas;
                                        obj.DOCUMENTO_PROVIENE = proviene;
                                        obj.DOCUMENTO_FECHA_INICIO = fecha_inicio;
                                        obj.DOCUMENTO_FECHA_FIN = fecha_fin;

                                        obj.DOCUMENTO_CMP = "";
                                        obj.DOCUMENTO_DIAS = "";
                                        obj.DOCUMENTO_CODIGO_DIAGNOSTICO = "";
                                        obj.DOCUMENTO_DIAGNOSTICO = "";
                                        obj.DOCUMENTO_OBSERVACIONES = "";
                                        obj.DOCUMENTO_LACTANTE = "";
                                        obj.DOCUMENTO_VINCULO_FAMILIAR = "";
                                        obj.DOCUMENTO_FALLECIDO = "";
                                        obj.DOCUMENTO_CASO = "";

                                        obj.DOCUMENTO_ESTADO = "PENDIENTE";
                                        obj.DOCUMENTO_TIPO_DOCUMENTO_ID = id_tipo_registro;
                                        obj.DOCUMENTO_PERSONAL_ID = usuario;
                                        $.ajax({
                                            type: 'POST',
                                            url: "../SerPlanilla.asmx/SER_registro_documento",
                                            data: JSON.stringify({ obj: obj }),
                                            dataType: 'json',
                                            contentType: 'application/json; charset=utf-8',
                                            success: function (data) {
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Ocurrió un problema ...',
                                                    text: 'Contacte con el administrador de TI  !',
                                                })
                                                
                                            },
                                            error: function (data) {
                                                Swal.fire({
                                                    title: '¿Está seguro de realizar los cambios?',
                                                    text: "¡Los datos quedaran guardados en el sistema!",
                                                    icon: 'warning',
                                                    showCancelButton: true,
                                                    confirmButtonColor: '#3085d6',
                                                    cancelButtonColor: '#d33',
                                                    confirmButtonText: 'Si, Aceptar ...!'
                                                }).then((result) => {
                                                    if (result.isConfirmed) {
                                                        Swal.fire(
                                                            'Registrado !',
                                                            'Datos guardados con éxito.',
                                                            'success'
                                                        ).then((result) => {
                                                            refrescar_tabla_datos();
                                                            $('#modal_form_reg').modal('hide');
                                                            limpiar_campos(obj.DOCUMENTO_TIPO_DOCUMENTO_ID);
                                                        })
                                                    }
                                                })
                                            }
                                        });
                                    } else {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Ocurrió un problema ...',
                                            text: 'El USUARIO, no está asignado. !',
                                        })
                                    }
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Ocurrió un problema ...',
                                        text: 'El campo Proviene, no cumple con los parámetros. !',
                                    })
                                }
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Ocurrió un problema ...',
                                    text: 'El campo HORAS, no cumple con los parámetros. !',
                                })
                            }
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un problema ...',
                                text: 'El campo Documentación no valido, solo letras y números. !',
                            })
                        }
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un problema ...',
                            text: 'El campo Proviene no valido, solo letras y números. !',
                        })
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un problema ...',
                        text: 'La fecha fin tiene que ser mayor o igual a fecha Inicio !',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'La fecha registro esta vacía !',
                })
            }
        } else if (id_tipo_registro == 3) {
            var fecha_registro_ini = document.getElementById('bono_asistencia_fecha_registro').value;
            var fecha_inicio = document.getElementById('bono_asistencia_fecha_ingreso').value;
            var fecha_fin = document.getElementById('bono_asistencia_fecha_fin').value;
            var dias = document.getElementById('bono_asistencia_dias').value;
            var motivo = document.getElementById('bono_asistencia_motivo').value;
            var documentacion = document.getElementById('bono_asistencia_documentacion').value;
            var proviene = document.getElementById('bono_asistencia_proviene').value;
            var usuario = document.getElementById('usuario_id').value;

            // obtenemos fecha final  de la semana
            var fecha_fin_ini = document.getElementById('fecha_fin_filt').value;

            // validamoas las fechas
            if (fecha_registro_ini.valueOf() > fecha_fin_ini.valueOf()) {
                fecha_registro = fecha_fin_ini;
            } else {
                fecha_registro = fecha_registro_ini;
            }

            if (fecha_inicio.length) {
                if (fecha_fin.length) {
                    fecha_inicio_val = new Date(fecha_inicio);
                    fecha_fin_val = new Date(fecha_fin);
                    if (fecha_inicio_val < fecha_fin_val || fecha_inicio_val.getTime() == fecha_fin_val.getTime()) {
                        const dias_val = /^[0-9]+$/;
                        if (dias_val.test(dias)) {
                            const motivo_val = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ0-9 ]+$/;
                            if (motivo_val.test(motivo)) {
                                const documentacion_val = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ0-9 ]+$/;
                                if (documentacion_val.test(documentacion)) {
                                    if (proviene == "Fundo" || proviene == "Planta") {
                                        if (usuario != "") {
                                            var obj = new Object();

                                            obj.DOCUMENTO_FECHA_REGISTRO = fecha_registro;
                                            obj.DOCUMENTO_FECHA_INICIO = fecha_inicio;
                                            obj.DOCUMENTO_FECHA_FIN = fecha_fin;
                                            obj.DOCUMENTO_DIAS = dias;
                                            obj.DOCUMENTO_MOTIVO = motivo;
                                            obj.DOCUMENTO_DOCUMENTACION = documentacion;
                                            obj.DOCUMENTO_PROVIENE = proviene;

                                            obj.DOCUMENTO_CMP = "";
                                            obj.DOCUMENTO_HORAS = "";
                                            obj.DOCUMENTO_CODIGO_DIAGNOSTICO = "";
                                            obj.DOCUMENTO_DIAGNOSTICO = "";
                                            obj.DOCUMENTO_OBSERVACIONES = "";
                                            obj.DOCUMENTO_LACTANTE = "";
                                            obj.DOCUMENTO_VINCULO_FAMILIAR = "";
                                            obj.DOCUMENTO_FALLECIDO = "";
                                            obj.DOCUMENTO_CASO = "";

                                            obj.DOCUMENTO_ESTADO = "PENDIENTE";
                                            obj.DOCUMENTO_TIPO_DOCUMENTO_ID = id_tipo_registro;
                                            obj.DOCUMENTO_PERSONAL_ID = usuario;

                                            $.ajax({
                                                type: 'POST',
                                                url: "../SerPlanilla.asmx/SER_registro_documento",
                                                data: JSON.stringify({ obj: obj }),
                                                dataType: 'json',
                                                contentType: 'application/json; charset=utf-8',
                                                success: function (data) {
                                                    
                                                    Swal.fire({
                                                        icon: 'error',
                                                        title: 'Ocurrió un problema ...',
                                                        text: 'Contacte con el administrador de TI  !',
                                                    })
                                                },
                                                error: function (data) {

                                                    
                                                    Swal.fire({
                                                        title: '¿Está seguro de realizar los cambios?',
                                                        text: "¡Los datos quedaran guardados en el sistema!",
                                                        icon: 'warning',
                                                        showCancelButton: true,
                                                        confirmButtonColor: '#3085d6',
                                                        cancelButtonColor: '#d33',
                                                        confirmButtonText: 'Si, Aceptar ...!'
                                                    }).then((result) => {
                                                        if (result.isConfirmed) {
                                                            Swal.fire(
                                                                'Registrado !',
                                                                'Datos guardados con éxito.',
                                                                'success'
                                                            ).then((result) => {
                                                                refrescar_tabla_datos();
                                                                $('#modal_form_reg').modal('hide');
                                                                limpiar_campos(obj.DOCUMENTO_TIPO_DOCUMENTO_ID);
                                                            })
                                                        }
                                                    })
                                                }
                                            });
                                        } else {
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Ocurrió un problema ...',
                                                text: 'No sé asignado un Personal !',
                                            })
                                        }
                                    } else {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Ocurrió un problema ...',
                                            text: 'El campo PROVIENE no cumple con los parámetros requeridos !',
                                        })
                                    }
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Ocurrió un problema ...',
                                        text: 'El campo DOCUMENTACION no cumple con los parámetros requeridos !',
                                    })
                                }
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Ocurrió un problema ...',
                                    text: 'El campo MOTIVO no cumple con los parámetros requeridos !',
                                })
                            }
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un problema ...',
                                text: 'Los DIAS no cumple con los parámetros requeridos !',
                            })
                        }
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un problema ...',
                            text: 'La FECHA FIN tiene que ser mayor o igual a la FECHA INICIO !',
                        })
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un problema ...',
                        text: 'La FECHA FIN esta vacía !',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'La FECHA INICIO esta vacía!',
                })
            }
        } else if (id_tipo_registro == 4) {
            var fecha_registro_ini = document.getElementById('lactancia_fecha_registro').value;
            var fecha_inicio = document.getElementById('lactancia_fecha_inicio').value;
            var fecha_fin = document.getElementById('lactancia_fecha_termino').value;
            var lactante = document.getElementById('lactancia_lactante').value;
            var proviene = document.getElementById('lactancia_proviene').value;
            var usuario = document.getElementById('usuario_id').value;

            // obtenemos fecha final  de la semana
            var fecha_fin_ini = document.getElementById('fecha_fin_filt').value;

            // validamoas las fechas
            if (fecha_registro_ini.valueOf() > fecha_fin_ini.valueOf()) {
                fecha_registro = fecha_fin_ini;
            } else {
                fecha_registro = fecha_registro_ini;
            }

            if (fecha_inicio.length) {
                if (fecha_fin.length) {
                    fecha_inicio_val = new Date(fecha_inicio);
                    fecha_fin_val = new Date(fecha_fin);
                    if (fecha_inicio_val < fecha_fin_val || fecha_inicio_val.getTime() == fecha_fin_val.getTime()) {
                        const lactante_val = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/;
                        if (lactante_val.test(lactante)) {
                            if (proviene == "Fundo" || proviene == "Planta") {
                                if (usuario != "") {
                                    var obj = new Object();

                                    obj.DOCUMENTO_FECHA_REGISTRO = fecha_registro;
                                    obj.DOCUMENTO_FECHA_INICIO = fecha_inicio;
                                    obj.DOCUMENTO_FECHA_FIN = fecha_fin;
                                    obj.DOCUMENTO_LACTANTE = lactante;
                                    obj.DOCUMENTO_PROVIENE = proviene;

                                    obj.DOCUMENTO_CMP = "";
                                    obj.DOCUMENTO_MOTIVO = "";
                                    obj.DOCUMENTO_DOCUMENTACION = "";
                                    obj.DOCUMENTO_HORAS = "";
                                    obj.DOCUMENTO_DIAS = "";
                                    obj.DOCUMENTO_CODIGO_DIAGNOSTICO = "";
                                    obj.DOCUMENTO_DIAGNOSTICO = "";
                                    obj.DOCUMENTO_OBSERVACIONES = "";
                                    obj.DOCUMENTO_VINCULO_FAMILIAR = "";
                                    obj.DOCUMENTO_FALLECIDO = "";
                                    obj.DOCUMENTO_CASO = "";

                                    obj.DOCUMENTO_ESTADO = "PENDIENTE";
                                    obj.DOCUMENTO_TIPO_DOCUMENTO_ID = id_tipo_registro;
                                    obj.DOCUMENTO_PERSONAL_ID = usuario;

                                    $.ajax({
                                        type: 'POST',
                                        url: "../SerPlanilla.asmx/SER_registro_documento",
                                        data: JSON.stringify({ obj: obj }),
                                        dataType: 'json',
                                        contentType: 'application/json; charset=utf-8',
                                        success: function (data) {
                                            
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Ocurrió un problema ...',
                                                text: 'Contacte con el administrador de TI  !',
                                            })
                                        },
                                        error: function (data) {
                                            Swal.fire({
                                                title: '¿Está seguro de realizar los cambios?',
                                                text: "¡Los datos quedaran guardados en el sistema!",
                                                icon: 'warning',
                                                showCancelButton: true,
                                                confirmButtonColor: '#3085d6',
                                                cancelButtonColor: '#d33',
                                                confirmButtonText: 'Si, Aceptar ...!'
                                            }).then((result) => {
                                                if (result.isConfirmed) {
                                                    Swal.fire(
                                                        'Registrado !',
                                                        'Datos guardados con éxito.',
                                                        'success'
                                                    ).then((result) => {
                                                        refrescar_tabla_datos();
                                                        $('#modal_form_reg').modal('hide');
                                                        limpiar_campos(obj.DOCUMENTO_TIPO_DOCUMENTO_ID);
                                                    })
                                                }
                                            })
                                        }
                                    });
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Ocurrió un problema ...',
                                        text: 'No sé asignado un Personal !',
                                    })
                                }
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Ocurrió un problema ...',
                                    text: 'El campo PROVIENE no cumple con los parámetros requeridos !',
                                })
                            }
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un problema ...',
                                text: 'El campo LACTANTE no cumple con los parámetros requeridos !',
                            })
                        }
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un problema ...',
                            text: 'La FECHA FIN tiene que ser mayor o igual a la FECHA INICIO !',
                        })
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un problema ...',
                        text: 'La FECHA FIN esta vacía !',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'La FECHA INICIO esta vacía !',
                })
            }
        } else if (id_tipo_registro == 5) {
            var fecha_registro_ini = document.getElementById('paternidad_fecha_registro').value;
            var fecha_inicio = document.getElementById('paternidad_fecha_inicio').value;
            var fecha_fin = document.getElementById('paternidad_fecha_termino').value;
            var dias = document.getElementById('paternidad_dias').value;
            var vinculo_familiar = document.getElementById('paternidad_vinculo_familiar').value;
            var observaciones = document.getElementById('paternidad_observacion').value;
            var proviene = document.getElementById('paternidad_proviene').value;
            var usuario = document.getElementById('usuario_id').value;

            // obtenemos fecha final  de la semana
            var fecha_fin_ini = document.getElementById('fecha_fin_filt').value;

            // validamoas las fechas
            if (fecha_registro_ini.valueOf() > fecha_fin_ini.valueOf()) {
                fecha_registro = fecha_fin_ini;
            } else {
                fecha_registro = fecha_registro_ini;
            }

            if (fecha_inicio.length) {
                if (fecha_fin.length) {
                    fecha_inicio_val = new Date(fecha_inicio);
                    fecha_fin_val = new Date(fecha_fin);
                    if (fecha_inicio_val < fecha_fin_val || fecha_inicio_val.getTime() == fecha_fin_val.getTime()) {
                        const dias_val = /^[0-9]+$/;
                        if (dias_val.test(dias)) {
                            if (vinculo_familiar == "Hijo" || vinculo_familiar == "Hija") {
                                //const observaciones_val = /^[a-zA-Z ]+$/;
                                //if (observaciones_val.test(observaciones)) {
                                    if (proviene == "Fundo" || proviene == "Planta") {
                                        if (usuario != "") {
                                            var obj = new Object();

                                            obj.DOCUMENTO_FECHA_REGISTRO = fecha_registro;
                                            obj.DOCUMENTO_FECHA_INICIO = fecha_inicio;
                                            obj.DOCUMENTO_FECHA_FIN = fecha_fin;
                                            obj.DOCUMENTO_DIAS = dias;
                                            obj.DOCUMENTO_VINCULO_FAMILIAR = vinculo_familiar;
                                            obj.DOCUMENTO_OBSERVACIONES = observaciones;
                                            obj.DOCUMENTO_PROVIENE = proviene;

                                            obj.DOCUMENTO_CMP = "";
                                            obj.DOCUMENTO_MOTIVO = "";
                                            obj.DOCUMENTO_DOCUMENTACION = "";
                                            obj.DOCUMENTO_HORAS = "";
                                            obj.DOCUMENTO_CODIGO_DIAGNOSTICO = "";
                                            obj.DOCUMENTO_DIAGNOSTICO = "";
                                            obj.DOCUMENTO_LACTANTE = "";
                                            obj.DOCUMENTO_FALLECIDO = "";
                                            obj.DOCUMENTO_CASO = "";

                                            obj.DOCUMENTO_ESTADO = "PENDIENTE";
                                            obj.DOCUMENTO_TIPO_DOCUMENTO_ID = id_tipo_registro;
                                            obj.DOCUMENTO_PERSONAL_ID = usuario;

                                            $.ajax({
                                                type: 'POST',
                                                url: "../SerPlanilla.asmx/SER_registro_documento",
                                                data: JSON.stringify({ obj: obj }),
                                                dataType: 'json',
                                                contentType: 'application/json; charset=utf-8',
                                                success: function (data) {
                                                    Swal.fire({
                                                        icon: 'error',
                                                        title: 'Ocurrió un problema ...',
                                                        text: 'Contacte con el administrador de TI  !',
                                                    })
                                                    
                                                },
                                                error: function (data) {

                                                    
                                                    Swal.fire({
                                                        title: '¿Está seguro de realizar los cambios?',
                                                        text: "¡Los datos quedaran guardados en el sistema!",
                                                        icon: 'warning',
                                                        showCancelButton: true,
                                                        confirmButtonColor: '#3085d6',
                                                        cancelButtonColor: '#d33',
                                                        confirmButtonText: 'Si, Aceptar ...!'
                                                    }).then((result) => {
                                                        if (result.isConfirmed) {
                                                            Swal.fire(
                                                                'Registrado !',
                                                                'Datos guardados con éxito.',
                                                                'success'
                                                            ).then((result) => {
                                                                refrescar_tabla_datos();
                                                                $('#modal_form_reg').modal('hide');
                                                                limpiar_campos(obj.DOCUMENTO_TIPO_DOCUMENTO_ID);
                                                            })
                                                        }
                                                    })
                                                }
                                            });
                                        } else {
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Ocurrió un problema ...',
                                                text: 'No sé asignado un Personal!',
                                            })
                                        }
                                    } else {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Ocurrió un problema ...',
                                            text: 'El campo PROVIENE no cumple con los parámetros requeridos !',
                                        })
                                    }
                                //} else {
                                //    Swal.fire({
                                //        icon: 'error',
                                //        title: 'Ocurrió un problema ...',
                                //        text: 'El campo OBSERVACION no cumple con los parametros requeridos !',
                                //    })
                                //}
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Ocurrió un problema ...',
                                    text: 'El campo VINCULO FAMILIAR no cumple con los parámetros requeridos !',
                                })
                            }
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un problema ...',
                                text: 'El campo DIAS no cumple con los parámetros requeridos !',
                            })
                        }
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un problema ...',
                            text: 'La FECHA FIN tiene que ser mayor o igual a la FECHA INICIO !',
                        })
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un problema ...',
                        text: 'La FECHA FIN esta vacía !',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'La FECHA INICIO esta vacía!',
                })
            }
        } else if (id_tipo_registro == 6) {
            var fecha_registro_ini = document.getElementById('fallecimiento_fecha_registro').value;
            var fecha_inicio = document.getElementById('fallecimiento_fecha_inicio').value;
            var fecha_fin = document.getElementById('fallecimiento_fecha_termino').value;
            var dias = document.getElementById('fallecimiento_dias').value;
            var fellecido = document.getElementById('fallecimiento_fallecido').value;
            var vinculo_familiar = document.getElementById('fallecimiento_vinculo').value;
            var proviene = document.getElementById('fallecimiento_proviene').value;
            var usuario = document.getElementById('usuario_id').value;

            // obtenemos fecha final  de la semana
            var fecha_fin_ini = document.getElementById('fecha_fin_filt').value;

            // validamoas las fechas
            if (fecha_registro_ini.valueOf() > fecha_fin_ini.valueOf()) {
                fecha_registro = fecha_fin_ini;
            } else {
                fecha_registro = fecha_registro_ini;
            }

            if (fecha_inicio.length) {
                if (fecha_fin.length) {
                    fecha_inicio_val = new Date(fecha_inicio);
                    fecha_fin_val = new Date(fecha_fin);
                    if (fecha_inicio_val < fecha_fin_val || fecha_inicio_val.getTime() == fecha_fin_val.getTime()) {
                        const dias_val = /^[0-9]+$/;
                        if (dias_val.test(dias)) {
                            const fallecido_val = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/;
                            if (fallecido_val.test(fellecido)) {
                                if (vinculo_familiar == "Madre" || vinculo_familiar == "Padre" || vinculo_familiar == "Conyuge" || vinculo_familiar == "Hijo" || vinculo_familiar == "Hija" || vinculo_familiar == "Hermano" || vinculo_familiar == "Hermana") {
                                    if (proviene == "Fundo" || proviene == "Planta") {
                                        if (usuario != "") {
                                            var obj = new Object();

                                            obj.DOCUMENTO_FECHA_REGISTRO = fecha_registro;
                                            obj.DOCUMENTO_FECHA_INICIO = fecha_inicio;
                                            obj.DOCUMENTO_FECHA_FIN = fecha_fin;
                                            obj.DOCUMENTO_DIAS = dias;
                                            obj.DOCUMENTO_FALLECIDO = fellecido;
                                            obj.DOCUMENTO_VINCULO_FAMILIAR = vinculo_familiar;
                                            obj.DOCUMENTO_PROVIENE = proviene;

                                            obj.DOCUMENTO_CMP = "";
                                            obj.DOCUMENTO_MOTIVO = "";
                                            obj.DOCUMENTO_DOCUMENTACION = "";
                                            obj.DOCUMENTO_HORAS = "";

                                            obj.DOCUMENTO_CODIGO_DIAGNOSTICO = "";
                                            obj.DOCUMENTO_DIAGNOSTICO = "";
                                            obj.DOCUMENTO_OBSERVACIONES = "";
                                            obj.DOCUMENTO_LACTANTE = "";
                                            obj.DOCUMENTO_CASO = "";

                                            obj.DOCUMENTO_ESTADO = "PENDIENTE";
                                            obj.DOCUMENTO_TIPO_DOCUMENTO_ID = id_tipo_registro;
                                            obj.DOCUMENTO_PERSONAL_ID = usuario;

                                            $.ajax({
                                                type: 'POST',
                                                url: "../SerPlanilla.asmx/SER_registro_documento",
                                                data: JSON.stringify({ obj: obj }),
                                                dataType: 'json',
                                                contentType: 'application/json; charset=utf-8',
                                                success: function (data) {
                                                    Swal.fire({
                                                        icon: 'error',
                                                        title: 'Ocurrió un problema ...',
                                                        text: 'Contacte con el administrador de TI  !',
                                                    })
                                                    
                                                },
                                                error: function (data) {

                                                    

                                                    Swal.fire({
                                                        title: '¿Está seguro de realizar los cambios?',
                                                        text: "¡Los datos quedaran guardados en el sistema!",
                                                        icon: 'warning',
                                                        showCancelButton: true,
                                                        confirmButtonColor: '#3085d6',
                                                        cancelButtonColor: '#d33',
                                                        confirmButtonText: 'Si, Aceptar ...!'
                                                    }).then((result) => {
                                                        if (result.isConfirmed) {
                                                            Swal.fire(
                                                                'Registrado !',
                                                                'Datos guardados con éxito.',
                                                                'success'
                                                            ).then((result) => {
                                                                refrescar_tabla_datos();
                                                                $('#modal_form_reg').modal('hide');
                                                                limpiar_campos(obj.DOCUMENTO_TIPO_DOCUMENTO_ID);
                                                            })
                                                        }
                                                    })
                                                }
                                            });
                                        } else {
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Ocurrió un problema ...',
                                                text: 'No sé asignado un Personal!',
                                            })
                                        }
                                    } else {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Ocurrió un problema ...',
                                            text: 'El campo PROVIENE no cumple con los parámetros requeridos !',
                                        })
                                    }
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Ocurrió un problema ...',
                                        text: 'El campo VINCULO FAMILIAR no cumple con los parámetros requeridos !',
                                    })
                                }
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Ocurrió un problema ...',
                                    text: 'El campo FALLECIDO no cumple con los parámetros requeridos!',
                                })
                            }
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un problema ...',
                                text: 'El campo DIAS no cumple con los parámetros requeridos !',
                            })
                        }
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un problema ...',
                            text: 'La FECHA FIN tiene que ser mayor o igual a la FECHA INICIO !',
                        })
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un problema ...',
                        text: 'La FECHA FIN esta vacía !',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'La FECHA INICIO esta vacía !',
                })
            }
        } else if (id_tipo_registro == 7) {
            var fecha_registro_ini = document.getElementById('gose_fecha_registro').value;
            var fecha_inicio = document.getElementById('gose_fecha_inicio').value;
            var fecha_fin = document.getElementById('gose_fecha_termino').value;
            var dias = document.getElementById('gose_dias').value;
            var caso = document.getElementById('gose_caso').value;
            var proviene = document.getElementById('gose_proviene').value;
            var usuario = document.getElementById('usuario_id').value;

            // obtenemos fecha final  de la semana
            var fecha_fin_ini = document.getElementById('fecha_fin_filt').value;

            // validamoas las fechas
            if (fecha_registro_ini.valueOf() > fecha_fin_ini.valueOf()) {
                fecha_registro = fecha_fin_ini;
            } else {
                fecha_registro = fecha_registro_ini;
            }

            if (fecha_inicio.length) {
                if (fecha_fin.length) {
                    fecha_inicio_val = new Date(fecha_inicio);
                    fecha_fin_val = new Date(fecha_fin);
                    if (fecha_inicio_val < fecha_fin_val || fecha_inicio_val.getTime() == fecha_fin_val.getTime()) {
                        const caso_val = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/;
                        if (caso_val.test(caso)) {
                            if (proviene == "Fundo" || proviene == "Planta") {
                                if (usuario != "") {
                                    var obj = new Object();

                                    obj.DOCUMENTO_FECHA_REGISTRO = fecha_registro;
                                    obj.DOCUMENTO_FECHA_INICIO = fecha_inicio;
                                    obj.DOCUMENTO_FECHA_FIN = fecha_fin;
                                    obj.DOCUMENTO_DIAS = dias;
                                    obj.DOCUMENTO_CASO = caso;
                                    obj.DOCUMENTO_PROVIENE = proviene;

                                    obj.DOCUMENTO_CMP = "";
                                    obj.DOCUMENTO_MOTIVO = "";
                                    obj.DOCUMENTO_DOCUMENTACION = "";
                                    obj.DOCUMENTO_HORAS = "";
                                    obj.DOCUMENTO_CODIGO_DIAGNOSTICO = "";
                                    obj.DOCUMENTO_DIAGNOSTICO = "";
                                    obj.DOCUMENTO_OBSERVACIONES = "";
                                    obj.DOCUMENTO_LACTANTE = "";
                                    obj.DOCUMENTO_VINCULO_FAMILIAR = "";
                                    obj.DOCUMENTO_FALLECIDO = "";


                                    obj.DOCUMENTO_ESTADO = "PENDIENTE";
                                    obj.DOCUMENTO_TIPO_DOCUMENTO_ID = id_tipo_registro;
                                    obj.DOCUMENTO_PERSONAL_ID = usuario;

                                    $.ajax({
                                        type: 'POST',
                                        url: "../SerPlanilla.asmx/SER_registro_documento",
                                        data: JSON.stringify({ obj: obj }),
                                        dataType: 'json',
                                        contentType: 'application/json; charset=utf-8',
                                        success: function (data) {
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Ocurrió un problema ...',
                                                text: 'Contacte con el administrador de TI  !',
                                            })
                                           
                                        },
                                        error: function (data) {
                                            
                                            Swal.fire({
                                                title: '¿Está seguro de realizar los cambios?',
                                                text: "¡Los datos quedaran guardados en el sistema!",
                                                icon: 'warning',
                                                showCancelButton: true,
                                                confirmButtonColor: '#3085d6',
                                                cancelButtonColor: '#d33',
                                                confirmButtonText: 'Si, Aceptar ...!'
                                            }).then((result) => {
                                                if (result.isConfirmed) {
                                                    Swal.fire(
                                                        'Registrado !',
                                                        'Datos guardados con éxito.',
                                                        'success'
                                                    ).then((result) => {
                                                        refrescar_tabla_datos();
                                                        $('#modal_form_reg').modal('hide');
                                                        limpiar_campos(obj.DOCUMENTO_TIPO_DOCUMENTO_ID);
                                                    })
                                                }
                                            })
                                        }
                                    });
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Ocurrió un problema ...',
                                        text: 'No sé asignado un Personal !',
                                    })
                                }
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Ocurrió un problema ...',
                                    text: 'El campo PROVIENE no cumple con los parámetros requeridos !',
                                })
                            }
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un problema ...',
                                text: 'El campo CASO no cumple con los parámetros requeridos !',
                            })
                        }
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un problema ...',
                            text: 'La FECHA FIN tiene que ser mayor o igual a la FECHA INICIO !',
                        })
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un problema ...',
                        text: 'La FECHA FIN esta vacía !',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'La FECHA INICIO esta vacía !',
                })
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'Contacte con el administrador de T.I. !',
            })
        }
    }

    // FUNCION LISTAR DATOS DEL DOCUMENTO
    function listar_documento_individual(id_documento, id_tipo_registro, estado_documento) {
        // OBTENEMOS LA SEMANA ACTUAL
        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SerPlanilla.asmx/SER_listar_semana_actual",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                //capturamos los datos
                var lst = JSON.parse(data.d);
                if (lst[0] == null) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un error ...',
                        text: 'El DNI ingresado no está registrado...!',
                    })
                } else {
                    var anio = lst[0].nAnio;
                    var id = lst[0].cIdSemana;
                    var semana = lst[0].semana;
                    var fecha_inicio = lst[0].dFechaIni;
                    var fecha_fin = lst[0].dFechaFin;
                    var Estado = lst[0].bEstado;
                   
                    const semana1 = document.querySelector("#semana1");
                    semana1.textContent = semana + " -  Fecha Inicio: " + fecha_inicio + " Fecha Fin: " + fecha_fin;
                    const semana2 = document.querySelector("#semana2");
                    semana2.textContent = semana + " -  Fecha Inicio: " + fecha_inicio + " Fecha Fin: " + fecha_fin;
                    const semana3 = document.querySelector("#semana3");
                    semana3.textContent = semana + " -  Fecha Inicio: " + fecha_inicio + " Fecha Fin: " + fecha_fin;
                    const semana4 = document.querySelector("#semana4");
                    semana4.textContent = semana + " -  Fecha Inicio: " + fecha_inicio + " Fecha Fin: " + fecha_fin;
                    const semana5 = document.querySelector("#semana5");
                    semana5.textContent = semana + " -  Fecha Inicio: " + fecha_inicio + " Fecha Fin: " + fecha_fin;
                    const semana6 = document.querySelector("#semana6");
                    semana6.textContent = semana + " -  Fecha Inicio: " + fecha_inicio + " Fecha Fin: " + fecha_fin;
                    const semana7 = document.querySelector("#semana7");
                    semana7.textContent = semana + " -  Fecha Inicio: " + fecha_inicio + " Fecha Fin: " + fecha_fin;

                }
            },
            error: function (data) {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un error...',
                    text: 'Tiene errores al ejecutar la instrucción ...!',
                })
            }
        });
        // FI DE LA SEMAN ACTUAL
        if (id_documento != "") {
            if (id_tipo_registro != "") {
                if (estado_documento != "ANULADO") {
                    if (estado_documento != "CERRADO") {
                        if (estado_documento != "APROBADO") {
                            var obj = new Object();
                            obj.DOCUMENTO_ID = id_documento;
                            $.ajax({
                                type: 'POST',
                                url: "../SerPlanilla.asmx/SER_listar_documento_individual",
                                data: JSON.stringify({ obj: obj }),
                                dataType: 'json',
                                contentType: 'application/json; charset=utf-8',
                                success: function (data) {
                                    //capturamos los datos
                                    var lst = JSON.parse(data.d);
                                    var id = lst[0].DOCUMENTO_ID;
                                    var fecha_creacion = lst[0].DOCUMENTO_FECHA_CREACION;
                                    var fecha_registro = lst[0].DOCUMENTO_FECHA_REGISTRO;
                                    var fecha_inicio = lst[0].DOCUMENTO_FECHA_INICIO;
                                    var fecha_fin = lst[0].DOCUMENTO_FECHA_FIN;
                                    var dias = lst[0].DOCUMENTO_DIAS;
                                    var cmp = lst[0].DOCUMENTO_CMP;
                                    var cod_diagnostico = lst[0].DOCUMENTO_CODIGO_DIAGNOSTICO;
                                    var diagnostico = lst[0].DOCUMENTO_DIAGNOSTICO;
                                    var observaciones = lst[0].DOCUMENTO_OBSERVACIONES;
                                    var proviene = lst[0].DOCUMENTO_PROVIENE;
                                    var motivo = lst[0].DOCUMENTO_MOTIVO;
                                    var documentacion = lst[0].DOCUMENTO_DOCUMENTACION;
                                    var horas = lst[0].DOCUMENTO_HORAS;
                                    var lactante = lst[0].DOCUMENTO_LACTANTE;
                                    var vinculo_familiar = lst[0].DOCUMENTO_VINCULO_FAMILIAR;
                                    var fallecido = lst[0].DOCUMENTO_FALLECIDO;
                                    var caso = lst[0].DOCUMENTO_CASO;
                                    var estado = lst[0].DOCUMENTO_ESTADO;
                                    var nombre_usuario = lst[0].DOCUMENTO_USUARIO;
                                    var id_tipo_documento = lst[0].DOCUMENTO_TIPO_DOCUMENTO_ID;
                                    var id_usuario = lst[0].DOCUMENTO_PERSONAL_ID;

                                    var personal = lst[0].cNombres + " " + lst[0].cApPaterno + " " + lst[0].cApMaterno;
                                    var celular = lst[0].cCelular;
                                    var dni = lst[0].cNroDocumento;

                                    if (id_tipo_registro == 1) {
                                        $("#modal_editar_descanso_medico_reg").modal("show");

                                        const num_documento = document.querySelector("#num_documento_1");
                                        num_documento.textContent = "Nº de documento : " + id;

                                        const nombre = document.querySelector("#usuario_nombre1");
                                        nombre.textContent ="Creado por : " + nombre_usuario;

                                        const fecha1 = document.querySelector("#fecha1");
                                        fecha1.textContent ="Fecha de Creación : " + fecha_creacion;

                                        document.getElementById("descanso_medico_personal_up").value = personal;
                                        document.getElementById("descanso_medico_num_celular_up").value = celular;
                                        document.getElementById("descanso_medico_dni_up").value = dni;
                                        document.getElementById("descanso_medico_fecha_registro_up").value = fecha_registro;
                                        document.getElementById("descanso_medico_fecha_inicio_up").value = fecha_inicio;
                                        document.getElementById("descanso_medico_fecha_fin_up").value = fecha_fin;
                                        document.getElementById("descanso_medico_num_dias_up").value = dias;
                                        document.getElementById("descanso_medico_cmp_up").value = cmp;
                                        document.getElementById("cDescClieProv_up").value = cod_diagnostico + ' - ' + diagnostico;
                                        document.getElementById("descanso_medico_observacion_up").value = observaciones;
                                        document.getElementById("descanso_medico_proviene_up").value = proviene;

                                        document.getElementById("id_documento_up").value = id;
                                        document.getElementById("id_usuario_up").value = id_usuario;
                                        document.getElementById("id_tipo_documento_up").value = id_tipo_documento;
                                    } else if (id_tipo_registro == 2) {
                                        $("#modal_editar_atencion_medica_reg").modal("show");

                                        const num_documento = document.querySelector("#num_documento_2");
                                        num_documento.textContent = "Nº de documento : " + id;

                                        const nombre = document.querySelector("#usuario_nombre2");
                                        nombre.textContent ="Creado por : " +  nombre_usuario;

                                        const fecha2 = document.querySelector("#fecha2");
                                        fecha2.textContent ="Fecha de Creación : " +  fecha_creacion;

                                        document.getElementById("atension_medica_personal_up").value = personal;
                                        document.getElementById("atension_medica_num_celular_up").value = celular;
                                        document.getElementById("atension_medica_dni_up").value = dni;
                                        /*alert(documentacion);*/
                                        document.getElementById("atencion_medica_fecha_atencion_up").value = fecha_registro;
                                        document.getElementById("atencion_medica_fecha_inicio_up").value = fecha_inicio;
                                        document.getElementById("atencion_medica_fecha_fin_up").value = fecha_fin;
                                        document.getElementById("atencion_medica_motivo_up").value = motivo;
                                        document.getElementById("atencion_medica_documentacion_up").value = documentacion;
                                        document.getElementById("atencion_medica_tiempo_up").value = horas;
                                        document.getElementById("atencion_medica_proviene_up").value = proviene;

                                        document.getElementById("id_documento_up").value = id;
                                        document.getElementById("id_usuario_up").value = id_usuario;
                                        document.getElementById("id_tipo_documento_up").value = id_tipo_documento;
                                    } else if (id_tipo_registro == 3) {
                                        $("#modal_editar_justificados_asistencia_reg").modal("show");

                                        const num_documento = document.querySelector("#num_documento_3");
                                        num_documento.textContent = "Nº de documento : " + id;

                                        const nombre = document.querySelector("#usuario_nombre3");
                                        nombre.textContent ="Creado por : " + nombre_usuario;

                                        const fecha3 = document.querySelector("#fecha3");
                                        fecha3.textContent ="Fecha de Creación : " + fecha_creacion;

                                        document.getElementById("bono_asistencia_personal_up").value = personal;
                                        document.getElementById("bono_asistencia_num_celular_up").value = celular;
                                        document.getElementById("bono_asistencia_dni_up").value = dni;
                                        document.getElementById("bono_asistencia_fecha_registro_up").value = fecha_registro;
                                        document.getElementById("bono_asistencia_fecha_ingreso_up").value = fecha_inicio;
                                        document.getElementById("bono_asistencia_fecha_fin_up").value = fecha_fin;
                                        document.getElementById("bono_asistencia_dias_up").value = dias;
                                        document.getElementById("bono_asistencia_motivo_up").value = motivo;

                                        document.getElementById("bono_asistencia_documentacion_up").value = documentacion;
                                        document.getElementById("bono_asistencia_proviene_up").value = proviene;

                                        document.getElementById("id_documento_up").value = id;
                                        document.getElementById("id_usuario_up").value = id_usuario;
                                        document.getElementById("id_tipo_documento_up").value = id_tipo_documento;
                                    } else if (id_tipo_registro == 4) {
                                        $("#modal_editar_hora_lactanciareg").modal("show");

                                        const num_documento = document.querySelector("#num_documento_4");
                                        num_documento.textContent = "Nº de documento : " + id;

                                        const nombre = document.querySelector("#usuario_nombre4");
                                        nombre.textContent ="Creado por : " + nombre_usuario;

                                        const fecha4 = document.querySelector("#fecha4");
                                        fecha4.textContent ="Fecha de Creación : " + fecha_creacion;

                                        document.getElementById("lactancia_personal_up").value = personal;
                                        document.getElementById("lactancia_num_celular_up").value = celular;
                                        document.getElementById("lactancia_dni_up").value = dni;

                                        document.getElementById("lactancia_fecha_registro_up").value = fecha_registro;
                                        document.getElementById("lactancia_fecha_inicio_up").value = fecha_inicio;
                                        document.getElementById("lactancia_fecha_termino_up").value = fecha_fin;
                                        document.getElementById("lactancia_lactante_up").value = lactante;
                                        document.getElementById("lactancia_proviene_up").value = proviene;

                                        document.getElementById("id_documento_up").value = id;
                                        document.getElementById("id_usuario_up").value = id_usuario;
                                        document.getElementById("id_tipo_documento_up").value = id_tipo_documento;
                                    } else if (id_tipo_registro == 5) {
                                        $("#modal_editar_licencia_paternidad_reg").modal("show");

                                        const num_documento = document.querySelector("#num_documento_5");
                                        num_documento.textContent = "Nº de documento : " + id;

                                        const nombre = document.querySelector("#usuario_nombre5");
                                        nombre.textContent ="Creado por : " + nombre_usuario;

                                        const fecha5 = document.querySelector("#fecha5");
                                        fecha5.textContent ="Fecha de Creación : "  + fecha_creacion;

                                        document.getElementById("paternidad_personal_up").value = personal;
                                        document.getElementById("paternidad_num_celular_up").value = celular;
                                        document.getElementById("paternidad_dni_up").value = dni;
                                        document.getElementById("paternidad_fecha_registro_up").value = fecha_registro;
                                        document.getElementById("paternidad_fecha_inicio_up").value = fecha_inicio;
                                        document.getElementById("paternidad_fecha_termino_up").value = fecha_fin;
                                        document.getElementById("paternidad_dias_up").value = dias;
                                        document.getElementById("paternidad_vinculo_familiar_up").value = vinculo_familiar;
                                        document.getElementById("paternidad_observacion_up").value = observaciones;
                                        document.getElementById("paternidad_proviene_up").value = proviene;

                                        document.getElementById("id_documento_up").value = id;
                                        document.getElementById("id_usuario_up").value = id_usuario;
                                        document.getElementById("id_tipo_documento_up").value = id_tipo_documento;
                                    } else if (id_tipo_registro == 6) {
                                        $("#modal_editar_licencia_fallecimiento_reg").modal("show");

                                        const num_documento = document.querySelector("#num_documento_6");
                                        num_documento.textContent = "Nº de documento : " + id;

                                        const nombre = document.querySelector("#usuario_nombre6");
                                        nombre.textContent ="Creado por : " + nombre_usuario;

                                        const fecha6 = document.querySelector("#fecha6");
                                        fecha6.textContent ="Fecha de Creación : " + fecha_creacion;

                                        document.getElementById("fallecimiento_personal_up").value = personal;
                                        document.getElementById("fallecimiento_num_celular_up").value = celular;
                                        document.getElementById("fallecimiento_dni_up").value = dni;
                                        document.getElementById("fallecimiento_fecha_registro_up").value = fecha_registro;
                                        document.getElementById("fallecimiento_fecha_inicio_up").value = fecha_inicio;
                                        document.getElementById("fallecimiento_fecha_termino_up").value = fecha_fin;
                                        document.getElementById("fallecimiento_dias_up").value = dias;
                                        document.getElementById("fallecimiento_fallecido_up").value = fallecido;
                                        document.getElementById("fallecimiento_vinculo_up").value = vinculo_familiar;
                                        document.getElementById("fallecimiento_proviene_up").value = proviene;

                                        document.getElementById("id_documento_up").value = id;
                                        document.getElementById("id_usuario_up").value = id_usuario;
                                        document.getElementById("id_tipo_documento_up").value = id_tipo_documento;
                                    } else if (id_tipo_registro == 7) {
                                        $("#modal_editar_licencia_gose_reg").modal("show");

                                        const num_documento = document.querySelector("#num_documento_7");
                                        num_documento.textContent = "Nº de documento : " + id;

                                        const nombre = document.querySelector("#usuario_nombre7");
                                        nombre.textContent ="Creado por : " + nombre_usuario;

                                        const fecha7 = document.querySelector("#fecha7");
                                        fecha7.textContent ="Fecha de Creación : " +  fecha_creacion;

                                        document.getElementById("gose_personal_up").value = personal;
                                        document.getElementById("gose_num_celular_up").value = celular;
                                        document.getElementById("gose_dni_up").value = dni;
                                        document.getElementById("gose_fecha_registro_up").value = fecha_registro;
                                        document.getElementById("gose_fecha_inicio_up").value = fecha_inicio;
                                        document.getElementById("gose_fecha_termino_up").value = fecha_fin;
                                        document.getElementById("gose_dias_up").value = dias;
                                        document.getElementById("gose_caso_up").value = caso;
                                        document.getElementById("gose_proviene_up").value = proviene;

                                        document.getElementById("id_documento_up").value = id;
                                        document.getElementById("id_usuario_up").value = id_usuario;
                                        document.getElementById("id_tipo_documento_up").value = id_tipo_documento;
                                    } else {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Ocurrió un problema ...',
                                            text: 'El tipo de registro esta fuera de los parámetros !',
                                        })
                                    }
                                },
                                error: function (data) {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Ocurrió un problema ...',
                                        text: 'Tiene errores al hacer la consulta !',
                                    })
                                }
                            });
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un problema ...',
                                text: 'El ESTADO del documento está APROBADO!',
                            })
                        }
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un problema ...',
                            text: 'El ESTADO del documento está CERRADO !',
                        })
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un problema ...',
                        text: 'El ESTADO del documento esta ANULADO !',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'El TIPO DE REGISTRO esta vacío !',
                })
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'El ID de documento esta vacío !',
            })
        }
    }

    // FUNCION ACTULIZAR DOCUEMTNOS
    function actualizar_datos_documento() {

        // capturamos los valores
        var id_documento = document.getElementById('id_documento_up').value;
        var id_usuario = document.getElementById('id_usuario_up').value;
        var id_tipo_registro = document.getElementById('id_tipo_documento_up').value;

        // Opcion para enviar datos segun el tipo de registro.
        if (id_tipo_registro == 1) {
            var fecha_registro = document.getElementById('descanso_medico_fecha_registro_up').value;
            var fecha_inicio = document.getElementById('descanso_medico_fecha_inicio_up').value;
            var fecha_fin = document.getElementById('descanso_medico_fecha_fin_up').value;
            var dias = document.getElementById('descanso_medico_num_dias_up').value;
            var cmp = document.getElementById('descanso_medico_cmp_up').value;

            var DIAG = document.getElementById('cDescClieProv_up').value;

            var cadena = DIAG.split("-");
            // dividimos los campos 
            var cod_diagnostico = cadena[0]; // por validar
            var diagnostico = cadena[1];

            var observaciones = document.getElementById('descanso_medico_observacion_up').value;
            var proviene = document.getElementById('descanso_medico_proviene_up').value;

            if (fecha_registro.length) {
                fecha_inicio_val = new Date(fecha_inicio);
                fecha_fin_val = new Date(fecha_fin);
                if (fecha_inicio_val < fecha_fin_val || fecha_inicio_val.getTime() == fecha_fin_val.getTime()) {
                    if (cmp != "") {
                        if (proviene == "Fundo" || proviene == "Planta") {
                            if (id_usuario != "") {
                                if (cod_diagnostico != "") {
                                    var obj = new Object();
                                    obj.DOCUMENTO_ID = id_documento;
                                    obj.DOCUMENTO_FECHA_REGISTRO = fecha_registro;
                                    obj.DOCUMENTO_FECHA_INICIO = fecha_inicio;
                                    obj.DOCUMENTO_FECHA_FIN = fecha_fin;
                                    obj.DOCUMENTO_DIAS = dias;
                                    obj.DOCUMENTO_CMP = cmp;
                                    obj.DOCUMENTO_CODIGO_DIAGNOSTICO = cod_diagnostico;
                                    obj.DOCUMENTO_DIAGNOSTICO = diagnostico;
                                    obj.DOCUMENTO_OBSERVACIONES = observaciones;
                                    obj.DOCUMENTO_PROVIENE = proviene;

                                    obj.DOCUMENTO_MOTIVO = "";
                                    obj.DOCUMENTO_DOCUMENTACION = "";
                                    obj.DOCUMENTO_HORAS = "";
                                    obj.DOCUMENTO_LACTANTE = "";
                                    obj.DOCUMENTO_VINCULO_FAMILIAR = "";
                                    obj.DOCUMENTO_FALLECIDO = "";
                                    obj.DOCUMENTO_CASO = "";

                                    obj.DOCUMENTO_TIPO_DOCUMENTO_ID = id_tipo_registro;
                                    obj.DOCUMENTO_PERSONAL_ID = id_usuario;

                                    $.ajax({
                                        type: 'POST',
                                        url: "../SerPlanilla.asmx/SER_actualizar_documento",
                                        data: JSON.stringify({ obj: obj }),
                                        dataType: 'json',
                                        contentType: 'application/json; charset=utf-8',
                                        success: function (data) {
                                            //refrescar los datos de una tbal.
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Ocurrió un problema ...',
                                                text: 'Contacte con el administrador de TI  !',
                                            })
                                        },
                                        error: function (data) {
                                            Swal.fire({
                                                title: '¿Está seguro de realizar los cambios? ',
                                                text: "¡Los datos quedaran guardados en el sistema!",
                                                icon: 'warning',
                                                showCancelButton: true,
                                                confirmButtonColor: '#3085d6',
                                                cancelButtonColor: '#d33',
                                                confirmButtonText: 'Si, Aceptar ...!'
                                            }).then((result) => {
                                                if (result.isConfirmed) {
                                                    Swal.fire(
                                                        'Actualizado  !',
                                                        'Datos actualizados con éxito. ',
                                                        'success'
                                                    ).then((result) => {
                                                        refrescar_tabla_datos();
                                                        $('#modal_editar_descanso_medico_reg').modal('hide');
                                                    })
                                                }
                                            })
                                        }
                                    });
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Ocurrió un error ...',
                                        text: 'El Código de Diagnostico esta vacío ...!',
                                    })
                                }
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Ocurrió un errorr ...',
                                    text: 'El USUARIO, No este asignado ...!',
                                })
                            }

                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un error ...',
                                text: 'La opción seleccionada no está dentro de los parámetros ...!',
                            })
                        }
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrio un error ...',
                            text: 'El CMP esta vacio ...!',
                        })
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un error ...',
                        text: 'la fecha Final debe de ser mayor o igual !',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un error ...',
                    text: 'Uno de los campos este vacío, verificar  !',
                })
            }
        } else if (id_tipo_registro == 2) {
            var fecha_registro = document.getElementById('atencion_medica_fecha_atencion_up').value;
            var fecha_inicio = document.getElementById('atencion_medica_fecha_inicio_up').value;
            var fecha_fin = document.getElementById('atencion_medica_fecha_fin_up').value;
            var motivo = document.getElementById('atencion_medica_motivo_up').value;
            var documentacion = document.getElementById('atencion_medica_documentacion_up').value;
            var horas = document.getElementById('atencion_medica_tiempo_up').value;
            var proviene = document.getElementById('atencion_medica_proviene_up').value;

            if (fecha_registro.length) {
                fecha_inicio_val = new Date(fecha_inicio);
                fecha_fin_val = new Date(fecha_fin);
                if (fecha_inicio_val < fecha_fin_val || fecha_inicio_val.getTime() == fecha_fin_val.getTime()) {
                    const motivo_val = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ0-9 ]+$/;
                    if (motivo_val.test(motivo)) {
                        const documento_val = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ0-9 ]+$/;
                        if (documento_val.test(documentacion)) {
                            const horas_val = /^[0-9]+$/;
                            if (horas_val.test(horas)) {
                                if (proviene == "Fundo" || proviene == "Planta") {
                                    if (id_usuario != "") {
                                        var obj = new Object();
                                        obj.DOCUMENTO_ID = id_documento;
                                        obj.DOCUMENTO_FECHA_REGISTRO = fecha_registro;
                                        obj.DOCUMENTO_FECHA_INICIO = fecha_inicio;
                                        obj.DOCUMENTO_FECHA_FIN = fecha_fin;
                                        obj.DOCUMENTO_MOTIVO = motivo;
                                        obj.DOCUMENTO_DOCUMENTACION = documentacion;
                                        obj.DOCUMENTO_HORAS = horas;
                                        obj.DOCUMENTO_PROVIENE = proviene;

                                        obj.DOCUMENTO_CMP = "";
                                        obj.DOCUMENTO_DIAS = "";
                                        obj.DOCUMENTO_CODIGO_DIAGNOSTICO = "";
                                        obj.DOCUMENTO_DIAGNOSTICO = "";
                                        obj.DOCUMENTO_OBSERVACIONES = "";
                                        obj.DOCUMENTO_LACTANTE = "";
                                        obj.DOCUMENTO_VINCULO_FAMILIAR = "";
                                        obj.DOCUMENTO_FALLECIDO = "";
                                        obj.DOCUMENTO_CASO = "";

                                        obj.DOCUMENTO_TIPO_DOCUMENTO_ID = id_tipo_registro;
                                        obj.DOCUMENTO_PERSONAL_ID = id_usuario;

                                        $.ajax({
                                            type: 'POST',
                                            url: "../SerPlanilla.asmx/SER_actualizar_documento",
                                            data: JSON.stringify({ obj: obj }),
                                            dataType: 'json',
                                            contentType: 'application/json; charset=utf-8',
                                            success: function (data) {
                                                //refrescar los datos de una tbal.
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Ocurrió un problema ...',
                                                    text: 'Contacte con el administrador de TI  !',
                                                })
                                            },
                                            error: function (data) {
                                                Swal.fire({
                                                    title: '¿Está seguro de realizar los cambios? ',
                                                    text: "¡Los datos quedaran guardados en el sistema!",
                                                    icon: 'warning',
                                                    showCancelButton: true,
                                                    confirmButtonColor: '#3085d6',
                                                    cancelButtonColor: '#d33',
                                                    confirmButtonText: 'Si, Aceptar ...!'
                                                }).then((result) => {
                                                    if (result.isConfirmed) {
                                                        Swal.fire(
                                                            'Actualizado  !',
                                                            'Datos actualizados con éxito. ',
                                                            'success'
                                                        ).then((result) => {
                                                            refrescar_tabla_datos();
                                                            $('#modal_editar_atencion_medica_reg').modal('hide');
                                                        })
                                                    }
                                                })
                                            }
                                        });
                                    } else {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Ocurrió un problema ...',
                                            text: 'El USUARIO, no está asignado. !',
                                        })
                                    }
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Ocurrió un problema ...',
                                        text: 'El campo Proviene, no cumple con los parámetros. !',
                                    })
                                }
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Ocurrió un problema ...',
                                    text: 'El campo HORAS, no cumple con los parámetros. !',
                                })
                            }
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un problema ...',
                                text: 'El campo Documentación no valido, solo letras y números. !',
                            })
                        }
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un problema ...',
                            text: 'El campo Proviene no valido, solo letras y números. !',
                        })
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un problema ...',
                        text: 'La fecha fin tiene que ser mayor o igual a fecha Inicio !',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'La fecha registro esta vacía!',
                })
            }
        } else if (id_tipo_registro == 3) {
            var fecha_registro = document.getElementById('bono_asistencia_fecha_registro_up').value;
            var fecha_inicio = document.getElementById('bono_asistencia_fecha_ingreso_up').value;
            var fecha_fin = document.getElementById('bono_asistencia_fecha_fin_up').value;
            var dias = document.getElementById('bono_asistencia_dias_up').value;
            var motivo = document.getElementById('bono_asistencia_motivo_up').value;
            var documentacion = document.getElementById('bono_asistencia_documentacion_up').value;
            var proviene = document.getElementById('bono_asistencia_proviene_up').value;

            if (fecha_inicio.length) {
                if (fecha_fin.length) {
                    fecha_inicio_val = new Date(fecha_inicio);
                    fecha_fin_val = new Date(fecha_fin);
                    if (fecha_inicio_val < fecha_fin_val || fecha_inicio_val.getTime() == fecha_fin_val.getTime()) {
                        const dias_val = /^[0-9]+$/;
                        if (dias_val.test(dias)) {
                            const motivo_val = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ0-9 ]+$/;
                            if (motivo_val.test(motivo)) {
                                const documentacion_val = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ0-9 ]+$/;
                                if (documentacion_val.test(documentacion)) {
                                    if (proviene == "Fundo" || proviene == "Planta") {
                                        if (id_usuario != "") {
                                            var obj = new Object();
                                            obj.DOCUMENTO_ID = id_documento;
                                            obj.DOCUMENTO_FECHA_REGISTRO = fecha_registro;
                                            obj.DOCUMENTO_FECHA_INICIO = fecha_inicio;
                                            obj.DOCUMENTO_FECHA_FIN = fecha_fin;
                                            obj.DOCUMENTO_DIAS = dias;
                                            obj.DOCUMENTO_MOTIVO = motivo;
                                            obj.DOCUMENTO_DOCUMENTACION = documentacion;
                                            obj.DOCUMENTO_PROVIENE = proviene;

                                            obj.DOCUMENTO_CMP = "";
                                            obj.DOCUMENTO_HORAS = "";
                                            obj.DOCUMENTO_CODIGO_DIAGNOSTICO = "";
                                            obj.DOCUMENTO_DIAGNOSTICO = "";
                                            obj.DOCUMENTO_OBSERVACIONES = "";
                                            obj.DOCUMENTO_LACTANTE = "";
                                            obj.DOCUMENTO_VINCULO_FAMILIAR = "";
                                            obj.DOCUMENTO_FALLECIDO = "";
                                            obj.DOCUMENTO_CASO = "";

                                            obj.DOCUMENTO_TIPO_DOCUMENTO_ID = id_tipo_registro;
                                            obj.DOCUMENTO_PERSONAL_ID = id_usuario;
                                            $.ajax({
                                                type: 'POST',
                                                url: "../SerPlanilla.asmx/SER_actualizar_documento",
                                                data: JSON.stringify({ obj: obj }),
                                                dataType: 'json',
                                                contentType: 'application/json; charset=utf-8',
                                                success: function (data) {
                                                    Swal.fire({
                                                        icon: 'error',
                                                        title: 'Ocurrió un problema ...',
                                                        text: 'Contacte con el administrador de TI  !',
                                                    })

                                                },
                                                error: function (data) {

                                                    Swal.fire({
                                                        title: '¿Está seguro de realizar los cambios? ',
                                                        text: "¡Los datos quedaran guardados en el sistema!",
                                                        icon: 'warning',
                                                        showCancelButton: true,
                                                        confirmButtonColor: '#3085d6',
                                                        cancelButtonColor: '#d33',
                                                        confirmButtonText: 'Si, Aceptar ...!'
                                                    }).then((result) => {
                                                        if (result.isConfirmed) {
                                                            Swal.fire(
                                                                'Actualizado  !',
                                                                'Datos actualizados con éxito. ',
                                                                'success'
                                                            ).then((result) => {
                                                                refrescar_tabla_datos();
                                                                $('#modal_editar_justificados_asistencia_reg').modal('hide');
                                                            })
                                                        }
                                                    })
                                                }
                                            });
                                        } else {
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Ocurrió un problema ...',
                                                text: 'No sé asignado un Personal !',
                                            })
                                        }
                                    } else {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Ocurrió un problema ...',
                                            text: 'El campo PROVIENE no cumple con los parámetros requeridos !',
                                        })
                                    }
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Ocurrió un problema ...',
                                        text: 'El campo DOCUMENTACION no cumple con los parámetros requeridos !',
                                    })
                                }
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Ocurrió un problema ...',
                                    text: 'El campo MOTIVO no cumple con los parámetros requeridos !',
                                })
                            }
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un problema ...',
                                text: 'Los DIAS no cumple con los parámetros requeridos !',
                            })
                        }
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un problema ...',
                            text: 'La FECHA FIN tiene que ser mayor o igual a la FECHA INICIO !',
                        })
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un problema ...',
                        text: 'La FECHA FIN esta vacía !',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'La FECHA INICIO esta vacía !',
                })
            }
        } else if (id_tipo_registro == 4) {
            var fecha_registro = document.getElementById('lactancia_fecha_registro_up').value;
            var fecha_inicio = document.getElementById('lactancia_fecha_inicio_up').value;
            var fecha_fin = document.getElementById('lactancia_fecha_termino_up').value;
            var lactante = document.getElementById('lactancia_lactante_up').value;
            var proviene = document.getElementById('lactancia_proviene_up').value;

            if (fecha_inicio.length) {
                if (fecha_fin.length) {
                    fecha_inicio_val = new Date(fecha_inicio);
                    fecha_fin_val = new Date(fecha_fin);
                    if (fecha_inicio_val < fecha_fin_val || fecha_inicio_val.getTime() == fecha_fin_val.getTime()) {
                        const lactante_val = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/;
                        if (lactante_val.test(lactante)) {
                            if (proviene == "Fundo" || proviene == "Planta") {
                                if (id_usuario != "") {
                                    var obj = new Object();
                                    obj.DOCUMENTO_ID = id_documento;
                                    obj.DOCUMENTO_FECHA_REGISTRO = fecha_registro;
                                    obj.DOCUMENTO_FECHA_INICIO = fecha_inicio;
                                    obj.DOCUMENTO_FECHA_FIN = fecha_fin;
                                    obj.DOCUMENTO_LACTANTE = lactante;
                                    obj.DOCUMENTO_PROVIENE = proviene;

                                    obj.DOCUMENTO_CMP = "";
                                    obj.DOCUMENTO_MOTIVO = "";
                                    obj.DOCUMENTO_DOCUMENTACION = "";
                                    obj.DOCUMENTO_HORAS = "";
                                    obj.DOCUMENTO_DIAS = "";
                                    obj.DOCUMENTO_CODIGO_DIAGNOSTICO = "";
                                    obj.DOCUMENTO_DIAGNOSTICO = "";
                                    obj.DOCUMENTO_OBSERVACIONES = "";
                                    obj.DOCUMENTO_VINCULO_FAMILIAR = "";
                                    obj.DOCUMENTO_FALLECIDO = "";
                                    obj.DOCUMENTO_CASO = "";

                                    obj.DOCUMENTO_TIPO_DOCUMENTO_ID = id_tipo_registro;
                                    obj.DOCUMENTO_PERSONAL_ID = id_usuario;

                                    $.ajax({
                                        type: 'POST',
                                        url: "../SerPlanilla.asmx/SER_actualizar_documento",
                                        data: JSON.stringify({ obj: obj }),
                                        dataType: 'json',
                                        contentType: 'application/json; charset=utf-8',
                                        success: function (data) {
                                            //refrescar los datos de una tbal.
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Ocurrió un problema ...',
                                                text: 'Contacte con el administrador de TI  !',
                                            })
                                        },
                                        error: function (data) {
                                            Swal.fire({
                                                title: '¿Está seguro de realizar los cambios? ',
                                                text: "¡Los datos quedaran guardados en el sistema!",
                                                icon: 'warning',
                                                showCancelButton: true,
                                                confirmButtonColor: '#3085d6',
                                                cancelButtonColor: '#d33',
                                                confirmButtonText: 'Si, Aceptar ...!'
                                            }).then((result) => {
                                                if (result.isConfirmed) {
                                                    Swal.fire(
                                                        'Actualizado  !',
                                                        'Datos actualizados con éxito. ',
                                                        'success'
                                                    ).then((result) => {
                                                        refrescar_tabla_datos();
                                                        $('#modal_editar_hora_lactanciareg').modal('hide');
                                                    })
                                                }
                                            })
                                        }
                                    });
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Ocurrió un problema ...',
                                        text: 'No sé asignado un Personal !',
                                    })
                                }
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Ocurrió un problema ...',
                                    text: 'El campo PROVIENE no cumple con los parámetros requeridos !',
                                })
                            }
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un problema ...',
                                text: 'El campo LACTANTE no cumple con los parámetros requeridos !',
                            })
                        }
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un problema ...',
                            text: 'La FECHA FIN tiene que ser mayor o igual a la FECHA INICIO !',
                        })
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un problema ...',
                        text: 'La FECHA FIN esta vacía !',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'La FECHA INICIO esta vacía !',
                })
            }
        } else if (id_tipo_registro == 5) {

            var fecha_registro = document.getElementById('paternidad_fecha_registro_up').value;
            var fecha_inicio = document.getElementById('paternidad_fecha_inicio_up').value;
            var fecha_fin = document.getElementById('paternidad_fecha_termino_up').value;
            var dias = document.getElementById('paternidad_dias_up').value;
            var vinculo_familiar = document.getElementById('paternidad_vinculo_familiar_up').value;
            var observaciones = document.getElementById('paternidad_observacion_up').value;
            var proviene = document.getElementById('paternidad_proviene_up').value;

            if (fecha_inicio.length) {
                if (fecha_fin.length) {
                    fecha_inicio_val = new Date(fecha_inicio);
                    fecha_fin_val = new Date(fecha_fin);
                    if (fecha_inicio_val < fecha_fin_val || fecha_inicio_val.getTime() == fecha_fin_val.getTime()) {
                        const dias_val = /^[0-9]+$/;
                        if (dias_val.test(dias)) {
                            if (vinculo_familiar == "Hijo" || vinculo_familiar == "Hija") {
                                //const observaciones_val = /^[a-zA-Z ]+$/;
                                //if (observaciones_val.test(observaciones)) {
                                    if (proviene == "Fundo" || proviene == "Planta") {
                                        if (id_usuario != "") {
                                            var obj = new Object();
                                            obj.DOCUMENTO_ID = id_documento;
                                            obj.DOCUMENTO_FECHA_REGISTRO = fecha_registro;
                                            obj.DOCUMENTO_FECHA_INICIO = fecha_inicio;
                                            obj.DOCUMENTO_FECHA_FIN = fecha_fin;
                                            obj.DOCUMENTO_DIAS = dias;
                                            obj.DOCUMENTO_VINCULO_FAMILIAR = vinculo_familiar;
                                            obj.DOCUMENTO_OBSERVACIONES = observaciones;
                                            obj.DOCUMENTO_PROVIENE = proviene;

                                            obj.DOCUMENTO_CMP = "";
                                            obj.DOCUMENTO_MOTIVO = "";
                                            obj.DOCUMENTO_DOCUMENTACION = "";
                                            obj.DOCUMENTO_HORAS = "";
                                            obj.DOCUMENTO_CODIGO_DIAGNOSTICO = "";
                                            obj.DOCUMENTO_DIAGNOSTICO = "";
                                            obj.DOCUMENTO_LACTANTE = "";
                                            obj.DOCUMENTO_FALLECIDO = "";
                                            obj.DOCUMENTO_CASO = "";

                                            obj.DOCUMENTO_TIPO_DOCUMENTO_ID = id_tipo_registro;
                                            obj.DOCUMENTO_PERSONAL_ID = id_usuario;

                                            $.ajax({
                                                type: 'POST',
                                                url: "../SerPlanilla.asmx/SER_actualizar_documento",
                                                data: JSON.stringify({ obj: obj }),
                                                dataType: 'json',
                                                contentType: 'application/json; charset=utf-8',
                                                success: function (data) {
                                                    //refrescar los datos de una tbal.
                                                    Swal.fire({
                                                        icon: 'error',
                                                        title: 'Ocurrió un problema ...',
                                                        text: 'Contacte con el administrador de TI  !',
                                                    })
                                                },
                                                error: function (data) {
                                                    Swal.fire({
                                                        title: '¿Está seguro de realizar los cambios? ',
                                                        text: "¡Los datos quedaran guardados en el sistema!",
                                                        icon: 'warning',
                                                        showCancelButton: true,
                                                        confirmButtonColor: '#3085d6',
                                                        cancelButtonColor: '#d33',
                                                        confirmButtonText: 'Si, Aceptar ...!'
                                                    }).then((result) => {
                                                        if (result.isConfirmed) {
                                                            Swal.fire(
                                                                'Actualizado  !',
                                                                'Datos actualizados con éxito. ',
                                                                'success'
                                                            ).then((result) => {
                                                                refrescar_tabla_datos();
                                                                $('#modal_editar_licencia_paternidad_reg').modal('hide');
                                                            })
                                                        }
                                                    })
                                                }
                                            });
                                        } else {
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Ocurrió un problema ...',
                                                text: 'No sé asignado un Personal !',
                                            })
                                        }
                                    } else {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Ocurrió un problema ...',
                                            text: 'El campo PROVIENE no cumple con los parámetros requeridos !',
                                        })
                                    }
                                //} else {
                                //    Swal.fire({
                                //        icon: 'error',
                                //        title: 'Ocurrió un problema ...',
                                //        text: 'El campo OBSERVACION no cumple con los parametros requeridos !',
                                //    })
                                //}
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Ocurrió un problema ...',
                                    text: 'El campo VINCULO FAMILIAR no cumple con los parámetros requeridos !',
                                })
                            }
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un problema ...',
                                text: 'El campo DIAS no cumple con los parámetros requeridos !',
                            })
                        }
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un problema ...',
                            text: 'La FECHA FIN tiene que ser mayor o igual a la FECHA INICIO !',
                        })
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un problema ...',
                        text: 'La FECHA FIN esta vacía !',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'La FECHA INICIO esta vacía!',
                })
            }
        } else if (id_tipo_registro == 6) {

            var fecha_registro = document.getElementById('fallecimiento_fecha_registro_up').value;
            var fecha_inicio = document.getElementById('fallecimiento_fecha_inicio_up').value;
            var fecha_fin = document.getElementById('fallecimiento_fecha_termino_up').value;
            var dias = document.getElementById('fallecimiento_dias_up').value;
            var fellecido = document.getElementById('fallecimiento_fallecido_up').value;
            var vinculo_familiar = document.getElementById('fallecimiento_vinculo_up').value;
            var proviene = document.getElementById('fallecimiento_proviene_up').value;

            if (fecha_inicio.length) {
                if (fecha_fin.length) {
                    fecha_inicio_val = new Date(fecha_inicio);
                    fecha_fin_val = new Date(fecha_fin);
                    if (fecha_inicio_val < fecha_fin_val || fecha_inicio_val.getTime() == fecha_fin_val.getTime()) {
                        const dias_val = /^[0-9]+$/;
                        if (dias_val.test(dias)) {
                            const fallecido_val = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/;
                            if (fallecido_val.test(fellecido)) {
                                if (vinculo_familiar == "Madre" || vinculo_familiar == "Padre" || vinculo_familiar == "Conyuge" || vinculo_familiar == "Hijo" || vinculo_familiar == "Hija" || vinculo_familiar == "Hermano" || vinculo_familiar == "Hermana") {
                                    if (proviene == "Fundo" || proviene == "Planta") {
                                        if (id_usuario != "") {
                                            var obj = new Object();
                                            obj.DOCUMENTO_ID = id_documento;
                                            obj.DOCUMENTO_FECHA_REGISTRO = fecha_registro;
                                            obj.DOCUMENTO_FECHA_INICIO = fecha_inicio;
                                            obj.DOCUMENTO_FECHA_FIN = fecha_fin;
                                            obj.DOCUMENTO_DIAS = dias;
                                            obj.DOCUMENTO_FALLECIDO = fellecido;
                                            obj.DOCUMENTO_VINCULO_FAMILIAR = vinculo_familiar;
                                            obj.DOCUMENTO_PROVIENE = proviene;

                                            obj.DOCUMENTO_CMP = "";
                                            obj.DOCUMENTO_MOTIVO = "";
                                            obj.DOCUMENTO_DOCUMENTACION = "";
                                            obj.DOCUMENTO_HORAS = "";

                                            obj.DOCUMENTO_CODIGO_DIAGNOSTICO = "";
                                            obj.DOCUMENTO_DIAGNOSTICO = "";
                                            obj.DOCUMENTO_OBSERVACIONES = "";
                                            obj.DOCUMENTO_LACTANTE = "";
                                            obj.DOCUMENTO_CASO = "";

                                            obj.DOCUMENTO_TIPO_DOCUMENTO_ID = id_tipo_registro;
                                            obj.DOCUMENTO_PERSONAL_ID = id_usuario;

                                            $.ajax({
                                                type: 'POST',
                                                url: "../SerPlanilla.asmx/SER_actualizar_documento",
                                                data: JSON.stringify({ obj: obj }),
                                                dataType: 'json',
                                                contentType: 'application/json; charset=utf-8',
                                                success: function (data) {
                                                    //refrescar los datos de una tbal.
                                                    Swal.fire({
                                                        icon: 'error',
                                                        title: 'Ocurrió un problema ...',
                                                        text: 'Contacte con el administrador de TI  !',
                                                    })
                                                },
                                                error: function (data) {
                                                    Swal.fire({
                                                        title: '¿Está seguro de realizar los cambios? ',
                                                        text: "¡Los datos quedaran guardados en el sistema!",
                                                        icon: 'warning',
                                                        showCancelButton: true,
                                                        confirmButtonColor: '#3085d6',
                                                        cancelButtonColor: '#d33',
                                                        confirmButtonText: 'Si, Aceptar ...!'
                                                    }).then((result) => {
                                                        if (result.isConfirmed) {
                                                            Swal.fire(
                                                                'Actualizado  !',
                                                                'Datos actualizados con éxito. ',
                                                                'success'
                                                            ).then((result) => {
                                                                refrescar_tabla_datos();
                                                                $('#modal_editar_licencia_fallecimiento_reg').modal('hide');
                                                            })
                                                        }
                                                    })
                                                }
                                            });
                                        } else {
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Ocurrió un problema ...',
                                                text: 'No sé asignado un Personal !',
                                            })
                                        }
                                    } else {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Ocurrió un problema ...',
                                            text: 'El campo PROVIENE no cumple con los parámetros requeridos !',
                                        })
                                    }
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Ocurrió un problema ...',
                                        text: 'El campo VINCULO FAMILIAR no cumple con los parámetros requeridos !',
                                    })
                                }
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Ocurrió un problema ...',
                                    text: 'El campo FALLECIDO no cumple con los parámetros requeridos !',
                                })
                            }
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un problema ...',
                                text: 'El campo DIAS no cumple con los parámetros requeridos !',
                            })
                        }
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un problema ...',
                            text: 'La FECHA FIN tiene que ser mayor o igual a la FECHA INICIO !',
                        })
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un problema ...',
                        text: 'La FECHA FIN esta vacía !',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'La FECHA INICIO esta vacía !',
                })
            }
        } else if (id_tipo_registro == 7) {

            var fecha_registro = document.getElementById('gose_fecha_registro_up').value;
            var fecha_inicio = document.getElementById('gose_fecha_inicio_up').value;
            var fecha_fin = document.getElementById('gose_fecha_termino_up').value;
            var dias = document.getElementById('gose_dias_up').value;
            var caso = document.getElementById('gose_caso_up').value;
            var proviene = document.getElementById('gose_proviene_up').value;

            if (fecha_inicio.length) {
                if (fecha_fin.length) {
                    fecha_inicio_val = new Date(fecha_inicio);
                    fecha_fin_val = new Date(fecha_fin);
                    if (fecha_inicio_val < fecha_fin_val || fecha_inicio_val.getTime() == fecha_fin_val.getTime()) {
                        const caso_val = /^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/;
                        if (caso_val.test(caso)) {
                            if (proviene == "Fundo" || proviene == "Planta") {
                                if (id_usuario != "") {
                                    var obj = new Object();
                                    obj.DOCUMENTO_ID = id_documento;
                                    obj.DOCUMENTO_FECHA_REGISTRO = fecha_registro;
                                    obj.DOCUMENTO_FECHA_INICIO = fecha_inicio;
                                    obj.DOCUMENTO_FECHA_FIN = fecha_fin;
                                    obj.DOCUMENTO_DIAS = dias;
                                    obj.DOCUMENTO_CASO = caso;
                                    obj.DOCUMENTO_PROVIENE = proviene;

                                    obj.DOCUMENTO_CMP = "";
                                    obj.DOCUMENTO_MOTIVO = "";
                                    obj.DOCUMENTO_DOCUMENTACION = "";
                                    obj.DOCUMENTO_HORAS = "";
                                    obj.DOCUMENTO_CODIGO_DIAGNOSTICO = "";
                                    obj.DOCUMENTO_DIAGNOSTICO = "";
                                    obj.DOCUMENTO_OBSERVACIONES = "";
                                    obj.DOCUMENTO_LACTANTE = "";
                                    obj.DOCUMENTO_VINCULO_FAMILIAR = "";
                                    obj.DOCUMENTO_FALLECIDO = "";

                                    obj.DOCUMENTO_TIPO_DOCUMENTO_ID = id_tipo_registro;
                                    obj.DOCUMENTO_PERSONAL_ID = id_usuario;

                                    $.ajax({
                                        type: 'POST',
                                        url: "../SerPlanilla.asmx/SER_actualizar_documento",
                                        data: JSON.stringify({ obj: obj }),
                                        dataType: 'json',
                                        contentType: 'application/json; charset=utf-8',
                                        success: function (data) {
                                            //refrescar los datos de una tbal.
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Ocurrió un problema ...',
                                                text: 'Contacte con el administrador de TI  !',
                                            })
                                        },
                                        error: function (data) {
                                            Swal.fire({
                                                title: '¿Está seguro de realizar los cambios? ',
                                                text: "¡Los datos quedaran guardados en el sistema!",
                                                icon: 'warning',
                                                showCancelButton: true,
                                                confirmButtonColor: '#3085d6',
                                                cancelButtonColor: '#d33',
                                                confirmButtonText: 'Si, Aceptar ...!'
                                            }).then((result) => {
                                                if (result.isConfirmed) {
                                                    Swal.fire(
                                                        'Actualizado  !',
                                                        'Datos actualizados con éxito. ',
                                                        'success'
                                                    ).then((result) => {
                                                        refrescar_tabla_datos();
                                                        $('#modal_editar_licencia_gose_reg').modal('hide');
                                                    })
                                                }
                                            })
                                        }
                                    });
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Ocurrió un problema ...',
                                        text: 'No sé asignado un Personal !',
                                    })
                                }
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Ocurrió un problema ...',
                                    text: 'El campo PROVIENE no cumple con los parámetros requeridos !',
                                })
                            }
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un problema ...',
                                text: 'El campo CASO no cumple con los parámetros requeridos !',
                            })
                        }
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un problema ...',
                            text: 'La FECHA FIN tiene que ser mayor o igual a la FECHA INICIO !',
                        })
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un problema ...',
                        text: 'La FECHA FIN esta vacía!',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un problema ...',
                    text: 'La FECHA INICIO esta vacía !',
                })
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'Contacte con el administrador de TI  !',
            })
        }
    }

    // FUNCION ANUALR DOCUMENTO
    function anular_documento(id_docuemnto, estado_documento) {
        var obj = new Object();
        if (id_docuemnto == "" || estado_documento == "ANULADO" || estado_documento == "CERRADO" || estado_documento == "APROBADO") {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'El documento ya está ANULADO, CERRADO O APROBADO!',
            })
        } else {
            obj.DOCUMENTO_ID = id_docuemnto;
            obj.DOCUMENTO_ESTADO = "ANULADO";
            $.ajax({
                type: 'POST',
                url: "../SerPlanilla.asmx/SER_anular_documento",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un error ...',
                        text: 'No se ha podido ANULAR !',
                    })
                },
                error: function (data) {
                    Swal.fire({
                        title: '¿Está seguro de realizar los cambios?',
                        text: "¡Los datos quedaran guardados en el sistema!",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Si, Aceptar ...!'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            Swal.fire(
                                'Anulado !',
                                'Documento anulado con éxito.',
                                'success'
                            ).then((result) => {
                                refrescar_tabla_datos();
                            })
                        }
                    })
                }
            });
        }
    }

    // FUNCION PARA REFRESCAR TABLA
    function refrescar_tabla_datos() {
        // FUNCION PARA LISTAR TODOS LOS DATOS DEL DOCUMENTO.
        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SerPlanilla.asmx/SER_listar_documento2",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);
                $('#container-x').html('<div class=""><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="gridDeleteSelected"></div><div id="DataGrid"></div>');
                TbDataGrid(lst);
            },
            error: function (data) {
                alert("error");
            }
        });

        function TbDataGrid(data) {
            DevExpress.localization.locale('es');
            var dataGrid = $("#DataGrid").dxDataGrid({
                dataSource: data,
                scrolling: {
                    mode: 'virtual'
                },
                grouping: {
                    autoExpandAll: false
                },
                columnChooser: {
                    enabled: true
                },
                groupPanel: {
                    visible: true
                },
                allowColumnReordering: true,
                allowColumnResizing: true,
                columnMinWidth: 30,
                columnAutoWidth: true,
                showBorders: true,
                columnFixing: {
                    enabled: true
                },
                showRowLines: true,
                showColumnLines: true,
                rowAlternationEnabled: true,
                RowAutoHeight: true,
                showBorders: true,
                export: {
                    enabled: true,
                    fileName: "Reporte de Descansos y Licencias"
                },
                // evento para poner visible las columas oclutas y poder exportar.
                onExporting: function (e) {
                    e.component.columnOption("cNroDocumento", "visible", true);
                    e.component.columnOption("DOCUMENTO_CMP", "visible", true);
                    e.component.columnOption("DOCUMENTO_CODIGO_DIAGNOSTICO", "visible", true);
                    e.component.columnOption("DOCUMENTO_DIAGNOSTICO", "visible", true);
                    e.component.columnOption("DOCIEMENTO_OBSERVACIONES", "visible", true);
                    e.component.columnOption("DOCUMENTO_MOTIVO", "visible", true);
                    e.component.columnOption("DOCUMENTO_DOCUMENTACION", "visible", true);
                    e.component.columnOption("DOCUMENTO_LACTANTE", "visible", true);
                    e.component.columnOption("DOCUMENTO_VINCULO_FAMILIAR", "visible", true);
                    e.component.columnOption("DOCUMENTO_FALLECIDO", "visible", true);
                    e.component.columnOption("DOCUMENTO_CASO", "visible", true);
                    e.component.endUpdate();
                },
                onExported: function (e) {
                    e.component.columnOption("cNroDocumento", "visible", false);
                    e.component.columnOption("DOCUMENTO_CMP", "visible", false);
                    e.component.columnOption("DOCUMENTO_CODIGO_DIAGNOSTICO", "visible", false);
                    e.component.columnOption("DOCUMENTO_DIAGNOSTICO", "visible", false);
                    e.component.columnOption("DOCIEMENTO_OBSERVACIONES", "visible", false);
                    e.component.columnOption("DOCUMENTO_MOTIVO", "visible", false);
                    e.component.columnOption("DOCUMENTO_DOCUMENTACION", "visible", false);
                    e.component.columnOption("DOCUMENTO_LACTANTE", "visible", false);
                    e.component.columnOption("DOCUMENTO_VINCULO_FAMILIAR", "visible", false);
                    e.component.columnOption("DOCUMENTO_FALLECIDO", "visible", false);
                    e.component.columnOption("DOCUMENTO_CASO", "visible", false);
                    e.component.endUpdate();
                },
                filterRow: {
                    visible: false,
                    applyFilter: "auto"
                },
                searchPanel: {
                    visible: false,
                    placeholder: "Search..."
                },
                headerFilter: {
                    visible: false
                },
                editing: {
                    mode: "row",
                    allowDeleting: true,
                    useIcons: true,
                    width: 50
                },
                //  groupIndex: 0,
                columns: [
                    , { caption: "N°", dataField: "DOCUMENTO_ID" }
                    , { caption: "Fec. Registro", dataField: "DOCUMENTO_FECHA_REGISTRO", width: 75 }
                    , { caption: "Fec. Inicio", dataField: "DOCUMENTO_FECHA_INICIO" }
                    , { caption: "Fec. Fin", dataField: "DOCUMENTO_FECHA_FIN" }
                    , { caption: "Días/Horas", dataField: "TIEMPO", width: 65 }
                    , { caption: "DNI", dataField: "cNroDocumento", visible: false }
                    , { caption: "Personal", dataField: "PERSONAL" }
                    , { caption: "Proviene", dataField: "DOCUMENTO_PROVIENE", width: 55 }
                    , {
                        caption: "Estado",
                        dataField: "DOCUMENTO_ESTADO",
                        cellTemplate: function (container, options) {
                            if (options.row.data.DOCUMENTO_ESTADO == "APROBADO") {
                                $("<div>")
                                    .append(options.value)
                                    .css("color", "#0a2a3b")
                                    .css("font-weight", "bold")
                                    .css("font-size", "10px")
                                    .appendTo(container);
                            } else if (options.row.data.DOCUMENTO_ESTADO == "CERRADO") {
                                $("<div>")
                                    .append(options.value)
                                    .css("color", "#ed1d0e")
                                    .css("font-weight", "bold")
                                    .css("font-size", "10px")
                                    .appendTo(container);
                            } else if (options.row.data.DOCUMENTO_ESTADO == "ANULADO") {
                                $("<div>")
                                    .append(options.value)
                                    .css("color", "#0a2a3b")
                                    .css("font-weight", "bold")
                                    .css("font-size", "10px")
                                    .appendTo(container);
                            } else if (options.row.data.DOCUMENTO_ESTADO == "PENDIENTE") {
                                $("<div>")
                                    .append(options.value)
                                    .css("color", "#0a2a3b")
                                    .css("font-weight", "bold")
                                    .css("font-size", "10px")
                                    .appendTo(container);
                            }
                        }
                    }
                    , { caption: "Tipo Reg.", dataField: "TIPO_REGISTRO_NOMBRE" }
                    , { caption: "Doc. Sustentario", dataField: "DOCUMENTO_CMP", visible: false }
                    , { caption: "Cod. Diagnóstico", dataField: "DOCUMENTO_CODIGO_DIAGNOSTICO", visible: false }
                    , { caption: "Diagnóstico", dataField: "DOCUMENTO_DIAGNOSTICO", visible: false }
                    , { caption: "Observaciones", dataField: "DOCIEMENTO_OBSERVACIONES", visible: false }
                    , { caption: "Motivo", dataField: "DOCUMENTO_MOTIVO", visible: false }
                    , { caption: "Documentación", dataField: "DOCUMENTO_DOCUMENTACION", visible: false }
                    , { caption: "Lactante", dataField: "DOCUMENTO_LACTANTE", visible: false }
                    , { caption: "Vinc. Familiar", dataField: "DOCUMENTO_VINCULO_FAMILIAR", visible: false}
                    , { caption: "Fallecido", dataField: "DOCUMENTO_FALLECIDO", visible: false }
                    , { caption: "Caso", dataField: "DOCUMENTO_CASO", visible: false }
                    , {
                        caption: "Editar",
                        type: "buttons",
                        buttons: [{
                            icon: "edit",
                            onClick: function (e) {
                                if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 1) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                } else if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 2) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                } else if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 3) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                } else if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 4) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                } else if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 5) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                } else if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 6) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                } else if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 7) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                }

                            }
                        }]
                    }
                    , {
                        caption: "Anular",
                        type: "buttons",
                        buttons: [{
                            icon: "trash",
                            onClick: function (e) {
                                priv_btn_anular(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                            }
                        }]
                    }
                    , {
                        caption: "Aprobar",
                        type: "buttons",
                        buttons: [{
                            icon: "check",
                            onClick: function (e) {
                                priv_btn_aprobar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                            }
                        }]
                    }
                ],
                sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }],
                summary: {
                    groupItems: [{
                        column: "DOCUMENTO_ID",
                        summaryType: "count",
                        displayFormat: "{0} Postulantes",
                    }]
                },
                onSelectionChanged: function (selectedItems) {
                    changedBySelectBox = false;
                    var data = selectedItems.selectedRowsData;
                    if (data.length > 0)

                        cad_id = $.map(data, function (value) {
                            return value.nIdPersona;
                        }).join(";")
                    else
                        cad_id = '';
                    $("#Div_close_part").hide();
                    var elements = cad_id.split(';');
                    $('#selx').text(elements.length);
                    if (!changedBySelectBox)
                        changedBySelectBox = false;
                    if (cad_id != '') {
                        $("#Div_close_part").show();
                    } else {
                        $("#Div_close_part").hide();
                    }
                },
                onRowRemoving: function (e) {
                    DeleteSeleccion(e.key.nIdPersona, '0');
                },
                onRowRemoved: function (e) {
                }

            }).dxDataGrid("instance");


            $("#autoExpand").dxCheckBox({
                value: false,
                text: "Expandir",
                onValueChanged: function (data) {
                    dataGrid.option("grouping.autoExpandAll", data.value);
                }
            });

            $("#filterRow").dxCheckBox({
                text: "Buscar",
                value: false,
                onValueChanged: function (data) {
                    dataGrid.clearFilter();
                    dataGrid.option("filterRow.visible", data.value);
                }
            });

            $("#headerFilter").dxCheckBox({
                text: "Filtro",
                value: false,
                onValueChanged: function (data) {
                    dataGrid.clearFilter();
                    dataGrid.option("headerFilter.visible", data.value);
                }
            });

        }

    }

    // FUNCION PARA LIMPAIR LOS CAMPOS
    function limpiar_campos(tipo_registro_id) {

        //btn buscar
        document.getElementById('usuario_dni_busc').value = "";
        //// usuario

        if (tipo_registro_id == 1) {
            // descanso medico
            /*document.getElementById('descanso_medico_fecha_registro').value = "";*/
            document.getElementById('descanso_medico_fecha_inicio').value = "";
            document.getElementById('descanso_medico_fecha_fin').value = "";
            document.getElementById('descanso_medico_num_dias').value = "";
            document.getElementById('descanso_medico_cmp').value = "";
            document.getElementById('descanso_medico_codigo').value = "";
            document.getElementById('cDescClieProv').value = "";
            document.getElementById('descanso_medico_observacion').value = "";
            document.getElementById('descanso_medico_proviene').value = "";

            document.getElementById('usuario_dni_busc').value = "";
            document.getElementById('usuario_dni').value = "";
            document.getElementById('usuario_nombres').value = "";
            document.getElementById('usuario_codigo_planilla').value = "";
            document.getElementById('usuario_cargo').value = "";
        } else if (tipo_registro_id == 2) {
            // atencion medica
           /* document.getElementById('atencion_medica_fecha_atencion').value = "";*/
            document.getElementById('atencion_medica_fecha_inicio').value = "";
            document.getElementById('atencion_medica_fecha_fin').value = "";
            document.getElementById('atencion_medica_motivo').value = "";
            document.getElementById('atencion_medica_documentacion').value = "";
            document.getElementById('atencion_medica_tiempo').value = "";
            document.getElementById('atencion_medica_proviene').value = "";

            document.getElementById('usuario_dni_busc').value = "";
            document.getElementById('usuario_dni').value = "";
            document.getElementById('usuario_nombres').value = "";
            document.getElementById('usuario_codigo_planilla').value = "";
            document.getElementById('usuario_cargo').value = "";
        } else if (tipo_registro_id == 3) {
            // bono asistencia
           /* document.getElementById('bono_asistencia_fecha_ingreso').value = "";*/
            document.getElementById('bono_asistencia_fecha_fin').value = "";
            document.getElementById('bono_asistencia_dias').value = "";
            document.getElementById('bono_asistencia_motivo').value = "";
            document.getElementById('bono_asistencia_documentacion').value = "";
            document.getElementById('bono_asistencia_proviene').value = "";

            document.getElementById('usuario_dni_busc').value = "";
            document.getElementById('usuario_dni').value = "";
            document.getElementById('usuario_nombres').value = "";
            document.getElementById('usuario_codigo_planilla').value = "";
            document.getElementById('usuario_cargo').value = "";
        } else if (tipo_registro_id == 4) {
            // lactancia
            document.getElementById('lactancia_fecha_inicio').value = "";
            document.getElementById('lactancia_fecha_termino').value = "";
            document.getElementById('lactancia_lactante').value = "";
            document.getElementById('lactancia_proviene').value = "";

            document.getElementById('usuario_dni_busc').value = "";
            document.getElementById('usuario_dni').value = "";
            document.getElementById('usuario_nombres').value = "";
            document.getElementById('usuario_codigo_planilla').value = "";
            document.getElementById('usuario_cargo').value = "";
        } else if (tipo_registro_id == 5) {
            // paternidad
            document.getElementById('paternidad_fecha_inicio').value = "";
            document.getElementById('paternidad_fecha_termino').value = "";
            document.getElementById('paternidad_dias').value = "";
            document.getElementById('paternidad_vinculo_familiar').value = "";
            document.getElementById('paternidad_observacion').value = "";
            document.getElementById('paternidad_proviene').value = "";

            document.getElementById('usuario_dni_busc').value = "";
            document.getElementById('usuario_dni').value = "";
            document.getElementById('usuario_nombres').value = "";
            document.getElementById('usuario_codigo_planilla').value = "";
            document.getElementById('usuario_cargo').value = "";
        } else if (tipo_registro_id == 6) {
            // fallecimeinto
            document.getElementById('fallecimiento_fecha_inicio').value = "";
            document.getElementById('fallecimiento_fecha_termino').value = "";
            document.getElementById('fallecimiento_dias').value = "";
            document.getElementById('fallecimiento_fallecido').value = "";
            document.getElementById('fallecimiento_vinculo').value = "";
            document.getElementById('fallecimiento_proviene').value = "";

            document.getElementById('usuario_dni_busc').value = "";
            document.getElementById('usuario_dni').value = "";
            document.getElementById('usuario_nombres').value = "";
            document.getElementById('usuario_codigo_planilla').value = "";
            document.getElementById('usuario_cargo').value = "";
        } else if (tipo_registro_id == 7) {
            // goce
            document.getElementById('gose_fecha_inicio').value = "";
            document.getElementById('gose_fecha_termino').value = "";
            document.getElementById('gose_dias').value = "";
            document.getElementById('gose_caso').value = "";
            document.getElementById('gose_proviene').value = "";

            document.getElementById('usuario_dni_busc').value = "";
            document.getElementById('usuario_dni').value = "";
            document.getElementById('usuario_nombres').value = "";
            document.getElementById('usuario_codigo_planilla').value = "";
            document.getElementById('usuario_cargo').value = "";
        }
    }

    // FUNCION LISTAR SEMANAS
    function listar_semana() {

        var apertura_sem_anio = document.getElementById('apertura_seman_anio').value;
        var paertura_sem_id = document.getElementById('apertura_seman_semana').value;

        if (paertura_sem_id != "") {
            var obj = new Object();
            obj.APERTURA_SEM_ANIO = apertura_sem_anio;
            obj.APERTURA_SEM_ID = paertura_sem_id;
            $.ajax({
                type: 'POST',
                url: "../SerPlanilla.asmx/SER_listar_fechas_semana",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    //capturamos los datos
                    var lst = JSON.parse(data.d);
                    if (lst[0] == null) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un error ...',
                            text: 'No se encontró la semana.',
                        })
                    } else {
                        var ID = lst[0].cIdSemana;
                        var fecha_inicio = lst[0].dFechaIni;
                        var fecha_fin = lst[0].dFechaFin;
                        var estado = lst[0].bEstado;
                        var anio = lst[0].nAnio;

                        // mostramos los datos del personal
                        document.getElementById("cerrar_fecha_inicio_sem").value = fecha_inicio;
                        document.getElementById("cerrar_fecha_fin_sem").value = fecha_fin;
                        document.getElementById("cerrar_fecha_estado_sem").value = estado;
                        document.getElementById("cerrar_fecha_anio_sem").value = anio;
                        document.getElementById("cerrar_fecha_ID_sem").value = ID;
                    }
                },
                error: function (data) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un error ...',
                        text: 'Tiene errores al ejecutar o no existe dicha semana ...!',
                    }).then((result) => {
                        document.getElementById("apertura_seman_anio").value = "";
                        document.getElementById("apertura_seman_semana").value = "";
                    })
                    
                }
            });
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un error ...',
                text: 'El campo está vacío !',
            })
        }
    }

    // FUNCION LISTAR FECHAS DE SEMANA
    function listar_semana_datos() {
        var anio = document.getElementById('cerrar_semana_anio').value;
        var semana = document.getElementById('cerrar_semana_semana').value;

        if (semana != "") {
            var obj = new Object();
            obj.APERTURA_SEM_ANIO = anio;
            obj.APERTURA_SEM_ID = semana;
            $.ajax({
                type: 'POST',
                url: "../SerPlanilla.asmx/SER_listar_fechas_semana",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    //capturamos los datos
                    var lst = JSON.parse(data.d);
                    if (lst[0] == null) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un error ...',
                            text: 'No existe dicha semana',
                        })
                    } else {
                        var ID = lst[0].cIdSemana;
                        var fecha_inicio = lst[0].dFechaIni;
                        var fecha_fin = lst[0].dFechaFin;
                        var estado = lst[0].bEstado;
                        var anio = lst[0].nAnio;

                        // mostramos los datos del personal
                        document.getElementById("cerrar_fecha_ini_t").value = fecha_inicio;
                        document.getElementById("cerrar_fecha_fin_t").value = fecha_fin;
                        document.getElementById("cerrar_estado_fin_t").value = estado;
                        document.getElementById("cerrar_anio_t").value = anio;
                        document.getElementById("cerrar_id_t").value = ID;
                    }
                },
                error: function (data) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un error ...',
                        text: 'Tiene errores al ejecutar o no existe dicho código ...!',
                    }).then((result) => {
                        document.getElementById("cerrar_semana_anio").value = "";
                        document.getElementById("cerrar_semana_semana   ").value = "";
                    })
                }
            });
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un error...',
                text: 'El campo está vacío !',
            })
        }
    }

    // FUNCION LISTAR FECHAS DE FILTRO
    function listar_semana_filtro() {
        var anio_actual = document.getElementById('anio_busc_filt').value;
        var semana = document.getElementById('semana_busc_filt').value;
     /*   var semana_final = semana - anio;*/

        var anio = anio_actual.substr(0,4);

        /*alert(semana)*/
        if (anio != "") {
            if (semana != "") {
                var obj = new Object();
                obj.APERTURA_SEM_ANIO = anio;
                obj.APERTURA_SEM_ID = semana;
                $.ajax({
                    type: 'POST',
                    url: "../SerPlanilla.asmx/SER_listar_fechas_semana",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst[0] == null) {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un error ...',
                                text: 'La semana que intenta buscar no está registrado.',
                            })
                            document.getElementById('anio_busc_filt').value = "";
                            document.getElementById('semana_busc_filt').value = "";
                        } else {
                            var ID = lst[0].cIdSemana;
                            var fecha_inicio = lst[0].dFechaIni;
                            var fecha_fin = lst[0].dFechaFin;
                            var estado = lst[0].bEstado;
                            var anio = lst[0].nAnio;

                            // mostramos los datos del personal
                            document.getElementById("fecha_inicio_filt").value = fecha_inicio;
                            document.getElementById("fecha_fin_filt").value = fecha_fin;

                            if (estado == "true") {
                                document.getElementById("estado_filt").value = "ABIERTO";
                                $('#btn_cerrar_semana_dato').show();
                                $('#btn_apert_semana_dato').hide();
                                $('#btn_registrar').show();
                                /*document.getElementById("btn_registrar").disabled = false;*/
                            } else {
                                document.getElementById("estado_filt").value = "CERRADO";
                                $('#btn_cerrar_semana_dato').hide();
                                $('#btn_apert_semana_dato').show();
                                $('#btn_registrar').hide();
                                /*document.getElementById("btn_registrar").disabled = true;*/
                            }
                        }
                    },
                    error: function (data) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un error ...',
                            text: 'Tiene errores al ejecutar o no existe dicha semana ...!',
                        })
                        document.getElementById('anio_busc_filt').value = "";
                        document.getElementById('semana_busc_filt').value = "";
                    }
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un error ...',
                    text: 'El campo semana esta vacía!',
                })
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un error...',
                text: 'El campo año esta vacía !',
            })
        }
    }

    // FUNCION CERRAR SEMANA
    function cerrar_semana_datos() {
        var fecha_ini = document.getElementById("fecha_inicio_filt").value;
        var fecha_fin = document.getElementById("fecha_fin_filt").value;
        var estado = document.getElementById("estado_filt").value;

        var anio = document.getElementById("anio_busc_filt").value;
        var anio_actual_pert = anio.substr(0,4);

        var id = document.getElementById("semana_busc_filt").value;
       
        if (estado == "ABIERTO") {
            estado = 1;
        } else {
            estado = 0;
        }
            if (fecha_ini != "") {
                if (fecha_fin != "") {
                    var obj = new Object();
                    obj.CERRAR_SEMANA_ID = id;
                    obj.CERRAR_SEMANA_ANIO = anio_actual_pert;
                    obj.FECHA_INICIO = fecha_ini;
                    obj.FECHA_FIN = fecha_fin;
                    $.ajax({
                        type: 'POST',
                        url: "../SerPlanilla.asmx/SER_cerrar_semana_datos",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un problema ...',
                                text: 'Contacte con el administrador de TI  !',
                            })
                        },
                        error: function (data) {
                            Swal.fire({
                                title: '¿Está seguro de realizar los cambios?',
                                text: "¡Los datos quedaran guardados en el sistema!",
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: 'Si, Aceptar ...!'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    Swal.fire(
                                        'Semana Cerrada !',
                                        'Datos guardados con éxito.',
                                        'success'
                                    ).then((result) => {
                                        $('#modal_cerrar').modal('hide');
                                        /* verificar_docuemntos_sin_aprobar();*/
                                        cargar_semana_actual();
                                        refrescar_tabla_datos(),

                                        document.getElementById("semana_busc_filt").value = "";
                                        document.getElementById("fecha_inicio_filt").value = "";
                                        document.getElementById("fecha_fin_filt").value = "";
                                        document.getElementById('estado_filt').value = "";

                                        $('#btn_apert_semana_dato').show();
                                        $('#btn_cerrar_semana_dato').hide();
                                        $('#btn_registrar').hide();
                                    })
                                }
                            })
                        }
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un error ...',
                        text: 'La fecha Fin esta vacío!',
                    })
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un error ...',
                    text: 'El campo está vacío !',
                })
            }
        
    }

    // FUNCION FILTARR POR SEMANA
    function filtrar_semana_datos() {
        var fecha_ini_sem = document.getElementById('fecha_inicio_filt').value;
        var fecha_fin_sem = document.getElementById('fecha_fin_filt').value;

        if (fecha_ini_sem != "") {
            if (fecha_fin_sem != "") {
                var obj = new Object();
                obj.FILTRO_FECHA_INI = fecha_ini_sem;
                obj.FILTRO_FIN = fecha_fin_sem;
                $.ajax({
                    type: 'POST',
                    url: "../SerPlanilla.asmx/SER_filtrar_semana_datos",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        $('#container-x').html('<div class=""><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="gridDeleteSelected"></div><div id="DataGrid"></div>');
                        TbDataGrid(lst);

                        /*verificar_docuemntos_sin_aprobar();*/   
                    },
                    error: function (data) {
                        Swal.fire({
                            icon: 'succees',
                            title: 'No se puede filtrar ...',
                            text: 'Verifique los datos ...!',
                        })
                    }
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un error ...',
                    text: 'Fecha Fin esta vacío...!',
                })
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un error ...',
                text: 'Fecha inicio esta vacío ...!',
            })
        }

        function TbDataGrid(data) {
            DevExpress.localization.locale('es');
            var dataGrid = $("#DataGrid").dxDataGrid({
                dataSource: data,
                scrolling: {
                    mode: 'virtual'
                },
                grouping: {
                    autoExpandAll: false
                },
                columnChooser: {
                    enabled: true
                },
                groupPanel: {
                    visible: true
                },
                allowColumnReordering: true,
                allowColumnResizing: true,
                columnMinWidth: 30,
                columnAutoWidth: true,
                showBorders: true,
                columnFixing: {
                    enabled: true
                },
                showRowLines: true,
                showColumnLines: true,
                rowAlternationEnabled: true,
                RowAutoHeight: true,
                showBorders: true,
                export: {
                    enabled: true,
                    fileName: "Reporte Documentos"
                },
                // evento para poner visible las columas oclutas y poder exportar.
                onExporting: function (e) {
                    e.component.columnOption("cNroDocumento", "visible", true);
                    e.component.columnOption("DOCUMENTO_CMP", "visible", true);
                    e.component.columnOption("DOCUMENTO_CODIGO_DIAGNOSTICO", "visible", true);
                    e.component.columnOption("DOCUMENTO_DIAGNOSTICO", "visible", true);
                    e.component.columnOption("DOCIEMENTO_OBSERVACIONES", "visible", true);
                    e.component.columnOption("DOCUMENTO_MOTIVO", "visible", true);
                    e.component.columnOption("DOCUMENTO_DOCUMENTACION", "visible", true);
                    e.component.columnOption("DOCUMENTO_LACTANTE", "visible", true);
                    e.component.columnOption("DOCUMENTO_VINCULO_FAMILIAR", "visible", true);
                    e.component.columnOption("DOCUMENTO_FALLECIDO", "visible", true);
                    e.component.columnOption("DOCUMENTO_CASO", "visible", true);
                    e.component.endUpdate();
                },
                onExported: function (e) {
                    e.component.columnOption("cNroDocumento", "visible", false);
                    e.component.columnOption("DOCUMENTO_CMP", "visible", false);
                    e.component.columnOption("DOCUMENTO_CODIGO_DIAGNOSTICO", "visible", false);
                    e.component.columnOption("DOCUMENTO_DIAGNOSTICO", "visible", false);
                    e.component.columnOption("DOCIEMENTO_OBSERVACIONES", "visible", false);
                    e.component.columnOption("DOCUMENTO_MOTIVO", "visible", false);
                    e.component.columnOption("DOCUMENTO_DOCUMENTACION", "visible", false);
                    e.component.columnOption("DOCUMENTO_LACTANTE", "visible", false);
                    e.component.columnOption("DOCUMENTO_VINCULO_FAMILIAR", "visible", false);
                    e.component.columnOption("DOCUMENTO_FALLECIDO", "visible", false);
                    e.component.columnOption("DOCUMENTO_CASO", "visible", false);
                    e.component.endUpdate();
                },
                filterRow: {
                    visible: false,
                    applyFilter: "auto"
                },
                searchPanel: {
                    visible: false,
                    placeholder: "Search..."
                },
                headerFilter: {
                    visible: false
                },
                editing: {
                    mode: "row",
                    allowDeleting: true,
                    useIcons: true,
                    width: 50
                },
                //  groupIndex: 0,
                columns: [
                    , { caption: "N°", dataField: "DOCUMENTO_ID" }
                    , { caption: "Fec. Registro", dataField: "DOCUMENTO_FECHA_REGISTRO", width: 75 }
                    , { caption: "Fec. Inicio", dataField: "DOCUMENTO_FECHA_INICIO" }
                    , { caption: "Fec. Fin", dataField: "DOCUMENTO_FECHA_FIN" }
                    , { caption: "Días/Horas", dataField: "TIEMPO", width: 65 }
                    , { caption: "DNI", dataField: "cNroDocumento", visible: false }
                    , { caption: "Personal", dataField: "PERSONAL" }
                    , { caption: "Proviene", dataField: "DOCUMENTO_PROVIENE", width: 55 }
                    , {
                        caption: "Estado",
                        dataField: "DOCUMENTO_ESTADO",
                        cellTemplate: function (container, options) {
                            if (options.row.data.DOCUMENTO_ESTADO == "APROBADO") {
                                $("<div>")
                                    .append(options.value)
                                    .css("color", "#0a2a3b")
                                    .css("font-weight", "bold")
                                    .css("font-size", "10px")
                                    .appendTo(container);
                            } else if (options.row.data.DOCUMENTO_ESTADO == "CERRADO") {
                                $("<div>")
                                    .append(options.value)
                                    .css("color", "#ed1d0e")
                                    .css("font-weight", "bold")
                                    .css("font-size", "10px")
                                    .appendTo(container);
                            } else if (options.row.data.DOCUMENTO_ESTADO == "ANULADO") {
                                $("<div>")
                                    .append(options.value)
                                    .css("color", "#0a2a3b")
                                    .css("font-weight", "bold")
                                    .css("font-size", "10px")
                                    .appendTo(container);
                            } else if (options.row.data.DOCUMENTO_ESTADO == "PENDIENTE") {
                                $("<div>")
                                    .append(options.value)
                                    .css("color", "#0a2a3b")
                                    .css("font-weight", "bold")
                                    .css("font-size", "10px")
                                    .appendTo(container);
                            }
                        }
                    }
                    , { caption: "Tipo Reg.", dataField: "TIPO_REGISTRO_NOMBRE" }
                    , { caption: "Doc. Sustentario", dataField: "DOCUMENTO_CMP", visible: false }
                    , { caption: "Cod. Diagnóstico", dataField: "DOCUMENTO_CODIGO_DIAGNOSTICO", visible: false }
                    , { caption: "Diagnóstico", dataField: "DOCUMENTO_DIAGNOSTICO", visible: false }
                    , { caption: "Observaciones", dataField: "DOCIEMENTO_OBSERVACIONES", visible: false }
                    , { caption: "Motivo", dataField: "DOCUMENTO_MOTIVO", visible: false }
                    , { caption: "Documentación", dataField: "DOCUMENTO_DOCUMENTACION", visible: false }
                    , { caption: "Lactante", dataField: "DOCUMENTO_LACTANTE", visible: false }
                    , { caption: "Vinc. Familiar", dataField: "DOCUMENTO_VINCULO_FAMILIAR", visible: false }
                    , { caption: "Fallecido", dataField: "DOCUMENTO_FALLECIDO", visible: false }
                    , { caption: "Caso", dataField: "DOCUMENTO_CASO", visible: false }
                    , {
                        caption: "Editar",
                        type: "buttons",
                        buttons: [{
                            icon: "edit",
                            onClick: function (e) {
                                if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 1) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                } else if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 2) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                } else if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 3) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                } else if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 4) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                } else if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 5) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                } else if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 6) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                } else if (e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID == 7) {
                                    priv_btn_editar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_TIPO_DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                                }

                            }
                        }]
                    }
                    , {
                        caption: "Anular",
                        type: "buttons",
                        buttons: [{
                            icon: "trash",
                            onClick: function (e) {
                                priv_btn_anular(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                            }
                        }]
                    }
                    , {
                        caption: "Aprobar",
                        type: "buttons",
                        buttons: [{
                            icon: "check",
                            onClick: function (e) {
                                priv_btn_aprobar(e.row.data.DOCUMENTO_ID, e.row.data.DOCUMENTO_ESTADO);
                            }
                        }]
                    }
                ],
                sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }],
                summary: {
                    groupItems: [{
                        column: "DOCUMENTO_ID",
                        summaryType: "count",
                        displayFormat: "{0} Postulantes",
                    }]
                },
                onSelectionChanged: function (selectedItems) {
                    changedBySelectBox = false;
                    var data = selectedItems.selectedRowsData;
                    if (data.length > 0)

                        cad_id = $.map(data, function (value) {
                            return value.nIdPersona;
                        }).join(";")
                    else
                        cad_id = '';
                    $("#Div_close_part").hide();
                    var elements = cad_id.split(';');
                    $('#selx').text(elements.length);
                    if (!changedBySelectBox)
                        changedBySelectBox = false;
                    if (cad_id != '') {
                        $("#Div_close_part").show();
                    } else {
                        $("#Div_close_part").hide();
                    }
                },
                onRowRemoving: function (e) {
                    DeleteSeleccion(e.key.nIdPersona, '0');
                },
                onRowRemoved: function (e) {
                }

            }).dxDataGrid("instance");


            $("#autoExpand").dxCheckBox({
                value: false,
                text: "Expandir",
                onValueChanged: function (data) {
                    dataGrid.option("grouping.autoExpandAll", data.value);
                }
            });

            $("#filterRow").dxCheckBox({
                text: "Buscar",
                value: false,
                onValueChanged: function (data) {
                    dataGrid.clearFilter();
                    dataGrid.option("filterRow.visible", data.value);
                }
            });

            $("#headerFilter").dxCheckBox({
                text: "Filtro",
                value: false,
                onValueChanged: function (data) {
                    dataGrid.clearFilter();
                    dataGrid.option("headerFilter.visible", data.value);
                }
            });

        }
    }

    // FUNCION PARA APERTUAR SEMANAN
    function registrar_apertura_semana() {
        var id = document.getElementById("semana_busc_filt").value;
        var anio = document.getElementById("anio_busc_filt").value;

        var fecha_inicio = document.getElementById("fecha_inicio_filt").value;
        var fecha_fin = document.getElementById("fecha_fin_filt").value;

        var anio_actual_cer = anio.substr(0,4);
        
        if (id != "") {
            if (anio != "") {
                var obj = new Object();
                obj.CERRAR_SEMANA_ID = id;
                obj.CERRAR_SEMANA_ANIO = anio_actual_cer;
                obj.CERRAR_SEMANA_FECHA_INI = fecha_inicio;
                obj.CERRAR_SEMANA_FIN = fecha_fin;
                $.ajax({
                    type: 'POST',
                    url: "../SerPlanilla.asmx/SER_registrar_cierre_semana_datos",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst[0] == null) {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un error...',
                                text: 'Reporte el error a: soporte.ti@sunfruits.com.pe',
                            })
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Ocurrió un error ...',
                                text: 'Contacte con el administrador de TI  !',
                            })
                        }
                    },
                    error: function (data) {

                        Swal.fire({
                            title: '¿Está seguro de realizar los cambios?',
                            text: "¡Los datos quedaran guardados en el sistema!",
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: 'Si, Aceptar ...!'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                Swal.fire(
                                    'Semana Aperturada!',
                                    'Datos guardados con éxito.',
                                    'success'
                                ).then((result) => {
                                    $('#modal_apertura').modal('hide');

                                    cargar_semana_actual();
                                    refrescar_tabla_datos();
                                    document.getElementById("semana_busc_filt").value = "";
                                    document.getElementById("fecha_inicio_filt").value = "";
                                    document.getElementById("fecha_fin_filt").value = "";
                                    document.getElementById('estado_filt').value = "";

                                    $('#btn_apert_semana_dato').hide();
                                    $('#btn_cerrar_semana_dato').show();
                                    $('#btn_registrar').show();

                                    
                                })
                            }
                        })
                    }
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Ocurrió un error...',
                    text: 'El campo año esta vacío  !',
                })
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un error ...',
                text: 'No esta definido el usuario  !',
            })
        }
    }

    // FUNCION APROBAR DOCUMENTO
    function aprobar_documento(id_docuemnto, estado_documento) {
        var obj = new Object();
        if (id_docuemnto == "" || estado_documento == "ANULADO" || estado_documento == "CERRADO" || estado_documento == "APROBADO") {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un problema ...',
                text: 'El documento ya esta CERRADO, ANULADO o APROBADO !',
            })
        } else {
            obj.DOCUMENTO_ID = id_docuemnto;
            obj.DOCUMENTO_ESTADO = "APROBADO";
            $.ajax({
                type: 'POST',
                url: "../SerPlanilla.asmx/SER_aprobar_documento",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ocurrió un error ...',
                        text: 'No se ha podido APROBAR !',
                    })
                },
                error: function (data) {
                    Swal.fire({
                        title: '¿Está seguro de realizar los cambios?',
                        text: "¡Los datos quedaran guardados en el sistema!",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Si, Aceptar ...!'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            Swal.fire(
                                'Aprobado !',
                                'Dato Aprobado con éxito.',
                                'success'
                            ).then((result) => {
                                refrescar_tabla_datos();
                            })
                        }
                    })
                }
            });
        }
    }

    //FUNCION BLOQUER BOTONES
    document.getElementById('btn_registrar').addEventListener('click', () => {
        var obj = new Object();
        $.ajax({
            type: 'POST',
            url: "../SerPlanilla.asmx/SER_bloquear_boton",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);
                if (lst[0].Column1 == 1) {
                    document.getElementById("btn_registrar").disabled = false;
                } else {
                    Swal.fire(
                        'Verifique ..!!',
                        'Solo puede tener una semana abierta, así poder realizar registros.',
                        'question'
                    ).then((result) => {
                        $('#modal_form_reg').modal('hide'); // DDESABULITAR
                        document.getElementById("btn_registrar").disabled = true; // DESABILITAR
                    })
                }
            },
            error: function (data) {
                Swal.fire(
                    'Ocurrió un error !',
                    'Error al ejecutar la sentencia.',
                    'error'
                )
            }
        });
    })
    /// verificar cuantos docuemntos flata aprobar
    function verificar_docuemntos_sin_aprobar() {
        var fecha_ini_sem = document.getElementById('fecha_inicio_filt').value;
        var fecha_fin_sem = document.getElementById('fecha_fin_filt').value;

        var obj = new Object();
        obj.FECHA_INICIO = fecha_ini_sem;
        obj.FECHA_FIN = fecha_fin_sem;
        $.ajax({
            type: 'POST',
            url: "../SerPlanilla.asmx/SER_consulta_docuemnto_cerrado",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                var lst = JSON.parse(data.d);
                if (lst[0].Column1 == 0) {
                    Swal.fire(
                        'No se encontraron documentos PENDIENTES !',
                        'Puede Cerrar Semana ...',
                        'success'
                    )
                    $('#btn_cerrar_semana_dato').show();
                    cerrar_semana_datos(); 
                } else {
                    Swal.fire(
                        'Documentos PENDIENTES !',
                        'Revise el listado de documentos que faltan aprobar.',
                        'question'
                    )
                    /*$('#btn_cerrar_semana_dato').hide();*/
                }
            },
            error: function (data) {
                Swal.fire(
                    'No se encontraron documentos por verificar !',
                    'Consulte otra semana ...',
                    'success'
                )
                $('#btn_cerrar_semana_dato').show();
                cerrar_semana_datos();
            }
        });
    }

    // FUNCION EJECUTAR UNA OBETWNR FECHAS.
    document.getElementById('semana_busc_filt').onchange = function () {
      
        listar_semana_filtro();
    }
    document.getElementById('anio_busc_filt').onchange = function () {

        listar_semana_anio();
    }

    // FUNCION LISTAR FECHAS DE FILTRO
    function listar_semana_anio(anio, semana) {
        // limpiamos el campo nates de mostara datoa.
        $('#semana_busc_filt').html('');
        
        var anio_actual = anio;
        var semana_actual = semana;
       /* alert(anio);*/
        /*alert(semana_actual);*/
        if (anio != "") {
            /*if (semana != "") {*/
                var obj = new Object();
                /*obj.APERTURA_SEM_ANIO = anio;*/
            obj.SEMANA_ANIO_LIST = anio_actual;
            obj.SEMANA_ANIO_MES = semana_actual;
                $.ajax({
                    type: 'POST',
                    url: "../SerPlanilla.asmx/SER_listar_semana_anio",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        var x = document.getElementById("semana_busc_filt");
                        for (var i = 0; i < lst.length; i++) {
                            
                            var option = document.createElement("option");
                            option.value = lst[i].cIdSemana;
                            option.text = lst[i].semana;
                            x.add(option);
                        }
                    },
                    error: function (data) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrió un error ...',
                            text: 'Tiene errores al ejecutar o no existe dicha semana ...!',
                        })
                    }
                });
            //} else {
            //    Swal.fire({
            //        icon: 'error',
            //        title: 'Ocurrio un error ...',
            //        text: 'El campo semana esta vacia !',
            //    })
            //}
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Ocurrió un error ...',
                text: 'El campo año esta vacía !',
            })
        }
    }

    // EVNTON PARA LISTAR M LAS SEMANS
    $('#anio_busc_filt').on('dp.change', function (e) {
        
            var formatedValue = e.date.format(e.date._f);
        if ($('#anio_busc_filt').val().length == 6) {
            listar_semana_anio($('#anio_busc_filt').val().substr(0, 4), $('#anio_busc_filt').val().slice(-2));
            }
        
    })
    

</script>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">

</asp:Content>