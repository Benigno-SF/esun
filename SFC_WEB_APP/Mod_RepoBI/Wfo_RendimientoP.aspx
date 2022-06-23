<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"  CodeBehind="Wfo_RendimientoP.aspx.cs" Inherits="SFC_WEB_APP.Mod_RepoBi.Wfo_RendimientoP" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .frame iframe {
            min-height:500px;
            width: 100% !important;
            height: 85vh !important;
        }
        .frame {
            min-height:500px;
            height: 85vh !important;
            width: 100% !important;
        }
        .content-body{
            height: 85vh !important;
            width: 100% !important;
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
    <div class="frame">
        <iframe title="Tablero Consolidado Planta V8 - Rendimiento Proceso" src="https://app.powerbi.com/view?r=eyJrIjoiZTMwZDI1NTctOWRjYi00YzYyLThjOWItODY2NWU0ZTIzY2UyIiwidCI6IjM1OTEzN2RmLTZjM2ItNDAyNS1iYThhLTczMjYwODhmNjExYiIsImMiOjR9&pageName=ReportSection4b9bdb8f65d3e081a60c" frameborder="0" allowfullscreen="true">
        </iframe>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>

