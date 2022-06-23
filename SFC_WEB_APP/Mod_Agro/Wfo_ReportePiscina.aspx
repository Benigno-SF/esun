<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ReportePiscina.aspx.cs" Inherits="SFC_WEB_APP.Mod_Agro.Wfo_ReportePiscina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
    <div class="row" id="contenido_piscinas"></div>

    <script>
        var idx = [];
        var plantillas = "";

        <% foreach (var item in piscinaBEs) {%>
            idx.push(<%= item.nIdPiscina %>);
        <% } %>

        plantillas = "";
        for (var i = 0; i < idx.length; i++) {
            plantillas += '<div id="blq' + i.toString() + '" class="col-md-3">';
            plantillas += '<div class="card" style="width: 18rem;">';
            plantillas += '<div class="card-body">';
            plantillas += '<a href="#" class="card-link btn btn-primary btn-sm" style="margin-bottom:10px"><i class="far fa-eye"></i></a><h5 class="card-title" id="blq_titulo' + i.toString() + '"></h5>';
            plantillas += '<h6 class="card-subtitle mb-2 text-muted">Capacidad máxima: <span id="blq_capacidad' + i.toString() + '"></span></h6>';
            plantillas += '<p>';
            plantillas += '<b>Última lectura:</b>';
            plantillas += '<br/><span id="blq_fh' + i.toString() + '"></span><br/>';
            plantillas += '<b>Nivel de agua:</b>';
            plantillas += '<br/>';
            plantillas += '<span id="blq_nivel' + i.toString() + '"></span>';
            plantillas += '<span style="font-weight: bold" id="blq_nivelestado' + i.toString() + '"></span><br/><%--(bajo, normal, precaución, atención, advertencia, peligro)--%>';
            plantillas += '<b>Caudal</b>';
            plantillas += '<br/>Entrada: <span id="blq_qentrada' + i.toString() + '"></span><br/>Salida: <span id="blq_qsalida' + i.toString() + '"><br/>';
            plantillas += '</p>';
            plantillas += '</div>';
            plantillas += '</div>';
            plantillas += '</div>';
        }

        $("#contenido_piscinas").append(plantillas);

        function PiscinaInfo(idpiscina) {
            $.ajax({
                type: "POST",
                url: "../SerAgro.asmx/PiscinasFuncionando",
                data: JSON.stringify({ objs: idpiscina }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (datos) {
                    var o = JSON.parse(datos['d']);
                    for (var i = 0; i < o.length; i++) {
                        $("#blq_titulo" + i.toString()).html(o[i].cUbicacion);
                        $("#blq_capacidad" + i.toString()).html(o[i].nCapacidad);
                        $("#blq_fh" + i.toString()).html(o[i].dFhregistro);
                        $("#blq_nivel" + i.toString()).html(o[i].nNivelxCQ);
                        //Calcular el estado en funcion a los mínimos y máximos
                        var nivel = o[i].nNivelxCQ;
                        var alerta = o[i].nNivaltasup;
                        var alarma = o[i].nNivalmasup;
                        var estado = "";
                        if (nivel > alerta && nivel <= alarma) {
                            estado = '<span class="badge badge-warning" style="font-weight: bold; margin-left:10px">ALERTA</span>';
                        } else if (nivel >= alerta && nivel >= alarma) {
                            estado = '<span class="badge badge-danger" style="font-weight: bold; margin-left:10px">ALARMA</span>';
                        } else {
                            estado = '<span class="badge badge-success" style="font-weight: bold; margin-left:10px">NORMAL</span>';
                        }
                        $("#blq_nivelestado" + i.toString()).html(estado);
                        $("#blq_qentrada" + i.toString()).html(o[i].nCaudalEnt);
                        $("#blq_qsalida" + i.toString()).html(o[i].nCaudalSal);
                    }
                },
                error: function () {
                    // toastr.error("Existe un error de conectividad.", "Error");
                }
            });
        }

        $(document).ready(function () {
            setInterval(function () {
                <%-- Si el Id de la presentación cambia, entonces cargar la nueva presentacion --%>
                PiscinaInfo(idx);
            }, 3000);
        });

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
