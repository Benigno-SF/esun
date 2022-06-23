<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_RepoView.aspx.cs" Inherits="SFC_WEB_APP.Mod_Repo.Wfo_RepoView" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>::SFC - REPORT::</title>
</head>
<body>
    
    <form id="form1" runat="server">
        <div id="printReady" class="ReportViewerContainerStyle">
        <CR:CrystalReportViewer ID="CrtRepoView" runat="server" AutoDataBind="true" ToolPanelView="None"
            HasCrystalLogo="False" HasDrilldownTabs="False" HasDrillUpButton="False" HasToggleGroupTreeButton="false"
            HasToggleParameterPanelButton="false" HasSearchButton="False" HasExportButton="False" HasZoomFactorList="False"
             PrintMode="ActiveX"/>
    </div>
    </form>
</body>
</html>
