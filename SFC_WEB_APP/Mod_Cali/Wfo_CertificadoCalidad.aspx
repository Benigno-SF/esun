<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_CertificadoCalidad.aspx.cs" Inherits="SFC_WEB_APP.Mod_Cali.Wfo_CertificadoCalidad" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.light.css" />
    
    <script src="../Scripts/sweetalert2.js"></script>
    <script src="../Content/DevExtreme/cldr.min.js"></script>
    <script src="../Content/DevExtreme/event.min.js"></script>
    <script src="../Content/DevExtreme/supplemental.min.js"></script>
    <script src="../Content/DevExtreme/unresolved.min.js"></script>
    <script src="../Content/DevExtreme/globalize.min.js"></script>
    <script src="../Content/DevExtreme/number.min.js"></script>
    <script src="../Content/DevExtreme/message.min.js"></script>
    <script src="../Content/DevExtreme/currency.min.js"></script>
    <script src="../Content/DevExtreme/date.min.js"></script>
    <script src="../Content/DevExtreme/jszip.min.js"></script>
    <script src="../Content/DevExtreme/dx.all.js"></script>
    <script src="../Content/DevExtreme/dx.messages.es.js"></script>
    <script src="../Content/DevExtreme/supplemental.js"></script>
    <script src="../Content/DevExtreme/es.js"></script>

    <style>
        #events {
            background-color: rgba(191, 191, 191, 0.15);
            padding: 20px;
            margin-top: 20px;
        }

            #events > div {
                padding-bottom: 5px;
            }

                #events > div:after {
                    content: "";
                    display: table;
                    clear: both;
                }

            #events #clear {
                float: right;
            }

            #events .caption {
                float: left;
                font-weight: bold;
                font-size: 115%;
                line-height: 115%;
                padding-top: 7px;
            }

            #events ul {
                list-style: none;
                max-height: 100px;
                overflow: auto;
                margin: 0;
            }

                #events ul li {
                    padding: 7px 0;
                    border-bottom: 1px solid #dddddd;
                }

                    #events ul li:last-child {
                        border-bottom: none;
                    }

        a:link, a:visited, a:hover, a:active {
            color: #000000;
            text-decoration: none;
        }

        .card-cal {
            box-shadow: 0px 10px 10px -6px black;
        }

        .panel-cal {
            border-radius: 35px;
        }

        .panel-title-cal {
            border-radius: 35px 35px 10px 10px;
        }

        .table td {
            margin: 3px 0px;
            padding: 3px 0px;
        }

        .tab-cal {
            width: 50vh;
            text-align: center;
            display: block;
        }

        .title_cinput {
            font-weight: bold;
        }

        .use_imput {
            border-color: lightgreen !important;
            border-width: 3px !important;
        }

        @media (max-width: 800px) {
            .acordion-cal {
                margin: 0px !important;
                padding: 0px !important;
            }

            .tabla-cal {
                font-size: 0.7rem;
            }

            .tab-cal {
                width: 20vh;
                text-align: center;
                display: block;
            }

            .nav {
                flex-wrap: inherit;
            }
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
    <div class="container" id="logincertificadocalidad">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h4 class="card-title text-uppercase">Ingrese su Usuario</h4>
                        <br />
                        <div class="row" id="head_guias">
                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-4" id="">
                                <label for="txtFeCont" class="col-form-label pb-0 white">Usuario:</label>
                                <input type="text" id="cUsuario" name="cUsuario" autocomplete="off" class="form-control" style="text-transform: uppercase;" value="" onkeyup="javascript:this.value=this.value.toUpperCase();" />
                            </div>
                            <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
                                <label for="btnRec">&nbsp;</label>
                                <div id="divlogin">
                                    <button type="button" id="btnIn" class="btn btn-secondary col-12 Login">
                                        <i class="fa fa-arrow-right"></i>Ingresar
                                    </button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade  modal-child" id="ModNewCertificado" data-backdrop-limit="1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-modal-parent="#ModOrden">
        <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">NUEVA EVALUACIÓN</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group p-0 m-0">

                        <div class="container card" style="width: 100%">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item"><a class="nav-link active " id="inf-tab" data-toggle="tab" href="#inf" role="tab" aria-controls="inf" aria-selected="true">INFORMACION</a></li>
                                <li class="nav-item"><a class="nav-link" id="det-tab" data-toggle="tab" href="#det" role="tab" aria-controls="det" aria-selected="false">DETALLES</a></li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="inf" role="tabpanel" aria-labelledby="inf-tab" style="min-height: 70vh">
                                    <div class="form-group pb-0 m-0">
                                        <label for="message-text" class="col-form-label">SERIE:</label>
                                        <input id="serie" class="form-control" disabled="" />
                                    </div>
                                    <div class="form-group pb-0 m-0">
                                        <label for="message-text" class="col-form-label">FECHA:</label>
                                        <input id="fecha" class="form-control" disabled="" />
                                    </div>
                                    <div class="form-group pb-0 m-0">
                                        <label for="message-text" class="col-form-label">PERIODO:</label>
                                        <input id="periodo" class="form-control" disabled="" />
                                    </div>
                                    <div class="form-group mb-2">
                                        <label for="message-text" class="col-form-label pb-0">TIPO MUESTRA:</label>
                                        <div id="idtipomuestra"></div>
                                    </div>
                                    <div class="form-group mb-2">
                                        <label for="txtFeCont" class="col-form-label pb-0">VARIABLE:</label>
                                        <div id="idvariable" class="idvariable"></div>
                                    </div>
                                    <div class="form-group mb-2">
                                        <label for="message-text" class="col-form-label pb-0">SUCURSAL:</label>
                                        <div id="idsucursal"></div>
                                    </div>
                                    <div class="form-group mb-2">
                                        <label for="txtFeCont" class="col-form-label pb-0">ALMACEN:</label>
                                        <div id="idalmacen"></div>
                                    </div>
                                    <hr />
                                    <div class="form-group mb-2">
                                        <label for="message-text" class="col-form-label pb-0">PROVEEDOR:</label>
                                        <div id="idclieprov"></div>
                                    </div>
                                    <div class="form-group mb-2">
                                        <label for="txtFeCont" class="col-form-label pb-0">RESPONSABLE:</label>
                                        <div id="idresponsable"></div>
                                    </div>
                                    <div class="form-group mb-2">
                                        <label for="message-text" class="col-form-label pb-0">UNIDAD NEGOCIO:</label>
                                        <div id="idunidadnegocio"></div>
                                    </div>
                                    <div class="form-group mb-2">
                                        <label for="txtFeCont" class="col-form-label pb-0">TURNO:</label>
                                        <div id="idturnotrabajo"></div>
                                    </div>
                                    <div class="form-group mb-2">
                                        <label for="txtFeCont" class="col-form-label pb-0">EVALUADOR:</label>
                                        <input id="evaluador" class="form-control" disabled="" />
                                    </div>
                                    <div class="form-group mb-2">
                                        <label for="message-text" class="col-form-label pb-0">OBSERVACIONES:</label>
                                        <input type="text" id="cdescripcion" class="form-control" autocomplete="off" />
                                    </div>
                                    <div class="form-group mb-2">
                                        <label for="txtFeCont" class="col-form-label pb-0">LINEA:</label>
                                        <div id="idlinea"></div>
                                    </div>

                                </div>
                                <div class="tab-pane fade" id="det" role="tabpanel" aria-labelledby="det-tab" style="min-height: 70vh">

                                    <div class="form-group" style="text-align: center; display: none;">
                                        <label for="btnRec">&nbsp;</label>
                                        <button type="button" id="NewMuestra" class="btn btn-secondary col-12">
                                            <i class="fa fa-plus"></i>Nueva Muestra
                                        </button>
                                    </div>
                                    <div class="form-group">
                                        <table style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <td class="p-0 m-0">
                                                        <label class="col-form-label pb-0">CULTIVO MUESTRA:</label></td>
                                                    <td class="p-0 m-0">
                                                        <label class="col-form-label pb-0">&nbsp;</label></td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td style="width: 80%" class="p-0 m-0">
                                                        <div class="input-group mb-1">
                                                            <div id="idproducto" class="form-control"></div>

                                                        </div>
                                                    </td>
                                                    <td style="width: 20%" class="p-0 m-0">
                                                        <div class="input-group mb-1">
                                                            <button type="button" id="AddMuestra" class="btn btn-secondary col-12">
                                                                <i class="fa fa-plus"></i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div id="output"></div>
                                    <div class="form-group mb-2">
                                        <div id="divMuestra"></div>
                                    </div>


                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" id="pkid" value="" />
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            <button type="button" id="addCertificadox" class="btn btn-primary">Agregar</button>
                            <button type="button" id="EditProductos" class="btn btn-primary" style="display: none">Actualizar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade  modal-child" id="ModMuestraNew" data-backdrop-limit="1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-modal-parent="#ModOrden">
        <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">NUEVA MUESTRA</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="mb-3" style="padding: 0px 6px;">
                        <table style="width: 100%">
                            <tr>
                                <td class="p-0 m-0">
                                    <label class="col-form-label pb-0">CULTIVO MUESTRA:</label></td>
                                <td class="p-0 m-0">
                                    <label class="col-form-label pb-0">&nbsp;</label></td>
                            </tr>
                            <tr>
                                <td style="width: 100%" colspan="2" class="p-0 m-0">
                                    <div class="input-group mb-1">
                                        <div id="idproducto2" class="form-control"></div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="newCantidad" val="0" />
                    <input type="hidden" id="newCantidadMuestra" val="0" />
                    <input type="hidden" id="idcertificadomuestra" value="" />
                    <div class="btnaddmstra"><button type="button" id="CancelMuestraPlus" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" id="RegistrarMuestra" class="btn btn-primary">Agregar</button></div>
                    
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade  modal-child" id="SyncParam" data-backdrop-limit="1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-modal-parent="#ModOrden">
        <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">SYNCRONIZAR PARAMETROS</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="mb-3" style="padding: 0px 6px;">
                        <table style="width: 100%" class="table table-bordered">
                            <tr>
                                <td style="width: 50%" class=""><label class="col-form-label pb-0">SUPERVISOR:</label></td>
                                <td style="width: 50%" class=" sync0001_002"><button class="btn btn-icon SyncParame" idbusc="924" itembusc="005" idsel="0001_002"><i class="fas fa-sync"></i></button></td>
                            </tr>         
                            <tr>          
                                <td style="width: 50%" class=""><label class="col-form-label pb-0">EVALUADOR:</label></td>
                                <td style="width: 50%" class=" sync0001_003"><button class="btn btn-icon SyncParame" idbusc="924" itembusc="006" idsel="0001_003"><i class="fas fa-sync"></i></button></td>
                            </tr>                
                            <tr>                 
                                <td style="width: 50%" class=""><label class="col-form-label pb-0">FUNDO:</label></td>
                                <td style="width: 50%" class=" sync0001_004"><button class="btn btn-icon SyncParame" idbusc="924" itembusc="007" idsel="0001_004"><i class="fas fa-sync"></i></button></td>
                            </tr>                 
                            <tr>                  
                                <td style="width: 50%" class=""><label class="col-form-label pb-0">LOTE:</label></td>
                                <td style="width: 50%" class=" sync0001_005"><button class="btn btn-icon SyncParame" idbusc="924" itembusc="008" idsel="0001_005"><i class="fas fa-sync"></i></button></td>
                            </tr>                
                            <tr>                 
                                <td style="width: 50%" class=""><label class="col-form-label pb-0">VARIEDAD:</label></td>
                                <td style="width: 50%" class=" sync0001_006"><button class="btn btn-icon SyncParame" idbusc="004" itembusc="003" idsel="0001_006"><i class="fas fa-sync"></i></button></td>
                            </tr>                 
                            <tr>                  
                                <td style="width: 50%" class=""><label class="col-form-label pb-0">ENVASE COSECHA:</label></td>
                                <td style="width: 50%" class=" sync0001_011"><button class="btn btn-icon SyncParame" idbusc="026" itembusc="001" idsel="0001_011"><i class="fas fa-sync"></i></button></td>
                            </tr>                 
                            <tr>                  
                                <td style="width: 50%" class=""><label class="col-form-label pb-0">CALIBRE A COSECHAR:</label></td>
                                <td style="width: 50%" class=" sync0002_010"><button class="btn btn-icon SyncParame" idbusc="012" itembusc="003" idsel="0002_010"><i class="fas fa-sync"></i></button></td>
                            </tr>                
                            <tr>                 
                                <td style="width: 50%" class=""><label class="col-form-label pb-0">COLOR A COSECHAR:</label></td>
                                <td style="width: 50%" class=" sync0002_001"><button class="btn btn-icon SyncParame" idbusc="924" itembusc="009" idsel="0002_001"><i class="fas fa-sync"></i></button></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="#" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="container" id="cardcertificadocalidad" style="display: none">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h4 class="card-title text-uppercase">Certificado Calidad &nbsp;&nbsp;&nbsp;<button class="btn btn-icon" id="sync_parametros"><i class="fas fa-sync"></i></button></h4>
                        
                        <br />
                        <div class="row" id="head_cal">
                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" id="DivFechaCert">
                                <label for="txtFeCont" class="col-form-label pb-0 white">Fecha:</label>
                                <input type="text" id="cFechaCert" name="cFechaCert" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy" />
                                <script type="text/javascript">
                                    $(function () {
                                        $('#cFechaCert').datetimepicker({
                                            format: 'DD/MM/YYYY',
                                            locale: 'es'
                                        });
                                        $(function () {
                                            $('#DivFechaCert').datetimepicker({
                                                format: 'DD/MM/YYYY',
                                                locale: 'es'
                                            });
                                        });
                                    });
                                </script>
                            </div>
                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                                <label for="txtFeCont" class="col-form-label pb-0">Certificado:</label>
                                <select class="form-control" id="Certificado" name="Certificado">
                                    <option value="00" selected="selected">seleccione</option>
                                    <option value="01">AGRC</option>
                                    <option value="02">AGRP</option>
                                </select>
                            </div>
                            <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
                                <label for="btnRec">&nbsp;</label>
                                <button type="button" id="SearchCert" class="btn btn-secondary col-12">
                                    <i class="fa fa-search"></i>Buscar
                                </button>
                            </div>
                            <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
                                <label for="btnRec">&nbsp;</label>
                                <button type="button" id="NewCert" class="btn btn-secondary col-12">
                                    <i class="fa fa-plus"></i>Nuevo
                                </button>
                            </div>
                            <div class="form-group col-6 col-sm-6 col-md-5 col-lg-2">
                                <label for="btnRec">&nbsp;</label>
                                <button type="button" id="NewUser" class="btn btn-danger col-12 NewUser">
                                    <i class="fa fa-plus"></i>Cambiar_Usuario
                                </button>
                            </div>
                            <div class="form-group col-6 col-sm-6 col-md-5 col-lg-4">
                                <label for="btnRec">&nbsp;</label>
                                <span id="nom_usuario"></span>
                                <br />
                                <span id="variabledesc"></span>
                            </div>
                        </div>
                    </div>
                    <div class="card-body" style="" id="body_guia">

                        <div class="row" id="Tablas_cal">
                            <div class="col-md-12 acordion-cal">
                                <div class="form-group mb-2" style="min-height: 10vh; overflow: auto;">
                                    <div id="LoadDatos"></div>
                                    <div id="accordion" class="col-md-12 acordion-cal">
                                        &nbsp;
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" id="Plantilla_cal" style="display: none">
                            <div class="col-md-12 acordion-cal">
                                <div class="form-group mb-2" style="min-height: 10vh; overflow: auto;">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="card">
                                                    <div class="card-header text-black">
                                                        <h4 class="card-title text-uppercase">Datos Generales</h4>
                                                        <br />
                                                        <div class="row form-group" id="head_guia">
                                                            <div class="form-group mb-2 col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                <label for="txtFeCont" class="col-form-label pb-0">Fecha</label>
                                                                <input type="text" id="0001_001" name="0001_001" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy" />
                                                                <script type="text/javascript">
                                                                    $(function () {
                                                                        $('#cFechaGuia').datetimepicker({
                                                                            format: 'DD/MM/YYYY',
                                                                            locale: 'es'
                                                                        });
                                                                        $(function () {
                                                                            $('#DivFechaGuia').datetimepicker({
                                                                                format: 'DD/MM/YYYY',
                                                                                locale: 'es'
                                                                            });
                                                                        });
                                                                    });
                                                                </script>
                                                            </div>
                                                            <div class="dropdown mb-2 col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <label for="">Supervisor</label>
                                                                <div id="0001_002" class="0001_002">
                                                                </div>
                                                            </div>
                                                            <div class="dropdown mb-2 col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <label for="txtFeCont">Evaluador</label>
                                                                <div id="0001_003">
                                                                </div>
                                                            </div>
                                                            <div class="dropdown mb-2 col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <label for="txtFeCont">Fundo</label>
                                                                <div id="0001_004">
                                                                </div>
                                                            </div>
                                                            <div class="dropdown mb-2 col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <label for="txtFeCont">Lote</label>
                                                                <div id="0001_005">
                                                                </div>
                                                            </div>
                                                            <div class="dropdown mb-2 col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <label for="txtFeCont">Variedad</label>
                                                                <div id="0001_006">
                                                                </div>
                                                            </div>
                                                            <div class="dropdown mb-2 col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <label for="txtFeCont" class="col-form-label pb-0">Seleccione un dato</label>
                                                                <button class="form-control btn btn-info dropdown-toggle dropdown-toggle-split" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                                                    Cosechador x QR
                                                                </button>
                                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                                                </ul>
                                                            </div>
                                                            <div class="form-group col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <label for="inputdefault">Cosechar x DNI</label>
                                                                <input class="form-control" maxlength="8" id="0001_008" type="text" oninput="buscarNombrePorDni()" />
                                                            </div>
                                                            <div class="form-group col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <label for="inputdefault">Nom. Cosechador</label>
                                                                <input class="form-control" id="0001_009" type="text" />
                                                            </div>
                                                            <div class="form-group col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <label for="inputdefault">Tarea del día</label>
                                                                <input class="form-control" id="0001_010" type="text" />
                                                            </div>
                                                            <div class="dropdown mb-2 col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <label for="txtFeCont">Envase de Cosecha</label>
                                                                <div id="0001_011">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="card-header text-black">
                                                        <h4 class="card-title text-uppercase">Evaluación Calibres</h4>
                                                        <br />
                                                        <div class="row form-group" id="head_detalle">
                                                            <div class="dropdown mb-2 col-lg-6 col-md-4 col-sm-6 col-xs-12">
                                                                <label for="txtFeCont">Color a cosechar</label>
                                                                <div id="0002_001">
                                                                </div>
                                                            </div>
                                                            <div class="dropdown mb-2 col-lg-6 col-md-4 col-sm-6 col-xs-12">
                                                                <label for="txtFeCont">Calibre a Cosechar</label>
                                                                <div id="0002_010">
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 .table-responsive">
                                                                <table class="table w-auto">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td scope="row" style="width: 60%">
                                                                                <label class="title_cinput tt0002_002">Nro. de frutos </label>
                                                                            </td>
                                                                            <td scope="row" style="width: 20%">
                                                                                <label class=""></label>
                                                                            </td>
                                                                            <td scope="row" style="width: 20%">
                                                                                <input class="form-control" id="0002_002" type="number" min="0" value="0" />
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 .table-responsive">
                                                                <table class="table w-auto">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td scope="row" style="width: 60%">
                                                                                <label class="title_cinput tt0002_003">Fuera de color </label>
                                                                            </td>
                                                                            <td scope="row" style="width: 20%">
                                                                                <label class="0002_003">0.0%</label>
                                                                            </td>
                                                                            <td scope="row" style="width: 20%">
                                                                                <input class="form-control onblurv" id="0002_003" type="number" min="0" value="0" />
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 .table-responsive">
                                                                <table class="table w-auto">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td style="width: 60%">
                                                                                <label class="title_cinput tt0002_004">Pedúnculo Largo </label>
                                                                            </td>
                                                                            <td style="width: 20%">
                                                                                <label class="0002_004">0.0%</label>
                                                                            </td>
                                                                            <td style="width: 20%">
                                                                                <input class="form-control onblurv" id="0002_004" type="number" min="0" value="0" />
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 .table-responsive">
                                                                <table class="table w-auto">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td style="width: 60%">
                                                                                <label class="title_cinput tt0002_005">Sin Pedúnculo </label>
                                                                            </td>
                                                                            <td style="width: 20%">
                                                                                <label class="0002_005">0.0%</label>
                                                                            </td>
                                                                            <td scope="row" style="width: 20%">
                                                                                <input class="form-control onblurv" id="0002_005" type="number" min="0" value="0" />
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 .table-responsive">
                                                                <table class="table w-auto">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td style="width: 60%">
                                                                                <label class="title_cinput tt0002_006">Daño Tijera </label>
                                                                            </td>
                                                                            <td style="width: 20%">
                                                                                <label class="0002_006">0.0%</label>
                                                                            </td>
                                                                            <td style="width: 20%">
                                                                                <input class="form-control onblurv" id="0002_006" type="number" min="0" value="0" />
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 .table-responsive">
                                                                <table class="table w-auto">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td style="width: 60%">
                                                                                <label class="title_cinput tt0002_007">Chanchito </label>
                                                                            </td>
                                                                            <td style="width: 20%">
                                                                                <label class="0002_007">0.0%</label>
                                                                            </td>
                                                                            <td style="width: 20%">
                                                                                <input class="form-control onblurv" id="0002_007" type="number" min="0" value="0" />
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 .table-responsive">
                                                                <table class="table w-auto">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td style="width: 60%">
                                                                                <label class="title_cinput tt0002_008">Queresas </label>
                                                                            </td>
                                                                            <td style="width: 20%">
                                                                                <label class="0002_008">0.0%</label>
                                                                            </td>
                                                                            <td style="width: 20%">
                                                                                <input class="form-control onblurv" id="0002_008" type="number" min="0" value="0" />
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 .table-responsive">
                                                                <table class="table w-auto">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td style="width: 60%">
                                                                                <label class="title_cinput tt0002_011">Fuera de Calibre </label>
                                                                            </td>
                                                                            <td style="width: 20%">
                                                                                <label class="0002_011">0.0%</label>
                                                                            </td>
                                                                            <td style="width: 20%">
                                                                                <input class="form-control onblurv" id="0002_011" type="number" min="0" value="0" />
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 .table-responsive">
                                                                <table class="table w-auto">
        
                                                                </table>
                                                            </div>
                                                            <hr />
                                                            <div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 .table-responsive">
                                                                <table class="table w-auto">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td style="width: 70%">
                                                                                <label class="title_cinput">Frutos de muestreo </label>
                                                                            </td>
                                                                            <td style="width: 30%">
                                                                                <input class="form-control" id="totalms" disabled="disabled" type="text" value="0" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 70%">
                                                                                <label class="title_cinput">% Muestreo </label>
                                                                            </td>
                                                                            <td style="width: 30%">
                                                                                <input class="form-control" id="totalpms" disabled="disabled" type="text" value="0" />
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 .table-responsive">
                                                                <table class="table w-auto">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td style="width: 60%">
                                                                                <label class="title_cinput tt0002_009">% de Avance </label>
                                                                            </td>
                                                                            <td style="width: 20%">
                                                                                <label class=""></label>
                                                                            </td>
                                                                            <td style="width: 20%">
                                                                                <input class="form-control onblurvv" id="0002_009" type="number" min="0" value="0" />
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <div class="card-header text-black">
                                                        <h4 class="card-title text-uppercase">Observaciones</h4>
                                                        <br />
                                                        <div class="row form-group" id="head_transporte">
                                                            <div class="form-group col-lg-6 col-md-4 col-sm-6 col-xs-12">
                                                                <label for="inputdefault">Observación 1</label>
                                                                <input class="form-control" id="0003_001" type="text" />
                                                            </div>
                                                            <div class="form-group col-lg-6 col-md-4 col-sm-6 col-xs-12">
                                                                <label for="inputdefault">Observación 2</label>
                                                                <input class="form-control" id="0003_002" type="text" />
                                                            </div>
                                                            <div class="form-group col-lg-6 col-md-4 col-sm-6 col-xs-12">
                                                                <label for="inputdefault">Observación 3</label>
                                                                <input class="form-control" id="0003_003" type="text" />
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <div class="modal-content">
                                                        <div class="modal-body">
                                                            <div class="modal-footer">
                                                                <input id="u_itemupdate" name="u_itemupdate" type="hidden" />
                                                                <input id="u_idcertifcado" name="u_idcertifcado" type="hidden" />
                                                                <div class="btn-dd"><a class="btn btn-danger" id="cancelEdit">Cancelar</a>
                                                                <button type="button" id="EditCertificado" class="btn btn-success" data-dismiss="modal">Agregar</button></div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-footer" id="footer_guia">
                        <div class="col-md-12">
                            &nbsp;
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <script>
        $(document).ready(function () {
            $('.onblurv').blur(function () {
                $(this).addClass('use_imput');
            });
        });

        function buscarNombrePorDni() {
            var dni = $('#0001_008').val();
            if (dni.length == 8) {
                var obj = new Object();
                obj.dni = dni;
                $.ajax({
                    type: 'POST',
                    url: "../SerCertCalidad.asmx/BuscarNombreporDni",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    //beforeSend: function () {
                    //    $('#divlogin').html('<div class="text-center bold"><img width="20px" src="../img/loading.gif" alt="loading" /><br/>Sincronizando Parametros...</div>');
                    //},
                    success: function (data) {
                        var lstc = JSON.parse(data.d);
                        if (lstc.length != 0) {
                            var nombre = lstc[0].NOMBRES;
                            $('#0001_009').val(nombre);

                        } else {
                            toastr.error('No se encontró el DNI', 'error');
                        }


                        //if (lstc.length != 0) {
                        //    setCookie("cUsuario", lstc[0].idusuario, 1);
                        //    setCookie("cNombre", lstc[0].nombre, 1);
                        //    $('#nom_usuario').text(lstc[0].nombre);
                        //    $('#evaluador').val(lstc[0].nombre);
                        //    carga_input_head();
                        //} else {
                        //    toastr.error('Verifique usuario ingresado', 'error');
                        //}
                    }, complete: function () {
                        setTimeout(function () {
                            //alert('alert despues de 3 segudnos');
                        }, 3000);

                    }, error: function (error) {
                        toastr.error('No se encontró el DNI');
                    }
                })
            }
        }

        $.event.special.inputchange = {
            setup: function () {
                var self = this, val;
                $.data(this, 'timer', window.setInterval(function () {
                    val = self.value;
                    if ($.data(self, 'cache') != val) {
                        $.data(self, 'cache', val);
                        $(self).trigger('inputchange');
                    }
                }, 20));
            },
            teardown: function () {
                window.clearInterval($.data(this, 'timer'));
            },
            add: function () {
                $.data(this, 'cache', this.value);
            }
        };

        $('#0002_002').on('inputchange', function () {
            var nf = $(this).val();

            if (nf == '' || nf == null || nf == NaN) {
                nf == 0;
            }
            pressArray = [];
            [].slice.call(document.querySelectorAll('.onblurv')).forEach(function (el) {
                pressArray.push({ cod: el.id })
            });
            var totalnvc = 0;
            for (var b = 0; b < pressArray.length; b++) {


                var nm = $('#' + pressArray[b].cod).val();

                var numv = parseInt(nm);
                if (numv <= -1) {
                    numv = 0;
                    $(this).val(0);
                }


                var procentaje = (numv * 100) / nf;

                if (isNaN(procentaje)) {
                    procentaje = 0;
                    $(this).val(0);
                }

                $('.' + pressArray[b].cod).text(parseFloat(procentaje).toFixed(2) + '%');
                totalnvc = totalnvc + numv;
            }

            var proctotal = (totalnvc * 100) / nf;
            if (isNaN(proctotal)) {
                $('#totalms').val(totalnvc);
                $('#totalpms').text(0 + '%');
                return;
            }
            $('#totalms').val(totalnvc);
            $('#totalpms').val(proctotal.toFixed(2) + '%');

        });

        $('.onblurv').on('inputchange', function () {
            var valv = $(this).val();
            var porc = $(this).attr('id');

            varArray = [];
            [].slice.call(document.querySelectorAll('.onblurv')).forEach(function (el) {
                varArray.push({ cod: el.id })
            });
            var totalnv = 0;
            for (var c = 0; c < varArray.length; c++) {


                var nmc = $('#' + varArray[c].cod).val();

                var numvv = parseInt(nmc);

                if (numvv <= -1) {
                    numvv = 0;
                }
                totalnv = totalnv + numvv;

            }


            var num_muestra = document.getElementById("0002_002").value;
            if (num_muestra == '' || num_muestra == null || num_muestra == NaN) {
                num_muestra == 0;
                toastr.error('Ingrese N° de frutos', 'Falta Muestra');
                return;
            }

            var numv = parseInt(valv);
            var num_muestra = parseInt(num_muestra);

            var proctotal = (totalnv * 100) / num_muestra;


            //if (numv == 0 && num_muestra == 0) {
            if (numv <= -1) {
                toastr.error('No se permiten Valores negativos', 'Valor Negativo');
                $(this).val(0);
                $('.' + porc).text(0 + '%');
                return;
            }

            if (numv >= num_muestra) {

                //toastr.error('El numero de fruto evaluado no puede ser mayor a la cantidad de frutos de muestra ', 'Falta Frutos de Muestra');
                $(this).val(0);
                $('.' + porc).text(0 + '%');
                return;
            }
            var procentaje = (numv * 100) / num_muestra;

            if (isNaN(procentaje)) {
                //toastr.error('El numero no Corresponde', 'Numero Invalido');
                $(this).val(0);
                $('.' + porc).text(0 + '%');
                return;
            }
            if (isNaN(proctotal)) {
                //toastr.error('El numero no Corresponde', 'Numero Invalido');
                proctotal = 0;
            }
            $('.' + porc).text(parseFloat(procentaje).toFixed(2) + '%');
            //}
            $('#totalms').val(totalnv);
            $('#totalpms').val(proctotal.toFixed(2) + '%');
        });




        var hoy = new Date();
        var fecha = ('0' + hoy.getDate()).slice(-2) + '/' + ('0' + (hoy.getMonth() + 1)).slice(-2) + '/' + hoy.getFullYear();
        var fechaparse = hoy.getFullYear() + '-' + ('0' + (hoy.getMonth() + 1)).slice(-2) + '-' + ('0' + hoy.getDate()).slice(-2);
        var periodo = hoy.getFullYear() + ('0' + (hoy.getMonth() + 1)).slice(-2);
        $('#cFechaCert').val(fecha);

        $('#0001_001').val(fecha);;
        $('#0001_001').attr('disabled', 'disabled');



        $(document).on('click', '#sync_parametros', function (e) {
            e.preventDefault();
            Load_Datos('924', '005', '0001_002', 'descripcion', 'descripcion', 1);
            Load_Datos('924', '006', '0001_003', 'descripcion', 'descripcion', 1);
            Load_Datos('924', '007', '0001_004', 'descripcion', 'descripcion', 1);
            Load_Datos('924', '004', '0001_005', 'descripcion', 'descripcion', 1);
            Load_Datos('924', '008', '0001_005', 'descripcion', 'descripcion', 1);
            Load_Datos('004', '003', '0001_006', 'descripcion', 'descripcion', 1);
            Load_Datos('026', '001', '0001_011', 'descripcion', 'descripcion', 1);
            Load_Datos('012', '003', '0001_010', 'descripcion', 'descripcion', 1);
            Load_Datos('924', '009', '0002_001', 'descripcion', 'descripcion', 1);

        });

        $(document).on('click', '.Login', function (e) {
            e.preventDefault();
            $("#accordion").html('')
            var obju = new Object();
            obju.vidempresa = '001'
            obju.vidusuario = $('#cUsuario').val();
            Login_user(obju)

        });

        //recoger los parametros desde GET
        var QueryString = function () {
            var query_string = {};
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split("=");
                if (typeof query_string[pair[0]] === "undefined") {
                    query_string[pair[0]] = decodeURIComponent(pair[1]);
                } else if (typeof query_string[pair[0]] === "string") {
                    var arr = [query_string[pair[0]], decodeURIComponent(pair[1])];
                    query_string[pair[0]] = arr;
                } else {
                    query_string[pair[0]].push(decodeURIComponent(pair[1]));
                }
            }
            return query_string;
        }();
        //console.log(QueryString.inicio);
        if (QueryString.inicio === 'listo') {
            Swal.fire({
                icon: 'success',
                title: 'Esta todo listo',
                text: 'Ya puede registrar certificado de calidad!',
            })
        }

        if (getCookie("eeinicio").length >= 1) {
            var URLactual = jQuery(location).attr('href');
            console.log(URLactual);
            var urlDividido = URLactual.split('/');
            console.log(urlDividido);
            var obj = new Object();
            obj.vidusuario = getCookie('cUsuario');
            obj.vidempresa = '001';;
            $.ajax({
                type: 'POST',
                url: "../SerCertCalidad.asmx/List_usuario",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    console.log(lst);
                    if (lst.length >= 1) {
                        variableGlobal = lst[0].idvariable;
                        switch (variableGlobal) {
                            case 'AGU2':
                                if ((urlDividido[4] == "Wfo_CertificadoCalidadPoda?inicio=listo") || (urlDividido[4] == "Wfo_CertificadoCalidadPoda")) {
                                    console.log('No mas bucles xfa');
                                }
                                else {
                                    location.href = "Wfo_CertificadoCalidadPoda.aspx";
                                }
                                break;
                            case 'AGU1':
                                if ((urlDividido[4] == "Wfo_CertificadoCalidadAmarre?inicio=listo") || (urlDividido[4] == "Wfo_CertificadoCalidadAmarre")) {
                                    console.log('No mas bucles xfa');
                                }
                                else {
                                    location.href = "Wfo_CertificadoCalidadAmarre.aspx";
                                }
                                break;
                            default:
                                if ((urlDividido[4] == "Wfo_CertificadoCalidad?inicio=listo") || (urlDividido[4] == "Wfo_CertificadoCalidad")) {
                                    console.log('No mas bucles xfa');
                                }
                                else {
                                    location.href = "Wfo_CertificadoCalidad.aspx";
                                }
                        }
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        function Login_user(obju) {
            if (obju.vidusuario != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerCertCalidad.asmx/List_usuario",
                    data: JSON.stringify({ obj: obju }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    beforeSend: function () {
                        $('#divlogin').html('<div class="text-center bold"><img width="20px" src="../img/loading.gif" alt="loading" /><br/>Sincronizando Parametros...</div>');
                    },
                    success: function (data) {
                        var lstc = JSON.parse(data.d);
                        if (lstc.length != 0) {
                            setCookie('eeinicio', '1', 1);
                            Swal.showLoading()
                            const b = Swal.getHtmlContainer().querySelector('b')
                            let timerInterval
                            Swal.fire({
                                title: 'Danos un momento',
                                showConfirmButton: false,
                                html: 'Te estamos redirigiendo a la evaluación.',
                                timer: 3000,
                                timerProgressBar: true,
                                allowOutsideClick: false,

                            }).then((result) => {
                                /* Read more about handling dismissals below */
                                //if (result.dismiss === Swal.DismissReason.timer) {
                                //}
                                setCookie("cUsuario", lstc[0].idusuario, 1);
                                setCookie("cNombre", lstc[0].nombre, 1);
                                $('#nom_usuario').text(lstc[0].nombre);
                                $('#evaluador').val(lstc[0].nombre);
                                last_login();
                                carga_input_head();
                                Load_ParametrosUser(getCookie("cUsuario"));
                                variableGlobal = lstc[0].idvariable;
                                alert(variableGlobal);
                                switch (variableGlobal) {
                                    case 'AGU2':
                                        location.href = "Wfo_CertificadoCalidadPoda.aspx?inicio=listo";
                                        break;
                                    case 'AGU1':
                                        location.href = "Wfo_CertificadoCalidadAmarre.aspx?inicio=listo";
                                        break;
                                    default:
                                        location.href = "Wfo_CertificadoCalidad.aspx?inicio=listo";
                                }
                            })

                        } else {
                            toastr.error('Verifique usuario ingresado', 'error');
                            $('#divlogin').html('<button type="button" id="btnIn" class="btn btn-secondary col-12 Login"><i class="fa fa-arrow-right"></i>Ingresar</button>');
                        }



                        //}, complete: function () {
                        //    setTimeout(function () {


                        //    }, 3000);

                    }, error: function (error) {
                        toastr.error(JSON.stringify(error), 'error');
                        $('#divlogin').html('<button type="button" id="btnIn" class="btn btn-secondary col-12 Login"><i class="fa fa-arrow-right"></i>Ingresar</button>');
                    }
                })
            } else {
                toastr.error('Ingrese Uusario', 'error');
                $('#divlogin').html('<button type="button" id="btnIn" class="btn btn-secondary col-12 Login"><i class="fa fa-arrow-right"></i>Ingresar</button>');
            }
        }

        function last_login() {
            Load_ParametrosUser(getCookie("cUsuario"));
            Load_Variable(getCookie("cUsuario"));
            $('#divlogin').html('<button type="button" id="btnIn" class="btn btn-secondary col-12 Login"><i class="fa fa-arrow-right"></i>Ingresar</button>');


        }

        //CARGAR FORMATOS
        var formato_to = [];
        function Load_Formatos() {

            //alert('1026');

            if (localStorage.getItem("objFormatos") === null) {
                var obj = new Object();
                obj.vidempresa = '001';
                obj.vidvariable = '';
                $.ajax({
                    type: 'POST',
                    url: "../SerCertCalidad.asmx/List_dvariablescalidad",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        localStorage.setItem('objFormatos', JSON.stringify(lst));
                        var objFormatos = localStorage.getItem('objFormatos');
                        formato_to = JSON.parse(objFormatos);
                    }
                })

            } else {
                var objFormatos = localStorage.getItem('objFormatos');
                formato_to = JSON.parse(objFormatos);
            }
        }
        Load_Formatos();

        //CARGA FORMATO DETALLE ACTUAliZAR
        var FormatoDetalle = [];
        function EditEvaluacion(empresa, variable, certificado, itemd, accion) {

            Load_Head(certificado);
            Load_Muestras_upd(certificado);

            //alert('1057');

            $('#u_itemupdate').val(itemd);
            $('#u_idcertifcado').val(certificado);

            var obj = new Object();
            obj.vcEmpresa = '001';
            obj.vidvariable = variable;
            obj.vidCertificado = certificado;

            $.ajax({
                type: 'POST',
                url: "../SerCal.asmx/DataObtenerData_List",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    FormatoDetalle = lst;
                    if (accion == 1) {
                        $('.EditCertificado').html('<i class="fa fa-arrow-right"></i>');
                        $('#head_cal').hide();
                        $('#Tablas_cal').hide();
                        $('#Plantilla_cal').show();

                        console.log(JSON.stringify(lst))

                        for (var i = 0; i < lst.length; i++) {
                            //console.log(lst[i].ITEMD + ' ' + itemd + ' ' + lst[i].TIPODATO + ' ' + lst[i].ES_BUSCADOR);
                            if (lst[i].ITEMD.trim() == itemd.trim()) {
                                if (lst[i].TIPODATO == 'N') {
                                    if (lst[i].ITEMREF != '') {
                                        $('#' + lst[i].ESTRUCTURA.trim()).val(lst[i].RESULTADO);
                                        $('.' + lst[i].ESTRUCTURA.trim()).text(parseFloat(lst[i].PORCENTAJEMUESTRA) + '%');
                                    } else {
                                        $('#' + lst[i].ESTRUCTURA.trim()).val(lst[i].RESULTADO);

                                    }
                                    $('.tt' + lst[i].ESTRUCTURA.trim()).text(lst[i].ETIQUETA.trim());
                                } else {
                                    //console.log(lst[i].ESTRUCTURA + ' ' + lst[i].ESTRUCTURA.length);
                                    if (lst[i].ES_BUSCADOR == 1) {
                                        $('#' + lst[i].ESTRUCTURA.trim()).dxSelectBox("reset");

                                        $('#' + lst[i].ESTRUCTURA.trim()).dxSelectBox("instance").option('value', lst[i].RESULTADO_OI);
                                    } else {

                                        if (lst[i].ESTRUCTURA.trim() == '0001_008') {
                                            $('#' + lst[i].ESTRUCTURA.trim()).val((lst[i].RESULTADO_OI || "").trim());
                                        } else {
                                            $('#' + lst[i].ESTRUCTURA.trim()).val(lst[i].RESULTADO_OI);
                                        }
                                        //if (lst[i].ESTRUCTURA.trim() == '0001_001') {
                                        //    if (lst[i].RESULTADO_OI === '') {
                                        //        $('#0001_001').val(fecha);
                                        //    } else {
                                        //        var ref = lst[i].RESULTADO_OI.split(' ');
                                        //        var fecch = ref[0];
                                        //        $('#0001_001').val(fecch);
                                        //    }
                                        //}
                                    }
                                }
                            }
                        }
                    }


                }
            });

        }

        //CARGA HEAD
        var heads = new Object();
        function Load_Head(id) {
            var dett = new Object();
            dett.vidempresa = '001';
            dett.vidcertificado = id;

            if (dett.vidempresa != '' && dett.vidcertificado != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerCertCalidad.asmx/ListCertificadosxid",
                    data: JSON.stringify({ obj: dett }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        console.log('1323');
                        console.log(data);
                        heads.vidempresa = lst[0].idempresa;
                        heads.vidcertificado = lst[0].idcertificado;
                        heads.videmisor = lst[0].idemisor;
                        heads.vidperiodo = lst[0].periodo;
                        heads.videstadoc = lst[0].idestadoc;
                        heads.vorigen_certificado = lst[0].origen_certificado;
                        heads.vidsucursal = lst[0].idsucursal;
                        heads.vidalmacen = lst[0].idalmacen;
                        heads.viddocumento = lst[0].iddocumento;
                        heads.vserie = lst[0].serie;
                        heads.vnumero = lst[0].numero;
                        heads.videstado = lst[0].idestado;

                        var dtc = DateConvert(lst[0].fecha);
                        var datehour = dtc.split(" ", 2);
                        var dat = datehour[0].split("/", 3);
                        heads.vcFecha = dat[2] + '-' + dat[1] + '-' + dat[0] + 'T' + datehour[1];
                        heads.vtcambio = lst[0].tcambio;
                        heads.vidclieprov = lst[0].idclieprov;
                        heads.vidresponsable = lst[0].idresponsable;
                        heads.vidturnotrabajo = lst[0].idturnotrabajo;
                        heads.vglosa = lst[0].glosa;
                        heads.vnromanual = lst[0].nromanual;
                        heads.vventana = lst[0].ventana;
                        heads.vidreferencia = lst[0].idreferencia;
                        heads.vevaluador = lst[0].evaluador;
                        heads.vtipomuestra = lst[0].tipomuestra;
                        heads.vdescripcion = lst[0].descripcion;
                        heads.vidvariable = lst[0].idvariable;
                        heads.vidlinea = lst[0].idlinea;
                        heads.vidunidadnegocio = lst[0].idunidadnegocio;
                        heads.vdescproveedor = lst[0].descproveedor;
                        heads.vdescresponsable = lst[0].descresponsable;
                        heads.vdescunidadnegocio = lst[0].descunidadnegocio;
                        heads.vdescturnotrabajo = lst[0].descturnotrabajo;
                        heads.vdescsucursal = lst[0].descsucursal;
                        heads.vdesctipomuestra = lst[0].desctipomuestra;
                        heads.vdescvariable = lst[0].descvariable;
                        heads.vdesclinea = lst[0].desclinea;
                        heads.vdescalmacen = lst[0].descalmacen;

                        heads.vimei = '000000000000000';
                        heads.vidusuario = getCookie("cUsuario");

                        //localStorage.setItem('objProductos', JSON.stringify(Productos));
                        // consola(heads);
                    }
                });
            }
        };

        //CARGA MUESTRAS
        var Productos_upd = [];

        function Load_Muestras_upd(id) {
            var dett = new Object();
            dett.vidempresa = '001';
            dett.vidcertificado = id;

            if (dett.vidempresa != '' && dett.vidcertificado != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerCertCalidad.asmx/ListDetalleCertificados",
                    data: JSON.stringify({ obj: dett }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        var dataprod = new Array();
                        for (var i = 0; i < lst.length; i++) {
                            var rowp = {};
                            rowp["vcitem"] = lst[i].item;
                            rowp["vcidproducto"] = lst[i].idproducto;
                            rowp["vcdesproducto"] = lst[i].descripcion;
                            rowp["vcidmedida"] = lst[i].idmedida;
                            rowp["vcantidad"] = lst[i].cantidad;
                            rowp["vcantidadmuetra"] = lst[i].cnt_muestra;
                            rowp["vidconsumidor"] = lst[i].idconsumidor;
                            rowp["vlote"] = lst[i].lote;
                            rowp["vstock"] = lst[i].stock;
                            rowp["vidreferencia"] = lst[i].idreferencia;
                            dataprod[i] = rowp;
                        }
                        Productos_upd = dataprod;
                        //localStorage.setItem('objProductos', JSON.stringify(Productos));
                        //consola(Productos);
                    }
                });
            }
        };

        //ABRIR MODAL DE MUESTRA
        $(document).on('click', '.AddMuestraPlus', function (e) {
            var idc = $(this).attr('idc');
            EditEvaluacion('001', getCookie('va_idvariable'), idc, '', 0)
            $('#idcertificadomuestra').val(idc);
            $('#ModMuestraNew').modal('show');
            Load_ProductosCalidad();

        })
        $(document).on('click', '#CancelMuestraPlus', function (e) {
            var idc = $(this).attr('idc');
            $('#ModMuestraNew').modal('hide');
        })
        //CANCCELAR MODAL DE MUESTRA


        //ADD MUESTRA A DETALLE
        $(document).on('click', '#RegistrarMuestra', function (e) {
            e.preventDefault();
            var idcert = $('#idcertificadomuestra').val();
            if ($("#idproducto2").dxSelectBox('instance').option('selectedItem') != null) {
                idproducto2 = $("#idproducto2").dxSelectBox('instance').option('selectedItem').idproducto;
                producto2 = $("#idproducto2").dxSelectBox('instance').option('selectedItem').descripcion;
                idmedida2 = $("#idproducto2").dxSelectBox('instance').option('selectedItem').idmedida;
            } else {
                idproducto2 = '';
                producto2 = '';
                idmedida2 = '';
            }

            if ($(newCantidad).val() != '') {
                var ncantidad = $('#newCantidad').val();
            } else {
                var ncantidad = 0;
            }

            if ($(newCantidad).val() != '') {
                var nnewCantidadMuestra = $('#newCantidadMuestra').val();
            } else {
                var nnewCantidadMuestra = 0;
            }

            if (idproducto2 == '') {
                toastr.error('', 'Seleccione Producto');
                return;
            }

            var vcitem;
            $("#det" + idcert).children().each(function (index) {
                vcitem = zfill(index + 2, 3);
            });
            Productos_upd.push({
                vcitem: vcitem,
                vcidproducto: idproducto2,
                vcdesproducto: producto2,
                vcidmedida: idmedida2,
                vcantidad: ncantidad,
                vcantidadmuetra: nnewCantidadMuestra,
                vidconsumidor: '',
                vlote: '',
                vstock: 0,
                vidreferencia: '',
            });
            Productos_up = Productos_upd;
            //console.log(JSON.stringify(heads));
            //console.log(JSON.stringify(Productos_upd));
            //console.log(JSON.stringify(FormatoDetalle));

            var newformato_up = [];
            var data_upd = new Array();

            for (var r = 0; r < FormatoDetalle.length; r++) {
                var row_upd = {};
                row_upd["vcidcertificado"] = FormatoDetalle[r].IDCERTIFICADO
                row_upd["vcitem"] = FormatoDetalle[r].ITEM.trim()
                row_upd["vcitemd"] = FormatoDetalle[r].ITEMD.trim()
                row_upd["vidvariable"] = FormatoDetalle[r].IDVARIABLE
                row_upd["vestructura"] = FormatoDetalle[r].ESTRUCTURA.replace("_", ".").trim();
                row_upd["vetiqueta"] = FormatoDetalle[r].ETIQUETA
                row_upd["vnivel"] = FormatoDetalle[r].NIVEL
                row_upd["vestitulo"] = FormatoDetalle[r].ES_TITULO.toString()
                row_upd["vginicio"] = FormatoDetalle[r].GINICIO
                row_upd["vgfin"] = FormatoDetalle[r].GFIN
                row_upd["voinicio"] = FormatoDetalle[r].OINICIO
                row_upd["vofin"] = FormatoDetalle[r].OFIN
                row_upd["vrinicio"] = FormatoDetalle[r].RINICIO
                row_upd["vrfin"] = FormatoDetalle[r].RFIN
                row_upd["vresultado"] = FormatoDetalle[r].RESULTADO;
                row_upd["vresultado_oi"] = FormatoDetalle[r].RESULTADO_OI;
                row_upd["ves_critica"] = FormatoDetalle[r].ES_CRITICA.toString()
                row_upd["vvalorporcentaje"] = FormatoDetalle[r].VALORPORCENTAJE
                row_upd["vporcentajemuestra"] = FormatoDetalle[r].PORCENTAJEMUESTRA
                row_upd["vtipodato"] = FormatoDetalle[r].TIPODATO
                row_upd["vitemref"] = FormatoDetalle[r].ITEMREF
                row_upd["vespecificacion "] = FormatoDetalle[r].ESPECIFICACION
                row_upd["vtiporango"] = FormatoDetalle[r].TIPORANGO
                row_upd["vdato_evaluar"] = FormatoDetalle[r].DATO_EVALUAR
                row_upd["vidtipo_input"] = FormatoDetalle[r].idtipo_input
                row_upd["vidbuscador"] = FormatoDetalle[r].ES_BUSCADOR.toString()
                row_upd["vcolor"] = FormatoDetalle[r].COLOR
                data_upd[r] = row_upd;
            }
            for (var t = 0; t < FormatoDetalle.length; t++) {
                var row_upd2 = {};
                if (FormatoDetalle[t].ITEMD.trim() == '001') {

                    row_upd2["vcidcertificado"] = FormatoDetalle[t].IDCERTIFICADO
                    row_upd2["vcitem"] = FormatoDetalle[t].ITEM.trim()
                    row_upd2["vcitemd"] = vcitem
                    row_upd2["vidvariable"] = FormatoDetalle[t].IDVARIABLE
                    row_upd2["vestructura"] = FormatoDetalle[t].ESTRUCTURA.replace("_", ".").trim();
                    row_upd2["vetiqueta"] = FormatoDetalle[t].ETIQUETA
                    row_upd2["vnivel"] = FormatoDetalle[t].NIVEL
                    row_upd2["vestitulo"] = FormatoDetalle[t].ES_TITULO.toString()
                    row_upd2["vginicio"] = FormatoDetalle[t].GINICIO
                    row_upd2["vgfin"] = FormatoDetalle[t].GFIN
                    row_upd2["voinicio"] = FormatoDetalle[t].OINICIO
                    row_upd2["vofin"] = FormatoDetalle[t].OFIN
                    row_upd2["vrinicio"] = FormatoDetalle[t].RINICIO
                    row_upd2["vrfin"] = FormatoDetalle[t].RFIN
                    row_upd2["vresultado"] = 0;
                    if (FormatoDetalle[t].ESTRUCTURA.trim() == '0003_001' || FormatoDetalle[t].ESTRUCTURA.trim() == '0003_002' || FormatoDetalle[t].ESTRUCTURA.trim() == '0003_003' || FormatoDetalle[t].ESTRUCTURA.trim() == '0002_001' || FormatoDetalle[t].ESTRUCTURA.trim() == '0002_010') {
                        row_upd2["vresultado_oi"] = '';
                    } else {
                        row_upd2["vresultado_oi"] = FormatoDetalle[t].RESULTADO_OI;
                    }
                    row_upd2["ves_critica"] = FormatoDetalle[t].ES_CRITICA.toString()
                    row_upd2["vvalorporcentaje"] = 0
                    row_upd2["vporcentajemuestra"] = 0
                    row_upd2["vtipodato"] = FormatoDetalle[t].TIPODATO
                    row_upd2["vitemref"] = FormatoDetalle[t].ITEMREF
                    row_upd2["vespecificacion "] = FormatoDetalle[t].ESPECIFICACION
                    row_upd2["vtiporango"] = FormatoDetalle[t].TIPORANGO
                    row_upd2["vdato_evaluar"] = FormatoDetalle[t].DATO_EVALUAR
                    row_upd2["vidtipo_input"] = FormatoDetalle[t].idtipo_input
                    row_upd2["vidbuscador"] = FormatoDetalle[t].ES_BUSCADOR.toString()
                    row_upd2["vcolor"] = FormatoDetalle[t].COLOR
                    data_upd.push(row_upd2);
                }

            }
            newformato_up = data_upd

            AddMuestras(idcert, Productos_up, newformato_up);
        });

        function AddMuestras(idcert, Productos_up, newformato_up) {


            heads.vidempresa = '001'
            heads.vidusuario = getCookie("cUsuario");
            heads.vimei = '000000000000000';
            //console.log(JSON.stringify(newformato_up));

            if (newformato_up.length == 0) {
                toastr.error('', 'Datos no cargados');
                return;
            }
            //return;
            $.ajax({
                type: 'POST',
                url: "../SerCertCalidad.asmx/XmlUpdateCertificadoCalidad",
                data: JSON.stringify({ obj: heads, arrayDetail: Productos_up, newformato: newformato_up }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                beforeSend: function () {
                    $('.btnaddmstra').html('<div class="text-center bold"><img width="20px" src="../img/loading.gif" alt="loading" /><br/>Agregando Muestra...</div>');
                },
                success: function (data) {
                    var lstc = JSON.parse(data.d);
                    if (lstc.length != 0) {
                        Load_detallesCert(idcert);
                        toastr.success('', 'Muestra Añadida');
                        $('#ModMuestraNew').modal('hide');
                        $('#newCantidadMuestra').val(0);
                        $('#newCantidad').val();
                    } else {
                        //cargadata();
                        toastr.error(JSON.stringify(lstc), 'error');
                    }

                    $('.btnaddmstra').html('<button type="button" id="CancelMuestraPlus" class="btn btn-secondary" data-dismiss="modal">Cerrar</button><button type="button" id="RegistrarMuestra" class="btn btn-primary">Agregar</button></div>');

                },
                error: function (error) {
                    $('.btnaddmstra').html('<button type="button" id="CancelMuestraPlus" class="btn btn-secondary" data-dismiss="modal">Cerrar</button><button type="button" id="RegistrarMuestra" class="btn btn-primary">Agregar</button></div>');
                }
            });
        };
        //FIN ADD MUESTRA


        //AGREGAR ACTUALIZACION
        $(document).on('click', '#EditCertificado', function (e) {
            e.preventDefault();
            AddTemplate();
        });
        function AddTemplate() {

            heads.vidempresa = '001'
            heads.vidusuario = getCookie("cUsuario");

            var u_itemd = $('#u_itemupdate').val();
            var u_idcertif = $('#u_idcertifcado').val();

            var datafr = new Array();
            var row = {};

            var fechac = new Date();
            var twoDigitHour1 = (fechac.getHours()) + ""; if (twoDigitHour1.length == 1) twoDigitHour1 = "0" + twoDigitHour1;
            var twoDigitMin1 = (fechac.getMinutes()) + ""; if (twoDigitMin1.length == 1) twoDigitMin1 = "0" + twoDigitMin1;
            var twoDigitSec1 = (fechac.getSeconds()) + ""; if (twoDigitSec1.length == 1) twoDigitSec1 = "0" + twoDigitSec1;
            var horacc = twoDigitHour1 + ":" + twoDigitMin1 + ":" + twoDigitSec1;

            var fecharec = $("#0001_001").val();

            if (typeof fecharec === 'string') {
                var ref = fecharec.split(' ');
                var fecharech = ref[0];
            } else {
                var fecharech = fecharec;

            }

            row["0"] = { id: '0001_001', desc: fecharech + ' ' + horacc };

            row["1"] = { id: '0001_002', desc: $("#0001_002").dxSelectBox('instance').option('value') };


            row["2"] = { id: '0001_003', desc: $("#0001_003").dxSelectBox('instance').option('value') };

            row["3"] = { id: '0001_004', desc: $("#0001_004").dxSelectBox('instance').option('value') };

            row["4"] = { id: '0001_005', desc: $("#0001_005").dxSelectBox('instance').option('value') };

            row["5"] = { id: '0001_006', desc: $("#0001_006").dxSelectBox('instance').option('value') };

            row["6"] = { id: '0001_008', desc: $("#0001_008").val() };

            row["7"] = { id: '0001_009', desc: $("#0001_009").val() };

            row["8"] = { id: '0001_010', desc: $("#0001_010").val() };

            row["9"] = { id: '0001_011', desc: $("#0001_011").dxSelectBox('instance').option('value') };

            row["10"] = { id: '0002_001', desc: $("#0002_001").dxSelectBox('instance').option('value') };

            row["11"] = { id: '0002_002', desc: $("#0002_002").val() };


            row["12"] = { id: '0002_003', desc: $("#0002_003").val() };

            row["13"] = { id: '0002_004', desc: $("#0002_004").val() };

            row["14"] = { id: '0002_005', desc: $("#0002_005").val() };

            row["15"] = { id: '0002_006', desc: $("#0002_006").val() };

            row["16"] = { id: '0002_007', desc: $("#0002_007").val() };

            row["17"] = { id: '0002_008', desc: $("#0002_008").val() };


            row["18"] = { id: '0002_002', desc: $("#0002_002").val() };

            if ($("#0002_010").dxSelectBox('instance').option('selectedItem') != null) {
                row["19"] = { id: '0002_010', desc: $("#0002_010").dxSelectBox('instance').option('value') };
            } else {
                row["19"] = { id: '0002_010', desc: '' };
            }

            if ($("#0002_011").val() != null) {
                row["20"] = { id: '0002_011', desc: $("#0002_011").val() };
            } else {
                row["20"] = { id: '0002_011', desc: '' };
            }

            if ($("#0003_001").val() != null) {
                row["21"] = { id: '0003_001', desc: $("#0003_001").val() };
            } else {
                row["21"] = { id: '0003_001', desc: '' };
            }

            if ($("#0003_002").val() != null) {
                row["22"] = { id: '0003_002', desc: $("#0003_002").val() };
            } else {
                row["22"] = { id: '0003_002', desc: '' };
            }

            if ($("#0003_003").val() != null) {
                row["23"] = { id: '0003_003', desc: $("#0003_003").val() };
            } else {
                row["23"] = { id: '0003_003', desc: '' };
            }

            datafr = row;

            var newformato_upd = [];
            var data_upd = new Array();
            for (var r = 0; r < FormatoDetalle.length; r++) {
                var row_upd = {};




                row_upd["vcidcertificado"] = FormatoDetalle[r].IDCERTIFICADO
                row_upd["vcitem"] = FormatoDetalle[r].ITEM.trim()
                row_upd["vcitemd"] = FormatoDetalle[r].ITEMD.trim()
                row_upd["vidvariable"] = FormatoDetalle[r].IDVARIABLE
                row_upd["vestructura"] = FormatoDetalle[r].ESTRUCTURA.replace("_", ".").trim();
                row_upd["vetiqueta"] = FormatoDetalle[r].ETIQUETA
                row_upd["vnivel"] = FormatoDetalle[r].NIVEL
                row_upd["vestitulo"] = FormatoDetalle[r].ES_TITULO.toString()

                row_upd["vginicio"] = FormatoDetalle[r].GINICIO
                row_upd["vgfin"] = FormatoDetalle[r].GFIN
                row_upd["voinicio"] = FormatoDetalle[r].OINICIO
                row_upd["vofin"] = FormatoDetalle[r].OFIN
                row_upd["vrinicio"] = FormatoDetalle[r].RINICIO
                row_upd["vrfin"] = FormatoDetalle[r].RFIN

                if (FormatoDetalle[r].ITEMD.trim() == u_itemd) {
                    if (FormatoDetalle[r].TIPODATO == 'N') {
                        if (Object.values(datafr).filter(value => { return value.id === FormatoDetalle[r].ESTRUCTURA.trim(); }).length != '0') {
                            //console.log(Object.values(datafr).filter(value => { return value.id.trim() === FormatoDetalle[r].ESTRUCTURA.trim(); })[0]['desc'])
                            var resul = Object.values(datafr).filter(value => { return value.id.trim() === FormatoDetalle[r].ESTRUCTURA.trim(); })[0]['desc']
                        } else {
                            var resul = FormatoDetalle[r].RESULTADO;
                        }
                        row_upd["vresultado"] = resul;
                    } else {
                        if (Object.values(datafr).filter(value => { return value.id.trim() === FormatoDetalle[r].ESTRUCTURA.trim(); }).length != '0') {
                            //console.log(Object.values(datafr).filter(value => { return value.id.trim() === FormatoDetalle[r].ESTRUCTURA.trim(); })[0]['desc'])
                            var resu = Object.values(datafr).filter(value => { return value.id.trim() === FormatoDetalle[r].ESTRUCTURA.trim(); })[0]['desc']
                        } else {
                            var resu = FormatoDetalle[r].RESULTADO_OI;
                        }
                        row_upd["vresultado_oi"] = resu;
                    }
                } else {
                    if (FormatoDetalle[r].TIPODATO == 'N') {
                        row_upd["vresultado"] = FormatoDetalle[r].RESULTADO;;
                    } else {
                        row_upd["vresultado_oi"] = FormatoDetalle[r].RESULTADO_OI;
                    }
                }
                row_upd["ves_critica"] = FormatoDetalle[r].ES_CRITICA.toString()
                row_upd["vvalorporcentaje"] = FormatoDetalle[r].VALORPORCENTAJE
                row_upd["vporcentajemuestra"] = FormatoDetalle[r].PORCENTAJEMUESTRA
                row_upd["vtipodato"] = FormatoDetalle[r].TIPODATO
                row_upd["vitemref"] = FormatoDetalle[r].ITEMREF
                row_upd["vespecificacion "] = FormatoDetalle[r].ESPECIFICACION
                row_upd["vtiporango"] = FormatoDetalle[r].TIPORANGO
                row_upd["vdato_evaluar"] = FormatoDetalle[r].DATO_EVALUAR
                row_upd["vidtipo_input"] = FormatoDetalle[r].idtipo_input
                row_upd["vidbuscador"] = FormatoDetalle[r].ES_BUSCADOR.toString()
                row_upd["vcolor"] = FormatoDetalle[r].COLOR
                data_upd[r] = row_upd;
            }
            newformato_upd = data_upd;

            //for (var d = 0; d < newformato.length; d++) {
            //    //if (newformato[d].vcitemd == getParameterByName('Itemd')) {
            //    console.log(newformato[d].vcitem + ' _ ' + newformato[d].vcitemd + ' _ ' + newformato[d].vestructura + ' _ ' + newformato[d].vetiqueta + ' _ ' + newformato[d].vresultado_oi + ' _ ' + newformato[d].vresultado);
            //    //}
            //}
            //console.log(JSON.stringify(heads));
            //console.log(JSON.stringify(Productos_upd));
            heads.vimei = '000000000000000';
            if (newformato_upd.length == 0) {
                toastr.error('', 'Datos no cargados');
                return;
            }
            $.ajax({
                type: 'POST',
                url: "../SerCertCalidad.asmx/XmlUpdateCertificadoCalidad",
                data: JSON.stringify({ obj: heads, arrayDetail: Productos_upd, newformato: newformato_upd }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                beforeSend: function () {
                    $('.btn-dd').html('<div class="text-center bold"><img width="20px" src="../img/loading.gif" alt="loading" /><br/>Registrando...</div>');
                },
                success: function (data) {
                    var lstc = JSON.parse(data.d);
                    if (lstc.length != 0) {
                        //cargadata();
                        toastr.success('', 'Evaluacion Actualizada');
                        $('#u_itemupdate').val('');
                        $('#u_idcertifcado').val('');
                        ClearTemplate();
                        $('#head_cal').show();
                        $('#Tablas_cal').show();
                        $('#Plantilla_cal').hide();
                        $('.btn-dd').html('<div class="btn-dd"><a class="btn btn-danger" id="cancelEdit">Cancelar</a><button type="button" id="EditCertificado" class="btn btn-success" data-dismiss="modal">Agregar</button></div>');
                    } else {
                        //cargadata();
                        toastr.error(JSON.stringify(lstc), 'error');
                        $('#addCertificadox').html('Agregar');
                        $('#head_cal').show();
                        $('#Tablas_cal').show();
                        $('#Plantilla_cal').hide();
                        $('.btn-dd').html('<div class="btn-dd"><a class="btn btn-danger" id="cancelEdit">Cancelar</a><button type="button" id="EditCertificado" class="btn btn-success" data-dismiss="modal">Agregar</button></div>');
                    }

                },
                error: function (error) {
                    $('#addCertificadox').html('Agregar');
                    toastr.error(JSON.stringify(error), '');
                    $('#head_cal').show();
                    $('#Tablas_cal').show();
                    $('#Plantilla_cal').hide();
                    $('.btn-dd').html('<div class="btn-dd"><a class="btn btn-danger" id="cancelEdit">Cancelar</a><button type="button" id="EditCertificado" class="btn btn-success" data-dismiss="modal">Agregar</button></div>');
                }
            });
            // alert(JSON.stringify(Productos))
        };
        //AGREGAR ACTUALIZACION

        //CANCELAR ACTUALIZACION
        $(document).on('click', '#cancelEdit', function (e) {
            e.preventDefault();

            $('#head_cal').show();
            $('#Tablas_cal').show();
            $('#Plantilla_cal').hide();
            ClearTemplate();
        });
        function ClearTemplate() {
            $("#0001_002").dxSelectBox('reset');
            $("#0001_003").dxSelectBox('reset');
            $("#0001_004").dxSelectBox('reset');
            $("#0001_005").dxSelectBox('reset');
            $("#0001_006").dxSelectBox('reset');
            $("#0001_008").val();
            $("#0001_009").val();
            $("#0001_010").val();
            $("#0001_011").dxSelectBox('reset');
            $("#0002_001").dxSelectBox('reset');
            $("#0002_002").val();
            $("#0002_003").val();
            $("#0002_004").val();
            $("#0002_005").val();
            $("#0002_006").val();
            $("#0002_007").val();
            $("#0002_008").val();
            $("#0002_009").val();
            $("#0002_010").dxSelectBox('reset');
            $("#0002_011").val();
            $("#0003_001").val();
            $("#0003_002").val();
            $("#0003_003").val();
        }
        //FIN CANCELAR ACTUALIZACION

        //ADD NUEVO CERTIFICADO
        $(document).on('click', '#addCertificadox', function (e) {
            e.preventDefault();
            $('#addCertificadox').html('<div class="text-center bold"><img width="20px" src="../img/loading.gif" alt="loading" /><br/>Registrando...</div>');
            AddNewCertificado();
        });
        function AddNewCertificado() {

            var objadd = new Object();
            objadd.vidempresa = '001'
            objadd.vidcertificado = $('#pkid').val();
            objadd.vidusuario = getCookie("cUsuario");

            var currentdate = new Date();
            var twoDigitHour = (currentdate.getHours()) + ""; if (twoDigitHour.length == 1) twoDigitHour = "0" + twoDigitHour;
            var twoDigitMin = (currentdate.getMinutes()) + ""; if (twoDigitMin.length == 1) twoDigitMin = "0" + twoDigitMin;
            var twoDigitSec = (currentdate.getSeconds()) + ""; if (twoDigitSec.length == 1) twoDigitSec = "0" + twoDigitSec;
            var hora = twoDigitHour + ":" + twoDigitMin + ":" + twoDigitSec;

            if ($("#serie").val() != null) {
                objadd.vidserie = $("#serie").val();
            } else {
                objadd.vidserie = '';
            }
            if ($('#fecha').val() != '') {
                var str2 = $('#fecha').val();
                var res2 = str2.split("/", 3);
                objadd.vcFecha = res2[2] + '-' + res2[1] + '-' + res2[0] + 'T' + hora;
            } else {
                objadd.vcFecha = '';
                if (fechaparse != '') {
                    objadd.vcFecha = fechaparse
                } else {
                    toastr.error('', 'Seleccione Fecha Guia');
                    return
                }
            }
            if ($("#periodo").val() != null) {
                objadd.vidperiodo = $("#periodo").val();
            } else {
                objadd.vidperiodo = '';
            }

            objadd.viddocumento = getCookie("puk_iddocumento");

            if ($("#evaluador").val() != null) {
                objadd.vevaluador = $("#evaluador").val();
            } else {
                objadd.vevaluador = '';
            }

            if ($("#idalmacen").dxSelectBox('instance').option('selectedItem') != null) {
                objadd.vidalmacen = $("#idalmacen").dxSelectBox("instance").option('selectedItem').idalmacen;
                objadd.vdescalmacen = $("#idalmacen").dxSelectBox("instance").option('selectedItem').descripcion;
            } else {
                objadd.vidalmacen = '';
                toastr.error('', 'Seleccione Almacen');
                return
            }
            objadd.vidalmacen = getCookie("puk_idalmacen");

            objadd.vidresponsable = $("#idresponsable").dxSelectBox("instance").option('value');//idvariable
            objadd.vdescresponsable = $("#idresponsable").dxSelectBox("instance").option('text');//.descripcion;

            if ($("#idsucursal").dxSelectBox('instance').option('selectedItem') != null) {
                objadd.vidsucursal = $("#idsucursal").dxSelectBox("instance").option('selectedItem').idsucursal;
                objadd.vdescsucursal = $("#idsucursal").dxSelectBox("instance").option('selectedItem').descripcion;
            } else {
                obj.vidsucursal = '';
                toastr.error('', 'Seleccione Sucursal');
                return
            }
            if ($("#idturnotrabajo").dxSelectBox('instance').option('selectedItem') != null) {
                objadd.vidturnotrabajo = $("#idturnotrabajo").dxSelectBox("instance").option('selectedItem').idturnotrabajo;
                objadd.vdescturnotrabajo = $("#idturnotrabajo").dxSelectBox("instance").option('selectedItem').descripcion;
            } else {
                objadd.vidturnotrabajo = '';
                toastr.error('', 'Seleccione Turno');
                return
            }
            if ($("#idunidadnegocio").dxSelectBox('instance').option('selectedItem') != null) {
                objadd.vidunidadnegocio = $("#idunidadnegocio").dxSelectBox("instance").option('selectedItem').idunidadnegocio;
                objadd.vdescunidadnegocio = $("#idunidadnegocio").dxSelectBox("instance").option('selectedItem').descripcion;
            } else {
                objadd.vidunidadnegocio = '';
                toastr.error('', 'Seleccione Unidad Negocio');
                return
            }
            //obj.viddocumento = getCookie("puk_iddocumento");
            objadd.vidvariable = $("#idvariable").dxSelectBox("instance").option('value');//idvariable
            objadd.vdescvariable = $("#idvariable").dxSelectBox("instance").option('text');//.descripcion;

            if ($("#idclieprov").dxSelectBox('instance').option('selectedItem') != null) {
                objadd.vidclieprov = $("#idclieprov").dxSelectBox("instance").option('selectedItem').idclieprov;
                objadd.vdescproveedor = $("#idclieprov").dxSelectBox("instance").option('selectedItem').razon_social;
            } else {
                obj.vidclieprov = '';
                toastr.error('', 'Seleccione Proveedor');
                return
            }
            if ($("#idtipomuestra").dxSelectBox('instance').option('selectedItem') != null) {
                objadd.vidtipomuestra = $("#idtipomuestra").dxSelectBox("instance").option('selectedItem').idtipomuestra;
                objadd.vdesctipomuestra = $("#idtipomuestra").dxSelectBox("instance").option('selectedItem').descripcion;
            } else {
                objadd.vidtipomuestra = '';
                toastr.error('', 'Seleccione Tipo Muestra');
                return
            }

            objadd.vidlinea = $("#idlinea").dxSelectBox("instance").option('value');//idvariable
            objadd.vdesclinea = $("#idlinea").dxSelectBox("instance").option('text');//.descripcion;

            objadd.vdescripcion = $("#cdescripcion").val();


            var Productosadd = [];
            var vcitem, vcidproducto, vcdesproducto, vcantidad, vcantidadmuetra;
            $("#divMuestra").children().each(function (index) {
                vcidproducto = $(this).find('.idproduct').val();
                vcdesproducto = $(this).find('.producto').text();
                vcantidad = $(this).find('.cantmuetra').val();
                vcantidadmuetra = $(this).find('.cantdemuetra').val();
                if (vcantidad == '' || vcantidad == null) {
                    vcantidad = 0;
                }
                if (vcantidadmuetra == '' || vcantidadmuetra == null) {
                    vcantidadmuetra = 0;
                }
                //---->Form validation goes here
                var itx = zfill(index + 1, 3);
                Productosadd.push({
                    vcitem: itx,
                    vcidproducto: vcidproducto,
                    vcdesproducto: vcdesproducto,
                    vcantidad: vcantidad,
                    vcantidadmuetra: vcantidadmuetra,
                    vidconsumidor: '',
                    vlote: '',
                    vstock: 0,
                    vidreferencia: '',
                });
            });

            if (Productosadd.length == 0) {
                toastr.error('', 'Agregue al menos una muestra');
                $('#addCertificadox').html('Agregar');
                return;
            }

            var newformatoadd = [];
            var data_to = new Array();
            d = 0;
            for (var p = 0; p < formato_to.length; p++) {

                if (formato_to[p].idvariable === getCookie("puk_idvariable")) {

                    var rowdd = {};
                    rowdd["vcitem"] = zfill(d + 1, 3);
                    rowdd["vidvariable"] = formato_to[p].idvariable;
                    rowdd["vestructura"] = formato_to[p].estructura;
                    rowdd["vetiqueta"] = formato_to[p].etiqueta;
                    rowdd["vtipodato"] = formato_to[p].tipodato;
                    rowdd["vnivel"] = formato_to[p].nivel;
                    rowdd["vestitulo"] = formato_to[p].estitulo;
                    rowdd["vginicio"] = formato_to[p].ginicio;
                    rowdd["vgfin"] = formato_to[p].gfin;
                    rowdd["voinicio"] = formato_to[p].oinicio;
                    rowdd["vofin"] = formato_to[p].ofin;
                    rowdd["vrinicio"] = formato_to[p].rinicio;
                    rowdd["vrfin"] = formato_to[p].rfin;
                    rowdd["vidmedida"] = formato_to[p].idmedida;
                    rowdd["vobligatario"] = formato_to[p].obligatario;
                    rowdd["ves_critica"] = formato_to[p].es_critica;
                    rowdd["vporcentajemuestra"] = formato_to[p].valorporcentaje;
                    rowdd["vvalorporcentaje"] = formato_to[p].valorporcentaje;
                    rowdd["vitemref"] = formato_to[p].itemref;
                    rowdd["vidtipoinput"] = formato_to[p].idtipoinput;
                    rowdd["vespecificacion "] = formato_to[p].especificacion;
                    rowdd["vtiporango"] = formato_to[p].tiporango;
                    rowdd["vdato_evaluar"] = formato_to[p].dato_evaluar;
                    rowdd["vidtipo_input"] = formato_to[p].idtipo_input;
                    rowdd["vidbuscador"] = formato_to[p].idbuscador;
                    rowdd["vitembuscador"] = formato_to[p].itembuscador;

                    rowdd["vresultado_oi"] = '';
                    rowdd["vresultado"] = 0;
                    data_to[d] = rowdd;
                    d++;
                }
            }
            newformatoadd = data_to;
            objadd.vimei = '000000000000000';

            // console.log(JSON.stringify(objadd));
            //console.log(JSON.stringify(Productosadd));

            //console.log(JSON.stringify(newformatoadd));

            $.ajax({
                type: 'POST',
                url: "../SerCertCalidad.asmx/XmlRegiCertificadoCalidad",
                data: JSON.stringify({ obj: objadd, arrayDetail: Productosadd, newformato: newformatoadd }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lstc = JSON.parse(data.d);
                    if (lstc.length != 0) {
                        cargadata();
                        toastr.success('', 'Evaluacion Registrada');
                        $('#pkid').val('');
                        $('#addCertificadox').html('Agregar');
                        $('#ModNewCertificado').modal('hide');
                        $('#divMuestra').html('');

                    } else {
                        cargadata();
                        toastr.error(JSON.stringify(lst), 'error');
                        $('#addCertificadox').html('Agregar');
                        $('#divMuestra').html('');
                    }
                },
                error: function (error) {
                    $('#addCertificadox').html('Agregar');
                    $('#divMuestra').html('');
                    toastr.error(JSON.stringify(error), '');
                }
            });
            // alert(JSON.stringify(Productos))
        };
        //ADD NUEVO CERTIFICADO

        //CARGAR VARIABLES
        function Load_Variable(idusuario) {
            var obj = new Object();
            obj.vidempresa = '001';
            obj.vidusuario = idusuario;
            $.ajax({
                type: 'POST',
                url: "../SerCertCalidad.asmx/List_variablescalidad",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    if (lst.length != 0) {
                        setCookie("va_idvariable", lst[0].idvariable, 1);
                        setCookie("va_nombrevariable", lst[0].descripcion, 1);
                        $('#variabledesc').text(lst[0].descripcion);
                    }

                }
            })
        }


        //CARGAR PARAMETROS
        function Load_ParametrosUser(usuario) {
            if (localStorage.getItem("objParametrosUser") === null) {
                var obj = new Object();
                obj.vidempresa = '001';
                obj.vidusuario = usuario;
                obj.vc_codigo = '3';
                obj.vtipo = 'M';
                obj.vcodigoinput = '200';
                $.ajax({
                    type: 'POST',
                    url: "../SerCertCalidad.asmx/List_ParametroxUsuario",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);

                        if (lst.length != 0) {
                            for (var i = 0; i < lst.length; i++) {
                                if (lst[i].parametro == 'SERIE') {
                                    $("#serie").val(lst[i].valor);
                                    setCookie("puk_serie", lst[i].valor, 1);
                                }
                                $("#fecha").val(fecha);
                                $("#periodo").val(periodo);
                                // alert(lst[i].parametro);
                                if (lst[i].parametro == 'IDALMACEN') {
                                    $("#idalmacen").dxSelectBox("instance").option('value', lst[i].valor);
                                    $("#idalmacen").dxSelectBox({ disabled: false });
                                    setCookie("puk_idalmacen", lst[i].valor, 1);
                                }
                                if (lst[i].parametro == 'IDDOCUMENTO') {
                                    setCookie("puk_iddocumento", lst[i].valor, 1);
                                }
                                if (lst[i].parametro == 'IDRESPONSABLE') {
                                    $("#idresponsable").dxSelectBox("instance").option('value', lst[i].valor);
                                    $("#idresponsable").dxSelectBox({ disabled: true });
                                    setCookie("puk_idresponsable", lst[i].valor, 1);
                                }
                                if (lst[i].parametro == 'IDSUCURSAL') {
                                    $("#idsucursal").dxSelectBox("instance").option('value', lst[i].valor);
                                    $("#idsucursal").dxSelectBox({ disabled: true });
                                    setCookie("puk_idsucursal", lst[i].valor, 1);
                                }
                                if (lst[i].parametro == 'IDTURNO') {
                                    $("#idturnotrabajo").dxSelectBox("instance").option('value', lst[i].valor);
                                    $("#idturnotrabajo").dxSelectBox({ disabled: true });
                                    setCookie("puk_idturnotrabajo", lst[i].valor, 1);
                                }
                                if (lst[i].parametro == 'IDUNIDADNEGOCIO') {
                                    $("#idunidadnegocio").dxSelectBox("instance").option('value', lst[i].valor);
                                    $("#idunidadnegocio").dxSelectBox({ disabled: true });
                                    setCookie("puk_idunidadnegocio", lst[i].valor, 1);
                                }
                                if (lst[i].parametro == 'IDVARIABLE') {
                                    $("#idvariable").dxSelectBox("instance").option('value', lst[i].valor);
                                    $("#idvariable").dxSelectBox({ disabled: true });
                                    setCookie("puk_idvariable", lst[i].valor, 1);
                                }
                                if (lst[i].parametro == 'PROVEEDOR') {
                                    $("#idclieprov").dxSelectBox("instance").option('value', lst[i].valor);
                                    $("#idclieprov").dxSelectBox({ disabled: true });
                                    setCookie("puk_idclieprov", lst[i].valor, 1);
                                }
                                if (lst[i].parametro == 'TIPOMUESTRA') {
                                    $("#idtipomuestra").dxSelectBox("instance").option('value', lst[i].valor);
                                    $("#idtipomuestra").dxSelectBox({ disabled: true });
                                    setCookie("puk_idtipomuestra", lst[i].valor, 1);
                                }
                                //$("#idlinea").dxSelectBox("reset");

                                $('#logincertificadocalidad').hide();
                                $('#cardcertificadocalidad').show();

                                if (lst.length === i + 1) {
                                    Load_ProductosCalidad();
                                }
                            }
                        }

                        localStorage.setItem('objParametrosUser', JSON.stringify(lst));
                    },
                    error: function (error) {
                        toastr.error(JSON.stringify(error), '');
                    }
                });
            } else {
                var lstx = localStorage.getItem('objParametrosUser');
                var lst = JSON.parse(lstx);

                if (lst.length != 0) {
                    for (var i = 0; i < lst.length; i++) {
                        if (lst[i].parametro == 'SERIE') {
                            $("#serie").val(lst[i].valor);
                            setCookie("puk_serie", lst[i].valor, 1);
                        }
                        $("#fecha").val(fecha);
                        $("#periodo").val(periodo);
                        // alert(lst[i].parametro);
                        if (lst[i].parametro == 'IDALMACEN') {
                            $("#idalmacen").dxSelectBox("instance").option('value', lst[i].valor);
                            $("#idalmacen").dxSelectBox({ disabled: true });
                            setCookie("puk_idalmacen", lst[i].valor, 1);
                        }
                        if (lst[i].parametro == 'IDDOCUMENTO') {
                            setCookie("puk_iddocumento", lst[i].valor, 1);
                        }
                        if (lst[i].parametro == 'IDRESPONSABLE') {
                            $("#idresponsable").dxSelectBox("instance").option('value', lst[i].valor);
                            $("#idresponsable").dxSelectBox({ disabled: true });
                            setCookie("puk_idresponsable", lst[i].valor, 1);
                        }
                        if (lst[i].parametro == 'IDSUCURSAL') {
                            $("#idsucursal").dxSelectBox("instance").option('value', lst[i].valor);
                            $("#idsucursal").dxSelectBox({ disabled: true });
                            setCookie("puk_idsucursal", lst[i].valor, 1);
                        }
                        if (lst[i].parametro == 'IDTURNO') {
                            $("#idturnotrabajo").dxSelectBox("instance").option('value', lst[i].valor);
                            $("#idturnotrabajo").dxSelectBox({ disabled: true });
                            setCookie("puk_idturnotrabajo", lst[i].valor, 1);
                        }
                        if (lst[i].parametro == 'IDUNIDADNEGOCIO') {
                            $("#idunidadnegocio").dxSelectBox("instance").option('value', lst[i].valor);
                            $("#idunidadnegocio").dxSelectBox({ disabled: true });
                            setCookie("puk_idunidadnegocio", lst[i].valor, 1);
                        }
                        if (lst[i].parametro == 'IDVARIABLE') {
                            $("#idvariable").dxSelectBox("instance").option('value', lst[i].valor);
                            $("#idvariable").dxSelectBox({ disabled: true });
                            setCookie("puk_idvariable", lst[i].valor, 1);
                        }
                        if (lst[i].parametro == 'PROVEEDOR') {
                            $("#idclieprov").dxSelectBox("instance").option('value', lst[i].valor);
                            $("#idclieprov").dxSelectBox({ disabled: true });
                            setCookie("puk_idclieprov", lst[i].valor, 1);
                        }
                        if (lst[i].parametro == 'TIPOMUESTRA') {
                            $("#idtipomuestra").dxSelectBox("instance").option('value', lst[i].valor);
                            $("#idtipomuestra").dxSelectBox({ disabled: true });
                            setCookie("puk_idtipomuestra", lst[i].valor, 1);
                        }
                        //$("#idlinea").dxSelectBox("reset");

                        $('#logincertificadocalidad').hide();
                        $('#cardcertificadocalidad').show();
                        if (lst.length === i + 1) {
                            Load_ProductosCalidad();
                        }
                    }
                }
            }


        }
        //CARGAR PARAMETROS


        //NUEVO CODIGO NISIRA
        function new_pkid() {
            var obj = new Object();
            $.ajax({
                type: 'POST',
                url: "../SerCertCalidad.asmx/List_pkcertificado",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    if (lst.length != 0) {
                        $('#pkid').val(lst[0].codigo);

                    } else {
                        toastr.error('Verifique usuario ingresado', 'error');
                    }
                }
            })
        }
        //NUEVO CODIGO NISIRA


        $("#NewCert").click(function () {
            $('#ModNewCertificado').modal('show');

            Load_ParametrosUser(getCookie("cUsuario"));
            new_pkid();

        });


        function datehoy() {
            var fecha = new Date(); //Fecha actual
            var mes = fecha.getMonth() + 1; //obteniendo mes
            var dia = fecha.getDate(); //obteniendo dia
            var ano = fecha.getFullYear(); //obteniendo año
            if (dia < 10)
                dia = '0' + dia; //agrega cero si el menor de 10
            if (mes < 10)
                mes = '0' + mes //agrega cero si el menor de 10
            var fech = dia + "/" + mes + "/" + ano;
            $('#txtFeFin').val(fech);
        }


        $("#EditMuestra").click(function () {

            Load_ParametrosUser(getCookie("cUsuario"));
            new_pkid();

        });

        $(document).on('click', '#EditMuestra', function (e) {
            e.preventDefault();
            //alert($(this).attr(id));
        });

        //LIST INPUT HEADER
        function carga_input_head() {
            Load_Datos_Head('RES', 'idresponsable', 'nombre', 'idresponsable');
            Load_Datos_Head('ALM', 'idalmacen', 'descripcion', 'idalmacen');
            Load_Datos_Head('SUC', 'idsucursal', 'descripcion', 'idsucursal');
            Load_Datos_Head('PRV', 'idclieprov', 'razon_social', 'idclieprov');
            Load_Datos_Head('LIN', 'idlinea', 'descripcion', 'idlinea');
            Load_Datos_Head('TMU', 'idtipomuestra', 'descripcion', 'idtipomuestra');
            Load_Datos_Head('TUR', 'idturnotrabajo', 'descripcion', 'idturnotrabajo');
            Load_Datos_Head('UND', 'idunidadnegocio', 'descripcion', 'idunidadnegocio');
            Load_Datos_Head('VAR', 'idvariable', 'descripcion', 'idvariable');
        }

        function Load_Datos_Head(tipo, id, nombre, id_input) {
            if (localStorage.getItem("obj" + tipo) === []) {
                localStorage.removeItem("obj" + tipo);
            }

            if (localStorage.getItem("obj" + tipo) === null) {
                var obj = new Object();
                obj.vidempresa = '001';
                obj.vidusuario = getCookie("cUsuario");
                obj.vc_codigo = '';
                obj.vtipo = '';
                obj.vcodigoinput = tipo;
                $.ajax({
                    type: 'POST',
                    url: "../SerCertCalidad.asmx/List_Informacion_input",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        localStorage.setItem("obj" + tipo, JSON.stringify(lst));
                        var objSelect = localStorage.getItem("obj" + tipo);


                        var searchBoox = $("#" + id_input).dxSelectBox({
                            dataSource: lst,
                            displayExpr: nombre,
                            valueExpr: id,
                            //searchEnabled: true,
                            placeholder: "Seleccione",
                            noDataText: "Sin Datos",
                            //acceptCustomValue: true
                        }).dxSelectBox("instance");

                    }, error: function (error) {
                        toastr.error(JSON.stringify(error), '');
                    }
                });
            } else {
                var objSele = localStorage.getItem("obj" + tipo);
                //console.log(objSele)
                var searchBoolx = $("#" + id_input).dxSelectBox({
                    dataSource: JSON.parse(objSele),
                    displayExpr: nombre,
                    valueExpr: id,
                    //searchEnabled: true,
                    placeholder: "Seleccione",
                    noDataText: "Sin Datos",
                    //acceptCustomValue: true
                }).dxSelectBox("instance");
            }


        }


        //CRAGA SELECTS PLANTILLA
        Load_Datos('924', '005', '0001_002', 'descripcion', 'descripcion', 1);
        Load_Datos('924', '006', '0001_003', 'descripcion', 'descripcion', 1);
        Load_Datos('924', '007', '0001_004', 'descripcion', 'descripcion', 1);
        Load_Datos('924', '004', '0001_005', 'descripcion', 'descripcion', 1);
        Load_Datos('924', '008', '0001_005', 'descripcion', 'descripcion', 1);
        Load_Datos('004', '003', '0001_006', 'descripcion', 'descripcion', 1);
        Load_Datos('026', '001', '0001_011', 'descripcion', 'descripcion', 1);
        Load_Datos('012', '003', '0001_010', 'descripcion', 'descripcion', 1);
        Load_Datos('924', '009', '0002_001', 'descripcion', 'descripcion', 1);

        $(document).on('click', '.SyncParame', function (e) {
            e.preventDefault();
            var idbusc = $(this).attr('idbusc');
            var itembus = $(this).attr('itembusc');
            var idselcc = $(this).attr('idsel');
            Load_Datos(idbusc, itembus, idselcc, 'descripcion', 'descripcion', 1);
        });

        function Load_Datos(IDBUSCADOR, ITEMBUSCADOR, idsel, name, id, elim = 0) {

            if (elim == 1) {
                localStorage.removeItem('obj' + idsel);
            }

            var select = [];
            if (localStorage.getItem("obj" + idsel) === null) {
                var obj = new Object();
                obj.vcEmpresa = '001';
                obj.IDBUSCADOR = IDBUSCADOR;
                obj.ITEMBUSCADOR = ITEMBUSCADOR;
                $.ajax({
                    type: 'POST',
                    url: "../SerCal.asmx/Select_Dinamico",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    beforeSend: function () {
                        $(".sync" + idsel).html('<img width="15px" src="../img/loading.gif" alt="loading" />Sincronizando...');
                    },
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        console.log('2453');
                        console.log(lst);


                        if (idsel == '0001_011') {
                            var data11 = new Array();
                            for (var x = 0; x < lst.length; x++) {
                                var row = {};
                                row["descripcion"] = lst[x].descripcion.trim();
                                data11[x] = row;
                            }
                            lst = data11;
                        }

                        localStorage.setItem('obj' + idsel, JSON.stringify(lst));
                        var objSelect = localStorage.getItem('obj' + idsel);
                        if (idsel == '0001_002' || idsel == '0001_003') {
                            var searchBoxx = $("#" + idsel).dxSelectBox({
                                dataSource: JSON.parse(objSelect),
                                displayExpr: name,
                                valueExpr: id,
                                searchEnabled: true,
                                placeholder: "Seleccione",
                                noDataText: "Sin Datos",
                                acceptCustomValue: true
                            }).dxSelectBox("instance");
                        } else {
                            var searchBoxx = $("#" + idsel).dxSelectBox({
                                dataSource: JSON.parse(objSelect),
                                displayExpr: name,
                                valueExpr: id,
                                //searchEnabled: true,
                                placeholder: "Seleccione",
                                noDataText: "Sin Datos",
                                //acceptCustomValue: true
                            }).dxSelectBox("instance");
                        }
                        $(".sync" + idsel).html('<button class="btn btn-icon SyncParame" idbusc="' + IDBUSCADOR + '" itembusc="' + ITEMBUSCADOR + '" idsel="' + idsel + '"><i class="fas fa-sync"></i></button>');
                    },
                    error: function (error) {
                        toastr.error(JSON.stringify(error), '');
                        $(".sync" + idsel).html('<button class="btn btn-icon SyncParame" idbusc="' + IDBUSCADOR + '" itembusc="' + ITEMBUSCADOR + '" idsel="' + idsel + '"><i class="fas fa-sync"></i></button>');
                    }
                });
            } else {
                var objSelect = localStorage.getItem('obj' + idsel);
                var searchBoxx = $("#" + idsel).dxSelectBox({
                    dataSource: JSON.parse(objSelect),
                    displayExpr: name,
                    valueExpr: id,
                    //searchEnabled: true,
                    placeholder: "Seleccione",
                    noDataText: "Sin Datos",
                    //acceptCustomValue: true
                }).dxSelectBox("instance");
            }




        }


        //CARGAR PRODUCTOS
        function Load_ProductosCalidad() {
            if (localStorage.getItem("objProductos") === null) {
                var obj = new Object();
                obj.vidempresa = '001';
                obj.vidvariable = getCookie("puk_idvariable");
                obj.vidunidadnegocio = getCookie("puk_idunidadnegocio");
                obj.vtipo = '0';
                $.ajax({
                    type: 'POST',
                    url: "../SerCertCalidad.asmx/List_ProductosCalidad",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        localStorage.setItem('objProductos', JSON.stringify(lst));
                        var objSelect = localStorage.getItem('objProductos');
                        var searchBox = $("#idproducto").dxSelectBox({
                            dataSource: lst,
                            displayExpr: 'descripcion',
                            valueExpr: 'idproducto',
                            //searchEnabled: true,
                            placeholder: "Seleccione",
                            noDataText: "Sin Datos",
                            onValueChanged(data) { adx_mstrax(); },
                        }).dxSelectBox("instance");

                        var searchBox222 = $("#idproducto2").dxSelectBox({
                            dataSource: lst,
                            displayExpr: 'descripcion',
                            valueExpr: 'idproducto',
                            //searchEnabled: true,
                            placeholder: "Seleccione",
                            noDataText: "Sin Datos",
                        }).dxSelectBox("instance");
                    },
                    error: function (error) {
                        toastr.error(JSON.stringify(error), '');
                    }
                });
            } else {
                var objSelect = localStorage.getItem('objProductos');
                var lstt = JSON.parse(objSelect);

                var searchBox = $("#idproducto").dxSelectBox({
                    dataSource: lstt,
                    displayExpr: 'descripcion',
                    valueExpr: 'idproducto',
                    //searchEnabled: true,
                    placeholder: "Seleccione",
                    noDataText: "Sin Datos",
                    onValueChanged(data) { adx_mstrax(); },
                }).dxSelectBox("instance");

                var searchBox222 = $("#idproducto2").dxSelectBox({
                    dataSource: lstt,
                    displayExpr: 'descripcion',
                    valueExpr: 'idproducto',
                    //searchEnabled: true,
                    placeholder: "Seleccione",
                    noDataText: "Sin Datos",
                }).dxSelectBox("instance");
            }



        }

        //CARGAR PRODUCTOS
        window.onload = function () {
            checkCookie();
        }

        function checkCookie() {

            var cUsuario = getCookie("cUsuario");
            var cNombre = getCookie("cNombre");
            if (cUsuario != null && cUsuario != '') {

                var fecha = getCookie("fecha");
                var periodo = getCookie("periodo");
                var puk_serie = getCookie("puk_serie");
                //var puk_idalmacen = getCookie("puk_idalmacen");
                //var puk_idresponsable = getCookie("puk_idresponsable");
                //var puk_idsucursal = getCookie("puk_idsucursal");
                //var puk_idturnotrabajo = getCookie("puk_idturnotrabajo");
                //var puk_idunidadnegocio = getCookie("puk_idunidadnegocio");
                //var puk_idvariable = getCookie("puk_idvariable");
                //var puk_idclieprov = getCookie("puk_idclieprov");
                //var puk_idtipomuestra = getCookie("puk_idtipomuestra");
                //
                //var va_idvariable = getCookie("va_idvariable");
                var va_nombrevariabledd = getCookie("va_nombrevariable");
                $('#evaluador').val(cNombre);

                $('#variabledesc').text(va_nombrevariabledd);

                $('#nom_usuario').text(cNombre)
                $("#fecha").val(fecha);
                $("#periodo").val(periodo);
                $("#serie").val(puk_serie);
                //$("#idalmacen").dxSelectBox("instance").option('value', puk_idalmacen);
                //$("#idresponsable").dxSelectBox("instance").option('value', puk_idresponsable);
                //$("#idsucursal").dxSelectBox("instance").option('value', puk_idsucursal);
                //$("#idturnotrabajo").dxSelectBox("instance").option('value', puk_idturnotrabajo);
                //$("#idunidadnegocio").dxSelectBox("instance").option('value', puk_idunidadnegocio);
                //$("#idvariable").dxSelectBox("instance").option('value', puk_idvariable);
                //$("#idclieprov").dxSelectBox("instance").option('value', puk_idclieprov);
                //$("#idtipomuestra").dxSelectBox("instance").option('value', puk_idtipomuestra);
                //$("#idlinea").dxSelectBox("instance").option('value', '');

                $('#logincertificadocalidad').hide();
                $('#cardcertificadocalidad').show();
                carga_input_head();

            } else {
                DeleteCookies()
            }


        };
        //CARGAR PRODUCTOS

        $(document).on('click', '.NewUser', function (e) {
            e.preventDefault();

            DeleteCookies()
            $('#cUsuario').val('');
        });

        function DeleteCookies() {

            deleteCookie("cUsuario");
            deleteCookie("cNombre");

            deleteCookie("fecha");
            deleteCookie("periodo");
            deleteCookie("puk_serie");
            deleteCookie("puk_idalmacen");
            deleteCookie("puk_idresponsable");
            deleteCookie("puk_idsucursal");
            deleteCookie("puk_idturnotrabajo");
            deleteCookie("puk_idunidadnegocio");
            deleteCookie("puk_idvariable");
            deleteCookie("puk_idclieprov");
            deleteCookie("puk_idtipomuestra");
            deleteCookie("eeinicio");

            deleteCookie("va_idvariable");
            deleteCookie("va_nombrevariable");

            $('#logincertificadocalidad').show();
            $('#cardcertificadocalidad').hide();

            localStorage.removeItem('objProductos');
            localStorage.removeItem('objParametrosUser');
        }

        //ABRIR MUESTRAS DE EVALUACION
        $(document).on('click', '.btn-det-cal', function (e) {
            e.preventDefault();
            var id = $(this).attr('pkid');
            Load_detallesCert(id)
        })
        function Load_detallesCert(id) {
            var dett = new Object();
            dett.vidempresa = '001';
            dett.vidcertificado = id;

            if (dett.vidempresa != '' && dett.vidcertificado != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerCertCalidad.asmx/ListDetalleCertificados",
                    data: JSON.stringify({ obj: dett }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    beforeSend: function () {
                        $("#det" + id).html('<div class="text-center bold"><img width="40px" src="../img/loading.gif" alt="loading" /><br/>Cargando Muestras..</div>');
                    },
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        // alert(JSON.stringify(lst))
                        $("#det" + id).html('');
                        for (var i = 0; i < lst.length; i++) {

                            det_prod = '';
                            det_prod += '<div class="card-cal mb-3" style="padding: 0px 6px;">';
                            det_prod += '<table id="" style="margin: 0px" class="table tabla-cal">';
                            det_prod += '<tr><td style = "width: 85%; text-align: left; vertical-align: middle;" >' + lst[i].descripcion + '<br>' + lst[i].idmedida + '</td><td style="width: 15%;text-align: right;">';
                            det_prod += '<button type="button" id="" class="btn btn-secondary col-12 EditCertificado popup" iddd="' + lst[i].item + '" idemp="' + lst[i].idempresa + '" idc="' + lst[i].idcertificado + '" idvariable="' + lst[i].idvariable + '" ><i class="fa fa-arrow-right"></i></button></td></tr>';
                            det_prod += '<tr  style="visibility:collapse;><td style = "width: 85%; text-align: left; vertical-align: middle;" >CANTIDAD</td><td style="width: 15%;text-align: right;"><input type="number" val="' + lst[i].cantidad + '"></td></tr>';
                            det_prod += '<tr  style="visibility:collapse;><td style = "width: 85%; text-align: left; vertical-align: middle;" >CANTIDAD DE MUESTRA</td><td style="width: 15%;text-align: right;"><input type="number" val="' + lst[i].cnt_muestra + '"></td></tr>';
                            det_prod += '</table>';
                            det_prod += '</div>';

                            $("#det" + id).append(det_prod);
                        }
                    }
                });
            }
        };

        //ABRIR PLANTILLA PARA EVALUCION
        $(document).on('click', '.EditCertificado', function (e) {
            e.preventDefault();
            $(this).html('<div class="text-center bold"><img width="20px" src="../img/loading.gif" alt="loading" /><br/>Cargando Plantilla...</div>');

            var
                w = 870,
                h = 700,
                l = (screen.availWidth - w) / 2,
                t = (screen.availHeight - h) / 2,
                popPage = '.popup';

            var iditem = $(this).attr('iddd');
            var idempresa = $(this).attr('idemp');
            var idCertificado = $(this).attr("idc");
            var idVariable = $(this).attr("idvariable");

            $('.onblurv').removeClass('use_imput');

            EditEvaluacion(idempresa, idVariable, idCertificado, iditem, 1);

        });

        //AÑADIR MUESTRA EN MODAL
        $(document).on('click', '#AddMuestra', function (e) {
            e.preventDefault();
            adx_mstrax()
        });


        function adx_mstrax() {
            //    alert(this.value);
            //});

            //    var id = $(this).value;

            //    var vprod = $('#cFechaCert').val();
            //lst = [{ descripcion: a; idmedida: test; cantidad: 142; cnt_muestra= }]

            if ($("#idproducto").dxSelectBox('instance').option('selectedItem') != null) {
                idproducto = $("#idproducto").dxSelectBox('instance').option('selectedItem').idproducto;
                producto = $("#idproducto").dxSelectBox('instance').option('selectedItem').descripcion;
                idmedida = $("#idproducto").dxSelectBox('instance').option('selectedItem').idmedida;
            } else {
                idproducto = '';
                producto = '';
                idmedida = '';
            }

            if (idproducto == '') {
                alert('seleccione el tipo de muestra');
                return;
            }

            //var duplicated = 0
            //$("#divMuestra").children().each(function (index) {
            //    idprod = $(this).find('.idproduct').val();
            //    if ($.trim(idprod) === $.trim(idproducto)) {
            //        alert('El tipo de muestra ya fue agregado');
            //        duplicated = 1;
            //    }
            //});

            //if (duplicated == 0) {
            det_add = '';
            det_add += '<div class="card-cal mb-3 divprod" style="padding: 0px 6px;">';
            det_add += '<input type="hidden" class="idproduct" value="' + $.trim(idproducto) + '">';
            det_add += '<table id="" style="margin: 0px" class="table tabla-cal">';
            det_add += '<tr><td style="width: 85%; text-align: left; vertical-align: middle;" class="producto">' + producto + '</td><td style="width: 15%;text-align: right;">';
            det_add += '<button type="button" id="" class="btn btn-danger col-12 DeleteCertificado"><i class="fa fa-trash"></i></button></td></tr>';
            det_add += '<tr><td style = "width: 85%; text-align: left; vertical-align: middle;" >CANTIDAD</td><td style="width: 15%;text-align: right;"><input class="cantmuetra" type="number" value="' + 0 + '"></td></tr>';
            det_add += '<tr><td style = "width: 85%; text-align: left; vertical-align: middle;" >CANTIDAD DE MUESTRA</td><td style="width: 15%;text-align: right;"><input class="cantdemuetra" type="number" value="' + 0 + '"></td></tr>';
            det_add += '</table>';
            det_add += '</div>';

            $('#divMuestra').append(det_add)
            //}


        };

        //ELIMINA MUESTRA 
        $(document).on('click', '.DeleteCertificado', function (e) {
            e.preventDefault();

            $(this).parent().parent().parent().parent().parent().remove();

            //Load_Parametros();

            //$('#divMuestra').append(det_add)

        });

        //CARGAR EVALUACIONES
        $(document).on('click', '#SearchCert', function (e) {
            e.preventDefault();

            //clearall();

            cargadata()
        })

        function cargadata() {
            $("#accordion").html('')
            $("#tblProductos tbody").html('');


            var cert = new Object();
            if ($('#cFechaCert').val() != '') {
                var str2 = $('#cFechaCert').val();
                var res2 = str2.split("/", 3);
                cert.vcFecha = res2[2] + '-' + res2[1] + '-' + res2[0];
            } else {
                cert.vcFecha = '';
                if (fechaparse != '') {
                    cert.vcFecha = fechaparse;
                } else {
                    toastr.error('', 'Seleccione Fecha Guia');
                    return
                }
            }
            cert.vcNombre = getCookie("cNombre");
            cert.vcCert = '001';
            cert.vcCert2 = '';
            cert.vcCode = '0';
            if (cert.vcFecha != '' && cert.vcNombre != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerCertCalidad.asmx/ListCertificados2",
                    data: JSON.stringify({ obj: cert }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    beforeSend: function () {
                        $('#LoadDatos').html('<div class="text-center bold"><img width="40px" src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                    },
                    success: function (data) {


                        var lst = JSON.parse(data.d);
                        $('#LoadDatos').html('');
                        if (lst.length != 0) {
                            var html = "";
                            var lst2 = new Array();
                            for (var i = 0; i < lst.length; i++) {
                                var Valida = false;
                                for (var x = 0; x < lst2.length; x++) {
                                    if (lst2[x].idcertificado == lst[i].idcertificado)
                                        Valida = true;
                                }
                                if (!Valida) {
                                    var obj = new Object();
                                    obj.idcertificado = lst[i].idcertificado;
                                    obj.codigo = lst[i].iddocumento + '-' + lst[i].serie + '-' + lst[i].numero;
                                    lst2.push(obj);
                                }
                            }

                            console.log(lst2)

                            for (var i = 0; i < lst2.length; i++) {

                                if (lst[i].descripcion === '') {
                                    lst[i].descripcion = 'Sin Informacion'
                                }

                                if (lst[i].desclinea === '') {
                                    lst[i].desclinea = 'Sin Linea'
                                }

                                //cambios de erick, coregir el seteo de la fecha y asignar la variable correcta

                                var fechaDividida = lst[i].fecha.split('-');
                                var fechitadivididita = fechaDividida[2].split(' ');
                                var fechaReal = fechitadivididita[0] + '/' + fechaDividida[1] + '/' + fechaDividida[0] + ' ' + fechitadivididita[1]



                                tabc = ''

                                tabc += '<div class="card border-success mb-3 panel-cal" ><div class="card-header" style="border-radius: 35px 35px 0px 0px;"><b>' + lst[i].iddocumento + '-' + lst[i].serie + '-' + lst[i].numero + '</b></div>';
                                tabc += '<div class="card-body">';

                                tabc += '<div class="table-responsive" ><table id="tabla-cal" style=" margin: 0px; font-size: 0.6 rem" class="table">';
                                tabc += '<tr style="border-bottom: 1px solid #fff;"><td style = "width: 35%; text-align: left;" >FECHA:</td><td style="width: 65%;text-align: right;">' + fechaReal + '</td></tr>';
                                //tabc += '<tr style="border-bottom: 1px solid #fff;"><td style = "width: 35%; text-align: left;" >PROVEEDOR:</td><td style="width: 65%;text-align: right;">' + lst[i].descproveedor + '</td></tr>';
                                tabc += '<tr style="border-bottom: 1px solid #fff;"><td style = "width: 35%; text-align: left;" >EVALUADOR:</td><td style="width: 65%;text-align: right;">' + lst[i].descresponsable + '</td></tr>';
                                //tabc += '<tr style="border-bottom: 1px solid #fff;"><td style = "width: 35%; text-align: left;" >UN. NEGOCIO:</td><td style="width: 65%;text-align: right;">' + lst[i].descunidadnegocio + '</td></tr>';
                                //tabc += '<tr style="border-bottom: 1px solid #fff;"><td style = "width: 35%; text-align: left;" >EVALUACION:</td><td style="width: 65%;text-align: right;">' + lst[i].descvariable + '</td></tr>';
                                //tabc += '<tr style="border-bottom: 1px solid #fff;"><td style = "width: 35%; text-align: left;" >T.MUESTRA:</td><td style="width: 65%;text-align: right;">' + lst[i].desctipomuestra + '</td></tr>';
                                tabc += '<tr style="border-bottom: 1px solid #fff;"><td style = "width: 35%; text-align: left;" >COSECHADOR:</td><td style="width: 65%;text-align: right;">' + lst[i].glosa + '</td></tr>';
                                tabc += '</table>';
                                tabc += '</div>';
                                tabc += '</div></div>';
                                //<div class="card-footer bg-transparent border-success">Footer</div>
                                // idempresa	idcertificado	idemisor	periodo	idestadoc	
                                //origen_certificado	idsucursal	idalmacen	iddocumento	serie	numero	idestado	fecha	
                                //tcambio	idclieprov	idresponsable	idturnotrabajo	glosa	nromanual	ventana	idreferencia	
                                //evaluador	tipomuestra	descripcion	idvariable	idlinea	idunidadnegocio			
                                //	descturnotrabajo	descsucursal		descvariable	desclinea	descalmacen
                                det_tabc = '';
                                det_tabc += '<div class="card-header"><b>DETALLE DE LA EVALUACION</b></div>';
                                det_tabc += '<div class="card-body">';
                                det_tabc += '<table id="" style="margin: 0px; font-size: 0.6 rem" class="table tabla-cal">';
                                /*det_tabc += '<tr><td style = "width: 25%; text-align: left;" >SERIE:</td><td style="width: 75%;text-align: right;">' + lst[i].serie + '</td></tr>';*/
                                det_tabc += '<tr><td style = "width: 25%; text-align: left;" >FECHA:</td><td style="width: 75%;text-align: right;">' + DateConvert(lst[i].fecha) + '</td></tr>';
                                //det_tabc += '<tr><td style = "width: 25%; text-align: left;" >PERIODO:</td><td style="width: 75%;text-align: right;">' + lst[i].periodo + '</td></tr>';
                                //det_tabc += '<tr><td style = "width: 25%; text-align: left;" >TIPO MUESTRA:</td><td style="width: 75%;text-align: right;">' + lst[i].desctipomuestra + '</td></tr>';
                                det_tabc += '<tr><td style = "width: 25%; text-align: left;" >VARIABLE:</td><td style="width: 75%;text-align: right;">' + lst[i].descvariable + '</td></tr>';
                                /*det_tabc += '<tr><td style = "width: 25%; text-align: left;" >SUCURSAL:</td><td style="width: 75%;text-align: right;">' + lst[i].descsucursal + '</td></tr>';*/
                                det_tabc += '<tr><td style = "width: 25%; text-align: left;" >ALMACEN:</td><td style="width: 75%;text-align: right;">' + lst[i].descalmacen + '</td></tr>';
                                det_tabc += '</table>';
                                det_tabc += '</div>';
                                det_tabc2 = '';
                                det_tabc2 += '<div class="card-header"><b>DATOS GENERALES</b></div>';
                                det_tabc2 += '<div class="card-body">';
                                det_tabc2 += '<table id="" style="margin: 0px; font-size: 0.6 rem" class="table tabla-cal">';
                                //det_tabc2 += '<tr><td style = "width: 25%; text-align: left;" >PROVEEDOR:</td><td style="width: 75%;text-align: right;">' + lst[i].descproveedor + '</td></tr>';
                                //det_tabc2 += '<tr><td style = "width: 25%; text-align: left;" >RESPONSABLE:</td><td style="width: 75%;text-align: right;">' + lst[i].descresponsable + '</td></tr>';
                                //det_tabc2 += '<tr><td style = "width: 25%; text-align: left;" >UNIDAD NEGOCIO:</td><td style="width: 75%;text-align: right;">' + lst[i].descunidadnegocio + '</td></tr>';
                                //det_tabc2 += '<tr><td style = "width: 25%; text-align: left;" >TURNO:</td><td style="width: 75%;text-align: right;">' + lst[i].descturnotrabajo + '</td></tr>';
                                det_tabc2 += '<tr><td style = "width: 25%; text-align: left;" >EVALUADOR:</td><td style="width: 75%;text-align: right;">' + lst[i].evaluador + '</td></tr>';
                                det_tabc2 += '<tr><td style = "width: 25%; text-align: left;" >OBSERVACIONES:</td><td style="width: 75%;text-align: right;">' + lst[i].descripcion + '</td></tr>';
                                /*det_tabc2 += '<tr><td style = "width: 25%; text-align: left;" >LINEA:</td><td style="width: 75%;text-align: right;">' + lst[i].desclinea + '</td></tr>';*/
                                det_tabc2 += '</table>';
                                det_tabc2 += '</div>';


                                var det = '<div class="container card" style="width: 100%">'
                                det += '<ul class="nav nav-tabs" id="myTab" role="tablist">';
                                det += '<li class="nav-item"><a class="nav-link active tab-cal" id="contdist-tab" data-toggle="tab" href="#contdist' + lst2[i].idcertificado + '" role="tab" aria-controls="contdist' + lst2[i].idcertificado + '" aria-selected="true"><b>DETALLES</b></a></li>';
                                det += '<li class="nav-item"><a class="nav-link tab-cal btn-det-cal" pkid="' + lst2[i].idcertificado + '" id="profile-tab" data-toggle="tab" href="#profile' + lst2[i].idcertificado + '" role="tab" aria-controls="profile' + lst2[i].idcertificado + '" aria-selected="false"><b>MUESTRAS</b></a></li>';
                                det += '</ul>';
                                det += '<div class="tab-content" id="myTabContent">';
                                det += '<div class="tab-pane fade show active" id="contdist' + lst2[i].idcertificado + '" role="tabpanel" aria-labelledby="contdist-tab" style="min-height: 50vh">' + det_tabc + det_tabc2 + '</div >';
                                det += '<div class="tab-pane fade" id="profile' + lst2[i].idcertificado + '" role="tabpanel" aria-labelledby="profile-tab" style="min-height: 50vh"><div id="det' + lst2[i].idcertificado + '"></div>';
                                det += '<table style="width: 100%"><tbody><tr><td style="width: 80%" class="p-0 m-0">&nbsp;</td><td style="width: 20%" class="p-0 m-0"><div class="input-group mb-1"><button type="button" id="" idc="' + lst2[i].idcertificado + '" class="btn btn-secondary col-12 AddMuestraPlus"><i class="fa fa-plus"></i></button></div></td></tr></tbody></table ></div> ';
                                det += '</div>';

                                html += "<div class='panel panel-default'>"
                                html += "<div class='panel-heading  card-cal panel-cal' role='tab' id='DvHead" + lst2[i].idcertificado.replace(" ", "") + "'>"
                                html += "<a role='button' data-toggle='collapse' data-parent='#accordion' href='#DvBody" + lst2[i].idcertificado.replace(" ", "") + "' aria-expanded='false' aria-controls='DvBody" + lst2[i].idcertificado.replace(" ", "") + "' class='collapsed'>"
                                html += "<div class='panel-title'>" + tabc + "</div></a> </div>";
                                html += "<div id='DvBody" + lst2[i].idcertificado.replace(" ", "") + "' class='panel-collapse collapse' role='tabpanel' aria-labelledby='DvHead" + lst2[i].idcertificado.replace(" ", "") + "' aria-expanded='false' style='height: 0px;'>"
                                html += "<div class='panel-body' id='dvBodyC" + lst2[i].idcertificado.replace(" ", "") + "' style='background-color: #d6e2d621;'><div class='table-responsive'>";
                                // html += "<table id = Table" + lst2[i].idcertificado + " style = 'width: 100%; margin: 0px;' class='table table-striped small' ></table >";

                                //if (lst2[i].idcertificado == '_6CBWNUXWI3BBE ') { // NO CARGA!! 
                                //    console.log(lst2[i].idcertificado.replace(" ", ""));
                                //    console.log(html);
                                //}

                                //if (lst2[i].idcertificado == '_6CBDUA0GGWI3BB') {
                                //    console.log(lst2[i].idcertificado);
                                //    console.log(html);
                                //}

                                html += det;
                                html += "</div ></div ></div ></div >";

                                $("#accordion").html(html)
                            }
                            for (var i = 0; i < lst.length; i++) {
                                //$("#dvBodyC" + lst[i].nIdTipoDoc).append(" "+ lst[i].btn + "<br />");
                                $("#Table" + lst[i].idcertificado).append("<tr style='border-bottom: 1px solid #e2c5c5;'><td style='width: 85%; text-align: left; padding: 5 0px'>" + lst[i].iddocumento + '-' + lst[i].serie + '-' + lst[i].numero + "</td><td style='width: 15%;text-align: right;'>" + lst[i].evaluador + "</td></tr>");

                            }
                        } else {
                            $("#accordion").html('No contiene Documentos')

                            console.log('2797');
                        }
                    },
                    error: function (error) {
                        toastr.error(JSON.stringify(error), '');
                        $('#LoadDatos').html('');
                    }
                });
            } else {
                toastr.error('', 'Ingrese Fecha');
            }

        };



        //FUNCIONES
        function quita_comas(numero) {
            var cadenas = numero.split(",");
            cadena_sin_comas = "";
            for (i = 0; i < cadenas.length; i++) {
                cadena_sin_comas = cadena_sin_comas + cadenas[i];
            }
            return cadena_sin_comas;
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

        function zfill(number, width) {
            var numberOutput = Math.abs(number); /* Valor absoluto del número */
            var length = number.toString().length; /* Largo del número */
            var zero = "0"; /* String de cero */

            if (width <= length) {
                if (number < 0) {
                    return ("-" + numberOutput.toString());
                } else {
                    return numberOutput.toString();
                }
            } else {
                if (number < 0) {
                    return ("-" + (zero.repeat(width - length)) + numberOutput.toString());
                } else {
                    return ((zero.repeat(width - length)) + numberOutput.toString());
                }
            }
        }

        function DateConvert(datestring) {
            if (datestring != null) {
                var fullDate = new Date(parseInt(datestring.substr(6)));

                var twoDigitMonth = (fullDate.getMonth() + 1) + ""; if (twoDigitMonth.length == 1) twoDigitMonth = "0" + twoDigitMonth;
                var twoDigitDate = fullDate.getDate() + ""; if (twoDigitDate.length == 1) twoDigitDate = "0" + twoDigitDate;
                var currentDate = twoDigitDate + "/" + twoDigitMonth + "/" + fullDate.getFullYear();

                var twoDigitHour = fullDate.getHours() + ""; if (twoDigitHour.length == 1) twoDigitHour = "0" + twoDigitHour;
                var twoDigitMinutes = fullDate.getHours() + ""; if (twoDigitMinutes.length == 1) twoDigitMinutes = "0" + twoDigitMinutes;
                var currentHour = twoDigitHour + ':' + twoDigitMinutes + ':00';
                if (currentHour != '00:00') {
                    return currentDate + ' ' + currentHour;
                } else {
                    return currentDate;
                }

            } else {
                return '';
            }
        }

        function setCookie(cname, cvalue, exdays) {
            var d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            var expires = "expires=" + d.toGMTString();
            document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
        }

        function deleteCookie(cname, cvalue) {
            document.cookie = cname + "=" + cvalue + "; expires=Thu, 01 Jan 1970 00:00:00 UTC;path=/";
            document.cookie = cname + '=; path=/; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
        }

        function getCookie(cname) {
            var name = cname + "=";
            var decodedCookie = decodeURIComponent(document.cookie);
            var ca = decodedCookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
