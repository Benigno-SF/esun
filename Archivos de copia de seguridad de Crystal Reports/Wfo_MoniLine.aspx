<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_MoniLine.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_MoniLine" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Lineas</title>
    <%: Styles.Render("~/Content/css") %>
    <%: Scripts.Render("~/jquery") %>
    <style>
        body {
            color: lawngreen;
            background-color: #212529 !important;
        }

        .divt {
            padding: 0px;
            background-color: coral;
            color: white;
            padding: 3px;
        }

        .divc {
            border-left: solid;
            border-right: solid;
            border-color: coral;
            height: 80vh;
            padding: 0px;
        }

        .right {
            float: right;
        }
    </style>
</head>
<body>
    <form id="frm" runat="server">
        <table style="width: 100%; text-align: center; margin-bottom: 0px" class="table" border="1">
            <tr>
                <td style="width: 25%; padding: 0px; margin: 0px">
                    <img src="../Img/sf-logo.png" style="width: 160px; position: absolute; left: 0;" />
                </td>
                <td style="width: 50%; padding: 0px; margin: 0px">
                    <div id="dvTitle" runat="server" class="text-center" style="font-size: 3rem; color: white">
                    </div>
                </td>
                <td style="width: 25%; padding: 0px; margin: 0px">


                </td>
            </tr>
        </table>
        <div id="dvDetalle" ></div>
        <asp:HiddenField ID="hdfIdMonitor" Value="1" runat="server" />
    </form>
    <script>
        var vbTbl = false;
        var arPos = [];
        var vvCat = "C"
        function LoadData () {
            var obj = new Object();
           obj.vnIdMonitor = $('#<%=hdfIdMonitor.ClientID%>').val();
            $.ajax({
                type: 'POST',
                url: "SerApp.asmx/ListMonitorSubLinea",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    lst = JSON.parse(data.d);
                    if (!vbTbl)
                        Maketbl(lst);
                    if (vbTbl) {
                        for (i = 0; i < arPos.length; ++i) {
                            var vvDat = "";
                            lst.forEach(function (item, x) {
                                if (item.nPosicion == arPos[i].nPosicion && item.cDesCategoria.length > 0) {
                                    vvDat += "<h1 class='' style='line-height: 0.6;'>" + vvCat + "-" + item.cDesCategoria
                                        + "<b class='display-1' style='font-weight: bold; font-size: 7rem; line-height: 0.6;'> "
                                        + item.cDesCalibre + "</b></h1><br />";
                                }
                            });
                            $("#dv" + arPos[i].nPosicion).html(vvDat)
                        }

                    }
                }
            });
        }
        $(document).ready(function () {
            setInterval(LoadData, 10000);
        });
        function Maketbl(lst) {
            var tbl = "<table style='width: 100%; text-align: center; height: 89vh' class='divc'><tr>";
            lst.forEach(function (item, x) {
                var vbExists = false;
                for (i = 0; i < arPos.length; ++i) {
                    if (item.nPosicion == arPos[i].nPosicion) {
                        vbExists = true;
                    }
                }
                if (vbExists == false) {
                    var obPos = new Object();
                    obPos.nPosicion = item.nPosicion;
                    obPos.cDescSubLinea = item.cDescSubLinea;
                    arPos.push(obPos);
                    tbl += "<td class='divc' style='vertical-align: top; width: 25%'>"
                        + "<h1 class='divt' style='font-weight: bold; line-height: 1;'>" + item.cDescSubLinea + "</h1><br />"
                        + "<div id='dv" + item.nPosicion + "' item.nPosicion>"
                        + "</div ></td > ";
                }
            });
            tbl += "<tr></table>"
            $("#dvDetalle").html(tbl);
            vbTbl = true;
        }
    </script>
</body>
</html>
