<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_UnidNegocio-Repo.aspx.cs" Inherits="SFC_WEB_APP.Mod_Pres.Wfo_UnidNegocio_Repo" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%: Styles.Render("~/Content/JQWidgets/css") %>
    <link href="../Content/JQWidgets/jqx.energyblue.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div id="divPivotGrid" style="height: 500px; width: auto; background-color: white;"></div>
    <asp:HiddenField ID="hdfIdPres" runat="server" />
    <asp:HiddenField ID="hdfIdUnid" runat="server" />
    <asp:HiddenField ID="hdfIdForm" runat="server" />
    <asp:HiddenField ID="hdfIdNive" runat="server" /> 
    <script>
        var obPresup = function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdPresupuesto = $("#<%=hdfIdPres.ClientID%>").val();
            obj.vnIdUnidadNeg = $("#<%=hdfIdUnid.ClientID%>").val();
            obj.vnIdFormato = $("#<%=hdfIdForm.ClientID%>").val();
            var tmp = null;
            $.ajax({
                type: 'POST',
                url: "../SerPres.asmx/RepoPresUnid",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                async: false,
                success: function (data) {
                    tmp = JSON.parse(data.d);
                }
            });
            return tmp;
        }();


        $(document).ready(function () {
            var IdNive = fuGetNive();
            switch (IdNive) {
                case 4:
                    LoadPivotNive4()
                    break;
                default:
                // code block
            }
        });
        function fuGetData() {
            var lst = new Array();
            obPresup.forEach(function (result, index) {
                var ob = new Object();
                var dt = result.DetParam.split("_");
                ob.Fundo = ".  " + result.cFundo
                ob.Cultivo = ".  " + result.cDesCultivo
                ob.Lote = ".  " + result.cDescUnidadNeg
                ob.Formato = ".  " +dt[1] || "";
                ob.Agrup = ".  " +dt[2] || "";
                ob.Item = result.cDescParametro;
                ob.Periodo = result.Mask;
                ob.Importe = result.nImporte;
                lst.push(ob);
            });
            return lst;
        };
        function LoadPivotNive4() {
            var lst = fuGetData();
            var source =
            {
                localdata: lst,
                datatype: "json",
                datafields:
                    [  
                        { name: 'Formato', type: 'string' },
                        { name: 'Agrup', type: 'string' },
                        { name: 'Item', type: 'string' },
                        { name: 'Periodo', type: 'string' },
                        { name: 'Importe', type: 'number' }
                    ]
            };
            var dataAdapter = new $.jqx.dataAdapter(source);
            dataAdapter.dataBind();
            // create a pivot data source from the dataAdapter
            var pivotDataSource = new $.jqx.pivot(
                dataAdapter,
                {
                    pivotValuesOnRows: false,
                    rows: [{ dataField: 'Formato' }
                        , { dataField: 'Agrup' }
                        , { dataField: 'Item' }
                    ],
                    columns: [{ dataField: 'Periodo' }],
                    filters: [
                        {
                            
                        }
                    ],
                    values: [
                        { dataField: 'Importe', 'function': 'sum', text: 'U$S', formatSettings: {decimalPlaces: 2 } }
                    ]
                });
            $("#divPivotGrid").jqxPivotGrid({
                source: pivotDataSource,
                treeStyleRows: true,
                autoResize: false,
                multipleSelectionEnabled: true,
                theme: 'energyblue'
                
            });
            var pivotGridInstance = $('#divPivotGrid').jqxPivotGrid('getInstance');
            pivotGridInstance.getPivotRows().items[0].expand();
            pivotGridInstance.refresh();
        }
        function fuGetNive() {
            return $("#<%=hdfIdNive.ClientID%>").val() * 1;
        }


    </script>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
