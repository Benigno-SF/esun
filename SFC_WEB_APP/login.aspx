<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SFC_WEB_APP.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui" />
    <link rel="shortcut icon" type="image/x-icon" href="<%=ResolveUrl("~/Img/favicon.ico")%>" />
    <title>e-Sun Login</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet" />

    <style>
        .modal.right .modal-dialog {
            position: fixed;
            margin: auto;
            width: 320px;
            top: 45px;
            -webkit-transform: translate3d(0%, 0, 0);
            -ms-transform: translate3d(0%, 0, 0);
            -o-transform: translate3d(0%, 0, 0);
            transform: translate3d(0%, 0, 0);
        }

        .modal.right .modal-content {
            height: 100%;
            overflow-y: auto;
        }

        .modal.right .modal-body {
            padding: 15px 15px 80px;
        }

        .modal.right.fade .modal-dialog {
            right: -320px;
            -webkit-transition: opacity 0.3s linear, left 0.3s ease-out;
            -moz-transition: opacity 0.3s linear, left 0.3s ease-out;
            -o-transition: opacity 0.3s linear, left 0.3s ease-out;
            transition: opacity 0.3s linear, left 0.3s ease-out;
        }

        .modal.right.fade.show .modal-dialog {
            right: 0;
        }
    </style>
    <%: Styles.Render("~/Content/css") %>
    <link href="Content/bootstrapPers.min.css" rel="stylesheet" />
    <link href="<%=ResolveUrl("~/Content/feather.css")%>" rel="stylesheet" />
    <%: Scripts.Render("~/jquery") %>
</head>
<body class="vertical-layout vertical-menu-modern 1-column  bg-full-screen-image blank-page blank-page" data-open="click" data-menu="vertical-menu-modern" data-col="1-column">
    <div class="fixed-top">
        <div class="text-right">
            <button type="button" id="btnMenu" class="btn btn-outline-light bt-col">
                <i class="fa fa-th fa-2x"></i>
            </button>
        </div>
    </div>
    <div class="app-content content">
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <section class="flexbox-container">
                    <div class="col-12 d-flex align-items-center justify-content-center">
                        <div class="col-lg-4 col-md-8 col-10 box-shadow-2 p-0">
                            <div class="card border-grey border-lighten-3 px-1 py-1 m-0">
                                <div class="card-header border-0">
                                    <div class="card-title text-center">
                                        <img src="Img/e-sun_logo-min.png" alt="branding logo" />
                                    </div>
                                </div>
                                <div class="card-content">
                                    <p class="card-subtitle line-on-side text-muted text-center font-small-3 mx-2 my-1"><span>Datos de Cuenta</span></p>
                                    <div class="card-body">
                                        <form class="form-horizontal" ir="frmLogin" runat="server">
                                            <fieldset class="form-group position-relative has-icon-left">
                                                <input type="text" class="form-control" id="txtcdUser" runat="server" placeholder="Ingrese su Usuario" required="required" autocomplete="off" />
                                                <div class="form-control-position">
                                                    <i class="ft-user"></i>
                                                </div>
                                            </fieldset>
                                            <fieldset class="form-group position-relative has-icon-left">
                                                <input type="password" class="form-control" id="txtPass" runat="server" placeholder="Ingrese su Contraseña" required="required" />
                                                <div class="form-control-position">
                                                    <i class="fa fa-key"></i>
                                                </div>
                                            </fieldset>
                                            <div class="form-group row">
                                                <div class="col-sm-6 col-12 text-center text-sm-left pr-0">
                                                    <fieldset>
                                                        <input type="checkbox" id="chkRemember" runat="server" class="chk-remember" />
                                                        <label for="remember">Recuerdame</label>
                                                    </fieldset>
                                                </div>
                                                <div class="col-sm-6 col-12 float-sm-left text-center text-sm-right"><a href="#" class="card-link">Olvide mi Contraseña</a></div>
                                            </div>
                                            <div runat="server" id="DivAlert" class="alert alert-danger col-12">
                                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                <strong>¡Error!</strong> Datos incorrectos.
                                            </div>
                                            <div runat="server" id="DivBlock" class="alert alert-warning col-12">
                                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                <strong>¡Login!</strong> Usuario Bloqueado, por favor contactese con su administrador.
                                            </div>
                                            <button type="submit" runat="server" id="btnLogin" class="btn btn-outline-primary btn-block" onserverclick="btnLogin_ServerClick"><i class="ft-unlock"></i>&nbsp;Iniciar Sesión</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>

    <div class="modal right fade" id="dvAppMenu" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="false">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row text-center">
                        <div class="col">
                            <a href="Mod_App/Wfo_Asistencia.aspx" class="text-dark text-center"><i class="fas fa-clock"></i><br />Asistencia</a>
                        </div>
                        <div class="col">
                            <a href="Mod_App/Wfo_MonitorComedor.aspx" class="text-dark text-center"><i class="fas fa-utensils"></i><br />Comedor</a>
                        </div>
                        <div class="col">
                            <a href="Mod_App/Wfo_MoniLine.aspx" class="text-dark text-center"><i class="fa fa-tv"></i><br />Moni Lineas</a>
                        </div>
                        <div class="col">
                            <a href="Mod_App/Wfo_TicketRegi.aspx" class="text-dark text-center"><i class="fas fa-ticket-alt"></i><br />Tickets Comedor</a>
                        </div>
                        <div class="col">
                            <a href="Mod_App/Wfo_TicketRendimiento.aspx" class="text-dark text-center"><i class="fas fa-ticket-alt"></i><br />Tickets Rendimiento</a>
                        </div>
                        <div class="col">
                            <a href="Mod_App/Wfo_MoniRend.aspx" class="text-dark text-center"><i class="fa fa-tv"></i><br />Moni Rendimiento</a>
                        </div>
                        <div class="col">
                            <a href="Mod_App/Wfo_MoniAbastecimiento.aspx" class="text-dark text-center"><i class="fa fa-cubes"></i><br />Panel Abasteciminiento</a>
                        </div>
                        <div class="col">
                            <a href="Mod_App/Wfo_MoniIngresoCamionesMP.aspx" class="text-dark text-center"><i class="fa fa-truck"></i><br />Panel Ing. Camiones MP</a>
                        </div>
                        <div class="col">
                            <a href="Mod_App/Wfo_EspEmbalaje.aspx" class="text-dark text-center"><i class="fa fa-list"></i><br />Especificaciones Embalaje</a>
                        </div>
                        <div class="col">
                            <a href="Mod_App/Wfo_Comparaciontickets.aspx" class="text-dark text-center"><i class="fas fa-barcode"></i><br />Verificación de tickets</a>
                        </div>
                        <div class="col">
                            <a href="Mod_App/Wfo_ConsultaRendimiento.aspx" class="text-dark text-center"><i class="fas fa-barcode"></i><br />Ver Rendimiento</a>
                        </div>
                        <div class="col">
                            <a href="http://192.168.20.5:90" class="text-dark text-center"><i class="fas fa-vial"></i><br />Beta SF</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $("#btnMenu").click(function () {
            $('#dvAppMenu').modal('show');
            $(".modal-backdrop").hide();
        });
    </script>
    <script src="<%=ResolveUrl("~/Scripts/vendors.min.js") %>"></script>
</body>
</html>
