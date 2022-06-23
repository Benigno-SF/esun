<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ContrParam.aspx.cs" Inherits="SFC_WEB_APP.Mod_Cali.Wfo_ContrParam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <asp:UpdatePanel ID="UpdGv" runat="server" >
        <ContentTemplate>
            <div class="row">
                <div class="table-responsive">
                    <asp:GridView ID="GvList" runat="server" CssClass="table table-bordered table-condensed bgtbl"
                        EmptyDataText="No se encontraron datos" ShowHeaderWhenEmpty="True">
                        
                    </asp:GridView>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
