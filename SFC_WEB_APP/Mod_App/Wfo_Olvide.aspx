<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_Olvide.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_Olvide" %>

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
    <link href="../Content/bootstrapPers.min.css" rel="stylesheet" />
    <link href="<%=ResolveUrl("~/Content/feather.css")%>" rel="stylesheet" />
    <%: Scripts.Render("~/jquery") %>
</head>
<body class="vertical-layout vertical-menu-modern 1-column  bg-full-screen-image blank-page blank-page" data-open="click" data-menu="vertical-menu-modern" data-col="1-column">
    
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
                                        <img src="../Img/e-sun_logo-min.png" alt="branding logo" />
                                    </div>
                                </div>
                                <div class="card-content">
                                    <p class="card-subtitle line-on-side text-muted text-center font-small-3 mx-2 my-1"><span>Olvidé mi contraseña</span></p>
                                    <div class="card-body">
                                        <form class="form-horizontal" ir="frmLogin" runat="server">
                                            <fieldset class="form-group position-relative has-icon-left">
                                                <input type="text" class="form-control" id="txtcdUser" placeholder="Ingrese su DNI" required="required" autocomplete="off" />
                                                <div class="form-control-position">
                                                    <i class="ft-user"></i>
                                                </div>
                                            </fieldset>
                                            
                                            <button type="submit"  id="btnLogin" class="btn btn-outline-primary btn-block">&nbsp;Enviame un link</button>
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
    <script src="<%=ResolveUrl("~/Scripts/vendors.min.js") %>"></script>
</body>
</html>
