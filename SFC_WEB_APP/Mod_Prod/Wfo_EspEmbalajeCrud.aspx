<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_EspEmbalajeCrud.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Wfo_EspEmbalajeCrud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #form-container {
            margin: 10px 10px 30px;
        }

        #button {
            float: right;
            margin-top: 20px;
        }

        .long-title h3 {
            font-family: 'Segoe UI Light', 'Helvetica Neue Light', 'Segoe UI', 'Helvetica Neue', 'Trebuchet MS', Verdana;
            font-weight: 200;
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
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
    <div class="row">
        <div class="col-md-12"><h5>Especificación de embalaje</h5></div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label>Productor:</label>
                <input type="hidden" class="form-control" id="cab_id" value="<%= especificacion.Id %>"/>
                <input type="text" class="form-control" id="productor" value="<%= especificacion.Productor %>"/>
            </div>
    
            <div class="form-group">
                <label>Empaque:</label>
                <input type="text" class="form-control" id="empaque" value="<%= especificacion.Empaque %>"/>
            </div>
    
            <div class="form-group">
                <label>Categoria:</label>
                <input type="text" class="form-control" id="categoria" value="<%= especificacion.Categoria %>"/>
            </div>

            <div class="form-group">
                <label>Monitores:</label>
                <input type="text" class="form-control" id="monitor" value="<%= especificacion.Monitor %>"/>
                <small id="emailHelp" class="form-text text-muted">Ingrese los canales de los monitores en los que se mostrará las presentaciones (Ejm: 1;2;3).</small>
            </div>
        </div>  
    </div>
    
    <div class="row">
        <div class="col-md-12"><b>Imágenes de presentación:</b>
            <p>El orden de las filas determina el orden de presentación de las imágenes.</p>
        </div>
    </div>

    <div class="row">
        <div class="slideshow-container col-md-12">
            <table class="table table-bordered" id="table-contenido" style="margin: 0px; padding: 0px">
                <thead>
                    <tr>
                       <th style="padding: 0.75rem; width: 20px;"></th>
                       <th style="padding: 0.75rem">Titulo</th>
                       <th style="padding: 0.75rem">Descripción</th>
                       <th style="width:100px; padding: 0.75rem">Imagen</th>
                   </tr>
                </thead>
                <tbody>
                <% foreach(var o in especificacion.Imagenes) { %>
                <tr class="fila_form">
                    <td style=" padding: 0.75rem; margin: 0px;">
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-danger btnFilaQuitar"><i class="fas fa-trash-alt"></i></button>
                            <button type="button" onclick="FnFilaCambiarPosicion(this)" class="btn btn-primary btnFilaAbajo"><i class="fas fa-arrow-alt-circle-down"></i></button>
                            <button type="button" onclick="FnFilaCambiarPosicion(this)" class="btn btn-primary btnFilaArriba"><i class="fas fa-arrow-alt-circle-up"></i></button>
                        </div>
                    </td>
                    <td style="padding: 0.75rem" class="fila_campo">
                        <input class="form-control campo cm_id" type="hidden" value="<%=o.Id%>" />
                        <input class="form-control campo cm_titulo" type="text" value="<%=o.Titulo%>" />
                    </td>
                    <td style="padding: 0.75rem" class="fila_campo">
                        <input class="form-control campo cm_descripcion" type="text" value="<%=o.Descripcion%>" />
                    </td>
                    <td style="padding: 0.75rem;" class="fila_campo">
                        <div class="btn-group">
                            <input class="cm_imagenexistente" type="hidden" value="<%=o.Imagen%>" />
                            <button class="btn btn-primary" style="border-radius: 0.25rem 0rem 0rem 0.25rem" onclick="seleccionarImagen(this)" type="button"><i class="fa fa-search-plus" aria-hidden="true"></i></button>
                            <button type="button" onclick="Mostrar('<%=o.Imagen%>')" class="btn btn-primary" style="margin-bottom: 0px; border-radius: 0rem 0.25rem 0.25rem 0rem"><i class="fa fa-photo" aria-hidden="true"></i></button>
                            <input class="campo cm_imagens" style="visibility: hidden; position:absolute;" type="file" accept="image/png, image/jpeg" onchange="ImagenCambio(this)" />
                            <input class="form-control campo cm_imagenbase64" type="hidden" />
                        </div>
                    </td>
                </tr>
                <% } %>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5" style="text-align: center">
                            <div id="btnFilaInsertar" style="width:170px"><i class="fas fa-plus-circle"></i> Insertar una nueva fila</div>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>

    <div class="row" style="margin-top: 15px">
        <div class="col-md-12"><button class="btn btn-primary" type="button" id="btnGuardar"><i class="far fa-save"></i>&nbsp;Guardar</button></div>
    </div>

    <div class="modal fade" id="previsualizar" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Previsualizar imágen</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <img src="#" id="vimagen" style="max-width:100%;" class="img-rounded" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
                </div>
            </div>
        </div>
    </div>
    
    <script>

        function seleccionarImagen(o) {
            $(o).parent().children('.cm_imagens').trigger('click');
        }

        function Mostrar(rimagen) {
            $("#vimagen").attr("src", "/Img/EspEmbalaje/" + rimagen);
            $('#previsualizar').modal('show'); 
        }

        function ImagenCambio(o) {
            //codifica a Base64
            var img = o.files[0];
            var reader = new FileReader();
            reader.onloadend = function () {
                $(o).parent().parent().find('.cm_imagenbase64').val(reader.result)
            };
            reader.readAsDataURL(img);
        }

        $(".btnFilaQuitar").click(
            function () {
                var ri = $(this).parent().parent().parent().index();
                var ctx_id = $("#table-contenido tbody tr:nth-child(" + (ri + 1).toString() + ").fila_form td.fila_campo input.cm_id").val();
                $("#table-contenido tbody tr:nth-child(" + (ri + 1).toString() + ").fila_form td.fila_campo input.cm_id").remove();

                $.ajax({
                    type: "POST",
                    url: "../SerProd.asmx/Especificacion_Eliminar",
                    data: JSON.stringify({ objs: ctx_id }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (datos) {
                        var o = JSON.parse(datos['d']);
                        if (JSON.stringify(o) == "1") {
                            toastr.success("Los cambios se guardaron correctamente.", "Correcto");
                        } else {
                            toastr.error("Hubo un problema en la conectividad debes verificar otra vez.", "Error");
                        }
                    },
                    error: function () {
                        toastr.error("Existe un error de conectividad.", "Error");
                    }
                });
                $(this).parent().parent().parent().remove();
            }
        );

        $("#btnFilaInsertar").click(function () { FnFilaAgregar(); });
        $("#btnImagenMostrar").click(function () { FnImagenMostrar(); });
        $("#btnImagenCargar").click(function () { FnImagenCargar(); });
        $("#btnGuardar").click(function () { FnGuardar();  });

        function FnGuardar() {
            var obj_cabecera = new Object();
            obj_cabecera.cab_id = "";
            obj_cabecera.productor = "";
            obj_cabecera.categoria = "";
            obj_cabecera.empaque = "";
            obj_cabecera.monitor = "";

            obj_cabecera.cab_id = $("#cab_id").val();
            obj_cabecera.productor = $("#productor").val();
            obj_cabecera.categoria = $("#categoria").val();
            obj_cabecera.empaque = $("#empaque").val();
            obj_cabecera.monitor = $("#monitor").val();
            obj_cabecera.detalle = [];

            var obj_fila;
            $('#table-contenido tbody tr.fila_form td.fila_campo input').each(function () {
                if ($(this).attr('class').includes("cm_id")) {
                    obj_fila = new Object();
                    obj_fila.det_id = "";
                    obj_fila.titulo = "";
                    obj_fila.descripcion = "";
                    obj_fila.imagen = "";
                    obj_fila.imagenbase64 = "";
                    obj_fila.det_id = $(this).val();
                } else if ($(this).attr('class').includes("cm_titulo")) {
                    obj_fila.titulo = $(this).val();
                } else if ($(this).attr('class').includes("cm_descripcion")) {
                    obj_fila.descripcion = $(this).val();
                } else if ($(this).attr('class').includes("cm_monitor")) {
                    obj_fila.monitor = $(this).val();
                } else if ($(this).attr('class').includes("cm_imagenexistente")) {
                    obj_fila.imagen = $(this).val();
                } else if ($(this).attr('class').includes("cm_imagenbase64")) {
                    obj_fila.imagenbase64 = $(this).val();
                    obj_cabecera.detalle.push(obj_fila);
                }
            });

            

            $.ajax({
                type: "POST",
                url: "../SerProd.asmx/Especificacion_Guardar",
                data: JSON.stringify({ objs: obj_cabecera }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (datos) {
                    var o = JSON.parse(datos['d']);
                    if (JSON.stringify(o) == "1") {
                        toastr.success("Los cambios se guardaron correctamente.", "Correcto");
                    } else {
                        toastr.error("Hubo un problema en la conectividad debes verificar otra vez.", "Error");
                    }
                },
                error: function () {
                    toastr.error("Existe un error de conectividad.", "Error");
                }
            });
        }

        function FnFilaAgregar() {
            $("#table-contenido").append(FnPlantilla());
        }

        function FnFilaCambiarPosicion(o) {
            var row = $(o).parents("tr");
            if ($(o).is(".btnFilaArriba")) {
                row.insertBefore(row.prev());
            } else {
                row.insertAfter(row.next());
            }
        }

        function FnFilaBajar(o) {
            var row = $(o).parents("tr");
            if (o.is(".btnFilaArriba")) {
                row.insertBefore(row.prev());
            } else {
                row.insertAfter(row.next());
            }
        }

        function FnImagenCargar() {
            console.log("Fila cargar");
        }

        function FnImagenMostrar() {
            console.log("Fila mostrar");
        }

        function FnPlantilla() {
            var cadena = "";
            cadena += '<tr class="fila_form">';
            cadena += '<td style=" padding: 0.75rem; margin: 0px;"><div class="btn-group" role="group" aria-label="Basic example">';
            cadena += '<button type="button" class="btn btn-danger btnFilaQuitar"><i class="fas fa-trash-alt"></i></button>';
            cadena += '<button onclick="FnFilaCambiarPosicion(this)" type="button" class="btn btn-primary btnFilaAbajo"><i class="fas fa-arrow-alt-circle-down"></i></button>';
            cadena += '<button onclick="FnFilaCambiarPosicion(this)" type="button" class="btn btn-primary btnFilaArriba"><i class="fas fa-arrow-alt-circle-up"></i></button>';
            cadena += '</div></td>';
            cadena += '<td style="padding: 0.75rem" class="fila_campo">';
            cadena += '<input class="form-control campo cm_id" type="hidden" value="" />';
            cadena += '<input class="form-control campo cm_titulo" type="text" value="" />';
            cadena += '</td>';
            cadena += '';
            cadena += '<td style="padding: 0.75rem" class="fila_campo">';
            cadena += '<input class="form-control campo cm_descripcion" type="text" value="" />';
            cadena += '</td>';
            cadena += '<td style="padding: 0.75rem;" class="fila_campo">';
            cadena += '<div class="btn-group">';
            cadena += '<input class="cm_imagenexistente" type="hidden" value="" />';
            cadena += '<button class="btn btn-primary" style="border-radius: 0.25rem 0rem 0rem 0.25rem" onclick="seleccionarImagen(this)" type="button"><i class="fa fa-search-plus" aria-hidden="true"></i></button>';
            cadena += '<button type="button" class="btn btn-default" style="margin-bottom: 0px; border:1px solid #999; border-radius: 0rem 0.25rem 0.25rem 0rem"><i class="fa fa-photo" aria-hidden="true"></i></button>';
            cadena += '<input class="campo cm_imagens" style="visibility: hidden; position:absolute;" type="file" accept="image/png, image/jpeg" onchange="ImagenCambio(this)" />';
            cadena += '<input class="form-control campo cm_imagenbase64" type="hidden" /></div>';
            cadena += '</div>';
            cadena += '</td>';
            cadena += '</tr>';
            return cadena;
        }
    </script>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
