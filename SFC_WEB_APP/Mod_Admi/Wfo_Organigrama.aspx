<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_Organigrama.aspx.cs" Inherits="SFC_WEB_APP.Mod_Admi.Wfo_Organigrama" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" type="text/css" href="../Scripts/org/orgchart.css" />
    <link rel="stylesheet" type="text/css" href="../Scripts/org/orgchart-vertical.css" />
    <link rel="stylesheet" type="text/css" href="../Scripts/org/simple.css" />
    <link rel="stylesheet" href="../scripts/croppie/croppie.min.css">
    <style>
        .ui-autocomplete {
            position: absolute;
            top: 100%;
            left: 0;
            z-index: 1000;
            float: left;
            display: none;
            min-width: 160px;
            _width: 160px;
            padding: 4px 0;
            margin: 2px 0 0 0;
            list-style: none;
            background-color: #ffffff;
            border-color: #ccc;
            border-color: rgba(0, 0, 0, 0.2);
            border-style: solid;
            border-width: 1px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            -webkit-background-clip: padding-box;
            -moz-background-clip: padding;
            background-clip: padding-box;
            *border-right-width: 2px;
            *border-bottom-width: 2px;
        }
        .ui-menu-item > a.ui-corner-all {
            display: block;
            padding: 3px 15px;
            clear: both;
            font-weight: normal;
            line-height: 18px;
            color: #555555;
            white-space: nowrap;
        }
        .ui-state-hover, &.ui-state-active {
              color: #ffffff;
              text-decoration: none;
              background-color: #0088cc !important;
              border-radius: 0px;
              -webkit-border-radius: 0px;
              -moz-border-radius: 0px;
              background-image: none;
            }

        .ui-state-hover,
        .ui-state-active,
        .ui-state-focus {
          text-decoration: none;
          color: #262626;
          background-color: #f5f5f5;
          cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">

    <div class="container">
        <div class="row">
            <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
                <label for="btnBusc">&nbsp;</label>
                <button type="button" runat="server" id="btnadd" class="btn btn-secondary col-12" data-toggle="modal" data-target="#AddItem">
                    <i class="fa fa-plus"></i>Agregar Nuevo
                </button>
            </div>
            <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2">
                <label for="btnBusc">&nbsp;</label>
                <button type="button" runat="server" id="Button1" class="btn btn-secondary col-12" onclick="printDiv();">
                    <i class="fa fa-print"></i>Imprimir
                </button>
            </div>
        </div>
        <br />
        <div class="organigrama ul-mod" id="organigrama"></div>
    </div>
    <div class="modal fade" id="ViewChild" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content modal-sm">
                <div class="modal-header">
                    <h5 class="modal-title" id="title-area">Area</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- <div class="m-2 p-1">
                        <table style="width: 200px;">
                            <tr>
                                <td class="td-left" id="imgtittle">
                                </td>
                                <td>Jefe de Area<br>
                                    <b id="jefe-area"></b>
                                </td>
                            </tr>
                        </table>
                    </div>-->
                    <div class="card m-0">
                        <div id="heading2" class="card-header">
                            <a data-toggle="collapse" href="#accordion2" aria-expanded="false" aria-controls="accordion2" class="card-subtitle lead collapsed small nounderline">Integrantes</a>
                        </div>
                        <div id="accordion2" role="tabpanel" data-parent="#accordionWrapa1" aria-labelledby="heading2" class="collapse show" aria-expanded="false">
                            <div class="card-content">
                                <div class="card-body" id="">
                                    <ul id='childs' class="small" style="padding: 0px"></ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="idview" value="0" />
                    <input type="hidden" id="namefather" value="" />
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" id="SaveItem2" class="btn btn-primary">Agregar</button>
                    <button type="button" class="btn btn-primary" id="addnew" data-toggle="modal" data-target="#AddIntegrante"><i class="fa fa-plus"></i></button>
                </div>
            </div>
        </div>
    </div>



    <div class="modal fade" id="AddItem" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="mtitle2">Nuevo Item</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group p-0 m-0" id="padre">
                                <label for="message-text" class="col-form-label">Father:</label>
                                <asp:DropDownList ID="ddlItems" runat="server" CssClass="form-control" AppendDataBoundItems="true"></asp:DropDownList>
                                <input type="hidden" id="OrgItem">
                                <input type="hidden" id="nNivel">
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label">Item:</label>
                                <input type="text" id="txtItem" value="" class="form-control round" autocomplete="off">
                            </div>

                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label">Info:</label>
                                <input type="text" id="txtInfo" value="" class="form-control round" autocomplete="off">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" id="SaveItem" class="btn btn-primary">Agregar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="AddIntegrante" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="titleIntegrante">Nuevo Item</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group p-0 m-0" id="area">
                                <label for="message-text" class="col-form-label">Father:</label>
                                <asp:DropDownList ID="ddlArea" runat="server" CssClass="form-control" AppendDataBoundItems="true"></asp:DropDownList>
                                <input type="hidden" id="OrgItemint">
                                <input type="hidden" id="nNivelint">
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label">Cargo:</label>
                                <input type="text" id="cDescCargo" value="" class="form-control round" autocomplete="off">
                            </div>

                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label">Nombres:</label>
                                <input type="text" id="cNombres" value="" class="form-control round" autocomplete="off">
                                <input type="hidden" id="nIdPersonal">
                            </div>
                            <div class="form-group mb-1 text-center">
                                <div id="output"></div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div style="padding: 0px">
                                <div class="text-center">
                                    <div id="image_demo" style="height: auto"></div>
                                </div>
                                <button style="margin-left: 20px" class="btn rotate float-lef" data-deg="90">
                                    <i class="fa fa-undo"></i>
                                </button>
                                <button style="margin-right: 20px" class="btn rotate float-right" data-deg="-90">
                                    <i class="fa fa-repeat"></i>
                                </button>
                            </div>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input form-control main-search" id="foto_personal" name="foto_personal" size="5120" haccept="image/*" required>
                                <label class="custom-file-label" for="customFile" style="text-align: left">Seleccionar Imagen</label>
                            </div>
                            <div class="text-center p-1">
                                <button class="btn btn-secondary crop_image">Cortar Imagen</button>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="nIdIntegrante">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" id="SaveIntegrante" class="btn btn-primary">Agregar</button>
                </div>
            </div>
        </div>
    </div>

   <script src="../Scripts/sweetalert2.js"></script>
    <script src="../scripts/croppie/croppie.min.js"></script>
    <script src="../scripts/croppie/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <script> 
        function printDiv() {
            var divContents = document.getElementById("organigrama").innerHTML;
            var a = window.open('', '', 'height=500, width=1200');
            a.document.write('<html><head>');
            a.document.write("<link href=\"../Scripts/org/orgchart.css\" rel=\"stylesheet\"><link href=\"../Scripts/org/orgchart-vertical.css\" rel=\"stylesheet\"><link href=\"../Scripts/org/simple.css\" rel=\"stylesheet\">")
            a.document.write('</head><body >');
            a.document.write(divContents);
            a.document.write('</body></html>');
            a.document.close();
            a.print();
        }
    </script>
    <script>
        $(document).ready(function () {

            $image_crop = $('#image_demo').croppie({
                enableExif: true,
                viewport: {
                    width: 150,
                    height: 150,
                    type: 'square' //circle
                },
                boundary: {
                    width: 160,
                    height: 160
                },
                enableOrientation: true,

            });

            $('.cr-slider-wrap').css("margin-top", "0px");
            $('.cr-slider-wrap').css("margin-bottom", "0px");

            $(document).on('click', '.rotate', function (event) {
                event.preventDefault();
                $image_crop.croppie('rotate', parseInt($(this).data('deg')));
            });

            $('#foto_personal').on('change', function () {
                var reader = new FileReader();
                reader.onload = function (event) {
                    $image_crop.croppie('bind', {
                        url: event.target.result
                    }).then(function () {
                        console.log('jQuery bind complete');
                    });
                }
                reader.readAsDataURL(this.files[0]);
            });

            $(document).on('click', '.crop_image', function (event) {
                event.preventDefault();

                $image_crop.croppie('result', {
                    type: 'canvas',
                    size: 'viewport'
                }).then(function (response) {
                    htmlx = '<img id="fot" src="' + response + '" >';
                    $("#output").html(htmlx);
                });

            });

        });

        $("#cNombres").autocomplete({
            source: function (request, response) {
                var obj = new Object();
                obj.vnidPersonal = 0;
                obj.vcNroDocumento = '';
                obj.vcNombres = $("#cNombres").val();
                obj.vcIdPlanilla = '';
                obj.vcCodigoLabor = '';
                $.ajax({
                    url: "../SerAdmi.asmx/ArrayPersonal",
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
                                label: item.split('-')[2],
                                val: item.split('-')[1],
                                num: item.split('-')[0]
                            }
                        }))
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(textStatus);
                    }
                });
            },
            select: function (event, ui) {
                if (ui.item) {
                    if (ui.item.val != 0) {
                        $('#nIdPersonal').val(ui.item.num);
                    } else {
                        $('#nIdPersonal').val(0);
                    }
                }
            },
            minLength: 2
        });

        var pathArray = window.location.pathname.split('/');
        var origin = window.location.origin;

        var url = origin + '/' + pathArray[0];

        /*(function (global) {
            $(document).ready(function () {

                // using this function to center subModal (width/height)

                let addLinkModalOnShow = function () {
                    let c = $(this).find('.modal-content'),
                        h1 = $(global).height(),
                        h2 = c.height(),
                        w1 = $('#ViewChild .modal-content').width(),
                        w2 = c.width();

                    c.css({ 'margin-top': h1 / 2 - (h2 / 2), 'margin-left': w1 / 2 - (w2 / 2) });
                };

                $(document).on('shown.bs.modal', '.modal#AddItem', addLinkModalOnShow);
            });
        }(window));
        */



        var $image_crop;
        function LoadOrganigrama() {

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdOrganigrama = 1;
            obj.vnIdNivel = 0;
            obj.vnIdNivelMaster = 0;
            $.ajax({
                type: 'POST',
                url: "../SerAdmi.asmx/ListOrganigrama",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    $("#organigrama").html('');
                    var lst = JSON.parse(data.d);
                    var option = "";
                    option += '<option value="0">New Padre</option>';

                    $("#<%=ddlItems.ClientID%>").html('');
                    $("#<%=ddlArea.ClientID%>").html('');


                    for (i = 0; i < lst.length; ++i) {
                        option += '<option value="' + lst[i].nIdNivel + '" nivel="' + lst[i].nNivel + '">' + lst[i].cDesOrgItem + '</option>';

                        img = '<b>' + lst[i].cDesOrgItem + '</b><br>(' + lst[i].childs + ')'
                        var name = "Opentool('tool" + lst[i].nIdNivelMaster + lst[i].nIdNivel + "')";
                        var name2 = "tool" + lst[i].nIdNivelMaster + lst[i].nIdNivel;
                        btn1 = "<button class='edit btn btn-link yellow m-0 p-0 pl-1 pr-1' alt='editar' idorg='" + lst[i].nIdOrganigrama + "' idcg='" + lst[i].nIdNivel + "' idft='" + lst[i].nIdNivelMaster + "'><i class='fas fa-edit'></i></button></td>&nbsp;";
                        btn2 = "<button class='delete btn btn-link red m-0 p-0 pl-1 pr-1' alt='eliminar' idorg='" + lst[i].nIdOrganigrama + "' idcg='" + lst[i].nIdNivel + "' idft='" + lst[i].nIdNivelMaster + "'><i class='fas fa-trash'></i></button></td>&nbsp;";
                        btn3 = "<button class='child btn btn-link blue m-0 p-0 pl-1 pr-1' alt='agregar hijo' idorg='" + lst[i].nIdOrganigrama + "' idcg='" + lst[i].nIdNivel + "' NameFather='" + lst[i].cDesOrgItem + "' idft='" + lst[i].nIdNivelMaster + "' ><i class='fas fa-child'></i></button></td>&nbsp;";
                        btn4 = "<button class='view btn btn-link blue m-0 p-0 pl-1 pr-1' alt='ver info' idorg='" + lst[i].nIdOrganigrama + "' idcg='" + lst[i].nIdNivel + "' NameFather='" + lst[i].cDesOrgItem + "' idft='" + lst[i].nIdNivelMaster + "' title='" + lst[i].cDesOrgItem + "' repr='" + lst[i].cDesInfoItem + "' img='" + lst[i].cImg + "'><i class='fas fa-eye'></i></button></td>&nbsp;";
                        btn = '<span class="popuptext" id="' + name2 + '"> ' + btn1 + btn2 + btn3 + btn4 + ' </span>';
                        btnah = '<span class="popuptext" id="' + name2 + '"> ' + btn1 + btn2 + btn4 + ' </span>';


                        if ($("#" + lst[i].IdNivel).length == 0) {
                            if ($("#orgchart").length == 0) {
                                $("#organigrama").html('<div class="centered"><ul class="orgchart" id="orgchart"><li class="root"><div class="nodecontent"><a  href="#" class="popup" onclick="' + name + '">' + img + btn + "</a></div><ul style='display: none' id='" + lst[i].nIdNivel + "'></ul></li></ul></div>");
                            } else if ($("#" + lst[i].nIdNivel).length == 0 && lst[i].nIdNivelMaster == 0) {
                                $("#orgchart").append('<li class="node"><div class="nodecontent"><a href="#" class="popup" onclick="' + name + '">' + img + btn + "</a></div><ul style='display: none' id='" + lst[i].nIdNivel + "'></ul></li>");

                            } else if (lst[i].nNivel >= 4) {
                                $("#" + lst[i].nIdNivelMaster).show();
                                $("#" + lst[i].nIdNivelMaster).append('<li class="leaf"><div class="nodecontent"><a href="#" class="popup" onclick="' + name + '">' + img + btnah + "</a></div><ul style='display: none' id='" + lst[i].nIdNivel + "'></ul></li>");
                            } else if (lst[i].Areas == 0) {
                                $("#" + lst[i].nIdNivelMaster).show();
                                $("#" + lst[i].nIdNivelMaster).append('<li class="leaf"><div class="nodecontent"><a href="#" class="popup" onclick="' + name + '">' + img + btn + "</a></div><ul style='display: none' id='" + lst[i].nIdNivel + "'></ul></li>");
                            } else if (lst[i].nNivel >= 3) {
                                $("#" + lst[i].nIdNivelMaster).show();
                                $("#" + lst[i].nIdNivelMaster).append('<li class="vertical"><div class="nodecontent"><a href="#" class="popup" onclick="' + name + '">' + img + btn + "</a></div><ul style='display: none' id='" + lst[i].nIdNivel + "'></ul></li>");
                            } else {
                                $("#" + lst[i].nIdNivelMaster).show();
                                $("#" + lst[i].nIdNivelMaster).append('<li class="node"><div class="nodecontent"><a href="#" class="popup" onclick="' + name + '">' + img + btn + "</a></div><ul style='display: none' id='" + lst[i].nIdNivel + "'></ul></li>");
                            }
                        } else {
                            $("#" + lst[i].nIdNivelMaster).show();
                            $("#" + lst[i].nIdNivelMaster).append('<li class="node"><div class="nodecontent"><a href="#" class="popup" onclick="' + name + '">' + img + btn + "</a></div><ul style='display: none' id='" + lst[i].nIdNivel + "'></ul></li>");
                        }
                    }


                    $("#<%=ddlItems.ClientID%>").append(option);
                    $("#<%=ddlArea.ClientID%>").append(option);
                },
                error: function (error) {
                    toastr.error(JSON.stringify(error), '');
                }
            });
        };

        LoadOrganigrama();

        $("#<%=ddlItems.ClientID%>").change(function () {
            $('#OrgItem').val(0);
        });



        $(document).on('click', '#SaveItem', function (event) {
            event.preventDefault();

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdOrganigrama = 1;
            obj.vnIdNivel = $('#OrgItem').val();
            obj.vnIdNivelMaster = $("#<%=ddlItems.ClientID%>").val();
            if ($('#OrgItem').val() != 0) {
                obj.vnNivel = $("#<%=ddlItems.ClientID%>").find('option:selected').attr('nivel');
            } else {
                var niv = $("#<%=ddlItems.ClientID%>").find('option:selected').attr('nivel');
                obj.vnNivel = parseInt(niv) + 1;
            }
            obj.vcImg = "";
            obj.vcNomOrg = "";
            obj.vcDesOrgItem = $('#txtItem').val();
            obj.vcDesInfoItem = $('#txtInfo').val();
            if (obj.vcIdEmpresa != "" && obj.vnIdOrganigrama != '' && obj.vnIdNivel != '' && obj.vnIdNivelMaster != '' && obj.vcDesOrgItem != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerAdmi.asmx/RegiOrganigrama",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst != '') {
                            switch (lst[0].regi) {
                                case 0:
                                    toastr.success('', 'Agregado');
                                    LoadOrganigrama();

                                    var obj2 = new Object();
                                    obj2.vcIdEmpresa = fuGetCdEmpre();;
                                    obj2.vnIdOrganigrama = obj.vnIdOrganigrama;
                                    obj2.vnIdNivel = 0;
                                    obj2.vnIdNivelMaster = $("#<%=ddlItems.ClientID%>").val();
                                    view_dat(obj2);

                                    $('#OrgItem').val(0);
                                    $("#<%=ddlItems.ClientID%>").val(0).change();
                                    $("#output").html('');
                                    $('#txtItem').val(lst[0].cDesOrgItem);
                                    $('#txtInfo').val(lst[0].cDesInfoItem);
                                    $('#AddItem').modal('hide');
                                    limpiar();
                                    break;
                                default:
                                    toastr.warning('ERROR', 'Verificar');
                                    break;
                            }

                        } else {
                            toastr.error(lst, 'ERROR');
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

        $(document).on('click', '#SaveIntegrante', function (event) {
            event.preventDefault();

            var objint = new Object();
            objint.vcIdEmpresa = fuGetCdEmpre();
            objint.vnIdIntegrante = $("#nIdIntegrante").val();
            objint.vnIdNivel = $("#idview").val();

            if ($("#fot").attr("src") == null) {
                objint.vcImg = "";
            } else {
                objint.vcImg = $("#fot").attr("src");
            }
            objint.vnidPersonal = $("#nIdPersonal").val();;
            objint.vcDescCargo = $('#cDescCargo').val();
            if (objint.vcIdEmpresa != "" && objint.vnIdNivel != '' && objint.vnidPersonal != '' && objint.vcDescCargo != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerAdmi.asmx/RegiIntegrante",
                    data: JSON.stringify({ obj: objint }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst != '') {
                            switch (lst[0].regi) {
                                case 0:
                                    toastr.success('', 'Agregado');
                                    LoadOrganigrama();

                                    var obj2 = new Object();
                                    obj2.vcIdEmpresa = fuGetCdEmpre();;
                                    obj2.vnIdIntegrante = 0;
                                    obj2.vnIdNivel = $("#<%=ddlArea.ClientID%>").val();
                                            obj2.nIdPersonal = 0;
                                            view_dat(obj2);

                                            $("#<%=ddlArea.ClientID%>").val(0).change();
                                            $("#outputint").html('');
                                            $("#nIdPersonal").val(0);
                                            $("#cNombres").val('');
                                            $('#cDescCargo').val('');
                                            $('#AddIntegrante').modal('hide');
                                            limpiar();
                                            break;
                                        default:
                                            toastr.warning('ERROR', 'Verificar');
                                            break;
                                    }

                                } else {
                                    toastr.error(lst, 'ERROR');
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


        $(document).on('click', '.edit', function (event) {
            event.preventDefault();
            limpiar();
            $("#padre").hide();
            $("#SaveItem").text('Actualizar');
            $("#mtitle").text('Actualizar');

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();;
            obj.vnIdOrganigrama = $(this).attr('idorg');
            obj.vnIdNivel = $(this).attr('idcg');
            obj.vnIdNivelMaster = $(this).attr('idft');
            $.ajax({
                type: 'POST',
                url: "../SerAdmi.asmx/ListOrganigrama",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    $('#OrgItem').val(lst[0].nIdNivel);
                    $("#<%=ddlItems.ClientID%>").val(lst[0].nIdNivelMaster);
                    $("#output").html('');
                    htmlx = '<img id="fot" src="/Img/avatar/' + lst[0].cImg + '" width="150px" heigth="150px">';
                    $("#output").html(htmlx);
                    $('#txtItem').val(lst[0].cDesOrgItem);
                    $('#txtInfo').val(lst[0].cDesInfoItem);

                    $('#AddItem').modal('show');
                }
            });
        });

        function version() {
            return Math.floor(Math.random() * 394) + 79;
        }

        $(document).on('click', '.editint', function (event) {
            event.preventDefault();
            limpiar();
            $("#padre").hide();
            $("#SaveItem").text('Actualizar');
            $("#mtitle").text('Actualizar');

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();;
            obj.vnIdIntegrante = $(this).attr('idInt');
            obj.vnIdNivel = $(this).attr('idNivel');
            obj.vnIdPersonal = $(this).attr('idPersonal');
            $.ajax({
                type: 'POST',
                url: "../SerAdmi.asmx/ListIntegrante",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    $("#<%=ddlArea.ClientID%>").val(lst[0].nIdNivel);
                    $("#outputint").html('');
                    htmlx = '<img id="fotint" src="/Img/avatar/' + lst[0].cImg + '" width="150px" heigth="150px">';
                    $("#outputint").html(htmlx);

                    $("#nIdIntegrante").val(lst[0].nIdIntegrante);
                    $("#nIdPersonal").val(lst[0].nIdPersonal);
                    $('#cNombres').val(lst[0].cNombres);
                    $('#cDescCargo').val(lst[0].cDescCargo);
                    $('#area').hide();

                    $('#AddIntegrante').modal('show');
                }
            });
        });

        $(document).on('click', '.child', function (event) {
            event.preventDefault();
            limpiar();
            $("#padre").hide();
            $('#OrgItem').val(0);
            $("#<%=ddlItems.ClientID%>").val($(this).attr('idcg'));
            $("#SaveItem").text('Agregar');
            $("#mtitle").text('Agregar Sub Item de ' + $(this).attr('NameFather'));

            $('#AddItem').modal('show');

        });

        $(document).on('click', '#addnew', function (event) {
            event.preventDefault();
            limpiar();
            $("#area").hide();
            $('#OrgItem').val(0);
            $('#nIdIntegrante').val(0);
            $("#<%=ddlArea.ClientID%>").val($('#idview').val());
            $("#SaveItem").text('Agregar');
            $("#titleIntegrante").text('Agregar Integrante de ' + $("#<%=ddlArea.ClientID%> option:selected").text());

            // $('#AddItem').modal('show');

        });


        $(document).on('click', '.view', function (event) {
            event.preventDefault();
            limpiar();
            //  $("#padre").hide();
            $("#SaveItem2").hide();
            $("#mtitle").text('ver info');

            var element = document.getElementById("accordion2");
            //  element.classList.remove("show");

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();;
            obj.vnIdIntegrante = 0;
            obj.vnIdNivel = $(this).attr('idcg');
            obj.vnidPersonal = 0;

            title = $(this).attr('title');
            repr = $(this).attr('repr');

            img = $(this).attr('img');

            $("#title-area").html(title);
            // $("#jefe-area").html(repr);
            //$("#imgtittle").html('<img src="' + url + '/Img/avatar/' + img + '" width="30px" heigth="30px">');
            $("#idview").val(obj.vnIdNivel);
            $("#namefather").val(title);
            $("#childs").html('');
            view_dat(obj)
            $('#ViewChild').modal('show');
        });

        function view_dat(obj22) {
            $.ajax({
                type: 'POST',
                url: "../SerAdmi.asmx/ListIntegrante",
                data: JSON.stringify({ obj: obj22 }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    var htmlx22 = ''
                    for (i = 0; i < lst.length; ++i) {

                        imgv = url + '/Img/avatar/' + lst[i].cImg;

                        img1 = '<table style="width: 300px;"><tr><td class="td-left"><img src="' + imgv + '?' + version() + '" width="30px" heigth="30px"></td><td><b>' + lst[i].cDescCargo + '</b><br>' + lst[i].cNombres + '</td></tr></table>'
                        var nameext = "Opentool('toolext" + lst[i].nIdNivel + lst[i].nIdPersonal + "')";
                        var name2ext = "toolext" + lst[i].nIdNivel + lst[i].nIdPersonal;
                        btn11 = "<button class='editint btn btn-link yellow m-0 p-0 pl-1 pr-1' alt='editar' idInt='" + lst[i].nIdIntegrante + "' idNivel='" + lst[i].nIdNivel + "' idPersonal='" + lst[i].nIdPersonal + "'><i class='fas fa-edit'></i></button></td>&nbsp;";
                        btn21 = "<button class='deleteint btn btn-link red m-0 p-0 pl-1 pr-1' alt='eliminar' idInt='" + lst[i].nIdIntegrante + "' idNivel='" + lst[i].nIdNivel + "' idPersonal='" + lst[i].nIdPersonal + "'><i class='fas fa-trash'></i></button></td>&nbsp;";
                        btn3 = '<span class="popuptext" id="' + name2ext + '"> ' + btn11 + btn21 + ' </span>';

                        htmlx22 += '<li class="li-point"><a href="#" class="popup" onclick="' + nameext + '">' + img1 + btn3 + '</a></li>';

                    }
                    $("#childs").html(htmlx22);


                }
            });
        }

        $(document).on('click', '.delete', function (event) {
            event.preventDefault();
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();;
            obj.vnIdOrganigrama = $(this).attr('idorg');
            obj.vnIdNivel = $(this).attr('idcg');
            obj.vnIdNivelMaster = $(this).attr('idft');
            Swal.fire({
                title: '¿Esta seguro que desea Eliminar ?',
                text: "Se Eliminara de forma Permanente",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si, eliminar!',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.value) {
                    $.ajax({
                        type: 'POST',
                        url: "../SerAdmi.asmx/DeleteItem",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            if (lst[0].child == 0) {
                                toastr.success('', 'ELIMINADO')
                                LoadOrganigrama();
                            } else {
                                toastr.warning('Contiene ' + lst[0].child + ' sub Items', 'NO SE PUEDE ELIMINAR')
                            }
                        }
                    });
                }
            });

        });

        $(document).on('click', '.deleteint', function (event) {
            event.preventDefault();
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();;
            obj.vnIdIntegrante = $(this).attr('idInt');
            obj.vnIdNivel = $(this).attr('idNivel');
            obj.vnIdPersonal = $(this).attr('idPersonal');
            Swal.fire({
                title: '¿Esta seguro que desea Eliminar ?',
                text: "Se Eliminara de forma Permanente",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si, eliminar!',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.value) {
                    $.ajax({
                        type: 'POST',
                        url: "../SerAdmi.asmx/DeleteIntegrante",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            toastr.success('', 'ELIMINADO');
                            var obj2 = new Object();
                            obj2.vcIdEmpresa = fuGetCdEmpre();;
                            obj2.vnIdIntegrante = 0;
                            obj2.vnIdNivel = obj.vnIdNivel;
                            obj2.vnIdPersonal = 0;
                            view_dat(obj2)
                            LoadOrganigrama();
                        }
                    });
                }
            });

        });

        $(".custom-file-input").on("change", function () {
            var fileName = $(this).val().split("\\").pop();
            $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
        });


        $(document).on('click', '#cancel', function () {
            // limpiarlabel();
        });

        function Opentool(id) {
            var popup = document.getElementById(id);
            popup.classList.toggle("show");
            // setTimeout(, 2000);
            setTimeout(function () { popup.classList.remove("show") }, 5000);
        }


        $(document).on('click', '.popup', function (event) {
            event.preventDefault();
        });

        $(document).on('click', '#cambiar', function (event) {
            event.preventDefault();

            $('#upload_img').show();
            $('#cambiar').hide();
            $('#Foto').text("");
            $('#imagev').html("");
            clearTimeout(clear);
        });


        $("#<%=btnadd.ClientID%>").click(function () {
            limpiar();
            $("#<%=ddlItems.ClientID%>").val(0);
            $('#OrgItem').val(0);
            $("#padre").show();
            $("#SaveItem").text('Agregar');
            $("#mtitle").text('Agregar Nueva Area');
        });

        function limpiar() {
            $("#output").html('');
            $("#outputint").html('');
            $('#txtItem').val('');
            $('#txtInfo').val('');
        };



    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
