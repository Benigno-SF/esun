<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="beta.aspx.cs" Inherits="SFC_WEB_APP.beta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <asp:Label ID="Label3" runat="server" Text="Lock"></asp:Label>
    <br />
    <asp:TextBox ID="txtLock" runat="server" Width="400px"></asp:TextBox>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Texto"></asp:Label>
    <br />
    <asp:TextBox ID="txtDecryp" runat="server" Width="400px"></asp:TextBox>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Cadena"></asp:Label>
    <br />
    <asp:TextBox ID="txtEncryp" runat="server" Width="400px"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="btnEncrip" runat="server" Width="100" Height="50" Text="Encriptar" OnClick="btnEncrip_Click" />
    <asp:Button ID="btnDecrip" runat="server" Width="100" Height="50" Text="Desencriptar" OnClick="btnDecrip_Click" />

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
    <script src="Scripts/bootstrap-datetimepicker.min.js"></script>
</asp:Content>
