<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_vsProyectado.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Wfo_vsProyectado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .frame iframe {
            min-height:500px;
            width: 100% !important;
            height: 100% !important;
        }
        .frame {
            min-height:500px;
            height: 100% !important;
            width: 100% !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <div class="frame">
        <iframe
            src="https://app.powerbi.com/view?r=eyJrIjoiOWExODA4MmYtNzJhNC00YjUzLTkyM2ItNzk2Mjc3ZWJlNzJlIiwidCI6IjM1OTEzN2RmLTZjM2ItNDAyNS1iYThhLTczMjYwODhmNjExYiIsImMiOjR9"
            frameborder="0" allowfullscreen="true"></iframe>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
