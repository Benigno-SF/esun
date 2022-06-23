<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ReporteCostosDistribuidos.aspx.cs" Inherits="SFC_WEB_APP.Mod_Prod.Wfo_ReporteCostosDistribuidos" %>

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
        <iframe src="https://app.powerbi.com/view?r=eyJrIjoiMjZiYTM0YjEtYWFmZi00NzkyLThiZjMtOWM0NzdiZDE4ODU2IiwidCI6IjM1OTEzN2RmLTZjM2ItNDAyNS1iYThhLTczMjYwODhmNjExYiIsImMiOjR9&pageName=ReportSection9778174657eb24a06090"
            frameborder="0" allowfullscreen="true"></iframe>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
