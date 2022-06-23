<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_Tareo.aspx.cs" Inherits="SFC_WEB_APP.Mod_Agro.Wfo_Tareo" %>

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

        #border11:hover {
            padding-left: 0.8rem;
            border-left: 0.8rem solid #00ff99;
        }

        #border:hover {
            padding-left: 0.8rem;
            border-left: 0.8rem solid #00ff99;
        }

        #grupo_num {
            color: #16D39A;
        }

        #id_btn_elim_grupo {
            position: absolute;
            /*box-shadow: -20px 1px 16px 0px rgba(0,0,0,0.2);*/
            z-index: 999; /*Subiendo el z-index del contenedor resuelves ese problema*/
        }

        /* CSS APRA REPONSIVE */
        #head_guias .form-group {
            margin: 2px;
            padding: 2px;
            position: center;
        }

        #cabera1 {
            padding: 0px;
        }

        #cabera2 {
            padding: 0px;
            margin-top: 0px;
        }

        #cabera3 {
            position: center;
        }

        #body {
            margin-bottom: 0px;
        }

        #id_card_body_c {
            padding: 5px;
        }

        @media screen and (max-width: 500px) {
            .ajustarps {
                padding: 0px 0px !important;
            }

            .card-body {
                padding: 0px 0px !important;
            }

            .contenedorcitouwu {
                padding: 0px !important
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
            <div class="col-md-12 contenedorcitouwu">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <div class="row" id="head_guias">
                            <div class="form-group  col-sm-4 col-md-4 col-lg-4 p-2" id="cabera1">
                                <input type="text" id="cUsuario" name="cUsuario" autocomplete="off" class="form-control" style="text-transform: uppercase;" placeholder="Ingrese Usuario" onkeyup="javascript:this.value=this.value.toUpperCase();" />
                            </div>
                            <div class="form-group col-sm-4 col-md-4 col-lg-2" id="cabera2">
                                <div id="divlogin">
                                    <button type="button" id="btnIn" class="btn btn-secondary col-12 Login" onclick="listar_tareo_inicio();">
                                        <i class="fa fa-arrow-right"></i>Ingresar
                                    </button>
                                </div>
                            </div>
                            <div class="form-group col-sm-4 col-md-4 col-lg-2 text-center" id="cabera3">
                                <div id="divlogin2">
                                    <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#myModaltareo"><i class="fa fa-plus"></i></button>
                                </div>
                            </div>
                        </div>
                        <!-- form inicio -->
                        <div class="card" id="body">
                            <div class="card-body text-dark" id="id_card_body_c">
                                <input type="hidden" id="usuario_usuario" value="" />
                                <div class="accordion" id="accordionExample">
                                    <div class="card">
                                        <div id="tareo">
                                        </div>
                                        <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                            <div class="card-body border border-1 ajustarps">

                                                <!-- grupos y labores -->
                                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                                    <li class="nav-item" role="presentation">
                                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">GRUPOS</a>
                                                    </li>
                                                    <li class="nav-item" role="presentation">
                                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false" onclick="listar_labores();">LABORES </a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content border-bottom" id="myTabContent">
                                                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                                        <!-- contenido de grupos -->
                                                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                                                            <li class="nav-item" role="presentation">
                                                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home1" role="tab" aria-controls="home1" aria-selected="true"><b>Grupos</b></a>
                                                            </li>
                                                            <li class="nav-item" role="presentation">
                                                                <a class="nav-link" id="profile-tab1" data-toggle="tab" href="#profile1" role="tab" aria-controls="profile1" aria-selected="false"><b>Trabajadores</b></a>
                                                            </li>
                                                        </ul>
                                                        <div class="tab-content border-bottom" id="myTabContent" style="margin: 0px; padding: 0px;">
                                                            <div class="tab-pane fade show active" id="home1" role="tabpanel" aria-labelledby="home-tab">
                                                                <!-- listado de grupos -->
                                                                <div class="container" style="padding: 4px;">
                                                                    <div class="col-xl-12">
                                                                        <div class="row">
                                                                            <div class="col-sm-1 col-md-3 mt-2">
                                                                                <input type="number" id="reg_grupo_dni" class="form-control" placeholder="DNI del Resp." />
                                                                            </div>
                                                                            <div class="col-sm-12 col-md-3 mt-2">
                                                                                <input type="number" id="reg_grupo_meta" class="form-control" placeholder="Ingrese la meta" />
                                                                            </div>
                                                                            <div class="col-sm-12 col-md-3 mt-2">
                                                                                <div id="reg_grupo_envase"></div>
                                                                            </div>
                                                                            <div class="col-sm-12 col-md-3 mt-2 text-center">
                                                                                <button class="btn btn-outline-white bg-danger" type="button" id="gGrupoTrabajo" onclick="listar_data_usuario();">Agregar | <i class="fa fa-plus"></i></button>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-xl-12 input-group bg-success m-2">
                                                                            <div class="input-group-prepend">
                                                                                <span class="bg-success text-white mr-2" id="grupo_fecha_general"></span>
                                                                                <span class="bg-success text-white" id="grupo_total_general"></span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div id="list_grupo">
                                                                    </div>
                                                                </div>
                                                                <!-- fin listado de grupos -->
                                                            </div>
                                                            <div class="tab-pane fade" id="profile1" role="tabpanel" aria-labelledby="profile-tab">
                                                                <!-- listado de trabajadores por grupo -->
                                                                <div class="container">
                                                                    <div class="input-group col-mb-12 m-3">
                                                                        <input type="text" class="form-control" onkeypress="return (event.charCode >= 48 && event.charCode <= 57)" placeholder="Ingrese el DNI" id="dnitrabajadorgrupo">
                                                                        <div class="input-group-append">
                                                                            <button class="btn btn-outline-white bg-danger" type="button" id="gTrabajadorPorGrupo" onclick="listar_data_usuario2();">Agregar | <i class="fa fa-plus"></i></button>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="input-group bg-success">
                                                                            <div class="input-group-prepend">
                                                                                <span class="input-group-text bg-success text-white"><i class="fa fa-calendar"></i></span>
                                                                                <span class="input-group-text bg-success text-white" id="grupo_fecha_general_trab"></span>
                                                                            </div>
                                                                            <div class="form-control bg-success text-center text-white">
                                                                                <div class="input-group text-center">
                                                                                    <p id="grupo_num"></p>
                                                                                </div>

                                                                            </div>
                                                                            <div class="form-control bg-success text-center text-white">
                                                                                <div class="input-group">
                                                                                    <p>Grupo - </p>
                                                                                    <p id="grupo_responsable"></p>
                                                                                </div>

                                                                            </div>
                                                                            <div class="form-control bg-success text-center text-white">
                                                                                <div class="input-group">
                                                                                    <p>Meta - </p>
                                                                                    <p id="grupo_meta"></p>
                                                                                </div>

                                                                            </div>
                                                                            <input type="hidden" name="name" id="id_grupo" value="" />
                                                                            <div class="input-group-append">
                                                                                <span class="input-group-text bg-success text-white"><i class="fa fa-users"></i></span>
                                                                                <span class="input-group-text bg-success text-white" id="grupo_total_general_trab"></span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!--trabajadores -->
                                                                    <div id="divtrabajadores">
                                                                    </div>
                                                                </div>
                                                                <!-- fin listado de trabajadores por grupo -->
                                                            </div>
                                                        </div>
                                                        <!-- fin contenido de grupos -->
                                                    </div>
                                                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                                        <!-- contendo de labores -->
                                                        <ul class="nav nav-tabs mt-3" id="myTab" role="tablist">
                                                            <li class="nav-item" role="presentation">
                                                                <a class="nav-link active" id="home-tab6" data-toggle="tab" href="#home2" role="tab" aria-controls="home" aria-selected="true" onclick="listar_labores();"><b>L. Labores</b></a>
                                                            </li>
                                                            <li class="nav-item" role="presentation">
                                                                <a class="nav-link" id="profile-tab2" data-toggle="tab" href="#profile2" role="tab" aria-controls="profile" aria-selected="false"><b>Trab.  Labor</b></a>
                                                            </li>
                                                            <li class="nav-item" role="presentation">
                                                                <a class="nav-link" id="contact-tab5" data-toggle="tab" href="#rendmiento_2" role="tab" aria-controls="contact" aria-selected="false"><b>Rend/Avance Labor</b></a>
                                                            </li>
                                                        </ul>
                                                        <div class="tab-content border-bottom" id="myTabContent">
                                                            <div class="tab-pane fade show active" id="home2" role="tabpanel" aria-labelledby="home-tab">
                                                                <!--  listado ee albores -->
                                                                <div class="col-md-12  bg-white">
                                                                    <div class="d-flex justify-content-end mb-2">
                                                                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal3" onclick="cargar_combinaciones();"><i class="fa fa-plus"></i></button>
                                                                    </div>
                                                                    <div class="container bg-success">
                                                                        <div class="row">
                                                                            <div class=" col align-self-start">
                                                                                <div><i class="fa fa-calendar text-white"></i><b id="list_labor_fecha"></b></div>
                                                                            </div>
                                                                            <div class="text-left align-self-center pl-2  pr-2">
                                                                                <div><i class="fa fa-users text-white"></i><b id="list_labor_cont"></b></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div id="list_labores">
                                                                    </div>
                                                                </div>
                                                                <!-- fin listado de labores-->
                                                            </div>
                                                            <div class="tab-pane fade" id="profile2" role="tabpanel" aria-labelledby="profile-tab">
                                                                <!-- trabajador por labor -->
                                                                <div class="d-flex justify-content-end mb-2 input-group">
                                                                    <button type="button" class="btn btn-primary m-1" data-toggle="modal" data-target="#exampleModal5">
                                                                        ASIGNAR HOR. | <i class="fa fa-plus"></i>
                                                                    </button>
                                                                </div>
                                                                <div class="container bg-success">
                                                                    <div class="row">
                                                                        <div class=" col align-self-start">
                                                                            <div id="trab_por_labor_fecha"></div>
                                                                        </div>
                                                                        <div class=" col text-center">
                                                                            <div class="input-group">
                                                                                <div>Acu. Meta -  </div>
                                                                                <div id="trab_por_labor_esperado"></div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="text-left align-center pl-2  pr-2">
                                                                            <div id="trab_por_labor_num"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div id="list_traba_labor_asig">
                                                                </div>

                                                                <div id="list_traba_labor_asig_bd">
                                                                </div>

                                                                <!-- fin trabajador por labor -->
                                                            </div>
                                                            <div class="tab-pane fade" id="rendmiento_2" role="tabpanel" aria-labelledby="contact-tab5">
                                                                <!-- listado rend/Avance por labor -->
                                                                <div class="col-md-12 bg-white">
                                                                    <div class="d-flex justify-content-end mb-2 input-group">
                                                                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal6">
                                                                            Agregar | <i class="fa fa-plus"></i>
                                                                        </button>
                                                                    </div>
                                                                    <div class="container bg-success">
                                                                        <div class="row">
                                                                            <div class=" col align-self-start">
                                                                                <div id="rend_fecha"></div>
                                                                            </div>
                                                                            <div class="text-left align-self-center pl-2  pr-2">
                                                                                <div id="trab_por_labor"></div>
                                                                            </div>
                                                                            <div class=" text-right col align-self-end">
                                                                                <div id="cont_rendimiento"></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div id="divtrabajadores_Labor">
                                                                    </div>

                                                                </div>
                                                                <!-- fin listado rend/Avance por labor -->
                                                            </div>
                                                        </div>
                                                        <!-- fin contendo de labores -->
                                                    </div>
                                                </div>
                                                <!-- fin grupos y labores -->

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- fin form inicio -->

                        <!--  modal inicio -->
                        <div class="modal fade text-dark" id="myModaltareo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Registro de Tareador</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">

                                        <div class="col-12">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <label for="exampleInputEmail1" class="form-label">Responsable Superior</label>
                                                    <div class="input-group mb-3 shadow-sm bg-white rounded">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text bg-white text-success" id="basic-addon1"><i class="fa fa-search"></i></span>
                                                        </div>
                                                        <div id="gResponsableSuperior" class="form-control"></div>
                                                        <input type="hidden" name="name" id="responsable_usuario" value="" />
                                                        <%--<input type="text" class="form-control" placeholder="Selec. Responsable" >--%>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label for="exampleInputEmail1" class="form-label">Fecha Documento</label>
                                                    <div class="input-group mb-3 shadow-sm bg-white rounded">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text bg-white text-success" id="basic-addon1"><i class="fa fa-search"></i></span>
                                                        </div>
                                                        <input id="gFechaDocumento" type="datetime" class="form-control" disabled></input>
                                                        <%--<input type="text" class="form-control" placeholder="Selec. Actvidad">--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">CANCELAR</button>
                                        <button type="button" class="btn btn-info" onclick="guardar_tareo();">REGISTRAR</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- fin  modal inicio -->

                        <!-- modal listado labores -->
                        <div class="modal fade text-dark" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Registro de labores</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">


                                        <div class="col-12">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <label for="exampleInputEmail1" class="form-label">Actividad</label>
                                                    <div class="input-group mb-3 shadow-sm bg-white rounded">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text bg-white text-success" id="basic-addon1"><i class="fa fa-search"></i></span>
                                                        </div>
                                                        <%--<div id="idActividad_list" class="form-control"></div> --%>
                                                        <select class="form-control" name="idZona_list" id="idActividad_list" aria-label="Default select example">
                                                        </select>
                                                        <input type="hidden" class="form-control" id="id_ultim_tareo">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label for="exampleInputEmail1" class="form-label">Turno</label>
                                                    <div class="input-group mb-3 shadow-sm bg-white rounded">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text bg-white text-success" id="basic-addon1"><i class="fa fa-search"></i></span>
                                                        </div>
                                                        <div id="idTurno_list" class="form-control"></div>
                                                        <%--<input type="text" class="form-control" placeholder="Selec. Turno">--%>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label for="exampleInputEmail1" class="form-label">Tipo Actividad</label>
                                                    <div class="input-group mb-3 shadow-sm bg-white rounded">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text bg-white text-success" id="basic-addon1"><i class="fa fa-search"></i></span>
                                                        </div>
                                                        <div id="idTipoActividad_list" class="form-control"></div>
                                                        <%--<input type="text" class="form-control" placeholder="Selec. Tipo Actividad">--%>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <label for="exampleInputEmail1" class="form-label">Labor</label>
                                                    <div class="input-group mb-3 shadow-sm bg-white rounded">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text bg-white text-success" id="basic-addon1"><i class="fa fa-search"></i></span>
                                                        </div>
                                                        <div id="idLabor_list" class="form-control"></div>
                                                        <%--<input type="text" class="form-control" placeholder="Selec. Labor">--%>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <label for="exampleInputEmail1" class="form-label">Grupo de Trabajo</label>
                                                    <div class="input-group mb-3 shadow-sm bg-white rounded">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text bg-white text-success" id="basic-addon1"><i class="fa fa-search"></i></span>
                                                        </div>
                                                        <div id="idResponsable_list" class="form-control"></div>
                                                        <%--<input type="text" class="form-control" placeholder="Selec. Responsable" >--%>
                                                    </div>
                                                </div>
                                                <%--<div class="col-sm-12">
                                        <label for="exampleInputEmail1" class="form-label">Responsable</label>
                                        <div class="input-group mb-3 shadow-sm bg-white rounded">
                                          <div class="input-group-prepend">
                                            <span class="input-group-text bg-white text-success" id="basic-addon1"><i class="fa fa-search"></i></span>
                                          </div>
                                            <div id="idresponsable_fin_list" class="form-control"></div> 
                                          <input type="text" class="form-control" placeholder="Selec. Grupo">
                                        </div>
                                    </div>--%>
                                                <div class="col-sm-12">
                                                    <label for="exampleInputEmail1" class="form-label">Zona</label>
                                                    <div class="input-group mb-3 shadow-sm bg-white rounded">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text bg-white text-success" id="basic-addon1"><i class="fa fa-search"></i></span>
                                                        </div>
                                                        <%--<div id="idZona_list" class="form-control"></div> --%>
                                                        <select class="form-control" name="idZona_list" id="idZona_list" aria-label="Default select example">
                                                        </select>
                                                        <%--<input type="text" class="form-control" placeholder="Selec. Grupo">--%>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <label for="exampleInputEmail1" class="form-label">Consumidor</label>
                                                    <div class="input-group mb-3 shadow-sm bg-white rounded">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text bg-white text-success" id="basic-addon1"><i class="fa fa-search"></i></span>
                                                        </div>
                                                        <div id="idConsumidor_list" class="form-control"></div>
                                                        <%-- <input type="text" class="form-control" placeholder="Selec. Consumidor">--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="reset" class="btn btn-danger" onclick="limpiar_campos();">LIMPIAR</button>
                                        <button type="button" class="btn btn-info" onclick="registrar_combinacion();">REGISTRAR</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- fin modal listado labores -->

                        <!--  Modla registra horas -->
                        <div class="modal fade" id="exampleModal5" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog text-dark">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel5">Hora masivo</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">

                                        <div class="col-12">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <label for="exampleInputEmail1" class="form-label">Hora Inicio</label>
                                                    <div class="input-group mb-3 shadow-sm bg-white rounded">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text bg-white text-success" id="basic-addon1"><i class="fa fa-times-circle"></i></span>
                                                        </div>
                                                        <input id="hora_inicio_asig" type="time" class="form-control" />
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label for="exampleInputEmail1" class="form-label">Hora Fin</label>
                                                    <div class="input-group mb-3 shadow-sm bg-white rounded">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text bg-white text-success" id="basic-addon1"><i class="fa fa-times-circle"></i></span>
                                                        </div>
                                                        <input type="time" id="hora_fin_asig" class="form-control" />
                                                    </div>
                                                </div>

                                            </div>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        <button type="button" class="btn btn-primary" onclick="asignar_hora_masiva();">Asignar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- fin Modla registra horas -->

                        <!--  Modla registra horas -->
                        <div class="modal fade" id="exampleModal6" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog text-dark">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel5">Asignar Rendimiento</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">

                                        <div class="col-12">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <label for="exampleInputEmail1" class="form-label">Trabajador</label>
                                                    <div class="input-group mb-3 shadow-sm bg-white rounded">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text bg-white text-success" id="basic-addon1"><i class="fa fa-search"></i></span>
                                                        </div>
                                                        <div id="list_rend_grupo" class="form-control"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <label for="exampleInputEmail1" class="form-label">Rendimiento Diurno</label>
                                                    <div class="input-group mb-3 shadow-sm bg-white rounded">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text bg-white text-success" id="rendir"><i class="fa fa-search"></i></span>
                                                        </div>
                                                        <input type="number" id="dato_rendieminto" onkeypress="return (event.charCode >= 48 && event.charCode <= 57)" class="form-control" />
                                                        <input type="hidden" id="hora_nocturna" class="form-control" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" onclick="registrar_rendimiento_labor();">Agregar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- fin Modla registra horas -->

                        <!--  Modla editar rendineonto trabajdor -->
                        <div class="modal fade" id="exampleModal20" tabindex="-1" aria-labelledby="exampleModalLabel20" aria-hidden="true">
                            <div class="modal-dialog text-dark">
                                <div class="modal-content">
                                    <div class="modal-header bg-warning">
                                        <h5 class="modal-title">Actualizar Rendimiento</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">

                                        <div class="col-12">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <label for="exampleInputEmail1" class="form-label">Trabajador</label>
                                                    <div class="input-group mb-3 shadow-sm bg-white rounded">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text bg-white text-success" id="basic-addon1"><i class="fa fa-search"></i></span>
                                                        </div>
                                                        <div id="redn_traajador_up" class="form-control"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <label for="exampleInputEmail1" class="form-label">DNI</label>
                                                    <div class="input-group mb-3 shadow-sm bg-white rounded">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text bg-white text-success" id="rendir"><i class="fa fa-search"></i></span>
                                                        </div>
                                                        <input type="number" id="rend_dni_up" class="form-control" disabled />
                                                        <input type="hidden" id="rend_item_up" class="form-control" />
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label for="exampleInputEmail1" class="form-label">Hora Registro</label>
                                                    <div class="input-group mb-3 shadow-sm bg-white rounded">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text bg-white text-success" id="rendir"><i class="fa fa-search"></i></span>
                                                        </div>
                                                        <input type="text" id="redn_fecha_hora_up" class="form-control" disabled />
                                                        <input type="hidden" id="redn_CITEMID_up" class="form-control" disabled />
                                                        <input type="hidden" id="redn_CDITEMID_up" class="form-control" disabled />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <label for="exampleInputEmail1" class="form-label">R. Diurno</label>
                                                    <div class="input-group mb-3 shadow-sm bg-white rounded">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text bg-white text-success" id="basic-addon1"><i class="fa fa-search"></i></span>
                                                        </div>
                                                        <input type="number" id="rend_diurno_up" onkeypress="return (event.charCode >= 48 && event.charCode <= 57)" class="form-control" />
                                                        <input type="hidden" id="rend_grupo_up" class="form-control" />
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label for="exampleInputEmail1" class="form-label">R. Noct.</label>
                                                    <div class="input-group mb-3 shadow-sm bg-white rounded">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text bg-white text-success" id="basic-addon1"><i class="fa fa-search"></i></span>
                                                        </div>
                                                        <input type="number" id="rend_nocturno_up" class="form-control" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                            <button type="button" class="btn btn-primary" onclick="editar_rendimiento_trabajador();">Actualizar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- fin Modla registra horas -->

                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        window.addEventListener('load', function () {
            //listar_trabajador_x_labor();
            // cargamos datos del responsable
            // funcion listaR RESPONSABLE
            var fecha = new Date();
            var mes = fecha.getMonth() + 1;
            var dia = fecha.getDate();
            var anio = fecha.getFullYear();
            if (dia < 10)
                dia = '0' + dia;
            if (mes < 10)
                mes = '0' + mes

            var fecha_actual = dia + "-" + mes + "-" + anio;

            var cod_empresa = '001';
            var bd = 'SUNFRUITS';
            var tipo = 'SPT';

            var obj = new Object();
            obj.vrgempresa = cod_empresa;
            obj.vrgbaseddatos = bd;
            obj.vrgtipo = tipo;
            obj.vridactividad = '';
            obj.vrgfecha = fecha_actual;
            obj.vrusuario = "";
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listar_labor_combinaciones",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    document.getElementById("responsable_usuario").value = lst[0].IDUSUARIO;
                    var searchBox = $("#gResponsableSuperior").dxSelectBox({
                        dataSource: lst,
                        displayExpr: 'NOMBRE',
                        valueExpr: 'ID_RESPONSABLE',
                        placeholder: "Seleccione",
                        noDataText: "Sin Datos",
                        searchEnabled: true,
                        onValueChanged: function (data) {
                            var $result = $(".current-value");

                            if (data.value !== null) {
                                var selectedItem = data.component.option('selectedItem');
                                //alert(selectedItem.NRO_GRUPO + " (ID: " + selectedItem.NRO_GRUPO + ")");
                                // mostramos el grupo
                                document.getElementById("cUsuario").value = selectedItem.IDUSUARIO;
                                //$("#cUsuario").text();
                            }
                        },
                    }).dxSelectBox("instance");

                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });

            // asginar la fehca y hora  actual al input
            var fecha = new Date();
            var mes = fecha.getMonth() + 1;
            var dia = fecha.getDate();
            var anio = fecha.getFullYear();
            if (dia < 10)
                dia = '0' + dia;
            if (mes < 10)
                mes = '0' + mes

            var fecha_actual = dia + "-" + mes + "-" + anio;
            var hora_actual = fecha.getHours() + ':' + fecha.getMinutes() + ':' + fecha.getSeconds();

            document.getElementById("gFechaDocumento").value = fecha_actual + " " + hora_actual;
        });
        // listra tareo
        function listar_tareo_inicio() {
            var fecha = new Date();
            var mes = fecha.getMonth() + 1;
            var dia = fecha.getDate();
            var anio = fecha.getFullYear();
            if (dia < 10)
                dia = '0' + dia;
            if (mes < 10)
                mes = '0' + mes

            var fecha_actual = dia + "/" + mes + "/" + anio;

            var usuario = document.getElementById("cUsuario").value
            document.getElementById("usuario_usuario").value = usuario;
            // listamos la cabcera de tareo 
            var ID = usuario
            var fecha_filtro = fecha_actual
            var tipo = "LIST_LAB_TAREO"

            var obj = new Object();
            obj.vtareocabid = ID;
            obj.vtareocabfecha = fecha_filtro;
            obj.vtareocabtipo = tipo;
            obj.vtitem_ini = "";
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listar_tareo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    //var lst2 = JSON.stringify(data.d);
                    var lst = JSON.parse(data.d);

                    // verificamos  que  no regrese vacio
                    if (lst.length === 0) {
                        toastr["error"]("No esta registrado todavia");
                    } else {
                        // verficamos el estado
                        var estado_ultimo;
                        if (lst[0].IHABILITADO === 1) {
                            estado_ultimo = "ACTIVO";
                        } else {
                            estado_ultimo = "PENDIENTE";
                        }
                        //seteamos
                        $("#tareo").html('');

                        var contador = 0;

                        for (var i = 0; i < lst.length; i++) {

                            list_grupo = '';
                            list_grupo += '<div class="card-header shadow mb-1 border-primary rounded" id="headingOne" style="padding:3px; !important">';
                            list_grupo += '<h2 class="mb-0">';
                            list_grupo += '<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" onclick="listar_grupo();">';
                            list_grupo += '<div class="container" style="padding-left:3px;>';
                            list_grupo += '<div class="col-xl-12">';
                            list_grupo += '<input type="hidden" id="id_responsable" value="' + lst[i].CTG30TARID + '">';
                            list_grupo += '<input type="hidden" id="usuario">';

                            //list_grupo += '<div class="row">';



                            //list_grupo += '<div class="col-sm-3">';
                            //list_grupo += '<label><b>Resp. Superior: </b></label>';
                            //list_grupo += '<label>' + lst[i].cdescresponsablesuperior + '</label>';
                            //list_grupo += '</div>';


                            //list_grupo += '<div class="col-sm-3">';
                            //list_grupo += '<label><b>Sucursal:</b> </label>';
                            //list_grupo += '<label>' + lst[i].SUCURSAL + '</label>';
                            //list_grupo += '</div>';

                            //list_grupo += '<div class="col-sm-3">';
                            //list_grupo += '<label><b>Planilla :</b> </label>';
                            //list_grupo += '<label>' + lst[i].PLANILLA + '</label>';
                            //list_grupo += '</div>';

                            //list_grupo += '</div>';

                            list_grupo += '<div class="row">';

                            list_grupo += '<div class="col-sm-3">';
                            list_grupo += '<label><b>Responsable:</b> </label>';
                            list_grupo += '<label>' + lst[i].cdescresponsablesuperior + '</label>';
                            list_grupo += '</div>';

                            list_grupo += '<div class="col-sm-3">';
                            list_grupo += '<label><b>Documento:</b> </label>';
                            list_grupo += '<label> ' + lst[i].DOCUMENTO + ' </label>';
                            list_grupo += '</div>';

                            list_grupo += '<div class="col-sm-3">';
                            list_grupo += '<label><b>Fecha:</b> </label>';
                            list_grupo += ' <label id="fecha_tareo">' + lst[0].FECHACREACION + '</label>';
                            list_grupo += '</div>';

                            list_grupo += '<div class="col-sm-3">';
                            list_grupo += '<label><b>Estado:</b> </label>';
                            list_grupo += '<label class="text-success"><b>' + estado_ultimo + '</b></label>';
                            list_grupo += '</div>';

                            list_grupo += '</div>';


                            list_grupo += '</div>';
                            list_grupo += '</div>';
                            list_grupo += '</button>';
                            list_grupo += '</h2>';
                            list_grupo += '</div>';

                            $("#tareo").append(list_grupo);

                            contador = contador + 1;
                        }
                    }

                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });


        }

        // funcion consultar data usuario
        function listar_data_usuario() {
            var dni = document.getElementById("reg_grupo_dni").value;

            var obj = new Object();
            obj.DNI = dni;
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listar_data_usuario",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    // verificamos  que  no regrese vacio
                    if (lst.length === 0) {
                        toastr["error"]("No se encontro datos");
                        document.getElementById("reg_grupo_dni").value = "";
                    } else {
                        var dni = lst[0].cNroDocumento;
                        var datos = lst[0].cNombres;

                        registrar_grupos(dni, datos);
                    }

                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });
        }

        // funcion registrar  grupos
        function registrar_grupos(dni, datos) {
            var fecha = $('#fecha_tareo').text();
            var usuario = document.getElementById("usuario_usuario").value;
            var meta = document.getElementById("reg_grupo_meta").value;
            var idtareo = document.getElementById("id_responsable").value;
            var idenvase = $("#reg_grupo_envase").dxSelectBox('instance').option('selectedItem').id_envase;

            var obj = new Object();
            obj.vdnirespgrupo = dni;
            obj.vdatosrespgrupo = datos;
            obj.vusuariogrupo = usuario;
            obj.vfechagrupo = fecha;
            obj.META = meta;
            obj.vidtareo = idtareo;
            obj.videnvase = idenvase;
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_registrar_grupo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.stringify(data.d);
                    toastr["success"]("Grupo Registrado")
                    listar_grupo();

                    document.getElementById("reg_grupo_dni").value = "";
                    document.getElementById("reg_grupo_meta").value = "";

                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });
        }

        // boyenemosdta para el detalle
        function listar_data_usuario2() {
            var dni = document.getElementById("dnitrabajadorgrupo").value;

            if (dni.length == 8) {
                var obj = new Object();
                obj.DNI = dni;
                $.ajax({
                    type: 'POST',
                    url: "../SerTareo.asmx/SER_listar_data_usuario",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        console.log(lst);

                        // verificamos  que  no regrese vacio
                        if (lst.length === 0) {
                            toastr["error"]("No se encontro datos");
                            document.getElementById("dnitrabajadorgrupo").value = "";
                        } else {
                            var dni = lst[0].cNroDocumento;
                            var datos = lst[0].cNombres;
                            console.log(datos);

                            registrar_deatalle_grupo(dni, datos);
                        }

                    },
                    error: function (data) {
                        alert(JSON.stringify(data));
                    }
                });
            } else {
                toastr["error"]("Ingrese un dni correcto");
            }

        }
        //funcion registra detalle grupo
        function registrar_deatalle_grupo(dni, datos) {
            var id = $('#grupo_num').text();
            var meta = $('#grupo_meta').text();
            var di_tareo_detalle = document.getElementById("id_responsable").value;

            var obj = new Object();
            obj.vdid = id;
            obj.vditem = id; // verificar
            obj.vdcodtrabajdor = dni;
            obj.vddatostrabajdor = datos;
            obj.vdtipo = 1;
            obj.vdmeta = meta;
            obj.vidtareo_detalle = di_tareo_detalle;
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_registrar_detalle_grupo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);


                    if (lst[0].ERROR != "") {
                        toastr["success"]("Se registro")
                        var codigo = $('#grupo_num').text() + $('#grupo_meta').text();
                        //iufhvoivjf | " + lst[i].IDGT.toString() + " | " + lst[i].META.toString() + " | " + lst[i].NRO_GRUPO.toString() 
                        listar_detalle("iufhvoivjf | " + localStorage.getItem("idGrupo") + " | " + localStorage.getItem("meta") + " | " + localStorage.getItem("nroGrupo"));
                        document.getElementById("dnitrabajadorgrupo").value = "";
                    } else {
                        toastr["error"]("No se registro")
                        document.getElementById("dnitrabajadorgrupo").value = "";
                    }

                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });
        }

        // funcion listra grupo
        function listar_grupo() {
            var fecha = new Date();
            var mes = fecha.getMonth() + 1;
            var dia = fecha.getDate();
            var anio = fecha.getFullYear();
            if (dia < 10)
                dia = '0' + dia;
            if (mes < 10)
                mes = '0' + mes

            var fecha_actual = dia + "/" + mes + "/" + anio;
            var usuario = document.getElementById("usuario_usuario").value;

            var obj = new Object();
            obj.vusuario = usuario;
            obj.vtfehcagrupo = fecha_actual;
            obj.vtipo = "LIST_CAB";
            obj.idgrupo = 0;
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listar_grupo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    var lst2 = JSON.stringify(data.d);

                    var contador = 0;
                    //seteamos
                    $("#list_grupo").html('');

                    // mostramos la fecha.
                    var fecha = new Date();
                    var mes = fecha.getMonth() + 1;
                    var dia = fecha.getDate();
                    var anio = fecha.getFullYear();
                    if (dia < 10)
                        dia = '0' + dia;
                    if (mes < 10)
                        mes = '0' + mes

                    var fecha_actual = dia + "/" + mes + "/" + anio;
                    $('#grupo_fecha_general').text(fecha_actual);


                    for (var i = 0; i < lst.length; i++) {

                        console.log(lst);
                        var nombreVariable = 'meta/' + lst[i].COD_RESP + '/' + lst[i].NRO_GRUPO.toString();
                        console.log(nombreVariable);
                        //almacenarLocalStorage(nombreVariable, lst[i].META.toString())

                        var valorALaLuz = "'iufhvoivjf|" + lst[i].IDGT.toString() + "|" + lst[i].META.toString() + "|" + lst[i].NRO_GRUPO.toString() + "'";
                        var list_grupo = '';

                        list_grupo += '<a onclick="listar_detalle(' + String(valorALaLuz) + ');">';
                        list_grupo += '<div class="col-xl-12 mt-2 rounded border-left-3 border-warning" >';
                        list_grupo += '<div class="card" id="border11">';

                        list_grupo += '<div class="row BB">';

                        list_grupo += '<div class="col-sm-1 text-center">';
                        list_grupo += '<div class="card-body text-success" style="padding-right:2px;padding-top:0px;padding-left:0px;padding-bottom:2px;">';
                        list_grupo += '<h1>';
                        list_grupo += '<i class="fa fa-users"></i>';
                        list_grupo += '</h1>';
                        list_grupo += '</div>';
                        list_grupo += '</div>';

                        list_grupo += '<div class="col-sm-4">';
                        list_grupo += '<div class="card-body text-dark" style="padding-right:2px;padding-top:0px;padding-left:0px;padding-bottom:2px;">';
                        list_grupo += '<label><b>Trabajador</b></label>';
                        list_grupo += '<input type="hidden" id="fecha" value="' + lst[i].FECHAGRUPO + '">';
                        list_grupo += '<p class="card-text text-dark">' + lst[i].DATOS_RESP + '</p>';
                        list_grupo += '</div>';
                        list_grupo += '</div>';

                        list_grupo += '<div class="col-sm-3">';
                        list_grupo += '<div class="card-body text-dark" style="padding-right:2px;padding-top:0px;padding-left:0px;padding-bottom:2px;">';
                        list_grupo += '<label><b>Num. Grupo</b></label>';
                        list_grupo += '<p class="card-text text-dark">' + lst[i].NRO_GRUPO + '</p>';
                        list_grupo += '</div>';
                        list_grupo += '</div>';

                        list_grupo += '<div class="col-sm-2">';
                        list_grupo += '<div class="card-body text-dark" style="padding-right:2px;padding-top:0px;padding-left:0px;padding-bottom:2px;">';
                        list_grupo += '<label><b>Meta</b></label>';
                        list_grupo += '<p class="card-text text-dark">' + lst[i].META + ' ' + lst[i].descripcion_envase + '</p>';
                        list_grupo += '</div>';
                        list_grupo += '</div>';


                        list_grupo += '<div class="col-sm-2 text-center">';
                        list_grupo += '<div class="card-body text-dark mb-2" style="padding-right:2px;padding-top:0px;padding-left:0px;padding-bottom:2px;">';
                        list_grupo += '<button type="button" class="btn btn-danger btn-md" id="id_btn_elim_grupo" onclick="eliminar_grupo(' + lst[i].IDGT + ');">';
                        list_grupo += '<i class="fa fa-trash"></i>';
                        list_grupo += '</button>';
                        list_grupo += '</div>';
                        list_grupo += '</div>';

                        list_grupo += '</div>';
                        list_grupo += '</div>';
                        list_grupo += '</div>';
                        list_grupo += '</a>';

                        $("#list_grupo").append(list_grupo);

                        contador = contador + 1;
                    }

                    //  mostramos la cantidad de  grupos.
                    $('#grupo_total_general').text(contador + " -  " + "Registros");

                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });

            // listamos  los envases 
            var obj = new Object();
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listar_envase",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    var searchBox = $("#reg_grupo_envase").dxSelectBox({
                        dataSource: lst,
                        displayExpr: 'descripcion_envase',
                        valueExpr: 'id_envase',
                        placeholder: "Seleccione",
                        noDataText: "Sin Datos",
                        searchEnabled: true,
                    }).dxSelectBox("instance");


                },
                error: function (data) {
                    //toastr["success"]("SE REGISTRO DATOS");
                    alert(JSON.stringify(data));
                }
            });

        }

        // funcion giardar en local store
        function almacenarLocalStorage(key, valu) {
            var idididid = valu;
            var ididididd2 = localStorage.getItem(key);
            if (typeof ididididd2 === 'undefined') {
                localStorage.setItem(key, idididid);
            }
            else {
                localStorage.removeItem(key);
                localStorage.setItem(key, idididid);
            }

        }

        // FUNCION ELIMIANR GRUPSO
        function eliminar_grupo(id) {
            // obtener los datos de lamtabl
            var obj = new Object();
            obj.grupo_elim_CTG30TARID = "";
            obj.grupo_elim_TABLA = "GRUPOS_TAREO";
            obj.grupo_elim_CSERIE = "";
            obj.grupo_elim_CNUMERO = "";
            obj.grupo_elim_CTG30TRABID = "";
            obj.grupo_elim_CITEMID = "";
            obj.grupo_elim_CITEM = "";
            obj.grupo_elim_CTG30ACTID = "";
            obj.grupo_elim_CTG30LABID = "";
            obj.grupo_elim_CTG30CONSID = "";
            obj.grupo_elim_IDGT = id;
            obj.grupo_elim_COD_RESP = "";
            obj.grupo_elim_NRO_GRUPO = 0;
            obj.grupo_elim_COD_TRAB = "";
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_eliminar_grupo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    toastr["success"]("GRUPO ELIMINADO");
                    listar_grupo();

                },
                error: function (data) {
                    //alert(JSON.stringify(data));
                    toastr["error"]("NO SE PUEDE ELIMINAR, GRUPO YA UTLIZADO");
                    //$('#myModaltareo').modal('hide');
                }
            });
        }

        // funcion para listra detalle
        function listar_detalle(cadena2) {
            //console.log(typeof cadena2);
            //console.log(cadena2);
            var cadena = cadena2.toString();
            //console.log(typeof cadena);
            //console.log(cadena);
            var listacadena = cadena.split('|');
            //console.log(typeof listacadena);
            //console.log(listacadena);
            $('#grupo_responsable').text(listacadena[3]);
            almacenarLocalStorage('idGrupo', listacadena[1]);
            almacenarLocalStorage('meta', listacadena[2]);
            almacenarLocalStorage('nroGrupo', listacadena[3]);
            var cod = listacadena[1];
            var meta = listacadena[2];
            //console.log(listacadena[0] + '    ' + listacadena[1]);

            var fecha = document.getElementById("fecha").value;
            var usuario = document.getElementById("usuario_usuario").value;
            var obj = new Object();
            obj.vusuario = usuario;
            obj.vtfehcagrupo = fecha; // agrgar fecha
            obj.vtipo = "LIST_DETA";
            obj.idgrupo = cod;  // codigo
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listar_detalle_grupo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    var contador = 0;

                    //alert("se rgistro grupo" + JSON.stringify(lst));

                    $("#divtrabajadores").html('');

                    // mostramos la fecha.
                    var fecha = new Date();
                    var mes = fecha.getMonth() + 1;
                    var dia = fecha.getDate();
                    var anio = fecha.getFullYear();
                    if (dia < 10)
                        dia = '0' + dia;
                    if (mes < 10)
                        mes = '0' + mes

                    var fecha_actual = dia + "/" + mes + "/" + anio;
                    $('#grupo_fecha_general_trab').text(fecha_actual);

                    // agregamos el numeor de grupo  -----  del repsobsalbel
                    $('#grupo_num').text(cod);

                    // asiagnsmo la meta del gryupo
                    $('#grupo_meta').text(meta);

                    //agregamos al input el numeoe de ID
                    document.getElementById("id_grupo").value = cod;

                    for (var i = 0; i < lst.length; i++) {
                        var trow = '';
                        trow += '<div class="col-xl-12 mt-2  rounded border-left-3 border-success" >';
                        trow += '<div class="card " id="border">';
                        trow += '<div class="row">';

                        trow += '<div class="col-sm-1 text-center">';
                        trow += '<div class="card-body text-success">';
                        trow += '<h1>';
                        trow += '<i class="fa fa-user"></i>';
                        trow += '</h1>';
                        trow += '</div>';
                        trow += '</div>';

                        trow += '<div class="col-sm-4">';
                        trow += '<div class="card-body text-dark">';
                        trow += '<label><b>Trabajador</b></label>';
                        trow += '<p class="card-text text-dark">' + lst[i].DATOS_TRAB + '</p>';
                        trow += '</div>';
                        trow += '</div>';

                        trow += '<div class="col-sm-3">';
                        trow += '<div class="card-body text-dark">';
                        trow += '<label><b>Num. Doc.</b></label>';
                        trow += '<p class="card-text text-dark" id="dni_di">' + lst[i].COD_TRAB + '</p>';
                        trow += '</div>';
                        trow += '</div>';

                        trow += '<div class="col-sm-2">';
                        trow += '<div class="card-body text-dark">';
                        trow += '<label><b>Meta.</b></label>';
                        trow += '<p class="card-text text-dark">' + lst[i].META + '</p>';
                        trow += '</div>';
                        trow += '</div>';

                        trow += '<div class="col-sm-2 text-center">';
                        trow += '<div class="card-body text-dark">';
                        trow += '<button type="button" class="btn btn-danger btn-lg" onclick="eliminar_grupo_trabajador(' + lst[i].ITEM + ',' + lst[i].IDGT + ');">';
                        trow += '<i class="fa fa-trash"></i>';
                        trow += '</button>';
                        trow += '</div>';
                        trow += '</div>';

                        trow += '</div>';
                        trow += '</div>';
                        trow += '</div>';

                        $("#divtrabajadores").append(trow);

                        contador = contador + 1;
                    }

                    //  mostramos la cantidad de  grupos.
                    $('#grupo_total_general_trab').text(contador + " -  " + "Registros");
                    $('#grupo_num').text();
                    var metacada_grupo = $('#grupo_meta').text();
                    var id_grupo = $('#grupo_num').text();

                    //pbtenemos los valores de los grupos y guardamos en array
                    var datos_esperado = [];
                    var div = document.getElementsByClassName('A');
                    DATOS = [].map.call(div, function (e) {
                        datos_esperado.push($(e).text());
                    });


                    // recooremos elñ array para validar
                    /*datos_esperado.forEach(function (f) {*/
                    DATOS = [].map.call(div, function (e) {
                        if (id_grupo == $(e).text()) {
                            var text = $(e).text();
                            $('#valor_esperado_grupo').text(metacada_grupo * contador);
                        }
                    });
                    /*});*/

                    /* ------------------------  PARA GUARDR MAIVO  ---------------------------------------*/
                    // variable y contador
                    //var elemento = document.getElementsByClassName('B');
                    //var id = elemento[0].getAttribute('id');
                    //console.log(id);

                    //var elemento = document.getElementsByClassName('B');
                    //var cantidad = elemento.length;
                    //var array_id = Array();

                    //for (var i = 0; i < cantidad; i++) {
                    //    var id = elemento[i].getAttribute('id');

                    //    array_id.push(id);
                    //}


                    // contruimos el OBJETO medinate un constructor
                    //function Datos(trabajador) {
                    //    this.trabajador = trabajador;
                    //}


                    //for (let elem of id) {
                    //    alert(elem.innerHTML); // "prueba", "pasado"
                    //}

                    /* ----------------------- -------------- FIN   PARA GUARDR MAIVO  -------------------------------*/

                    $('#profile-tab1').click();
                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });
        }

        // funcion para las combinaciones
        function cargar_combinaciones() {
            // LISTAR RESPONSABLE
            //var cod_empresa = '001';
            //var bd = 'SUNFRUITS';
            //var tipo = 'RET';

            //var obj = new Object();
            //obj.vrgempresa = cod_empresa;
            //obj.vrgbaseddatos = bd;
            //obj.vrgtipo = tipo;
            //obj.vridactividad = '';
            //obj.vrgfecha = '';
            //obj.vrusuario = '';

            //$.ajax({
            //    type: 'POST',
            //    url: "../SerTareo.asmx/SER_listar_labor_combinaciones",
            //    data: JSON.stringify({ obj: obj }),
            //    dataType: 'json',
            //    contentType: 'application/json; charset=utf-8',
            //    success: function (data) {
            //        var lst = JSON.parse(data.d);
            //        var searchBox = $("#idresponsable_fin_list").dxSelectBox({
            //            dataSource: lst,
            //            displayExpr: 'NOMBRERESPONSABLE',
            //            valueExpr: 'IDRESPONSABLE',
            //            placeholder: "Seleccione",
            //            noDataText: "Sin Datos",
            //            searchEnabled: true,
            //        }).dxSelectBox("instance");

            //    },
            //    error: function (data) {
            //        alert(JSON.stringify(data));
            //    }
            //});

            // funcion listaR ACTIVIDADES
            var cod_empresa = '001';
            var bd = 'SUNFRUITS';
            var tipo = 'ACT';

            var obj = new Object();
            obj.vrgempresa = cod_empresa;
            obj.vrgbaseddatos = bd;
            obj.vrgtipo = tipo;
            obj.vridactividad = '001';
            obj.vrgfecha = '';
            obj.vrusuario = '';

            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listar_labor_combinaciones",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    $('#idActividad_list').html('<option value="0">Seleccione Cosecha</option>');
                    for (var i = 0; i < lst.length; i++) {
                        var x = document.getElementById("idActividad_list");
                        var option = document.createElement("option");
                        option.value = lst[i].IDACTIVIDAD;
                        option.text = lst[i].DESCRIPCION;
                        x.add(option);
                    }

                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });

            // funcion listaR TIPO ACTIVIDDAD
            var cod_empresa = '001';
            var bd = 'SUNFRUITS';
            var tipo = 'TAC';

            var obj = new Object();
            obj.vrgempresa = cod_empresa;
            obj.vrgbaseddatos = bd;
            obj.vrgtipo = tipo;
            obj.vridactividad = '';
            obj.vrgfecha = "";
            obj.vrusuario = "";
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listar_labor_combinaciones",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    var searchBox = $("#idTipoActividad_list").dxSelectBox({
                        dataSource: lst,
                        displayExpr: 'DESCRIPCION',
                        valueExpr: 'ID',
                        placeholder: "Seleccione",
                        noDataText: "Sin Datos",
                        searchEnabled: true,
                    }).dxSelectBox("instance");

                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });



            // funcion listaR RESPONSABLE
            var usuario = document.getElementById("usuario_usuario").value;
            var fecha = new Date();
            var mes = fecha.getMonth() + 1;
            var dia = fecha.getDate();
            var anio = fecha.getFullYear();
            if (dia < 10)
                dia = '0' + dia;
            if (mes < 10)
                mes = '0' + mes

            var fecha_actual = dia + "-" + mes + "-" + anio;

            var cod_empresa = '';
            var bd = '';
            var tipo = 'RES';

            var obj = new Object();
            obj.vrgempresa = cod_empresa;
            obj.vrgbaseddatos = bd;
            obj.vrgtipo = tipo;
            obj.vridactividad = '';
            obj.vrgfecha = fecha_actual;
            obj.vrusuario = usuario;
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listar_labor_combinaciones",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    var searchBox = $("#idResponsable_list").dxSelectBox({
                        dataSource: lst,
                        displayExpr: 'CONSUMIDOR',
                        valueExpr: 'CODIGO',
                        placeholder: "Seleccione",
                        noDataText: "Sin Datos",
                        searchEnabled: true,
                        onValueChanged: function (data) {
                            var $result = $(".current-value");

                            if (data.value !== null) {
                                var selectedItem = data.component.option('selectedItem');
                                //alert(selectedItem.NRO_GRUPO + " (ID: " + selectedItem.NRO_GRUPO + ")");
                                // mostramos el grupo
                                $("#idGrupotrabajo_list").text(selectedItem.NRO_GRUPO);
                            }
                        },
                    }).dxSelectBox("instance");

                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });

            // funcion listaR ZONA
            var cod_empresa = '001';
            var bd = 'SUNFRUITS';
            var tipo = 'ZON';

            var obj = new Object();
            obj.vrgempresa = cod_empresa;
            obj.vrgbaseddatos = bd;
            obj.vrgtipo = tipo;
            obj.vridactividad = '';
            obj.vrgfecha = tipo;
            obj.vrusuario = "";
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listar_labor_combinaciones",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    $('#idZona_list').html('<option value="0">Seleccione Cosecha</option>');
                    for (var i = 0; i < lst.length; i++) {
                        var x = document.getElementById("idZona_list");
                        var option = document.createElement("option");
                        option.value = lst[i].idzona;
                        option.text = lst[i].descripcion;
                        x.add(option);
                    }

                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });

            // funcion listaR TURNO
            var cod_empresa = '001';
            var bd = 'SUNFRUITS';
            var tipo = 'TUR';

            var obj = new Object();
            obj.vrgempresa = cod_empresa;
            obj.vrgbaseddatos = bd;
            obj.vrgtipo = tipo;
            obj.vridactividad = '';
            obj.vrgfecha = tipo;
            obj.vrusuario = "";
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listar_labor_combinaciones",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    var searchBox = $("#idTurno_list").dxSelectBox({
                        dataSource: lst,
                        displayExpr: 'DESCRIPCION',
                        valueExpr: 'IDTURNOTRABAJO',
                        placeholder: "Seleccione",
                        noDataText: "Sin Datos",
                        searchEnabled: true,
                    }).dxSelectBox("instance");

                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });
        }

        // funcion listrar coNSUMIDOR
        document.getElementById('idZona_list').onchange = function () {
            var id_zona = this.value;

            var obj = new Object();
            obj.ZID = id_zona;
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listar_zona",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    var searchBox = $("#idConsumidor_list").dxSelectBox({
                        dataSource: lst,
                        displayExpr: 'DESCRIPCION',
                        valueExpr: 'IDCONSUMIDOR',
                        placeholder: "Seleccione",
                        noDataText: "Sin Datos",
                        searchEnabled: true,
                    }).dxSelectBox("instance");

                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });

        }
        document.getElementById('idActividad_list').onchange = function () {
            var id_activ = this.value;


            // funcion listaR LABOR
            var cod_empresa = '001';
            var bd = 'SUNFRUITS';
            var tipo = 'LAB';

            var obj = new Object();
            obj.vrgempresa = cod_empresa;
            obj.vrgbaseddatos = bd;
            obj.vrgtipo = tipo;
            obj.vridactividad = id_activ;
            obj.vrgfecha = "";
            obj.vrusuario = "";
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listar_labor_combinaciones",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    var searchBox = $("#idLabor_list").dxSelectBox({
                        dataSource: lst,
                        displayExpr: 'DESCRIPCION',
                        valueExpr: 'IDLABOR',
                        placeholder: "Seleccione",
                        noDataText: "Sin Datos",
                        searchEnabled: true,
                    }).dxSelectBox("instance");

                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });

        }
        // funcion  limpiar
        function limpiar_campos() {
            $(".dx-texteditor-input").empty();
            $("#idGrupotrabajo_list").empty();
        }

        // funcion  eliminar grupo trabajador
        function eliminar_grupo_trabajador(item_verificar, id) {
            // verificamos el  item
            var item;
            if (item_verificar < 10) {
                item = '00' + item_verificar;
            }
            else if (item_verificar < 100) {
                item = '0' + item_verificar
            } else {
                item = item_verificar
            }

            var di_tareo_detalle_elim = document.getElementById("id_responsable").value;

            var cod_trabajador = $("#dni_di").text();
            var di_tareo_detalle_elim = document.getElementById("id_responsable").value;

            var obj = new Object();
            obj.vdid = id;
            obj.vditem = item;
            obj.vdcodtrabajdor = cod_trabajador;
            obj.vddatostrabajdor = "";
            obj.vdtipo = 3;
            obj.vdmeta = 0;
            obj.vidtareo_detalle = di_tareo_detalle_elim;
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_eliminar_detalle_grupo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.stringify(data.d);
                    var codigo = $('#grupo_num').text() + $('#grupo_meta').text();

                    toastr["success"]("Se Elimino")
                    listar_detalle("iufhvoivjf | " + localStorage.getItem("idGrupo") + " | " + localStorage.getItem("meta") + " | " + localStorage.getItem("nroGrupo"));
                },
                error: function (data) {
                    //alert(JSON.stringify(data));
                    toastr["error"]("No se puede eliminar trabajador");
                }
            });
        }

        // listar  labores  - TARAT DEGUARDAR  LOS DATOS  DE TIPO DE ACTIVIDAD
        function listar_labores() {
            $('#profile-tab2').prop('disabled', true);
            $('#contact-tab5').prop('disabled', true);

            var fecha = $('#fecha_tareo').text();
            var usuario = document.getElementById("usuario_usuario").value;
            // listamos la cabcera de tareo 
            var ID = usuario;
            var fecha_filtro = fecha;
            var tipo = "LIST_LAB_COMB"

            var obj = new Object();
            obj.vtareocabid = ID;
            obj.vtareocabfecha = fecha_filtro;
            obj.vtareocabtipo = tipo;
            obj.vtitem_ini = "";
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listar_tareo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    
                    var lst = JSON.parse(data.d);
                    console.log(lst);
                    if (lst.length > 0) {

                        // CAPTURMAOS LA FCHA
                        var fecha = new Date();
                        var mes = fecha.getMonth() + 1;
                        var dia = fecha.getDate();
                        var anio = fecha.getFullYear();
                        if (dia < 10)
                            dia = '0' + dia;
                        if (mes < 10)
                            mes = '0' + mes

                        var fecha_actual = dia + "/" + mes + "/" + anio;
                        //seteamos
                        $("#list_labores").html('');
                        $("#list_labor_fecha").text(fecha_actual);

                        //vLIDAMO EL ESTADO
                        var estado = "";
                        if (lst[0].CESTADO == "FT") {
                            estado = "ACTIVO";
                        } else {
                            estado = "INACTIVO";
                        }
                        $("#list_labores").html('');
                        var contador = 0;

                        for (var i = 0; i < lst.length; i++) {
                            list_grupo = '';
                            list_grupo += '<a onclick="redireccionar(' + lst[i].TIPO2 + ',' + lst[i].CITEM + ');">';
                            list_grupo += '<div class="col-xl-12 mt-2  rounded border-left-3 border-warning">';
                            list_grupo += '<div class=" text-dark ">';

                            list_grupo += '<div class="row">';
                            list_grupo += '<div class="col-sm-2">';
                            list_grupo += '<label class="form-label"><b>Actividad:</b></label>';
                            list_grupo += '<label class="form-label">' + lst[i].ACTIVIDAD + '</label>';
                            list_grupo += '</div>';
                            list_grupo += '<div class="col-sm-3">';
                            list_grupo += '<label class="form-label"><b>Consumidor:</b></label>';
                            list_grupo += '<label class="form-label">' + lst[i].CONSUMIDOR + '</label>';
                            list_grupo += '</div>';
                            list_grupo += '<div class="col-sm-3">';
                            list_grupo += '<label class="form-label"><b>Responsable:</b></label>';
                            list_grupo += '<label class="form-label">' + lst[i].CDESCRESPONSABLE + '</label>';
                            list_grupo += '</div>';
                            list_grupo += '<div class="col-sm-2">';
                            list_grupo += '<label class="form-label"><b></b></label>';
                            list_grupo += '<label class="form-label" id="idgrupo">' + lst[i].CDESCGRUPO + '</label>';
                            list_grupo += '</div>';
                            list_grupo += '<div class="col-sm-1">';
                            list_grupo += '<label class="form-label"><b>Nª</b></label>';
                            list_grupo += '<label class="form-label" id="idgrupo">' + lst[i].CITEM + '</label>';
                            list_grupo += '</div>';
                            list_grupo += '</div>';

                            list_grupo += '<div class="row">';
                            list_grupo += '<div class="col-sm-3">';
                            list_grupo += '<label class="form-label"><b>Labor:</b></label>';
                            list_grupo += '<label class="form-label">' + lst[i].LABOR + '</label>';
                            list_grupo += '</div>';
                            list_grupo += '<div class="col-sm-2">';
                            list_grupo += '<label class="form-label"><b>Turno:</b></label>';
                            list_grupo += '<label class="form-label">' + lst[i].TURNO + '</label>';
                            list_grupo += '</div>';
                            list_grupo += '<div class="col-sm-2">';
                            list_grupo += '<label class="form-label"><b>Tipo:</b></label>';
                            list_grupo += '<label class="form-label">' + lst[i].TIPO + '</label>';
                            list_grupo += '</div>';
                            list_grupo += '<div class="col-sm-2">';
                            list_grupo += '<label class="form-label"><b>Estado:</b></label>';
                            list_grupo += '<label class="form-label">' + estado + '</label>';
                            list_grupo += '</div>';
                            list_grupo += '</div>';

                            list_grupo += '</div>';
                            list_grupo += '</div>';
                            list_grupo += '</a>';

                            $("#list_labores").append(list_grupo);

                            contador = contador + 1;
                        }

                        /* $('#contact-tab5').click();*/
                        //$('#profile-tab2').click();

                        //$('#home-tab6').click();

                        $("#list_labor_cont").text(contador + " - " + "Reg.");
                    }
                    
                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });
        }

        // juagmos con los tpas
        function redireccionar(tipo, grupo) {
            listar_traba_por_labor(grupo);
            //if (tipo == 1) {
            //    listar_traba_por_labor(grupo);
            //}
            //if (tipo == 2) {
            //    listar_trabajador_labor(grupo);
            //}
        }

        // funcion listrar  trabajdores por albor 
        function listar_traba_por_labor(num_grupo) {
            var cod_tareo = document.getElementById("id_responsable").value;

            // evakuamos lo de almuerzo
            var item_ultim;
            if (num_grupo < 10) {
                item_ultim = "00" + num_grupo;
            } else if (num_grupo < 100) {
                item_ultim = "0" + num_grupo;
            } else {
                item_ultim = num_grupo;
            }

            var obj = new Object();
            obj.trab_x_usuario = cod_tareo;
            obj.trab_x_item = item_ultim;

            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listra_x_labor",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    // rediccionamos seguns i ay datos
                    console.log('aca corrige xd');
                    console.log(lst);
                    if (lst.length == 0) {
                        listar_trabajadores_jornales();
                    } else {
                        console.log('llegó');
                        listar_trabajador_x_labor(num_grupo);
                    }
                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });
        }

        // FUNCION listar   TRABAJADORES POR LABOR
        function listar_trabajadores_jornales() {
            $('#profile-tab2').prop('disabled', false);
            $('#contact-tab5').prop('disabled', true);
            console.log('nelson mandela');
            $("#list_traba_labor_asig").html('<p>No hay datos we</<p>');

            var fecha = document.getElementById("fecha").value;
            var usuario = document.getElementById("usuario_usuario").value;

            // grupos 
            var cod = $('#grupo_num').text();


            var hora_inicio;
            var hora_fin;

            if (hora_inicio == "") {
                hora_inicio = '00:00';
            } else {
                hora_inicio = document.getElementById("hora_inicio_asig").value;
            }

            if (hora_fin == "") {
                hora_fin = '00:00';
            } else {
                hora_fin = document.getElementById("hora_fin_asig").value;
            }


            //var fecha_actual = dia + "/" + mes + "/" + anio;
            $("#trab_por_labor_fecha").text(fecha);

            // validmaos el estado
            var estado = '';
            if (hora_inicio == "" && hora_fin == "") {
                estado = 'PENDIENTE';
            }

            if (hora_inicio != "" && hora_fin != "") {
                estado = 'PENDIENTE';
            }

            var obj = new Object();
            obj.vusuario = usuario;
            obj.vtfehcagrupo = fecha; // agrgar fecha
            obj.vtipo = "LIST_DETA";
            obj.idgrupo = cod;  // codigo
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listar_detalle_grupo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    // CAPTURMAOS LA FCHA
                    var lst = JSON.parse(data.d);
                    if (lst.length > 0) {
                        console.log('2117');
                        console.log(lst);
                        //seteamos
                        $("#list_traba_labor_asig").html('');
                        //alert(typeof data.d + '  ' + data.d);

                        var contador = 0;
                        var rendimeinto_esperado = 0;

                        for (var i = 0; i < lst.length; i++) {

                            rendimeinto_esperado = rendimeinto_esperado + lst[i].META;
                            list_grupo = '';
                            list_grupo += '<div class="col-md-12 mt-2  rounded border-left-3 border-info AA">';
                            list_grupo += '<div class="card">';
                            list_grupo += '<div class="col-xl-12">';

                            list_grupo += '<div class="row">';
                            list_grupo += '<div class="col-sm-6">';
                            list_grupo += '<label><b>Trabajador</b></label>';
                            list_grupo += '<input class="form-control A" type="text" id="datos_trabajador" value="' + lst[i].DATOS_TRAB + '" disabled/>';
                            list_grupo += '<input type="hidden" id="num_grupo_por_trabajador" value="' + lst[i].NRO_GRUPO + '"/>';
                            list_grupo += '</div>';
                            list_grupo += '<div class="col-sm-6">';
                            list_grupo += '<label><b>Numero Documento</b></label>';
                            list_grupo += '<input class="form-control A" type="text" id="id_trab_por_labor" value="' + lst[i].COD_TRAB + '" disabled/>';
                            list_grupo += '</div>';
                            list_grupo += '</div>';

                            list_grupo += '<div class="row">';
                            list_grupo += '<div class="col-sm-3">';
                            list_grupo += '<label for="basic-url"><b>Hora Inicio</b></label>';
                            list_grupo += '<div class="input-group">';
                            list_grupo += '<div class="input-group-prepend">';
                            list_grupo += '<span class="input-group-text" id="basic-addon3"><i class="fa fa-calendar"></i></span>';
                            list_grupo += '<input type="time" class="form-control A" id="comb_trab_hora_inicio" value="' + hora_inicio + '" aria-describedby="basic-addon3">';
                            list_grupo += '</div>';
                            list_grupo += '</div>';
                            list_grupo += '</div>';
                            list_grupo += '<div class="col-sm-3">';
                            list_grupo += '<label for="basic-url"><b>Hora Fin</b></label>';
                            list_grupo += '<div class="input-group">';
                            list_grupo += '<div class="input-group-prepend">';
                            list_grupo += '<span class="input-group-text" id="basic-addon3"><i class="fa fa-calendar"></i></span>';
                            list_grupo += '<input type="time" class="form-control A" id="comb_trab_hora_fin" value="' + hora_fin + '" aria-describedby="basic-addon3">';
                            list_grupo += '</div>';
                            list_grupo += '</div>';
                            list_grupo += '</div>';
                            list_grupo += '<div class="col-sm-2">';
                            list_grupo += '<label for="basic-url"><b>Meta</b></label>';
                            list_grupo += '<div class="input-group mb-3">';
                            list_grupo += '<div class="input-group-prepend">';
                            list_grupo += '<input class="form-control A" type="text" id="id_trab_por_labor" value="' + lst[i].META + '" disabled/>';
                            list_grupo += '</div>';
                            list_grupo += '</div>';
                            list_grupo += '</div>';
                            //list_grupo += '<div class="col-sm-3">';
                            //list_grupo += '<label for="basic-url"><b>Estado</b></label>';
                            //list_grupo += '<div class="input-group mb-3">';
                            //list_grupo += '<div class="input-group-prepend">';
                            //list_grupo += '<input type="button" class="btn btn-warning" id="id_raba_por_labor_indiv" disabled value="' + estado + '"></input>';
                            //list_grupo += '</div>';
                            //list_grupo += '</div>';
                            //list_grupo += '</div>';
                            list_grupo += '<div class="col-sm-1">';
                            list_grupo += '<label for="basic-url"><b>Guardar</b></label>';
                            list_grupo += '<div class="input-group mb-3">';
                            list_grupo += '<div class="input-group-prepend">';
                            list_grupo += '<button type="button" class="btn btn-success" onclick="editar_trabajador_por_labor(' + lst[i].COD_TRAB + ');"><i class="fa fa-refresh"></i></button>';
                            list_grupo += '</div>';
                            list_grupo += '</div>';
                            list_grupo += '</div>';
                            list_grupo += '<div class="col-sm-1">';
                            list_grupo += '<label for="basic-url"><b>Eliminar</b></label>';
                            list_grupo += '<div class="input-group mb-3">';
                            list_grupo += '<div class="input-group-prepend">';
                            list_grupo += '<button type="button" class="btn btn-danger" onclick="editar_trabajador_por_labor(' + lst[i].COD_TRAB + ');"><i class="fa fa-trash"></i></button>';
                            list_grupo += '</div>';
                            list_grupo += '</div>';
                            list_grupo += '</div>';
                            list_grupo += '</div>';

                            list_grupo += '</div>';
                            list_grupo += '</div>';
                            list_grupo += '</div>';

                            $("#list_traba_labor_asig").append(list_grupo);
                            contador = contador + 1;
                        }
                        console.log('2204');
                        console.log(lst);
                        $("#trab_por_labor_num").text(contador + " - " + "Reg.");
                        $("#trab_por_labor_esperado").text(rendimeinto_esperado);
                        $("#valor_esperado_grupo").text(rendimeinto_esperado);

                        //// tambien cargamos el combo BOX
                        var searchBox = $("#list_rend_grupo").dxSelectBox({
                            dataSource: lst,
                            displayExpr: 'DATOS_TRAB',
                            valueExpr: 'D_REND',
                            placeholder: "Seleccione",
                            noDataText: "Sin Datos",
                            searchEnabled: true,
                        }).dxSelectBox("instance");

                        // funcion registrar  para registra datos.
                        var hora_inicio1 = document.getElementById("comb_trab_hora_inicio").value;
                        var hora_fin1 = document.getElementById("comb_trab_hora_fin").value;

                        if (hora_inicio1 != "" && hora_fin1 != "") {
                            registrar_rendimiento_labor_asivo();
                        }
                    }

                    else {
                        console.log('No hay datos en el servicio SER_listar_detalle_grupo');
                    }

                },
                error: function (data) {
                    //alert(JSON.stringify(data));
                    toastr["success"]("ELEGIR UN GRUPO");

                }
            });

            $('#profile-tab2').click();
        }

        //funcion lista r trabajador por labor 
        function listar_trabajador_labor(num_grupo) {

            $('#profile-tab2').prop('disabled', false);
            $('#contact-tab5').prop('disabled', false);
            $('#contact-tab5').tab('show')

            var fecha = new Date();
            var mes = fecha.getMonth() + 1;
            var dia = fecha.getDate();
            var anio = fecha.getFullYear();
            if (dia < 10)
                dia = '0' + dia;
            if (mes < 10)
                mes = '0' + mes

            var fecha_actual = dia + "/" + mes + "/" + anio;
            $('#rend_fecha').text(fecha_actual);

            // obtenemos el grupo
            var num_grupo_final;
            if (num_grupo < 10) {
                num_grupo_final = "00" + num_grupo;
            } else if (num_grupo < 100) {
                num_grupo_final = "0" + num_grupo;
            } else {
                num_grupo_final = num_grupo;
            }

            // listamos la cabecera de tareo 
            var fecha = document.getElementById("fecha").value;
            var usuario = document.getElementById("usuario_usuario").value;
            var tipo = "LIST_LAB_INDIV";

            var obj = new Object();
            obj.vtareocabid = usuario;
            obj.vtareocabfecha = fecha_actual;
            obj.vtareocabtipo = tipo;
            obj.vtitem_ini = num_grupo_final.split(' ').join('');
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listar_tareo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    var contador = 0;
                    var rendimientodiurno = 0;
                    console.log(lst);
                    $("#divtrabajadores_Labor").html('');

                    for (var i = 0; i < lst.length; i++) {
                        rendimientodiurno = rendimientodiurno + lst[i].IRENDIMIENTODIURNO;
                        var trow = '';
                        trow += '<div class="col-xl-12 mt-2  rounded border-left-3 border-success" >';
                        trow += '<div class="row">';

                        trow += '<div class="col-sm-3">';
                        trow += '<div class="card-body text-dark">';
                        trow += '<label><b>Trabajador</b></label>';
                        trow += '<p >' + lst[i].DATOS + '</p>';
                        trow += '</div>';
                        trow += '</div>';

                        trow += '<div class="col-sm-2">';
                        trow += '<div class="card-body text-dark">';
                        trow += '<label><b>DNI</b></label>';
                        trow += '<p id="rend_dni">' + lst[i].CNRODOCUMENTO + '</p>';
                        trow += '</div>';
                        trow += '</div>';

                        trow += '<div class="col-sm-2">';
                        trow += '<div class="card-body text-dark">';
                        trow += '<label><b>H. Registro</b></label>';
                        trow += '<p>' + lst[i].FECHA + ' - ' + lst[i].HORA + '</p>';
                        trow += '</div>';
                        trow += '</div>';

                        trow += '<div class="col-sm-2">';
                        trow += '<div class="card-body text-dark">';
                        trow += '<label><b>R. Diurno</b></label>';
                        trow += '<p id="rend_diurno">' + lst[i].IRENDIMIENTODIURNO + '</p>';
                        trow += '</div>';
                        trow += '</div>';

                        trow += '<div class="col-sm-1">';
                        trow += '<div class="card-body text-dark">';
                        trow += '<label><b>R. Noct</b></label>';
                        trow += '<p id="rent_nocturno">' + lst[i].IRENDIMIENTONOCTURNO + '</p>';
                        trow += '<input type="hidden" id="cod_tareo" value="' + lst[i].CTG30TARID + '"/>';
                        trow += '<input type="hidden" id="cod_id_grupo" value="' + lst[i].CITEMID + '"/>';
                        trow += '</div>';
                        trow += '</div>';

                        trow += '<div class="col-sm-2">';
                        trow += '<div class="card-body text-dark">';
                        trow += '<button type = "button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModal20" onclick="listar_update_avance_trabajador(' + lst[i].CITEM.trim() + ')">';
                        trow += '<i class="fa fa-edit"></i>';
                        trow += '</button>';
                        trow += '</div>';
                        trow += '</div>';

                        trow += '</div>';
                        trow += '</div>';

                        $("#divtrabajadores_Labor").append(trow);

                        contador = contador + 1;
                    }

                    //  mostramos la cantidad de  grupos.
                    $('#trab_por_labor').text(contador + " -  " + "Registros");

                    //$('#profile-tab1').click(); $('#trab_por_labor').text(contador + " -  " + "Registros");
                    $('#cont_rendimiento').text("Rend. " + rendimientodiurno);


                    // asiganmos los avalores  de valor actual y cvlaor esperado
                    $('#valor_actual_grupo').text(rendimientodiurno);

                    // funcion para listar  el inputs de rendiiento MASIVO
                    listar_trabajdores_rend(num_grupo);
                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });



        }

        // funcion listar datos en datos modal de REND
        function listar_trabajdores_rend(num_grupo) {
            var fecha = new Date();
            var mes = fecha.getMonth() + 1;
            var dia = fecha.getDate();
            var anio = fecha.getFullYear();
            if (dia < 10)
                dia = '0' + dia;
            if (mes < 10)
                mes = '0' + mes

            var fecha_actual = dia + "/" + mes + "/" + anio;
            $('#rend_fecha').text(fecha_actual);

            // obtenemos el grupo
            var num_grupo_final;
            if (num_grupo < 10) {
                num_grupo_final = "00" + num_grupo;
            } else if (num_grupo < 100) {
                num_grupo_final = "0" + num_grupo;
            } else {
                num_grupo_final = num_grupo;
            }

            // listamos la cabecera de tareo 
            var fecha = document.getElementById("fecha").value;
            var usuario = document.getElementById("usuario_usuario").value;
            var tipo = "LIST_LAB_INDIV";

            var obj = new Object();
            obj.vtareocabid = usuario;
            obj.vtareocabfecha = fecha_actual;
            obj.vtareocabtipo = tipo;
            obj.vtitem_ini = num_grupo_final.split(" ").join("");
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listar_tareo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    // funcion para listar  el inputs de rendiiento MASIVO
                    var searchBox = $("#list_rend_grupo").dxSelectBox({
                        dataSource: lst,
                        displayExpr: 'DATOS',
                        valueExpr: 'DNI_GRUPO',
                        placeholder: "Seleccione",
                        noDataText: "Sin Datos",
                        searchEnabled: true,
                    }).dxSelectBox("instance");
                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });

        }

        // funcion asiganr hora masiva
        function asignar_hora_masiva() {
            $('#exampleModal5').modal('hide');
            listar_trabajadores_jornales();
            //registrar_rendimiento_labor_asivo();
        }

        // gaudra tareo cabecera
        function guardar_tareo() {
            // obtener los datos de lamtabl
            var fecha = document.getElementById("gFechaDocumento").value;
            var data_responsable = $("#gResponsableSuperior").dxSelectBox('instance').option('selectedItem').ID_RESPONSABLE;
            var responsable = $("#gResponsableSuperior").dxSelectBox('instance').option('selectedItem').NOMBRE;

            var datos_responsable = data_responsable.split("-");
            var cdo_responsable = datos_responsable[0];
            var usuario = datos_responsable[1];

            var fecha_actual = new Date();
            var mes = fecha_actual.getMonth() + 1;
            var dia = fecha_actual.getDate();
            var anio = fecha_actual.getFullYear();
            if (dia < 10)
                dia = '0' + dia;
            if (mes < 10)
                mes = '0' + mes
            var fecha_data = anio + mes + dia;

            var obj = new Object();
            obj.TUSUARIO = usuario;
            obj.TCTG30RESPONSABLE = cdo_responsable;
            obj.TCIDPLANILLA = "HVG";
            obj.TIDSUCURSAL = "001";
            obj.TFECHA = fecha_data;
            obj.TESTADO = "1";
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_registrar_cabecera_tareo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    $('#myModaltareo').modal('hide');

                    // verificamos  que  no regrese vacio
                    if (lst.length === 0) {
                        toastr["error"]("NO SE REGISTRO CABECERA");
                    } else {
                        toastr["success"]("SE REGISTRO CABECERA");
                        // llenamos el ultimo di
                        var id = lst[0].IDREG_ULT_TAREO;
                        document.getElementById("id_ultim_tareo").value = id;
                        listar_tareo_inicio();
                    }

                },
                error: function (data) {
                    alert(JSON.stringify(data));
                    //toastr["success"](" REGISTRADO");
                    //$('#myModaltareo').modal('hide');
                }
            });
        }

        // funcion registrar combinacion labores
        function registrar_combinacion() {
            var fecha = new Date();
            var mes = fecha.getMonth() + 1;
            var dia = fecha.getDate();
            var anio = fecha.getFullYear();
            if (dia < 10)
                dia = '0' + dia;
            if (mes < 10)
                mes = '0' + mes

            var fecha_actual = anio + mes + dia;

            var idactividad = document.getElementById("idActividad_list").value;
            if ($("#idTipoActividad_list").dxSelectBox('instance').option('selectedItem') != null) {
                var idtipo_actividad = $("#idTipoActividad_list").dxSelectBox('instance').option('selectedItem').ID;
                var tipo_activdid = $("#idTipoActividad_list").dxSelectBox('instance').option('selectedItem').DESCRIPCION;
                if ($("#idLabor_list").dxSelectBox('instance').option('selectedItem') != null) {
                    var idlabor = $("#idLabor_list").dxSelectBox('instance').option('selectedItem').IDLABOR;
                    if ($("#idResponsable_list").dxSelectBox('instance').option('selectedItem') != null) {
                        var idresponsable = $("#idResponsable_list").dxSelectBox('instance').option('selectedItem').CODIGO;
                        var dato_responsable = $("#idResponsable_list").dxSelectBox('instance').option('selectedItem').CONSUMIDOR;
                        var grupo_trabajo = $("#idGrupotrabajo_list").text();
                        if ($("#idConsumidor_list").dxSelectBox('instance').option('selectedItem') != null) {
                            var idconsumidor = $("#idConsumidor_list").dxSelectBox('instance').option('selectedItem').IDCONSUMIDOR;
                            if ($("#idTurno_list").dxSelectBox('instance').option('selectedItem') != null) {
                                var idturno = $("#idTurno_list").dxSelectBox('instance').option('selectedItem').IDTURNOTRABAJO;
                                var ID = document.getElementById("id_responsable").value;
                                //var responsable_general = $("#idresponsable_fin_list").dxSelectBox('instance').option('selectedItem').IDRESPONSABLE;

                                // hacemos un split para responsable
                                var dato = dato_responsable.split("-");
                                var responsable = dato[1];
                                var grupo = dato[0];

                                // divimso el grupo
                                var grupo_reg = grupo.split(" ");
                                var grupo_reg2 = grupo_reg[1];

                                // REPOSNABLE  
                                var respo_original = idresponsable.split("-");
                                var numero_grupo_resp = respo_original[0];
                                var numero_dni_respp = respo_original[1];
                                var numero_id_resp = respo_original[2];

                                var numero_id_griupo = numero_id_resp + '.' + fecha_actual + '.' + numero_grupo_resp;
                                // creamos el objeto
                                var obj = new Object();
                                obj.CCTG30TARID = ID;
                                obj.CCTG30ACTID = idactividad;
                                obj.CCIDTURNO = idturno;
                                obj.CCTG30LABID = idlabor;
                                obj.CIDTIPOGENASISTENCIA = idtipo_actividad;
                                obj.CCDESCTIPOGENASISTENCIA = tipo_activdid;
                                obj.CCIDSUPERVISOR = numero_id_resp;
                                obj.CCIDRESPONSABLE = numero_id_resp;
                                obj.CCDESCRESPONSABLE = responsable;
                                obj.CCIDGRUPO = numero_id_griupo;
                                obj.CCCDESCGRUPO = grupo;
                                obj.CCTG30CONSID = idconsumidor;


                                $.ajax({
                                    type: 'POST',
                                    url: "../SerTareo.asmx/SER_registrar_combinaciones",
                                    data: JSON.stringify({ obj: obj }),
                                    dataType: 'json',
                                    contentType: 'application/json; charset=utf-8',
                                    success: function (data) {
                                        var lst = JSON.stringify(data.d);

                                        toastr["success"]("Combinacion Registrada")
                                        listar_labores();
                                        $('#exampleModal3').modal('hide');

                                        // limpiamos los campos.
                                        document.getElementById("idActividad_list").value = "";
                                        $("#idTurno_list").dxSelectBox("instance").option('value', null);
                                        $("#idTipoActividad_list").dxSelectBox("instance").option('value', null);
                                        $("#idLabor_list").dxSelectBox("instance").option('value', null);
                                        $("#idResponsable_list").dxSelectBox("instance").option('value', null);
                                        document.getElementById('idZona_list').value = "";
                                        $("#idConsumidor_list").dxSelectBox("instance").option('value', null);


                                    },
                                    error: function (data) {
                                        //toastr["success"]("SE REGISTRO DATOS");
                                        alert(JSON.stringify(data));
                                        //listar_labores();
                                        //$('#exampleModal3').modal('hide')
                                    }
                                });

                            } else {
                                toastr["error"]("Error al seleccionar TURNO")
                            }
                        } else {
                            toastr["error"]("Error al seleccionar CONSUMIDOR")
                        }
                    } else {
                        toastr["error"]("Error al seleccionar RESPONSABLE")
                    }
                } else {
                    toastr["error"]("Error al seleccionar LABOR")
                }
            } else {
                toastr["error"]("Error al seleccionar TIPO ACTVIDAD")
            }

        }

        // funcion para registrar trabajdor por lavor
        function editar_trabajador_por_labor(dni2) {
            var cod_tareo = document.getElementById("id_responsable").value;
            var dni = dni2;
            console.log(dni);
            var CDitemID = "001";
            var hora_inicio = document.getElementById("comb_trab_hora_inicio").value;
            var hora_fin = document.getElementById("comb_trab_hora_fin").value;

            var obj = new Object();
            obj.LTJCTG20TARID = cod_tareo;
            obj.LTJCTG30TRABID = dni;
            obj.LTJCITEMID = CDitemID;
            obj.LTJDHORAINICIO = hora_inicio;
            obj.LTJDHORAFIN = hora_fin;

            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_editar_jornal_trabajador_indiv",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    toastr["success"]("DATO ACTUALIZADO");
                },
                error: function (data) {
                    //toastr["success"]("SE ACTUALIZO DATOS");
                    alert(JSON.stringify(data));
                }
            });
        }

        // regitsrra rendimeitno
        function registrar_rendimiento_labor() {
            //  REGISTRAMOS
            // asignar  rendimeinto
            var ID = document.getElementById("id_responsable").value;
            var rendimiento = document.getElementById("dato_rendieminto").value;
            var grupo_dni = $("#list_rend_grupo").dxSelectBox('instance').option('selectedItem').DNI_GRUPO;

            //var grupo = $("#idgrupo").text();
            var datos;
            datos = grupo_dni.split("-");
            var dni = datos[0];  // DNI
            var grupo1 = datos[1];  // GRUPO

            var grupo = Number(grupo1);

            var grupo_final;
            if (grupo < 10) {
                grupo_final = "00" + grupo;
            } else if (grupo < 100) {
                grupo_final = "0" + grupo;
            } else {
                grupo_final = grupo;
            }

            var obj = new Object();
            obj.AVCTG30TARID = ID;
            obj.AVCTG30TRABID = dni;
            obj.AVIRENDIMIENTO = rendimiento;
            obj.AVCITEMID = grupo_final; //  +grupo
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_registrar_avance_trab",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    $('#exampleModal6').modal('hide');
                    toastr["success"]("SE REGISTRO RENDIMIENTO");

                    listar_trabajador_labor(grupo);
                },
                error: function (data) {
                    //toastr["success"]("SE REGISTRO DATOS");
                    //$('#exampleModal6').modal('hide');
                    alert(JSON.stringify(data));
                }
            });
        }

        // funcion registrar de formas masiv
        function registrar_rendimiento_labor_asivo() {
            var item_recibido = document.getElementById("num_grupo_por_trabajador").value;

            var item;
            if (item_recibido < 10) {
                item = "00" + item_recibido;
            } else if (item_recibido < 100) {
                item = "0" + item_recibido;
            } else {
                item = "0" + item_recibido;
            }

            // declarmso la varible a recoorer 
            var check = document.querySelectorAll(".AA");

            // variable y contador
            var inputdate = document.getElementsByClassName('A');

            // creamos el arreglo para llenar 
            var basedatos = [];

            // contruimos el OBJETO medinate un constructor
            function Datos(trabajador) {
                this.trabajador = trabajador;
            }

            // RECOREMOS PARA CAPRURA LAS VARIABLES
            var contador_trab = 0;
            check.forEach(function (e) {
                contador_trab = contador_trab + 1;
                // capturmaos las variables nombres del trababajdor
                var trabajador;
                DATOS = [].map.call(inputdate, function (f) {
                    return trabajador = f.value;
                });
            });

            basedatos.push(DATOS);
            var array2 = basedatos[0];
            var contador_arraeglo = array2.length;
            var indice = contador_arraeglo / contador_trab;

            // mostranso ele arreglo segun eñ indice.
            array_nuevo = [];
            for (let i = 0; i < array2.length; i += indice) {
                let pedazo = array2.slice(i, i + indice);
                array_nuevo.push(pedazo);
            }

            //// EJEMPLO PARA DIVIDIR UN ARREGLO EN VARIAS PARTES
            var id_usuario = document.getElementById("id_responsable").value;

            var indcie_registro = contador_arraeglo / 5;
            var hora_ingreso;
            var hora_final;

            console.log(array_nuevo);
            // REGISTRAMOS LOD ADTAOS DE FORMA MANUAL 
            for (i = 0; i < indcie_registro; i++) {
                hora_ingreso = array_nuevo[i][2];
                //var hora_replace = hora_ingreso.replace(":", "");
                //var hora_inicio = hora_replace.trim();

                hora_final = array_nuevo[i][3];
                //var hora_replace_final = hora_final.replace(":", "");
                //var hora_final_final = hora_replace_final.trim();
                alert(hora_final);

                let obj1 = new Object();
                obj1.CTCTG20TARID = id_usuario;
                obj1.CTCTG30TRABID = array_nuevo[i][1];
                obj1.CTCITEM = item;   // numero de grupo
                obj1.CTDHORAINICIO = hora_ingreso;
                obj1.CTDHORAFIN = hora_final;

                $.ajax({
                    type: 'POST',
                    url: "../SerTareo.asmx/SER_registrar_trabajador_por_labor",
                    data: JSON.stringify({ obj: obj1 }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        //var lst = JSON.stringify(data.d);
                        toastr["success"]("REGISTRO MASIVO CON EXITO");
                        $('#myModaltareo').modal('hide');


                        //delete obj1.grade;
                        obj1 = null;
                        //obj1.CTCTG20TARID = 0;
                        //obj1.CTCTG30TRABID = '';
                        //obj1.CTCITEM = '';
                        //obj1.CTDHORAINICIO = '';
                        //obj1.CTDHORAFIN = '';

                    },
                    error: function (data) {
                        alert(JSON.stringify(data));
                        //delete obj1.grade;
                        //obj1 = null;

                    }
                });

                //obj1 = null;
            }



        }

        // FUNCION listar EDITAR  REND TRABAJADOR
        function listar_update_avance_trabajador(item2) {
            // listamos la cabcera de tareo 
            var fecha = document.getElementById("fecha").value;
            var usuario = document.getElementById("usuario_usuario").value;
            var tipo = "LIST_REND_TRA_UP";
            var item;

            // verificmao el item
            if (item2 < 10) {
                item = "000" + item2;
            } else if (item2 < 100) {
                item = "00" + item2;
            } else if (item2 < 1000) {
                item = "0" + item2;
            } else {
                item = item2;
            }


            var obj = new Object();
            obj.LRTcUsuario_up = usuario;
            obj.LRTcFecha_up = fecha;
            obj.LRTtipo_up = tipo;
            obj.LRTitem_up = item.trim();
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listar_rend_trab_up",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    var trabajador = lst[0].DATOS;
                    var dni = lst[0].CNRODOCUMENTO;
                    var fecha = lst[0].HORA;
                    var rdiurno = lst[0].IRENDIMIENTODIURNO;
                    var rnocturno = lst[0].IRENDIMIENTONOCTURNO;
                    var item = lst[0].CITEM;

                    var citemid = lst[0].CITEMID;
                    var cditemid = lst[0].CDITEMID;
                    //  mostramos la cantidad de  grupos.
                    $('#redn_traajador_up').text(trabajador);
                    document.getElementById("rend_dni_up").value = dni;
                    document.getElementById("redn_fecha_hora_up").value = fecha;
                    document.getElementById("rend_diurno_up").value = rdiurno;
                    document.getElementById("rend_nocturno_up").value = rnocturno;

                    document.getElementById("rend_item_up").value = item;

                    document.getElementById("redn_CITEMID_up").value = citemid;
                    document.getElementById("redn_CDITEMID_up").value = cditemid;
                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });

        }

        // registrar edittar rendi eonto trabajdor
        function editar_rendimiento_trabajador() {

            var cod_tareo = document.getElementById("cod_tareo").value;
            var item = document.getElementById("rend_item_up").value;
            var dni = document.getElementById("rend_dni_up").value;
            var rendimiento = document.getElementById("rend_diurno_up").value;

            var itemID = document.getElementById("redn_CITEMID_up").value;
            var CDitemID = document.getElementById("redn_CDITEMID_up").value;

            var grupo = Number(itemID);

            var obj = new Object();
            obj.RTCTG30TARID = cod_tareo;
            console.log(dni);
            obj.CTG30TRABID = dni;
            obj.RTCTG30TRABID = dni;
            obj.RTIRENDIMIENTO = rendimiento;
            obj.RTCITEMID = itemID;
            obj.RTCDITEMID = CDitemID;
            obj.RTCITEM = item;

            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_editar_rend_trabajador",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    toastr["success"]("ACTUALIZACION CORRECTA");
                    $('#exampleModal20').modal('hide');
                    listar_trabajador_labor(grupo);
                },
                error: function (data) {
                    //toastr["success"]("SE ACTUALIZO DATOS");
                    alert(JSON.stringify(data));
                }
            });
        }

        // registrar edittar rendi eonto trabajdor
        function listar_trabajador_x_labor(num_grupo) {
            $('#profile-tab2').prop('disabled', false);
            $('#contact-tab5').prop('disabled', true);

            // validamos los datos
            var num_grupo_final;
            if (num_grupo < 10) {
                num_grupo_final = "00" + num_grupo;
            } else if (num_grupo < 100) {
                num_grupo_final = "0" + num_grupo;
            } else {
                num_grupo_final = num_grupo;
            }

            var cod_tareo = document.getElementById("id_responsable").value;
            //var item = document.getElementById("rend_item_up").value;
            //var dni = $("#rend_dni").text();
            //var rendimiento = document.getElementById("rend_diurno_up").value;

            var obj = new Object();
            obj.trab_x_usuario = cod_tareo;
            obj.trab_x_item = num_grupo_final;

            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_listra_x_labor",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d)
                    console.log('2951');
                    console.log(lst);
                    // vakidmaos el estado 
                    var estado;
                    if (lst[0].IHABILITADO == 1) {
                        estado = "GUARDADO";
                    }
                    //seteamos
                    $("#list_traba_labor_asig_bd").html('');
                    //alert(typeof data.d + '  ' + data.d);
                   // console.log(lst); 

                    for (var i = 0; i < lst.length; i++) {
                        list_grupo = '';
                        list_grupo += '<div class="col-md-12 mt-2  rounded border-left-3 border-info AA">';
                        list_grupo += '<div class="card">';
                        list_grupo += '<div class="col-xl-12">';

                        list_grupo += '<div class="row">';
                        list_grupo += '<div class="col-sm-6">';
                        list_grupo += '<label><b>Trabajador</b></label>';
                        list_grupo += '<input class="form-control A" type="text" id="datos_trabajador" value="' + lst[i].DATOS_PER + '" disabled/>';
                        list_grupo += '<input type="hidden" id="cod_tareo" value="' + lst[i].CTG20TARID + '"/>';
                        list_grupo += '</div>';
                        list_grupo += '<div class="col-sm-6">';
                        list_grupo += '<label><b>Numero Documento</b></label>';
                        list_grupo += '<input class="form-control A" type="text" id="id_trab_por_labor" value="' + lst[i].IDCODIGOGENERAL + '" disabled/>';
                        list_grupo += '<input type="hidden" id="cod_grupo_citemid" value="' + lst[i].CITEMID + '"/>';
                        list_grupo += '</div>';
                        list_grupo += '</div>';

                        list_grupo += '<div class="row">';
                        list_grupo += '<div class="col-sm-3">';
                        list_grupo += '<label for="basic-url"><b>Hora Inicio</b></label>';
                        list_grupo += '<div class="input-group">';
                        list_grupo += '<div class="input-group-prepend">';
                        list_grupo += '<span class="input-group-text" id="basic-addon3"><i class="fa fa-calendar"></i></span>';
                        list_grupo += '<input type="time" class="form-control A" id="comb_trab_hora_inicio" value="' + lst[i].DHORAINICIO + '0' + '" aria-describedby="basic-addon3">';
                        list_grupo += '</div>';
                        list_grupo += '</div>';
                        list_grupo += '</div>';
                        list_grupo += '<div class="col-sm-3">';
                        list_grupo += '<label for="basic-url"><b>Hora Fin</b></label>';
                        list_grupo += '<div class="input-group">';
                        list_grupo += '<div class="input-group-prepend">';
                        list_grupo += '<span class="input-group-text" id="basic-addon3"><i class="fa fa-calendar"></i></span>';
                        list_grupo += '<input type="time" class="form-control A" id="comb_trab_hora_fin" value="' + lst[i].DHORAFIN + '0' + '" aria-describedby="basic-addon3">';
                        list_grupo += '</div>';
                        list_grupo += '</div>';
                        list_grupo += '</div>';
                        //list_grupo += '<div class="col-sm-1">';
                        //list_grupo += '<label for="basic-url"><b>Meta</b></label>';
                        //list_grupo += '<div class="input-group mb-3">';
                        //list_grupo += '<div class="input-group-prepend">';
                        //list_grupo += '<input class="form-control A" type="text" id="id_trab_por_labor" value="" disabled/>';
                        //list_grupo += '</div>';
                        //list_grupo += '</div>';
                        //list_grupo += '</div>';
                        list_grupo += '<div class="col-sm-3">';
                        list_grupo += '<label for="basic-url"><b>Estado</b></label>';
                        list_grupo += '<div class="input-group mb-3">';
                        list_grupo += '<div class="input-group-prepend">';
                        list_grupo += '<input type="button" class="btn btn-warning" id="id_raba_por_labor_indiv" disabled value="' + estado + '"></input>';
                        list_grupo += '</div>';
                        list_grupo += '</div>';
                        list_grupo += '</div>';
                        list_grupo += '<div class="col-sm-1">';
                        list_grupo += '<label for="basic-url"><b>Guardar</b></label>';
                        list_grupo += '<div class="input-group mb-3">';
                        list_grupo += '<div class="input-group-prepend">';
                        list_grupo += '<button type="button" class="btn btn-success" onclick="editar_trabajador_por_labor(' + lst[i].CTG30TRABID +  ');"><i class="fa fa-refresh"></i></button>';
                        list_grupo += '</div>'; 
                        list_grupo += '</div>';
                        list_grupo += '</div>';
                        list_grupo += '<div class="col-sm-1">';
                        list_grupo += '<label for="basic-url"><b>Eliminar</b></label>';
                        list_grupo += '<div class="input-group mb-3">';
                        list_grupo += '<div class="input-group-prepend">';
                        list_grupo += '<button type="button" class="btn btn-danger" onclick="eliminar_trabajador_por_labor(' + lst[i].CTG30TRABID + ',' + lst[i].CITEM + ',' + lst[i].CITEMID + ');"><i class="fa fa-trash"></i></button>';
                        list_grupo += '</div>';
                        list_grupo += '</div>';
                        list_grupo += '</div>';
                        list_grupo += '</div>';

                        list_grupo += '</div>';
                        list_grupo += '</div>';
                        list_grupo += '</div>';

                        $("#list_traba_labor_asig_bd").append(list_grupo);
                    }
                },
                error: function (data) {
                    //toastr["success"]("SE ACTUALIZO DATOS");
                    alert(JSON.stringify(data));
                }
            });

            $('#profile-tab2').click();
        }

        // funcion para elikanr trabasbdor poralbr
        function eliminar_trabajador_por_labor(dni, item, grupo) {
            var cod_tareo = document.getElementById("cod_tareo").value;
            var cod_itemid = document.getElementById("cod_grupo_citemid").value;

            // hacemos una vlaidacion  para el ITEM
            var item_final;
            if (item < 10) {
                item_final = "00" + item;
            } else if (item < 100) {
                item_final = "0" + item;
            } else {
                item_final = item;
            }

            var grupo_dos = Number(grupo);

            // funcion para elminar 
            var obj = new Object();
            obj.jornal_elim_CTG30TARID = cod_tareo;
            obj.jornal_elim_CITEMID = cod_itemid;
            obj.jornal_elim_CTG30TRABID = dni;
            obj.jornal_elim_CITEM = item_final;
            $.ajax({
                type: 'POST',
                url: "../SerTareo.asmx/SER_eliminar_trab_por_jornal",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);

                    toastr["success"]("Trabajador  eliminado correctamente");
                    listar_traba_por_labor(grupo_dos);
                },
                error: function (data) {
                    //toastr["success"]("SE ACTUALIZO DATOS");
                    alert(JSON.stringify(data));
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
