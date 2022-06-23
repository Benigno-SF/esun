<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ParadasProceso.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Wfo_ParadasProceso" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
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

        #body-boton {
            perspective: 200px;
            background-color: #1b1b1b;
            perspective-origin: center;
            transform-style: preserve-3d;
            overflow: hidden;
        }

        #wrapper {
            transform: rotateX(15deg) translateY(-110px);
            transform-style: preserve-3d;
            text-align: center;
            position: relative;
            height: 99vh;
            display: flex;
            align-items: center;
            align-content: center;
            padding-top: 100px;
            transition: transform 1s;
        }

        div.outer-iron {
            background: linear-gradient(135deg, #4c4c4e 0%,#414141 34%,#6a6a6a 55%,#212121 100%);
            width: 190px;
            height: 190px;
            margin-left: 5px;
            margin-top: 5px;
            border-radius: 50%;
            box-shadow: 1px 1px 4px rgba(138, 135, 135, 0.68) inset;
            overflow: hidden;
            position: relative;
            transform: translateZ(3px);
            transform-style: preserve-3d;
        }

        div.inner-black {
            width: 160px;
            height: 160px;
            background-color: #1e1e1e;
            position: absolute;
            top: 15px;
            left: 15px;
            border-radius: 50%;
            box-shadow: 3px 3px 1px 1px #505050 inset, 1px -1px 1px 1px #e6e6e6 inset;
        }

        div.inner-black-2 {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            margin-left: 10px;
            margin-top: 10px;
            background-color: #101010;
            border: 1px solid rgba(94,94,94,.7);
            box-shadow: -2px -2px 1px rgba(168,168,168,0.8) inset;
            transform: translateZ(5px);
        }

        div.inner-black-3 {
            width: 130px;
            height: 130px;
            margin-top: 5px;
            margin-left: 5px;
            background-color: #252525;
            border-radius: 50%;
            border: 1px solid #1c1c1c;
            box-sizing: border-box;
            box-shadow: -2px 3px 1px #5f5f5f inset;
        }

        div.glare {
            width: 120px;
            height: 150px;
            border-radius: 50%;
            background-color: #fff;
            margin-left: 35px;
            transform: translateY(-50px);
            box-shadow: 0 0 50px 37px #fff;
        }

        button.engine {
            -webkit-tap-highlight-color: transparent;
            background: #666;
            border-radius: 50%;
            width: 125px;
            height: 125px;
            margin-left: 2.5px;
            margin-top: 2.5px;
            border: 0;
            transition: all 0.1s;
            cursor: pointer;
            box-shadow: 0 0 10px 3px #000 inset, 0 -50px 100px rgba(0,0,0,0.8) inset, 0 30px 60px rgba(0,0,0,0.8) inset;
            box-sizing: border-box;
        }

            button.engine:focus {
                outline: none;
            }

            button.engine:active {
                box-shadow: 0 0 12px 5px #000 inset, 0 -60px 100px rgba(0,0,0,0.8) inset, 0 50px 60px rgba(0,0,0,0.8) inset;
                padding-top: 13px;
                background-position-y: 6.5px;
            }


        .light {
            width: 35px;
            height: 15px;
            margin: 0 auto;
            background-color: #bd8888;
            margin-bottom: 10px;
            border-radius: 7px;
            border: 1px solid #1b1b1b;
            transition: all 0.6s;
        }

        .engine.active .light {
            background-color: #f9ea1a;
            border: 1px solid #923C14;
            box-shadow: 0 0 11px 3px #C94A29 inset, 0 0 32px 6px #C77713, 0 0 100px #fff
        }

        button.engine span {
            font-family: sans-serif;
            text-transform: uppercase;
            font-weight: bold;
            font-size: 20px;
            color: #bd8888;
            transition: all 0.6s;
        }

        button.engine.active span {
            color: #C5DEA1;
            text-shadow: 0 0 15px #8CA579, 0 0 2px #fff;
        }

        button.engine span:first-of-type {
            font-size: 15px;
        }

        .paradah {
            /*display: none;*/
        }

        #timer {
            margin: 30px auto 0;
            width: 200px;
        }

            #timer .container {
                display: table;
                background: #777;
                color: #eee;
                font-weight: bold;
                width: 100%;
                text-align: center;
                text-shadow: 1px 1px 4px #999;
            }

                #timer .container div {
                    display: table-cell;
                    font-size: 20px;
                    padding: 5px;
                    width: 10px;
                }

                #timer .container .divider {
                    width: 10px;
                    color: #ddd;
                }

        #btn-comenzar {
            box-sizing: border-box;
            background: #eee;
            border: none;
            margin: 0 auto;
            padding: 20px;
            width: 100%;
            font-size: 15px;
            color: #777;
        }

            #btn-comenzar:hover {
                background: #fff;
            }
    </style>

    <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
    <div class="container">

        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="true">Control Paradas Proceso</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="contdist-tab" data-toggle="tab" href="#contdist" role="tab" aria-controls="contdist" aria-selected="false">Reporte Paradas</a>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade  show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">

                <div class="card">
                    <div class="card-content">
                        <div class="card-head p1" style="min-height:10vh">
                            <div class="col-md-12">
                                <div class="row">
                                    <asp:UpdatePanel runat="server" ID="UpdDLL1" style="width: -webkit-fill-available; display: contents">
                                        <ContentTemplate>
                                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0">
                                                <label for="message-text">Area:</label>
                                                <asp:DropDownList ID="ddlAProceso" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAProceso_SelectedIndexChanged"></asp:DropDownList>
                                            </div>
                                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0">
                                                <label for="message-text">Linea:</label>
                                                <asp:DropDownList ID="ddlAreaGrupo" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlAProceso" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>

                        </div>
                        <div class="card-body">
                            <h4 class="card-title info"></h4>

                            <div class="row text-center paradah" style="justify-content: space-between; display: none">
                                <div class="col-md-3 pt-4" style="text-align: center; margin: auto">
                                    <div class="outer-iron" style="text-align: center; margin: auto;">
                                        <div class="glare"></div>
                                        <div class="inner-black">
                                            <div class="inner-black-2">
                                                <div class="inner-black-3">
                                                    <button class="engine">
                                                        <div class="light"></div>
                                                        <span>PARADA<br />
                                                        </span>
                                                        <span id="engine"></span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="timer" style="display: none">
                                <div class="container">
                                    <div id="hour">00</div>
                                    <div class="divider">:</div>
                                    <div id="minute">00</div>
                                    <div class="divider">:</div>
                                    <div id="second">00</div>
                                </div>
                            </div>
                            <div class="row text-center paradah" style="justify-content: space-between;">
                                <input type="hidden" id="nIdProceso" value="0"/>
                                <input type="hidden" id="nIdParadaProceso" value="0"/>
                                <b style="text-align: center; margin: auto">
                                    <%--<p id="txtProc" class=""></p>--%>
                                </b>
                            </div>
                            <br />
                        </div>

                        <div class="card-body paradad" style="min-height: 30vh">
                            <h4 class="card-title info">Historial</h4>
                            <div class="row text-center">
                                <div class="col-md-10 table" style="margin: auto">
                                    <span style="display: none">PARADAS</span>
                                    <table id="tblParadas" class="table table-striped table-bordered nowrap tr-nopm">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Responsable</th>
                                                <th>Linea</th>
                                                <th>Motivo Para</th>
                                                <th>Fecha</th>
                                                <th>Cultivo</th>
                                                <th>Tiempo Transcurrido</th>
                                                <th>Observacion</th>
                                                <th>Editar</th>
                                                <th>Eliminar</th>
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
            <div class="tab-pane fade" id="contdist" role="tabpanel" aria-labelledby="contdist-tab">
                <div class="card">
                    <div class="card-content">
                        <div class="card-head p1" style="min-height:10vh">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0" id="DivFeCont">
                                        <label for="txtFeCont">Fecha Proceso</label>
                                        <input type="text" id="txtFeCont" name="txtFeCont" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy">
                                        <script type="text/javascript">
                                            $(function () {
                                                $('#txtFeCont').datetimepicker({
                                                    format: 'DD/MM/YYYY',
                                                    locale: 'es'
                                                });
                                                $(function () {
                                                    $('#DivFeCont').datetimepicker({
                                                        format: 'DD/MM/YYYY',
                                                        locale: 'es'
                                                    });
                                                });
                                            });
                                        </script>
                                    </div>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" style="width: -webkit-fill-available; display: contents">
                                        <ContentTemplate>
                                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0">
                                                <label for="message-text">Area:</label>
                                                <asp:DropDownList ID="ddlAreaRep" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAreaRep_SelectedIndexChanged"></asp:DropDownList>
                                            </div>
                                            <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0">
                                                <label for="message-text">Linea:</label>
                                                <asp:DropDownList ID="ddlAreaGrupoRep" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlAreaRep" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0" >
                                        <label for="btnBusc">&nbsp;</label>
                                        <button type="button" id="btnProd" class="btn btn-secondary col-12">
                                            <i class="fas fa-search"></i> Consultar
                                        </button>
                                    </div>
                                    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-2  pb-0 pt-0 m-0" >
                                        <label for="btnBusc">&nbsp;</label>
                                        <button type="button" id="btnNewParada" class="btn btn-secondary col-12">
                                            <i class="fas fa-plus"></i> Nuevo
                                        </button>
                                    </div>
                                </div>


                            </div>

                        </div>
                        <div class="card-body" style="min-height: 30vh">
                                <section id="cell-background">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title">Reporte Paradas</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                    <ul class="list-inline mb-0">
                                                        <li id="btn-excel" style="display: none"><a id='excelExport' title="Exportar en Excel"><i class="fas fa-file-excel"></i></a></li>
                                                        <li id="btn-pdf" style="display: none"><a id='pdfExport' title="Exportar en Pdf"><i class="fas fa-file-pdf"></i></a></li>
                                                        <li id="btn-expand" style="display: none"><a id='expandall' title="Expandir Grupos"><i class="fas fa-angle-double-down"></i></a></li>
                                                        <li id="btn-collapse" style="display: none"><a id='collapseall' title="Collapsar Grupos"><i class="fas fa-angle-double-up"></i></a></li>
                                                        <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="card-content collapse show">
                                                <div class="card-body card-dashboard">
                                                    <div id="container-paradas" class="device-mobile-tablet-container">
                                   
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="modal fade" id="ModProceso" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" style="text-align: center">
                        <span id="ModTitleProc"></span>
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="obsSalidaSalida">
                        <div>
                            <label for="recipient-name" class="col-form-label">Motivo:</label>
                            <select id="nIdMotivo" class="form-control"></select>
                        </div>
                        <div class="form-group p-0 m-0">
                            <label for="message-text" class="col-form-label">Cultivo:</label>
                            <asp:DropDownList ID="ddlCultivo" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="form-group mb-1" id="obsproc">
                            <label for="message-text" class="col-form-label">Observacion:</label>
                            <textarea id="cObservacion" name='cObservacion' class="form-control round"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="anIdParadasProceso" value="0"/>
                    <input type="hidden" id="anIdProceso" value="0"/>
                    <input type="hidden" id="anIdArea" value="0"/>
                    <input type="hidden" id="anIdGrupo" value="0"/>
                    <button type="button" id="btnCancelProc" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" id="btnRegiProc" class="btn btn-primary">Actualizar</button>
                </div>
            </div>
        </div>
    </div>

        <div class="modal fade" id="ModDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" style="text-align: center">
                        <span id="">Eliminar Parada</span>
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h4>¿ESTA SEGURO DE ELIMINAR PARADA?</h4>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="dnIdParadasProceso" value="0"/>
                    <input type="hidden" id="dnIdProceso" value="0"/>
                    <input type="hidden" id="dnIdArea" value="0"/>
                    <input type="hidden" id="dnIdGrupo" value="0"/>
                    <button type="button" id="btnCancelProcc" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" id="btnDeleteProc" class="btn btn-primary">Eliminar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="EditParadaProceso" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Nuevo Registro</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group p-0 m-0">
                        <label for="ddlAProceso" class="col-form-label">Area de Proceso</label>
                        <asp:DropDownList ID="_ddlAreaProceso" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Linea:</label>
                        <asp:DropDownList ID="_ddlAreaGrupo" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group p-0 m-0">
                        <label for="message-text" class="col-form-label">Cultivo:</label>
                        <asp:DropDownList ID="_ddlCultivo" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div>
                        <label for="recipient-name" class="col-form-label">Motivo:</label>
                        <select id="_nIdMotivo" class="form-control"></select>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                    <label for="recipient-name" class="col-form-label">Inicio Parada:</label>
                                    <input type="text" id="_FechaIni" class="form-control round" value="" autocomplete="off" placeholder="dd/mm/yyyy">
                                    <script type="text/javascript">
                                        $(function () {
                                            $('#_FechaIni').datetimepicker({
                                                format: 'DD/MM/YYYY',
                                                locale: 'es'
                                            });
                                            $(function () {
                                                $('#_FechaIni').datetimepicker({
                                                    format: 'DD/MM/YYYY',
                                                    locale: 'es'
                                                });
                                            });
                                        });
                                    </script>
                            </div>
                            <div class="col-md-6">
                                    <label for="recipient-name" class="col-form-label">Hora Parada:</label>
                                    <input type="text" id="_HoraIni" class="form-control round" value="" autocomplete="off" placeholder="hh:mm:ss">
                                    <script type="text/javascript">
                                        $(function () {
                                            $('#_HoraIni').datetimepicker({
                                                format: ' hh:mm:ss',
                                                locale: 'es'
                                            });
                                            $(function () {
                                                $('#_HoraIni').datetimepicker({
                                                    format: 'hh:mm:ss',
                                                    locale: 'es'
                                                });
                                            });
                                        });
                                    </script>
                            </div>
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="recipient-name" class="col-form-label">Fin Parada:</label>
                                <input type="text" id="_FechaFin" class="form-control round" value="" autocomplete="off" placeholder="dd/mm/yyyy">
                                <script type="text/javascript">
                                    $(function () {
                                        $('#_FechaFin').datetimepicker({
                                            format: 'DD/MM/YYYY',
                                            locale: 'es'
                                        });
                                        $(function () {
                                            $('#_FechaFin').datetimepicker({
                                                format: 'DD/MM/YYYY',
                                                locale: 'es'
                                            });
                                        });
                                    });
                                </script>
                            </div>
                            <div class="col-md-6">
                                    <label for="recipient-name" class="col-form-label">Hora Parada:</label>
                                    <input type="text" id="_HoraFin" class="form-control round" value="" autocomplete="off" placeholder="hh:mm:ss">
                                    <script type="text/javascript">
                                        $(function () {
                                            $('#_HoraFin').datetimepicker({
                                                format: ' hh:mm:ss',
                                                locale: 'es'
                                            });
                                            $(function () {
                                                $('#_HoraFin').datetimepicker({
                                                    format: 'hh:mm:ss',
                                                    locale: 'es'
                                                });
                                            });
                                        });
                                    </script>
                            </div>
                    </div>
                </div>
                    <div class="form-group mb-1" id="obsproc2">
                            <label for="message-text" class="col-form-label">Observacion:</label>
                            <textarea id="cObservacion2" name='cObservacion' class="form-control round"></textarea>
                        </div>
                <div class="modal-footer">
                    <input type="hidden" id="procesoparada" value="0">
                    <input type="hidden" id="procesodetalle" value="0">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" id="btnUpdate" class="btn btn-primary">Actualizar</button>
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
        $('body').on('change', '#<%=_ddlAreaProceso.ClientID%>', function () {
            var id = $(this).val();
            _Load_Agrupo(id, 0);
        });



        function _Load_Agrupo(id, idgru, namegru) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdArea = id;
            $.ajax({
                type: 'POST',
                url: "../SerProd.asmx/AGrupoList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    $("#<%=_ddlAreaGrupo.ClientID%>").html('');
                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0">Seleccione Linea</option>';

                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdGrupo + '">' + lst[i].cDescAGrupo + '</option>';
                        }
                        if (idgru != 0) {
                            $("#<%=_ddlAreaGrupo.ClientID%>").append($('<option />', {
                                text: namegru,
                                value: idgru,
                            }));
                        }
                        $("#<%=_ddlAreaGrupo.ClientID%>").append(option);
                        $("#<%=_ddlAreaGrupo.ClientID%>").val(idgru);
                    } else {
                        $("#<%=_ddlAreaGrupo.ClientID%>").html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }
        $(document).on('click', '.upd', function (e) {
            e.preventDefault();
            var idp = $(this).attr('idp');
            var idpp = $(this).attr('idpp');
            var ida = $(this).attr('ida');
            var idg = $(this).attr('idg');
            $('#anIdProceso').val(idp);
            $('#anIdParadasProceso').val(idpp);
            $('#anIdArea').val(ida);
            $('#anIdGrupo').val(idg);
            $('#ModProceso').modal('show');
        });

        $(document).on('click', '.delet', function (e) {
            e.preventDefault();
            var idp = $(this).attr('idp');
            var idpp = $(this).attr('idpp');
            var ida = $(this).attr('ida');
            var idg = $(this).attr('idg');
            $('#dnIdProceso').val(idp);
            $('#dnIdParadasProceso').val(idpp);
            $('#dnIdArea').val(ida);
            $('#dnIdGrupo').val(idg);
            $('#ModDelete').modal('show');
        });

        $(document).on('click', '#btnRegiProc', function () {
            var obj = new Object();
            obj.vnIdParadasProceso = $("#anIdParadasProceso").val();
            obj.vnIdProceso = $("#anIdProceso").val();
            obj.vnIdArea = $("#anIdArea").val();
            obj.vnIdGrupo = $("#anIdGrupo").val();
            obj.vnIdCultivo = $("#<%=ddlCultivo.ClientID%> :selected").val();
            obj.vnIdMotivo = $("#nIdMotivo :selected").val();
            obj.vcObservacion = $("#cObservacion").val();


                    if (obj.vnIdCultivo === '0') {
                        alert('Ingrese Cultivo');
                        return;
                    }
                    if (obj.vnIdMotivo === '0') {
                        alert('Ingrese Motivo');
                        return;
                    }

                    $.ajax({
                        type: 'POST',
                        url: "../SerProd.asmx/ParadasProcesoUpdate",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            if (lst != '') {
                                if (lst[0].regi == 1) {
                                    toastr["success"]('', "Actualizado");
                                    $('#ModProceso').modal('hide');
                                    LoadDatat(obj.vnIdGrupo);
                                } else {
                                    toastr["error"]('', "No Actualizado");
                                }
                            }
                        }
                    });

        });



        $(document).on('click', '#btnDeleteProc', function () {
            var obj = new Object();
            obj.vnIdParadasProceso = $("#dnIdParadasProceso").val();
            obj.vnIdProceso = $("#dnIdProceso").val();
            obj.vnIdArea = $("#dnIdArea").val();
            obj.vnIdGrupo = $("#dnIdGrupo").val();

                    $.ajax({
                        type: 'POST',
                        url: "../SerProd.asmx/ParadasProcesoDelete",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            if (lst != '') {
                                if (lst[0].regi == 1) {
                                    toastr["success"]('', "Eliminado");
                                    $('#ModDelete').modal('hide');
                                    LoadDatat(obj.vnIdGrupo);
                                } else {
                                    toastr["error"]('', "No Eliminado");
                                }
                            }
                        }
                    });

                });

        $(document).on('click', '#btnUpdate', function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdProceso = $("#nIdProceso").val();
            obj.vnIdArea = $("#<%=_ddlAreaProceso.ClientID%> :selected").val();
            obj.vnIdGrupo = $("#<%=_ddlAreaGrupo.ClientID%> :selected").val();
            obj.vnIdCultivo = $("#<%=_ddlCultivo.ClientID%> :selected").val();
            obj.vnIdMotivo = $("#_nIdMotivo :selected").val();
            obj.vcFechaIni = $("#_FechaIni").val() + ' ' + $("#_HoraIni").val();
            obj.vcFechaFin = $("#_FechaFin").val() + ' ' + $("#_HoraFin").val();
            obj.vcObservacion = $("#cObservacion2").val();

            if (obj.vnIdAreaProceso === '0') {
                alert('ingrese area');
                return;
            }
            if (obj.vnIdGrupo === '0') {
                alert('ingrese grupo');
                return;
            }
            if (obj.vnIdMotivo === '0') {
                alert('ingrese motivo');
                return;
            }

            $.ajax({
                type: 'POST',
                url: "../SerProd.asmx/UpdateParadasProceso",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    if (lst != '') {
                        if (lst[0].job == 1) {
                            toastr["success"]('', "Actualizado");
                            $('#EditParadaProceso').modal('hide');
                            cargarep(obj.vnIdArea, obj.vnIdGrupo, $("#_FechaIni").val());
                            clearParada();
                        } else {
                            toastr["error"]('Proceso: ' + lst[0].proceso + ' Detalle:' + lst[0].detalle, "No Actualizado");
                        }
                    }
                }
            });

        });

        function EditParada(nIdProceso, nIdprocesoDetalle, nIdArea) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            if (nIdProceso != '' && nIdprocesoDetalle != '' && nIdArea != '') {
                obj.vnIdProceso = nIdProceso;
                obj.vnIdProcesoDetalle = nIdprocesoDetalle;
                obj.vnIdArea = nIdArea;
                obj.vnIdGrupo = 0;
                $.ajax({
                    type: 'POST',
                    url: "../SerProd.asmx/ReadRendimientoProcesoDetalle",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst != '') {
                            // $('#CodeHead').val('');
                            // $('#CodeHead').hide();
                            var area = lst[0].nIdArea;
                            var linea = lst[0].nIdGrupo;
                            var proceso = lst[0].nIdProceso;
                            var procesodetalle = lst[0].nIdProcesoDetalle;
                            var namelinea = lst[0].cDescAGrupo;
                            var cliente = lst[0].nIdClieProv;
                            var embalaje = lst[0].nIdEmbalaje;
                            var cultivo = lst[0].nIdCultivo;
                            var variedad = lst[0].nIdVariedad;
                            var supervisor = lst[0].nIdsupervisor;
                            var fechaini = lst[0].dFechaIni;
                            var fechafin = lst[0].dFechaFin;
                            if (area != "" && linea != "" && cliente != "" && embalaje != "" && cultivo != "" && variedad != "" && supervisor != "") {

                                $("#<%=ddlAProceso.ClientID%>").val(area);
                                    Load_Agrupo(area, linea, namelinea);
                                    $("#<%=ddlCultivo.ClientID%>").val(cultivo);
                                Load_Variedad(cultivo, variedad);
                                Load_Embalaje(cultivo, embalaje);


                                $('#proceso').val(proceso);
                                $('#procesodetalle').val(procesodetalle);
                                $('#FechaIni').val(fechaini);
                                $('#FechaFin').val(fechafin);

                                    $('#infolinea').text(namelinea + ' - ' + $("#:selected").text());

                                    $('#EditProcesoDetalle').modal('show');

                                }
                                else {
                                    ShowToast("error", "Error...", "Detalle no contiene todos los parametros");
                                    document.getElementById("CodeBar").autofocus;
                                    $('#qrcode').empty();
                                    $('#txtcode').text('');
                                }
                            } else {
                                toastr["error"]('', "No se ha Iniciado Proceso")
                                $('#qrcode').empty();
                                $('#txtcode').text('');
                            }
                        },
                        error: function (error) {
                            if (error.status == '401') {
                                window.location.reload();
                            } else {
                                alert(JSON.stringify(error));
                            }
                        }
                    });
            } else {
                ShowToast("error", "Error...", "Empresa no activo");
            }
        };

        $("#btnNewParada").click(function () {
            new_stop();
        });

        function clearParada() {
            $("#nIdProceso").val('0');
            $("#<%=_ddlAreaProceso.ClientID%> :selected").val('0');
           $("#<%=_ddlAreaGrupo.ClientID%> :selected").val('0');
            $("#<%=ddlCultivo.ClientID%> :selected").val('0');
            $("#_nIdMotivo :selected").val();
            $("#_FechaIni").val('')
            $("#_HoraIni").val('');
            $("#_FechaFin").val('')
            $("#_HoraFin").val('');

                }


        function new_stop() {
            $('#EditParadaProceso').modal('show');
        }

        var tiempo_corriendo = null;

        function timer_par(fun) {

            var tiempo = {
                hora: 0,
                minuto: 0,
                segundo: 0
            };


            if (fun === 1) {
                tiempo_corriendo = setInterval(function () {
                    // Segundos
                    tiempo.segundo++;
                    if (tiempo.segundo >= 60) {
                        tiempo.segundo = 0;
                        tiempo.minuto++;
                    }

                    // Minutos
                    if (tiempo.minuto >= 60) {
                        tiempo.minuto = 0;
                        tiempo.hora++;
                    }

                    $("#hour").text(tiempo.hora < 10 ? '0' + tiempo.hora : tiempo.hora);
                    $("#minute").text(tiempo.minuto < 10 ? '0' + tiempo.minuto : tiempo.minuto);
                    $("#second").text(tiempo.segundo < 10 ? '0' + tiempo.segundo : tiempo.segundo);
                }, 1000);
            } else {
                // $(this).text('Comenzar');
                clearInterval(tiempo_corriendo);
            }
        }




        $('body').on('change', '#<%=ddlAreaGrupo.ClientID%>', function () {
            var id = $(this).val();
            LoadHead(id);
            //Load_Agrupo(id, 0);
        });

        $(document).on('click', '.engine', function (e) {
            e.preventDefault();
            var name = $('.engine').hasClass("active") ? "engine" : "engine active";

        //    //if (name === 'engine') {
        //    //    //$('#ModTitleProc').text('¿Seguir Con el proceso?');
        //    //    //$('#ModSubTitleProc').text("Cuidado, verificar que haya finalizado las lecturas de las lineas");
        //    //    //$('#btnRegiProc').text('Si, Continuar!');
        //    //    //$('#obsproc').hide();
        //    //   // $('#obsSalidaSalida').hide();
        //    //    $('#btnCancelProc').text('Cancelar');
        //    //} else {
        //    //   // $('#ModTitleProc').text('¿Parada de proceso?');
        //    //   // $('#ModSubTitleProc').text("Seleccione Motivo");
        //    //   // $('#btnRegiProc').text('Si, Parar!');
        //    //    //$('#obsproc').hide();
        //    //    //$('#obsSalidaSalida').show();
        //    //    $('#btnCancelProc').text('Cancelar');
        //    //}
        });

        $(document).on('click', '.engine', function (e) {
            e.preventDefault();
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdProceso = $("#nIdProceso").val();
            obj.vnIdParadasProceso = $("#nIdParadaProceso").val();
            obj.vnIdArea = $("#<%=ddlAProceso.ClientID%>").val();
            obj.vnIdGrupo = $("#<%=ddlAreaGrupo.ClientID%>").val();
            obj.vnIdMotivo = 0;
            obj.vnIdParadaMotivo = 0;
            obj.vnIdCultivo = 0;
            //if (obj.vnIdMotivo === '0') {
              //  if (obj.vnIdParadaMotivo === '0') {
              //      alert('ingrese Motivo');
             //       return;
             //   } else {
             //       obj.vnIdMotivo = obj.vnIdParadaMotivo;
             //   }
            //}
            //if (obj.vnIdAreaProceso === '0') {
            //    alert('ingrese area');
            //    return;
            //}
            //if (obj.vnIdGrupo === '0') {
            //    alert('ingrese grupo');
            //    return;
            //}
            obj.vcFechaIni = '';
            obj.vcFechaFin = '';
            //alert(JSON.stringify(obj));
            if (obj.vnIdAreaProceso != '') {

                //$('.engine').addClass($('.engine').hasClass("active") ? "engine" : "engine active");

                $.ajax({
                    async: false,
                    type: 'POST',
                   // url: "../SerProd.asmx/InicFinParadas",
                    url: "../SerProd.asmx/RegiParadasProceso",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        switch (lst[0].nIdParadasProceso) {
                            case -1:
                                toastr["error"]("No se guardo correctamente", "Error");
                                $('#cObservacion').val('')
                                $('#btnInicProc').hide();
                                $('#btnFinProc').show();
                                $('#ModProceso').modal("show");

                                clearInterval(tiempo_corriendo);
                                timer_par(0);
                                $('#timer').hide();
                                break;
                            case 0:
                                toastr["warning"]("Parada Finalizado", "");
                                $(".proceso").html('<i class="fa fa-stop-circle"></i> Iniciar');
                                $("#txtProc").text('Proceso No Iniciado');
                                $('#cObservacion').val('');
                                $('#ModProceso').modal("hide");
                                $('#paradad').show();

                                clearInterval(tiempo_corriendo);
                                LoadHead(obj.vnIdGrupo);
                                 clearInterval(tiempo_corriendo);
                                timer_par(0);
                                $('#timer').hide();
                                var name = $('.engine').hasClass("active") ? "engine" : "engine active";

                                if (name === 'engine active') {
                                    $('.engine').addClass("active");
                                    $("#engine").html('activa');
                                    $('#ModProceso').modal("hide");
                                } else if (name === 'engine') {
                                    $('.engine').removeClass("active");
                                    $("#engine").html('Inactiva');
                                    $('#ModProceso').modal("hide");
                                }
                                break;
                            default:
                                toastr["success"]("Parada Iniciado", lst[0].dfecha);
                                $("#txtProc").text("Proceso Iniciado del dia " + lst[0].dfecha);
                                $(".proceso").html('<i class="fa fa-stop-circle"></i> Terminar');
                                $('#cObservacion').val('');
                                $('#ModProceso').modal("hide");
                                LoadHead(obj.vnIdGrupo);

                                clearInterval(tiempo_corriendo);
                                timer_par(1);
                                $('#timer').show();
                                var name = $('.engine').hasClass("active") ? "engine" : "engine active";

                                if (name === 'engine active') {
                                    $('.engine').addClass("active");
                                    $("#engine").html('activa');
                                    $('#ModProceso').modal("hide");
                                } else if (name === 'engine') {
                                    $('.engine').removeClass("active");
                                    $("#engine").html('Inactiva');
                                    $('#ModProceso').modal("hide");
                                    clearInterval(tiempo_corriendo);
                                }
                                break;
                            // code block
                        }


                        //toastr["success"]('subtitulo', "titulo")
                        //succes warning error toastr["success"]('subtitulo', "titulo")
                    },
                    error: function (error) {
                        console.log(error);
                        alert(JSON.stringify(error))
                    }
                });


            } else {
                alert('ingreses fecha valida')
            }
        });

        function Load_Motivo(id) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdMotivo = id;
            obj.vnIdEmbalaje = '0';
            $.ajax({
                type: 'POST',
                url: "../SerProd.asmx/MotivoList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    $("#nIdMotivo").html('');
                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0" selected>Seleccione Motivo</option>';
                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdMotivo + '">' + lst[i].cDescripcion + '</option>';
                        }
                        $("#nIdMotivo").append(option);
                    } else {
                        $("#nIdMotivo").html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        Load_Motivo();

        function Load_Motivo_M(id) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdMotivo = id;
            obj.vnIdEmbalaje = '0';
            $.ajax({
                type: 'POST',
                url: "../SerProd.asmx/MotivoList",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    $("#_nIdMotivo").html('');
                    if (lst.length != '0') {
                        var option = "";
                        option += '<option value="0" selected>Seleccione Motivo</option>';
                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdMotivo + '">' + lst[i].cDescripcion + '</option>';
                        }
                        $("#_nIdMotivo").append(option);
                    } else {
                        $("#_nIdMotivo").html('');
                    }

                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        }

        Load_Motivo_M();

        //function checkCookie() {
        //    var btn = document.getElementById("Read");
        //    var tipo = btn.getAttribute("data-tipo");
        //    var area = getCookie("area");
        //    var linea = getCookie("linea");

        //    var validarproc = 0;
        //    var obj = new Object();
        //    obj.vcIdEmpresa = fuGetCdEmpre();
        //    obj.vnIdArea = 1;
        //}

        function LoadDatat(grupo) {
            //$('.paradad').show();
            var obj2 = new Object();
            obj2.vnIdParadasProceso = '-1';
            obj2.vnIdGrupo = grupo;
            $("#tblParadas tbody").html('');
            //if (obj.vnIdGrupo != '') {
            $.ajax({
                type: 'POST',
                url: "../SerProd.asmx/ListParadasProceso",
                data: JSON.stringify({ obj: obj2 }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst2 = JSON.parse(data.d);
                    var vvIngv = "";
                    if (lst2.length != '0') {
                        for (i = 0; i < lst2.length; ++i) {

                            if (lst2[i].Motivo == 0) {
                                var back = 'style="background: #ff000030"'
                            } else {
                                var back = ''
                            }

                            if (lst2[i].dFechaFin == '') {
                                //INGRESO
                                vvIngv += "<tr " + back + "><td><i class='fas fa-pause'></td><td>" + lst2[i].Supervisor + "</td><td>" + lst2[i].Linea + "</td>";
                                vvIngv += "<td>" + lst2[i].Motivo + "</td><td>" + lst2[i].Fecha + "</td><td>" + lst2[i].cultivo + "</td><td> ACTIVA </td><td>" + lst2[i].cObservacion + "</td>";
                                vvIngv += "<td><button class='btn btn-sm btn-link btn-warning upd' idpp='" + lst2[i].nIdParadasProceso + "' idp='" + lst2[i].nIdProceso + "' ida='" + lst2[i].nIdArea + "' idg='" + lst2[i].nIdGrupo + "'><span class='fa fa-edit'></span></button > </td > <td><button class='btn btn-sm btn-danger delet' idpp='" + lst2[i].nIdParadasProceso + "' idp='" + lst2[i].nIdProceso + "'  ida='" + lst2[i].nIdArea + "' idg='" + lst2[i].nIdGrupo + "'><span class='fa fa-trash'></span></button></td></tr > "
                            } else {
                                //SALIDA
                                vvIngv += "<tr " + back +"><td><i class='fa fa-stop'><td>" + lst2[i].Supervisor + "</td><td>" + lst2[i].Linea + "</td>";
                                vvIngv += "<td>" + lst2[i].Motivo + "</td><td>" + lst2[i].Fecha + "</td><td>" + lst2[i].cultivo + "</td><td>" + lst2[i].transcurrido + "</td><td>" + lst2[i].cObservacion + "</td>";
                                vvIngv += "<td><button class='btn btn-sm btn-link btn-warning upd' idpp='" + lst2[i].nIdParadasProceso + "' idp='" + lst2[i].nIdProceso + "' ida='" + lst2[i].nIdArea + "' idg='" + lst2[i].nIdGrupo + "'><span class='fa fa-edit'></span></button> </td><td><button class='btn btn-sm btn-danger delet' idpp='" + lst2[i].nIdParadasProceso + "' idp='" + lst2[i].nIdProceso + "'  ida='" + lst2[i].nIdArea + "' idg='" + lst2[i].nIdGrupo + "'><span class='fa fa-trash'></span></button></td></tr>"
                            }
                        }
                        $("#tblParadas tbody").html(vvIngv);


                        //$('#tblParadas').DataTable({
                        //    destroy: true,
                        //    "paging": false,
                        //    "ordering": false,
                        //    "info": false,
                        //    "searching": false,
                        //    "responsive": false
                        //});
                    }

                    // CrearTablas(lst);
                }, error: function (dat) {
                    $('.paradad').hide();
                }
            });
            //}
        }

        //checkCookie();
        function LoadHead(grupo) {
            $('.paradah').show();
            var obj = new Object();
            obj.vnIdParadasProceso = 0;
            obj.vnIdGrupo = grupo;
            //if (obj.vnIdGrupo != '') {
            $.ajax({
                type: 'POST',
                url: "../SerProd.asmx/ListParadasProceso",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    if (lst.length != '0') {
                        if (lst[0].dFechaFin == '') {
                            $('#nIdParadaProceso').val(lst[0].nIdParadasProceso);
                            $('#nIdParadaMotivo').val(lst[0].nIdMotivo);
                            $('.engine').addClass("active");
                            $("#engine").html('activa');

                            $("#txtProc").html('Parada por ' + lst[0].Motivo);
                            LoadDatat(grupo);
                        } else {
                            $('#nIdParadaProceso').val(0);
                            $('#nIdParadaMotivo').val(0);
                            $('.engine').removeClass("active");
                            $("#engine").html('Inactiva');

                            $("#txtProc").html('Parada Inactica');
                            LoadDatat(grupo);
                            clearInterval(tiempo_corriendo);
                        }
                    } else {
                        $('#nIdParadaProceso').val(0);
                        $('#nIdParadaMotivo').val(0);
                        $('.engine').removeClass("active");
                        $("#engine").html('Inactiva');

                        $("#txtProc").html('Parada Inactica');
                        LoadDatat(grupo);
                        clearInterval(tiempo_corriendo);
                    }

                    // CrearTablas(lst);
                }, error: function (dat) {
                    $('.paradah').hide();
                }, complete: function (d) {
                    //LoadData(grupo);
                }
            });
            //}
        }

        ////rep


        $("#btnProd").click(function () {
            cargarep();
        });


        function cargarep(area, grupo, fecha) {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdParadasProceso = '0';

            if (area != null && grupo != null && fecha != null) {
                obj.vnIdArea = area;
                obj.vnIdGrupo = grupo;
                obj.vcFechaProc = fecha;
            } else {
                obj.vnIdArea = $('#<%=ddlAreaRep.ClientID%>').val();
                obj.vnIdGrupo = $('#<%=ddlAreaGrupoRep.ClientID%>').val();
                obj.vcFechaProc = $("#txtFeCont").val();

                if (obj.vcFechaProc === '') {
                    alert('ingrese Fecha');
                    return;
                }
                if (obj.vnIdArea === '0') {
                    alert('ingrese Area');
                    return;
                }
            }
            //  var f = new Date();
            //alert(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
            if (obj.vcIdEmpresa != '' && obj.vnIdAreaProceso != 0) {
                $('#container-paradas').html('<div class="text-center bold"><img src="../img/loading.gif" alt="loading" /><br/>Un momento, por favor...</div>');
                $.ajax({
                    type: 'POST',
                    url: "../SerProd.asmx/ListParadasProcesoRepo",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    error: function () {
                        $('#activos').hide();
                    },
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        $('#container-paradas').html('<div class="options"><div id="filterRow"></div>&nbsp;&nbsp;<div id="headerFilter"></div>&nbsp;&nbsp;<div id="autoExpand"></div></div><div id="DataGridRep"></div>');
                        TbDataGridRep(lst, obj.vcFecha);

                    },
                    error: function (data) {
                        alert(JSON.stringify(data));
                    },
                    timeout: 50000
                });
            } else {
                toastr.error('error', 'SELECCIONE AREA', '')
            }
        }

        function TbDataGridRep(data, vfecha) {
            DevExpress.localization.locale('es');

            var dataGrid3 = $("#DataGridRep").dxDataGrid({
                dataSource: data.dh,
                keyExpr: "nIdGrupo",
                scrolling: {
                    mode: "virtual"
                },
                grouping: {
                    autoExpandAll: false
                },
                groupPanel: {
                    visible: true,
                },
                allowColumnReordering: true,
                allowColumnResizing: true,
                columnMinWidth: 30,
                columnAutoWidth: true,
                showBorders: true,
                columnChooser: {
                    enabled: true
                },
                columnFixing: {
                    enabled: true
                },
                //wordWrapEnabled: true,
                showBorders: true,
                export: {
                    enabled: true,
                    fileName: "Reporte Pardas"
                },

                filterRow: {
                    visible: true,
                    applyFilter: "auto"
                },
                filterRow: { visible: true },
                filterPanel: { visible: true },
                headerFilter: { visible: true },
                //filterValue: [["dia1", "<>", "0"]],
                //filterBuilderPopup: {
                //    position: { of: window, at: "top", my: "top", offset: { y: 10 } },
                //},
                searchPanel: {
                    visible: false,
                    placeholder: "Search..."
                },
                headerFilter: {
                    visible: false
                },
                //  groupIndex: 0,
                columns: [
                    //, { caption: "nIdParadasProceso", dataField: "nIdParadasProceso" }
                    //, { caption: "nIdAreaProceso", dataField: "nIdAreaProceso" }
                    , { caption: "Area", dataField: "Area" }
                    // , { caption: "nIdpersonal", dataField: "nIdpersonal" }
                    , { caption: "Responsable", dataField: "Supervisor" }
                    //, { caption: "nIdGrupo", dataField: "nIdGrupo" }
                    , { caption: "Linea", dataField: "Linea" }

                    //, {
                    //    type: "buttons",
                    //    buttons: [
                    //        {
                    //            icon: "exportselected",
                    //            hint: "Generar",
                    //            onClick: function (e) {
                    //                GenerateOE(e.row.data.nIdProceso, e.row.data.nIdProcesoDetalle, e.row.data.nIdArea);
                    //                e.event.preventDefault();
                    //            },
                    //            visible: function (e) {
                    //                return false;
                    //            }
                    //        },
                    //        {
                    //            icon: "edit",
                    //            hint: "Editar",
                    //            onClick: function (e) {
                    //                EditDetalleProceso(e.row.data.nIdProceso, e.row.data.nIdProcesoDetalle, e.row.data.nIdArea);
                    //                e.event.preventDefault();
                    //            },
                    //            visible: function (e) {
                    //                return true;
                    //            }
                    //        }
                    //    ]
                    //}
                ],
                sortByGroupSummaryInfo: [{
                    summaryItem: "count"
                }],
                masterDetail: {
                    enabled: true,
                    //autoExpandAll: true,
                    template: function (container, options) {
                        // var currentData = options.data;
                        $("<div>")
                            .addClass("master-detail-caption")
                            .text('')
                            .appendTo(container);

                        $("<div>")
                            .dxDataGrid({
                                columnAutoWidth: true,
                                showBorders: true,
                                scrolling: {
                                    mode: "virtual"
                                },
                                columns: [
                                    //{
                                    //    caption: '#',
                                    //    cellTemplate: function (cellElement, cellInfo) {
                                    //        cellElement.text(cellInfo.row.rowIndex + 1)
                                    //    }
                                    //},
                                    //{ caption: "nIdParadasProceso", dataField: "nIdParadasProceso" },
                                    //{ caption: "nIdMotivo", dataField: "nIdMotivo" },
                                    { caption: "Motivo	", dataField: "Motivo" },
                                    { caption: "Fecha", dataField: "Fecha" },
                                    { caption: "dFechaInicio", dataField: "dFechaInicio" },
                                    { caption: "dFechaFin", dataField: "dFechaFin" },
                                    { caption: "transcurrido", dataField: "transcurrido" },
                                    { caption: "cultivo", dataField: "cultivo" }
                                ],
                                onCellPrepared: function (e) {
                                    if (e.rowType === 'header') {
                                        e.cellElement.css("backgroundColor", "#657790" /*"#2f394a"*/);
                                        e.cellElement.css("color", "#fff");
                                    }
                                },
                                dataSource: new DevExpress.data.DataSource({
                                    store: new DevExpress.data.ArrayStore({
                                        key: "nIdGrupo",
                                        data: data.dd,
                                    }),
                                    filter: ["nIdGrupo", "=", options.key]
                                })
                            }).appendTo(container);
                    }
                },
                onCellPrepared: function (e) {
                    if (e.rowType === 'header') {
                        e.cellElement.css("backgroundColor", "#657790" /*"#2f394a"*/);
                        e.cellElement.css("color", "#fff");
                    }
                }
            }).dxDataGrid("instance");

            $("#autoExpand").dxCheckBox({
                value: false,
                text: "Expandir todos los grupos",
                onValueChanged: function (data) {
                    dataGrid.option("grouping.autoExpandAll", data.value);
                }
            });

            $("#filterRow").dxCheckBox({
                text: "Filtro de filas",
                value: false,
                onValueChanged: function (data) {
                    dataGrid.clearFilter();
                    dataGrid.option("filterRow.visible", data.value);
                    // applyFilterModeEditor.option("disabled", !data.value);
                }
            });

            $("#headerFilter").dxCheckBox({
                text: "Filtro de encabezado",
                value: false,
                onValueChanged: function (data) {
                    dataGrid.clearFilter();
                    dataGrid.option("headerFilter.visible", data.value);
                }
            });

        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
