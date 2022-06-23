<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_Archivos.aspx.cs" Inherits="SFC_WEB_APP.Mod_Agro.Wfo_Archivos" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css" />
    
        <style>
        .table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        .tr-nopm tbody tr td {
            padding: 5px;
          /*  text-align: center;*/
            font-size: small;
        }

        .tr-nopm thead tr th {
            padding: 6px;
            margin: 6px;
        }

   .modal-content {
    height: 90vh;
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
            <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-3">
                <label for="btnBusc">&nbsp;</label>
                <button type="button" id="tDocumento" class="btn btn-secondary col-12" data-toggle="modal" data-target="#AddTipoDoc">
                    <i class="fa fa-plus"></i>Tipo de Documento
                </button>
            </div>
           <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-2" style="display: none">
                <label for="btnBusc">&nbsp;</label>
                <button type="button" id="btntest" class="btn btn-secondary col-12" data-toggle="modal" data-target="#sda">
                    <i class="fa fa-plus"></i>Agregar Nuevo
                </button>
            </div>

        </div>
        <br />
        <div class="col-md-12">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body">
                            <h4 class="card-title info">DOCUMENTOS</h4>
                            <div class="row">
                                    <table id="tblFiles" class="table table-striped  tr-nopm">
                                        <thead>
                                            <tr>
                                                <th>Titulo</th>
                                                <th>Numero</th>
                                                <th>Serie</th>                                                
                                                <th>Referencia</th>
                                                <th>Cliente / Proveedor</th>
                                                <th>Tipo</th>
                                                <th>Fecha</th>
                                                <th>File</th>
                                                <th>ver</th>
                                                <th><i class='fas fa-download grey'></i></th>
                                                <th>#</th>
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
    <div class="modal fade" id="AddItem" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="titleDocumento">Nuevo Documento</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label">Titulo:</label>
                                <input type="text" id="ctitulo" name="ctitulo" value="" class="form-control round" autocomplete="off">
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label">Descripcion:</label>
                                <input type="text" id="cDescripcion" name="cDescripcion" value="" class="form-control round" autocomplete="off">
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label">Cliente/Proveedor:</label>
                                <asp:DropDownList id="ddlCliente" name="ddlCliente" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                                                       <br />
                            <label for="message-text" class="col-form-label">Archivo:</label>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input form-control main-search" id="archivo" name="archivo" accept=".xlsx, .xls, image/*, .doc, .docx, .ppt, .pptx, .txt, .pdf, .dwg" required>
                                <input type="hidden" id="fileb64"/>
                                <input type="hidden" id="fileext"/>
                                <input type="hidden" id="namefile"/>
                                <label class="custom-file-label" for="customFile" style="text-align: left">Seleccionar Archivo</label>
                                
                            </div>
                            <input type="hidden" class="" id="filexx" name="filexx" accept=".xlsx, .xls, image/*, .doc, .docx, .ppt, .pptx, .txt, .pdf, .dwg" multiple required>
                            <br />
                            <br />
                            <div class="form-check" style="display: none">
                                <input class="form-check-input" type="checkbox" value="1" id="bpublico" name="bpublico" checked>
                                <label class="form-check-label" for="publico">
                                    es publico?
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="1" id="bdownload" name="bdownload" checked>
                                <label class="form-check-label" for="descargar">
                                    se puede descargar?
                                </label>
                            </div>
                            

                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label">Tipo de Documento:</label>
                                <asp:DropDownList id="ddlTipoDoc" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label">Numero:</label>
                                <input type="text" id="nNumero" value="" class="form-control round" autocomplete="off">
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label">Serie:</label>
                                <input type="text" id="nSerie" value="" class="form-control round" autocomplete="off">
                            </div>
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label">Referencia:</label>
                                <input type="text" id="cReferencia" value="" class="form-control round" autocomplete="off">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="nIdDocumento" value="0">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" id="SaveFile" class="btn btn-primary">Agregar</button>
                </div>
            </div>
        </div>
    </div>

        <div class="modal fade" id="AddTipoDoc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="titleTipoDoc">Nuevo Tipo Documento</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group mb-1">
                                <label for="message-text" class="col-form-label">Tipo Documento:</label>
                                <input type="text" id="DescTipoDoc" name="ctitulo" value="" class="form-control round" autocomplete="off">
                                <input type="hidden" id="IdTipoDoc" value="0">
                            </div>
                            <div class="form-group mb-1">
                                 <button type="button" id="SaveTipoDoc" class="btn btn-primary">Agregar</button>
                                 <button type="button" id="Canceltd" class="btn btn-secondary" style="display: none">Cancelar</button>
                            </div>
                            
                        </div>
                        <div class="col-md-6">
                            <table id="tblTipoDoc" class="table tr-nopm" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th>Tipo</th>
                                                <th>&nbsp;</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalViewDoc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document" id="modview">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="titleDoc">Documento</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-3" id="dat">
                            <label><b>Descripcion</b></label><br/>
                            <span id="DescDoc"></span>
                        </div>
                        <div class="col-md-9" id="embed">
                          <div class="embed-responsive embed-responsive-21by9" id="DocView" style="height: 65vh;">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
     <script src="../Scripts/sweetalert2.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap4.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

    <script>

        $(document).on('click', '#btntest', function (event) {
            event.preventDefault();

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();

            $.ajax({
                type: 'POST',
                url: "../SerAdmi.asmx/VerifiImage",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    alert(JSON.stringify(data));
                }
            });

        });
        function ClearDoc() {
            $('#nIdDocumento').val('0');

            $('input:checkbox[name=bdownload]:checked').val('1')

            $("#<%=ddlTipoDoc.ClientID%>").val('0');
            $('#ctitulo').val('');
            $('#cDescripcion').val('');
            $("#<%=ddlCliente.ClientID%>").val('0');
            $('#nNumero').val('');
            $('#nSerie').val('');
            $('#cReferencia').val('');

            $('#fileb64').val('');
            $('#fileext').val('');
            $(".custom-file-label").text('Seleccione Imagen');
            $("#namefile").val('');

            $("#titleDocumento").text('Agregar Nuevo Documento');
            $("#SaveFile").text('Agregar');
        };


        $(document).on('click', '.ViewDoc', function (event) {
            event.preventDefault();

            $('#DocView').html('');

            $('#titleDoc').text($(this).attr('namefile'));
            $('#DescDoc').text($(this).attr('desc'));

            if ($(this).attr('urlfile') != null) {
                namef = $(this).attr('urlfile');
                var fileext = namef.split('.').pop();
            } else {
                var fileext = 'none';
            }

            exist = fileExists($(this).attr('urlfile'));
       
            if (exist == true && ['pdf', 'jpeg', 'jpg', 'png', 'svg', 'txt'].contains(fileext)) {
                $('#modview').attr('class', 'modal-dialog modal-lg');
                $('#data').attr('class', 'col-md-3');
                $('#embed').show();


                var embed = '<embed src="' + $(this).attr('urlfile') + '#toolbar=0&navpanes=0&scrollbar=0" />';
                $('#DocView').html(embed);
                
                $("#ModalViewDoc").modal('show');
            } else {
                toastr.error('Archivo No existe', 'ERROR AL ABRIR');

                $('#modview').attr('class', 'modal-dialog modal-xs');
                $('#data').attr('class', 'col-md-12');
                $('#embed').hide();

                $("#ModalViewDoc").modal('show');
            }



        });

        function fileExists(url) {
            if (url) {
                var req = new XMLHttpRequest();
                req.open('GET', url, false);
                req.send();
                return req.status == 200;
            } else {
                return false;
            }
        }

        $(document).on('click', '#SaveFile', function (event) {
            event.preventDefault();
           
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdDocumento = $('#nIdDocumento').val();

            if ($('input:checkbox[name=bdownload]:checked').val() == null) {
                obj.vbDownload = false;
            } else {
                obj.vbDownload = true;
            }

            if ($('input:checkbox[name=bpublico]:checked').val() == null) {
                obj.vbPublico = false;
            } else {
                obj.vbPublico = true;
            }
            
            obj.vnIdTipoDoc = $("#<%=ddlTipoDoc.ClientID%>").val();
            obj.vcTitulo = $('#ctitulo').val();
            obj.vcDescripcion = $('#cDescripcion').val();
            obj.vnIdClieProv = $("#<%=ddlCliente.ClientID%>").val(); 
            obj.vnNumero = $('#nNumero').val();
            obj.vnSerie = $('#nSerie').val();
            obj.vcReferencia = $('#cReferencia').val();

            obj.vFiles = $('#fileb64').val();
            obj.vExt = $('#fileext').val();

            obj.vFileName = $("#namefile").val();

            if (obj.vcIdEmpresa != "" && obj.vcTitulo != "" && obj.vcDescripcion != "" && obj.vnIdTipoDoc != "") {
                        $.ajax({
                            type: 'POST',
                            url: "../SerAdmi.asmx/RegiDocumento",
                            data: JSON.stringify({ obj: obj }),
                            dataType: 'json',
                            contentType: 'application/json; charset=utf-8',
                            success: function (data) {
                                var lst = JSON.parse(data.d);
                           
                                if (lst != '') {
                                    switch (lst[0].regi) {
                                        case -3:
                                            toastr.success('Archivo No Guardado', 'ERROR');
                                            break;
                                        case -2:
                                            toastr.error('Error al Guardar', 'Verificar');
                                            break;
                                        case -1:
                                            toastr.success('Documento Actualizado', 'ACTUALIZADO');
                                            $("#AddItem").modal('hide');
                                            $('#frmMain')[0].reset();
                                            var table = $('#tblFiles').DataTable();
                                            table.destroy();
                                            LoadData();
                                            ClearDoc();
                                            break;
                                        case 0:
                                            toastr.success('Documento Agregada', 'AGREGADO');
                                            $("#AddItem").modal('hide');
                                            $('#frmMain')[0].reset();
                                            var table = $('#tblFiles').DataTable();
                                            table.destroy();
                                            LoadData();
                                            ClearDoc();
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


        $(document).on('click', '#SaveTipoDoc', function (event) {
            event.preventDefault();

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdTipoDoc = $('#IdTipoDoc').val();
            obj.vcDescTipoDoc = $('#DescTipoDoc').val();

            if (obj.vcIdEmpresa != "" && obj.vnIdTipoDoc != "" && obj.vcDescTipoDoc != "") {
                 $.ajax({
                     type: 'POST',
                     url: "../SerAdmi.asmx/RegiTipoDoc",
                     data: JSON.stringify({ obj: obj }),
                     dataType: 'json',
                     contentType: 'application/json; charset=utf-8',
                     success: function (data) {
                         var lst = JSON.parse(data.d);
                         if (lst != '') {
                                     toastr.success('Documento Agregada', 'CORRECTO');
                                 

                                     $("#IdTipoDoc").val('0');
                                     $("#DescTipoDoc").val('');

                                     $('#frmMain')[0].reset();


                                     var table = $('#tblTipoDoc').DataTable();
                                     table.destroy();
                                     LoadTipoDoc();

                                     $("#titleTipoDoc").text('Nuevo Tipo Documento');
                                     $("#SaveTipoDoc").text('Agregar');
                                     $("#Canceltd").hide();
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

        $(document).on('click', '.edittd', function (event) {
            event.preventDefault();

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdTipoDoc = $(this).attr('idtd');
            obj.vcDescTipoDoc = '';
            
            if (obj.vcIdEmpresa != "" && obj.vnIdTipoDoc != "") {
                $.ajax({
                    type: 'POST',
                    url: "../SerAdmi.asmx/ListTipoDoc",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst != '') {
                            for (i = 0; i < lst.length; ++i) {
                                $("#IdTipoDoc").val(lst[i].nIdTipoDoc);
                                $("#DescTipoDoc").val(lst[i].cDescTipoDoc); 

                                $("#titleTipoDoc").text('Editar ' + lst[i].cDescTipoDoc);
                                $("#SaveTipoDoc").text('Actualizar');
                                $("#Canceltd").show();
                            }
                        } else {
                            toastr.error('', 'ERROR');
                        }

                    },
                    error: function (error) {
                        toastr.error(JSON.stringify(error), '');
                    }
                });
            } else {

            }

        });

        $(document).on('click', '.EditDoc', function (event) {
            event.preventDefault();

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdDocumento = $(this).attr('iddoc');
            obj.vnidTipoDoc = 0;

            if (obj.vcIdEmpresa != "" && obj.vnIdDocumento != "") {
                $.ajax({
                    type: 'POST',
                    url: "../SerAdmi.asmx/ListDocumento",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        if (lst != '') {
                            for (i = 0; i < lst.length; ++i) {

                                $('#nIdDocumento').val(lst[i].nIdDocumento);

                                $('input:checkbox[name=bdownload]:checked').val(lst[i].bDownload)

                                $("#<%=ddlTipoDoc.ClientID%>").val(lst[i].nIdTipoDoc);
                                $('#ctitulo').val(lst[i].cTitulo);
                                $('#cDescripcion').val(lst[i].cDescripcion);
                                $("#<%=ddlCliente.ClientID%>").val(lst[i].nIdClieProv);
                                $('#nNumero').val(lst[i].nNumero);
                                $('#nSerie').val(lst[i].nSerie );
                                $('#cReferencia').val(lst[i].cReferencia);

                                $('#fileb64').val('');
                                $('#fileext').val('');
                                $(".custom-file-label").text(lst[i].cFilename);
                                $("#namefile").val(lst[i].cFilename);

                                $("#titleDocumento").text('Editar ' + lst[i].cTitulo);
                                $("#SaveFile").text('Actualizar');
                                $("#AddItem").modal('show');
                            }
                        } else {
                            toastr.error('', 'ERROR');
                        }

                    },
                    error: function (error) {
                        toastr.error(JSON.stringify(error), '');
                    }
                });
            } else {

            }

        });

        $(document).on('click', '.DelDoc', function (event) {
            event.preventDefault();
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdDocumento = $(this).attr('iddoc');
            obj.vnidTipoDoc = $(this).attr('tipodoc');
            obj.vFileName = $(this).attr('filename');
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
                        url: "../SerAdmi.asmx/DeleteDocumento",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            if (lst[0].regi == 1) {
                                toastr.success('', 'ELIMINADO')
                                var table = $('#tblFiles').DataTable();
                                table.destroy();
                                LoadData();
                            } else {
                                toastr.warning('', 'ERROR AL ELIMINAR')
                            }
                        }
                    });
                }
            });

        });

        $(document).on('click', '#Canceltd', function (event) {
            event.preventDefault();
            $("#IdTipoDoc").val(0);
            $("#DescTipoDoc").val('');

            $("#titleTipoDoc").text('Nuevo Tipo Documento');
            $("#SaveTipoDoc").text('Agregar');
            $("#Canceltd").hide();
        });
        

        Array.prototype.contains = function (obj) {
            return this.indexOf(obj) > -1;
        };

        var pathArray = window.location.pathname.split('/');
        var origin = window.location.origin;

        var url = origin + '/' + pathArray[1];

        function LoadData() {

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdDocumento = 0;
            obj.vnidTipoDoc = 0;
            if (obj.vcIdEmpresa != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerAdmi.asmx/ListDocumento",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        var vvIng = "";


                        for (i = 0; i < lst.length; ++i) {

                            if (lst[i].cFilename != null) {
                                file = url + '/Mod_Agro/Files/' + lst[i].cFilename;
                                var fileext = lst[i].cFilename.split('.').pop();

                                namefile = lst[i].cTitulo + '_' + lst[i].nNumero + '_' + lst[i].nSerie + '_' + lst[i].cReferencia+'.'+fileext;
                            } else {
                                file = '';
                                var fileext = 'none';
                            }
                            

                            if (lst[i].dFechaCrea != null) {
                                vvIng += "<tr><td>" + lst[i].cTitulo + "</td><td>" + lst[i].nNumero + "</td><td>" + lst[i].nSerie + "</td><td>" + lst[i].cReferencia + "</td>";
                                vvIng += "<td>" + lst[i].cDescClieProv + "</td><td>" + lst[i].cDescTipoDoc + "</td><td>" + lst[i].dFechaCrea + "</td><td>" + fileext + "</td>";
                                var obj2 = new Object();
                                obj2.vcFilename = lst[i].cFilename;

                                $.ajax({
                                    async: false,
                                    type: 'POST',
                                    url: "../SerAdmi.asmx/VerifiPathImage",
                                    data: JSON.stringify({ obj: obj2 }),
                                    dataType: 'json',
                                    contentType: 'application/json; charset=utf-8',
                                    success: function (data2) {
                                        lst2 = JSON.parse(data2.d);
                                        if (lst2 == '1') {
                                            vvIng += "<td><button class='ViewDoc btn btn-link blue m-0 p-0' namefile='" + lst[i].cTitulo + "' urlfile='" + file + "' desc='" + lst[i].cDescripcion + "'><i class='fas fa-eye'></i></button></td>"
                                        } else {
                                            vvIng += "<td></td>"
                                        }

                                        if (lst[i].bDownload == 1 && lst2 == '1') {
                                            vvIng += "<td><a href='" + file + "' download='" + namefile + "' class='show-data btn btn-link blue m-0 p-0'><i class='fas fa-download'></i></a></td>"
                                        } else { vvIng += '<td></td>' }
                                    }
                                });

                                
                                vvIng += "<td><button class='EditDoc btn btn-link yellow m-0 p-0' iddoc='" + lst[i].nIdDocumento + "'><i class='fas fa-edit'></i></button>&nbsp;"
                                vvIng += "&nbsp;<button class='DelDoc btn btn-link red m-0 p-0' iddoc='" + lst[i].nIdDocumento + "' tipodoc='" + lst[i].nIdTipoDoc + "' filename='" + lst[i].cFilename + "'><i class='fas fa-trash'></i></button></td>"
                                vvIng += "</tr>"
                            } else {
                                
                            }

                        }
                        $("#tblFiles tbody").html(vvIng);


                        $('#tblFiles').DataTable({
                            "paging": false,
                            "ordering": false,
                            "info": false,
                            "searching": true
                        });
                        // CrearTablas(lst);
                    }
                });
            }
        }
        LoadData();


        function LoadTipoDoc() {

            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnidTipoDoc = 0;
            obj.vcDescTipoDoc = '';
            if (obj.vcIdEmpresa != '') {
                $.ajax({
                    type: 'POST',
                    url: "../SerAdmi.asmx/ListTipoDoc",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                        var vvIng = "";
                        $("#<%=ddlTipoDoc.ClientID%>").html('');
                        var option = "";
                        option += '<option value="0">Seleccionar Tipo Doc</option>';

                        for (i = 0; i < lst.length; ++i) {
                            option += '<option value="' + lst[i].nIdTipoDoc + '">' + lst[i].cDescTipoDoc  + '</option>';
                            vvIng += "<tr><td>" + lst[i].cDescTipoDoc + "</td>";
                            vvIng += "<td><button class='edittd btn btn-link yellow m-0 p-0' idtd='" + lst[i].nIdTipoDoc + "'><i class='fas fa-edit'></i></button></td>"
                                //vvIng += "<button class='deletetd btn btn-link red m-0 p-0' idtd='" + lst[i].nIdTipoDoc + "'><i class='fas fa-trash'></i></button></td>"
                                vvIng += "</tr>"
                        }
                        $("#tblTipoDoc tbody").html(vvIng);
                        $("#<%=ddlTipoDoc.ClientID%>").append(option);

                        $('#tblTipoDoc').DataTable({
                            "paging": true,
                            "ordering": false,
                            "info": false,
                            "searching": false
                        });
                        // CrearTablas(lst);
                    }
                });
            }
        }
        LoadTipoDoc();


        $(document).on('click', '.tera', function (event) {
            event.preventDefault();

            var fileInput = document.getElementById("filexx");

            // files is a FileList object (similar to NodeList)
            var filesx = fileInput.files;
            var filex;
            var output = [];
            // loop through files
            for (var i = 0; i < filesx.length; i++) {

                // get item
                file = filesx.item(i);
                //or
                filex = filesx[i];

                var reader = new FileReader();
                reader.readAsDataURL(filex);
                reader.onload = function () {
                    output.push([reader.result.split(',')[1]+','+filex.name.split('.').pop()]);

                   // alert(filex.name);
                }
            }


            alert(output);
        });

        $(".custom-file-input").on("change", function () {
            var fileName = $(this).val().split("\\").pop();
            fileNamecort = fileName.substr(0, 15) + '_.' + fileName.split('.').pop();
            $(this).siblings(".custom-file-label").addClass("selected").html(fileNamecort);

            var file = document.querySelector('input[type=file]').files[0];
            if (['pdf', 'jpeg', 'jpg', 'png', 'svg', 'txt', 'pptx', 'ppt', 'docx', 'doc', 'xls', 'xlsx'].contains(fileName.split('.').pop())) {
                var reader = new FileReader();
                reader.readAsDataURL(file);
                reader.onload = function () {
                    if (reader.result.split(',')[1] != undefined) {
                        $('#fileb64').val(reader.result.split(',')[1]);
                        $('#fileext').val(fileName.split('.').pop());
                    } else {
                        toastr.warning('Verifique el archivo y/o seleccione otro', 'ERROR CON ARCHIVO');
                        $(".custom-file-label").text('Seleccione Documento');
                    }
                }
            } else {
                toastr.error('La extension no esta permitido por favor seleccione otro archivo', 'Archivo No permitido');
                $(".custom-file-label").text('Seleccione Documento');
            }

        });
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
